Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF27770DF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:52:40 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so116648586pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AncQWRsCaZO2sisabSiuN8f50t5/QKqDQTEkDlZJB9g=;
	b=QYmnYN6pFUMSeL8QbAV07gvKoSpyBrUv6EV7QjhjIPfJtzoSofhhvs62FHvkFKkE7O
	xMmXa3xl6F7bzZ3qZvStNGBO/rygmuEOE492Y/u5TK6sy1sKEFQ38yCbECU64bjCpwpi
	3J51ZyXgChwA+P4YXwDCfrPvKoxsV5Jrz+C9EOnWbqPTUFHvskUsdRHWwGRyD8xSCj2T
	N8vQZ2wTmFQAmo34UPQd894evutBRfgADD0i3ULXvQIFNiJUqtNH+03ZXLuONImcsZLa
	RT9Gf/iAlc778P+kUzkN9kVYQF0DDr/HQRoQ1Yp9DmCNrr2kTAIqkprtPvphaym1aeXp
	u94w==
X-Received: by 10.68.201.229 with SMTP id kd5mr15957693pbc.114.1446799960664; 
	Fri, 06 Nov 2015 00:52:40 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	uy1sm12553361pac.39.2015.11.06.00.52.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:52:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:52:27 -0800
Message-Id: <1446799947-7149-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446799947-7149-1-git-send-email-armccurdy@gmail.com>
References: <1446799947-7149-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] cairo: update 1.14.2 -> 1.14.4
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
X-List-Received-Date: Fri, 06 Nov 2015 08:52:40 -0000

Release 1.14.4    (2015-10-28  Bryce Harrington <bryce@osg.samsung.com>)
========================================================================
Just in time for Halloween we see another bug-fix release for Cairo.
This brings a few dozen straightforward bug fixes with no API changes.

In addition, this includes a typical assortment of fixes to tests,
cleanup of warnings and memory leaks, correction of misspellings,
updates to documentation, etc.

For a complete log of changes since 1.14.2, please see:

    http://cairographics.org/releases/ChangeLog.cairo-1.14.4

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...anspose-the-matrix-in-_cairo_gl_shader_bi.patch | 49 ----------------------
 .../cairo/{cairo_1.14.2.bb => cairo_1.14.4.bb}     |  5 +--
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch
 rename meta/recipes-graphics/cairo/{cairo_1.14.2.bb => cairo_1.14.4.bb} (88%)

diff --git a/meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch b/meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch
deleted file mode 100644
index 955b7d4..0000000
--- a/meta/recipes-graphics/cairo/cairo/Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Upstream-Status: Backport
-
-  http://lists.cairographics.org/archives/cairo/2015-May/026253.html
-  http://cgit.freedesktop.org/cairo/commit/?id=f52f0e2feb1ad0a4de23c475a8c020d41a1764a8
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-
-From f52f0e2feb1ad0a4de23c475a8c020d41a1764a8 Mon Sep 17 00:00:00 2001
-From: Zan Dobersek <zdobersek@igalia.com>
-Date: Fri, 8 May 2015 01:50:25 -0700
-Subject: [PATCH] Manually transpose the matrix in _cairo_gl_shader_bind_matrix()
-
-To maintain compatibility with OpenGL ES 2.0, the matrix in
-_cairo_gl_shader_bind_matrix() should be manually transposed,
-and GL_FALSE passed as the transpose argument to the
-glUniformMatrix3fv() call as it is the only valid value for
-that parameter in OpenGL ES 2.0.
-
-Reviewed-by: Bryce Harrington <bryce@osg.samsung.com>
-Acked-by: "Henry (Yu) Song" <henry.song@samsung.com>
----
- src/cairo-gl-shaders.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/cairo-gl-shaders.c b/src/cairo-gl-shaders.c
-index 2710606..fe975d2 100644
---- a/src/cairo-gl-shaders.c
-+++ b/src/cairo-gl-shaders.c
-@@ -973,12 +973,12 @@ _cairo_gl_shader_bind_matrix (cairo_gl_context_t *ctx,
- {
-     cairo_gl_dispatch_t *dispatch = &ctx->dispatch;
-     float gl_m[9] = {
--	m->xx, m->xy, m->x0,
--	m->yx, m->yy, m->y0,
--	0,     0,     1
-+	m->xx, m->yx, 0,
-+	m->xy, m->yy, 0,
-+	m->x0, m->y0, 1
-     };
-     assert (location != -1);
--    dispatch->UniformMatrix3fv (location, 1, GL_TRUE, gl_m);
-+    dispatch->UniformMatrix3fv (location, 1, GL_FALSE, gl_m);
- }
- 
- void
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.2.bb b/meta/recipes-graphics/cairo/cairo_1.14.4.bb
similarity index 88%
rename from meta/recipes-graphics/cairo/cairo_1.14.2.bb
rename to meta/recipes-graphics/cairo/cairo_1.14.4.bb
index 75cde0a..17ea851 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.4.bb
@@ -3,10 +3,9 @@ require cairo.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
-SRC_URI += "file://Manually-transpose-the-matrix-in-_cairo_gl_shader_bi.patch"
 
-SRC_URI[md5sum] = "e1cdfaf1c6c995c4d4c54e07215b0118"
-SRC_URI[sha256sum] = "c919d999ddb1bbbecd4bbe65299ca2abd2079c7e13d224577895afa7005ecceb"
+SRC_URI[md5sum] = "90a929e8fe66fb5d19b5adaaea1e9a12"
+SRC_URI[sha256sum] = "f6ec9c7c844db9ec011f0d66b57ef590c45adf55393d1fc249003512522ee716"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
1.9.1


