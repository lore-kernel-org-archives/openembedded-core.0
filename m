Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2FE7726D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:35:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2016 05:36:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="1101504139"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2016 05:36:01 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 4EC7F6A4080;
	Mon, 19 Dec 2016 05:35:12 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:45 +0200
Message-Id: <7c28213d57d7577ccb519564ef0f070d124a1c57.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
Subject: [PATCH 7/8] cogl-1.0: Upgrade 1.22.0 -> 1.22.2
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
X-List-Received-Date: Mon, 19 Dec 2016 13:35:59 -0000

Bug fix release. Backport a build fixing patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...Fix-an-incorrect-preprocessor-conditional.patch | 32 ++++++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb      |  7 -----
 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb      |  8 ++++++
 3 files changed, 40 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
new file mode 100644
index 0000000..2a9d8f8
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
@@ -0,0 +1,32 @@
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Backport
+
+
+Original upstream commit follows:
+
+From b583e21d8698dbd58013320cfb47739102efdea7 Mon Sep 17 00:00:00 2001
+From: Kalev Lember <klember@redhat.com>
+Date: Wed, 19 Oct 2016 23:38:28 +0200
+Subject: [PATCH] Fix an incorrect preprocessor conditional
+
+This fixes the build with wayland wayland egl server support disabled.
+---
+ cogl/winsys/cogl-winsys-egl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cogl/winsys/cogl-winsys-egl.c b/cogl/winsys/cogl-winsys-egl.c
+index 39bfd884..4a9f3aa6 100644
+--- a/cogl/winsys/cogl-winsys-egl.c
++++ b/cogl/winsys/cogl-winsys-egl.c
+@@ -1029,7 +1029,7 @@ _cogl_egl_create_image (CoglContext *ctx,
+     egl_ctx = EGL_NO_CONTEXT;
+   else
+ #endif
+-#if COGL_HAS_WAYLAND_EGL_SERVER_SUPPORT
++#ifdef COGL_HAS_WAYLAND_EGL_SERVER_SUPPORT
+   /* The WL_bind_wayland_display spec states that EGL_NO_CONTEXT is to be used
+    * in conjunction with the EGL_WAYLAND_BUFFER_WL target */
+   if (target == EGL_WAYLAND_BUFFER_WL)
+-- 
+2.11.0
+
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
deleted file mode 100644
index ed10c7a..0000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require cogl-1.0.inc
-
-SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-SRC_URI[archive.md5sum] = "ab684ec96848d79d22757fb3064820c8"
-SRC_URI[archive.sha256sum] = "689dfb5d14fc1106e9d2ded0f7930dcf7265d0bc84fa846b4f03941633eeaa91"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
new file mode 100644
index 0000000..5901062
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
@@ -0,0 +1,8 @@
+require cogl-1.0.inc
+
+SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
+            file://0001-Fix-an-incorrect-preprocessor-conditional.patch"
+SRC_URI[archive.md5sum] = "d53b708ca7c4af03d7254e46945d6b33"
+SRC_URI[archive.sha256sum] = "39a718cdb64ea45225a7e94f88dddec1869ab37a21b339ad058a9d898782c00d"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-- 
2.1.4


