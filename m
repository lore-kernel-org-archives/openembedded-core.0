Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 285426E9C2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:30:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785178"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:48 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:30 +0200
Message-Id: <3cca063d7344f56d404bcb2d152ee2c88805d0a7.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 11/13] xf86-video-intel: add compat patch for xorg >= 1.14.99.2
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
X-List-Received-Date: Thu, 06 Feb 2014 15:30:01 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...Map-changes-of-DamageUnregister-API-in-1..patch |   29 ++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.21.15.bb        |    4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch
new file mode 100644
index 0000000..3a42d13
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/compat-api-Map-changes-of-DamageUnregister-API-in-1..patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport
+
+From 524a45da56e2a052ffafa3887891caa90ba39f76 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Sat, 5 Oct 2013 18:42:24 +0100
+Subject: [PATCH] compat-api: Map changes of DamageUnregister API in 1.14.99.2
+
+Reported-by: Emmanuel Benisty <benisty.e@gmail.com>
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+---
+ src/compat-api.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index 8eb46ef..244a486 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -162,4 +162,8 @@ static inline void FreePixmap(PixmapPtr pixmap)
+ 	if ((d)->pScreen->SourceValidate) (d)->pScreen->SourceValidate(d, x, y, w, h)
+ #endif
+ 
++#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,14,99,2,0)
++#define DamageUnregister(d, dd) DamageUnregister(dd)
++#endif
++
+ #endif
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
index 828cae8..78edd5a 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
-SRC_URI += "file://disable-dri2-tests.patch"
+SRC_URI += "file://disable-dri2-tests.patch \
+            file://compat-api-Map-changes-of-DamageUnregister-API-in-1..patch \
+           "
 
 PACKAGECONFIG ??= "sna udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
 
-- 
1.7.9.5


