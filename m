Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.209.1609972592176222916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N9gpPCjg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id y17so3777790wrr.10
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 14:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KXf44u2KohDjWi1qsOsOkCnsZjwv78l4wKBKeolnJYU=;
        b=N9gpPCjgditG0mM46c8s5RIvu+aaPitMa8gu+Mu3uEPNS30r+IR9KFC8kOp82BN5df
         HhWlo2hNHAvOECGgZyzHgDUaRGfdQhUBUhk/XGWCuLw042uWAifBcKwT2HfJvmp5xJ03
         wqS5Vp9Z5iPD63J9JWdWPJExY56HlAw5w9YkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KXf44u2KohDjWi1qsOsOkCnsZjwv78l4wKBKeolnJYU=;
        b=IyucZ4/UzV5dZjyAjVTr/XtWMQyOd80lyRFhVKLgN2UhWkVcqlyk9HlIAeLkeF7VXz
         DeWRId8/k3mXRwcMKXQIL/SRtSxIOp6NGGiGm+VcTynUxVVloxWWL8sLCTOBIi86CQQU
         LP5xMvie7vyEJ6ZSC6i8WpX8xdHL7dPPlxyVH/nHyYeeTcDC+QMTyogbrvKjduqipqvU
         o9i2dZxa8F/ouZsdcUUkx8NN782/M4Gzj4T5XDgCgjPrtS6ul5+cxLzZx4UgBYoJ4+aD
         RGd232xYwnZd6bj55zqTcWfsQc4v9bkCQY5FC1d3Bx4tpGgfA8swjzuhu5IEHBH6b3Nb
         xb/w==
X-Gm-Message-State: AOAM530L4qN/5kV7j+iaDrvSpTp//4nBrjJmiafb2ETVWFM+DAOLoCG5
	Or+AoZQuFx+eMdIlUgTXQfwOI398nHH4mQ==
X-Google-Smtp-Source: ABdhPJwuu3Mvvmw809hvd3HYlYK07dO6XIT3NbZwhK2o2pLj8IXoayuh31n0eP4M8OPs3kiw712i2g==
X-Received: by 2002:adf:f5c5:: with SMTP id k5mr6350510wrp.286.1609972589663;
        Wed, 06 Jan 2021 14:36:29 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id o8sm4765510wrm.17.2021.01.06.14.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 14:36:29 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] qemu: Upgrade 5.1.0->5.2.0
Date: Wed,  6 Jan 2021 22:36:26 +0000
Message-Id: <20210106223628.561432-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
References: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This involves some pretty major changes for qemu. In particular, they
switched to meson+ninja so we have to adapt to that.

Patch changes:
* CVE patches - dropped as backports
* cflags fix - upstream code changed significantly, need new patch if still issues
* mips TLB entries - dropped as merged upstream
* usb fix - dropped as merged upstream
* find_datadir - dropped as code no longer present that I could find

A patch was added to allow us to force the configure script into "cross" mode
without setting cross_prefix which has other effects we don't need/want.

Dependencies on meson/ninja were added.

Specifying the python interpreter causes the internal meson copy to be
built/used which is undesireable for us so don't do that. The correct
python is in PATH anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...u-native_5.1.0.bb => qemu-native_5.2.0.bb} |   0
 ...e_5.1.0.bb => qemu-system-native_5.2.0.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |  19 ++--
 .../qemu/0001-Add-enable-disable-udev.patch   |   8 +-
 ...emu-Add-missing-wacom-HID-descriptor.patch |  16 +--
 ...mu-Do-not-include-file-if-not-exists.patch |   8 +-
 ...ease-number-of-TLB-entries-on-the-34.patch |  59 ----------
 ...test-which-runs-all-unit-test-cases-.patch |  12 +--
 ...n-environment-space-to-boot-loader-q.patch |   8 +-
 .../qemu/0004-qemu-disable-Valgrind.patch     |   8 +-
 ...ld.bfd-fix-cflags-and-set-some-envir.patch |  28 -----
 ...-connect-socket-to-a-spawned-command.patch |  44 ++++----
 .../0007-apic-fixup-fallthrough-to-PIC.patch  |   8 +-
 ...webkitgtk-hangs-on-32-bit-x86-target.patch |   6 +-
 .../qemu/qemu/0009-Fix-webkitgtk-builds.patch |  40 +++----
 ...dd-pkg-config-handling-for-libgcrypt.patch |  23 ++--
 .../qemu/qemu/CVE-2020-24352.patch            |  52 ---------
 .../qemu/qemu/CVE-2020-25624.patch            | 101 ------------------
 .../qemu/qemu/CVE-2020-25723.patch            |  51 ---------
 .../qemu/qemu/CVE-2020-28916.patch            |  49 ---------
 .../qemu/CVE-2020-29129-CVE-2020-29130.patch  |  64 -----------
 meta/recipes-devtools/qemu/qemu/cross.patch   |  30 ++++++
 .../qemu/qemu/find_datadir.patch              |  39 -------
 .../qemu/qemu/usb-fix-setup_len-init.patch    |  89 ---------------
 .../qemu/{qemu_5.1.0.bb => qemu_5.2.0.bb}     |   2 +-
 26 files changed, 127 insertions(+), 639 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_5.1.0.bb => qemu-native_5.2.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_5.1.0.bb => qemu-system-native_5.2.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/cross.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/find_datadir.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/usb-fix-setup_len-init.patch
 rename meta/recipes-devtools/qemu/{qemu_5.1.0.bb => qemu_5.2.0.bb} (93%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index fd4d760b3fe..5540e37bcf9 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.35%"
 GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.32"
 LINUXLIBCVERSION ?= "5.10%"
-QEMUVERSION ?= "5.1%"
+QEMUVERSION ?= "5.2%"
 GOVERSION ?= "1.15%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
diff --git a/meta/recipes-devtools/qemu/qemu-native_5.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_5.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_5.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_5.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4864d7e93c1..23d0adb901a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -21,7 +21,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch \
            file://0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
            file://0004-qemu-disable-Valgrind.patch \
-           file://0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch \
            file://0006-chardev-connect-socket-to-a-spawned-command.patch \
            file://0007-apic-fixup-fallthrough-to-PIC.patch \
            file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
@@ -29,18 +28,13 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0001-Add-enable-disable-udev.patch \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
-           file://find_datadir.patch \
-           file://usb-fix-setup_len-init.patch \
-           file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
-           file://CVE-2020-24352.patch \
-           file://CVE-2020-29129-CVE-2020-29130.patch \
-           file://CVE-2020-25624.patch \
-           file://CVE-2020-25723.patch \
-           file://CVE-2020-28916.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "c9174eb5933d9eb5e61f541cd6d1184cd3118dfe4c5c4955bc1bdc4d390fa4e5"
+SRC_URI[sha256sum] = "cb18d889b628fbe637672b0326789d9b0e3b8027e0445b936537c78549df17bc"
+
+SRC_URI_append_class-target = " file://cross.patch"
+SRC_URI_append_class-nativesdk = " file://cross.patch"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
@@ -85,13 +79,14 @@ EXTRA_OECONF = " \
     --sysconfdir=${sysconfdir} \
     --libexecdir=${libexecdir} \
     --localstatedir=${localstatedir} \
-    --with-confsuffix=/${BPN} \
+    --with-suffix=${BPN} \
     --disable-strip \
     --disable-werror \
     --extra-cflags='${CFLAGS}' \
     --extra-ldflags='${LDFLAGS}' \
     --with-git=/bin/false \
     --disable-git-update \
+    --meson=meson \
     ${PACKAGECONFIG_CONFARGS} \
     "
 
@@ -99,7 +94,7 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-EXTRA_OECONF_append = " --python=${HOSTTOOLS_DIR}/python3"
+#EXTRA_OECONF_append = " --python=${HOSTTOOLS_DIR}/python3"
 
 do_configure_prepend_class-native() {
 	# Append build host pkg-config paths for native target since the host may provide sdl
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
index 1304ee3bfdc..c99adee8a95 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
@@ -12,11 +12,11 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  configure | 4 ++++
  1 file changed, 4 insertions(+)
 
-Index: qemu-5.1.0/configure
+Index: qemu-5.2.0/configure
 ===================================================================
---- qemu-5.1.0.orig/configure
-+++ qemu-5.1.0/configure
-@@ -1640,6 +1640,10 @@ for opt do
+--- qemu-5.2.0.orig/configure
++++ qemu-5.2.0/configure
+@@ -1525,6 +1525,10 @@ for opt do
    ;;
    --disable-libdaxctl) libdaxctl=no
    ;;
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
index 46c9da08a57..8ce12bdb43e 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
@@ -20,11 +20,11 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
  1 file changed, 93 insertions(+), 1 deletion(-)
 
-Index: qemu-5.1.0/hw/usb/dev-wacom.c
+Index: qemu-5.2.0/hw/usb/dev-wacom.c
 ===================================================================
---- qemu-5.1.0.orig/hw/usb/dev-wacom.c
-+++ qemu-5.1.0/hw/usb/dev-wacom.c
-@@ -74,6 +74,89 @@ static const USBDescStrings desc_strings
+--- qemu-5.2.0.orig/hw/usb/dev-wacom.c
++++ qemu-5.2.0/hw/usb/dev-wacom.c
+@@ -69,6 +69,89 @@ static const USBDescStrings desc_strings
      [STR_SERIALNUMBER]     = "1",
  };
  
