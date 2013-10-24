Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4BCBD6D427
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 18:29:43 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id z5so2206959lbh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dQFpZiTdEd4pjXDly8fVb9AHLMEdFpVzED6mK/zg0RQ=;
	b=U1IlfroannPBxpmu1QVYp/+oXGlsTvvnyzbfk4qcBgRlY2emBxC5ppIaHHSaTatZgM
	kHRNE4gVLi3gjq2UncYIbYi/3xCrEm1C990ohPVz47CrebUBTycbzYc7KlTOZTWz/TSy
	pkR9MP87h+HO5SOURR1FyjE2wOONl/Biu0C4YGigVFp2ETR+Xr75dEeQ4pgMfTYSlxjt
	YHQLQXT90ltq/kxVfskqBQyPvtFQZJU6XX/i/EFQFHkHRQ453fFqP2lP4fSKxvpsdB4b
	aB9voaJJiFg2ngjuyv+W1Ul11Y76riAHsqyWQJ4ugokDpP9+jeBzKF+Ml+ZX3c7YnTSf
	5EYg==
X-Received: by 10.152.120.194 with SMTP id le2mr1733lab.68.1382639384574;
	Thu, 24 Oct 2013 11:29:44 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id kx1sm2693722lac.7.2013.10.24.11.29.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 11:29:43 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZPfC-0000mv-5X; Thu, 24 Oct 2013 21:29:42 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 21:29:39 +0300
Message-Id: <c5fc4955f4fbfb5ea164f9687586f95278a4c2af.1382639156.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <dfce1648ef7781347e1a159067e788c0f3c85f03.1382639156.git.cazfi74@gmail.com>
References: <dfce1648ef7781347e1a159067e788c0f3c85f03.1382639156.git.cazfi74@gmail.com>
In-Reply-To: <cover.1382639156.git.cazfi74@gmail.com>
References: <cover.1382639156.git.cazfi74@gmail.com>
Subject: [PATCH 2/3] cairo: upgrade to upstream version 1.12.16
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
X-List-Received-Date: Thu, 24 Oct 2013 18:29:43 -0000

png.patch dropped as it's part of upstream now

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-graphics/cairo/cairo/png.patch        | 52 ----------------------
 .../cairo/{cairo_1.12.14.bb => cairo_1.12.16.bb}   |  9 ++--
 2 files changed, 3 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-graphics/cairo/cairo/png.patch
 rename meta/recipes-graphics/cairo/{cairo_1.12.14.bb => cairo_1.12.16.bb} (87%)

diff --git a/meta/recipes-graphics/cairo/cairo/png.patch b/meta/recipes-graphics/cairo/cairo/png.patch
deleted file mode 100644
index bf00332..0000000
--- a/meta/recipes-graphics/cairo/cairo/png.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-libpng 1.6 is stricter in various ways, which can trip up the PNG loader as it
-considers all warnings fatal.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-
-From 2dd2c826a5b367d32cf2d48ed69754795990c5db Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Tue, 16 Apr 2013 10:58:56 +0100
-Subject: [PATCH] png: Avoid marking the surface as in error after a png
- warning
-
-It turns out that libpng will continue to load an image after throwing a
-warning, and that libpng16 now throws warnings for images that libpng15
-and earlier loaded without error. As we were happily loading those
-images into cairo surfaces before, we are therefore being overzealous
-in throwing an error now - so just squelch the warning.
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
----
- src/cairo-png.c |   14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/cairo-png.c b/src/cairo-png.c
-index e74a4a8..068617d 100644
---- a/src/cairo-png.c
-+++ b/src/cairo-png.c
-@@ -149,13 +149,13 @@ static void
- png_simple_warning_callback (png_structp png,
- 	                     png_const_charp error_msg)
- {
--    cairo_status_t *error = png_get_error_ptr (png);
--
--    /* default to the most likely error */
--    if (*error == CAIRO_STATUS_SUCCESS)
--	*error = _cairo_error (CAIRO_STATUS_NO_MEMORY);
--
--    /* png does not expect to abort and will try to tidy up after a warning */
-+    /* png does not expect to abort and will try to tidy up and continue
-+     * loading the image after a warning. So we also want to return the
-+     * (incorrect?) surface.
-+     *
-+     * We use our own warning callback to squelch any attempts by libpng
-+     * to write to stderr as we may not be in control of that output.
-+     */
- }
- 
- 
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/cairo/cairo_1.12.14.bb b/meta/recipes-graphics/cairo/cairo_1.12.16.bb
similarity index 87%
rename from meta/recipes-graphics/cairo/cairo_1.12.14.bb
rename to meta/recipes-graphics/cairo/cairo_1.12.16.bb
index 40aa169..246bd0b 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.14.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.16.bb
@@ -2,13 +2,10 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r0"
+SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
-           file://png.patch"
-
-SRC_URI[md5sum] = "27b634113d0f52152d60ae8e2ec7daa7"
-SRC_URI[sha256sum] = "96d0d1e3f9b74d2ca3469ff187c5e5f25649b1ad35cf06f4f3a83847dff4ac13"
+SRC_URI[md5sum] = "a1304edcdc99282f478b995ee5f8f854"
+SRC_URI[sha256sum] = "2505959eb3f1de3e1841023b61585bfd35684b9733c7b6a3643f4f4cbde6d846"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
1.8.4.rc3


