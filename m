Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC05C3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 15:29:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.45809.1722439750618578602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 08:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZWSXT7A2;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: marc.ferland@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so75264001fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 08:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439748; x=1723044548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iv6OH3MsQ16FmLVtL6hWFw6S2Pd5za3PmtlWO90YKBg=;
        b=ZWSXT7A2asFh26/7jfi3o4fzgb5ahxozpjP+/CgEn55vkYd5Wdsi5GcStYMBVE7l4i
         gKoNG0SK1LO7uj9DvA1UyMiqchRv/Yp4Hcivnl1FCf5agWb2xfXCDfBrd7VjYvjXZ5Q5
         lsq+yaFQC9ejDki+0HtGSqvakaY1ObGHgXu2EAsCSsN2exI9T3noIkiSWfcgfha1oV2c
         7vKdvZYuOp2527FGQZzwV9+zXzRDg/8r0gDnWDNMW9Re1hOAKU02zXIdXae1tKqFqVRT
         jvZMUqYWB6nITmy0E4UdvRwFGDsHRzK4WSVPVvIfUTqGfA5yhN6yNQOKxXGCvtoiBeFZ
         gIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439748; x=1723044548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iv6OH3MsQ16FmLVtL6hWFw6S2Pd5za3PmtlWO90YKBg=;
        b=HJhW7oLal7dMxusD1YSI3PdKeVApKw/9HY/xthyNTJ+Sn1BBxkyEy9JWSux5mp6S3O
         1SRZQ0DLVU6voYx6Dk5YxLuJcCO6zU0D3YkPPUGcbsqPzg+fy6+VgadL6AL8jS4v9puM
         xCyUjRvvRiAk8x+XYBufajxiH+yEIfNLH8k1LE+flCau++ZVCiGdX+uBqeHSwLPwaMYU
         MQOMqLi1xxshvhQv3QNDKDPhnk4ugce0PPX0Pg5YVd7hRcj9xmRpM9laRsyIeIZKPoLj
         aIzLZl3HtZ70comNW9DVDc5mzL3omVM7spS52HnbL6oNjj5CUbOiOaqTu/I46JnNs1Fh
         wlpA==
X-Gm-Message-State: AOJu0YyNDeoyJggsX6f65XBKgR5cDn4qiDBqZwLMlYN05OqCcVvm2CAh
	7e7reCiTsgHyt8QkgTfzLNPEr31GzmoL3wst/AB1W2c4L6zVQ42ayYVvuQ==
X-Google-Smtp-Source: AGHT+IGtF2J08ZIMrFmr9wHmnnhb/AiGsnilUdjVRzOSJpBNrgehJjA/H0tx51XHQ6dj/CtJloRrzA==
X-Received: by 2002:a2e:700c:0:b0:2ef:296d:1dd5 with SMTP id 38308e7fff4ca-2f12e973169mr95093751fa.0.1722439747160;
        Wed, 31 Jul 2024 08:29:07 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36b368638fbsm17154647f8f.103.2024.07.31.08.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:29:06 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-core@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH v2 2/2] appstream: add qt6 PACKAGECONFIG option
Date: Wed, 31 Jul 2024 11:28:58 -0400
Message-Id: <20240731152858.3340807-2-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240731152858.3340807-1-marc.ferland@sonatest.com>
References: <20240731152858.3340807-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 15:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202714

From: Marc Ferland <marc.ferland@sonatest.com>

This will enable building the libAppStreamQt library. This is required
by the 'discover' application from the meta-kde layer.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
Changes in v2:
 - Add signed-off-by line in PACKAGE_PREFIX patch

 .../0002-Do-not-build-qt-tests.patch          | 34 +++++++++++++
 ...IX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 51 +++++++++++++++++++
 .../appstream/appstream_1.0.3.bb              |  9 ++++
 3 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
 create mode 100644 meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch

diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
new file mode 100644
index 0000000000..9a725ab8e4
--- /dev/null
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -0,0 +1,34 @@
+From a7721cf4f412fbe18fe15127bea7b1457b99f684 Mon Sep 17 00:00:00 2001
+From: Marc Ferland <marc.ferland@sonatest.com>
+Date: Fri, 26 Jul 2024 15:41:00 -0400
+Subject: [PATCH] Do not build qt/tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the following build failure:
+
+| In file included from /home/marc/mnt/yocto-kde/build/tmp/work/x86_64-linux/appstream-native/1.0.3/recipe-sysroot-native/usr/include/QtTest/QtTest:11,
+|                  from ../AppStream-1.0.3/qt/tests/asqt-pool-test.cpp:21:
+| ../AppStream-1.0.3/qt/tests/asqt-pool-test.cpp: In function ‘int main(int, char**)’:
+| ../AppStream-1.0.3/qt/tests/asqt-pool-test.cpp:117:1: error: expected primary-expression before ‘)’ token
+|   117 | QTEST_MAIN(PoolReadTest)
+|       | ^~~~~~~~~~
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
+---
+ qt/meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/qt/meson.build b/qt/meson.build
+index 1909bcf7..c3ca20fb 100644
+--- a/qt/meson.build
++++ b/qt/meson.build
+@@ -148,5 +148,3 @@ install_data (
+ 
+ # end of Qt version loop
+ endforeach
+-
+-subdir('tests/')
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
new file mode 100644
index 0000000000..e522a92e14
--- /dev/null
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -0,0 +1,51 @@
+From c36b6226479a20ebd910f355deddb9d5c7571213 Mon Sep 17 00:00:00 2001
+From: Marc Ferland <marc.ferland@sonatest.com>
+Date: Mon, 29 Jul 2024 09:35:51 -0400
+Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
+
+PACKAGE_PREFIX_DIR points to an invalid directory. This breaks
+librairies linking to appstream-qt.
+
+For example, when building the 'discover' package from the meta-kde
+layer we get the following build error:
+
+| CMake Error in libdiscover/CMakeLists.txt:
+|   Imported target "AppStreamQt" includes non-existent path
+|
+|     "/path/to/build/tmp/work/core2-64-poky-linux/discover/6.1.3/recipe-sysroot/include/"
+|
+|   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:
+|
+|   * The path was deleted, renamed, or moved to another location.
+|
+|   * An install or uninstall procedure did not complete successfully.
+|
+|   * The installation package was faulty and references files it does not
+|   provide.
+
+The path above should've been:
+
+    /path/to/build/tmp/work/core2-64-poky-linux/discover/6.1.3/recipe-sysroot/usr/include/
+
+instead of:
+
+    /path/to/build/tmp/work/core2-64-poky-linux/discover/6.1.3/recipe-sysroot/include/
+
+Upstream-Status: Inappropriate [upstream ticket https://github.com/ximion/appstream/issues/643]
+
+Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
+---
+ qt/cmake/AppStreamQtConfig.cmake.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/qt/cmake/AppStreamQtConfig.cmake.in b/qt/cmake/AppStreamQtConfig.cmake.in
+index 63df65f2..5ab2d0ec 100644
+--- a/qt/cmake/AppStreamQtConfig.cmake.in
++++ b/qt/cmake/AppStreamQtConfig.cmake.in
+@@ -1,5 +1,5 @@
+ 
+-get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../../" ABSOLUTE)
++get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)
+ 
+ # Use original install prefix when loaded through a "/usr move"
+ # cross-prefix symbolic link such as /lib -> /usr/lib.
diff --git a/meta/recipes-support/appstream/appstream_1.0.3.bb b/meta/recipes-support/appstream/appstream_1.0.3.bb
index 625e85a0ae..092d85d1a0 100644
--- a/meta/recipes-support/appstream/appstream_1.0.3.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.3.bb
@@ -27,6 +27,8 @@ GIDOCGEN_MESON_OPTION = "apidocs"
 SRC_URI = " \
 	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
 	file://0001-remove-hardcoded-path.patch \
+	file://0002-Do-not-build-qt-tests.patch \
+	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
 SRC_URI[sha256sum] = "5ab6f6cf644e7875a9508593962e56bb430f4e59ae0bf03be6be7029deb6baa4"
 
@@ -36,9 +38,16 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
 PACKAGECONFIG[stemming] = "-Dstemming=true,-Dstemming=false,libstemmer"
+PACKAGECONFIG[qt6] = "-Dqt=true,-Dqt=false,qtbase"
 
 FILES:${PN} += "${datadir}"
 
 EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
 
 BBCLASSEXTEND = "native"
+
+# Fix meson not finding the Qt build tools in cross-compilation
+# setups. See: https://github.com/mesonbuild/meson/issues/13018
+do_configure:prepend:class-target() {
+    export PATH=${STAGING_DIR_NATIVE}${libexecdir}:$PATH
+}
-- 
2.34.1


