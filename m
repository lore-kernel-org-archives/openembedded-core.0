Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US4Or-0002i8-GP
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 13:50:18 +0200
Received: by mail-wi0-f170.google.com with SMTP id hm11so2570432wib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 04:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=A6pwBEJjkapCeaxEWEH47E8TumQeObe4UYcGGyhYf0I=;
	b=JQDSylAArjaA1kBWLpBPP346UNRMNW+fVlJjJCi4f907JiiOGttOlZWSOcTSgkv0z/
	AomxjluvNK0gfd3doLg0V4+HUx3TLKfVFb/FPHZyF2Y1zl44H2wT6CVi1q0ttY5s0pi9
	ZrzFubSGG9b7Z5K23s9tYdr/I5hjoYVTxr/1l+aaqBKnT4FMssORSMAqf8NrNn7UWK+X
	JlaNJxjajO/f6ZVWZmTXvqR0D+o2ZaL1z5DZvP+vDlPX8T0vcsjdd8GOInvDOQQVR4z3
	3m9839ZVd9PQ+ANUGBo4E752TozpVHeDKpVerM2200T6YjDqqcf/DOWD0jhyl/MWZJ1u
	yrjg==
X-Received: by 10.194.7.68 with SMTP id h4mr3103804wja.49.1366111959705;
	Tue, 16 Apr 2013 04:32:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fp2sm18865211wib.7.2013.04.16.04.32.38
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 04:32:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 12:29:49 +0100
Message-Id: <1366111789-24156-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkznRTEdOh5guqOH9bWiSaRv27xWlRFuU8oljjtbTF9eiINxFMELM4IYtFnIQHd4KQPLmdB
Subject: [PATCH] cairo: fix builds with libpng 1.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 11:50:18 -0000

libpng 1.6 emits more warnings than before, and is also stricter with function
ordering.  Fix the function ordering when reading PNGs, and stop treating all
warnings as errors.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cairo/cairo/png.patch  |  123 ++++++++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.12.14.bb |    3 +-
 2 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/cairo/cairo/png.patch

diff --git a/meta/recipes-graphics/cairo/cairo/png.patch b/meta/recipes-graphics/cairo/cairo/png.patch
new file mode 100644
index 0000000..15ce80a
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/png.patch
@@ -0,0 +1,123 @@
+libpng 1.6 is stricter in various ways, which trips up Cairo's PNG loader.
+
+Upstream-Status: Submitted (first)/Backport (second)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+From 1535e4eeda7e0792fe5e7e5ab377c5253ee89ce7 Mon Sep 17 00:00:00 2001
+From: Ingmar Runge <ingmar@irsoft.de>
+Date: Tue, 16 Apr 2013 10:48:59 +0100
+Subject: [PATCH 1/2] png: fix transform ordering
+
+libpng 1.6 is stricter with the function ordering, emitting the warning "invalid
+before the PNG header has been read" when calling png_set_read_user_transform_fn
+whilst loading a PNG.
+
+So, re-order the functions to the order that libpng is happy with.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/cairo-png.c |   21 +++++++++++++++++++--
+ 1 file changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/src/cairo-png.c b/src/cairo-png.c
+index e74a4a8..3aec86a 100644
+--- a/src/cairo-png.c
++++ b/src/cairo-png.c
+@@ -497,6 +497,20 @@ convert_bytes_to_data (png_structp png, png_row_infop row_info, png_bytep data)
+     }
+ }
+ 
++/* branches into premultiply_data or convert_bytes_to_data depending on color type */
++static void read_user_transform_func (png_structp png, png_row_infop row_info, png_bytep data)
++{
++    switch ((cairo_format_t) png_get_user_transform_ptr (png)) {
++        case CAIRO_FORMAT_ARGB32:
++            premultiply_data (png, row_info, data);
++            break;
++
++        case CAIRO_FORMAT_RGB24:
++            convert_bytes_to_data (png, row_info, data);
++            break;
++    }
++}
++
+ static cairo_status_t
+ stdio_read_func (void *closure, unsigned char *data, unsigned int size)
+ {
+@@ -623,6 +637,9 @@ read_png (struct png_read_closure_t *png_closure)
+ 
+     png_set_filler (png, 0xff, PNG_FILLER_AFTER);
+ 
++    /* this must be stored before calling png_read_update_info */
++    png_set_read_user_transform_fn (png, read_user_transform_func);
++
+     /* recheck header after setting EXPAND options */
+     png_read_update_info (png, info);
+     png_get_IHDR (png, info,
+@@ -643,15 +660,15 @@ read_png (struct png_read_closure_t *png_closure)
+ 
+ 	case PNG_COLOR_TYPE_RGB_ALPHA:
+ 	    format = CAIRO_FORMAT_ARGB32;
+-	    png_set_read_user_transform_fn (png, premultiply_data);
+ 	    break;
+ 
+ 	case PNG_COLOR_TYPE_RGB:
+ 	    format = CAIRO_FORMAT_RGB24;
+-	    png_set_read_user_transform_fn (png, convert_bytes_to_data);
+ 	    break;
+     }
+ 
++    png_set_user_transform_info (png, (void*) format, 0, 0);
++
+     stride = cairo_format_stride_for_width (format, png_width);
+     if (stride < 0) {
+ 	surface = _cairo_surface_create_in_error (_cairo_error (CAIRO_STATUS_INVALID_STRIDE));
+-- 
+1.7.10.4
+
+From 2dd2c826a5b367d32cf2d48ed69754795990c5db Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Tue, 16 Apr 2013 10:58:56 +0100
+Subject: [PATCH] png: Avoid marking the surface as in error after a png
+ warning
+
+It turns out that libpng will continue to load an image after throwing a
+warning, and that libpng16 now throws warnings for images that libpng15
+and earlier loaded without error. As we were happily loading those
+images into cairo surfaces before, we are therefore being overzealous
+in throwing an error now - so just squelch the warning.
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+---
+ src/cairo-png.c |   14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/cairo-png.c b/src/cairo-png.c
+index e74a4a8..068617d 100644
+--- a/src/cairo-png.c
++++ b/src/cairo-png.c
+@@ -149,13 +149,13 @@ static void
+ png_simple_warning_callback (png_structp png,
+ 	                     png_const_charp error_msg)
+ {
+-    cairo_status_t *error = png_get_error_ptr (png);
+-
+-    /* default to the most likely error */
+-    if (*error == CAIRO_STATUS_SUCCESS)
+-	*error = _cairo_error (CAIRO_STATUS_NO_MEMORY);
+-
+-    /* png does not expect to abort and will try to tidy up after a warning */
++    /* png does not expect to abort and will try to tidy up and continue
++     * loading the image after a warning. So we also want to return the
++     * (incorrect?) surface.
++     *
++     * We use our own warning callback to squelch any attempts by libpng
++     * to write to stderr as we may not be in control of that output.
++     */
+ }
+ 
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/cairo/cairo_1.12.14.bb b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
index 16f9d7b..40aa169 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.14.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 PR = "r0"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
+SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
+           file://png.patch"
 
 SRC_URI[md5sum] = "27b634113d0f52152d60ae8e2ec7daa7"
 SRC_URI[sha256sum] = "96d0d1e3f9b74d2ca3469ff187c5e5f25649b1ad35cf06f4f3a83847dff4ac13"
-- 
1.7.10.4



