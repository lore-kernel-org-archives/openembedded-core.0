Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.15612.1631124097499196588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VkkVSayc;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id u16so4560381wrn.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sgtO27gDx2QZdYn6kIpSGcwmkwQH90ZdpvfDW1lTnZM=;
        b=VkkVSaycgaStoEtUWIdKXSayKZzK1rlV1G3mR11dv3+LEPHocLM5FtiZxNXMkS+bqI
         sFvNGyMNAq98e/pdMC5+PIMbOiCRw3lSHGy2B9wvoKcmTyAK9aDgKMRjxsRLwIbUXoXF
         RUIoNwx7OJCIGHY65O0bBAemwHO7fJLZYDdAXP+3jTvzGCXT/uQQNsMZKBxhKKygLnFc
         LOUtz5yfiFhpHwZs4FJD/KLmmWFLiXbkma0Db4tHg6HU6VS4B3Icw0P/LYkzUK+TfQXy
         qhPsTKvyEfYcv1NhsQt1vJQcdMUS4H5ViRLotcc7mDwhkp3yItM7UGL9q7qV+8UeSqNG
         ipkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sgtO27gDx2QZdYn6kIpSGcwmkwQH90ZdpvfDW1lTnZM=;
        b=u5tmo/wX1aJpou278yG79xLzYKf4M4Otxqz+TwduAY1iovp5HnjOuJDtONDOYsvLyr
         mIcv0x2CIGQhB8S5YIzMoZx3hpGfkSQl7Fi80HLwz6b0Bbn5gPbC2X/uXP/vPjE3VwFE
         NC4aYzW2Q5/lEbQIMx4bbAs6jzCgEnOtWlkk4IlfdAmwrQKt+57kMYhhzjM6qCCXqp/H
         nN1mCiKCQq/AA6fF7d1urp+WRsRY0PivxCudyPck3FWSecKaEVikphDeFgYgkUulmiN7
         xb8dfaL1BuUDihyCze19//FI+vHXJ6rOuRYEGaLRk9ulI+vM97okhay0Udjv7tII9W/b
         XUFA==
X-Gm-Message-State: AOAM533PkdT4rU6LaXhR6ny9iGmLmKknHo81BlkPzdrWREY39se15EI5
	ApSnu4rdDdyeisSleNv55bIFL5qL+r4=
X-Google-Smtp-Source: ABdhPJx9nfgf9iNKf+idjQ2cAJVI+RbbC24H3a+sNOsxERUOpMFmxdjjmDLbyO4hRixcV9/+UnbeLA==
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr5580742wrh.356.1631124095815;
        Wed, 08 Sep 2021 11:01:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/26] qemu: update 6.0.0 -> 6.1.0
Date: Wed,  8 Sep 2021 20:01:09 +0200
Message-Id: <20210908180125.103473-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recipe changes:
qemu-plugin.h is installed by both qemu-native and qemu-system-native

qmp.py module is now provided in a module directory (no other files
from that directory are necessary to use it though)

