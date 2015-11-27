Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 191FF6012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:07:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860460866"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 04:07:08 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:10:34 +0200
Message-Id: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/10] cogl-1.0: Upgrade 1.20.0 -> 1.22.0
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
X-List-Received-Date: Fri, 27 Nov 2015 12:07:10 -0000

Remove patch that is no longer necessary.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../cogl-framebuffer-gl-Work-again-on-GLESv2.patch | 41 ----------------------
 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb      |  8 -----
 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb      |  5 +++
 3 files changed, 5 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch b/meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
deleted file mode 100644
index 8e83957..0000000
--- a/meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-
-
-From f8cce5f6cb2958a4074f87cd345bfe46e0dda6e1 Mon Sep 17 00:00:00 2001
-From: "Jasper St. Pierre" <jstpierre@mecheye.net>
-Date: Mon, 20 Apr 2015 12:08:29 -0700
-Subject: cogl-framebuffer-gl: Work again on GLESv2
-
-
-diff --git a/cogl/driver/gl/cogl-framebuffer-gl.c b/cogl/driver/gl/cogl-framebuffer-gl.c
-index 793b10b..609cfb3 100644
---- a/cogl/driver/gl/cogl-framebuffer-gl.c
-+++ b/cogl/driver/gl/cogl-framebuffer-gl.c
-@@ -107,6 +107,12 @@
- #ifndef GL_PACK_INVERT_MESA
- #define GL_PACK_INVERT_MESA 0x8758
- #endif
-+#ifndef GL_BACK_LEFT
-+#define GL_BACK_LEFT				0x0402
-+#endif
-+#ifndef GL_BACK_RIGHT
-+#define GL_BACK_RIGHT				0x0403
-+#endif
- 
- #ifndef GL_COLOR
- #define GL_COLOR 0x1800
-@@ -245,6 +251,9 @@ _cogl_framebuffer_gl_flush_stereo_mode_state (CoglFramebuffer *framebuffer)
-   if (framebuffer->type == COGL_FRAMEBUFFER_TYPE_OFFSCREEN)
-     return;
- 
-+  if (!ctx->glDrawBuffer)
-+    return;
-+
-   /* The one-shot default draw buffer setting in _cogl_framebuffer_gl_bind
-    * must have already happened. If not it would override what we set here. */
-   g_assert (ctx->was_bound_to_onscreen);
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb
deleted file mode 100644
index d20b814..0000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require cogl-1.0.inc
-
-SRC_URI += "file://cogl-framebuffer-gl-Work-again-on-GLESv2.patch"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-SRC_URI[archive.md5sum] = "5b28897194d9ff76a574a9493d1f7ee0"
-SRC_URI[archive.sha256sum] = "729e35495829e7d31fafa3358e47b743ba21a2b08ff9b6cd28fb74c0de91192b"
-
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
new file mode 100644
index 0000000..3b1e199
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
@@ -0,0 +1,5 @@
+require cogl-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
+SRC_URI[archive.md5sum] = "ab684ec96848d79d22757fb3064820c8"
+SRC_URI[archive.sha256sum] = "689dfb5d14fc1106e9d2ded0f7930dcf7265d0bc84fa846b4f03941633eeaa91"
-- 
2.1.4


