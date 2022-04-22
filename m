Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A36C4707A
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.5165.1650605510204424329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 22:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dWeWuXwl;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650605510; x=1682141510;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ibLKyGyFqm8CQrBGyB+ObRyWxVBV7/P6iilPaxPMdqU=;
  b=dWeWuXwlshTKai6lwRMhH/8yD6vxFNJ7Bvyg1vlOoE/cL0csCH+2HAo1
   q5SiBjscRCRPOs0wD7I4QPXWeNY2oA8LmMQn6AZf8aVCtQ5gbUsMj1UQr
   GgOgfKCopxPbzBQS8vPg67xJpLUFKlxuTVagDq05IAGSZpFwrx9miH4PT
   EMjbbZndm0qvWfy1BNhQmXadUhpfqbsRfLnEL08ZfxSLgZI39odCvP4vU
   dremdJy1FTFyNjhm9GG/AfP4/izhL3GdS9V6P4IosarbABnrSHxHWZUrB
   eHhpoUF5VlivtrZvGKvS7POeSd1UrVoFd3HhI2HGezhv16+L7cNCoDKkJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264049735"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400";
   d="scan'208";a="264049735"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 22:31:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400";
   d="scan'208";a="615252625"
Received: from saininav-desk1.png.intel.com ([10.158.87.77])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 22:31:48 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] gstreamer1.0-plugins-bad: drop patch
Date: Fri, 22 Apr 2022 13:49:35 +0800
Message-Id: <20220422054935.2801454-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164773

With latest gstreamer version pkg-config able to find header
path with msdk enabled.

Drop this patch as its not require anymore.

(From OE-Core rev: eaa3b31247b4d3cc47428f4d80ae31f232e344d4)

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
2.25.1


