Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E48C3601E
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.45883.1743403761967191414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QX0mpTO3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403763; x=1774939763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J9X/8JfmFdSQ6K5iN7S3oV18g+lBVOGkGFpCK+j3MI0=;
  b=QX0mpTO3pSzC+sxi9PbME0wDGBtjcREIDeS05KwzuExddQG4YZIN9w5B
   oahOyGcmQkgskvrYW4HOeIeWlkI00GQnYLm2TsyeLiOyxBNHiXaoIiH4C
   kk0QMq9/JtJ/5/a7IZS3HBb7+iihsPRZgbPuTAv3TNSKdajPqOL4V0Bpp
   Vk6lXZ0VJd6Zu0f1jdpGzLi+weZYYpSi9jwiSjqGO2qnpNsBSpQsLzBx2
   dCyzdyLaA/VeiaybK72qkmyViGOgqmIg3pPYONmSslTAB2JEgbmJPJh77
   M5XbLc7y/RYwt86SehOx9rxoKdQJIH9nnGYvlaaJSRcDESCBPxitx7oVw
   w==;
X-CSE-ConnectionGUID: WW+5pgDRQgOnI6XZC3bmqA==
X-CSE-MsgGUID: pZehFbt0SDKVhUU8k6oUdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194985138"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194985138"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 46C6FD4809
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C4C1D88B9
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:19 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7A2501A009A;
	Mon, 31 Mar 2025 14:49:18 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 10/10] gstreamer1.0-plugins-bad: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:44 +0800
Message-Id: <20250331064844.2155-10-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213946

- enable analytics since gstreamer1.0-python depend on it now
- explicitly diable options that new added in meson_options.txt
  - lcevcdecoder
  - lcevcencoder
  - tensordecoders
  - nvcomp
  - nvdswrapper
  - svtjpegxs
  - webview2
  - aja
  - cuda-nvmm
  - d3d12

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...issing-opencv-data-dir-in-yocto-buil.patch | 20 +++++++++----------
 ....bb => gstreamer1.0-plugins-bad_1.26.0.bb} | 15 ++++++++++++--
 2 files changed, 23 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.26.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 4d0d0e2693..d49cf5bd89 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From bd389203124592cfd91fb020ea05a5e4ad1c1394 Mon Sep 17 00:00:00 2001
+From 11a08e3f3135b649b68714c77670c37559f3a33c Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -17,16 +17,16 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
-index 1d337f1..f47939a 100644
+index 64e913e..42a0958 100644
 --- a/gst-libs/gst/opencv/meson.build
 +++ b/gst-libs/gst/opencv/meson.build
-@@ -52,6 +52,9 @@ if opencv_found
-   # /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
-   gstopencv_cargs += cxx.get_supported_arguments(['-Wno-missing-include-dirs', '-Wno-format-nonliteral'])
+@@ -61,6 +61,9 @@ gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
+ # /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
+ gstopencv_cargs += cxx.get_supported_arguments(['-Wno-missing-include-dirs', '-Wno-format-nonliteral'])
  
-+  pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-+  opencv_prefix = pkgconf_sysroot + opencv_prefix
++pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
++opencv_prefix = pkgconf_sysroot + opencv_prefix
 +
-   # Check the data dir used by opencv for its xml data files
-   # Use prefix from pkg-config to be compatible with cross-compilation
-   r = run_command('test', '-d', opencv_prefix + '/share/opencv', check: false)
+ # Check the data dir used by opencv for its xml data files
+ # Use prefix from pkg-config to be compatible with cross-compilation
+ fsmod = import('fs')
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
index 91d9150359..ad868d8d68 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3d386af3d1dbd1a06c74a6251250c269b481e703f0e3255ba89ef6c1e063afea"
+SRC_URI[sha256sum] = "f8287a84c5f66368a5a50da5f969994a02c47f20220ffe1ca3154193e65af216"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
@@ -28,10 +28,11 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
-    sndfile ttml uvch264 webp \
+    sndfile ttml uvch264 webp analytics \
     ${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'rsvg', d)} \
 "
 
+PACKAGECONFIG[analytics]       = "-Danalyticsoverlay=enabled,-Danalyticsoverlay=disabled,"
 PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
 PACKAGECONFIG[assrender]       = "-Dassrender=enabled,-Dassrender=disabled,libass"
 PACKAGECONFIG[avtp]            = "-Davtp=enabled,-Davtp=disabled,libavtp"
@@ -152,6 +153,16 @@ EXTRA_OEMESON += " \
     -Dwinscreencap=disabled \
     -Dwpe=disabled \
     -Dzxing=disabled \
+    -Dlcevcdecoder=disabled \
+    -Dlcevcencoder=disabled \
+    -Dtensordecoders=disabled \
+    -Dnvcomp=disabled \
+    -Dnvdswrapper=disabled \
+    -Dsvtjpegxs=disabled \
+    -Dwebview2=disabled \
+    -Daja=disabled \
+    -Dcuda-nvmm=disabled \
+    -Dd3d12=disabled \
 "
 
 export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
-- 
2.43.0


