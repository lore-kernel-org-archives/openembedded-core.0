Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A65A772FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686984"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:09 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:47:01 +0200
Message-Id: <139b7216a82d2e8f2d8da1eaa2046fd2cc94c013.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 16/19] xf86-video-omap: Upgrade 0.4.3 -> 0.4.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Nov 2015 09:44:09 -0000

Remove backported patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...put_dpms-Replace-logical-with-bitwise-ope.patch | 31 ----------------------
 ...ideo-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} |  6 ++---
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
deleted file mode 100644
index 41e77d3..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fc653ca3b36435aea281ae409fb90f85e1bc0d81 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Sep 2015 08:44:13 +0000
-Subject: [freedreno][PATCH] drmmode_output_dpms: Replace logical && with bitwise &
- operation
-
-This is a mask calculation so bitbwise & should have been used
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- src/drmmode_display.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/drmmode_display.c b/src/drmmode_display.c
-index c3cf4f8..eb54b59 100644
---- a/src/drmmode_display.c
-+++ b/src/drmmode_display.c
-@@ -777,7 +777,7 @@ drmmode_output_dpms(xf86OutputPtr output, int mode)
- 
- 	for (i = 0; i < koutput->count_props; i++) {
- 		props = drmModeGetProperty(drmmode->fd, koutput->props[i]);
--		if (props && (props->flags && DRM_MODE_PROP_ENUM)) {
-+		if (props && (props->flags & DRM_MODE_PROP_ENUM)) {
- 			if (!strcmp(props->name, "DPMS")) {
- 				mode_id = koutput->props[i];
- 				drmModeFreeProperty(props);
--- 
-2.5.1
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.4.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.4.bb
index 76682ed..7895449 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.4.bb
@@ -24,10 +24,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xf86driproto"
 
-SRC_URI += "file://0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch"
-
-SRC_URI[md5sum] = "be35daf6fa4b75092cc4a8978c437bc5"
-SRC_URI[sha256sum] = "db1e0e69fd4c4c8fdca5ef2cb0447bccd7518a718495876a6904bef57b39986d"
+SRC_URI[md5sum] = "a364e151a537948f75bb8c9b840a31da"
+SRC_URI[sha256sum] = "a7192690b8638f5c8d611a1bae07cc13081e22edd4070f37a2f5c3f8d79e7ebc"
 
 CFLAGS += " -I${STAGING_INCDIR}/xorg "
 
-- 
2.1.4


