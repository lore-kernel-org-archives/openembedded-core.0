Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.3219.1597488203466930096
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 03:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TMf6RD25;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 3so9919624wmi.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3G1j1R4BSoJ6nI6PJeWTO0t/C0uPpcD+SxdatiV16s=;
        b=TMf6RD25218pv2ryX1swY+7mgw/7dGA+cYNNlZQF0SNdDHxCaEjP07BxXagJKnR52T
         l23x+e/Y222OjSixsKwSj0EO3LG5K3R8G2P6KQXIk+Hvn8iNZCcF3Hvadbi4o8DqvETu
         1ta8DZCxBkifOo6qzT4nPjk4XM0bUFUR5qzNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3G1j1R4BSoJ6nI6PJeWTO0t/C0uPpcD+SxdatiV16s=;
        b=Cg1NA/5ltoqIYb+YA0WuvkzwY0jsHFnSElJ6f5rjb51C226/a/FAiBa3EC9NXNI0Xv
         Xxs74RN5e0oG+Gj29v0Ri4M1SmFaPIDMdBVqvCuGcj7MhOIpxgxCWPJNE3oJjgLuKfJi
         l1kNBE955aJHoiBsJ2YiO/jCXa5I3rh2vIFT9yFIUJ86AC0aJn6IGHKx9rhdPZdqHptb
         cKJgIaF+06LVoZLfTxzOsn7cINf6wTBjhDJAkooKHs1cCQbKtHrix/7WqsEoHd53GXm9
         asLmOVwoNX20YcwauSapmCzbKk+TYF58DixDU183he76JNI4aWttqyny+uPi1ArodpJs
         K7ZA==
X-Gm-Message-State: AOAM530XsHLrIFZNFFMnwomsowdUfFKMGLF88tF3YSmchUUzNz5xHkSZ
	Xn5TVnXb6DlDrY74tojJrB6oWA2MpiLWaQ/Y
X-Google-Smtp-Source: ABdhPJw7YNz3XWjFBd+FGVjlpcZbLVuHWssOXp5hLDXOpTJnEEChR0o2q+G0iaG6wgBL0zMspkTOaQ==
X-Received: by 2002:a1c:4e0d:: with SMTP id g13mr6286372wmh.177.1597488199514;
        Sat, 15 Aug 2020 03:43:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id 31sm21566248wrj.94.2020.08.15.03.43.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 03:43:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Upgrade 5.0.0 -> 5.1.0
Date: Sat, 15 Aug 2020 11:43:18 +0100
Message-Id: <20200815104318.1031996-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Drop backported CVE fixes
* Drop cpu backtrace patch from 2015 for debugging an issue which we no longer see
  (patch throws rejects, files have moved)
* Update mips patch to account for file renames
* Update chardev patch to match upstream code changes
* Update webkitgtk patch, qemumips build works ok but qemux86 musl webkitgtk still
  fails. Need to figure out the correct fix and upstream it for this, current
  revert patch is not maintainable.

Release notes for 5.1.0 mention slight qemumips performance improvements
which would be valuable to us. My tests show no improvement in qemumips
testimage execution time for core-image-sato-sdk.

Fix a ptest issue for a file looking for /usr/bin/bash when we have
/bin/bash.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/recipes-devtools/qemu/qemu-native.inc    |   4 -
 ...u-native_5.0.0.bb => qemu-native_5.1.0.bb} |   0
 ...e_5.0.0.bb => qemu-system-native_5.1.0.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |  11 +-
 .../qemu/0001-Add-enable-disable-udev.patch   |  15 +-
 ...emu-Add-missing-wacom-HID-descriptor.patch |  17 +-
 ...mu-Do-not-include-file-if-not-exists.patch |  13 +-
 ...test-which-runs-all-unit-test-cases-.patch |  13 +-
 ...n-environment-space-to-boot-loader-q.patch |  10 +-
 .../qemu/0004-qemu-disable-Valgrind.patch     |  10 +-
 ...ld.bfd-fix-cflags-and-set-some-envir.patch |  13 +-
 ...-connect-socket-to-a-spawned-command.patch |  56 +++----
 .../0007-apic-fixup-fallthrough-to-PIC.patch  |  10 +-
 ...webkitgtk-hangs-on-32-bit-x86-target.patch |  10 +-
 .../qemu/qemu/0009-Fix-webkitgtk-builds.patch |  73 ++++-----
 ...dd-pkg-config-handling-for-libgcrypt.patch |  14 +-
 ...-messages-when-qemi_cpu_kick_thread-.patch |  74 ---------
 .../qemu/qemu/CVE-2020-10761.patch            | 151 ------------------
 .../qemu/qemu/CVE-2020-13361.patch            |  61 -------
 .../qemu/qemu/CVE-2020-13362.patch            |  55 -------
 .../qemu/qemu/CVE-2020-13659.patch            |  58 -------
 .../qemu/qemu/CVE-2020-13791.patch            |  53 ------
 .../qemu/qemu/CVE-2020-13800.patch            |  63 --------
 .../qemu/qemu/CVE-2020-15863.patch            |  63 --------
 .../qemu/qemu/find_datadir.patch              |  14 +-
 .../qemu/{qemu_5.0.0.bb => qemu_5.1.0.bb}     |   0
 27 files changed, 130 insertions(+), 733 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_5.0.0.bb => qemu-native_5.1.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_5.0.0.bb => qemu-system-native_5.1.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
 rename meta/recipes-devtools/qemu/{qemu_5.0.0.bb => qemu_5.1.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c5cc4bdcdf3..d5e0e9ebbb2 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.35%"
 GDBVERSION ?= "9.%"
 GLIBCVERSION ?= "2.32"
 LINUXLIBCVERSION ?= "5.4%"
-QEMUVERSION ?= "5.0%"
+QEMUVERSION ?= "5.1%"
 GOVERSION ?= "1.14%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
diff --git a/meta/recipes-devtools/qemu/qemu-native.inc b/meta/recipes-devtools/qemu/qemu-native.inc
index dcf140ea1b0..aa5c9b9a72f 100644
--- a/meta/recipes-devtools/qemu/qemu-native.inc
+++ b/meta/recipes-devtools/qemu/qemu-native.inc
@@ -2,10 +2,6 @@ inherit native
 
 require qemu.inc
 
-SRC_URI_append = " \
-            file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
-            "
-
 EXTRA_OEMAKE_append = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
 LDFLAGS_append = " -fuse-ld=bfd"
diff --git a/meta/recipes-devtools/qemu/qemu-native_5.0.0.bb b/meta/recipes-devtools/qemu/qemu-native_5.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_5.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_5.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_5.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5d38ff1fa43..5599382a92f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,19 +29,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0001-Add-enable-disable-udev.patch \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
-	   file://CVE-2020-13361.patch \
 	   file://find_datadir.patch \
-	   file://CVE-2020-10761.patch \
-	   file://CVE-2020-13362.patch \
-	   file://CVE-2020-13659.patch \
-	   file://CVE-2020-13800.patch \
-	   file://CVE-2020-13791.patch \
-	   file://CVE-2020-15863.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[md5sum] = "ede6005d7143fe994dd089d31dc2cf6c"
-SRC_URI[sha256sum] = "2f13a92a0fa5c8b69ff0796b59b86b080bbb92ebad5d301a7724dd06b5e78cb6"
+SRC_URI[sha256sum] = "c9174eb5933d9eb5e61f541cd6d1184cd3118dfe4c5c4955bc1bdc4d390fa4e5"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
@@ -65,6 +57,7 @@ do_install_ptest() {
 	       -e '$ {/endif/d}' ${D}${PTEST_PATH}/tests/Makefile.include
         sed -i -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
             ${D}/${PTEST_PATH}/tests/qemu-iotests/common.env 
+	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}/tests/data/acpi/disassemle-aml.sh
 }
 
 # QEMU_TARGETS is overridable variable
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
index 40d83fcfa38..1304ee3bfdc 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
@@ -12,13 +12,13 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  configure | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/configure b/configure
-index 36646e7b..48912a94 100755
---- a/configure
-+++ b/configure
-@@ -1601,6 +1601,10 @@ for opt do
+Index: qemu-5.1.0/configure
+===================================================================
+--- qemu-5.1.0.orig/configure
++++ qemu-5.1.0/configure
+@@ -1640,6 +1640,10 @@ for opt do
    ;;
