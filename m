Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id E426576FD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 03:20:43 +0000 (UTC)
Received: by pasz6 with SMTP id z6so40489961pas.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 20:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/aZYw+tSCse68MA3RPd02Yqmf3CdlnVGHA4uJqB3N4M=;
	b=JzUGGlxKi3NUlc9WZWA/nr11rklGmErxaBml4fTne0zhqYN2xFQceEWm7JRZciTkDP
	fyHtnO2ETJx377j9BSsyWvHW8fuDziL9vVQK2nhWkRQvF3RmP0KiPxqmZ8kAUwwKky81
	Z3pRBFoprzqos7sLtWNg2t6/2kKoffQthDHjT/6rEs1ekq229rjq3JEwjd29Umv7nJls
	2DPfqWidohkj6pH8d75FO17dnxCQDPV2JuNXTG58vlo1bCAyQDwHOULzKVoQ144C02dA
	vNWpcVzyyTNKHAxLI+omNebEbZAJcN3RmKzei+SHVvHloHwWHHxpOTGlmi0QLhXSGrEY
	lNag==
X-Received: by 10.66.141.199 with SMTP id rq7mr7953127pab.140.1445397643682;
	Tue, 20 Oct 2015 20:20:43 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	dd2sm2497368pbc.27.2015.10.20.20.20.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 20:20:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 20:20:35 -0700
Message-Id: <1445397635-25151-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cairo: backport fix for compatibility with OpenGL ES 2.0
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
X-List-Received-Date: Wed, 21 Oct 2015 03:20:46 -0000

To maintain compatibility with OpenGL ES 2.0, the matrix in
_cairo_gl_shader_bind_matrix() should be manually transposed,
and GL_FALSE passed as the transpose argument to the
glUniformMatrix3fv() call as it is the only valid value for
that parameter in OpenGL ES 2.0.

  http://lists.cairographics.org/archives/cairo/2015-May/026253.html
  http://cgit.freedesktop.org/cairo/commit/?id=f52f0e2feb1ad0a4de23c475a8c020d41a1764a8

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...anspose-the-matrix-in-_cairo_gl_shader_bi.patch | 49 ++++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.14.2.bb        |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch

diff --git a/meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch b/meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch
new file mode 100644
index 0000000..955b7d4
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch
@@ -0,0 +1,49 @@
+Upstream-Status: Backport
+
+  http://lists.cairographics.org/archives/cairo/2015-May/026253.html
+  http://cgit.freedesktop.org/cairo/commit/?id=f52f0e2feb1ad0a4de23c475a8c020d41a1764a8
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+
+From f52f0e2feb1ad0a4de23c475a8c020d41a1764a8 Mon Sep 17 00:00:00 2001
+From: Zan Dobersek <zdobersek@igalia.com>
+Date: Fri, 8 May 2015 01:50:25 -0700
+Subject: [PATCH] Manually transpose the matrix in _cairo_gl_shader_bind_matrix()
+
+To maintain compatibility with OpenGL ES 2.0, the matrix in
+_cairo_gl_shader_bind_matrix() should be manually transposed,
+and GL_FALSE passed as the transpose argument to the
+glUniformMatrix3fv() call as it is the only valid value for
+that parameter in OpenGL ES 2.0.
+
+Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
+Acked-by: "Henry (Yu) Song" <henry.song@samsung.com>
+---
+ src/cairo-gl-shaders.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/cairo-gl-shaders.c b/src/cairo-gl-shaders.c
+index 2710606..fe975d2 100644
+--- a/src/cairo-gl-shaders.c
++++ b/src/cairo-gl-shaders.c
+@@ -973,12 +973,12 @@ _cairo_gl_shader_bind_matrix (cairo_gl_context_t *ctx,
+ {
+     cairo_gl_dispatch_t *dispatch = &ctx->dispatch;
+     float gl_m[9] = {
+-	m->xx, m->xy, m->x0,
+-	m->yx, m->yy, m->y0,
+-	0,     0,     1
++	m->xx, m->yx, 0,
++	m->xy, m->yy, 0,
++	m->x0, m->y0, 1
+     };
+     assert (location != -1);
+-    dispatch->UniformMatrix3fv (location, 1, GL_TRUE, gl_m);
++    dispatch->UniformMatrix3fv (location, 1, GL_FALSE, gl_m);
+ }
+ 
+ void
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.2.bb b/meta/recipes-graphics/cairo/cairo_1.14.2.bb
index 3817dbf..75cde0a 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.2.bb
@@ -3,6 +3,7 @@ require cairo.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
+SRC_URI += "file://Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch"
 
 SRC_URI[md5sum] = "e1cdfaf1c6c995c4d4c54e07215b0118"
 SRC_URI[sha256sum] = "c919d999ddb1bbbecd4bbe65299ca2abd2079c7e13d224577895afa7005ecceb"
-- 
1.9.1


