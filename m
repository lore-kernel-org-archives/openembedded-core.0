Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1USSp4-00054K-Pi
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 15:54:57 +0200
Received: by mail-wi0-f182.google.com with SMTP id m6so1550787wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=0AHPSYCvup76GrucqKTKeBz4kfZ5+lQ160/m9iBbbgk=;
	b=dNi9QlDakLF+hN49p9KIJnfN0isRrXVVKbPsqKqyqQyTBsr+Jw9jHVkj80Rg1wXIA3
	LOomiDQLaIzE8i9+Gw1OxXSr+UMIyREXk+8aFdBk+OshKCPxvlD9DkjudwAtcnX6ymHb
	NDsfK35W7Vj7d/u16Mv4+u/rrrASLrLok7uwIuAsAPEGayMLEFdci+ltuB1VhdsWFKJz
	mb5nwx8gntRtc0fHgKmqomPNgaZCzmT06KVBe27dFnGOoYrJ+8LaUxjvEl3RyuXndVH4
	TS/co1tYhwggqA3LIpsyBmMiPp5v2HW5f1M7wpAzm9gyV2n6/WLqW8IXIr08crIEN4Cx
	8yKg==
X-Received: by 10.180.36.48 with SMTP id n16mr26357005wij.30.1366205841408;
	Wed, 17 Apr 2013 06:37:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ed6sm9713454wib.9.2013.04.17.06.37.20
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 06:37:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2013 14:34:28 +0100
Message-Id: <1366205668-19096-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366205668-19096-1-git-send-email-ross.burton@intel.com>
References: <1366205668-19096-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQksOwkezEhKSK0uMwu2YOPhh9Eh8/gOV2hoQQjGzU46oDZsJjeebF2wVjGQqnFeQTCu85Pp
Subject: [PATCH 2/2] cairo: drop transform patch, it's been rejected upstream
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
X-List-Received-Date: Wed, 17 Apr 2013 13:55:03 -0000

This fix was rejected by upstream, the correct fix is actually to fix libpng.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cairo/cairo/png.patch |   77 ++-------------------------
 1 file changed, 3 insertions(+), 74 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo/png.patch b/meta/recipes-graphics/cairo/cairo/png.patch
index 15ce80a..bf00332 100644
--- a/meta/recipes-graphics/cairo/cairo/png.patch
+++ b/meta/recipes-graphics/cairo/cairo/png.patch
@@ -1,81 +1,10 @@
-libpng 1.6 is stricter in various ways, which trips up Cairo's PNG loader.
+libpng 1.6 is stricter in various ways, which can trip up the PNG loader as it
+considers all warnings fatal.
 
-Upstream-Status: Submitted (first)/Backport (second)
+Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 
-From 1535e4eeda7e0792fe5e7e5ab377c5253ee89ce7 Mon Sep 17 00:00:00 2001
-From: Ingmar Runge <ingmar@irsoft.de>
-Date: Tue, 16 Apr 2013 10:48:59 +0100
-Subject: [PATCH 1/2] png: fix transform ordering
-
-libpng 1.6 is stricter with the function ordering, emitting the warning "invalid
-before the PNG header has been read" when calling png_set_read_user_transform_fn
-whilst loading a PNG.
-
-So, re-order the functions to the order that libpng is happy with.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- src/cairo-png.c |   21 +++++++++++++++++++--
- 1 file changed, 19 insertions(+), 2 deletions(-)
-
-diff --git a/src/cairo-png.c b/src/cairo-png.c
-index e74a4a8..3aec86a 100644
---- a/src/cairo-png.c
-+++ b/src/cairo-png.c
-@@ -497,6 +497,20 @@ convert_bytes_to_data (png_structp png, png_row_infop row_info, png_bytep data)
-     }
- }
- 
-+/* branches into premultiply_data or convert_bytes_to_data depending on color type */
-+static void read_user_transform_func (png_structp png, png_row_infop row_info, png_bytep data)
-+{
-+    switch ((cairo_format_t) png_get_user_transform_ptr (png)) {
-+        case CAIRO_FORMAT_ARGB32:
-+            premultiply_data (png, row_info, data);
-+            break;
-+
-+        case CAIRO_FORMAT_RGB24:
-+            convert_bytes_to_data (png, row_info, data);
-+            break;
-+    }
-+}
-+
- static cairo_status_t
- stdio_read_func (void *closure, unsigned char *data, unsigned int size)
- {
-@@ -623,6 +637,9 @@ read_png (struct png_read_closure_t *png_closure)
- 
-     png_set_filler (png, 0xff, PNG_FILLER_AFTER);
- 
-+    /* this must be stored before calling png_read_update_info */
-+    png_set_read_user_transform_fn (png, read_user_transform_func);
-+
-     /* recheck header after setting EXPAND options */
-     png_read_update_info (png, info);
-     png_get_IHDR (png, info,
-@@ -643,15 +660,15 @@ read_png (struct png_read_closure_t *png_closure)
- 
- 	case PNG_COLOR_TYPE_RGB_ALPHA:
- 	    format = CAIRO_FORMAT_ARGB32;
--	    png_set_read_user_transform_fn (png, premultiply_data);
- 	    break;
- 
- 	case PNG_COLOR_TYPE_RGB:
- 	    format = CAIRO_FORMAT_RGB24;
--	    png_set_read_user_transform_fn (png, convert_bytes_to_data);
- 	    break;
-     }
- 
-+    png_set_user_transform_info (png, (void*) format, 0, 0);
-+
-     stride = cairo_format_stride_for_width (format, png_width);
-     if (stride < 0) {
- 	surface = _cairo_surface_create_in_error (_cairo_error (CAIRO_STATUS_INVALID_STRIDE));
--- 
-1.7.10.4
-
 From 2dd2c826a5b367d32cf2d48ed69754795990c5db Mon Sep 17 00:00:00 2001
 From: Chris Wilson <chris@chris-wilson.co.uk>
 Date: Tue, 16 Apr 2013 10:58:56 +0100
-- 
1.7.10.4



