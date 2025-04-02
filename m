Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6634C3601F
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:34:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.4957.1743590041686243437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZQscnM8z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743590042; x=1775126042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tXsvC8ii6/Z813VRoWdW46HY+FFmYDI8T7P6qTj6mjE=;
  b=ZQscnM8zIpGLk4IYX86Rtc7HBByIubMQtAMr/1Xwo3U2xJ+pu+xIFd7P
   F64xeHApheH8H8kCeZmNZe8j4+SX/PrxiyDbyPbxtbp8+tXEnwya9EJvJ
   btTNn5KR1N6i//uYRweANZBL2o+WRND0jpoBbvsAMtMMzP705Eb0k+nj3
   YEnlraL9vr5qBQcp55JFrY6pEIgz0xUCrG/vRvAdvqlMEO/3KDnZTBHo0
   i1s8ZhMQWC/AZx/A3eDLotdPjMMibuS0xJTk+aPqqrhwczYYLVVwjxkME
   tas7Igztz35qV9Xql1GRc7tPlfCp1X5zg3IqZNSTs3mXVsMx9CY6JX1PY
   Q==;
X-CSE-ConnectionGUID: MUB5ojjXQHqbE9VlXqltSg==
X-CSE-MsgGUID: e9VDXHGgT/aQ1WZlhcD1ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="183609731"
X-IronPort-AV: E=Sophos;i="6.14,182,1736780400"; 
   d="scan'208";a="183609731"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:34:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14573D4F41
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C0CDECFAC8
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:57 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1FB561A0078;
	Wed,  2 Apr 2025 18:33:57 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>,
	Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v5 06/10] gstreamer1.0-plugins-base: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 18:33:43 +0800
Message-Id: <20250402103347.2133-6-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402103347.2133-1-leimaohui@fujitsu.com>
References: <20250402103347.2133-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214255

- add backport patch to fix undefined reference to `__atomic_fetch_add_8' issue
  This patch is part of upstream commit
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f7a7be31c48f

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...et-caps-from-src-pad-when-query-caps.patch |  4 +-
 ...gins-base-Fix-atomic-64-issue-on-arm.patch | 52 +++++++++++++++++++
 ...parse-enhance-SSA-text-lines-parsing.patch |  2 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.26.0.bb} |  3 +-
 5 files changed, 58 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.12.bb => gstreamer1.0-plugins-base_1.26.0.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index e35ec026e4..7373bd3e26 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From e0478a9b3bb1b49c34aaf076152ed8e49cf909e0 Mon Sep 17 00:00:00 2001
+From bd1436f0027bb09cdcf90386910a497422d9a871 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -16,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index ef0ff90..53f05c8
+index 975fe83..df82840
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
 @@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
new file mode 100644
index 0000000000..437409854f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch
@@ -0,0 +1,52 @@
+From 677a40c1f5b0793598a92cbba0a621fef89c4a26 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Wed, 2 Apr 2025 09:37:24 +0000
+Subject: [PATCH] gstreamer1.0-plugins-base: Fix atomic 64 issue on armv5
+
+| /mnt/test/build_auh/tmp/work/armv5e-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.26.0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/14.2.0/ld: gst-libs/gst/audio/libgstaudio-1.0.so.0.2600.0.p/gstaudioringbuffer.c.o: in function `gst_atomic_uint64_get':
+| /usr/src/debug/gstreamer1.0-plugins-base/1.26.0/gst-libs/gst/audio/gstaudioringbuffer.c:72:(.text+0x4e00): undefined reference to `__atomic_load_8'
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8637/commits?commit_id=f2b5c0b6020b50f5173e449b45a6f7a7be31c48f]
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ gst-libs/gst/audio/meson.build | 2 +-
+ meson.build                    | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/audio/meson.build b/gst-libs/gst/audio/meson.build
+index 1d69713..cf8935b 100644
+--- a/gst-libs/gst/audio/meson.build
++++ b/gst-libs/gst/audio/meson.build
+@@ -162,7 +162,7 @@ gstaudio = library('gstaudio-@0@'.format(api_version),
+   soversion : soversion,
+   darwin_versions : osxversion,
+   install : true,
+-  dependencies : gstaudio_deps,
++  dependencies : [ gstaudio_deps, base_platform_dep ],
+ )
+ pkg_name = 'gstreamer-audio-1.0'
+ pkgconfig.generate(gstaudio,
+diff --git a/meson.build b/meson.build
+index a470af0..c195376 100644
+--- a/meson.build
++++ b/meson.build
+@@ -398,6 +398,15 @@ else
+   core_conf.set('DISABLE_ORC', 1)
+ endif
+ 
++base_platform_dep = []
++# Check for libatomic for use of C11 atomics: some architectures need
++# to link explicitly to this library.
++# TODO: Once meson 1.7 is in use, this can be updated to
++# dependency('atomic')
++atomic_dep = cc.find_library('atomic', required: false)
++
++base_platform_dep += [atomic_dep]
++
+ # Used to build SSE* things in audio-resampler
+ sse_args = '-msse'
+ sse2_args = '-msse2'
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 810a4ba676..fc9ad474d9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 1b9887421de593854632571327b4918b880900c6 Mon Sep 17 00:00:00 2001
+From 1cc876662b7707eb5a2f668654f7921b5642e108 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 8fa46d809a..06b5bc41ed 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 22a0e3a5288486991a15c48fdcb730eaa6dc08e5 Mon Sep 17 00:00:00 2001
+From c0c6944eca0c497477aa9f2cec2c83c4ea7a70e5 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
index f4505d831e..afb02f6042 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.0.bb
@@ -10,8 +10,9 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
+           file://0001-gstreamer1.0-plugins-base-Fix-atomic-64-issue-on-arm.patch \
            "
-SRC_URI[sha256sum] = "f6efbaa8fea8d00bc380bccca76a530527b1f083e8523eafb3e9b1e18bc653d3"
+SRC_URI[sha256sum] = "e23189fbed2ec486690382d1055c19eeaf5aae3e95e2576fc4c884d96a90e69e"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


