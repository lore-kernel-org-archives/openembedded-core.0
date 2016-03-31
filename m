Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 86E0E65CB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 23:27:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2016 16:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,424,1455004800"; d="scan'208";a="922986056"
Received: from anandsan-mobl.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.254.19.102])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2016 16:27:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 31 Mar 2016 16:27:30 -0700
Message-Id: <1459466850-2142-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] xf86-video-intel: Add patch to allow UXA to build
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
X-List-Received-Date: Thu, 31 Mar 2016 23:27:32 -0000

This patch is a backport to fixup an API change in xorg-server

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...-call-to-PixmapSyncDirtyHelper-broken-by-.patch | 30 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.99.917.bb       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
new file mode 100644
index 0000000..29924bb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
@@ -0,0 +1,30 @@
+From 2c5063938cc809f624e56efd4673041fa8141e81 Mon Sep 17 00:00:00 2001
+From: Martin Peres <martin.peres@linux.intel.com>
+Date: Thu, 9 Jul 2015 11:26:38 +0300
+Subject: [PATCH] uxa: fix the call to PixmapSyncDirtyHelper, broken by
+ xserver's 90db5ed
+
+[ickle: switch to HAS_DIRTYTRACKING_ROTATION as suggested by Dave Airlie]
+Signed-off-by: Martin Peres <martin.peres@linux.intel.com>
+
+Upstream-Status: Backport
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ src/compat-api.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index aa93bee..293e9d7 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -247,3 +247,7 @@ static inline void FreePixmap(PixmapPtr pixmap)
+ #endif
+ 
+ #endif
++
++#if HAS_DIRTYTRACKING_ROTATION
++#define PixmapSyncDirtyHelper(d, dd) PixmapSyncDirtyHelper(d)
++#endif
+-- 
+2.5.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
index a2f1456..f412556 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://disable-x11-dri3.patch \
             file://always_include_xorg_server.h.patch \
             file://sna-Protect-against-ABI-breakage-in-recent-versions-.patch \
             file://udev-fstat.patch \
+            file://0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch \
            "
 
 SRC_URI[md5sum] = "fa196a66e52c0c624fe5d350af7a5e7b"
-- 
2.5.0


