Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US3uh-0007wY-VZ
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 13:19:04 +0200
Received: by mail-wi0-f174.google.com with SMTP id m6so1415658wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 04:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=v8ZZ4BpxevWAJQrh0oj4g8yA/zo0qhsn58A4a2XNUHo=;
	b=lBBETo9LNUwEQN+nZclwm+MVheI5ezn4+n18oyBLNejFK4mDnNXpTHInOdLCzq9GHn
	fEYWg4OTDij6whn3z0zfDHGj3GcsWp/OIBZGuBECRi+mT0XQW+1GWo6wBQaS1LIQhgPG
	z0Q00NzNfYQrLjJc1rHRIerdJKhkJWfqgwC6/UgGW3WsVtGvhDAzdxLqYz6mLsgusu+p
	XGAX1lqOAr/v/LKibqR9aaOd4LozfW3uylO4xTerpo9MLlRc9e3LtAfVZR//0rDMDdQc
	29bnWVdqC52I4pJ8XlpKdvBWOpAGyb8mbzJj2YEvsbVztD7I1i8uZYmndKvXAVyeu3mA
	qb5w==
X-Received: by 10.180.90.18 with SMTP id bs18mr18024238wib.31.1366110090000;
	Tue, 16 Apr 2013 04:01:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id n2sm18712978wiy.6.2013.04.16.04.01.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 04:01:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:58:39 +0100
Message-Id: <1366109919-11950-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkZDVgiYlbZFzcAjcrKp2ZCCuWl8hfyhzcARPOI+zG9l4GsUKkxeQhv9CSIYiXVJiKSchYi
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
X-List-Received-Date: Tue, 16 Apr 2013 11:19:06 -0000

libpng 1.6 emits more warnings than before, and is also stricter with function
ordering.  Fix the function ordering when reading PNGs, and stop treating all
warnings as errors.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cairo/cairo/png.patch  |  139 ++++++++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.12.14.bb |    3 +-
 2 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/cairo/cairo/png.patch

diff --git a/meta/recipes-graphics/cairo/cairo/png.patch b/meta/recipes-graphics/cairo/cairo/png.patch
new file mode 100644
index 0000000..bbdb407
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/png.patch
@@ -0,0 +1,139 @@
+libpng 1.6 is stricter in various ways, which trips up Cairo's PNG loader.
+
+Upstream-Status: Submitted
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
+
+From 062e4209e6c5659b44514c577dd77752295c3985 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 16 Apr 2013 10:53:36 +0100
+Subject: [PATCH 2/2] png: use default warning callback
+
+As libpng 1.6 is emiting more warnings, stop transforming all warnings into
+fatal errors and instead use the default warning callback that (depending on
+libpng configuration) may write the warnings to stderr.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/cairo-png.c |   18 ++----------------
+ 1 file changed, 2 insertions(+), 16 deletions(-)
+
+diff --git a/src/cairo-png.c b/src/cairo-png.c
+index 3aec86a..f8a67e2 100644
+--- a/src/cairo-png.c
++++ b/src/cairo-png.c
+@@ -145,20 +145,6 @@ png_simple_error_callback (png_structp png,
+     /* if we get here, then we have to choice but to abort ... */
+ }
+ 
+-static void
+-png_simple_warning_callback (png_structp png,
+-	                     png_const_charp error_msg)
+-{
+-    cairo_status_t *error = png_get_error_ptr (png);
+-
+-    /* default to the most likely error */
+-    if (*error == CAIRO_STATUS_SUCCESS)
+-	*error = _cairo_error (CAIRO_STATUS_NO_MEMORY);
+-
+-    /* png does not expect to abort and will try to tidy up after a warning */
+-}
+-
+-
+ /* Starting with libpng-1.2.30, we must explicitly specify an output_flush_fn.
+  * Otherwise, we will segfault if we are writing to a stream. */
+ static void
+@@ -217,7 +203,7 @@ write_png (cairo_surface_t	*surface,
+ 
+     png = png_create_write_struct (PNG_LIBPNG_VER_STRING, &status,
+ 	                           png_simple_error_callback,
+-	                           png_simple_warning_callback);
++	                           NULL);
+     if (unlikely (png == NULL)) {
+ 	status = _cairo_error (CAIRO_STATUS_NO_MEMORY);
+ 	goto BAIL3;
+@@ -570,7 +556,7 @@ read_png (struct png_read_closure_t *png_closure)
+     png = png_create_read_struct (PNG_LIBPNG_VER_STRING,
+                                   &status,
+ 	                          png_simple_error_callback,
+-	                          png_simple_warning_callback);
++	                          NULL);
+     if (unlikely (png == NULL)) {
+ 	surface = _cairo_surface_create_in_error (_cairo_error (CAIRO_STATUS_NO_MEMORY));
+ 	goto BAIL;
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



