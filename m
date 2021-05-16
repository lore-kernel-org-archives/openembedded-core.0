Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3312.1621149672134182037
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 00:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ikWyoHsx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so945804wmf.5
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 00:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oCVVg8ustLwIoFcBB4X97IbTdqcthC3+27+Hx1EcWkE=;
        b=ikWyoHsxopcp3gVgjyud8cKR8hfnWdLKhAtwjj6qglQ1HPfxlXCjm0mE5a8/FgxbqD
         dOHFm93iEyQimAeLhH/j45eYr26xcdSqejhtjpvT/jdoHgzpAYNqafCP7kYKA4OfAuxj
         kUY+z7j3jwJ6h0bDSwYGiQVr5rCzXrUicsGSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oCVVg8ustLwIoFcBB4X97IbTdqcthC3+27+Hx1EcWkE=;
        b=XKKVqbuP38YYFVkCQshvTuVRxDm/mr3hOBZ2986fsfiJoQrJg1afHsvrMmE92FgFWa
         6mxR6x5M5/eDqG0LmefUoR8gSOQa9kvzP/cs2dT7kdmebif0RnjwGcIM1OG9q9yr/K8+
         7fvTYP0MxgHSOgCfGKXRiMd4jfz+cd13AW0DfEGpLuRIUQjBwKoYHOfggvJasJC6HUco
         WnbM5FfWxbFo2ON2tUKwiFXTKIIcKWLbe+SkDBwvLzZ+/mSKFZfSdesp3vT+rRm4zWRY
         nQUnzwLYs/3HJTfCbiTIhZrHAsOns6zx3Sp14CZg41licUJsGl6CDVreb0rvISbfDD3f
         ExiQ==
X-Gm-Message-State: AOAM532CanVVvMBulvzN5z4dME4qAViecXTVrH8mHsGXKEZfdUMXhum8
	ttkLURPbVzTmgaaK4Lic6wxzcHWkrYAhWg==
X-Google-Smtp-Source: ABdhPJwuRZSArW/HHKrnmNeah6LaZVs+7qRuNLqhG5RrO1XFHMwPdV5xl6P7SGPgdyOhmbVog/ePcw==
X-Received: by 2002:a1c:50:: with SMTP id 77mr20743588wma.111.1621149668115;
        Sun, 16 May 2021 00:21:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:22d7:8af4:80b5:c062])
        by smtp.gmail.com with ESMTPSA id t7sm5718810wrs.87.2021.05.16.00.21.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 00:21:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] qemu: Upgrade 5.2.0 -> 6.0.0
Date: Sun, 16 May 2021 08:21:03 +0100
Message-Id: <20210516072106.2379894-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building without PIE support seems broken upstream, enable it by default
to match the configuration others evidently us.

Tweak git submodule option to match upstream.

Drop backported/merged patches, refresh others.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...u-native_5.2.0.bb => qemu-native_6.0.0.bb} |   2 +-
 ...e_5.2.0.bb => qemu-system-native_6.0.0.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  35 +-
 .../qemu/0001-Add-enable-disable-udev.patch   |  10 +-
 ...igure-fix-detection-of-gdbus-codegen.patch |  31 +-
 ...emu-Add-missing-wacom-HID-descriptor.patch |   6 +-
 ...mu-Do-not-include-file-if-not-exists.patch |  10 +-
 ...d-use-relative-path-to-refer-to-file.patch |  15 +-
 ...n-environment-space-to-boot-loader-q.patch |  12 +-
 .../qemu/0004-qemu-disable-Valgrind.patch     |   8 +-
 ...-connect-socket-to-a-spawned-command.patch |  32 +-
 .../0007-apic-fixup-fallthrough-to-PIC.patch  |   8 +-
 ...dd-pkg-config-handling-for-libgcrypt.patch |  12 +-
 .../qemu/qemu/CVE-2020-27821.patch            | 143 ---------
 .../qemu/qemu/CVE-2020-29443.patch            | 107 -------
 .../qemu/qemu/CVE-2020-35517_1.patch          | 153 ---------
 .../qemu/qemu/CVE-2020-35517_2.patch          | 117 -------
 .../qemu/qemu/CVE-2020-35517_3.patch          | 303 ------------------
 .../qemu/qemu/CVE-2021-20181.patch            |  81 -----
 .../qemu/qemu/CVE-2021-20203.patch            |  73 -----
 .../qemu/qemu/CVE-2021-20221.patch            |  70 ----
 .../qemu/qemu/CVE-2021-20257.patch            |  55 ----
 .../qemu/qemu/CVE-2021-20263.patch            | 214 -------------
 .../qemu/qemu/CVE-2021-3392.patch             |  89 -----
 .../qemu/qemu/CVE-2021-3409_1.patch           |  56 ----
 .../qemu/qemu/CVE-2021-3409_2.patch           |  92 ------
 .../qemu/qemu/CVE-2021-3409_3.patch           | 109 -------
 .../qemu/qemu/CVE-2021-3409_4.patch           |  75 -----
 .../qemu/qemu/CVE-2021-3409_5.patch           |  56 ----
 .../qemu/qemu/CVE-2021-3409_6.patch           |  99 ------
 .../qemu/qemu/CVE-2021-3416_1.patch           | 177 ----------
 .../qemu/qemu/CVE-2021-3416_10.patch          |  44 ---
 .../qemu/qemu/CVE-2021-3416_2.patch           |  42 ---
 .../qemu/qemu/CVE-2021-3416_3.patch           |  43 ---
 .../qemu/qemu/CVE-2021-3416_4.patch           |  43 ---
 .../qemu/qemu/CVE-2021-3416_5.patch           |  45 ---
 .../qemu/qemu/CVE-2021-3416_6.patch           |  43 ---
 .../qemu/qemu/CVE-2021-3416_7.patch           |  45 ---
 .../qemu/qemu/CVE-2021-3416_8.patch           |  44 ---
 .../qemu/qemu/CVE-2021-3416_9.patch           |  46 ---
 meta/recipes-devtools/qemu/qemu/cross.patch   |  12 +-
 .../qemu/qemu/determinism.patch               |  29 +-
 .../recipes-devtools/qemu/qemu/mingwfix.patch |  21 --
 meta/recipes-devtools/qemu/qemu/mmap.patch    |  29 --
 meta/recipes-devtools/qemu/qemu/mmap2.patch   |  25 +-
 .../qemu/{qemu_5.2.0.bb => qemu_6.0.0.bb}     |   4 +-
 47 files changed, 99 insertions(+), 2670 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_5.2.0.bb => qemu-native_6.0.0.bb} (89%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_5.2.0.bb => qemu-system-native_6.0.0.bb} (96%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20263.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/mingwfix.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/mmap.patch
 rename meta/recipes-devtools/qemu/{qemu_5.2.0.bb => qemu_6.0.0.bb} (93%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index a0c35eed094..c6e5ac61d7d 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.36%"
 GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.33"
 LINUXLIBCVERSION ?= "5.10%"
-QEMUVERSION ?= "5.2%"
+QEMUVERSION ?= "6.0%"
 GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
diff --git a/meta/recipes-devtools/qemu/qemu-native_5.2.0.bb b/meta/recipes-devtools/qemu/qemu-native_6.0.0.bb
similarity index 89%
rename from meta/recipes-devtools/qemu/qemu-native_5.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_6.0.0.bb
index c8acff8e196..d23d7a8ada0 100644
--- a/meta/recipes-devtools/qemu/qemu-native_5.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_6.0.0.bb
@@ -6,4 +6,4 @@ require qemu-native.inc
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-blobs --disable-guest-agent"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "pie"
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_6.0.0.bb
similarity index 96%
rename from meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_6.0.0.bb
index 390dadea48a..9d7d0cdceb6 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_6.0.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm \
+PACKAGECONFIG ??= "fdt alsa kvm pie \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
 "
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 74c53c63097..0cbd66301e6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -25,43 +25,14 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0001-Add-enable-disable-udev.patch \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
-           file://mingwfix.patch \
-           file://mmap.patch \
            file://mmap2.patch \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
-           file://CVE-2021-20203.patch \
-           file://CVE-2020-35517_1.patch \
-           file://CVE-2020-35517_2.patch \
-           file://CVE-2020-35517_3.patch \
-           file://CVE-2021-20181.patch \
-           file://CVE-2020-29443.patch \
-           file://CVE-2021-20221.patch \
-           file://CVE-2021-3409_1.patch \
-           file://CVE-2021-3409_2.patch \
-           file://CVE-2021-3409_3.patch \
-           file://CVE-2021-3409_4.patch \
-           file://CVE-2021-3409_5.patch \
-           file://CVE-2021-3409_6.patch \
-           file://CVE-2021-3416_1.patch \
-           file://CVE-2021-3416_2.patch \
-           file://CVE-2021-3416_3.patch \
-           file://CVE-2021-3416_4.patch \
-           file://CVE-2021-3416_5.patch \
-           file://CVE-2021-3416_6.patch \
-           file://CVE-2021-3416_7.patch \
-           file://CVE-2021-3416_8.patch \
-           file://CVE-2021-3416_9.patch \
-           file://CVE-2021-3416_10.patch \
-           file://CVE-2021-20257.patch \
-           file://CVE-2020-27821.patch \
-           file://CVE-2021-20263.patch \
-           file://CVE-2021-3392.patch \
            file://0001-configure-fix-detection-of-gdbus-codegen.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "cb18d889b628fbe637672b0326789d9b0e3b8027e0445b936537c78549df17bc"
+SRC_URI[sha256sum] = "87bc1a471ca24b97e7005711066007d443423d19aacda3d442558ae032fa30b9"
 
 SRC_URI_append_class-target = " file://cross.patch"
 SRC_URI_append_class-nativesdk = " file://cross.patch"
@@ -94,8 +65,6 @@ do_install_ptest() {
 	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcodp]" | xargs -i rm -rf {}
 
 	# Don't check the file genreated by configure
-        sed -i -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
-            ${D}/${PTEST_PATH}/tests/qemu-iotests/common.env 
 	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}/tests/data/acpi/disassemle-aml.sh
 
 	# Strip the paths from the QEMU variable, we can use PATH
@@ -122,7 +91,7 @@ EXTRA_OECONF = " \
     --extra-cflags='${CFLAGS}' \
     --extra-ldflags='${LDFLAGS}' \
     --with-git=/bin/false \
-    --disable-git-update \
+    --with-git-submodules=ignore \
     --meson=meson \
     ${PACKAGECONFIG_CONFARGS} \
     "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
index c99adee8a95..4b37967e7a9 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
@@ -12,13 +12,13 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  configure | 4 ++++
  1 file changed, 4 insertions(+)
 
-Index: qemu-5.2.0/configure
+Index: qemu-6.0.0/configure
 ===================================================================
---- qemu-5.2.0.orig/configure
-+++ qemu-5.2.0/configure
-@@ -1525,6 +1525,10 @@ for opt do
+--- qemu-6.0.0.orig/configure
++++ qemu-6.0.0/configure
+@@ -1565,6 +1565,10 @@ for opt do
    ;;
-   --disable-libdaxctl) libdaxctl=no
+   --disable-gio) gio=no
    ;;
 +  --enable-libudev) libudev="yes"
 +  ;;
diff --git a/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch b/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch
index 1f200778833..8bffc312939 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch
@@ -26,20 +26,20 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  configure | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/configure b/configure
-index 18c26e0389..4c36e221d3 100755
---- a/configure
-+++ b/configure
-@@ -3496,7 +3496,7 @@ if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
-     gio_cflags=$($pkg_config --cflags gio-2.0)
-     gio_libs=$($pkg_config --libs gio-2.0)
-     gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
--    if [ ! -x "$gdbus_codegen" ]; then
-+    if ! has "$gdbus_codegen"; then
-         gdbus_codegen=
-     fi
-     # Check that the libraries actually work -- Ubuntu 18.04 ships
-@@ -6172,6 +6172,8 @@ if test "$gio" = "yes" ; then
+Index: qemu-6.0.0/configure
+===================================================================
+--- qemu-6.0.0.orig/configure
++++ qemu-6.0.0/configure
+@@ -3366,7 +3366,7 @@ if ! test "$gio" = "no"; then
+         gio_cflags=$($pkg_config --cflags gio-2.0)
+         gio_libs=$($pkg_config --libs gio-2.0)
+         gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
+-        if [ ! -x "$gdbus_codegen" ]; then
++        if ! has "$gdbus_codegen"; then
+             gdbus_codegen=
+         fi
+         # Check that the libraries actually work -- Ubuntu 18.04 ships
+@@ -5704,6 +5704,8 @@ if test "$gio" = "yes" ; then
      echo "CONFIG_GIO=y" >> $config_host_mak
      echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
      echo "GIO_LIBS=$gio_libs" >> $config_host_mak
@@ -48,6 +48,3 @@ index 18c26e0389..4c36e221d3 100755
      echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
  fi
  echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
--- 
-2.24.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
index 8ce12bdb43e..2f2d19f5367 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-missing-wacom-HID-descriptor.patch
@@ -20,10 +20,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
  1 file changed, 93 insertions(+), 1 deletion(-)
 
-Index: qemu-5.2.0/hw/usb/dev-wacom.c
+Index: qemu-6.0.0/hw/usb/dev-wacom.c
 ===================================================================
---- qemu-5.2.0.orig/hw/usb/dev-wacom.c
-+++ qemu-5.2.0/hw/usb/dev-wacom.c
+--- qemu-6.0.0.orig/hw/usb/dev-wacom.c
++++ qemu-6.0.0/hw/usb/dev-wacom.c
 @@ -69,6 +69,89 @@ static const USBDescStrings desc_strings
      [STR_SERIALNUMBER]     = "1",
  };
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
index 3fe9aa6eb5c..b8d288d3a26 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch
@@ -15,11 +15,11 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  linux-user/syscall.c | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: qemu-5.2.0/linux-user/syscall.c
+Index: qemu-6.0.0/linux-user/syscall.c
 ===================================================================
---- qemu-5.2.0.orig/linux-user/syscall.c
-+++ qemu-5.2.0/linux-user/syscall.c
-@@ -109,7 +109,9 @@
+--- qemu-6.0.0.orig/linux-user/syscall.c
++++ qemu-6.0.0/linux-user/syscall.c
+@@ -113,7 +113,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
@@ -28,4 +28,4 @@ Index: qemu-5.2.0/linux-user/syscall.c
 +#endif
  #include <linux/rtc.h>
  #include <sound/asound.h>