additional host-specific info is stripeed from ptest tests/tcg/*.mak

Patches:
drop all backports

drop 0001-Add-enable-disable-udev.patch (change added upstream)

drop 0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch
(issue fixed upstream)

drop 0004-qemu-disable-Valgrind.patch (valgrind detection moved
from configure to meson, and should be robust against host contamination)

rebase 0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
(upstream moved libgcrypt handling from configure to meson, and using
pkg-config is now a one-liner adjustment)

rebase cross.patch

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...u-native_6.0.0.bb => qemu-native_6.1.0.bb} |  0
 ...e_6.0.0.bb => qemu-system-native_6.1.0.bb} |  3 +-
 meta/recipes-devtools/qemu/qemu.inc           | 19 +---
 .../qemu/0001-Add-enable-disable-udev.patch   | 29 -------
 ...igure-fix-detection-of-gdbus-codegen.patch | 50 -----------
 ...nux-user-Tag-vsx-with-ieee128-fpbits.patch | 35 --------
 ...ix-memory-disclosure-in-virgl_cmd_ge.patch | 43 ---------
 ...ix-resource-leak-in-vg_resource_crea.patch | 41 ---------
 ...ix-memory-leak-in-vg_resource_attach.patch | 48 ----------
 .../qemu/0004-qemu-disable-Valgrind.patch     | 34 --------
 ...ix-memory-leak-while-calling-vg_reso.patch | 50 -----------
 ...ix-memory-leak-in-virgl_cmd_resource.patch | 58 -------------
 ...ix-memory-leak-in-virgl_resource_att.patch | 49 -----------
 ...ix-OOB-write-in-virgl_cmd_get_capset.patch | 49 -----------
 ...dd-pkg-config-handling-for-libgcrypt.patch | 87 ++++---------------
 .../qemu/qemu/CVE-2021-3527-1.patch           | 42 ---------
 .../qemu/qemu/CVE-2021-3527-2.patch           | 59 -------------
 .../qemu/qemu/CVE-2021-3682.patch             | 41 ---------
 meta/recipes-devtools/qemu/qemu/cross.patch   | 40 +++++----
 .../qemu/{qemu_6.0.0.bb => qemu_6.1.0.bb}     |  0
 21 files changed, 48 insertions(+), 731 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_6.0.0.bb => qemu-native_6.1.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_6.0.0.bb => qemu-system-native_6.1.0.bb} (88%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-fix-memory-disclosure-in-virgl_cmd_ge.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-fix-resource-leak-in-vg_resource_crea.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-fix-memory-leak-in-vg_resource_attach.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-fix-memory-leak-while-calling-vg_reso.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resource.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-fix-memory-leak-in-virgl_resource_att.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
 rename meta/recipes-devtools/qemu/{qemu_6.0.0.bb => qemu_6.1.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 80b03305bb..ada27b8746 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.37%"
 GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.34"
 LINUXLIBCVERSION ?= "5.13%"
-QEMUVERSION ?= "6.0%"
+QEMUVERSION ?= "6.1%"
 GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
diff --git a/meta/recipes-devtools/qemu/qemu-native_6.0.0.bb b/meta/recipes-devtools/qemu/qemu-native_6.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_6.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_6.1.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_6.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/qemu/qemu-system-native_6.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb
index 1c12eb7cf2..61dbd05efb 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_6.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb
@@ -25,7 +25,8 @@ do_install:append() {
     rm -f ${D}${datadir}/qemu/trace-events-all
     rm -rf ${D}${datadir}/qemu/keymaps
     rm -rf ${D}${datadir}/icons/
+    rm -rf ${D}${includedir}/qemu-plugin.h
 
     # Install qmp.py to be used with testimage
-    install -D ${S}/python/qemu/qmp.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp.py
+    install -D ${S}/python/qemu/qmp/__init__.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp.py
 }
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 76e8da159c..f85befa0ae 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -19,31 +19,17 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0001-qemu-Add-missing-wacom-HID-descriptor.patch \
            file://0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
-           file://0004-qemu-disable-Valgrind.patch \
            file://0006-chardev-connect-socket-to-a-spawned-command.patch \
            file://0007-apic-fixup-fallthrough-to-PIC.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
-           file://0001-Add-enable-disable-udev.patch \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://mmap2.patch \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
-           file://0001-configure-fix-detection-of-gdbus-codegen.patch \
-           file://0001-vhost-user-gpu-fix-memory-disclosure-in-virgl_cmd_ge.patch \
-           file://0002-vhost-user-gpu-fix-resource-leak-in-vg_resource_crea.patch \
-           file://0003-vhost-user-gpu-fix-memory-leak-in-vg_resource_attach.patch \
-           file://0004-vhost-user-gpu-fix-memory-leak-while-calling-vg_reso.patch \
-           file://0005-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resource.patch \
-           file://0006-vhost-user-gpu-fix-memory-leak-in-virgl_resource_att.patch \
-           file://0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch \
-           file://0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch \
-           file://CVE-2021-3527-1.patch \
-           file://CVE-2021-3527-2.patch \
-           file://CVE-2021-3682.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "87bc1a471ca24b97e7005711066007d443423d19aacda3d442558ae032fa30b9"
+SRC_URI[sha256sum] = "eebc089db3414bbeedf1e464beda0a7515aad30f73261abc246c9b27503a3c96"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
@@ -80,6 +66,9 @@ do_install_ptest() {
 
 	# Strip the paths from the QEMU variable, we can use PATH
 	sed -i -e "s#^QEMU=.*/qemu-#QEMU=qemu-#g" ${D}${PTEST_PATH}/tests/tcg/*.mak
