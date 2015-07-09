Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD9665CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 07:52:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2015 00:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,438,1432623600"; d="scan'208";a="761101036"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2015 00:52:01 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:52:44 +0300
Message-Id: <764226e4c2c85c013f480b55da49946457d9c781.1436427694.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
References: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1436427694.git.jussi.kukkonen@intel.com>
References: <cover.1436427694.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/5] cogl-1.0: Upgrade 1.18.2 -> 1.20.0
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
X-List-Received-Date: Thu, 09 Jul 2015 07:52:02 -0000

* Backport patch that fixes build with GLES2

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../cogl-framebuffer-gl-Work-again-on-GLESv2.patch | 41 ++++++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb      |  6 ----
 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb      |  8 +++++
 3 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch b/meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
new file mode 100644
index 0000000..8e83957
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+
+From f8cce5f6cb2958a4074f87cd345bfe46e0dda6e1 Mon Sep 17 00:00:00 2001
+From: "Jasper St. Pierre" <jstpierre@mecheye.net>
+Date: Mon, 20 Apr 2015 12:08:29 -0700
+Subject: cogl-framebuffer-gl: Work again on GLESv2
+
+
+diff --git a/cogl/driver/gl/cogl-framebuffer-gl.c b/cogl/driver/gl/cogl-framebuffer-gl.c
+index 793b10b..609cfb3 100644
+--- a/cogl/driver/gl/cogl-framebuffer-gl.c
++++ b/cogl/driver/gl/cogl-framebuffer-gl.c
+@@ -107,6 +107,12 @@
+ #ifndef GL_PACK_INVERT_MESA
+ #define GL_PACK_INVERT_MESA 0x8758
+ #endif
++#ifndef GL_BACK_LEFT
++#define GL_BACK_LEFT				0x0402
++#endif
++#ifndef GL_BACK_RIGHT
++#define GL_BACK_RIGHT				0x0403
++#endif
+ 
+ #ifndef GL_COLOR
+ #define GL_COLOR 0x1800
+@@ -245,6 +251,9 @@ _cogl_framebuffer_gl_flush_stereo_mode_state (CoglFramebuffer *framebuffer)
+   if (framebuffer->type == COGL_FRAMEBUFFER_TYPE_OFFSCREEN)
+     return;
+ 
++  if (!ctx->glDrawBuffer)
++    return;
++
+   /* The one-shot default draw buffer setting in _cogl_framebuffer_gl_bind
+    * must have already happened. If not it would override what we set here. */
+   g_assert (ctx->was_bound_to_onscreen);
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb
deleted file mode 100644
index 6700efb..0000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cogl-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-
-SRC_URI[archive.md5sum] = "952155d526d35f297737266408e842b5"
-SRC_URI[archive.sha256sum] = "9278e519d5480eb0379efd48db024e8fdbf93f01dff48a7e756b85b508a863aa"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb
new file mode 100644
index 0000000..d20b814
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb
@@ -0,0 +1,8 @@
+require cogl-1.0.inc
+
+SRC_URI += "file://cogl-framebuffer-gl-Work-again-on-GLESv2.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
+SRC_URI[archive.md5sum] = "5b28897194d9ff76a574a9493d1f7ee0"
+SRC_URI[archive.sha256sum] = "729e35495829e7d31fafa3358e47b743ba21a2b08ff9b6cd28fb74c0de91192b"
+
-- 
2.1.4