- #ifdef CONFIG_BTRFS
+ #ifdef HAVE_BTRFS_H
diff --git a/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 5cb5757c371..d5e1ab4d511 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -16,19 +16,16 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  tests/meson.build   | 2 +-
  1 files changed, 1 insertions(+), 1 deletion(-)
 
-diff --git a/tests/meson.build b/tests/meson.build
-index afeb6be..54684b5 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -113,7 +113,7 @@ tests = {
+Index: qemu-6.0.0/tests/unit/meson.build
+===================================================================
+--- qemu-6.0.0.orig/tests/unit/meson.build
++++ qemu-6.0.0/tests/unit/meson.build
+@@ -42,7 +42,7 @@ tests = {
    'test-keyval': [testqapi],
    'test-logging': [],
    'test-uuid': [],
 -  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
-+  'ptimer-test': ['ptimer-test-stubs.c', '../hw/core/ptimer.c'],
++  'ptimer-test': ['ptimer-test-stubs.c', '../../hw/core/ptimer.c'],
    'test-qapi-util': [],
  }
  
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index fd54f96b036..733789be297 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -18,13 +18,13 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  hw/mips/malta.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-5.2.0/hw/mips/malta.c
+Index: qemu-6.0.0/hw/mips/malta.c
 ===================================================================
---- qemu-5.2.0.orig/hw/mips/malta.c
-+++ qemu-5.2.0/hw/mips/malta.c
-@@ -62,7 +62,7 @@
- 
- #define ENVP_ADDR           0x80002000l
+--- qemu-6.0.0.orig/hw/mips/malta.c
++++ qemu-6.0.0/hw/mips/malta.c
+@@ -65,7 +65,7 @@
+ #define ENVP_PADDR          0x2000
+ #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
 -#define ENVP_ENTRY_SIZE     256
 +#define ENVP_ENTRY_SIZE     1024
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
index a0bd1c5ebc7..330bcaef0aa 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-disable-Valgrind.patch
@@ -12,11 +12,11 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  configure | 9 ---------
  1 file changed, 9 deletions(-)
 
-Index: qemu-5.2.0/configure
+Index: qemu-6.0.0/configure
 ===================================================================
---- qemu-5.2.0.orig/configure
-+++ qemu-5.2.0/configure
-@@ -5001,15 +5001,6 @@ fi
+--- qemu-6.0.0.orig/configure
++++ qemu-6.0.0/configure
+@@ -4648,15 +4648,6 @@ fi
  # check if we have valgrind/valgrind.h
  
  valgrind_h=no
diff --git a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
index 201125c1f47..05dc849dada 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
@@ -51,11 +51,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  qapi/char.json        |   5 +++
  3 files changed, 109 insertions(+)
 
-Index: qemu-5.2.0/chardev/char-socket.c
+Index: qemu-6.0.0/chardev/char-socket.c
 ===================================================================
---- qemu-5.2.0.orig/chardev/char-socket.c
-+++ qemu-5.2.0/chardev/char-socket.c
-@@ -1308,6 +1308,67 @@ static bool qmp_chardev_validate_socket(
+--- qemu-6.0.0.orig/chardev/char-socket.c
++++ qemu-6.0.0/chardev/char-socket.c
+@@ -1362,6 +1362,67 @@ static bool qmp_chardev_validate_socket(
      return true;
  }
  
@@ -123,7 +123,7 @@ Index: qemu-5.2.0/chardev/char-socket.c
  
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
-@@ -1316,6 +1377,9 @@ static void qmp_chardev_open_socket(Char
+@@ -1370,6 +1431,9 @@ static void qmp_chardev_open_socket(Char
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -133,7 +133,7 @@ Index: qemu-5.2.0/chardev/char-socket.c
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -1381,6 +1445,14 @@ static void qmp_chardev_open_socket(Char
+@@ -1446,6 +1510,14 @@ static void qmp_chardev_open_socket(Char
  
      update_disconnected_filename(s);
  
@@ -148,7 +148,7 @@ Index: qemu-5.2.0/chardev/char-socket.c
      if (s->is_listen) {
          if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
                                             is_waitconnect, errp) < 0) {
-@@ -1400,6 +1472,9 @@ static void qemu_chr_parse_socket(QemuOp
+@@ -1465,6 +1537,9 @@ static void qemu_chr_parse_socket(QemuOp
      const char *host = qemu_opt_get(opts, "host");
      const char *port = qemu_opt_get(opts, "port");
      const char *fd = qemu_opt_get(opts, "fd");
@@ -158,7 +158,7 @@ Index: qemu-5.2.0/chardev/char-socket.c
  #ifdef CONFIG_LINUX
      bool tight = qemu_opt_get_bool(opts, "tight", true);
      bool abstract = qemu_opt_get_bool(opts, "abstract", false);
-@@ -1407,6 +1482,20 @@ static void qemu_chr_parse_socket(QemuOp
+@@ -1472,6 +1547,20 @@ static void qemu_chr_parse_socket(QemuOp
      SocketAddressLegacy *addr;
      ChardevSocket *sock;
  
@@ -179,7 +179,7 @@ Index: qemu-5.2.0/chardev/char-socket.c
      if ((!!path + !!fd + !!host) != 1) {
          error_setg(errp,
                     "Exactly one of 'path', 'fd' or 'host' required");
-@@ -1448,13 +1537,24 @@ static void qemu_chr_parse_socket(QemuOp
+@@ -1522,13 +1611,24 @@ static void qemu_chr_parse_socket(QemuOp
      sock->tls_creds = g_strdup(qemu_opt_get(opts, "tls-creds"));
      sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
      sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
@@ -204,11 +204,11 @@ Index: qemu-5.2.0/chardev/char-socket.c
  #ifdef CONFIG_LINUX
          q_unix->has_tight = true;
          q_unix->tight = tight;
-Index: qemu-5.2.0/chardev/char.c
+Index: qemu-6.0.0/chardev/char.c
 ===================================================================
---- qemu-5.2.0.orig/chardev/char.c
-+++ qemu-5.2.0/chardev/char.c
-@@ -839,6 +839,9 @@ QemuOptsList qemu_chardev_opts = {
+--- qemu-6.0.0.orig/chardev/char.c
++++ qemu-6.0.0/chardev/char.c
+@@ -840,6 +840,9 @@ QemuOptsList qemu_chardev_opts = {
              .name = "path",
              .type = QEMU_OPT_STRING,
          },{
@@ -218,10 +218,10 @@ Index: qemu-5.2.0/chardev/char.c
              .name = "host",
              .type = QEMU_OPT_STRING,
          },{
-Index: qemu-5.2.0/qapi/char.json
+Index: qemu-6.0.0/qapi/char.json
 ===================================================================
---- qemu-5.2.0.orig/qapi/char.json
-+++ qemu-5.2.0/qapi/char.json
+--- qemu-6.0.0.orig/qapi/char.json
++++ qemu-6.0.0/qapi/char.json
 @@ -250,6 +250,10 @@
  #
  # @addr: socket address to listen on (server=true)
diff --git a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
index 294cf5129f1..3491fa8a53c 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-apic-fixup-fallthrough-to-PIC.patch
@@ -29,11 +29,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-5.2.0/hw/intc/apic.c
+Index: qemu-6.0.0/hw/intc/apic.c
 ===================================================================
---- qemu-5.2.0.orig/hw/intc/apic.c
-+++ qemu-5.2.0/hw/intc/apic.c
-@@ -605,7 +605,7 @@ int apic_accept_pic_intr(DeviceState *de
+--- qemu-6.0.0.orig/hw/intc/apic.c
++++ qemu-6.0.0/hw/intc/apic.c
+@@ -606,7 +606,7 @@ int apic_accept_pic_intr(DeviceState *de
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
index c5d206b91bb..cc6a5fe7549 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -14,11 +14,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  configure | 48 ++++++++++++++++++++++++++++++++++++++++--------
  1 file changed, 40 insertions(+), 8 deletions(-)
 
-Index: qemu-5.2.0/configure
+Index: qemu-6.0.0/configure
 ===================================================================
---- qemu-5.2.0.orig/configure
-+++ qemu-5.2.0/configure
-@@ -2956,6 +2956,30 @@ has_libgcrypt() {
+--- qemu-6.0.0.orig/configure
++++ qemu-6.0.0/configure
+@@ -2847,6 +2847,30 @@ has_libgcrypt() {
      return 0
  }
  
@@ -49,7 +49,7 @@ Index: qemu-5.2.0/configure
  
  if test "$nettle" != "no"; then
      pass="no"
-@@ -2994,7 +3018,14 @@ fi
+@@ -2885,7 +2909,14 @@ fi
  
  if test "$gcrypt" != "no"; then
      pass="no"
@@ -65,7 +65,7 @@ Index: qemu-5.2.0/configure
          gcrypt_cflags=$(libgcrypt-config --cflags)
          gcrypt_libs=$(libgcrypt-config --libs)
          # Debian has removed -lgpg-error from libgcrypt-config
-@@ -3004,12 +3035,12 @@ if test "$gcrypt" != "no"; then
+@@ -2895,12 +2926,12 @@ if test "$gcrypt" != "no"; then
          then
              gcrypt_libs="$gcrypt_libs -lgpg-error"
          fi
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
deleted file mode 100644
index 58622f04875..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From 279f90a9ab07304f0a49fc10e4bfd1243a8cddbe Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Tue, 1 Dec 2020 09:29:56 -0500
-Subject: [PATCH 1/2] memory: clamp cached translation in case it points to an
- MMIO region
-
-In using the address_space_translate_internal API, address_space_cache_init
-forgot one piece of advice that can be found in the code for
-address_space_translate_internal:
-
-    /* MMIO registers can be expected to perform full-width accesses based only
-     * on their address, without considering adjacent registers that could
-     * decode to completely different MemoryRegions.  When such registers
-     * exist (e.g. I/O ports 0xcf8 and 0xcf9 on most PC chipsets), MMIO
-     * regions overlap wildly.  For this reason we cannot clamp the accesses
-     * here.
-     *
-     * If the length is small (as is the case for address_space_ldl/stl),
-     * everything works fine.  If the incoming length is large, however,
-     * the caller really has to do the clamping through memory_access_size.
-     */
-
-address_space_cache_init is exactly one such case where "the incoming length
-is large", therefore we need to clamp the resulting length---not to
-memory_access_size though, since we are not doing an access yet, but to
-the size of the resulting section.  This ensures that subsequent accesses
-to the cached MemoryRegionSection will be in range.
-
-With this patch, the enclosed testcase notices that the used ring does
-not fit into the MSI-X table and prints a "qemu-system-x86_64: Cannot map used"
-error.
-
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-Upstream-Status: Backport [4bfb024bc76973d40a359476dc0291f46e435442]
-CVE: CVE-2020-27821
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- softmmu/physmem.c       | 10 ++++++++
- tests/qtest/fuzz-test.c | 51 +++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 61 insertions(+)
-
-diff --git a/softmmu/physmem.c b/softmmu/physmem.c
-index 3027747c0..2cd1de4a2 100644
---- a/softmmu/physmem.c
-+++ b/softmmu/physmem.c
-@@ -3255,6 +3255,7 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
-     AddressSpaceDispatch *d;
-     hwaddr l;
-     MemoryRegion *mr;
-+    Int128 diff;
- 
-     assert(len > 0);
- 
-@@ -3263,6 +3264,15 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
-     d = flatview_to_dispatch(cache->fv);
-     cache->mrs = *address_space_translate_internal(d, addr, &cache->xlat, &l, true);
- 
-+    /*
-+     * cache->xlat is now relative to cache->mrs.mr, not to the section itself.
-+     * Take that into account to compute how many bytes are there between
-+     * cache->xlat and the end of the section.
-+     */
-+    diff = int128_sub(cache->mrs.size,
-+		      int128_make64(cache->xlat - cache->mrs.offset_within_region));
-+    l = int128_get64(int128_min(diff, int128_make64(l)));
-+
-     mr = cache->mrs.mr;
-     memory_region_ref(mr);
-     if (memory_access_is_direct(mr, is_write)) {
-diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
-index 9cb4c42bd..28739248e 100644
---- a/tests/qtest/fuzz-test.c
-+++ b/tests/qtest/fuzz-test.c
-@@ -47,6 +47,55 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
-     qtest_outl(s, 0x5d02, 0xebed205d);
- }
- 
-+/*
-+ * Here a MemoryRegionCache pointed to an MMIO region but had a
-+ * larger size than the underlying region.
-+ */
-+static void test_mmio_oob_from_memory_region_cache(void)
-+{
-+    QTestState *s;
-+
-+    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
-+		   "-device virtio-scsi,num_queues=8,addr=03.0 ");
-+
-+    qtest_outl(s, 0xcf8, 0x80001811);
-+    qtest_outb(s, 0xcfc, 0x6e);
-+    qtest_outl(s, 0xcf8, 0x80001824);
-+    qtest_outl(s, 0xcf8, 0x80001813);
-+    qtest_outl(s, 0xcfc, 0xa080000);
-+    qtest_outl(s, 0xcf8, 0x80001802);
-+    qtest_outl(s, 0xcfc, 0x5a175a63);
-+    qtest_outb(s, 0x6e08, 0x9e);
-+    qtest_writeb(s, 0x9f003, 0xff);
-+    qtest_writeb(s, 0x9f004, 0x01);
-+    qtest_writeb(s, 0x9e012, 0x0e);
-+    qtest_writeb(s, 0x9e01b, 0x0e);
-+    qtest_writeb(s, 0x9f006, 0x01);
-+    qtest_writeb(s, 0x9f008, 0x01);
-+    qtest_writeb(s, 0x9f00a, 0x01);
-+    qtest_writeb(s, 0x9f00c, 0x01);
-+    qtest_writeb(s, 0x9f00e, 0x01);
-+    qtest_writeb(s, 0x9f010, 0x01);
-+    qtest_writeb(s, 0x9f012, 0x01);
-+    qtest_writeb(s, 0x9f014, 0x01);
-+    qtest_writeb(s, 0x9f016, 0x01);
-+    qtest_writeb(s, 0x9f018, 0x01);
-+    qtest_writeb(s, 0x9f01a, 0x01);
-+    qtest_writeb(s, 0x9f01c, 0x01);
-+    qtest_writeb(s, 0x9f01e, 0x01);
-+    qtest_writeb(s, 0x9f020, 0x01);
-+    qtest_writeb(s, 0x9f022, 0x01);
-+    qtest_writeb(s, 0x9f024, 0x01);
-+    qtest_writeb(s, 0x9f026, 0x01);
-+    qtest_writeb(s, 0x9f028, 0x01);
-+    qtest_writeb(s, 0x9f02a, 0x01);
-+    qtest_writeb(s, 0x9f02c, 0x01);
-+    qtest_writeb(s, 0x9f02e, 0x01);
-+    qtest_writeb(s, 0x9f030, 0x01);
-+    qtest_outb(s, 0x6e10, 0x00);
-+    qtest_quit(s);
-+}
-+
- int main(int argc, char **argv)
- {
-     const char *arch = qtest_get_arch();
-@@ -58,6 +107,8 @@ int main(int argc, char **argv)
-                        test_lp1878263_megasas_zero_iov_cnt);
-         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
-                        test_lp1878642_pci_bus_get_irq_level_assert);
-+        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
-+                       test_mmio_oob_from_memory_region_cache);
-     }
- 
-     return g_test_run();
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
deleted file mode 100644
index c72324fce66..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From c9a71afe182be5b62bd2ccdaf861695e0ec0731a Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Mon, 18 Jan 2021 17:21:30 +0530
-Subject: [PATCH] ide: atapi: check logical block address and read size
- (CVE-2020-29443)
-
-While processing ATAPI cmd_read/cmd_read_cd commands,
-Logical Block Address (LBA) maybe invalid OR closer to the last block,
-leading to an OOB access issues. Add range check to avoid it.
-
-Fixes: CVE-2020-29443
-Reported-by: Wenxiang Qian <leonwxqian@gmail.com>
-Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
-Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <20210118115130.457044-1-ppandit@redhat.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
-
-Upstream-Status: Backport [b8d7f1bc59276fec85e4d09f1567613a3e14d31e]
-CVE: CVE-2020-29443
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/ide/atapi.c | 30 ++++++++++++++++++++++++------
- 1 file changed, 24 insertions(+), 6 deletions(-)
-
-diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
-index e79157863..b626199e3 100644
---- a/hw/ide/atapi.c
-+++ b/hw/ide/atapi.c
-@@ -322,6 +322,8 @@ static void ide_atapi_cmd_reply(IDEState *s, int size, int max_size)
- static void ide_atapi_cmd_read_pio(IDEState *s, int lba, int nb_sectors,
-                                    int sector_size)
- {
-+    assert(0 <= lba && lba < (s->nb_sectors >> 2));
-+
-     s->lba = lba;
-     s->packet_transfer_size = nb_sectors * sector_size;
-     s->elementary_transfer_size = 0;
-@@ -420,6 +422,8 @@ eot:
- static void ide_atapi_cmd_read_dma(IDEState *s, int lba, int nb_sectors,
-                                    int sector_size)
- {
-+    assert(0 <= lba && lba < (s->nb_sectors >> 2));
-+
-     s->lba = lba;
-     s->packet_transfer_size = nb_sectors * sector_size;
-     s->io_buffer_size = 0;
-@@ -973,35 +977,49 @@ static void cmd_prevent_allow_medium_removal(IDEState *s, uint8_t* buf)
- 
- static void cmd_read(IDEState *s, uint8_t* buf)
- {
--    int nb_sectors, lba;
-+    unsigned int nb_sectors, lba;
-+
-+    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
-+    uint64_t total_sectors = s->nb_sectors >> 2;
- 
-     if (buf[0] == GPCMD_READ_10) {
-         nb_sectors = lduw_be_p(buf + 7);
-     } else {
-         nb_sectors = ldl_be_p(buf + 6);
-     }
--
--    lba = ldl_be_p(buf + 2);
-     if (nb_sectors == 0) {
-         ide_atapi_cmd_ok(s);
-         return;
-     }
- 
-+    lba = ldl_be_p(buf + 2);
-+    if (lba >= total_sectors || lba + nb_sectors - 1 >= total_sectors) {
-+        ide_atapi_cmd_error(s, ILLEGAL_REQUEST, ASC_LOGICAL_BLOCK_OOR);
-+        return;
-+    }
-+
-     ide_atapi_cmd_read(s, lba, nb_sectors, 2048);
- }
- 
- static void cmd_read_cd(IDEState *s, uint8_t* buf)
- {
--    int nb_sectors, lba, transfer_request;
-+    unsigned int nb_sectors, lba, transfer_request;
- 
--    nb_sectors = (buf[6] << 16) | (buf[7] << 8) | buf[8];
--    lba = ldl_be_p(buf + 2);
-+    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
-+    uint64_t total_sectors = s->nb_sectors >> 2;
- 
-+    nb_sectors = (buf[6] << 16) | (buf[7] << 8) | buf[8];
-     if (nb_sectors == 0) {
-         ide_atapi_cmd_ok(s);
-         return;
-     }
- 
-+    lba = ldl_be_p(buf + 2);
-+    if (lba >= total_sectors || lba + nb_sectors - 1 >= total_sectors) {
-+        ide_atapi_cmd_error(s, ILLEGAL_REQUEST, ASC_LOGICAL_BLOCK_OOR);
-+        return;
-+    }
-+
-     transfer_request = buf[9] & 0xf8;
-     if (transfer_request == 0x00) {
-         /* nothing */
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch
deleted file mode 100644
index 73a4cb20644..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_1.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 8afaaee976965b7fb90ec225a51d60f35c5f173c Mon Sep 17 00:00:00 2001
-From: Stefan Hajnoczi <stefanha@redhat.com>
-Date: Thu, 4 Feb 2021 15:02:06 +0000
-Subject: [PATCH] virtiofsd: extract lo_do_open() from lo_open()
-
-Both lo_open() and lo_create() have similar code to open a file. Extract
-a common lo_do_open() function from lo_open() that will be used by
-lo_create() in a later commit.
-
-Since lo_do_open() does not otherwise need fuse_req_t req, convert
-lo_add_fd_mapping() to use struct lo_data *lo instead.
-
-Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
-Message-Id: <20210204150208.367837-2-stefanha@redhat.com>
-Reviewed-by: Greg Kurz <groug@kaod.org>
-Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/qemu/qemu/commit/8afaaee976965b7fb90ec225a51d60f35c5f173c]
-
-CVE: CVE-2020-35517
-
-Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
----
- tools/virtiofsd/passthrough_ll.c | 73 +++++++++++++++++++++++++---------------
- 1 file changed, 46 insertions(+), 27 deletions(-)
-
-diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
-index 5fb36d9..f14fa51 100644
---- a/tools/virtiofsd/passthrough_ll.c
-+++ b/tools/virtiofsd/passthrough_ll.c
-@@ -459,17 +459,17 @@ static void lo_map_remove(struct lo_map *map, size_t key)
- }
- 
- /* Assumes lo->mutex is held */
--static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
-+static ssize_t lo_add_fd_mapping(struct lo_data *lo, int fd)
- {
-     struct lo_map_elem *elem;
- 
--    elem = lo_map_alloc_elem(&lo_data(req)->fd_map);
-+    elem = lo_map_alloc_elem(&lo->fd_map);
-     if (!elem) {
-         return -1;
-     }
- 
-     elem->fd = fd;
--    return elem - lo_data(req)->fd_map.elems;
-+    return elem - lo->fd_map.elems;
- }
- 
- /* Assumes lo->mutex is held */
-@@ -1651,6 +1651,38 @@ static void update_open_flags(int writeback, int allow_direct_io,
-     }
- }
- 
-+static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
-+                      struct fuse_file_info *fi)
-+{
-+    char buf[64];
-+    ssize_t fh;
-+    int fd;
-+
-+    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
-+
-+    sprintf(buf, "%i", inode->fd);
-+    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
-+    if (fd == -1) {
-+        return errno;
-+    }
-+
-+    pthread_mutex_lock(&lo->mutex);
-+    fh = lo_add_fd_mapping(lo, fd);
-+    pthread_mutex_unlock(&lo->mutex);
-+    if (fh == -1) {
-+        close(fd);
-+        return ENOMEM;
-+    }
-+
-+    fi->fh = fh;
-+    if (lo->cache == CACHE_NONE) {
-+        fi->direct_io = 1;
-+    } else if (lo->cache == CACHE_ALWAYS) {
-+        fi->keep_cache = 1;
-+    }
-+    return 0;
-+}
-+
- static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
-                       mode_t mode, struct fuse_file_info *fi)
- {
-@@ -1691,7 +1723,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
-         ssize_t fh;
- 
-         pthread_mutex_lock(&lo->mutex);
--        fh = lo_add_fd_mapping(req, fd);
-+        fh = lo_add_fd_mapping(lo, fd);
-         pthread_mutex_unlock(&lo->mutex);
-         if (fh == -1) {
-             close(fd);
-@@ -1892,38 +1924,25 @@ static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
- 
- static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
- {
--    int fd;
--    ssize_t fh;
--    char buf[64];
-     struct lo_data *lo = lo_data(req);
-+    struct lo_inode *inode = lo_inode(req, ino);
-+    int err;
- 
-     fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
-              fi->flags);
- 
--    update_open_flags(lo->writeback, lo->allow_direct_io, fi);
--
--    sprintf(buf, "%i", lo_fd(req, ino));
--    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
--    if (fd == -1) {
--        return (void)fuse_reply_err(req, errno);
--    }
--
--    pthread_mutex_lock(&lo->mutex);
--    fh = lo_add_fd_mapping(req, fd);
--    pthread_mutex_unlock(&lo->mutex);
--    if (fh == -1) {
--        close(fd);
--        fuse_reply_err(req, ENOMEM);
-+    if (!inode) {
-+        fuse_reply_err(req, EBADF);
-         return;
-     }
- 
--    fi->fh = fh;
--    if (lo->cache == CACHE_NONE) {
--        fi->direct_io = 1;
--    } else if (lo->cache == CACHE_ALWAYS) {
--        fi->keep_cache = 1;
-+    err = lo_do_open(lo, inode, fi);
-+    lo_inode_put(lo, &inode);
-+    if (err) {
-+        fuse_reply_err(req, err);
-+    } else {
-+        fuse_reply_open(req, fi);
-     }
--    fuse_reply_open(req, fi);
- }
- 
- static void lo_release(fuse_req_t req, fuse_ino_t ino,
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch
deleted file mode 100644
index bf11bdb6f84..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_2.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 22d2ece71e533310da31f2857ebc4a00d91968b3 Mon Sep 17 00:00:00 2001
-From: Stefan Hajnoczi <stefanha@redhat.com>
-Date: Thu, 4 Feb 2021 15:02:07 +0000
-Subject: [PATCH] virtiofsd: optionally return inode pointer from
- lo_do_lookup()
-
-lo_do_lookup() finds an existing inode or allocates a new one. It
-increments nlookup so that the inode stays alive until the client
-releases it.
-
-Existing callers don't need the struct lo_inode so the function doesn't
-return it. Extend the function to optionally return the inode. The next
-commit will need it.
-
-Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
-Reviewed-by: Greg Kurz <groug@kaod.org>
-Message-Id: <20210204150208.367837-3-stefanha@redhat.com>
-Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/qemu/qemu/commit/22d2ece71e533310da31f2857ebc4a00d91968b3]
-
-CVE: CVE-2020-35517
-
-Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
----
- tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++--------
- 1 file changed, 21 insertions(+), 8 deletions(-)
-
-diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
-index f14fa51..aa35fc6 100644
---- a/tools/virtiofsd/passthrough_ll.c
-+++ b/tools/virtiofsd/passthrough_ll.c
-@@ -831,11 +831,13 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
- }
- 
- /*
-- * Increments nlookup and caller must release refcount using
-- * lo_inode_put(&parent).
-+ * Increments nlookup on the inode on success. unref_inode_lolocked() must be
-+ * called eventually to decrement nlookup again. If inodep is non-NULL, the
-+ * inode pointer is stored and the caller must call lo_inode_put().
-  */
- static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
--                        struct fuse_entry_param *e)
-+                        struct fuse_entry_param *e,
-+                        struct lo_inode **inodep)
- {
-     int newfd;
-     int res;
-@@ -845,6 +847,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
-     struct lo_inode *inode = NULL;
-     struct lo_inode *dir = lo_inode(req, parent);
- 
-+    if (inodep) {
-+        *inodep = NULL;
-+    }
-+
-     /*
-      * name_to_handle_at() and open_by_handle_at() can reach here with fuse
-      * mount point in guest, but we don't have its inode info in the
-@@ -913,7 +919,14 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
-         pthread_mutex_unlock(&lo->mutex);
-     }
-     e->ino = inode->fuse_ino;
--    lo_inode_put(lo, &inode);
-+
-+    /* Transfer ownership of inode pointer to caller or drop it */
-+    if (inodep) {
-+        *inodep = inode;
-+    } else {
-+        lo_inode_put(lo, &inode);
-+    }
-+
-     lo_inode_put(lo, &dir);
- 
-     fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)parent,
-@@ -948,7 +961,7 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
-         return;
-     }
- 
--    err = lo_do_lookup(req, parent, name, &e);
-+    err = lo_do_lookup(req, parent, name, &e, NULL);
-     if (err) {
-         fuse_reply_err(req, err);
-     } else {
-@@ -1056,7 +1069,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
-         goto out;
-     }
- 
--    saverr = lo_do_lookup(req, parent, name, &e);
-+    saverr = lo_do_lookup(req, parent, name, &e, NULL);
-     if (saverr) {
-         goto out;
-     }
-@@ -1534,7 +1547,7 @@ static void lo_do_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
- 
-         if (plus) {
-             if (!is_dot_or_dotdot(name)) {
--                err = lo_do_lookup(req, ino, name, &e);
-+                err = lo_do_lookup(req, ino, name, &e, NULL);
-                 if (err) {
-                     goto error;
-                 }
-@@ -1732,7 +1745,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
-         }
- 
-         fi->fh = fh;
--        err = lo_do_lookup(req, parent, name, &e);
-+        err = lo_do_lookup(req, parent, name, &e, NULL);
-     }
-     if (lo->cache == CACHE_NONE) {
-         fi->direct_io = 1;
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch
deleted file mode 100644
index f348f3f2bdd..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2020-35517_3.patch
+++ /dev/null
@@ -1,303 +0,0 @@
-From a3fdbbc7f271bff7d53d0501b29d910ece0b3789 Mon Sep 17 00:00:00 2001
-From: Stefan Hajnoczi <stefanha@redhat.com>
-Date: Thu, 4 Feb 2021 15:02:08 +0000
-Subject: [PATCH] virtiofsd: prevent opening of special files (CVE-2020-35517)
-
-A well-behaved FUSE client does not attempt to open special files with
-FUSE_OPEN because they are handled on the client side (e.g. device nodes
-are handled by client-side device drivers).
-
-The check to prevent virtiofsd from opening special files is missing in
-a few cases, most notably FUSE_OPEN. A malicious client can cause
-virtiofsd to open a device node, potentially allowing the guest to
-escape. This can be exploited by a modified guest device driver. It is
-not exploitable from guest userspace since the guest kernel will handle
-special files inside the guest instead of sending FUSE requests.
-
-This patch fixes this issue by introducing the lo_inode_open() function
-to check the file type before opening it. This is a short-term solution
-because it does not prevent a compromised virtiofsd process from opening
-device nodes on the host.
-
-Restructure lo_create() to try O_CREAT | O_EXCL first. Note that O_CREAT
-| O_EXCL does not follow symlinks, so O_NOFOLLOW masking is not
-necessary here. If the file exists and the user did not specify O_EXCL,
-open it via lo_do_open().
-
-Reported-by: Alex Xu <alex@alxu.ca>
-Fixes: CVE-2020-35517
-Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
-Reviewed-by: Greg Kurz <groug@kaod.org>
-Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
-Message-Id: <20210204150208.367837-4-stefanha@redhat.com>
-Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/qemu/qemu/commit/a3fdbbc7f271bff7d53d0501b29d910ece0b3789]
-
-CVE: CVE-2020-35517
-
-Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
----
- tools/virtiofsd/passthrough_ll.c | 144 ++++++++++++++++++++-----------
- 1 file changed, 92 insertions(+), 52 deletions(-)
-
-diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
-index aa35fc6ba5a5..147b59338a18 100644
---- a/tools/virtiofsd/passthrough_ll.c
-+++ b/tools/virtiofsd/passthrough_ll.c
-@@ -555,6 +555,38 @@ static int lo_fd(fuse_req_t req, fuse_ino_t ino)
-     return fd;
- }
- 
-+/*
-+ * Open a file descriptor for an inode. Returns -EBADF if the inode is not a
-+ * regular file or a directory.
-+ *
-+ * Use this helper function instead of raw openat(2) to prevent security issues
-+ * when a malicious client opens special files such as block device nodes.
-+ * Symlink inodes are also rejected since symlinks must already have been
-+ * traversed on the client side.
-+ */
-+static int lo_inode_open(struct lo_data *lo, struct lo_inode *inode,
-+                         int open_flags)
-+{
-+    g_autofree char *fd_str = g_strdup_printf("%d", inode->fd);
-+    int fd;
-+
-+    if (!S_ISREG(inode->filetype) && !S_ISDIR(inode->filetype)) {
-+        return -EBADF;
-+    }
-+
-+    /*
-+     * The file is a symlink so O_NOFOLLOW must be ignored. We checked earlier
-+     * that the inode is not a special file but if an external process races
-+     * with us then symlinks are traversed here. It is not possible to escape
-+     * the shared directory since it is mounted as "/" though.
-+     */
-+    fd = openat(lo->proc_self_fd, fd_str, open_flags & ~O_NOFOLLOW);
-+    if (fd < 0) {
-+        return -errno;
-+    }
-+    return fd;
-+}
-+
- static void lo_init(void *userdata, struct fuse_conn_info *conn)
- {
-     struct lo_data *lo = (struct lo_data *)userdata;
-@@ -684,9 +716,9 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
-         if (fi) {
-             truncfd = fd;
-         } else {
--            sprintf(procname, "%i", ifd);
--            truncfd = openat(lo->proc_self_fd, procname, O_RDWR);
-+            truncfd = lo_inode_open(lo, inode, O_RDWR);
-             if (truncfd < 0) {
-+                errno = -truncfd;
-                 goto out_err;
-             }
-         }
-@@ -848,7 +880,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
-     struct lo_inode *dir = lo_inode(req, parent);
- 
-     if (inodep) {
--        *inodep = NULL;
-+        *inodep = NULL; /* in case there is an error */
-     }
- 
-     /*
-@@ -1664,19 +1696,26 @@ static void update_open_flags(int writeback, int allow_direct_io,
-     }
- }
- 
-+/*
-+ * Open a regular file, set up an fd mapping, and fill out the struct
-+ * fuse_file_info for it. If existing_fd is not negative, use that fd instead
-+ * opening a new one. Takes ownership of existing_fd.
-+ *
-+ * Returns 0 on success or a positive errno.
-+ */
- static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
--                      struct fuse_file_info *fi)
-+                      int existing_fd, struct fuse_file_info *fi)
- {
--    char buf[64];
-     ssize_t fh;
--    int fd;
-+    int fd = existing_fd;
- 
-     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
- 
--    sprintf(buf, "%i", inode->fd);
--    fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
--    if (fd == -1) {
--        return errno;
-+    if (fd < 0) {
-+        fd = lo_inode_open(lo, inode, fi->flags);
-+        if (fd < 0) {
-+            return -fd;
-+        }
-     }
- 
-     pthread_mutex_lock(&lo->mutex);
-@@ -1699,9 +1738,10 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
- static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
-                       mode_t mode, struct fuse_file_info *fi)
- {
--    int fd;
-+    int fd = -1;
-     struct lo_data *lo = lo_data(req);
-     struct lo_inode *parent_inode;
-+    struct lo_inode *inode = NULL;
-     struct fuse_entry_param e;
-     int err;
-     struct lo_cred old = {};
-@@ -1727,36 +1767,38 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
- 
-     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
- 
--    fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
--                mode);
-+    /* Try to create a new file but don't open existing files */
-+    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
-     err = fd == -1 ? errno : 0;
--    lo_restore_cred(&old);
- 
--    if (!err) {
--        ssize_t fh;
-+    lo_restore_cred(&old);
- 
--        pthread_mutex_lock(&lo->mutex);
--        fh = lo_add_fd_mapping(lo, fd);
--        pthread_mutex_unlock(&lo->mutex);
--        if (fh == -1) {
--            close(fd);
--            err = ENOMEM;
--            goto out;
--        }
-+    /* Ignore the error if file exists and O_EXCL was not given */
-+    if (err && (err != EEXIST || (fi->flags & O_EXCL))) {
-+        goto out;
-+    }
- 
--        fi->fh = fh;
--        err = lo_do_lookup(req, parent, name, &e, NULL);
-+    err = lo_do_lookup(req, parent, name, &e, &inode);
-+    if (err) {
-+        goto out;
-     }
--    if (lo->cache == CACHE_NONE) {
--        fi->direct_io = 1;
--    } else if (lo->cache == CACHE_ALWAYS) {
--        fi->keep_cache = 1;
-+
-+    err = lo_do_open(lo, inode, fd, fi);
-+    fd = -1; /* lo_do_open() takes ownership of fd */
-+    if (err) {
-+        /* Undo lo_do_lookup() nlookup ref */
-+        unref_inode_lolocked(lo, inode, 1);
-     }
- 
- out:
-+    lo_inode_put(lo, &inode);
-     lo_inode_put(lo, &parent_inode);
- 
-     if (err) {
-+        if (fd >= 0) {
-+            close(fd);
-+        }
-+
-         fuse_reply_err(req, err);
-     } else {
-         fuse_reply_create(req, &e, fi);
-@@ -1770,7 +1812,6 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
-                                                       pid_t pid, int *err)
- {
-     struct lo_inode_plock *plock;
--    char procname[64];
-     int fd;
- 
-     plock =
-@@ -1787,12 +1828,10 @@ static struct lo_inode_plock *lookup_create_plock_ctx(struct lo_data *lo,
-     }
- 
-     /* Open another instance of file which can be used for ofd locks. */
--    sprintf(procname, "%i", inode->fd);
--
-     /* TODO: What if file is not writable? */
--    fd = openat(lo->proc_self_fd, procname, O_RDWR);
--    if (fd == -1) {
--        *err = errno;
-+    fd = lo_inode_open(lo, inode, O_RDWR);
-+    if (fd < 0) {
-+        *err = -fd;
-         free(plock);
-         return NULL;
-     }
-@@ -1949,7 +1988,7 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
-         return;
-     }
- 
--    err = lo_do_open(lo, inode, fi);
-+    err = lo_do_open(lo, inode, -1, fi);
-     lo_inode_put(lo, &inode);
-     if (err) {
-         fuse_reply_err(req, err);
-@@ -2014,39 +2053,40 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
- static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
-                      struct fuse_file_info *fi)
- {
-+    struct lo_inode *inode = lo_inode(req, ino);
-+    struct lo_data *lo = lo_data(req);
-     int res;
-     int fd;
--    char *buf;
- 
-     fuse_log(FUSE_LOG_DEBUG, "lo_fsync(ino=%" PRIu64 ", fi=0x%p)\n", ino,
-              (void *)fi);
- 
--    if (!fi) {
--        struct lo_data *lo = lo_data(req);
--
--        res = asprintf(&buf, "%i", lo_fd(req, ino));
--        if (res == -1) {
--            return (void)fuse_reply_err(req, errno);
--        }
-+    if (!inode) {
-+        fuse_reply_err(req, EBADF);
-+        return;
-+    }
- 
--        fd = openat(lo->proc_self_fd, buf, O_RDWR);
--        free(buf);
--        if (fd == -1) {
--            return (void)fuse_reply_err(req, errno);
-+    if (!fi) {
-+        fd = lo_inode_open(lo, inode, O_RDWR);
-+        if (fd < 0) {
-+            res = -fd;
-+            goto out;
-         }
-     } else {
-         fd = lo_fi_fd(req, fi);
-     }
- 
-     if (datasync) {
--        res = fdatasync(fd);
-+        res = fdatasync(fd) == -1 ? errno : 0;
-     } else {
--        res = fsync(fd);
-+        res = fsync(fd) == -1 ? errno : 0;
-     }
-     if (!fi) {
-         close(fd);
-     }
--    fuse_reply_err(req, res == -1 ? errno : 0);
-+out:
-+    lo_inode_put(lo, &inode);
-+    fuse_reply_err(req, res);
- }
- 
- static void lo_read(fuse_req_t req, fuse_ino_t ino, size_t size, off_t offset,
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch
deleted file mode 100644
index 1b8c77f8386..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-20181.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From c2d2d14e8deece958bbc4fc649d22c3564bc4e7e Mon Sep 17 00:00:00 2001
-From: Greg Kurz <groug@kaod.org>
-Date: Thu, 14 Jan 2021 17:04:12 +0100
-Subject: [PATCH] 9pfs: Fully restart unreclaim loop (CVE-2021-20181)
-
-Depending on the client activity, the server can be asked to open a huge
-number of file descriptors and eventually hit RLIMIT_NOFILE. This is
-currently mitigated using a reclaim logic : the server closes the file
-descriptors of idle fids, based on the assumption that it will be able
-to re-open them later. This assumption doesn't hold of course if the
-client requests the file to be unlinked. In this case, we loop on the
-entire fid list and mark all related fids as unreclaimable (the reclaim
-logic will just ignore them) and, of course, we open or re-open their
-file descriptors if needed since we're about to unlink the file.
-
-This is the purpose of v9fs_mark_fids_unreclaim(). Since the actual
-opening of a file can cause the coroutine to yield, another client
-request could possibly add a new fid that we may want to mark as
-non-reclaimable as well. The loop is thus restarted if the re-open
-request was actually transmitted to the backend. This is achieved
-by keeping a reference on the first fid (head) before traversing
-the list.
-
-This is wrong in several ways:
-- a potential clunk request from the client could tear the first
-  fid down and cause the reference to be stale. This leads to a
-  use-after-free error that can be detected with ASAN, using a
-  custom 9p client
-- fids are added at the head of the list : restarting from the
-  previous head will always miss fids added by a some other
-  potential request
-
-All these problems could be avoided if fids were being added at the
-end of the list. This can be achieved with a QSIMPLEQ, but this is
-probably too much change for a bug fix. For now let's keep it
-simple and just restart the loop from the current head.
-
-Fixes: CVE-2021-20181
-Buglink: https://bugs.launchpad.net/qemu/+bug/1911666
-Reported-by: Zero Day Initiative <zdi-disclosures@trendmicro.com>
-Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
-Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
-Message-Id: <161064025265.1838153.15185571283519390907.stgit@bahia.lan>
-Signed-off-by: Greg Kurz <groug@kaod.org>
-
-Upstream-Status: Backport [89fbea8737e8f7b954745a1ffc4238d377055305]
-CVE: CVE-2021-20181
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/9pfs/9p.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
-index 94df440fc..6026b51a1 100644
---- a/hw/9pfs/9p.c
-+++ b/hw/9pfs/9p.c
-@@ -502,9 +502,9 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
- {
-     int err;
-     V9fsState *s = pdu->s;
--    V9fsFidState *fidp, head_fid;
-+    V9fsFidState *fidp;
- 
--    head_fid.next = s->fid_list;
-+again:
-     for (fidp = s->fid_list; fidp; fidp = fidp->next) {
-         if (fidp->path.size != path->size) {
-             continue;
-@@ -524,7 +524,7 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
-              * switched to the worker thread
-              */
-             if (err == 0) {
--                fidp = &head_fid;
-+                goto again;
-             }
-         }
-     }
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
deleted file mode 100644
index 269c6f12940..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From: Prasad J Pandit <pjp@fedoraproject.org>
-
-While activating device in vmxnet3_acticate_device(), it does not
-validate guest supplied configuration values against predefined
-minimum - maximum limits. This may lead to integer overflow or
-OOB access issues. Add checks to avoid it.
-
-Fixes: CVE-2021-20203
-Buglink: https://bugs.launchpad.net/qemu/+bug/1913873
-Reported-by: Gaoning Pan <pgn@zju.edu.cn>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-
-Upstream-Status: Acepted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07935.html]
-CVE: CVE-2021-20203
-Signed-off-by: Minjae Kim <flowergom@gmail.com>
----
- hw/net/vmxnet3.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
-index eff299f629..4a910ca971 100644
---- a/hw/net/vmxnet3.c
-+++ b/hw/net/vmxnet3.c
-@@ -1420,6 +1420,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
-     vmxnet3_setup_rx_filtering(s);
-     /* Cache fields from shared memory */
-     s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
-+    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
-     VMW_CFPRN("MTU is %u", s->mtu);
- 
-     s->max_rx_frags =
-@@ -1473,6 +1474,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
-         /* Read rings memory locations for TX queues */
-         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBasePA);
-         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRingSize);
-+        if (size > VMXNET3_TX_RING_MAX_SIZE) {
-+            size = VMXNET3_TX_RING_MAX_SIZE;
-+        }
- 
-         vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
-                           sizeof(struct Vmxnet3_TxDesc), false);
-@@ -1483,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
-         /* TXC ring */
-         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRingBasePA);
-         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRingSize);
-+        if (size > VMXNET3_TC_RING_MAX_SIZE) {
-+            size = VMXNET3_TC_RING_MAX_SIZE;
-+        }
-         vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
-                           sizeof(struct Vmxnet3_TxCompDesc), true);
-         VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_ring);
-@@ -1524,6 +1531,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
-             /* RX rings */
-             pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
-             size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
-+            if (size > VMXNET3_RX_RING_MAX_SIZE) {
-+                size = VMXNET3_RX_RING_MAX_SIZE;
-+            }
-             vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
-                               sizeof(struct Vmxnet3_RxDesc), false);
-             VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
-@@ -1533,6 +1543,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
-         /* RXC ring */
-         pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBasePA);
-         size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSize);
-+        if (size > VMXNET3_RC_RING_MAX_SIZE) {
-+            size = VMXNET3_RC_RING_MAX_SIZE;
-+        }
-         vmxnet3_ring_init(d, &s->rxq_descr[i].comp_ring, pa, size,
-                           sizeof(struct Vmxnet3_RxCompDesc), true);
-         VMW_CFPRN("RXC queue %d: Base: %" PRIx64 ", Size: %d", i, pa, size);
--- 
-2.29.2
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
deleted file mode 100644
index d762a51d021..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From e428bcfb86fb46d9773ae11e69712052dcff3d45 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
-Date: Sun, 31 Jan 2021 11:34:01 +0100
-Subject: [PATCH] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Per the ARM Generic Interrupt Controller Architecture specification
-(document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
-not 10:
-
-  - 4.3 Distributor register descriptions
-  - 4.3.15 Software Generated Interrupt Register, GICD_SG
-
-    - Table 4-21 GICD_SGIR bit assignments
-
-    The Interrupt ID of the SGI to forward to the specified CPU
-    interfaces. The value of this field is the Interrupt ID, in
-    the range 0-15, for example a value of 0b0011 specifies
-    Interrupt ID 3.
-
-Correct the irq mask to fix an undefined behavior (which eventually
-lead to a heap-buffer-overflow, see [Buglink]):
-
-   $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
-   [I 1612088147.116987] OPENED
-  [R +0.278293] writel 0x8000f00 0xff4affb0
-  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
-  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13
-
-This fixes a security issue when running with KVM on Arm with
-kernel-irqchip=off. (The default is kernel-irqchip=on, which is
-unaffected, and which is also the correct choice for performance.)
-
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2021-20221
-Fixes: 9ee6e8bb853 ("ARMv7 support.")
-Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
-Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Message-id: 20210131103401.217160-1-f4bug@amsat.org
-Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-
-Upstream-Status: Backport [edfe2eb4360cde4ed5d95bda7777edcb3510f76a]
-CVE: CVE-2021-20221
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/intc/arm_gic.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
-index c60dc6b5e..fbde60de0 100644
---- a/hw/intc/arm_gic.c
-+++ b/hw/intc/arm_gic.c
-@@ -1474,7 +1474,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
-         int target_cpu;
- 
-         cpu = gic_get_current_cpu(s);
--        irq = value & 0x3ff;
-+        irq = value & 0xf;
-         switch ((value >> 24) & 3) {
-         case 0:
-             mask = (value >> 16) & ALL_CPU_MASK;
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
deleted file mode 100644
index 7175b24e99a..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From affdf476543405045c281a7c67d1eaedbcea8135 Mon Sep 17 00:00:00 2001
-From: Jason Wang <jasowang@redhat.com>
-Date: Wed, 24 Feb 2021 13:45:28 +0800
-Subject: [PATCH] e1000: fail early for evil descriptor
-
-During procss_tx_desc(), driver can try to chain data descriptor with
-legacy descriptor, when will lead underflow for the following
-calculation in process_tx_desc() for bytes:
-
-            if (tp->size + bytes > msh)
-                bytes = msh - tp->size;
-
-This will lead a infinite loop. So check and fail early if tp->size if
-greater or equal to msh.
-
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
-Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [3de46e6fc489c52c9431a8a832ad8170a7569bd8]
-CVE: CVE-2021-20257
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/e1000.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/hw/net/e1000.c b/hw/net/e1000.c
-index cf22c4f07..c3564c7ce 100644
---- a/hw/net/e1000.c
-+++ b/hw/net/e1000.c
-@@ -670,6 +670,9 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
-         msh = tp->tso_props.hdr_len + tp->tso_props.mss;
-         do {
-             bytes = split_size;
-+            if (tp->size >= msh) {
-+                goto eop;
-+            }
-             if (tp->size + bytes > msh)
-                 bytes = msh - tp->size;
- 
-@@ -695,6 +698,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
-         tp->size += split_size;
-     }
- 
-+eop:
-     if (!(txd_lower & E1000_TXD_CMD_EOP))
-         return;
-     if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20263.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20263.patch
deleted file mode 100644
index 4f9a91f0c6e..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-20263.patch
+++ /dev/null
@@ -1,214 +0,0 @@
-From aaa5f8e00c2e85a893b972f1e243fb14c26b70dc Mon Sep 17 00:00:00 2001
-From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
-Date: Wed, 24 Feb 2021 19:56:25 +0000
-Subject: [PATCH 2/2] virtiofs: drop remapped security.capability xattr as
- needed
-
-On Linux, the 'security.capability' xattr holds a set of
-capabilities that can change when an executable is run, giving
-a limited form of privilege escalation to those programs that
-the writer of the file deemed worthy.
-
-Any write causes the 'security.capability' xattr to be dropped,
-stopping anyone from gaining privilege by modifying a blessed
-file.
-
-Fuse relies on the daemon to do this dropping, and in turn the
-daemon relies on the host kernel to drop the xattr for it.  However,
-with the addition of -o xattrmap, the xattr that the guest
-stores its capabilities in is now not the same as the one that
-the host kernel automatically clears.
-
-Where the mapping changes 'security.capability', explicitly clear
-the remapped name to preserve the same behaviour.
-
-This bug is assigned CVE-2021-20263.
-
-Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
-
-Upstream-Status: Backport [e586edcb410543768ef009eaa22a2d9dd4a53846]
-CVE: CVE-2021-20263
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- docs/tools/virtiofsd.rst         |  4 ++
- tools/virtiofsd/passthrough_ll.c | 77 +++++++++++++++++++++++++++++++-
- 2 files changed, 80 insertions(+), 1 deletion(-)
-
-diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
-index 866b7db3e..00554c75b 100644
---- a/docs/tools/virtiofsd.rst
-+++ b/docs/tools/virtiofsd.rst
-@@ -228,6 +228,10 @@ The 'map' type adds a number of separate rules to add **prepend** as a prefix
- to the matched **key** (or all attributes if **key** is empty).
- There may be at most one 'map' rule and it must be the last rule in the set.
- 
-+Note: When the 'security.capability' xattr is remapped, the daemon has to do
-+extra work to remove it during many operations, which the host kernel normally
-+does itself.
-+
- xattr-mapping Examples
- ----------------------
- 
-diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
-index 03c5e0d13..c9197da86 100644
---- a/tools/virtiofsd/passthrough_ll.c
-+++ b/tools/virtiofsd/passthrough_ll.c
-@@ -160,6 +160,7 @@ struct lo_data {
-     int posix_lock;
-     int xattr;
-     char *xattrmap;
-+    char *xattr_security_capability;
-     char *source;
-     char *modcaps;
-     double timeout;
-@@ -226,6 +227,8 @@ static __thread bool cap_loaded = 0;
- 
- static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
-                                 uint64_t mnt_id);
-+static int xattr_map_client(const struct lo_data *lo, const char *client_name,
-+                            char **out_name);
- 
- static int is_dot_or_dotdot(const char *name)
- {
-@@ -365,6 +368,37 @@ out:
-     return ret;
- }
- 
-+/*
-+ * The host kernel normally drops security.capability xattr's on
-+ * any write, however if we're remapping xattr names we need to drop
-+ * whatever the clients security.capability is actually stored as.
-+ */
-+static int drop_security_capability(const struct lo_data *lo, int fd)
-+{
-+    if (!lo->xattr_security_capability) {
-+        /* We didn't remap the name, let the host kernel do it */
-+        return 0;
-+    }
-+    if (!fremovexattr(fd, lo->xattr_security_capability)) {
-+        /* All good */
-+        return 0;
-+    }
-+
-+    switch (errno) {
-+    case ENODATA:
-+        /* Attribute didn't exist, that's fine */
-+        return 0;
-+
-+    case ENOTSUP:
-+        /* FS didn't support attribute anyway, also fine */
-+        return 0;
-+
-+    default:
-+        /* Hmm other error */
-+        return errno;
-+    }
-+}
-+
- static void lo_map_init(struct lo_map *map)
- {
-     map->elems = NULL;
-@@ -717,6 +751,11 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
-         uid_t uid = (valid & FUSE_SET_ATTR_UID) ? attr->st_uid : (uid_t)-1;
-         gid_t gid = (valid & FUSE_SET_ATTR_GID) ? attr->st_gid : (gid_t)-1;
- 
-+        saverr = drop_security_capability(lo, ifd);
-+        if (saverr) {
-+            goto out_err;
-+        }
-+
-         res = fchownat(ifd, "", uid, gid, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
-         if (res == -1) {
-             goto out_err;
-@@ -735,6 +774,14 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
-             }
-         }
- 
-+	saverr = drop_security_capability(lo, truncfd);
-+        if (saverr) {
-+            if (!fi) {
-+                close(truncfd);
-+            }
-+            goto out_err;
-+        }
-+
-         res = ftruncate(truncfd, attr->st_size);
-         if (!fi) {
-             saverr = errno;
-@@ -1726,6 +1773,13 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
-         if (fd < 0) {
-             return -fd;
-         }
-+        if (fi->flags & (O_TRUNC)) {
-+            int err = drop_security_capability(lo, fd);
-+            if (err) {
-+                close(fd);
-+                return err;
-+            }
-+        }
-     }
- 
-     pthread_mutex_lock(&lo->mutex);
-@@ -2114,6 +2168,12 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t ino,
-              "lo_write_buf(ino=%" PRIu64 ", size=%zd, off=%lu)\n", ino,
-              out_buf.buf[0].size, (unsigned long)off);
- 
-+    res = drop_security_capability(lo_data(req), out_buf.buf[0].fd);
-+    if (res) {
-+        fuse_reply_err(req, res);
-+        return;
-+    }
-+
-     /*
-      * If kill_priv is set, drop CAP_FSETID which should lead to kernel
-      * clearing setuid/setgid on file.
-@@ -2353,6 +2413,7 @@ static void parse_xattrmap(struct lo_data *lo)
- {
-     const char *map = lo->xattrmap;
-     const char *tmp;
-+    int ret;
- 
-     lo->xattr_map_nentries = 0;
-     while (*map) {
-@@ -2383,7 +2444,7 @@ static void parse_xattrmap(struct lo_data *lo)
-              * the last entry.
-              */
-             parse_xattrmap_map(lo, map, sep);
--            return;
-+            break;
-         } else {
-             fuse_log(FUSE_LOG_ERR,
-                      "%s: Unexpected type;"
-@@ -2452,6 +2513,19 @@ static void parse_xattrmap(struct lo_data *lo)
-         fuse_log(FUSE_LOG_ERR, "Empty xattr map\n");
-         exit(1);
-     }
-+
-+    ret = xattr_map_client(lo, "security.capability",
-+                           &lo->xattr_security_capability);
-+    if (ret) {
-+        fuse_log(FUSE_LOG_ERR, "Failed to map security.capability: %s\n",
-+                strerror(ret));
-+        exit(1);
-+    }
-+    if (!strcmp(lo->xattr_security_capability, "security.capability")) {
-+        /* 1-1 mapping, don't need to do anything */
-+        free(lo->xattr_security_capability);
-+        lo->xattr_security_capability = NULL;
-+    }
- }
- 
- /*
-@@ -3480,6 +3554,7 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
- 
-     free(lo->xattrmap);
-     free_xattrmap(lo);
-+    free(lo->xattr_security_capability);
-     free(lo->source);
- }
- 
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
deleted file mode 100644
index af94cff7e88..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 3791642c8d60029adf9b00bcb4e34d7d8a1aea4d Mon Sep 17 00:00:00 2001
-From: Michael Tokarev <mjt@tls.msk.ru>
-Date: Mon, 19 Apr 2021 15:42:47 +0200
-Subject: [PATCH] mptsas: Remove unused MPTSASState 'pending' field
- (CVE-2021-3392)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-While processing SCSI i/o requests in mptsas_process_scsi_io_request(),
-the Megaraid emulator appends new MPTSASRequest object 'req' to
-the 's->pending' queue. In case of an error, this same object gets
-dequeued in mptsas_free_request() only if SCSIRequest object
-'req->sreq' is initialised. This may lead to a use-after-free issue.
-
-Since s->pending is actually not used, simply remove it from
-MPTSASState.
-
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
-Message-id: 20210419134247.1467982-1-f4bug@amsat.org
-Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
-Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
-Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
-BugLink: https://bugs.launchpad.net/qemu/+bug/1914236 (CVE-2021-3392)
-Fixes: e351b826112 ("hw: Add support for LSI SAS1068 (mptsas) device")
-[PMD: Reworded description, added more tags]
-Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-
-CVE: CVE-2021-3392
-Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=3791642c8d60029adf9b00bcb4e34d7d8a1aea4d]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- hw/scsi/mptsas.c | 6 ------
- hw/scsi/mptsas.h | 1 -
- 2 files changed, 7 deletions(-)
-
-diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
-index 7416e7870614..db3219e7d206 100644
---- a/hw/scsi/mptsas.c
-+++ b/hw/scsi/mptsas.c
-@@ -251,13 +251,10 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
- 
- static void mptsas_free_request(MPTSASRequest *req)
- {
--    MPTSASState *s = req->dev;
--
-     if (req->sreq != NULL) {
-         req->sreq->hba_private = NULL;
-         scsi_req_unref(req->sreq);
-         req->sreq = NULL;
--        QTAILQ_REMOVE(&s->pending, req, next);
-     }
-     qemu_sglist_destroy(&req->qsg);
-     g_free(req);
-@@ -303,7 +300,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
-     }
- 
-     req = g_new0(MPTSASRequest, 1);
--    QTAILQ_INSERT_TAIL(&s->pending, req, next);
-     req->scsi_io = *scsi_io;
-     req->dev = s;
- 
-@@ -1319,8 +1315,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
- 
-     s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
- 
--    QTAILQ_INIT(&s->pending);
--
-     scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
- }
- 
-diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
-index b85ac1a5fcc7..c046497db719 100644
---- a/hw/scsi/mptsas.h
-+++ b/hw/scsi/mptsas.h
-@@ -79,7 +79,6 @@ struct MPTSASState {
-     uint16_t reply_frame_size;
- 
-     SCSIBus bus;
--    QTAILQ_HEAD(, MPTSASRequest) pending;
- };
- 
- void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch
deleted file mode 100644
index f9395add431..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From c01ae9a35b3c6b4a8e1f1bfa0a0caafe394f8b5c Mon Sep 17 00:00:00 2001
-From: Bin Meng <bmeng.cn@gmail.com>
-Date: Tue, 16 Feb 2021 11:46:52 +0800
-Subject: [PATCH 1/6] hw/sd: sdhci: Simplify updating s->prnsts in
- sdhci_sdma_transfer_multi_blocks()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-s->prnsts is updated in both branches of the if () else () statement.
-Move the common bits outside so that it is cleaner.
-
-Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
-Tested-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Message-Id: <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
-Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-Upstream-Status: Backport [8bc1f1aa51d32c3184e7b19d5b94c35ecc06f056]
-CVE: CVE-2021-3409
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/sd/sdhci.c | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
-index 2f8b74a84..f83c5e295 100644
---- a/hw/sd/sdhci.c
-+++ b/hw/sd/sdhci.c
-@@ -596,9 +596,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
-         page_aligned = true;
-     }
- 
-+    s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
-     if (s->trnmod & SDHC_TRNS_READ) {
--        s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
--                SDHC_DAT_LINE_ACTIVE;
-+        s->prnsts |= SDHC_DOING_READ;
-         while (s->blkcnt) {
-             if (s->data_count == 0) {
-                 sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
-@@ -625,8 +625,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
-             }
-         }
-     } else {
--        s->prnsts |= SDHC_DOING_WRITE | SDHC_DATA_INHIBIT |
--                SDHC_DAT_LINE_ACTIVE;
-+        s->prnsts |= SDHC_DOING_WRITE;
-         while (s->blkcnt) {
-             begin = s->data_count;
-             if (((boundary_count + begin) < block_size) && page_aligned) {
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
deleted file mode 100644
index f3d2bb13758..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From b9bb4700798bce98888c51d7b6dbc19ec49159d5 Mon Sep 17 00:00:00 2001
-From: Bin Meng <bmeng.cn@gmail.com>
-Date: Wed, 3 Mar 2021 20:26:35 +0800
-Subject: [PATCH 2/6] hw/sd: sdhci: Don't transfer any data when command time
- out
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-At the end of sdhci_send_command(), it starts a data transfer if the
-command register indicates data is associated. But the data transfer
-should only be initiated when the command execution has succeeded.
-
-With this fix, the following reproducer:
-
-outl 0xcf8 0x80001810
-outl 0xcfc 0xe1068000
-outl 0xcf8 0x80001804
-outw 0xcfc 0x7
-write 0xe106802c 0x1 0x0f
-write 0xe1068004 0xc 0x2801d10101fffffbff28a384
-write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
-write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
-write 0xe1068003 0x1 0xfe
-
-cannot be reproduced with the following QEMU command line:
-
-$ qemu-system-x86_64 -nographic -M pc-q35-5.0 \
-      -device sdhci-pci,sd-spec-version=3 \
-      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
-      -device sd-card,drive=mydrive \
-      -monitor none -serial none -qtest stdio
-
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2020-17380
-Fixes: CVE-2020-25085
-Fixes: CVE-2021-3409
-Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
-Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
-Reported-by: Simon Wörner (Ruhr-Universität Bochum)
-Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
-Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
-Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
-Acked-by: Alistair Francis <alistair.francis@wdc.com>
-Tested-by: Alexander Bulekov <alxndr@bu.edu>
-Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
-Message-Id: <20210303122639.20004-2-bmeng.cn@gmail.com>
-Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-Upstream-Status: Backport [b263d8f928001b5cfa2a993ea43b7a5b3a1811e8]
-CVE: CVE-2021-3409
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/sd/sdhci.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
-index f83c5e295..44f8a82ea 100644
---- a/hw/sd/sdhci.c
-+++ b/hw/sd/sdhci.c
-@@ -326,6 +326,7 @@ static void sdhci_send_command(SDHCIState *s)
-     SDRequest request;
-     uint8_t response[16];
-     int rlen;
-+    bool timeout = false;
- 
-     s->errintsts = 0;
-     s->acmd12errsts = 0;
-@@ -349,6 +350,7 @@ static void sdhci_send_command(SDHCIState *s)
-             trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
-                                    s->rspreg[1], s->rspreg[0]);
-         } else {
-+            timeout = true;
-             trace_sdhci_error("timeout waiting for command response");
-             if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
-                 s->errintsts |= SDHC_EIS_CMDTIMEOUT;
-@@ -369,7 +371,7 @@ static void sdhci_send_command(SDHCIState *s)
- 
-     sdhci_update_irq(s);
- 
--    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
-+    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
-         s->data_count = 0;
-         sdhci_data_transfer(s);
-     }
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
deleted file mode 100644
index c3b37ed616d..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 405ca416ccc8135544a4fe5732974497244128c9 Mon Sep 17 00:00:00 2001
-From: Bin Meng <bmeng.cn@gmail.com>
-Date: Wed, 3 Mar 2021 20:26:36 +0800
-Subject: [PATCH 3/6] hw/sd: sdhci: Don't write to SDHC_SYSAD register when
- transfer is in progress
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Per "SD Host Controller Standard Specification Version 7.00"
-chapter 2.2.1 SDMA System Address Register:
-
-This register can be accessed only if no transaction is executing
-(i.e., after a transaction has stopped).
-
-With this fix, the following reproducer:
-
-outl 0xcf8 0x80001010
-outl 0xcfc 0xfbefff00
-outl 0xcf8 0x80001001
-outl 0xcfc 0x06000000
-write 0xfbefff2c 0x1 0x05
-write 0xfbefff0f 0x1 0x37
-write 0xfbefff0a 0x1 0x01
-write 0xfbefff0f 0x1 0x29
-write 0xfbefff0f 0x1 0x02
-write 0xfbefff0f 0x1 0x03
-write 0xfbefff04 0x1 0x01
-write 0xfbefff05 0x1 0x01
-write 0xfbefff07 0x1 0x02
-write 0xfbefff0c 0x1 0x33
-write 0xfbefff0e 0x1 0x20
-write 0xfbefff0f 0x1 0x00
-write 0xfbefff2a 0x1 0x01
-write 0xfbefff0c 0x1 0x00
-write 0xfbefff03 0x1 0x00
-write 0xfbefff05 0x1 0x00
-write 0xfbefff2a 0x1 0x02
-write 0xfbefff0c 0x1 0x32
-write 0xfbefff01 0x1 0x01
-write 0xfbefff02 0x1 0x01
-write 0xfbefff03 0x1 0x01
-
-cannot be reproduced with the following QEMU command line:
-
-$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
-       -nodefaults -device sdhci-pci,sd-spec-version=3 \
-       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
-       -device sd-card,drive=mydrive -qtest stdio
-
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2020-17380
-Fixes: CVE-2020-25085
-Fixes: CVE-2021-3409
-Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
-Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
-Reported-by: Simon Wörner (Ruhr-Universität Bochum)
-Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
-Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
-Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
-Tested-by: Alexander Bulekov <alxndr@bu.edu>
-Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
-Message-Id: <20210303122639.20004-3-bmeng.cn@gmail.com>
-Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-Upstream-Status: Backport [8be45cc947832b3c02144c9d52921f499f2d77fe]
-CVE: CVE-2021-3409
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/sd/sdhci.c | 20 +++++++++++---------
- 1 file changed, 11 insertions(+), 9 deletions(-)
-
-diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
-index 44f8a82ea..d8a46f307 100644
---- a/hw/sd/sdhci.c
-+++ b/hw/sd/sdhci.c
-@@ -1121,15 +1121,17 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
- 
-     switch (offset & ~0x3) {
-     case SDHC_SYSAD:
--        s->sdmasysad = (s->sdmasysad & mask) | value;
--        MASKED_WRITE(s->sdmasysad, mask, value);
--        /* Writing to last byte of sdmasysad might trigger transfer */
--        if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->blkcnt &&
--                s->blksize && SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
--            if (s->trnmod & SDHC_TRNS_MULTI) {
--                sdhci_sdma_transfer_multi_blocks(s);
--            } else {
--                sdhci_sdma_transfer_single_block(s);
-+        if (!TRANSFERRING_DATA(s->prnsts)) {
-+            s->sdmasysad = (s->sdmasysad & mask) | value;
-+            MASKED_WRITE(s->sdmasysad, mask, value);
-+            /* Writing to last byte of sdmasysad might trigger transfer */
-+            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
-+                SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
-+                if (s->trnmod & SDHC_TRNS_MULTI) {
-+                    sdhci_sdma_transfer_multi_blocks(s);
-+                } else {
-+                    sdhci_sdma_transfer_single_block(s);
-+                }
-             }
-         }
-         break;
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
deleted file mode 100644
index d5be99759db..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From b672bcaf5522294a4d8de3e88e0932d55585ee3b Mon Sep 17 00:00:00 2001
-From: Bin Meng <bmeng.cn@gmail.com>
-Date: Wed, 3 Mar 2021 20:26:37 +0800
-Subject: [PATCH 4/6] hw/sd: sdhci: Correctly set the controller status for
- ADMA
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When an ADMA transfer is started, the codes forget to set the
-controller status to indicate a transfer is in progress.
-
-With this fix, the following 2 reproducers:
-
-https://paste.debian.net/plain/1185136
-https://paste.debian.net/plain/1185141
-
-cannot be reproduced with the following QEMU command line:
-
-$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
-      -nodefaults -device sdhci-pci,sd-spec-version=3 \
-      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
-      -device sd-card,drive=mydrive -qtest stdio
-
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2020-17380
-Fixes: CVE-2020-25085
-Fixes: CVE-2021-3409
-Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
-Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
-Reported-by: Simon Wörner (Ruhr-Universität Bochum)
-Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
-Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
-Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
-Tested-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
-Message-Id: <20210303122639.20004-4-bmeng.cn@gmail.com>
-Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-Upstream-Status: Backport [bc6f28995ff88f5d82c38afcfd65406f0ae375aa]
-CVE: CVE-2021-3409
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/sd/sdhci.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
-index d8a46f307..7de03c6dd 100644
---- a/hw/sd/sdhci.c
-+++ b/hw/sd/sdhci.c
-@@ -768,7 +768,9 @@ static void sdhci_do_adma(SDHCIState *s)
- 
-         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
-         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
-+            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
-             if (s->trnmod & SDHC_TRNS_READ) {
-+                s->prnsts |= SDHC_DOING_READ;
-                 while (length) {
-                     if (s->data_count == 0) {
-                         sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
-@@ -796,6 +798,7 @@ static void sdhci_do_adma(SDHCIState *s)
-                     }
-                 }
-             } else {
-+                s->prnsts |= SDHC_DOING_WRITE;
-                 while (length) {
-                     begin = s->data_count;
-                     if ((length + begin) < block_size) {
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
deleted file mode 100644
index 7199056838c..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From c2298884cf6bcf2b047b4bae5f78432b052b5729 Mon Sep 17 00:00:00 2001
-From: Bin Meng <bmeng.cn@gmail.com>
-Date: Wed, 3 Mar 2021 20:26:38 +0800
-Subject: [PATCH 5/6] hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE
- register is writable
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The codes to limit the maximum block size is only necessary when
-SDHC_BLKSIZE register is writable.
-
-Tested-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
-Message-Id: <20210303122639.20004-5-bmeng.cn@gmail.com>
-Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-Upstream-Status: Backport [5cd7aa3451b76bb19c0f6adc2b931f091e5d7fcd]
-CVE: CVE-2021-3409
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/sd/sdhci.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
-index 7de03c6dd..6c780126e 100644
---- a/hw/sd/sdhci.c
-+++ b/hw/sd/sdhci.c
-@@ -1142,15 +1142,15 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
-         if (!TRANSFERRING_DATA(s->prnsts)) {
-             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
-             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
--        }
- 
--        /* Limit block size to the maximum buffer size */
--        if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
--            qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger than "
--                          "the maximum buffer 0x%x\n", __func__, s->blksize,
--                          s->buf_maxsz);
-+            /* Limit block size to the maximum buffer size */
-+            if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
-+                qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger than "
-+                              "the maximum buffer 0x%x\n", __func__, s->blksize,
-+                              s->buf_maxsz);
- 
--            s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
-+                s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
-+            }
-         }
- 
-         break;
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch
deleted file mode 100644
index 624c1f64960..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From db916870a839346767b6d5ca7d0eed3128ba5fea Mon Sep 17 00:00:00 2001
-From: Bin Meng <bmeng.cn@gmail.com>
-Date: Wed, 3 Mar 2021 20:26:39 +0800
-Subject: [PATCH 6/6] hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[]
- when a different block size is programmed
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If the block size is programmed to a different value from the
-previous one, reset the data pointer of s->fifo_buffer[] so that
-s->fifo_buffer[] can be filled in using the new block size in
-the next transfer.
-
-With this fix, the following reproducer:
-
-outl 0xcf8 0x80001010
-outl 0xcfc 0xe0000000
-outl 0xcf8 0x80001001
-outl 0xcfc 0x06000000
-write 0xe000002c 0x1 0x05
-write 0xe0000005 0x1 0x02
-write 0xe0000007 0x1 0x01
-write 0xe0000028 0x1 0x10
-write 0x0 0x1 0x23
-write 0x2 0x1 0x08
-write 0xe000000c 0x1 0x01
-write 0xe000000e 0x1 0x20
-write 0xe000000f 0x1 0x00
-write 0xe000000c 0x1 0x32
-write 0xe0000004 0x2 0x0200
-write 0xe0000028 0x1 0x00
-write 0xe0000003 0x1 0x40
-
-cannot be reproduced with the following QEMU command line:
-
-$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
-      -nodefaults -device sdhci-pci,sd-spec-version=3 \
-      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
-      -device sd-card,drive=mydrive -qtest stdio
-
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2020-17380
-Fixes: CVE-2020-25085
-Fixes: CVE-2021-3409
-Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
-Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
-Reported-by: Simon Wörner (Ruhr-Universität Bochum)
-Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
-Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
-Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
-Tested-by: Alexander Bulekov <alxndr@bu.edu>
-Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
-Message-Id: <20210303122639.20004-6-bmeng.cn@gmail.com>
-Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
-
-Upstream-Status: Backport [cffb446e8fd19a14e1634c7a3a8b07be3f01d5c9]
-CVE: CVE-2021-3409
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/sd/sdhci.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
-index 6c780126e..216842420 100644
---- a/hw/sd/sdhci.c
-+++ b/hw/sd/sdhci.c
-@@ -1140,6 +1140,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
-         break;
-     case SDHC_BLKSIZE:
-         if (!TRANSFERRING_DATA(s->prnsts)) {
-+            uint16_t blksize = s->blksize;
-+
-             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
-             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
- 
-@@ -1151,6 +1153,16 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
- 
-                 s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
-             }
-+
-+            /*
-+             * If the block size is programmed to a different value from
-+             * the previous one, reset the data pointer of s->fifo_buffer[]
-+             * so that s->fifo_buffer[] can be filled in using the new block
-+             * size in the next transfer.
-+             */
-+            if (blksize != s->blksize) {
-+                s->data_count = 0;
-+            }
-         }
- 
-         break;
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
deleted file mode 100644
index 5bacd674813..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_1.patch
+++ /dev/null
@@ -1,177 +0,0 @@
-From 4b1988a29d67277d6c8ce1df52975f5616592913 Mon Sep 17 00:00:00 2001
-From: Jason Wang <jasowang@redhat.com>
-Date: Wed, 24 Feb 2021 11:44:36 +0800
-Subject: [PATCH 01/10] net: introduce qemu_receive_packet()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Some NIC supports loopback mode and this is done by calling
-nc->info->receive() directly which in fact suppresses the effort of
-reentrancy check that is done in qemu_net_queue_send().
-
-Unfortunately we can't use qemu_net_queue_send() here since for
-loopback there's no sender as peer, so this patch introduce a
-qemu_receive_packet() which is used for implementing loopback mode
-for a NIC with this check.
-
-NIC that supports loopback mode will be converted to this helper.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Cc: qemu-stable@nongnu.org
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [705df5466c98f3efdd2b68d3b31dad86858acad7]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- include/net/net.h   |  5 +++++
- include/net/queue.h |  8 ++++++++
- net/net.c           | 38 +++++++++++++++++++++++++++++++-------
- net/queue.c         | 22 ++++++++++++++++++++++
- 4 files changed, 66 insertions(+), 7 deletions(-)
-
-diff --git a/include/net/net.h b/include/net/net.h
-index 778fc787c..03f058ecb 100644
---- a/include/net/net.h
-+++ b/include/net/net.h
-@@ -143,12 +143,17 @@ void *qemu_get_nic_opaque(NetClientState *nc);
- void qemu_del_net_client(NetClientState *nc);
- typedef void (*qemu_nic_foreach)(NICState *nic, void *opaque);
- void qemu_foreach_nic(qemu_nic_foreach func, void *opaque);
-+int qemu_can_receive_packet(NetClientState *nc);
- int qemu_can_send_packet(NetClientState *nc);
- ssize_t qemu_sendv_packet(NetClientState *nc, const struct iovec *iov,
-                           int iovcnt);
- ssize_t qemu_sendv_packet_async(NetClientState *nc, const struct iovec *iov,
-                                 int iovcnt, NetPacketSent *sent_cb);
- ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size);
-+ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size);
-+ssize_t qemu_receive_packet_iov(NetClientState *nc,
-+                                const struct iovec *iov,
-+                                int iovcnt);
- ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, int size);
- ssize_t qemu_send_packet_async(NetClientState *nc, const uint8_t *buf,
-                                int size, NetPacketSent *sent_cb);
-diff --git a/include/net/queue.h b/include/net/queue.h
-index c0269bb1d..9f2f289d7 100644
---- a/include/net/queue.h
-+++ b/include/net/queue.h
-@@ -55,6 +55,14 @@ void qemu_net_queue_append_iov(NetQueue *queue,
- 
- void qemu_del_net_queue(NetQueue *queue);
- 
-+ssize_t qemu_net_queue_receive(NetQueue *queue,
-+                               const uint8_t *data,
-+                               size_t size);
-+
-+ssize_t qemu_net_queue_receive_iov(NetQueue *queue,
-+                                   const struct iovec *iov,
-+                                   int iovcnt);
-+
- ssize_t qemu_net_queue_send(NetQueue *queue,
-                             NetClientState *sender,
-                             unsigned flags,
-diff --git a/net/net.c b/net/net.c
-index 6a2c3d956..5e15e5d27 100644
---- a/net/net.c
-+++ b/net/net.c
-@@ -528,6 +528,17 @@ int qemu_set_vnet_be(NetClientState *nc, bool is_be)
- #endif
- }
- 
-+int qemu_can_receive_packet(NetClientState *nc)
-+{
-+    if (nc->receive_disabled) {
-+        return 0;
-+    } else if (nc->info->can_receive &&
-+               !nc->info->can_receive(nc)) {
-+        return 0;
-+    }
-+    return 1;
-+}
-+
- int qemu_can_send_packet(NetClientState *sender)
- {
-     int vm_running = runstate_is_running();
-@@ -540,13 +551,7 @@ int qemu_can_send_packet(NetClientState *sender)
-         return 1;
-     }
- 
--    if (sender->peer->receive_disabled) {
--        return 0;
--    } else if (sender->peer->info->can_receive &&
--               !sender->peer->info->can_receive(sender->peer)) {
--        return 0;
--    }
--    return 1;
-+    return qemu_can_receive_packet(sender->peer);
- }
- 
- static ssize_t filter_receive_iov(NetClientState *nc,
-@@ -679,6 +684,25 @@ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size)
-     return qemu_send_packet_async(nc, buf, size, NULL);
- }
- 
-+ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size)
-+{
-+    if (!qemu_can_receive_packet(nc)) {
-+        return 0;
-+    }
-+
-+    return qemu_net_queue_receive(nc->incoming_queue, buf, size);
-+}
-+
-+ssize_t qemu_receive_packet_iov(NetClientState *nc, const struct iovec *iov,
-+                                int iovcnt)
-+{
-+    if (!qemu_can_receive_packet(nc)) {
-+        return 0;
-+    }
-+
-+    return qemu_net_queue_receive_iov(nc->incoming_queue, iov, iovcnt);
-+}
-+
- ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, int size)
- {
-     return qemu_send_packet_async_with_flags(nc, QEMU_NET_PACKET_FLAG_RAW,
-diff --git a/net/queue.c b/net/queue.c
-index 19e32c80f..c872d51df 100644
---- a/net/queue.c
-+++ b/net/queue.c
-@@ -182,6 +182,28 @@ static ssize_t qemu_net_queue_deliver_iov(NetQueue *queue,
-     return ret;
- }
- 
-+ssize_t qemu_net_queue_receive(NetQueue *queue,
-+                               const uint8_t *data,
-+                               size_t size)
-+{
-+    if (queue->delivering) {
-+        return 0;
-+    }
-+
-+    return qemu_net_queue_deliver(queue, NULL, 0, data, size);
-+}
-+
-+ssize_t qemu_net_queue_receive_iov(NetQueue *queue,
-+                                   const struct iovec *iov,
-+                                   int iovcnt)
-+{
-+    if (queue->delivering) {
-+        return 0;
-+    }
-+
-+    return qemu_net_queue_deliver_iov(queue, NULL, 0, iov, iovcnt);
-+}
-+
- ssize_t qemu_net_queue_send(NetQueue *queue,
-                             NetClientState *sender,
-                             unsigned flags,
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
deleted file mode 100644
index 7deec1a3475..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_10.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 65b851efd3d0280425c202f4e5880c48f8334dae Mon Sep 17 00:00:00 2001
-From: Alexander Bulekov <alxndr@bu.edu>
-Date: Mon, 1 Mar 2021 14:35:30 -0500
-Subject: [PATCH 10/10] lan9118: switch to use qemu_receive_packet() for
- loopback
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_packet() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
-Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [37cee01784ff0df13e5209517e1b3594a5e792d1]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/lan9118.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
-index ab57c02c8..75f18ae2d 100644
---- a/hw/net/lan9118.c
-+++ b/hw/net/lan9118.c
-@@ -669,7 +669,7 @@ static void do_tx_packet(lan9118_state *s)
-     /* FIXME: Honor TX disable, and allow queueing of packets.  */
-     if (s->phy_control & 0x4000)  {
-         /* This assumes the receive routine doesn't touch the VLANClient.  */
--        lan9118_receive(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
-+        qemu_receive_packet(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
-     } else {
-         qemu_send_packet(qemu_get_queue(s->nic), s->txp->data, s->txp->len);
-     }
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
deleted file mode 100644
index 5e53e20bac5..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_2.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e2a48a3c7cc33dbbe89f896e0f07462cb04ff6b5 Mon Sep 17 00:00:00 2001
-From: Jason Wang <jasowang@redhat.com>
-Date: Wed, 24 Feb 2021 12:13:22 +0800
-Subject: [PATCH 02/10] e1000: switch to use qemu_receive_packet() for loopback
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_packet() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [1caff0340f49c93d535c6558a5138d20d475315c]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/e1000.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/net/e1000.c b/hw/net/e1000.c
-index d7d05ae30..cf22c4f07 100644
---- a/hw/net/e1000.c
-+++ b/hw/net/e1000.c
-@@ -546,7 +546,7 @@ e1000_send_packet(E1000State *s, const uint8_t *buf, int size)
- 
-     NetClientState *nc = qemu_get_queue(s->nic);
-     if (s->phy_reg[PHY_CTRL] & MII_CR_LOOPBACK) {
--        nc->info->receive(nc, buf, size);
-+        qemu_receive_packet(nc, buf, size);
-     } else {
-         qemu_send_packet(nc, buf, size);
-     }
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
deleted file mode 100644
index 3fc469e3e31..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_3.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c041a4da1ff119715e0ccf2d4a7af62568f17b93 Mon Sep 17 00:00:00 2001
-From: Jason Wang <jasowang@redhat.com>
-Date: Wed, 24 Feb 2021 12:57:40 +0800
-Subject: [PATCH 03/10] dp8393x: switch to use qemu_receive_packet() for
- loopback packet
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_packet() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [331d2ac9ea307c990dc86e6493e8f0c48d14bb33]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/dp8393x.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
-index 205c0decc..533a8304d 100644
---- a/hw/net/dp8393x.c
-+++ b/hw/net/dp8393x.c
-@@ -506,7 +506,7 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
-             s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
-             if (nc->info->can_receive(nc)) {
-                 s->loopback_packet = 1;
--                nc->info->receive(nc, s->tx_buffer, tx_len);
-+                qemu_receive_packet(nc, s->tx_buffer, tx_len);
-             }
-         } else {
-             /* Transmit packet */
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
deleted file mode 100644
index e14f37735df..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_4.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 9ac5345344b75995bc96d171eaa5dc8d26bf0e21 Mon Sep 17 00:00:00 2001
-From: Jason Wang <jasowang@redhat.com>
-Date: Wed, 24 Feb 2021 13:00:01 +0800
-Subject: [PATCH 04/10] msf2-mac: switch to use qemu_receive_packet() for
- loopback
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_packet() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [26194a58f4eb83c5bdf4061a1628508084450ba1]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/msf2-emac.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
-index 32ba9e841..3e6206044 100644
---- a/hw/net/msf2-emac.c
-+++ b/hw/net/msf2-emac.c
-@@ -158,7 +158,7 @@ static void msf2_dma_tx(MSF2EmacState *s)
-          * R_CFG1 bit 0 is set.
-          */
-         if (s->regs[R_CFG1] & R_CFG1_LB_EN_MASK) {
--            nc->info->receive(nc, buf, size);
-+            qemu_receive_packet(nc, buf, size);
-         } else {
-             qemu_send_packet(nc, buf, size);
-         }
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
deleted file mode 100644
index c3f8f97592a..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_5.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From d465dc79c9ee729d91ef086b993e956b1935be69 Mon Sep 17 00:00:00 2001
-From: Jason Wang <jasowang@redhat.com>
-Date: Wed, 24 Feb 2021 13:14:35 +0800
-Subject: [PATCH 05/10] sungem: switch to use qemu_receive_packet() for
- loopback
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_packet() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [8c92060d3c0248bd4d515719a35922cd2391b9b4]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/sungem.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/net/sungem.c b/hw/net/sungem.c
-index 33c3722df..3684a4d73 100644
---- a/hw/net/sungem.c
-+++ b/hw/net/sungem.c
-@@ -306,7 +306,7 @@ static void sungem_send_packet(SunGEMState *s, const uint8_t *buf,
-     NetClientState *nc = qemu_get_queue(s->nic);
- 
-     if (s->macregs[MAC_XIFCFG >> 2] & MAC_XIFCFG_LBCK) {
--        nc->info->receive(nc, buf, size);
-+        qemu_receive_packet(nc, buf, size);
-     } else {
-         qemu_send_packet(nc, buf, size);
-     }
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
deleted file mode 100644
index 855c6970f46..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_6.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c0010f9b2bafe866fe32e3c2688454bc24147136 Mon Sep 17 00:00:00 2001
-From: Jason Wang <jasowang@redhat.com>
-Date: Wed, 24 Feb 2021 13:27:52 +0800
-Subject: [PATCH 06/10] tx_pkt: switch to use qemu_receive_packet_iov() for
- loopback
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_receive_iov() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [8c552542b81e56ff532dd27ec6e5328954bdda73]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/net_tx_pkt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
-index da262edc3..1f9aa59ec 100644
---- a/hw/net/net_tx_pkt.c
-+++ b/hw/net/net_tx_pkt.c
-@@ -553,7 +553,7 @@ static inline void net_tx_pkt_sendv(struct NetTxPkt *pkt,
-     NetClientState *nc, const struct iovec *iov, int iov_cnt)
- {
-     if (pkt->is_loopback) {
--        nc->info->receive_iov(nc, iov, iov_cnt);
-+        qemu_receive_packet_iov(nc, iov, iov_cnt);
-     } else {
-         qemu_sendv_packet(nc, iov, iov_cnt);
-     }
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
deleted file mode 100644
index 4e1115de02d..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_7.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 64b38675c728354e4015e4bec3d975cd4cb8a981 Mon Sep 17 00:00:00 2001
-From: Alexander Bulekov <alxndr@bu.edu>
-Date: Fri, 26 Feb 2021 13:47:53 -0500
-Subject: [PATCH 07/10] rtl8139: switch to use qemu_receive_packet() for
- loopback
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_packet() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Buglink: https://bugs.launchpad.net/qemu/+bug/1910826
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
-Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [5311fb805a4403bba024e83886fa0e7572265de4]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/rtl8139.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
-index ba5ace1ab..d2dd03e6a 100644
---- a/hw/net/rtl8139.c
-+++ b/hw/net/rtl8139.c
-@@ -1795,7 +1795,7 @@ static void rtl8139_transfer_frame(RTL8139State *s, uint8_t *buf, int size,
-         }
- 
-         DPRINTF("+++ transmit loopback mode\n");
--        rtl8139_do_receive(qemu_get_queue(s->nic), buf, size, do_interrupt);
-+        qemu_receive_packet(qemu_get_queue(s->nic), buf, size);
- 
-         if (iov) {
-             g_free(buf2);
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
deleted file mode 100644
index ed716468dc5..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_8.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 023ce62f0a788ad3a8233c7a828554bceeafd031 Mon Sep 17 00:00:00 2001
-From: Alexander Bulekov <alxndr@bu.edu>
-Date: Mon, 1 Mar 2021 10:33:34 -0500
-Subject: [PATCH 08/10] pcnet: switch to use qemu_receive_packet() for loopback
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_packet() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Buglink: https://bugs.launchpad.net/qemu/+bug/1917085
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
-Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [99ccfaa1edafd79f7a3a0ff7b58ae4da7c514928]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/pcnet.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
-index f3f18d859..dcd3fc494 100644
---- a/hw/net/pcnet.c
-+++ b/hw/net/pcnet.c
-@@ -1250,7 +1250,7 @@ txagain:
-             if (BCR_SWSTYLE(s) == 1)
-                 add_crc = !GET_FIELD(tmd.status, TMDS, NOFCS);
-             s->looptest = add_crc ? PCNET_LOOPTEST_CRC : PCNET_LOOPTEST_NOCRC;
--            pcnet_receive(qemu_get_queue(s->nic), s->buffer, s->xmit_pos);
-+            qemu_receive_packet(qemu_get_queue(s->nic), s->buffer, s->xmit_pos);
-             s->looptest = 0;
-         } else {
-             if (s->nic) {
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
deleted file mode 100644
index 39d32b33a47..00000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2021-3416_9.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ecf7e62bb2cb02c9bd40082504ae376f3e19ffd2 Mon Sep 17 00:00:00 2001
-From: Alexander Bulekov <alxndr@bu.edu>
-Date: Mon, 1 Mar 2021 14:33:43 -0500
-Subject: [PATCH 09/10] cadence_gem: switch to use qemu_receive_packet() for
- loopback
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch switches to use qemu_receive_packet() which can detect
-reentrancy and return early.
-
-This is intended to address CVE-2021-3416.
-
-Cc: Prasad J Pandit <ppandit@redhat.com>
-Cc: qemu-stable@nongnu.org
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
-Signed-off-by: Jason Wang <jasowang@redhat.com>
-
-Upstream-Status: Backport [e73adfbeec9d4e008630c814759052ed945c3fed]
-CVE: CVE-2021-3416
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- hw/net/cadence_gem.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
-index 7a534691f..43b760e3f 100644
---- a/hw/net/cadence_gem.c
-+++ b/hw/net/cadence_gem.c
-@@ -1275,8 +1275,8 @@ static void gem_transmit(CadenceGEMState *s)
-                 /* Send the packet somewhere */
-                 if (s->phy_loop || (s->regs[GEM_NWCTRL] &
-                                     GEM_NWCTRL_LOCALLOOP)) {
--                    gem_receive(qemu_get_queue(s->nic), s->tx_packet,
--                                total_bytes);
-+                    qemu_receive_packet(qemu_get_queue(s->nic), s->tx_packet,
-+                                        total_bytes);
-                 } else {
-                     qemu_send_packet(qemu_get_queue(s->nic), s->tx_packet,
-                                      total_bytes);
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/cross.patch b/meta/recipes-devtools/qemu/qemu/cross.patch
index 438c1ad0862..a0fc39e5e2c 100644
--- a/meta/recipes-devtools/qemu/qemu/cross.patch
+++ b/meta/recipes-devtools/qemu/qemu/cross.patch
@@ -6,19 +6,19 @@ Upstream-Status: Inappropriate [may be rewritten in a way upstream may accept?]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 
-Index: qemu-5.2.0/configure
+Index: qemu-6.0.0/configure
 ===================================================================
---- qemu-5.2.0.orig/configure
-+++ qemu-5.2.0/configure
-@@ -6973,7 +6973,6 @@ if has $sdl2_config; then
+--- qemu-6.0.0.orig/configure
++++ qemu-6.0.0/configure
+@@ -6371,7 +6371,6 @@ if has $sdl2_config; then
  fi
  echo "strip = [$(meson_quote $strip)]" >> $cross
  echo "windres = [$(meson_quote $windres)]" >> $cross
--if test -n "$cross_prefix"; then
+-if test "$cross_compile" = "yes"; then
      cross_arg="--cross-file config-meson.cross"
      echo "[host_machine]" >> $cross
      if test "$mingw32" = "yes" ; then
-@@ -6999,9 +6998,6 @@ if test -n "$cross_prefix"; then
+@@ -6403,9 +6402,6 @@ if test "$cross_compile" = "yes"; then
      else
          echo "endian = 'little'" >> $cross
      fi
diff --git a/meta/recipes-devtools/qemu/qemu/determinism.patch b/meta/recipes-devtools/qemu/qemu/determinism.patch
index cb1c907777f..330a31204d1 100644
--- a/meta/recipes-devtools/qemu/qemu/determinism.patch
+++ b/meta/recipes-devtools/qemu/qemu/determinism.patch
@@ -4,38 +4,19 @@ qemu build are not reproducible due to either full buildpaths or timestamps.
 Replace the full paths with relative ones. I couldn't figure out how to get
 meson to pass relative paths but we can fix that in the script.
 
-For the keymaps, omit the timestamps as they don't matter to us.
-
 Upstream-Status: Pending [some version of all/part of this may be accepted]
 RP 2021/3/1
 
-Index: qemu-5.2.0/scripts/decodetree.py
+Index: qemu-6.0.0/scripts/decodetree.py
 ===================================================================
---- qemu-5.2.0.orig/scripts/decodetree.py
-+++ qemu-5.2.0/scripts/decodetree.py
-@@ -1303,8 +1303,8 @@ def main():
+--- qemu-6.0.0.orig/scripts/decodetree.py
++++ qemu-6.0.0/scripts/decodetree.py
+@@ -1304,7 +1304,7 @@ def main():
      toppat = ExcMultiPattern(0)
  
      for filename in args:
 -        input_file = filename
--        f = open(filename, 'r')
 +        input_file = os.path.relpath(filename)
-+        f = open(input_file, 'r')
+         f = open(filename, 'rt', encoding='utf-8')
          parse_file(f, toppat)
          f.close()
- 
-Index: qemu-5.2.0/ui/keycodemapdb/tools/keymap-gen
-===================================================================
---- qemu-5.2.0.orig/ui/keycodemapdb/tools/keymap-gen
-+++ qemu-5.2.0/ui/keycodemapdb/tools/keymap-gen
-@@ -317,9 +317,8 @@ class LanguageGenerator(object):
-         raise NotImplementedError()
- 
-     def generate_header(self, database, args):
--        today = time.strftime("%Y-%m-%d %H:%M")
-         self._boilerplate([
--            "This file is auto-generated from keymaps.csv on %s" % today,
-+            "This file is auto-generated from keymaps.csv",
-             "Database checksum sha256(%s)" % database.mapchecksum,
-             "To re-generate, run:",
-             "  %s" % args,
diff --git a/meta/recipes-devtools/qemu/qemu/mingwfix.patch b/meta/recipes-devtools/qemu/qemu/mingwfix.patch
deleted file mode 100644
index 8d76cef6388..00000000000
--- a/meta/recipes-devtools/qemu/qemu/mingwfix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-OE assumes that mingw files are in a unix like file layout. The
-'flattening' done by configure in qemu for mingw32 breaks things
-for us. We are discussing with upstream but for now, hack this to
-disable it and use the unix like layout everywhere.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01073.html]
-
-Index: qemu-5.2.0/configure
-===================================================================
---- qemu-5.2.0.orig/configure
-+++ qemu-5.2.0/configure
-@@ -1541,7 +1541,7 @@ libdir="${libdir:-$prefix/lib}"
- libexecdir="${libexecdir:-$prefix/libexec}"
- includedir="${includedir:-$prefix/include}"
- 
--if test "$mingw32" = "yes" ; then
-+if test "$mingw32" = "dontwantthis" ; then
-     mandir="$prefix"
-     datadir="$prefix"
-     docdir="$prefix"
diff --git a/meta/recipes-devtools/qemu/qemu/mmap.patch b/meta/recipes-devtools/qemu/qemu/mmap.patch
deleted file mode 100644
index edd9734f30a..00000000000
--- a/meta/recipes-devtools/qemu/qemu/mmap.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-If mremap() is called without the MREMAP_MAYMOVE flag with a start address
-just before the end of memory (reserved_va) where new_size would exceed 
-GUEST_ADD_MAX, the assert(end - 1 <= GUEST_ADDR_MAX) in page_set_flags() 
-would trigger.
-
-Add an extra guard to the guest_range_valid() checks to prevent this and
-avoid asserting binaries when reserved_va is set.
-
-This meant a test case now gives the same behaviour regardless of whether
-reserved_va is set or not.
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/ccc5ccc17f8cfbfd87d9aede5d12a2d47c56e712]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
-
-Index: qemu-5.2.0/linux-user/mmap.c
-===================================================================
---- qemu-5.2.0.orig/linux-user/mmap.c
-+++ qemu-5.2.0/linux-user/mmap.c
-@@ -727,7 +727,9 @@ abi_long target_mremap(abi_ulong old_add
- 
-     if (!guest_range_valid(old_addr, old_size) ||
-         ((flags & MREMAP_FIXED) &&
--         !guest_range_valid(new_addr, new_size))) {
-+         !guest_range_valid(new_addr, new_size)) ||
-+        ((flags & MREMAP_MAYMOVE) == 0 &&
-+         !guest_range_valid(old_addr, new_size))) {
-         errno = ENOMEM;
-         return -1;
-     }
diff --git a/meta/recipes-devtools/qemu/qemu/mmap2.patch b/meta/recipes-devtools/qemu/qemu/mmap2.patch
index 1652131757b..e115473b705 100644
--- a/meta/recipes-devtools/qemu/qemu/mmap2.patch
+++ b/meta/recipes-devtools/qemu/qemu/mmap2.patch
@@ -13,27 +13,26 @@ rather than ENOMEM so adjust the other part of the test to this.
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01355.html]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 
-Index: qemu-5.2.0/linux-user/mmap.c
+Index: qemu-6.0.0/linux-user/mmap.c
 ===================================================================
---- qemu-5.2.0.orig/linux-user/mmap.c
-+++ qemu-5.2.0/linux-user/mmap.c
-@@ -722,12 +722,14 @@ abi_long target_mremap(abi_ulong old_add
+--- qemu-6.0.0.orig/linux-user/mmap.c
++++ qemu-6.0.0/linux-user/mmap.c
+@@ -733,12 +733,16 @@ abi_long target_mremap(abi_ulong old_add
      int prot;
      void *host_addr;
  
--    if (!guest_range_valid(old_addr, old_size) ||
+-    if (!guest_range_valid_untagged(old_addr, old_size) ||
 -        ((flags & MREMAP_FIXED) &&
--         !guest_range_valid(new_addr, new_size)) ||
--        ((flags & MREMAP_MAYMOVE) == 0 &&
--         !guest_range_valid(old_addr, new_size))) {
--        errno = ENOMEM;
-+    if (!guest_range_valid(old_addr, old_size)) {
++    if (!guest_range_valid_untagged(old_addr, old_size)) {
 +        errno = EFAULT;
 +        return -1;
 +    }
-+
-+    if (((flags & MREMAP_FIXED) && !guest_range_valid(new_addr, new_size)) ||
-+        ((flags & MREMAP_MAYMOVE) == 0 && !guest_range_valid(old_addr, new_size))) {
++    
++    if (((flags & MREMAP_FIXED) &&
+          !guest_range_valid_untagged(new_addr, new_size)) ||
+         ((flags & MREMAP_MAYMOVE) == 0 &&
+          !guest_range_valid_untagged(old_addr, new_size))) {
+-        errno = ENOMEM;
 +        errno = EINVAL;
          return -1;
      }
diff --git a/meta/recipes-devtools/qemu/qemu_5.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.0.0.bb
similarity index 93%
rename from meta/recipes-devtools/qemu/qemu_5.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_6.0.0.bb
index f265204b105..90b135a617c 100644
--- a/meta/recipes-devtools/qemu/qemu_5.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.0.0.bb
@@ -19,11 +19,11 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt sdl kvm pie \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm \
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm pie \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
 "
-- 
2.30.2

