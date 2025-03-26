Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7752C3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 06:37:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.16236.1742971016895765145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 23:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IaHlCXH2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742971017; x=1774507017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zw6PVieqj8DSIIdQCi44/owf2pMxs+RxD2OktCyUg80=;
  b=IaHlCXH2YtXXTgaQv4qo2fqQMrjAeFs/qd+VwyhtlfFGa4J4eWZnwAyP
   Z/b8N39M4xVcUxyLer/h+eRDNEjcyK6gyoye9lacsyuf0ETwfxy5gcqU7
   H5ClJ7Q9DJtPQbW/iczfDQ7YMtcHIoamqq84CihhHHKqPeoOTFTGQWQHz
   dYwlWRnRVP+pRqrMPz1bCI2CVIEen+RnyqPfxeXwQsXMonbXsBiR5HbIX
   ax6Fy9ROiXtWnG8egoymRxBFnQF6Lopvkh+dekCc/dKJzEENhxf3nsaZe
   iKp07jcfiHlUfd0jwxR7gCKMHIBvWxRvgTEa2NRGut5DYyjVwOM6PMQlq
   w==;
X-CSE-ConnectionGUID: rLrtvgAySNqiF71wFsrpcw==
X-CSE-MsgGUID: sEyg4GCVRJWKSJmTEaSdrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="181689340"
X-IronPort-AV: E=Sophos;i="6.14,277,1736780400"; 
   d="scan'208";a="181689340"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 15:36:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D8E1D4C36
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E1E90D4BE8
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 15:36:53 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D40C1A00E4;
	Wed, 26 Mar 2025 14:36:53 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leihaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 7/7] gstreamer1.0-{plugins-bad, python}: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 14:36:47 +0800
Message-Id: <20250326063647.1941-7-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326063647.1941-1-leimaohui@fujitsu.com>
References: <20250326063647.1941-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 06:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213634

From: Lei Maohui <leihaohui@fujitsu.com>

Couple these two together since 1.26.0 version of gstpython add depends on "analytics" plugin of gstbad

When build 1.26.0 gstreamer1.0-python, issue occurs:
  |../../../../../../workspace/sources/gstreamer1.0-python/meson.build:23:13: ERROR: Dependency "gstreamer-analytics-1.0" not found, tried pkgconfig

Source code:
  | $ vi  workspace/sources/gstreamer1.0-python/meson.build
  | 23 gstbad_dep = dependency('gstreamer-analytics-1.0', version :gst_req,
  | 24   fallback : [])

Signed-off-by: Lei Maohui <leihaohui@fujitsu.com>
---
 ...issing-opencv-data-dir-in-yocto-buil.patch | 27 ++++++++++---------
 ....bb => gstreamer1.0-plugins-bad_1.26.0.bb} |  5 ++--
 ...24.12.bb => gstreamer1.0-python_1.26.0.bb} |  4 +--
 3 files changed, 20 insertions(+), 16 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.26.0.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.12.bb => gstreamer1.0-python_1.26.0.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 4d0d0e2693..49be4c1eb4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,6 +1,6 @@
-From bd389203124592cfd91fb020ea05a5e4ad1c1394 Mon Sep 17 00:00:00 2001
-From: Andrey Zhizhikin <andrey.z@gmail.com>
-Date: Mon, 27 Jan 2020 10:22:35 +0000
+From 11a08e3f3135b649b68714c77670c37559f3a33c Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Tue, 25 Mar 2025 00:55:27 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
 
 When Yocto build is performed, opencv searches for data dir using simple
@@ -17,16 +17,19 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
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
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
index 91d9150359..8970afdcef 100644
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
index f62cb159c2..04c96a879f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
@@ -8,9 +8,9 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d679e2ca3e655a7328627c4670c324fc22f588d2cb8ecd2fa7a6a42df51132cc"
+SRC_URI[sha256sum] = "e5046a05d77abb15671ad01cd1908d17d62e5a06f5d7841be4342ade2a3fb8db"
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 
 PNREAL = "gst-python"
-- 
2.43.0