@@ -114,16 +114,16 @@ Index: qemu-5.1.0/hw/usb/dev-wacom.c
  static const USBDescIface desc_iface_wacom = {
      .bInterfaceNumber              = 0,
      .bNumEndpoints                 = 1,
-@@ -91,7 +174,7 @@ static const USBDescIface desc_iface_wac
+@@ -86,7 +169,7 @@ static const USBDescIface desc_iface_wac
                  0x00,          /*  u8  country_code */
                  0x01,          /*  u8  num_descriptors */
-                 0x22,          /*  u8  type: Report */
+                 USB_DT_REPORT, /*  u8  type: Report */
 -                0x6e, 0,       /*  u16 len */
-+                sizeof(qemu_tablet_hid_report_descriptor), 0, /*  u16 len */
++                sizeof(qemu_tablet_hid_report_descriptor), 0,       /*  u16 len */
              },
          },
      },
-@@ -271,6 +354,15 @@ static void usb_wacom_handle_control(USB
+@@ -266,6 +349,15 @@ static void usb_wacom_handle_control(USB
      }
  
      switch (request) {
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
index d6c0f9ebe90..3fe9aa6eb5c 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
@@ -15,10 +15,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  linux-user/syscall.c | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: qemu-5.1.0/linux-user/syscall.c
+Index: qemu-5.2.0/linux-user/syscall.c
 ===================================================================
---- qemu-5.1.0.orig/linux-user/syscall.c
-+++ qemu-5.1.0/linux-user/syscall.c
+--- qemu-5.2.0.orig/linux-user/syscall.c
++++ qemu-5.2.0/linux-user/syscall.c
 @@ -109,7 +109,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
@@ -28,4 +28,4 @@ Index: qemu-5.1.0/linux-user/syscall.c
 +#endif
  #include <linux/rtc.h>
  #include <sound/asound.h>
- #ifdef HAVE_DRM_H
+ #ifdef CONFIG_BTRFS
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch b/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
deleted file mode 100644
index 5227b7cbd28..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 68fa519a6cb455005317bd61f95214b58b2f1e69 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
-Date: Fri, 16 Oct 2020 15:20:37 +0200
-Subject: [PATCH] target/mips: Increase number of TLB entries on the 34Kf core
- (16 -> 64)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Per "MIPS32 34K Processor Core Family Software User's Manual,
-Revision 01.13" page 8 in "Joint TLB (JTLB)" section:
-
-  "The JTLB is a fully associative TLB cache containing 16, 32,
-   or 64-dual-entries mapping up to 128 virtual pages to their
-   corresponding physical addresses."
-
-There is no particular reason to restrict the 34Kf core model to
-16 TLB entries, so raise its config to 64.
-
-This is helpful for other projects, in particular the Yocto Project:
-
-  Yocto Project uses qemu-system-mips 34Kf cpu model, to run 32bit
-  MIPS CI loop. It was observed that in this case CI test execution
-  time was almost twice longer than 64bit MIPS variant that runs
-  under MIPS64R2-generic model. It was investigated and concluded
-  that the difference in number of TLBs 16 in 34Kf case vs 64 in
-  MIPS64R2-generic is responsible for most of CI real time execution
-  difference. Because with 16 TLBs linux user-land trashes TLB more
-  and it needs to execute more instructions in TLB refill handler
-  calls, as result it runs much longer.
-
-(https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03428.html)
-
-Buglink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
-Reported-by: Victor Kamensky <kamensky@cisco.com>
-Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Message-Id: <20201016133317.553068-1-f4bug@amsat.org>
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/68fa519a6cb455005317bd61f95214b58b2f1e69]
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
-
----
- target/mips/translate_init.c.inc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: qemu-5.1.0/target/mips/translate_init.inc.c
-===================================================================
---- qemu-5.1.0.orig/target/mips/translate_init.inc.c
-+++ qemu-5.1.0/target/mips/translate_init.inc.c
-@@ -254,7 +254,7 @@ const mips_def_t mips_defs[] =
-         .CP0_PRid = 0x00019500,
-         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
-                        (MMU_TYPE_R4000 << CP0C0_MT),
--        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
-+        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
-                        (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
-                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
-                        (1 << CP0C1_CA),
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
index f379948f14b..3cb1dac9c3b 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
@@ -16,13 +16,13 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  tests/Makefile.include | 8 ++++++++
  1 file changed, 8 insertions(+)
 
-Index: qemu-5.1.0/tests/Makefile.include
+Index: qemu-5.2.0/tests/Makefile.include
 ===================================================================
---- qemu-5.1.0.orig/tests/Makefile.include
-+++ qemu-5.1.0/tests/Makefile.include
-@@ -982,4 +982,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
- -include $(wildcard tests/qtest/*.d)
- -include $(wildcard tests/qtest/libqos/*.d)
+--- qemu-5.2.0.orig/tests/Makefile.include
++++ qemu-5.2.0/tests/Makefile.include
+@@ -155,4 +155,12 @@ clean: check-clean
+ 
+ check-speed: bench-speed
  
 +buildtest-TESTS: $(check-unit-y)
 +
diff --git a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 33cef42217c..fd54f96b036 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -18,11 +18,11 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  hw/mips/malta.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-5.1.0/hw/mips/malta.c
+Index: qemu-5.2.0/hw/mips/malta.c
 ===================================================================
---- qemu-5.1.0.orig/hw/mips/malta.c
-+++ qemu-5.1.0/hw/mips/malta.c
-@@ -59,7 +59,7 @@
+--- qemu-5.2.0.orig/hw/mips/malta.c
++++ qemu-5.2.0/hw/mips/malta.c
+@@ -62,7 +62,7 @@
  
  #define ENVP_ADDR           0x80002000l
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
index 71f537f9b09..a0bd1c5ebc7 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
@@ -12,11 +12,11 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  configure | 9 ---------
  1 file changed, 9 deletions(-)
 
-Index: qemu-5.1.0/configure
+Index: qemu-5.2.0/configure
 ===================================================================
---- qemu-5.1.0.orig/configure
-+++ qemu-5.1.0/configure
-@@ -5751,15 +5751,6 @@ fi
+--- qemu-5.2.0.orig/configure
++++ qemu-5.2.0/configure
+@@ -5001,15 +5001,6 @@ fi
  # check if we have valgrind/valgrind.h
  
  valgrind_h=no
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
deleted file mode 100644
index 02ebbee1a06..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 230fe5804099bdca0c9e4cae7280c9fc513cb7f5 Mon Sep 17 00:00:00 2001
-From: Stephen Arnold <sarnold@vctlabs.com>
-Date: Sun, 12 Jun 2016 18:09:56 -0700
-Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment
-
-Upstream-Status: Pending
-
-[update patch context]
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- configure | 4 ----
- 1 file changed, 4 deletions(-)
-
-Index: qemu-5.1.0/configure
-===================================================================
---- qemu-5.1.0.orig/configure
-+++ qemu-5.1.0/configure
-@@ -6515,10 +6515,6 @@ write_c_skeleton
- if test "$gcov" = "yes" ; then
-   QEMU_CFLAGS="-fprofile-arcs -ftest-coverage -g $QEMU_CFLAGS"
-   QEMU_LDFLAGS="-fprofile-arcs -ftest-coverage $QEMU_LDFLAGS"
--elif test "$fortify_source" = "yes" ; then
--  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
--elif test "$debug" = "no"; then
--  CFLAGS="-O2 $CFLAGS"
- fi
- 
- if test "$have_asan" = "yes"; then
diff --git a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
index 98fd5e91335..201125c1f47 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
@@ -51,11 +51,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  qapi/char.json        |   5 +++
  3 files changed, 109 insertions(+)
 
-Index: qemu-5.1.0/chardev/char-socket.c
+Index: qemu-5.2.0/chardev/char-socket.c
 ===================================================================
---- qemu-5.1.0.orig/chardev/char-socket.c
-+++ qemu-5.1.0/chardev/char-socket.c
-@@ -1292,6 +1292,67 @@ static bool qmp_chardev_validate_socket(
+--- qemu-5.2.0.orig/chardev/char-socket.c
++++ qemu-5.2.0/chardev/char-socket.c
+@@ -1308,6 +1308,67 @@ static bool qmp_chardev_validate_socket(
      return true;
  }
  
@@ -123,7 +123,7 @@ Index: qemu-5.1.0/chardev/char-socket.c
  
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
-@@ -1300,6 +1361,9 @@ static void qmp_chardev_open_socket(Char
+@@ -1316,6 +1377,9 @@ static void qmp_chardev_open_socket(Char
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -133,7 +133,7 @@ Index: qemu-5.1.0/chardev/char-socket.c
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -1365,6 +1429,14 @@ static void qmp_chardev_open_socket(Char
+@@ -1381,6 +1445,14 @@ static void qmp_chardev_open_socket(Char
  
      update_disconnected_filename(s);
  
@@ -148,15 +148,17 @@ Index: qemu-5.1.0/chardev/char-socket.c
      if (s->is_listen) {
          if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
                                             is_waitconnect, errp) < 0) {
-@@ -1384,11 +1456,27 @@ static void qemu_chr_parse_socket(QemuOp
+@@ -1400,6 +1472,9 @@ static void qemu_chr_parse_socket(QemuOp
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *fd = qemu_opt_get(opts, "fd");
 +#ifndef _WIN32
 +    const char *cmd = qemu_opt_get(opts, "cmd");
 +#endif
+ #ifdef CONFIG_LINUX
      bool tight = qemu_opt_get_bool(opts, "tight", true);
      bool abstract = qemu_opt_get_bool(opts, "abstract", false);
+@@ -1407,6 +1482,20 @@ static void qemu_chr_parse_socket(QemuOp
      SocketAddressLegacy *addr;
      ChardevSocket *sock;
  
@@ -173,19 +175,19 @@ Index: qemu-5.1.0/chardev/char-socket.c
 +        }
 +    } else
 +#endif
++
      if ((!!path + !!fd + !!host) != 1) {
          error_setg(errp,
                     "Exactly one of 'path', 'fd' or 'host' required");
-@@ -1431,12 +1519,24 @@ static void qemu_chr_parse_socket(QemuOp
+@@ -1448,13 +1537,24 @@ static void qemu_chr_parse_socket(QemuOp
+     sock->tls_creds = g_strdup(qemu_opt_get(opts, "tls-creds"));
      sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
      sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
- 
--    addr = g_new0(SocketAddressLegacy, 1);
 +#ifndef _WIN32
 +    sock->cmd = g_strdup(cmd);
 +#endif
-+
-+     addr = g_new0(SocketAddressLegacy, 1);
+ 
+     addr = g_new0(SocketAddressLegacy, 1);
 +#ifndef _WIN32
 +    if (path || cmd) {
 +#else
@@ -199,14 +201,14 @@ Index: qemu-5.1.0/chardev/char-socket.c
 +#else
          q_unix->path = g_strdup(path);
 +#endif
+ #ifdef CONFIG_LINUX
+         q_unix->has_tight = true;
          q_unix->tight = tight;
-         q_unix->abstract = abstract;
-     } else if (host) {
-Index: qemu-5.1.0/chardev/char.c
+Index: qemu-5.2.0/chardev/char.c
 ===================================================================
---- qemu-5.1.0.orig/chardev/char.c
-+++ qemu-5.1.0/chardev/char.c
-@@ -826,6 +826,9 @@ QemuOptsList qemu_chardev_opts = {
+--- qemu-5.2.0.orig/chardev/char.c
++++ qemu-5.2.0/chardev/char.c
+@@ -839,6 +839,9 @@ QemuOptsList qemu_chardev_opts = {
              .name = "path",
              .type = QEMU_OPT_STRING,
          },{
@@ -216,10 +218,10 @@ Index: qemu-5.1.0/chardev/char.c
              .name = "host",
              .type = QEMU_OPT_STRING,
          },{
-Index: qemu-5.1.0/qapi/char.json
+Index: qemu-5.2.0/qapi/char.json
 ===================================================================
---- qemu-5.1.0.orig/qapi/char.json
-+++ qemu-5.1.0/qapi/char.json
+--- qemu-5.2.0.orig/qapi/char.json
++++ qemu-5.2.0/qapi/char.json
 @@ -250,6 +250,10 @@
  #
  # @addr: socket address to listen on (server=true)
diff --git a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
index 034ac57821d..294cf5129f1 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
@@ -29,11 +29,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-5.1.0/hw/intc/apic.c
+Index: qemu-5.2.0/hw/intc/apic.c
 ===================================================================
---- qemu-5.1.0.orig/hw/intc/apic.c
-+++ qemu-5.1.0/hw/intc/apic.c
-@@ -603,7 +603,7 @@ int apic_accept_pic_intr(DeviceState *de
+--- qemu-5.2.0.orig/hw/intc/apic.c
++++ qemu-5.2.0/hw/intc/apic.c
+@@ -605,7 +605,7 @@ int apic_accept_pic_intr(DeviceState *de
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
index d20f04ee590..74621a08e80 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
@@ -18,10 +18,10 @@ Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
  linux-user/main.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-5.1.0/linux-user/main.c
+Index: qemu-5.2.0/linux-user/main.c
 ===================================================================
---- qemu-5.1.0.orig/linux-user/main.c
-+++ qemu-5.1.0/linux-user/main.c
+--- qemu-5.2.0.orig/linux-user/main.c
++++ qemu-5.2.0/linux-user/main.c
 @@ -92,7 +92,7 @@ static int last_log_mask;
        (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
  /* There are a number of places where we assign reserved_va to a variable
diff --git a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
index f2a44986b72..2ddc09966c4 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-Fix-webkitgtk-builds.patch
@@ -28,10 +28,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  linux-user/syscall.c    |  5 +----
  4 files changed, 10 insertions(+), 23 deletions(-)
 
-Index: qemu-5.1.0/include/exec/cpu-all.h
+Index: qemu-5.2.0/include/exec/cpu-all.h
 ===================================================================
---- qemu-5.1.0.orig/include/exec/cpu-all.h
-+++ qemu-5.1.0/include/exec/cpu-all.h
+--- qemu-5.2.0.orig/include/exec/cpu-all.h
++++ qemu-5.2.0/include/exec/cpu-all.h
 @@ -176,11 +176,8 @@ extern unsigned long reserved_va;
   * avoid setting bits at the top of guest addresses that might need
   * to be used for tags.
@@ -46,10 +46,10 @@ Index: qemu-5.1.0/include/exec/cpu-all.h
  #else
  
  #include "exec/hwaddr.h"
-Index: qemu-5.1.0/include/exec/cpu_ldst.h
+Index: qemu-5.2.0/include/exec/cpu_ldst.h
 ===================================================================
---- qemu-5.1.0.orig/include/exec/cpu_ldst.h
-+++ qemu-5.1.0/include/exec/cpu_ldst.h
+--- qemu-5.2.0.orig/include/exec/cpu_ldst.h
++++ qemu-5.2.0/include/exec/cpu_ldst.h
 @@ -75,7 +75,10 @@ typedef uint64_t abi_ptr;
  #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
  #define guest_addr_valid(x) (1)
@@ -62,20 +62,20 @@ Index: qemu-5.1.0/include/exec/cpu_ldst.h
  #endif
  #define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
  
-Index: qemu-5.1.0/linux-user/mmap.c
+Index: qemu-5.2.0/linux-user/mmap.c
 ===================================================================
---- qemu-5.1.0.orig/linux-user/mmap.c
-+++ qemu-5.1.0/linux-user/mmap.c
-@@ -71,7 +71,7 @@ int target_mprotect(abi_ulong start, abi
-         return -TARGET_EINVAL;
+--- qemu-5.2.0.orig/linux-user/mmap.c
++++ qemu-5.2.0/linux-user/mmap.c
+@@ -119,7 +119,7 @@ int target_mprotect(abi_ulong start, abi
+     }
      len = TARGET_PAGE_ALIGN(len);
      end = start + len;
 -    if (!guest_range_valid(start, len)) {
 +    if (end < start) {
          return -TARGET_ENOMEM;
      }
-     prot &= PROT_READ | PROT_WRITE | PROT_EXEC;
-@@ -467,8 +467,8 @@ abi_long target_mmap(abi_ulong start, ab
+     if (len == 0) {
+@@ -527,8 +527,8 @@ abi_long target_mmap(abi_ulong start, ab
           * It can fail only on 64-bit host with 32-bit target.
           * On any other target/host host mmap() handles this error correctly.
           */
@@ -86,7 +86,7 @@ Index: qemu-5.1.0/linux-user/mmap.c
              goto fail;
          }
  
-@@ -604,10 +604,8 @@ int target_munmap(abi_ulong start, abi_u
+@@ -664,10 +664,8 @@ int target_munmap(abi_ulong start, abi_u
      if (start & ~TARGET_PAGE_MASK)
          return -TARGET_EINVAL;
      len = TARGET_PAGE_ALIGN(len);
@@ -98,7 +98,7 @@ Index: qemu-5.1.0/linux-user/mmap.c
      mmap_lock();
      end = start + len;
      real_start = start & qemu_host_page_mask;
-@@ -662,13 +660,6 @@ abi_long target_mremap(abi_ulong old_add
+@@ -722,13 +720,6 @@ abi_long target_mremap(abi_ulong old_add
      int prot;
      void *host_addr;
  
@@ -112,11 +112,11 @@ Index: qemu-5.1.0/linux-user/mmap.c
      mmap_lock();
  
      if (flags & MREMAP_FIXED) {
-Index: qemu-5.1.0/linux-user/syscall.c
+Index: qemu-5.2.0/linux-user/syscall.c
 ===================================================================
---- qemu-5.1.0.orig/linux-user/syscall.c
-+++ qemu-5.1.0/linux-user/syscall.c
-@@ -4336,9 +4336,6 @@ static inline abi_ulong do_shmat(CPUArch
+--- qemu-5.2.0.orig/linux-user/syscall.c
++++ qemu-5.2.0/linux-user/syscall.c
+@@ -4590,9 +4590,6 @@ static inline abi_ulong do_shmat(CPUArch
              return -TARGET_EINVAL;
          }
      }
@@ -126,7 +126,7 @@ Index: qemu-5.1.0/linux-user/syscall.c
  
      mmap_lock();
  
-@@ -7376,7 +7373,7 @@ static int open_self_maps(void *cpu_env,
+@@ -7790,7 +7787,7 @@ static int open_self_maps(void *cpu_env,
              const char *path;
  
              max = h2g_valid(max - 1) ?
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
index d7e3fffdd02..c5d206b91bb 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -14,11 +14,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  configure | 48 ++++++++++++++++++++++++++++++++++++++++--------
  1 file changed, 40 insertions(+), 8 deletions(-)
 
-Index: qemu-5.1.0/configure
+Index: qemu-5.2.0/configure
 ===================================================================
---- qemu-5.1.0.orig/configure
-+++ qemu-5.1.0/configure
-@@ -3084,6 +3084,30 @@ has_libgcrypt() {
+--- qemu-5.2.0.orig/configure
++++ qemu-5.2.0/configure
+@@ -2956,6 +2956,30 @@ has_libgcrypt() {
      return 0
  }
  
@@ -49,7 +49,7 @@ Index: qemu-5.1.0/configure
  
  if test "$nettle" != "no"; then
      pass="no"
-@@ -3124,7 +3148,14 @@ fi
+@@ -2994,7 +3018,14 @@ fi
  
  if test "$gcrypt" != "no"; then
      pass="no"
@@ -65,7 +65,7 @@ Index: qemu-5.1.0/configure
          gcrypt_cflags=$(libgcrypt-config --cflags)
          gcrypt_libs=$(libgcrypt-config --libs)
          # Debian has removed -lgpg-error from libgcrypt-config
-@@ -3134,15 +3165,16 @@ if test "$gcrypt" != "no"; then
+@@ -3004,12 +3035,12 @@ if test "$gcrypt" != "no"; then
          then
              gcrypt_libs="$gcrypt_libs -lgpg-error"
          fi
@@ -74,18 +74,11 @@ Index: qemu-5.1.0/configure
 -        # Link test to make sure the given libraries work (e.g for static).
 -        write_c_skeleton
 -        if compile_prog "" "$gcrypt_libs" ; then
--            LIBS="$gcrypt_libs $LIBS"
--            QEMU_CFLAGS="$QEMU_CFLAGS $gcrypt_cflags"
--            pass="yes"
--        fi
 +    # Link test to make sure the given libraries work (e.g for static).
 +    write_c_skeleton
 +    if compile_prog "" "$gcrypt_libs" ; then
-+	    LIBS="$gcrypt_libs $LIBS"
-+	    QEMU_CFLAGS="$QEMU_CFLAGS $gcrypt_cflags"
-+	    pass="yes"
+             pass="yes"
+-        fi
      fi
-+
      if test "$pass" = "yes"; then
          gcrypt="yes"
-         cat > $TMPC << EOF
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
deleted file mode 100644
index 861ff6c3b01..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From ca1f9cbfdce4d63b10d57de80fef89a89d92a540 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Wed, 21 Oct 2020 16:08:18 +0530
-Subject: [PATCH 1/1] ati: check x y display parameter values
-
-The source and destination x,y display parameters in ati_2d_blt()
-may run off the vga limits if either of s->regs.[src|dst]_[xy] is
-zero. Check the parameter values to avoid potential crash.
-
-Reported-by: Gaoning Pan <pgn@zju.edu.cn>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-id: 20201021103818.1704030-1-ppandit@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-
-Upstream-Status: Backport [ https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ca1f9cbfdce4d63b10d57de80fef89a89d92a540;hp=2ddafce7f797082ad216657c830afd4546f16e37 ]
-CVE: CVE-2020-24352
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- hw/display/ati_2d.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
-index 23a8ae0..4dc10ea 100644
---- a/hw/display/ati_2d.c
-+++ b/hw/display/ati_2d.c
-@@ -75,8 +75,9 @@ void ati_2d_blt(ATIVGAState *s)
-         dst_stride *= bpp;
-     }
-     uint8_t *end = s->vga.vram_ptr + s->vga.vram_size;
--    if (dst_bits >= end || dst_bits + dst_x + (dst_y + s->regs.dst_height) *
--        dst_stride >= end) {
-+    if (dst_x > 0x3fff || dst_y > 0x3fff || dst_bits >= end
-+        || dst_bits + dst_x
-+         + (dst_y + s->regs.dst_height) * dst_stride >= end) {
-         qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
-         return;
-     }
-@@ -107,8 +108,9 @@ void ati_2d_blt(ATIVGAState *s)
-             src_bits += s->regs.crtc_offset & 0x07ffffff;
-             src_stride *= bpp;
-         }
--        if (src_bits >= end || src_bits + src_x +
--            (src_y + s->regs.dst_height) * src_stride >= end) {
-+        if (src_x > 0x3fff || src_y > 0x3fff || src_bits >= end
-+            || src_bits + src_x
-+             + (src_y + s->regs.dst_height) * src_stride >= end) {
-             qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
-             return;
-         }
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch
deleted file mode 100644
index 7631bab39f2..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 1328fe0c32d5474604105b8105310e944976b058 Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Tue, 15 Sep 2020 23:52:58 +0530
-Subject: [PATCH] hw: usb: hcd-ohci: check len and frame_number variables
-
-While servicing the OHCI transfer descriptors(TD), OHCI host
-controller derives variables 'start_addr', 'end_addr', 'len'
-etc. from values supplied by the host controller driver.
-Host controller driver may supply values such that using
-above variables leads to out-of-bounds access issues.
-Add checks to avoid them.
-
-AddressSanitizer: stack-buffer-overflow on address 0x7ffd53af76a0
-  READ of size 2 at 0x7ffd53af76a0 thread T0
-  #0 ohci_service_iso_td ../hw/usb/hcd-ohci.c:734
-  #1 ohci_service_ed_list ../hw/usb/hcd-ohci.c:1180
-  #2 ohci_process_lists ../hw/usb/hcd-ohci.c:1214
-  #3 ohci_frame_boundary ../hw/usb/hcd-ohci.c:1257
-  #4 timerlist_run_timers ../util/qemu-timer.c:572
-  #5 qemu_clock_run_timers ../util/qemu-timer.c:586
-  #6 qemu_clock_run_all_timers ../util/qemu-timer.c:672
-  #7 main_loop_wait ../util/main-loop.c:527
-  #8 qemu_main_loop ../softmmu/vl.c:1676
-  #9 main ../softmmu/main.c:50
-
-Reported-by: Gaoning Pan <pgn@zju.edu.cn>
-Reported-by: Yongkang Jia <j_kangel@163.com>
-Reported-by: Yi Ren <yunye.ry@alibaba-inc.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-id: 20200915182259.68522-2-ppandit@redhat.com
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-
-Upstream-Status: Backport
-CVE: CVE-2020-25624
-[https://git.qemu.org/?p=qemu.git;a=commit;h=1328fe0c32d5474604105b8105310e944976b058]
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- hw/usb/hcd-ohci.c | 24 ++++++++++++++++++++++--
- 1 file changed, 22 insertions(+), 2 deletions(-)
-
-diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
-index 1e6e85e..9dc5910 100644
---- a/hw/usb/hcd-ohci.c
-+++ b/hw/usb/hcd-ohci.c
-@@ -731,7 +731,11 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
-     }
- 
-     start_offset = iso_td.offset[relative_frame_number];
--    next_offset = iso_td.offset[relative_frame_number + 1];
-+    if (relative_frame_number < frame_count) {
-+        next_offset = iso_td.offset[relative_frame_number + 1];
-+    } else {
-+        next_offset = iso_td.be;
-+    }
- 
-     if (!(OHCI_BM(start_offset, TD_PSW_CC) & 0xe) || 
-         ((relative_frame_number < frame_count) && 
-@@ -764,7 +768,12 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
-         }
-     } else {
-         /* Last packet in the ISO TD */
--        end_addr = iso_td.be;
-+        end_addr = next_offset;
-+    }
-+
-+    if (start_addr > end_addr) {
-+        trace_usb_ohci_iso_td_bad_cc_overrun(start_addr, end_addr);
-+        return 1;
-     }
- 
-     if ((start_addr & OHCI_PAGE_MASK) != (end_addr & OHCI_PAGE_MASK)) {
-@@ -773,6 +782,9 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
-     } else {
-         len = end_addr - start_addr + 1;
-     }
-+    if (len > sizeof(ohci->usb_buf)) {
-+        len = sizeof(ohci->usb_buf);
-+    }
- 
-     if (len && dir != OHCI_TD_DIR_IN) {
-         if (ohci_copy_iso_td(ohci, start_addr, end_addr, ohci->usb_buf, len,
-@@ -975,8 +987,16 @@ static int ohci_service_td(OHCIState *ohci, struct ohci_ed *ed)
-         if ((td.cbp & 0xfffff000) != (td.be & 0xfffff000)) {
-             len = (td.be & 0xfff) + 0x1001 - (td.cbp & 0xfff);
-         } else {
-+            if (td.cbp > td.be) {
-+                trace_usb_ohci_iso_td_bad_cc_overrun(td.cbp, td.be);
-+                ohci_die(ohci);
-+                return 1;
-+            }
-             len = (td.be - td.cbp) + 1;
-         }
-+        if (len > sizeof(ohci->usb_buf)) {
-+            len = sizeof(ohci->usb_buf);
-+        }
- 
-         pktlen = len;
-         if (len && dir != OHCI_TD_DIR_IN) {
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
deleted file mode 100644
index 90b3a2f41c6..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 2fdb42d840400d58f2e706ecca82c142b97bcbd6 Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@163.com>
-Date: Wed, 12 Aug 2020 09:17:27 -0700
-Subject: [PATCH] hw: ehci: check return value of 'usb_packet_map'
-
-If 'usb_packet_map' fails, we should stop to process the usb
-request.
-
-Signed-off-by: Li Qiang <liq3ea@163.com>
-Message-Id: <20200812161727.29412-1-liq3ea@163.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-
-Upstream-Status: Backport
-CVE: CVE-2020-25723
-[https://git.qemu.org/?p=qemu.git;a=commit;h=2fdb42d840400d58f2e706ecca82c142b97bcbd6]
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- hw/usb/hcd-ehci.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
-index 1495e8f..1fbb02a 100644
---- a/hw/usb/hcd-ehci.c
-+++ b/hw/usb/hcd-ehci.c
-@@ -1373,7 +1373,10 @@ static int ehci_execute(EHCIPacket *p, const char *action)
-         spd = (p->pid == USB_TOKEN_IN && NLPTR_TBIT(p->qtd.altnext) == 0);
-         usb_packet_setup(&p->packet, p->pid, ep, 0, p->qtdaddr, spd,
-                          (p->qtd.token & QTD_TOKEN_IOC) != 0);
--        usb_packet_map(&p->packet, &p->sgl);
-+        if (usb_packet_map(&p->packet, &p->sgl)) {
-+            qemu_sglist_destroy(&p->sgl);
-+            return -1;
-+        }
-         p->async = EHCI_ASYNC_INITIALIZED;
-     }
- 
-@@ -1452,7 +1455,10 @@ static int ehci_process_itd(EHCIState *ehci,
-             if (ep && ep->type == USB_ENDPOINT_XFER_ISOC) {
-                 usb_packet_setup(&ehci->ipacket, pid, ep, 0, addr, false,
-                                  (itd->transact[i] & ITD_XACT_IOC) != 0);
--                usb_packet_map(&ehci->ipacket, &ehci->isgl);
-+                if (usb_packet_map(&ehci->ipacket, &ehci->isgl)) {
-+                    qemu_sglist_destroy(&ehci->isgl);
-+                    return -1;
-+                }
-                 usb_handle_packet(dev, &ehci->ipacket);
-                 usb_packet_unmap(&ehci->ipacket, &ehci->isgl);
-             } else {
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
deleted file mode 100644
index 52121968378..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From c2cb511634012344e3d0fe49a037a33b12d8a98a Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Wed, 11 Nov 2020 18:36:36 +0530
-Subject: [PATCH] hw/net/e1000e: advance desc_offset in case of null
-descriptor
-
-While receiving packets via e1000e_write_packet_to_guest() routine,
-'desc_offset' is advanced only when RX descriptor is processed. And
-RX descriptor is not processed if it has NULL buffer address.
-This may lead to an infinite loop condition. Increament 'desc_offset'
-to process next descriptor in the ring to avoid infinite loop.
-
-Reported-by: Cheol-woo Myung <330cjfdn@gmail.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport
-CVE: CVE-2020-28916
-[https://git.qemu.org/?p=qemu.git;a=commit;h=c2cb511634012344e3d0fe49a037a33b12d8a98a]
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- hw/net/e1000e_core.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
-index bcd186c..d3e3cdc 100644
---- a/hw/net/e1000e_core.c
-+++ b/hw/net/e1000e_core.c
-@@ -1596,13 +1596,13 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
-                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
-                 }
-             }
--            desc_offset += desc_size;
--            if (desc_offset >= total_size) {
--                is_last = true;
--            }
-         } else { /* as per intel docs; skip descriptors with null buf addr */
-             trace_e1000e_rx_null_descriptor();
-         }
-+        desc_offset += desc_size;
-+        if (desc_offset >= total_size) {
-+            is_last = true;
-+        }
- 
-         e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
-                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch
deleted file mode 100644
index e5829f6dadb..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 26 Nov 2020 19:27:06 +0530
-Subject: [PATCH] slirp: check pkt_len before reading protocol header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-While processing ARP/NCSI packets in 'arp_input' or 'ncsi_input'
-routines, ensure that pkt_len is large enough to accommodate the
-respective protocol headers, lest it should do an OOB access.
-Add check to avoid it.
-
-CVE-2020-29129 CVE-2020-29130
-  QEMU: slirp: out-of-bounds access while processing ARP/NCSI packets
- -> https://www.openwall.com/lists/oss-security/2020/11/27/1
-
-Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <20201126135706.273950-1-ppandit@redhat.com>
-Reviewed-by: Marc-AndrÃ Lureau <marcandre.lureau@redhat.com>
-
-Upstream-Status: Backport
-CVE: CVE-2020-29129 CVE-2020-29130
-[https://git.qemu.org/?p=libslirp.git;a=commit;h=2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f]
-Signed-off-by: Li Wang <li.wang@windriver.com>
----
- slirp/src/ncsi.c  | 4 ++++
- slirp/src/slirp.c | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/slirp/src/ncsi.c b/slirp/src/ncsi.c
-index 3c1dfef..75dcc08 100644
---- a/slirp/src/ncsi.c
-+++ b/slirp/src/ncsi.c
-@@ -148,6 +148,10 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
-     uint32_t checksum;
-     uint32_t *pchecksum;
- 
-+    if (pkt_len < ETH_HLEN + sizeof(struct ncsi_pkt_hdr)) {
-+        return; /* packet too short */
-+    }
-+
-     memset(ncsi_reply, 0, sizeof(ncsi_reply));
- 
-     memset(reh->h_dest, 0xff, ETH_ALEN);
-diff --git a/slirp/src/slirp.c b/slirp/src/slirp.c
-index dba7c98..9be58e2 100644
---- a/slirp/src/slirp.c
-+++ b/slirp/src/slirp.c
-@@ -756,6 +756,10 @@ static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
-         return;
-     }
- 
-+    if (pkt_len < ETH_HLEN + sizeof(struct slirp_arphdr)) {
-+        return; /* packet too short */
-+    }
-+
-     ar_op = ntohs(ah->ar_op);
-     switch (ar_op) {
-     case ARPOP_REQUEST:
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/cross.patch b/meta/recipes-devtools/qemu/qemu/cross.patch
new file mode 100644
index 00000000000..438c1ad0862
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/cross.patch
@@ -0,0 +1,30 @@
+We need to be able to trigger configure's cross code but we don't want
+to set cross_prefix as it does other things we don't want. Patch things
+so we can do what we need in the target config case.
+
+Upstream-Status: Inappropriate [may be rewritten in a way upstream may accept?]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+
+Index: qemu-5.2.0/configure
+===================================================================
+--- qemu-5.2.0.orig/configure
++++ qemu-5.2.0/configure
+@@ -6973,7 +6973,6 @@ if has $sdl2_config; then
+ fi
+ echo "strip = [$(meson_quote $strip)]" >> $cross
+ echo "windres = [$(meson_quote $windres)]" >> $cross
+-if test -n "$cross_prefix"; then
+     cross_arg="--cross-file config-meson.cross"
+     echo "[host_machine]" >> $cross
+     if test "$mingw32" = "yes" ; then
+@@ -6999,9 +6998,6 @@ if test -n "$cross_prefix"; then
+     else
+         echo "endian = 'little'" >> $cross
+     fi
+-else
+-    cross_arg="--native-file config-meson.cross"
+-fi
+ mv $cross config-meson.cross
+ 
+ rm -rf meson-private meson-info meson-logs
diff --git a/meta/recipes-devtools/qemu/qemu/find_datadir.patch b/meta/recipes-devtools/qemu/qemu/find_datadir.patch
deleted file mode 100644
index 9a4c11267a5..00000000000
--- a/meta/recipes-devtools/qemu/qemu/find_datadir.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-qemu: search for datadir as in version 4.2
-
-os_find_datadir() was changed after the 4.2 release.  We need to check for
-../share/qemu relative to the executable because that is where the runqemu
-configuration assumes it will be.
-
-Upstream-Status: Submitted [qemu-devel@nongnu.org]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
-Index: qemu-5.1.0/os-posix.c
-===================================================================
---- qemu-5.1.0.orig/os-posix.c
-+++ qemu-5.1.0/os-posix.c
-@@ -82,8 +82,9 @@ void os_setup_signal_handling(void)
- 
- /*
-  * Find a likely location for support files using the location of the binary.
-+ * Typically, this would be "$bindir/../share/qemu".
-  * When running from the build tree this will be "$bindir/../pc-bios".
-- * Otherwise, this is CONFIG_QEMU_DATADIR.
-+ * Otherwise, this is CONFIG_QEMU_DATADIR as constructed by configure.
-  *
-  * The caller must use g_free() to free the returned data when it is
-  * no longer required.
-@@ -96,6 +97,12 @@ char *os_find_datadir(void)
-     exec_dir = qemu_get_exec_dir();
-     g_return_val_if_fail(exec_dir != NULL, NULL);
- 
-+    dir = g_build_filename(exec_dir, "..", "share", "qemu", NULL);
-+    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
-+        return g_steal_pointer(&dir);
-+    }
-+    g_free(dir);  /* no autofree this time */
-+
-     dir = g_build_filename(exec_dir, "..", "pc-bios", NULL);
-     if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
-         return g_steal_pointer(&dir);
diff --git a/meta/recipes-devtools/qemu/qemu/usb-fix-setup_len-init.patch b/meta/recipes-devtools/qemu/qemu/usb-fix-setup_len-init.patch
deleted file mode 100644
index 92801da46fd..00000000000
--- a/meta/recipes-devtools/qemu/qemu/usb-fix-setup_len-init.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-CVE: CVE-2020-14364
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b946434f2659a182afc17e155be6791ebfb302eb Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Tue, 25 Aug 2020 07:36:36 +0200
-Subject: [PATCH] usb: fix setup_len init (CVE-2020-14364)
-
-Store calculated setup_len in a local variable, verify it, and only
-write it to the struct (USBDevice->setup_len) in case it passed the
-sanity checks.
-
-This prevents other code (do_token_{in,out} functions specifically)
-from working with invalid USBDevice->setup_len values and overrunning
-the USBDevice->setup_buf[] buffer.
-
-Fixes: CVE-2020-14364
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Tested-by: Gonglei <arei.gonglei@huawei.com>
-Reviewed-by: Li Qiang <liq3ea@gmail.com>
-Message-id: 20200825053636.29648-1-kraxel@redhat.com
----
- hw/usb/core.c | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/hw/usb/core.c b/hw/usb/core.c
-index 5abd128b6bc..5234dcc73fe 100644
---- a/hw/usb/core.c
-+++ b/hw/usb/core.c
-@@ -129,6 +129,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
- static void do_token_setup(USBDevice *s, USBPacket *p)
- {
-     int request, value, index;
-+    unsigned int setup_len;
- 
-     if (p->iov.size != 8) {
-         p->status = USB_RET_STALL;
-@@ -138,14 +139,15 @@ static void do_token_setup(USBDevice *s, USBPacket *p)
-     usb_packet_copy(p, s->setup_buf, p->iov.size);
-     s->setup_index = 0;
-     p->actual_length = 0;
--    s->setup_len   = (s->setup_buf[7] << 8) | s->setup_buf[6];
--    if (s->setup_len > sizeof(s->data_buf)) {
-+    setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
-+    if (setup_len > sizeof(s->data_buf)) {
-         fprintf(stderr,
-                 "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
--                s->setup_len, sizeof(s->data_buf));
-+                setup_len, sizeof(s->data_buf));
-         p->status = USB_RET_STALL;
-         return;
-     }
-+    s->setup_len = setup_len;
- 
-     request = (s->setup_buf[0] << 8) | s->setup_buf[1];
-     value   = (s->setup_buf[3] << 8) | s->setup_buf[2];
-@@ -259,26 +261,28 @@ static void do_token_out(USBDevice *s, USBPacket *p)
- static void do_parameter(USBDevice *s, USBPacket *p)
- {
-     int i, request, value, index;
-+    unsigned int setup_len;
- 
-     for (i = 0; i < 8; i++) {
-         s->setup_buf[i] = p->parameter >> (i*8);
-     }
- 
-     s->setup_state = SETUP_STATE_PARAM;
--    s->setup_len   = (s->setup_buf[7] << 8) | s->setup_buf[6];
-     s->setup_index = 0;
- 
-     request = (s->setup_buf[0] << 8) | s->setup_buf[1];
-     value   = (s->setup_buf[3] << 8) | s->setup_buf[2];
-     index   = (s->setup_buf[5] << 8) | s->setup_buf[4];
- 
--    if (s->setup_len > sizeof(s->data_buf)) {
-+    setup_len = (s->setup_buf[7] << 8) | s->setup_buf[6];
-+    if (setup_len > sizeof(s->data_buf)) {
-         fprintf(stderr,
-                 "usb_generic_handle_packet: ctrl buffer too small (%d > %zu)\n",
--                s->setup_len, sizeof(s->data_buf));
-+                setup_len, sizeof(s->data_buf));
-         p->status = USB_RET_STALL;
-         return;
-     }
-+    s->setup_len = setup_len;
- 
-     if (p->pid == USB_TOKEN_OUT) {
-         usb_packet_copy(p, s->data_buf, s->setup_len);
diff --git a/meta/recipes-devtools/qemu/qemu_5.1.0.bb b/meta/recipes-devtools/qemu/qemu_5.2.0.bb
similarity index 93%
rename from meta/recipes-devtools/qemu/qemu_5.1.0.bb
rename to meta/recipes-devtools/qemu/qemu_5.2.0.bb
index 599ff82fc12..7afa66e3960 100644
--- a/meta/recipes-devtools/qemu/qemu_5.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_5.2.0.bb
@@ -6,7 +6,7 @@ require qemu.inc
 #            void (*_function)(sigval_t);
 COMPATIBLE_HOST_libc-musl = 'null'
 
-DEPENDS = "glib-2.0 zlib pixman bison-native"
+DEPENDS = "glib-2.0 zlib pixman bison-native ninja-native meson-native"
 
 RDEPENDS_${PN}_class-target += "bash"
 
-- 
2.27.0