+
+        # Strip compiler flags as they break reproducibility
+        sed -i -e "s,CROSS_CC_GUEST=.*,CROSS_CC_GUEST=," ${D}${PTEST_PATH}/tests/tcg/*.mak
 }
 
 # QEMU_TARGETS is overridable variable
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
deleted file mode 100644
index 4b37967e7a..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b921e5204030845dc7c9d16d5f66d965e8d05367 Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Thu, 19 Mar 2020 11:54:26 -0700
-Subject: [PATCH] Add enable/disable libudev
-
-Upstream-Status: Pending
-Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
-
-[update patch context]
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- configure | 4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: qemu-6.0.0/configure
-===================================================================
---- qemu-6.0.0.orig/configure
-+++ qemu-6.0.0/configure
-@@ -1565,6 +1565,10 @@ for opt do
-   ;;
-   --disable-gio) gio=no
-   ;;
-+  --enable-libudev) libudev="yes"
-+  ;;
-+  --disable-libudev) libudev="no"
-+  ;;
-   *)
-       echo "ERROR: unknown option $opt"
-       echo "Try '$0 --help' for more information"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch b/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch
deleted file mode 100644
index 8bffc31293..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 464cfc64201b21386030b8f353fe9724a3413a85 Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Wed, 5 May 2021 10:15:34 -0400
-Subject: [PATCH] configure: fix detection of gdbus-codegen
-
-"pkg-config --variable=gdbus_codegen gio-2.0" returns "gdbus-codegen",
-and it does not pass test -x (which does not walk the path).
-
-Meson 0.58.0 notices that something is iffy, as the dbus_vmstate1
-assignment in tests/qtest/meson.build uses an empty string as the
-command, and fails very eloquently:
-
-../tests/qtest/meson.build:92:2: ERROR: No program name specified.
-
-Use the "has" function instead of test -x, and fix the generation
-of config-host.mak since meson.build expects that GDBUS_CODEGEN
-is absent, rather than empty, if the tool is unavailable.
-
-Reported-by: Sebastian Mitterle <smitterl@redhat.com>
-Fixes: #178
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5ecfb76ccc056eb6127e44268e475827ae73b9e0]
-(not in 6.0.0, should be kept when upgrading)
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-Index: qemu-6.0.0/configure
-===================================================================
---- qemu-6.0.0.orig/configure
-+++ qemu-6.0.0/configure
-@@ -3366,7 +3366,7 @@ if ! test "$gio" = "no"; then
-         gio_cflags=$($pkg_config --cflags gio-2.0)
-         gio_libs=$($pkg_config --libs gio-2.0)
-         gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
--        if [ ! -x "$gdbus_codegen" ]; then
-+        if ! has "$gdbus_codegen"; then
-             gdbus_codegen=
-         fi
-         # Check that the libraries actually work -- Ubuntu 18.04 ships
-@@ -5704,6 +5704,8 @@ if test "$gio" = "yes" ; then
-     echo "CONFIG_GIO=y" >> $config_host_mak
-     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
-     echo "GIO_LIBS=$gio_libs" >> $config_host_mak
-+fi
-+if test "$gdbus_codegen" != "" ; then
-     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
- fi
- echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch
deleted file mode 100644
index 11b6e3c678..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-Tag-vsx-with-ieee128-fpbits.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c5844a4cdee37268c9b65a65e6968ee129bb742d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Jun 2021 10:27:17 -0700
-Subject: [PATCH] linux-user: Tag vsx with ieee128 fpbits
-
-In OE we need this for ppc64le usermode to work since we generate 128bit
-long doubles and glibc 2.34 is now checking for this in hwcaps at
-runtime and failing to run the binary if machine does not support 128bit
-IEEE fp
-
-Fixes
-Fatal glibc error: CPU lacks float128 support (POWER 9 or later required)
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- linux-user/elfload.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/linux-user/elfload.c b/linux-user/elfload.c
-index 17ab06f612..e7dd18fd40 100644
---- a/linux-user/elfload.c
-+++ b/linux-user/elfload.c
-@@ -830,7 +830,7 @@ static uint32_t get_elf_hwcap2(void)
-                   PPC2_ISA207S), QEMU_PPC_FEATURE2_ARCH_2_07 |
-                   QEMU_PPC_FEATURE2_VEC_CRYPTO);
-     GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
--                 QEMU_PPC_FEATURE2_DARN);
-+                 QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
- 
- #undef GET_FEATURE
- #undef GET_FEATURE2
--- 
-2.32.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-fix-memory-disclosure-in-virgl_cmd_ge.patch b/meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-fix-memory-disclosure-in-virgl_cmd_ge.patch
deleted file mode 100644
index 981c237292..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-vhost-user-gpu-fix-memory-disclosure-in-virgl_cmd_ge.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-CVE: CVE-2021-3545
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 121841b25d72d13f8cad554363138c360f1250ea Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@163.com>
-Date: Sat, 15 May 2021 20:03:56 -0700
-Subject: [PATCH 1/7] vhost-user-gpu: fix memory disclosure in
- virgl_cmd_get_capset_info (CVE-2021-3545)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Otherwise some of the 'resp' will be leaked to guest.
-
-Fixes: CVE-2021-3545
-Reported-by: Li Qiang <liq3ea@163.com>
-virtio-gpu fix: 42a8dadc74 ("virtio-gpu: fix information leak
-in getting capset info dispatch")
-
-Signed-off-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210516030403.107723-2-liq3ea@163.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- contrib/vhost-user-gpu/virgl.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
-index 9e6660c7ab..6a332d601f 100644
---- a/contrib/vhost-user-gpu/virgl.c
-+++ b/contrib/vhost-user-gpu/virgl.c
-@@ -128,6 +128,7 @@ virgl_cmd_get_capset_info(VuGpu *g,
- 
-     VUGPU_FILL_CMD(info);
- 
-+    memset(&resp, 0, sizeof(resp));
-     if (info.capset_index == 0) {
-         resp.capset_id = VIRTIO_GPU_CAPSET_VIRGL;
-         virgl_renderer_get_cap_set(resp.capset_id,
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-fix-resource-leak-in-vg_resource_crea.patch b/meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-fix-resource-leak-in-vg_resource_crea.patch
deleted file mode 100644
index a9aee47e39..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-vhost-user-gpu-fix-resource-leak-in-vg_resource_crea.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-CVE: CVE-2021-3544
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 86dd8fac2acc366930a5dc08d3fb1b1e816f4e1e Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@163.com>
-Date: Sat, 15 May 2021 20:03:57 -0700
-Subject: [PATCH 2/7] vhost-user-gpu: fix resource leak in
- 'vg_resource_create_2d' (CVE-2021-3544)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Call 'vugbm_buffer_destroy' in error path to avoid resource leak.
-
-Fixes: CVE-2021-3544
-Reported-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210516030403.107723-3-liq3ea@163.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
-index f73f292c9f..b5e153d0d6 100644
---- a/contrib/vhost-user-gpu/vhost-user-gpu.c
-+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
-@@ -349,6 +349,7 @@ vg_resource_create_2d(VuGpu *g,
-         g_critical("%s: resource creation failed %d %d %d",
-                    __func__, c2d.resource_id, c2d.width, c2d.height);
-         g_free(res);
-+        vugbm_buffer_destroy(&res->buffer);
-         cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
-         return;
-     }
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-fix-memory-leak-in-vg_resource_attach.patch b/meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-fix-memory-leak-in-vg_resource_attach.patch
deleted file mode 100644
index 1718486405..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0003-vhost-user-gpu-fix-memory-leak-in-vg_resource_attach.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-CVE: CVE-2021-3544
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b9f79858a614d95f5de875d0ca31096eaab72c3b Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@163.com>
-Date: Sat, 15 May 2021 20:03:58 -0700
-Subject: [PATCH 3/7] vhost-user-gpu: fix memory leak in
- vg_resource_attach_backing (CVE-2021-3544)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Check whether the 'res' has already been attach_backing to avoid
-memory leak.
-
-Fixes: CVE-2021-3544
-Reported-by: Li Qiang <liq3ea@163.com>
-virtio-gpu fix: 204f01b309 ("virtio-gpu: fix memory leak
-in resource attach backing")
-
-Signed-off-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210516030403.107723-4-liq3ea@163.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- contrib/vhost-user-gpu/vhost-user-gpu.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
-index b5e153d0d6..0437e52b64 100644
---- a/contrib/vhost-user-gpu/vhost-user-gpu.c
-+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
-@@ -489,6 +489,11 @@ vg_resource_attach_backing(VuGpu *g,
-         return;
-     }
- 
-+    if (res->iov) {
-+        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
-+        return;
-+    }
-+
-     ret = vg_create_mapping_iov(g, &ab, cmd, &res->iov);
-     if (ret != 0) {
-         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
deleted file mode 100644
index 330bcaef0a..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4127296bb1046cdf73994ba69dc913d8c02fd74f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 20 Oct 2015 22:19:08 +0100
-Subject: [PATCH] qemu: disable Valgrind
-
-There isn't an option to enable or disable valgrind support, so disable it to avoid non-deterministic builds.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- configure | 9 ---------
- 1 file changed, 9 deletions(-)
-
-Index: qemu-6.0.0/configure
-===================================================================
---- qemu-6.0.0.orig/configure
-+++ qemu-6.0.0/configure
-@@ -4648,15 +4648,6 @@ fi
- # check if we have valgrind/valgrind.h
- 
- valgrind_h=no
--cat > $TMPC << EOF
--#include <valgrind/valgrind.h>
--int main(void) {
--  return 0;
--}
--EOF
--if compile_prog "" "" ; then
--    valgrind_h=yes
--fi
- 
- ########################################
- # check if environ is declared
diff --git a/meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-fix-memory-leak-while-calling-vg_reso.patch b/meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-fix-memory-leak-while-calling-vg_reso.patch
deleted file mode 100644
index 9fc2fafe1d..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0004-vhost-user-gpu-fix-memory-leak-while-calling-vg_reso.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-CVE: CVE-2021-3544
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b7afebcf9e6ecf3cf9b5a9b9b731ed04bca6aa3e Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@163.com>
-Date: Sat, 15 May 2021 20:03:59 -0700
-Subject: [PATCH 4/7] vhost-user-gpu: fix memory leak while calling
- 'vg_resource_unref' (CVE-2021-3544)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If the guest trigger following sequences, the attach_backing will be leaked:
-
-	vg_resource_create_2d
-	vg_resource_attach_backing
-	vg_resource_unref
-
-This patch fix this by freeing 'res->iov' in vg_resource_destroy.
-
-Fixes: CVE-2021-3544
-Reported-by: Li Qiang <liq3ea@163.com>
-virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
-in virgl_cmd_resource_unref")
-
-Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210516030403.107723-5-liq3ea@163.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
-index 0437e52b64..770dfad529 100644
---- a/contrib/vhost-user-gpu/vhost-user-gpu.c
-+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
-@@ -400,6 +400,7 @@ vg_resource_destroy(VuGpu *g,
-     }
- 
-     vugbm_buffer_destroy(&res->buffer);
-+    g_free(res->iov);
-     pixman_image_unref(res->image);
-     QTAILQ_REMOVE(&g->reslist, res, next);
-     g_free(res);
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resource.patch b/meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resource.patch
deleted file mode 100644
index e70f3c02c2..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0005-vhost-user-gpu-fix-memory-leak-in-virgl_cmd_resource.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-CVE: CVE-2021-3544
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From f6091d86ba9ea05f4e111b9b42ee0005c37a6779 Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@163.com>
-Date: Sat, 15 May 2021 20:04:00 -0700
-Subject: [PATCH 5/7] vhost-user-gpu: fix memory leak in
- 'virgl_cmd_resource_unref' (CVE-2021-3544)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The 'res->iov' will be leaked if the guest trigger following sequences:
-
-	virgl_cmd_create_resource_2d
-	virgl_resource_attach_backing
-	virgl_cmd_resource_unref
-
-This patch fixes this.
-
-Fixes: CVE-2021-3544
-Reported-by: Li Qiang <liq3ea@163.com>
-virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
-in virgl_cmd_resource_unref"
-
-Signed-off-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210516030403.107723-6-liq3ea@163.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- contrib/vhost-user-gpu/virgl.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
-index 6a332d601f..c669d73a1d 100644
---- a/contrib/vhost-user-gpu/virgl.c
-+++ b/contrib/vhost-user-gpu/virgl.c
-@@ -108,9 +108,16 @@ virgl_cmd_resource_unref(VuGpu *g,
-                          struct virtio_gpu_ctrl_command *cmd)
- {
-     struct virtio_gpu_resource_unref unref;
-+    struct iovec *res_iovs = NULL;
-+    int num_iovs = 0;
- 
-     VUGPU_FILL_CMD(unref);
- 
-+    virgl_renderer_resource_detach_iov(unref.resource_id,
-+                                       &res_iovs,
-+                                       &num_iovs);
-+    g_free(res_iovs);
-+
-     virgl_renderer_resource_unref(unref.resource_id);
- }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-fix-memory-leak-in-virgl_resource_att.patch b/meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-fix-memory-leak-in-virgl_resource_att.patch
deleted file mode 100644
index 5efb87ca33..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0006-vhost-user-gpu-fix-memory-leak-in-virgl_resource_att.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-CVE: CVE-2021-3544
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 63736af5a6571d9def93769431e0d7e38c6677bf Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@163.com>
-Date: Sat, 15 May 2021 20:04:01 -0700
-Subject: [PATCH 6/7] vhost-user-gpu: fix memory leak in
- 'virgl_resource_attach_backing' (CVE-2021-3544)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If 'virgl_renderer_resource_attach_iov' failed, the 'res_iovs' will
-be leaked.
-
-Fixes: CVE-2021-3544
-Reported-by: Li Qiang <liq3ea@163.com>
-virtio-gpu fix: 33243031da ("virtio-gpu-3d: fix memory leak
-in resource attach backing")
-
-Signed-off-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210516030403.107723-7-liq3ea@163.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- contrib/vhost-user-gpu/virgl.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
-index c669d73a1d..a16a311d80 100644
---- a/contrib/vhost-user-gpu/virgl.c
-+++ b/contrib/vhost-user-gpu/virgl.c
-@@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,
-         return;
-     }
- 
--    virgl_renderer_resource_attach_iov(att_rb.resource_id,
-+    ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
-                                        res_iovs, att_rb.nr_entries);
-+    if (ret != 0) {
-+        g_free(res_iovs);
-+    }
- }
- 
- static void
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch b/meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch
deleted file mode 100644
index 33e6a66193..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0007-vhost-user-gpu-fix-OOB-write-in-virgl_cmd_get_capset.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-CVE: CVE-2021-3546
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 9f22893adcb02580aee5968f32baa2cd109b3ec2 Mon Sep 17 00:00:00 2001
-From: Li Qiang <liq3ea@163.com>
-Date: Sat, 15 May 2021 20:04:02 -0700
-Subject: [PATCH 7/7] vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
- (CVE-2021-3546)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If 'virgl_cmd_get_capset' set 'max_size' to 0,
-the 'virgl_renderer_fill_caps' will write the data after the 'resp'.
-This patch avoid this by checking the returned 'max_size'.
-
-virtio-gpu fix: abd7f08b23 ("display: virtio-gpu-3d: check
-virgl capabilities max_size")
-
-Fixes: CVE-2021-3546
-Reported-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
-Signed-off-by: Li Qiang <liq3ea@163.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210516030403.107723-8-liq3ea@163.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
----
- contrib/vhost-user-gpu/virgl.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
-index a16a311d80..7172104b19 100644
---- a/contrib/vhost-user-gpu/virgl.c
-+++ b/contrib/vhost-user-gpu/virgl.c
-@@ -177,6 +177,10 @@ virgl_cmd_get_capset(VuGpu *g,
- 
-     virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
-                                &max_size);
-+    if (!max_size) {
-+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
-+        return;
-+    }
-     resp = g_malloc0(sizeof(*resp) + max_size);
- 
-     resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
index cc6a5fe754..4298964dfa 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -1,4 +1,4 @@
-From c207607cdf3996ad9783c3bffbcd3d65e74c0158 Mon Sep 17 00:00:00 2001
+From b51e6dd833172954c718bd600d846540eeb07220 Mon Sep 17 00:00:00 2001
 From: He Zhe <zhe.he@windriver.com>
 Date: Wed, 28 Aug 2019 19:56:28 +0800
 Subject: [PATCH] configure: Add pkg-config handling for libgcrypt
@@ -11,74 +11,19 @@ Upstream-Status: Denied [https://lists.nongnu.org/archive/html/qemu-devel/2019-0
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 
 ---
- configure | 48 ++++++++++++++++++++++++++++++++++++++++--------
- 1 file changed, 40 insertions(+), 8 deletions(-)
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-6.0.0/configure
-===================================================================
---- qemu-6.0.0.orig/configure
-+++ qemu-6.0.0/configure
-@@ -2847,6 +2847,30 @@ has_libgcrypt() {
-     return 0
- }
- 
-+has_libgcrypt_pkgconfig() {
-+    if ! has $pkg_config ; then
-+        return 1
-+    fi
-+
-+    if ! $pkg_config --list-all | grep libgcrypt > /dev/null 2>&1 ; then
-+        return 1
-+    fi
-+
-+    if test -n "$cross_prefix" ; then
-+        host=$($pkg_config --variable=host libgcrypt)
-+        if test "${host%-gnu}-" != "${cross_prefix%-gnu}" ; then
-+            print_error "host($host) does not match cross_prefix($cross_prefix)"
-+            return 1
-+        fi
-+    fi
-+
-+    if ! $pkg_config --atleast-version=1.5.0 libgcrypt ; then
-+        print_error "libgcrypt version is $($pkg_config --modversion libgcrypt)"
-+        return 1
-+    fi
-+
-+    return 0
-+}
- 
- if test "$nettle" != "no"; then
-     pass="no"
-@@ -2885,7 +2909,14 @@ fi
- 
- if test "$gcrypt" != "no"; then
-     pass="no"
--    if has_libgcrypt; then
-+    if has_libgcrypt_pkgconfig; then
-+        gcrypt_cflags=$($pkg_config --cflags libgcrypt)
-+        if test "$static" = "yes" ; then
-+            gcrypt_libs=$($pkg_config --libs --static libgcrypt)
-+        else
-+            gcrypt_libs=$($pkg_config --libs libgcrypt)
-+        fi
-+    elif has_libgcrypt; then
-         gcrypt_cflags=$(libgcrypt-config --cflags)
-         gcrypt_libs=$(libgcrypt-config --libs)
-         # Debian has removed -lgpg-error from libgcrypt-config
-@@ -2895,12 +2926,12 @@ if test "$gcrypt" != "no"; then
-         then
-             gcrypt_libs="$gcrypt_libs -lgpg-error"
-         fi
-+    fi
- 
--        # Link test to make sure the given libraries work (e.g for static).
--        write_c_skeleton
--        if compile_prog "" "$gcrypt_libs" ; then
-+    # Link test to make sure the given libraries work (e.g for static).
-+    write_c_skeleton
-+    if compile_prog "" "$gcrypt_libs" ; then
-             pass="yes"
--        fi
-     fi
-     if test "$pass" = "yes"; then
-         gcrypt="yes"
+diff --git a/meson.build b/meson.build
+index b3e7ec0e9..4cbe715b7 100644
+--- a/meson.build
++++ b/meson.build
+@@ -874,7 +874,7 @@ endif
+ if not gnutls_crypto.found()
+   if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
+     gcrypt = dependency('libgcrypt', version: '>=1.8',
+-                        method: 'config-tool',
++                        method: 'pkg-config',
+                         required: get_option('gcrypt'),
+                         kwargs: static_kwargs)
+     # Debian has removed -lgpg-error from libgcrypt-config
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
deleted file mode 100644
index 77a5385692..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-1.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 05a40b172e4d691371534828078be47e7fff524c Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 3 May 2021 15:29:15 +0200
-Subject: [PATCH] usb: limit combined packets to 1 MiB (CVE-2021-3527)
-
-usb-host and usb-redirect try to batch bulk transfers by combining many
-small usb packets into a single, large transfer request, to reduce the
-overhead and improve performance.
-
-This patch adds a size limit of 1 MiB for those combined packets to
-restrict the host resources the guest can bind that way.
-
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Message-Id: <20210503132915.2335822-6-kraxel@redhat.com>
-
-Upstream-Status: Backport
-https://gitlab.com/qemu-project/qemu/-/commit/05a40b172e4d691371534828078be47e7fff524c
-CVE: CVE-2021-3527
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- hw/usb/combined-packet.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/hw/usb/combined-packet.c b/hw/usb/combined-packet.c
-index 5d57e883dc..e56802f89a 100644
---- a/hw/usb/combined-packet.c
-+++ b/hw/usb/combined-packet.c
-@@ -171,7 +171,9 @@ void usb_ep_combine_input_packets(USBEndpoint *ep)
-         if ((p->iov.size % ep->max_packet_size) != 0 || !p->short_not_ok ||
-                 next == NULL ||
-                 /* Work around for Linux usbfs bulk splitting + migration */
--                (totalsize == (16 * KiB - 36) && p->int_req)) {
-+                (totalsize == (16 * KiB - 36) && p->int_req) ||
-+                /* Next package may grow combined package over 1MiB */
-+                totalsize > 1 * MiB - ep->max_packet_size) {
-             usb_device_handle_data(ep->dev, first);
-             assert(first->status == USB_RET_ASYNC);
-             if (first->combined) {
--- 
-GitLab
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch
deleted file mode 100644
index 6371aced12..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3527-2.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 7ec54f9eb62b5d177e30eb8b1cad795a5f8d8986 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 3 May 2021 15:29:12 +0200
-Subject: [PATCH] usb/redir: avoid dynamic stack allocation (CVE-2021-3527)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use autofree heap allocation instead.
-
-Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Message-Id: <20210503132915.2335822-3-kraxel@redhat.com>
-
-Upstream-Status: Backport
-https://gitlab.com/qemu-project/qemu/-/commit/7ec54f9eb62b5d177e30eb8b1cad795a5f8d8986
-CVE: CVE-2021-3527
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- hw/usb/redirect.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
-index 17f06f3417..6a75b0dc4a 100644
---- a/hw/usb/redirect.c
-+++ b/hw/usb/redirect.c
-@@ -620,7 +620,7 @@ static void usbredir_handle_iso_data(USBRedirDevice *dev, USBPacket *p,
-                 .endpoint = ep,
-                 .length = p->iov.size
-             };
--            uint8_t buf[p->iov.size];
-+            g_autofree uint8_t *buf = g_malloc(p->iov.size);
-             /* No id, we look at the ep when receiving a status back */
-             usb_packet_copy(p, buf, p->iov.size);
-             usbredirparser_send_iso_packet(dev->parser, 0, &iso_packet,
-@@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
-         usbredirparser_send_bulk_packet(dev->parser, p->id,
-                                         &bulk_packet, NULL, 0);
-     } else {
--        uint8_t buf[size];
-+        g_autofree uint8_t *buf = g_malloc(size);
-         usb_packet_copy(p, buf, size);
-         usbredir_log_data(dev, "bulk data out:", buf, size);
-         usbredirparser_send_bulk_packet(dev->parser, p->id,
-@@ -923,7 +923,7 @@ static void usbredir_handle_interrupt_out_data(USBRedirDevice *dev,
-                                                USBPacket *p, uint8_t ep)
- {
-     struct usb_redir_interrupt_packet_header interrupt_packet;
--    uint8_t buf[p->iov.size];
-+    g_autofree uint8_t *buf = g_malloc(p->iov.size);
- 
-     DPRINTF("interrupt-out ep %02X len %zd id %"PRIu64"\n", ep,
-             p->iov.size, p->id);
--- 
-GitLab
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
deleted file mode 100644
index 50a49233d3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5e796671e6b8d5de4b0b423dce1b3eba144a92c9 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 22 Jul 2021 09:27:56 +0200
-Subject: [PATCH] usbredir: fix free call
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-data might point into the middle of a larger buffer, there is a separate
-free_on_destroy pointer passed into bufp_alloc() to handle that.  It is
-only used in the normal workflow though, not when dropping packets due
-to the queue being full.  Fix that.
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/491
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Message-Id: <20210722072756.647673-1-kraxel@redhat.com>
-
-CVE: CVE-2021-3682
-Upstream-Status: Backport [5e796671e6b8d5de4b0b423dce1b3eba144a92c9]
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/usb/redirect.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
-index 4ec9326e05..1ec909a63a 100644
---- a/hw/usb/redirect.c
-+++ b/hw/usb/redirect.c
-@@ -476,7 +476,7 @@ static int bufp_alloc(USBRedirDevice *dev, uint8_t *data, uint16_t len,
-     if (dev->endpoint[EP2I(ep)].bufpq_dropping_packets) {
-         if (dev->endpoint[EP2I(ep)].bufpq_size >
-                 dev->endpoint[EP2I(ep)].bufpq_target_size) {
--            free(data);
-+            free(free_on_destroy);
-             return -1;
-         }
-         dev->endpoint[EP2I(ep)].bufpq_dropping_packets = 0;
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/cross.patch b/meta/recipes-devtools/qemu/qemu/cross.patch
index a0fc39e5e2..bdb77ec7d0 100644
--- a/meta/recipes-devtools/qemu/qemu/cross.patch
+++ b/meta/recipes-devtools/qemu/qemu/cross.patch
@@ -1,30 +1,40 @@
+From f51ece86f84c877f255746cba22a6745f37d2b7f Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 5 Jan 2021 23:00:14 +0000
+Subject: [PATCH] qemu: Upgrade 5.1.0->5.2.0
+
 We need to be able to trigger configure's cross code but we don't want
 to set cross_prefix as it does other things we don't want. Patch things
 so we can do what we need in the target config case.
 
 Upstream-Status: Inappropriate [may be rewritten in a way upstream may accept?]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ configure | 4 ----
+ 1 file changed, 4 deletions(-)
 
-
-Index: qemu-6.0.0/configure
-===================================================================
---- qemu-6.0.0.orig/configure
-+++ qemu-6.0.0/configure
-@@ -6371,7 +6371,6 @@ if has $sdl2_config; then
- fi
- echo "strip = [$(meson_quote $strip)]" >> $cross
- echo "windres = [$(meson_quote $windres)]" >> $cross
--if test "$cross_compile" = "yes"; then
+diff --git a/configure b/configure
+index 9a79a004d..563b7827f 100755
+--- a/configure
++++ b/configure
+@@ -5128,7 +5128,6 @@ if test "$skip_meson" = no; then
+   fi
+   echo "strip = [$(meson_quote $strip)]" >> $cross
+   echo "windres = [$(meson_quote $windres)]" >> $cross
+-  if test "$cross_compile" = "yes"; then
      cross_arg="--cross-file config-meson.cross"
      echo "[host_machine]" >> $cross
      if test "$mingw32" = "yes" ; then
-@@ -6403,9 +6402,6 @@ if test "$cross_compile" = "yes"; then
+@@ -5160,9 +5159,6 @@ if test "$skip_meson" = no; then
      else
          echo "endian = 'little'" >> $cross
      fi
--else
+-  else
 -    cross_arg="--native-file config-meson.cross"
--fi
- mv $cross config-meson.cross
+-  fi
+   mv $cross config-meson.cross
  
- rm -rf meson-private meson-info meson-logs
+   rm -rf meson-private meson-info meson-logs
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_6.0.0.bb b/meta/recipes-devtools/qemu/qemu_6.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_6.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_6.1.0.bb
-- 
2.31.1

