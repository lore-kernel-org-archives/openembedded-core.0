Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D88C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:19 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.3867.1743584887827435740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LJY4oK4t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743584889; x=1775120889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J9X/8JfmFdSQ6K5iN7S3oV18g+lBVOGkGFpCK+j3MI0=;
  b=LJY4oK4tJawAWvKd4ftSUhnnLq44SSketHMHBqrZz7lHFUIsRP2gcTeb
   t18HVjyHl8kloVn/AKR5HUJd7D6IujdVVz1kzm/QNonVn/P3GZJLvPXHW
   Pbqtpf83iHyWXpLBxznktZCwi2BYNPPncHVTiyJNPXUJNmtZlEvBkYalA
   Uhqdo6cFA9n1xrMiWXdb6qIreGYgslDilNZUKFaFn7+tw2NyhUzLV2bh8
   /opsXzl2QzpJB+GFuQm3Ye8UEmfyy7GVRNkQ048+fa1ZvDtTdz5lPIK88
   qdxNu5bBxoDGa+s8MJQZ5PyWPdWc7d9P6/7TRfEzpP5hmhVZ21kEQjT8h
   w==;
X-CSE-ConnectionGUID: UcNPQ+a1SLi49j+ORJnZTQ==
X-CSE-MsgGUID: Q9hBkwb0S3CZE/a0HRiUhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="197979411"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="197979411"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:08:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E85B3D5011
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AD38FD0900
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:04 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 13DA71A0078;
	Wed,  2 Apr 2025 17:08:04 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v4 10/10] gstreamer1.0-plugins-bad: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 17:07:49 +0800
Message-Id: <20250402090749.2119-11-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402090749.2119-1-leimaohui@fujitsu.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214242

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


