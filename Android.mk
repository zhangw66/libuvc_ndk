LOCAL_PATH := $(call my-dir)
USER_LOCAL_PATH:=$(LOCAL_PATH)
LIBUSB_ROOT_ABS := /home/victor/workdir/libusb/libusb
include $(LIBUSB_ROOT_ABS)/android/jni/libusb.mk
#restore the LOCAL_PATH
LOCAL_PATH:=$(USER_LOCAL_PATH)
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += $(LIBUSB_ROOT_ABS) \
					include/ \
					build/include/
LOCAL_SHARED_LIBRARIES += libusb1.0
LOCAL_CPPFLAGS += -fexceptions
LOCAL_CPPFLAGS += -frtti
LOCAL_MODULE := grab_libuvc
LOCAL_SRC_FILES := src/ctrl.c \
  src/ctrl-gen.c \
  src/device.c \
  src/diag.c \
  src/frame.c \
  src/init.c \
  src/stream.c \
  src/misc.c	\
  src/example.c
include $(BUILD_EXECUTABLE)
