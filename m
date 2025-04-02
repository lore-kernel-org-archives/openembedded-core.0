Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E24C369A1
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:34:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4960.1743590044743252410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tvf5FDYh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743590045; x=1775126045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2bikI2eGQJFCPDJIIPWzgjUSKfL9cwRjjIbNqb6ZTwU=;
  b=Tvf5FDYh6UUT1ggKpbLp6W8v9YIkEZcXD4WmTHOVsXHQm1tsk10aFjnO
   31hw8GNZPA0z6+wBS5DcnQsy/YMqRn7RhRnFSmSH0BrgSww1Nn7Y0MWlw
   fOe8He/gGwhS0hUer4YvOYN3aERFZEJ6cAmFHvTkqvo4FxlOC/gxoSw+A
   KNiUMh/8Wjt3a+RW9SldvZ6fpVdgpi14lmrqd4Nghx3qDG5GXZx4iUk8P
   3fg0/NRriByrxWYKe2S754/2WYV/CHASkXQscbIlDjgC6yOo1GLiPPkir
   bZOMSVcyndMdMLYqNYzRKM1Q13dnG2Lb3lQGMSO074z3T/68mgwwlkrX/
   A==;
X-CSE-ConnectionGUID: 8MsTdVnSR6Se5Q0SHFfIIw==
X-CSE-MsgGUID: LNHNDiGzRZihbZ5LIuXjdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="195203592"
X-IronPort-AV: E=Sophos;i="6.14,182,1736780400"; 
   d="scan'208";a="195203592"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:34:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C877C3F7F
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:34:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 014F4D5112
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:34:00 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 53F681A0078;
	Wed,  2 Apr 2025 18:33:59 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>,
	Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v5 10/10] gstreamer1.0-plugins-bad: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 18:33:47 +0800
Message-Id: <20250402103347.2133-10-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402103347.2133-1-leimaohui@fujitsu.com>
References: <20250402103347.2133-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214258

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
- add backport patch to fix undefined reference to `__atomic_fetch_add_8' issue
  This patch is part of upstream commit
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f
7a7be31c48f

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../0001-backport-libatomic-issue-patch.patch | 41 +++++++++++++++++++
 ...issing-opencv-data-dir-in-yocto-buil.patch | 20 ++++-----
 ....bb => gstreamer1.0-plugins-bad_1.26.0.bb} | 16 +++++++-
 3 files changed, 65 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.26.0.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
new file mode 100644
index 0000000000..7ac605fb65
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-backport-libatomic-issue-patch.patch
@@ -0,0 +1,41 @@
+From f8c802aa778804f02b30a191cd3bcce285023076 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Wed, 2 Apr 2025 09:47:41 +0000
+Subject: [PATCH] backport libatomic issue patch
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f7a7be31c48f]
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ gst-libs/gst/cuda/meson.build | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/gst-libs/gst/cuda/meson.build b/gst-libs/gst/cuda/meson.build
+index 3a25244..50ae027 100644
+--- a/gst-libs/gst/cuda/meson.build
++++ b/gst-libs/gst/cuda/meson.build
+@@ -48,15 +48,12 @@ if host_system not in ['windows', 'linux']
+   subdir_done()
+ endif
+ 
+-# Linux ARM would need -latomic for std::atomic<int64_t>
+-if host_system == 'linux' and host_machine.cpu_family() in ['aarch64', 'arm']
+-  libatomic_dep = cxx.find_library('atomic', required: get_option('cuda-nvmm'))
+-  if not libatomic_dep.found()
+-    subdir_done()
+-  endif
+-
+-  gstcuda_platform_dep += [libatomic_dep]
+-endif
++# Check for libatomic for use of C11 atomics: some architectures need
++# to link explicitly to this library.
++# TODO: Once meson 1.7 is in use, this can be updated to
++# dependency('atomic')
++atomic_dep = cxx.find_library('atomic', required: false)
++gstcuda_platform_dep += [atomic_dep]
+ 
+ cuda_win32_headers = [
+   'initguid.h',
+-- 
+2.43.0
+
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
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
index 91d9150359..2e409558d1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
@@ -9,8 +9,9 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           file://0001-backport-libatomic-issue-patch.patch \
            "
-SRC_URI[sha256sum] = "3d386af3d1dbd1a06c74a6251250c269b481e703f0e3255ba89ef6c1e063afea"
+SRC_URI[sha256sum] = "f8287a84c5f66368a5a50da5f969994a02c47f20220ffe1ca3154193e65af216"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
@@ -28,10 +29,11 @@ PACKAGECONFIG ??= " \
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
@@ -152,6 +154,16 @@ EXTRA_OEMESON += " \
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


