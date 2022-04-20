Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E633C352A8
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.3372.1650421619456561907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 19:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Z6JzXdSq;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650421619; x=1681957619;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l4riM9muKNT4tQ7iCsglnT1EpXZ19md2mDIqf1eEZuk=;
  b=Z6JzXdSqn3szKi4bI3eyh5TSPkOJYSVELz/MLBfpz/h2lWKFz2E38BjB
   oztf4Od7J3omKqhRh1GYV+Z5lyVx1NFb1Lqy+hMaRb0GCvYe2pv2Cyh5K
   0v4JZ8jqGTw3ztJN0n4xiG6hOsB89U6Fkwdm+Lx42iHDJnjRTmuvcMVKe
   44FOjilXo5z6jIxSTu9nr16gowGTPlC14T9+Z4/5rpLOtlnv+BndbMyxA
   nIkto/OXKk81TuIF78eJR8Nzdb8kkvT7iQx2dt10OtxbjYZrje0+xrT4L
   EJ7FINCcTlUSaX9LeyyAoaOPl7AIMh4txcXRL/SsEXA8m+B3pzDDEhNDX
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="243852399"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="243852399"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 19:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="804879659"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2022 19:26:58 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0-plugins-bad: drop patch
Date: Wed, 20 Apr 2022 10:26:55 +0800
Message-Id: <20220420022655.38391-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164651

With latest gstreamer version pkg-config able to find header
path with msdk enabled.

Drop this patch as its not require anymore.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../0005-msdk-fix-includedir-path.patch       | 40 -------------------
 .../gstreamer1.0-plugins-bad_1.20.1.bb        |  1 -
 2 files changed, 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
deleted file mode 100644
index 273b45bd49..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e31f68c46ff0c29fa3c22755f18d5dde87b23bf2 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Wed, 30 Dec 2020 16:37:47 +0800
-Subject: [PATCH] msdk: fix includedir path
-
-In cross compilation, need to prepend PKG_CONFIG_SYSROOT_DIR to the dir path.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
----
- sys/msdk/meson.build | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/sys/msdk/meson.build b/sys/msdk/meson.build
-index 24aabc7..6003bb7 100644
---- a/sys/msdk/meson.build
-+++ b/sys/msdk/meson.build
-@@ -46,7 +46,9 @@ if mfx_api != 'oneVPL'
-   mfx_dep = dependency('libmfx', version: ['>= 1.0', '<= 1.99'], required: false)
- 
-   if mfx_dep.found()
-+    pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-     mfx_incdir = mfx_dep.get_variable('includedir')
-+    mfx_incdir = pkgconf_sysroot +  mfx_incdir
-     mfx_inc = []
-     use_msdk = true
-   else
-@@ -75,7 +77,9 @@ if not use_msdk and mfx_api != 'MSDK'
-   mfx_dep = dependency('vpl', version: '>= 2.2', required: false)
- 
-   if mfx_dep.found()
-+    pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-     mfx_incdir = mfx_dep.get_variable('includedir')
-+    mfx_incdir = pkgconf_sysroot +  mfx_incdir
-     mfx_inc = []
-     use_onevpl = true
-   endif
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
index 78e8f35025..134bd3adad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
@@ -10,7 +10,6 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
-           file://0005-msdk-fix-includedir-path.patch \
            "
 SRC_URI[sha256sum] = "09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848"
 
-- 
2.33.1