-   --gdb=*) gdb_bin="$optarg"
+   --disable-libdaxctl) libdaxctl=no
    ;;
 +  --enable-libudev) libudev="yes"
 +  ;;
@@ -27,6 +27,3 @@ index 36646e7b..48912a94 100755
    *)
        echo "ERROR: unknown option $opt"
        echo "Try '$0 --help' for more information"
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
index ae89ae09ddd..46c9da08a57 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
@@ -20,11 +20,11 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
  1 file changed, 93 insertions(+), 1 deletion(-)
 
-diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
-index 8ed57b3b..1502928b 100644
---- a/hw/usb/dev-wacom.c
-+++ b/hw/usb/dev-wacom.c
-@@ -74,6 +74,89 @@ static const USBDescStrings desc_strings = {
+Index: qemu-5.1.0/hw/usb/dev-wacom.c
+===================================================================
+--- qemu-5.1.0.orig/hw/usb/dev-wacom.c
++++ qemu-5.1.0/hw/usb/dev-wacom.c
+@@ -74,6 +74,89 @@ static const USBDescStrings desc_strings
      [STR_SERIALNUMBER]     = "1",
  };
  
@@ -114,7 +114,7 @@ index 8ed57b3b..1502928b 100644
  static const USBDescIface desc_iface_wacom = {
      .bInterfaceNumber              = 0,
      .bNumEndpoints                 = 1,
-@@ -91,7 +174,7 @@ static const USBDescIface desc_iface_wacom = {
+@@ -91,7 +174,7 @@ static const USBDescIface desc_iface_wac
                  0x00,          /*  u8  country_code */
                  0x01,          /*  u8  num_descriptors */
                  0x22,          /*  u8  type: Report */
@@ -123,7 +123,7 @@ index 8ed57b3b..1502928b 100644
              },
          },
      },
-@@ -271,6 +354,15 @@ static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
+@@ -271,6 +354,15 @@ static void usb_wacom_handle_control(USB
      }
  
      switch (request) {
@@ -139,6 +139,3 @@ index 8ed57b3b..1502928b 100644
      case WACOM_SET_REPORT:
          if (s->mouse_grabbed) {
              qemu_remove_mouse_event_handler(s->eh_entry);
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
index 6e38d814cda..678e059463d 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
@@ -15,10 +15,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  linux-user/syscall.c | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index d6f8cc97..a61420e7 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
+Index: qemu-5.1.0/linux-user/syscall.c
+===================================================================
+--- qemu-5.1.0.orig/linux-user/syscall.c
++++ qemu-5.1.0/linux-user/syscall.c
 @@ -109,7 +109,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
@@ -28,7 +28,4 @@ index d6f8cc97..a61420e7 100644
 +#endif
  #include <linux/rtc.h>
  #include <sound/asound.h>
- #include "linux_loop.h"
--- 
-2.24.0
-
+ #ifdef HAVE_DRM_H
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
index 3d268870fc6..f379948f14b 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
@@ -16,11 +16,11 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  tests/Makefile.include | 8 ++++++++
  1 file changed, 8 insertions(+)
 
-diff --git a/tests/Makefile.include b/tests/Makefile.include
-index 51de6762..1ea4d322 100644
---- a/tests/Makefile.include
-+++ b/tests/Makefile.include
-@@ -941,4 +941,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
+Index: qemu-5.1.0/tests/Makefile.include
+===================================================================
+--- qemu-5.1.0.orig/tests/Makefile.include
++++ qemu-5.1.0/tests/Makefile.include
+@@ -982,4 +982,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
  -include $(wildcard tests/qtest/*.d)
  -include $(wildcard tests/qtest/libqos/*.d)
  
@@ -33,6 +33,3 @@ index 51de6762..1ea4d322 100644
 +	done
 +
  endif
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 012d60d8f05..33cef42217c 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -15,13 +15,13 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
 ---
- hw/mips/mips_malta.c | 2 +-
+ hw/mips/malta.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
-index 92e9ca5b..3a7f3954 100644
---- a/hw/mips/mips_malta.c
-+++ b/hw/mips/mips_malta.c
+Index: qemu-5.1.0/hw/mips/malta.c
+===================================================================
+--- qemu-5.1.0.orig/hw/mips/malta.c
++++ qemu-5.1.0/hw/mips/malta.c
 @@ -59,7 +59,7 @@
  
  #define ENVP_ADDR           0x80002000l
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
index bc30397e8c0..71f537f9b09 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
@@ -12,11 +12,11 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  configure | 9 ---------
  1 file changed, 9 deletions(-)
 
-diff --git a/configure b/configure
-index 6099be1d..a766017b 100755
---- a/configure
-+++ b/configure
-@@ -5390,15 +5390,6 @@ fi
+Index: qemu-5.1.0/configure
+===================================================================
+--- qemu-5.1.0.orig/configure
++++ qemu-5.1.0/configure
+@@ -5751,15 +5751,6 @@ fi
  # check if we have valgrind/valgrind.h
  
  valgrind_h=no
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
index 2c5b241e414..02ebbee1a06 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
@@ -11,11 +11,11 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  configure | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/configure b/configure
-index 83c65439..6bdf488c 100755
---- a/configure
-+++ b/configure
-@@ -6251,10 +6251,6 @@ write_c_skeleton
+Index: qemu-5.1.0/configure
+===================================================================
+--- qemu-5.1.0.orig/configure
++++ qemu-5.1.0/configure
+@@ -6515,10 +6515,6 @@ write_c_skeleton
  if test "$gcov" = "yes" ; then
    QEMU_CFLAGS="-fprofile-arcs -ftest-coverage -g $QEMU_CFLAGS"
    QEMU_LDFLAGS="-fprofile-arcs -ftest-coverage $QEMU_LDFLAGS"
@@ -26,6 +26,3 @@ index 83c65439..6bdf488c 100755
  fi
  
  if test "$have_asan" = "yes"; then
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
index 0810ae84c0e..98fd5e91335 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
@@ -51,11 +51,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  qapi/char.json        |   5 +++
  3 files changed, 109 insertions(+)
 
-diff --git a/chardev/char-socket.c b/chardev/char-socket.c
-index 185fe38d..54fa4234 100644
---- a/chardev/char-socket.c
-+++ b/chardev/char-socket.c
-@@ -1288,6 +1288,67 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
+Index: qemu-5.1.0/chardev/char-socket.c
+===================================================================
+--- qemu-5.1.0.orig/chardev/char-socket.c
++++ qemu-5.1.0/chardev/char-socket.c
+@@ -1292,6 +1292,67 @@ static bool qmp_chardev_validate_socket(
      return true;
  }
  
@@ -123,7 +123,7 @@ index 185fe38d..54fa4234 100644
  
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
-@@ -1296,6 +1357,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -1300,6 +1361,9 @@ static void qmp_chardev_open_socket(Char
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -133,7 +133,7 @@ index 185fe38d..54fa4234 100644
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -1361,6 +1425,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
+@@ -1365,6 +1429,14 @@ static void qmp_chardev_open_socket(Char
  
      update_disconnected_filename(s);
  
@@ -148,13 +148,15 @@ index 185fe38d..54fa4234 100644
      if (s->is_listen) {
          if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
                                             is_waitconnect, errp) < 0) {
-@@ -1380,9 +1452,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1384,11 +1456,27 @@ static void qemu_chr_parse_socket(QemuOp
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *fd = qemu_opt_get(opts, "fd");
 +#ifndef _WIN32
 +    const char *cmd = qemu_opt_get(opts, "cmd");
 +#endif
+     bool tight = qemu_opt_get_bool(opts, "tight", true);
+     bool abstract = qemu_opt_get_bool(opts, "abstract", false);
      SocketAddressLegacy *addr;
      ChardevSocket *sock;
  
@@ -171,19 +173,19 @@ index 185fe38d..54fa4234 100644
 +        }
 +    } else
 +#endif
-+
      if ((!!path + !!fd + !!host) != 1) {
          error_setg(errp,
                     "Exactly one of 'path', 'fd' or 'host' required");
-@@ -1425,12 +1514,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
+@@ -1431,12 +1519,24 @@ static void qemu_chr_parse_socket(QemuOp
      sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
      sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
  
+-    addr = g_new0(SocketAddressLegacy, 1);
 +#ifndef _WIN32
 +    sock->cmd = g_strdup(cmd);
 +#endif
 +
-     addr = g_new0(SocketAddressLegacy, 1);
++     addr = g_new0(SocketAddressLegacy, 1);
 +#ifndef _WIN32
 +    if (path || cmd) {
 +#else
@@ -197,28 +199,28 @@ index 185fe38d..54fa4234 100644
 +#else
          q_unix->path = g_strdup(path);
 +#endif
+         q_unix->tight = tight;
+         q_unix->abstract = abstract;
      } else if (host) {
-         addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
-         addr->u.inet.data = g_new(InetSocketAddress, 1);
-diff --git a/chardev/char.c b/chardev/char.c
-index 7b6b2cb1..0c2ca64b 100644
---- a/chardev/char.c
-+++ b/chardev/char.c
-@@ -837,6 +837,9 @@ QemuOptsList qemu_chardev_opts = {
-         },{
+Index: qemu-5.1.0/chardev/char.c
+===================================================================
+--- qemu-5.1.0.orig/chardev/char.c
++++ qemu-5.1.0/chardev/char.c
+@@ -826,6 +826,9 @@ QemuOptsList qemu_chardev_opts = {
              .name = "path",
              .type = QEMU_OPT_STRING,
-+        },{
+         },{
 +            .name = "cmd",
 +            .type = QEMU_OPT_STRING,
-         },{
++        },{
              .name = "host",
              .type = QEMU_OPT_STRING,
-diff --git a/qapi/char.json b/qapi/char.json
-index a6e81ac7..517962c6 100644
---- a/qapi/char.json
-+++ b/qapi/char.json
-@@ -247,6 +247,10 @@
+         },{
+Index: qemu-5.1.0/qapi/char.json
+===================================================================
+--- qemu-5.1.0.orig/qapi/char.json
++++ qemu-5.1.0/qapi/char.json
+@@ -250,6 +250,10 @@
  #
  # @addr: socket address to listen on (server=true)
  #        or connect to (server=false)
@@ -229,7 +231,7 @@ index a6e81ac7..517962c6 100644
  # @tls-creds: the ID of the TLS credentials object (since 2.6)
  # @tls-authz: the ID of the QAuthZ authorization object against which
  #             the client's x509 distinguished name will be validated. This
-@@ -272,6 +276,7 @@
+@@ -276,6 +280,7 @@
  ##
  { 'struct': 'ChardevSocket',
    'data': { 'addr': 'SocketAddressLegacy',
diff --git a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
index 89baad9b7f1..034ac57821d 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
@@ -29,11 +29,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 2a74f7b4..4d5da365 100644
---- a/hw/intc/apic.c
-+++ b/hw/intc/apic.c
-@@ -603,7 +603,7 @@ int apic_accept_pic_intr(DeviceState *dev)
+Index: qemu-5.1.0/hw/intc/apic.c
+===================================================================
+--- qemu-5.1.0.orig/hw/intc/apic.c
++++ qemu-5.1.0/hw/intc/apic.c
+@@ -603,7 +603,7 @@ int apic_accept_pic_intr(DeviceState *de
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
index 30bb4ddf26f..d20f04ee590 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
@@ -18,11 +18,11 @@ Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
  linux-user/main.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/linux-user/main.c b/linux-user/main.c
-index 6ff7851e..ebff0485 100644
---- a/linux-user/main.c
-+++ b/linux-user/main.c
-@@ -78,7 +78,7 @@ int have_guest_base;
+Index: qemu-5.1.0/linux-user/main.c
+===================================================================
+--- qemu-5.1.0.orig/linux-user/main.c
++++ qemu-5.1.0/linux-user/main.c
+@@ -92,7 +92,7 @@ static int last_log_mask;
        (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
  /* There are a number of places where we assign reserved_va to a variable
     of type abi_ulong and expect it to fit.  Avoid the last page.  */
diff --git a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
index eef3f3f97f9..f2a44986b72 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
@@ -28,29 +28,29 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  linux-user/syscall.c    |  5 +----
  4 files changed, 10 insertions(+), 23 deletions(-)
 
-diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
-index 49384bb6..93b12519 100644
---- a/include/exec/cpu-all.h
-+++ b/include/exec/cpu-all.h
-@@ -162,12 +162,8 @@ extern unsigned long guest_base;
- extern int have_guest_base;
- extern unsigned long reserved_va;
- 
--#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
--#define GUEST_ADDR_MAX (~0ul)
--#else
--#define GUEST_ADDR_MAX (reserved_va ? reserved_va - 1 : \
+Index: qemu-5.1.0/include/exec/cpu-all.h
+===================================================================
+--- qemu-5.1.0.orig/include/exec/cpu-all.h
++++ qemu-5.1.0/include/exec/cpu-all.h
+@@ -176,11 +176,8 @@ extern unsigned long reserved_va;
+  * avoid setting bits at the top of guest addresses that might need
+  * to be used for tags.
+  */
+-#define GUEST_ADDR_MAX_                                                 \
+-    ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
+-     UINT32_MAX : ~0ul)
+-#define GUEST_ADDR_MAX    (reserved_va ? reserved_va - 1 : GUEST_ADDR_MAX_)
+-
 +#define GUEST_ADDR_MAX (reserved_va ? reserved_va : \
-                                     (1ul << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
--#endif
++                                     (1ul << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
  #else
  
  #include "exec/hwaddr.h"
-diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
-index 53de1975..cf19ed2e 100644
---- a/include/exec/cpu_ldst.h
-+++ b/include/exec/cpu_ldst.h
-@@ -70,7 +70,10 @@ typedef uint64_t abi_ptr;
+Index: qemu-5.1.0/include/exec/cpu_ldst.h
+===================================================================
+--- qemu-5.1.0.orig/include/exec/cpu_ldst.h
++++ qemu-5.1.0/include/exec/cpu_ldst.h
+@@ -75,7 +75,10 @@ typedef uint64_t abi_ptr;
  #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
  #define guest_addr_valid(x) (1)
  #else
@@ -62,11 +62,11 @@ index 53de1975..cf19ed2e 100644
  #endif
  #define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
  
-diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index e3780337..1d4aba95 100644
---- a/linux-user/mmap.c
-+++ b/linux-user/mmap.c
-@@ -71,7 +71,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
+Index: qemu-5.1.0/linux-user/mmap.c
+===================================================================
+--- qemu-5.1.0.orig/linux-user/mmap.c
++++ qemu-5.1.0/linux-user/mmap.c
+@@ -71,7 +71,7 @@ int target_mprotect(abi_ulong start, abi
          return -TARGET_EINVAL;
      len = TARGET_PAGE_ALIGN(len);
      end = start + len;
@@ -75,18 +75,18 @@ index e3780337..1d4aba95 100644
          return -TARGET_ENOMEM;
      }
      prot &= PROT_READ | PROT_WRITE | PROT_EXEC;
-@@ -467,8 +467,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
+@@ -467,8 +467,8 @@ abi_long target_mmap(abi_ulong start, ab
           * It can fail only on 64-bit host with 32-bit target.
           * On any other target/host host mmap() handles this error correctly.
           */
--        if (!guest_range_valid(start, len)) {
+-        if (end < start || !guest_range_valid(start, len)) {
 -            errno = ENOMEM;
-+        if ((unsigned long)start + len - 1 > (abi_ulong) -1) {
++        if (end < start || ((unsigned long)start + len - 1 > (abi_ulong) -1)) {
 +            errno = EINVAL;
              goto fail;
          }
  
-@@ -604,10 +604,8 @@ int target_munmap(abi_ulong start, abi_ulong len)
+@@ -604,10 +604,8 @@ int target_munmap(abi_ulong start, abi_u
      if (start & ~TARGET_PAGE_MASK)
          return -TARGET_EINVAL;
      len = TARGET_PAGE_ALIGN(len);
@@ -98,7 +98,7 @@ index e3780337..1d4aba95 100644
      mmap_lock();
      end = start + len;
      real_start = start & qemu_host_page_mask;
-@@ -662,13 +660,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -662,13 +660,6 @@ abi_long target_mremap(abi_ulong old_add
      int prot;
      void *host_addr;
  
@@ -112,11 +112,11 @@ index e3780337..1d4aba95 100644
      mmap_lock();
  
      if (flags & MREMAP_FIXED) {
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 05f03919..d6f8cc97 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -4287,9 +4287,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
+Index: qemu-5.1.0/linux-user/syscall.c
+===================================================================
+--- qemu-5.1.0.orig/linux-user/syscall.c
++++ qemu-5.1.0/linux-user/syscall.c
+@@ -4336,9 +4336,6 @@ static inline abi_ulong do_shmat(CPUArch
              return -TARGET_EINVAL;
          }
      }
@@ -126,7 +126,7 @@ index 05f03919..d6f8cc97 100644
  
      mmap_lock();
  
-@@ -7247,7 +7244,7 @@ static int open_self_maps(void *cpu_env, int fd)
+@@ -7376,7 +7373,7 @@ static int open_self_maps(void *cpu_env,
              const char *path;
  
              max = h2g_valid(max - 1) ?
@@ -135,6 +135,3 @@ index 05f03919..d6f8cc97 100644
  
              if (page_check_range(h2g(min), max - min, flags) == -1) {
                  continue;
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
index 34df78b7fe0..d7e3fffdd02 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -14,11 +14,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  configure | 48 ++++++++++++++++++++++++++++++++++++++++--------
  1 file changed, 40 insertions(+), 8 deletions(-)
 
-diff --git a/configure b/configure
-index 72f11aca..cac271ce 100755
---- a/configure
-+++ b/configure
-@@ -2875,6 +2875,30 @@ has_libgcrypt() {
+Index: qemu-5.1.0/configure
+===================================================================
+--- qemu-5.1.0.orig/configure
++++ qemu-5.1.0/configure
+@@ -3084,6 +3084,30 @@ has_libgcrypt() {
      return 0
  }
  
@@ -49,7 +49,7 @@ index 72f11aca..cac271ce 100755
  
  if test "$nettle" != "no"; then
      pass="no"
-@@ -2915,7 +2939,14 @@ fi
+@@ -3124,7 +3148,14 @@ fi
  
  if test "$gcrypt" != "no"; then
      pass="no"
@@ -65,7 +65,7 @@ index 72f11aca..cac271ce 100755
          gcrypt_cflags=$(libgcrypt-config --cflags)
          gcrypt_libs=$(libgcrypt-config --libs)
          # Debian has removed -lgpg-error from libgcrypt-config
-@@ -2925,15 +2956,16 @@ if test "$gcrypt" != "no"; then
+@@ -3134,15 +3165,16 @@ if test "$gcrypt" != "no"; then
          then
              gcrypt_libs="$gcrypt_libs -lgpg-error"
          fi
diff --git a/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch b/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
deleted file mode 100644
index e5ebfc12678..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 0a53e906510cce1f32bc04a11e81ea40f834dac4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Wed, 12 Aug 2015 15:11:30 -0500
-Subject: [PATCH] cpus.c: Add error messages when qemi_cpu_kick_thread fails.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add custom_debug.h with function for print backtrace information.
-When pthread_kill fails in qemu_cpu_kick_thread display backtrace and
-current cpu information.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
----
- cpus.c         |  5 +++++
- custom_debug.h | 24 ++++++++++++++++++++++++
- 2 files changed, 29 insertions(+)
- create mode 100644 custom_debug.h
-
-diff --git a/cpus.c b/cpus.c
-index e83f72b4..e6e2576e 100644
---- a/cpus.c
-+++ b/cpus.c
-@@ -1769,6 +1769,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
-     return NULL;
- }
- 
-+#include "custom_debug.h"
-+
- static void qemu_cpu_kick_thread(CPUState *cpu)
- {
- #ifndef _WIN32
-@@ -1781,6 +1783,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
-     err = pthread_kill(cpu->thread->thread, SIG_IPI);
-     if (err && err != ESRCH) {
-         fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
-+        fprintf(stderr, "CPU #%d:\n", cpu->cpu_index);
-+        cpu_dump_state(cpu, stderr, 0);
-+        backtrace_print();
-         exit(1);
-     }
- #else /* _WIN32 */
-diff --git a/custom_debug.h b/custom_debug.h
-new file mode 100644
-index 00000000..f029e455
---- /dev/null
-+++ b/custom_debug.h
-@@ -0,0 +1,24 @@
-+#include <execinfo.h>
-+#include <stdio.h>
-+#define BACKTRACE_MAX 128
-+static void backtrace_print(void)
-+{
-+	int nfuncs = 0;
-+	void *buf[BACKTRACE_MAX];
-+	char **symbols;
-+	int i;
-+
-+	nfuncs = backtrace(buf, BACKTRACE_MAX);
-+
-+	symbols = backtrace_symbols(buf, nfuncs);
-+	if (symbols == NULL) {
-+		fprintf(stderr, "backtrace_print failed to get symbols");
-+		return;
-+	}
-+
-+	fprintf(stderr, "Backtrace ...\n");
-+	for (i = 0; i < nfuncs; i++)
-+		fprintf(stderr, "%s\n", symbols[i]);
-+
-+	free(symbols);
-+}
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
deleted file mode 100644
index 19f26ae5b05..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 5c4fe018c025740fef4a0a4421e8162db0c3eefd Mon Sep 17 00:00:00 2001
-From: Eric Blake <eblake@redhat.com>
-Date: Mon, 8 Jun 2020 13:26:37 -0500
-Subject: [PATCH] nbd/server: Avoid long error message assertions
- CVE-2020-10761
-
-Ever since commit 36683283 (v2.8), the server code asserts that error
-strings sent to the client are well-formed per the protocol by not
-exceeding the maximum string length of 4096.  At the time the server
-first started sending error messages, the assertion could not be
-triggered, because messages were completely under our control.
-However, over the years, we have added latent scenarios where a client
-could trigger the server to attempt an error message that would
-include the client's information if it passed other checks first:
-
-- requesting NBD_OPT_INFO/GO on an export name that is not present
-  (commit 0cfae925 in v2.12 echoes the name)
-
-- requesting NBD_OPT_LIST/SET_META_CONTEXT on an export name that is
-  not present (commit e7b1948d in v2.12 echoes the name)
-
-At the time, those were still safe because we flagged names larger
-than 256 bytes with a different message; but that changed in commit
-93676c88 (v4.2) when we raised the name limit to 4096 to match the NBD
-string limit.  (That commit also failed to change the magic number
-4096 in nbd_negotiate_send_rep_err to the just-introduced named
-constant.)  So with that commit, long client names appended to server
-text can now trigger the assertion, and thus be used as a denial of
-service attack against a server.  As a mitigating factor, if the
-server requires TLS, the client cannot trigger the problematic paths
-unless it first supplies TLS credentials, and such trusted clients are
-less likely to try to intentionally crash the server.
-
-We may later want to further sanitize the user-supplied strings we
-place into our error messages, such as scrubbing out control
-characters, but that is less important to the CVE fix, so it can be a
-later patch to the new nbd_sanitize_name.
-
-Consideration was given to changing the assertion in
-nbd_negotiate_send_rep_verr to instead merely log a server error and
-truncate the message, to avoid leaving a latent path that could
-trigger a future CVE DoS on any new error message.  However, this
-merely complicates the code for something that is already (correctly)
-flagging coding errors, and now that we are aware of the long message
-pitfall, we are less likely to introduce such errors in the future,
-which would make such error handling dead code.
-
-Reported-by: Xueqiang Wei <xuwei@redhat.com>
-CC: qemu-stable@nongnu.org
-Fixes: https://bugzilla.redhat.com/1843684 CVE-2020-10761
-Fixes: 93676c88d7
-Signed-off-by: Eric Blake <eblake@redhat.com>
-Message-Id: <20200610163741.3745251-2-eblake@redhat.com>
-Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
-
-Upstream-Status: Backport  [https://github.com/qemu/qemu/commit/5c4fe018c025740fef4a0a4421e8162db0c3eefd]
-CVE: CVE-2020-10761
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- nbd/server.c               | 23 ++++++++++++++++++++---
- tests/qemu-iotests/143     |  4 ++++
- tests/qemu-iotests/143.out |  2 ++
- 3 files changed, 26 insertions(+), 3 deletions(-)
-
-diff --git a/nbd/server.c b/nbd/server.c
-index 02b1ed08014..20754e9ebc3 100644
---- a/nbd/server.c
-+++ b/nbd/server.c
-@@ -217,7 +217,7 @@ nbd_negotiate_send_rep_verr(NBDClient *client, uint32_t type,
- 
-     msg = g_strdup_vprintf(fmt, va);
-     len = strlen(msg);
--    assert(len < 4096);
-+    assert(len < NBD_MAX_STRING_SIZE);
-     trace_nbd_negotiate_send_rep_err(msg);
-     ret = nbd_negotiate_send_rep_len(client, type, len, errp);
-     if (ret < 0) {
-@@ -231,6 +231,19 @@ nbd_negotiate_send_rep_verr(NBDClient *client, uint32_t type,
-     return 0;
- }
- 
-+/*
-+ * Return a malloc'd copy of @name suitable for use in an error reply.
-+ */
-+static char *
-+nbd_sanitize_name(const char *name)
-+{
-+    if (strnlen(name, 80) < 80) {
-+        return g_strdup(name);
-+    }
-+    /* XXX Should we also try to sanitize any control characters? */
-+    return g_strdup_printf("%.80s...", name);
-+}
-+
- /* Send an error reply.
-  * Return -errno on error, 0 on success. */
- static int GCC_FMT_ATTR(4, 5)
-@@ -595,9 +608,11 @@ static int nbd_negotiate_handle_info(NBDClient *client, Error **errp)
- 
-     exp = nbd_export_find(name);
-     if (!exp) {
-+        g_autofree char *sane_name = nbd_sanitize_name(name);
-+
-         return nbd_negotiate_send_rep_err(client, NBD_REP_ERR_UNKNOWN,
-                                           errp, "export '%s' not present",
--                                          name);
-+                                          sane_name);
-     }
- 
-     /* Don't bother sending NBD_INFO_NAME unless client requested it */
-@@ -995,8 +1010,10 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
- 
-     meta->exp = nbd_export_find(export_name);
-     if (meta->exp == NULL) {
-+        g_autofree char *sane_name = nbd_sanitize_name(export_name);
-+
-         return nbd_opt_drop(client, NBD_REP_ERR_UNKNOWN, errp,
--                            "export '%s' not present", export_name);
-+                            "export '%s' not present", sane_name);
-     }
- 
-     ret = nbd_opt_read(client, &nb_queries, sizeof(nb_queries), errp);
-diff --git a/tests/qemu-iotests/143 b/tests/qemu-iotests/143
-index f649b361950..d2349903b1b 100755
---- a/tests/qemu-iotests/143
-+++ b/tests/qemu-iotests/143
-@@ -58,6 +58,10 @@ _send_qemu_cmd $QEMU_HANDLE \
- $QEMU_IO_PROG -f raw -c quit \
-     "nbd+unix:///no_such_export?socket=$SOCK_DIR/nbd" 2>&1 \
-     | _filter_qemu_io | _filter_nbd
-+# Likewise, with longest possible name permitted in NBD protocol
-+$QEMU_IO_PROG -f raw -c quit \
-+    "nbd+unix:///$(printf %4096d 1 | tr ' ' a)?socket=$SOCK_DIR/nbd" 2>&1 \
-+    | _filter_qemu_io | _filter_nbd | sed 's/aaaa*aa/aa--aa/'
- 
- _send_qemu_cmd $QEMU_HANDLE \
-     "{ 'execute': 'quit' }" \
-diff --git a/tests/qemu-iotests/143.out b/tests/qemu-iotests/143.out
-index 1f4001c6013..fc9c0a761fa 100644
---- a/tests/qemu-iotests/143.out
-+++ b/tests/qemu-iotests/143.out
-@@ -5,6 +5,8 @@ QA output created by 143
- {"return": {}}
- qemu-io: can't open device nbd+unix:///no_such_export?socket=SOCK_DIR/nbd: Requested export not available
- server reported: export 'no_such_export' not present
-+qemu-io: can't open device nbd+unix:///aa--aa1?socket=SOCK_DIR/nbd: Requested export not available
-+server reported: export 'aa--aa...' not present
- { 'execute': 'quit' }
- {"return": {}}
- {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
deleted file mode 100644
index e0acc70f3c4..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-13361.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 369ff955a8497988d079c4e3fa1e93c2570c1c69 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Fri, 15 May 2020 01:36:08 +0530
-Subject: [PATCH] es1370: check total frame count against current frame
-
-A guest user may set channel frame count via es1370_write()
-such that, in es1370_transfer_audio(), total frame count
-'size' is lesser than the number of frames that are processed
-'cnt'.
-
-    int cnt = d->frame_cnt >> 16;
-    int size = d->frame_cnt & 0xffff;
-
-if (size < cnt), it results in incorrect calculations leading
-to OOB access issue(s). Add check to avoid it.
-
-Reported-by: Ren Ding <rding@gatech.edu>
-Reported-by: Hanqing Zhao <hanqing@gatech.edu>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-id: 20200514200608.1744203-1-ppandit@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-
-Upstream-Status: Backport [https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg03983.html]
-CVE: CVE-2020-13361
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- hw/audio/es1370.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
-index 89c4dabcd44..5f8a83ff562 100644
---- a/hw/audio/es1370.c
-+++ b/hw/audio/es1370.c
-@@ -643,6 +643,9 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
-     int csc_bytes = (csc + 1) << d->shift;
-     int cnt = d->frame_cnt >> 16;
-     int size = d->frame_cnt & 0xffff;
-+    if (size < cnt) {
-+        return;
-+    }
-     int left = ((size - cnt + 1) << 2) + d->leftover;
-     int transferred = 0;
-     int temp = MIN (max, MIN (left, csc_bytes));
-@@ -651,7 +654,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
-     addr += (cnt << 2) + d->leftover;
- 
-     if (index == ADC_CHANNEL) {
--        while (temp) {
-+        while (temp > 0) {
-             int acquired, to_copy;
- 
-             to_copy = MIN ((size_t) temp, sizeof (tmpbuf));
-@@ -669,7 +672,7 @@ static void es1370_transfer_audio (ES1370State *s, struct chan *d, int loop_sel,
-     else {
-         SWVoiceOut *voice = s->dac_voice[index];
- 
--        while (temp) {
-+        while (temp > 0) {
-             int copied, to_copy;
- 
-             to_copy = MIN ((size_t) temp, sizeof (tmpbuf));
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
deleted file mode 100644
index af8d4ba8f46..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From f50ab86a2620bd7e8507af865b164655ee921661 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 14 May 2020 00:55:38 +0530
-Subject: [PATCH] megasas: use unsigned type for reply_queue_head and check
- index
-
-A guest user may set 'reply_queue_head' field of MegasasState to
-a negative value. Later in 'megasas_lookup_frame' it is used to
-index into s->frames[] array. Use unsigned type to avoid OOB
-access issue.
-
-Also check that 'index' value stays within s->frames[] bounds
-through the while() loop in 'megasas_lookup_frame' to avoid OOB
-access.
-
-Reported-by: Ren Ding <rding@gatech.edu>
-Reported-by: Hanqing Zhao <hanqing@gatech.edu>
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Acked-by: Alexander Bulekov <alxndr@bu.edu>
-Message-Id: <20200513192540.1583887-2-ppandit@redhat.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-Upstream-Status: Backport [f50ab86a2620bd7e8507af865b164655ee921661]
-CVE: CVE-2020-13362
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/scsi/megasas.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
-index af18c88b65..6ce598cd69 100644
---- a/hw/scsi/megasas.c
-+++ b/hw/scsi/megasas.c
-@@ -112,7 +112,7 @@ typedef struct MegasasState {
-     uint64_t reply_queue_pa;
-     void *reply_queue;
-     int reply_queue_len;
--    int reply_queue_head;
-+    uint16_t reply_queue_head;
-     int reply_queue_tail;
-     uint64_t consumer_pa;
-     uint64_t producer_pa;
-@@ -445,7 +445,7 @@ static MegasasCmd *megasas_lookup_frame(MegasasState *s,
- 
-     index = s->reply_queue_head;
- 
--    while (num < s->fw_cmds) {
-+    while (num < s->fw_cmds && index < MEGASAS_MAX_FRAMES) {
-         if (s->frames[index].pa && s->frames[index].pa == frame) {
-             cmd = &s->frames[index];
-             break;
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch
deleted file mode 100644
index 4d12ae8f16b..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-13659.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 77f55eac6c433e23e82a1b88b2d74f385c4c7d82 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Tue, 26 May 2020 16:47:43 +0530
-Subject: [PATCH] exec: set map length to zero when returning NULL
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When mapping physical memory into host's virtual address space,
-'address_space_map' may return NULL if BounceBuffer is in_use.
-Set and return '*plen = 0' to avoid later NULL pointer dereference.
-
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Fixes: https://bugs.launchpad.net/qemu/+bug/1878259
-Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
-Suggested-by: Peter Maydell <peter.maydell@linaro.org>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <20200526111743.428367-1-ppandit@redhat.com>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-Upstream-Status: Backport [77f55eac6c433e23e82a1b88b2d74f385c4c7d82]
-CVE: CVE-2020-13659
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- exec.c                | 1 +
- include/exec/memory.h | 3 ++-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/exec.c b/exec.c
-index 9cbde85d8c..778263f1c6 100644
---- a/exec.c
-+++ b/exec.c
-@@ -3540,6 +3540,7 @@ void *address_space_map(AddressSpace *as,
- 
-     if (!memory_access_is_direct(mr, is_write)) {
-         if (atomic_xchg(&bounce.in_use, true)) {
-+            *plen = 0;
-             return NULL;
-         }
-         /* Avoid unbounded allocations */
-diff --git a/include/exec/memory.h b/include/exec/memory.h
-index bd7fdd6081..af8ca7824e 100644
---- a/include/exec/memory.h
-+++ b/include/exec/memory.h
-@@ -2314,7 +2314,8 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr, hwaddr len,
- /* address_space_map: map a physical memory region into a host virtual address
-  *
-  * May map a subset of the requested range, given by and returned in @plen.
-- * May return %NULL if resources needed to perform the mapping are exhausted.
-+ * May return %NULL and set *@plen to zero(0), if resources needed to perform
-+ * the mapping are exhausted.
-  * Use only for reads OR writes - not for read-modify-write operations.
-  * Use cpu_register_map_client() to know when retrying the map operation is
-  * likely to succeed.
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
deleted file mode 100644
index 049dab914d5..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From f7d6a635fa3b7797f9d072e280f065bf3cfcd24d Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 4 Jun 2020 17:05:25 +0530
-Subject: [PATCH] pci: assert configuration access is within bounds
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-While accessing PCI configuration bytes, assert that
-'address + len' is within PCI configuration space.
-
-Generally it is within bounds. This is more of a defensive
-assert, in case a buggy device was to send 'address' which
-may go out of bounds.
-
-Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <20200604113525.58898-1-ppandit@redhat.com>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
-
-Upstream-Status: Backport [f7d6a635fa3b7797f9d072e280f065bf3cfcd24d]
-CVE: CVE-2020-13791
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/pci/pci.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/hw/pci/pci.c b/hw/pci/pci.c
-index 70c66965f5..7bf2ae6d92 100644
---- a/hw/pci/pci.c
-+++ b/hw/pci/pci.c
-@@ -1381,6 +1381,8 @@ uint32_t pci_default_read_config(PCIDevice *d,
- {
-     uint32_t val = 0;
- 
-+    assert(address + len <= pci_config_size(d));
-+
-     if (pci_is_express_downstream_port(d) &&
-         ranges_overlap(address, len, d->exp.exp_cap + PCI_EXP_LNKSTA, 2)) {
-         pcie_sync_bridge_lnk(d);
-@@ -1394,6 +1396,8 @@ void pci_default_write_config(PCIDevice *d, uint32_t addr, uint32_t val_in, int
-     int i, was_irq_disabled = pci_irq_disabled(d);
-     uint32_t val = val_in;
- 
-+    assert(addr + l <= pci_config_size(d));
-+
-     for (i = 0; i < l; val >>= 8, ++i) {
-         uint8_t wmask = d->wmask[addr + i];
-         uint8_t w1cmask = d->w1cmask[addr + i];
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch
deleted file mode 100644
index 52bfafbbae0..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-13800.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From a98610c429d52db0937c1e48659428929835c455 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 4 Jun 2020 14:38:30 +0530
-Subject: [PATCH] ati-vga: check mm_index before recursive call
- (CVE-2020-13800)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-While accessing VGA registers via ati_mm_read/write routines,
-a guest may set 's->regs.mm_index' such that it leads to infinite
-recursion. Check mm_index value to avoid such recursion. Log an
-error message for wrong values.
-
-Reported-by: Ren Ding <rding@gatech.edu>
-Reported-by: Hanqing Zhao <hanqing@gatech.edu>
-Reported-by: Yi Ren <c4tren@gmail.com>
-Message-id: 20200604090830.33885-1-ppandit@redhat.com
-Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
-Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-
-Upstream-Status: Backport [a98610c429d52db0937c1e48659428929835c455]
-CVE: CVE-2020-13800
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/display/ati.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/hw/display/ati.c b/hw/display/ati.c
-index 065f197678..67604e68de 100644
---- a/hw/display/ati.c
-+++ b/hw/display/ati.c
-@@ -285,8 +285,11 @@ static uint64_t ati_mm_read(void *opaque, hwaddr addr, unsigned int size)
-             if (idx <= s->vga.vram_size - size) {
-                 val = ldn_le_p(s->vga.vram_ptr + idx, size);
-             }
--        } else {
-+        } else if (s->regs.mm_index > MM_DATA + 3) {
-             val = ati_mm_read(s, s->regs.mm_index + addr - MM_DATA, size);
-+        } else {
-+            qemu_log_mask(LOG_GUEST_ERROR,
-+                "ati_mm_read: mm_index too small: %u\n", s->regs.mm_index);
-         }
-         break;
-     case BIOS_0_SCRATCH ... BUS_CNTL - 1:
-@@ -520,8 +523,11 @@ static void ati_mm_write(void *opaque, hwaddr addr,
-             if (idx <= s->vga.vram_size - size) {
-                 stn_le_p(s->vga.vram_ptr + idx, size, data);
-             }
--        } else {
-+        } else if (s->regs.mm_index > MM_DATA + 3) {
-             ati_mm_write(s, s->regs.mm_index + addr - MM_DATA, data, size);
-+        } else {
-+            qemu_log_mask(LOG_GUEST_ERROR,
-+                "ati_mm_write: mm_index too small: %u\n", s->regs.mm_index);
-         }
-         break;
-     case BIOS_0_SCRATCH ... BUS_CNTL - 1:
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
deleted file mode 100644
index 1505c7eed0d..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 5519724a13664b43e225ca05351c60b4468e4555 Mon Sep 17 00:00:00 2001
-From: Mauro Matteo Cascella <mcascell@redhat.com>
-Date: Fri, 10 Jul 2020 11:19:41 +0200
-Subject: [PATCH] hw/net/xgmac: Fix buffer overflow in xgmac_enet_send()
-
-A buffer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
-occurs while sending an Ethernet frame due to missing break statements
-and improper checking of the buffer size.
-
-Reported-by: Ziming Zhang <ezrakiez@gmail.com>
-Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
-Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5519724a13664b43e225ca05351c60b4468e4555]
-CVE: CVE-2020-15863
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- hw/net/xgmac.c | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
-index 574dd47..5bf1b61 100644
---- a/hw/net/xgmac.c
-+++ b/hw/net/xgmac.c
-@@ -220,21 +220,31 @@ static void xgmac_enet_send(XgmacState *s)
-         }
-         len = (bd.buffer1_size & 0xfff) + (bd.buffer2_size & 0xfff);
- 
-+        /*
-+         * FIXME: these cases of malformed tx descriptors (bad sizes)
-+         * should probably be reported back to the guest somehow
-+         * rather than simply silently stopping processing, but we
-+         * don't know what the hardware does in this situation.
-+         * This will only happen for buggy guests anyway.
-+         */
-         if ((bd.buffer1_size & 0xfff) > 2048) {
-             DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
-                         "xgmac buffer 1 len on send > 2048 (0x%x)\n",
-                          __func__, bd.buffer1_size & 0xfff);
-+            break;
-         }
-         if ((bd.buffer2_size & 0xfff) != 0) {
-             DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
-                         "xgmac buffer 2 len on send != 0 (0x%x)\n",
-                         __func__, bd.buffer2_size & 0xfff);
-+            break;
-         }
--        if (len >= sizeof(frame)) {
-+        if (frame_size + len >= sizeof(frame)) {
-             DEBUGF_BRK("qemu:%s: buffer overflow %d read into %zu "
--                        "buffer\n" , __func__, len, sizeof(frame));
-+                        "buffer\n" , __func__, frame_size + len, sizeof(frame));
-             DEBUGF_BRK("qemu:%s: buffer1.size=%d; buffer2.size=%d\n",
-                         __func__, bd.buffer1_size, bd.buffer2_size);
-+            break;
-         }
- 
-         cpu_physical_memory_read(bd.buffer1_addr, ptr, len);
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/find_datadir.patch b/meta/recipes-devtools/qemu/qemu/find_datadir.patch
index 74e9ba56cef..9a4c11267a5 100644
--- a/meta/recipes-devtools/qemu/qemu/find_datadir.patch
+++ b/meta/recipes-devtools/qemu/qemu/find_datadir.patch
@@ -9,8 +9,10 @@ Upstream-Status: Submitted [qemu-devel@nongnu.org]
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
 
---- a/os-posix.c
-+++ b/os-posix.c
+Index: qemu-5.1.0/os-posix.c
+===================================================================
+--- qemu-5.1.0.orig/os-posix.c
++++ qemu-5.1.0/os-posix.c
 @@ -82,8 +82,9 @@ void os_setup_signal_handling(void)
  
  /*
@@ -19,10 +21,10 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
   * When running from the build tree this will be "$bindir/../pc-bios".
 - * Otherwise, this is CONFIG_QEMU_DATADIR.
 + * Otherwise, this is CONFIG_QEMU_DATADIR as constructed by configure.
-  */
- char *os_find_datadir(void)
- {
-@@ -93,6 +94,12 @@ char *os_find_datadir(void)
+  *
+  * The caller must use g_free() to free the returned data when it is
+  * no longer required.
+@@ -96,6 +97,12 @@ char *os_find_datadir(void)
      exec_dir = qemu_get_exec_dir();
      g_return_val_if_fail(exec_dir != NULL, NULL);
  
diff --git a/meta/recipes-devtools/qemu/qemu_5.0.0.bb b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_5.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_5.1.0.bb
-- 
2.25.1

