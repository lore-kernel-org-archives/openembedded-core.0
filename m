Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id D73C26E9BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 11:52:06 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so1568013eaj.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 03:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ovomHihJ0868HvgaIEFROTQHY56QKna1Xdqcjg8kEIc=;
	b=XPIcLMT5X406E7AavTcDn13n6dYSvp63JkdnWVYigFvNB1eIdDeVUfT+GHPfHxxNYw
	D5crgNdI2HvzlnqMZo1IdAg6EvMeA15RbC6Iuxrnw7IMcHFKAyf6KV0e7UBVhGA7loMx
	uB6zPFRSUMnAYH8VwiqPmrCMwziHbbqUc0cjsgd4f3HuzvXQBoRQpBuajWnGpRfg5Iqx
	R+j0qRiudN/iZBF5g7yw6K+fRCU3SjoBmkzBz6e1NRPe1ema1ALOzsgxv9E3FEUUnUDh
	B3aHGWCz4zMS43Cd/0tJt3fQixdq8X8JAHi5HVvkC7eJb1I6rXW9QnOqsZ/T4/sixGGL
	whhQ==
X-Gm-Message-State: ALoCoQmC+MxN4/0y8nX+BNB/+Fg9fDfbnPI1c+vZr4kJ6OH/lWTsL1UaGs94oFi252uPq95scOPW
X-Received: by 10.14.172.133 with SMTP id t5mr669879eel.99.1391082727359;
	Thu, 30 Jan 2014 03:52:07 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	d43sm21491574eep.18.2014.01.30.03.52.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jan 2014 03:52:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2014 11:51:59 +0000
Message-Id: <1391082719-14432-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391082719-14432-1-git-send-email-ross.burton@intel.com>
References: <1391082719-14432-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] gdk-pixbuf: enable ptest
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
X-List-Received-Date: Thu, 30 Jan 2014 11:52:07 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest |    3 +
 .../gdk-pixbuf/gdk-pixbuf/tests-check.patch        |  465 ++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb |   17 +-
 3 files changed, 483 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/tests-check.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
new file mode 100644
index 0000000..8f90723
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner gdk-pixbuf
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/tests-check.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/tests-check.patch
new file mode 100644
index 0000000..31f3368
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/tests-check.patch
@@ -0,0 +1,465 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 9fa240c1ad5a815d63d8aa9126954152c2607f2e Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Sat, 25 Jan 2014 21:29:34 +0000
+Subject: Make testsuite robust against disabled formats
+
+Skip tests if their file format is not supported by the
+available loaders.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=722651
+---
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index de3442e..80840c2 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -42,17 +42,57 @@ dist_installed_test_data =		\
+ 	icc-profile.png			\
+ 	$(wildcard $(srcdir)/test-images/*)
+ 
++pixbuf_icc_SOURCES = 			\
++	pixbuf-icc.c			\
++	test-common.c			\
++	test-common.h			\
++	$(NULL)
++
++pixbuf_scale_SOURCES = 			\
++	pixbuf-scale.c			\
++	test-common.c			\
++	test-common.h			\
++	$(NULL)
++
++pixbuf_stream_SOURCES =			\
++	pixbuf-stream.c			\
++	test-common.c			\
++	test-common.h			\
++	$(NULL)
++
++pixbuf_threads_SOURCES =		\
++	pixbuf-threads.c		\
++	test-common.c			\
++	test-common.h			\
++	$(NULL)
++
++pixbuf_icon_serialize_SOURCES =		\
++	pixbuf-icon-serialize.c		\
++	test-common.c			\
++	test-common.h			\
++	$(NULL)
++
++pixbuf_save_SOURCES =			\
++	pixbuf-save.c			\
++	test-common.c			\
++	test-common.h			\
++	$(NULL)
++
+ pixbuf_resource_SOURCES = 		\
+ 	pixbuf-resource.c		\
++	test-common.c			\
++	test-common.h			\
+ 	resources.h			\
+-	resources.c
++	resources.c			\
++	$(NULL)
+ 
+ BUILT_SOURCES += resources.h resources.c
+ DISTCLEANFILES += 			\
+ 	resources.h resources.c 	\
+ 	pixbuf-save-options		\
+ 	pixbuf-randomly-modified-image	\
+-	pixbuf-save-roundtrip
++	pixbuf-save-roundtrip		\
++	$(NULL)
+ 	
+ EXTRA_DIST += resources.gresource.xml
+ TESTS_ENVIRONMENT += GDK_PIXBUF_MODULE_FILE=$(top_builddir)/gdk-pixbuf/loaders.cache
+diff --git a/tests/pixbuf-icc.c b/tests/pixbuf-icc.c
+index 9cb9c90..3b95b09 100644
+--- a/tests/pixbuf-icc.c
++++ b/tests/pixbuf-icc.c
+@@ -22,6 +22,7 @@
+ 
+ #include "config.h"
+ #include "gdk-pixbuf/gdk-pixbuf.h"
++#include "test-common.h"
+ 
+ static void
+ test_incremental (gconstpointer data)
+@@ -34,7 +35,12 @@ test_incremental (gconstpointer data)
+   gchar *contents;
+   gsize size;
+ 
+-  
++  if (!format_supported (filename))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   g_file_get_contents (g_test_get_filename (G_TEST_DIST, filename, NULL), &contents, &size, &error);
+   g_assert_no_error (error);
+ 
+@@ -62,6 +68,12 @@ test_nonincremental (gconstpointer data)
+   GdkPixbuf *pixbuf;
+   const gchar *profile;
+ 
++  if (!format_supported (filename))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   pixbuf = gdk_pixbuf_new_from_file (g_test_get_filename (G_TEST_DIST, filename, NULL), &error);
+   g_assert_no_error (error);
+ 
+diff --git a/tests/pixbuf-icon-serialize.c b/tests/pixbuf-icon-serialize.c
+index 20bf6e1..880c654 100644
+--- a/tests/pixbuf-icon-serialize.c
++++ b/tests/pixbuf-icon-serialize.c
+@@ -1,5 +1,6 @@
+ #include "config.h"
+ #include "gdk-pixbuf/gdk-pixbuf.h"
++#include "test-common.h"
+ #include <string.h>
+ #include <glib.h>
+ 
+@@ -13,6 +14,12 @@ test_serialize (void)
+   GIcon *icon;
+   GInputStream *stream;
+ 
++  if (!format_supported ("png"))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   pixbuf = gdk_pixbuf_new_from_file (g_test_get_filename (G_TEST_DIST, "test-image.png", NULL), &error);
+   g_assert_no_error (error);
+   g_assert (pixbuf != NULL);
+diff --git a/tests/pixbuf-resource.c b/tests/pixbuf-resource.c
+index a747bca..aa0bed8 100644
+--- a/tests/pixbuf-resource.c
++++ b/tests/pixbuf-resource.c
+@@ -22,6 +22,7 @@
+ 
+ #include "config.h"
+ #include "gdk-pixbuf/gdk-pixbuf.h"
++#include "test-common.h"
+ #include <string.h>
+ 
+ #define compare_option(p1, p2, key) \
+@@ -77,6 +78,12 @@ test_resource (void)
+   GError *error = NULL;
+   GdkPixbuf *pixbuf, *ref;
+ 
++  if (!format_supported ("png"))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   path = g_test_get_filename (G_TEST_DIST, "icc-profile.png", NULL);
+   ref = gdk_pixbuf_new_from_file (path, &error);
+   g_assert_no_error (error);
+@@ -111,6 +118,12 @@ test_resource_at_scale (void)
+   GError *error = NULL;
+   GdkPixbuf *pixbuf, *ref;
+ 
++  if (!format_supported ("png"))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   path = g_test_get_filename (G_TEST_DIST, "icc-profile.png", NULL);
+   ref = gdk_pixbuf_new_from_file_at_scale (path, 40, 10, FALSE, &error);
+   g_assert_no_error (error);
+diff --git a/tests/pixbuf-save.c b/tests/pixbuf-save.c
+index f7df29b..78ab288 100644
+--- a/tests/pixbuf-save.c
++++ b/tests/pixbuf-save.c
+@@ -21,6 +21,7 @@
+  */
+ 
+ #include "gdk-pixbuf/gdk-pixbuf.h"
++#include "test-common.h"
+ #include <string.h>
+ 
+ #define compare_option(p1, p2, key) \
+@@ -76,6 +77,12 @@ test_save_roundtrip (void)
+   GdkPixbuf *ref;
+   GdkPixbuf *pixbuf;
+ 
++  if (!format_supported ("png"))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   ref = gdk_pixbuf_new_from_file (g_test_get_filename (G_TEST_DIST, "test-image.png", NULL), &error);
+   g_assert_no_error (error);
+ 
+@@ -98,6 +105,12 @@ test_save_options (void)
+   GdkPixbuf *pixbuf;
+   GError *error = NULL;
+ 
++  if (!format_supported ("png"))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   ref = gdk_pixbuf_new (GDK_COLORSPACE_RGB, FALSE, 8, 10, 10);
+   gdk_pixbuf_fill (ref, 0xff00ff00);
+ 
+diff --git a/tests/pixbuf-scale.c b/tests/pixbuf-scale.c
+index 4fd9fd5..d57e56a 100644
+--- a/tests/pixbuf-scale.c
++++ b/tests/pixbuf-scale.c
+@@ -22,6 +22,7 @@
+ 
+ #include "config.h"
+ #include "gdk-pixbuf/gdk-pixbuf.h"
++#include "test-common.h"
+ 
+ static void
+ test_scale (gconstpointer data)
+@@ -33,6 +34,12 @@ test_scale (gconstpointer data)
+   GdkPixbuf *pixbuf;
+   gint width, height;
+ 
++  if (!format_supported (filename))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   path = g_test_get_filename (G_TEST_DIST, filename, NULL);
+   ref = gdk_pixbuf_new_from_file (path, &error);
+   g_assert_no_error (error);
+diff --git a/tests/pixbuf-stream.c b/tests/pixbuf-stream.c
+index 0c2cebe..d66ce3e 100644
+--- a/tests/pixbuf-stream.c
++++ b/tests/pixbuf-stream.c
+@@ -22,6 +22,7 @@
+ 
+ #include "config.h"
+ #include "gdk-pixbuf/gdk-pixbuf.h"
++#include "test-common.h"
+ #include <string.h>
+ 
+ #define compare_option(p1, p2, key) \
+@@ -71,6 +72,12 @@ test_stream (gconstpointer data)
+   GFile *file;
+   GInputStream *stream;
+ 
++  if (!format_supported (filename))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   path = g_test_get_filename (G_TEST_DIST, filename, NULL);
+   ref = gdk_pixbuf_new_from_file (path, &error);
+   g_assert_no_error (error);
+@@ -116,6 +123,12 @@ test_stream_async (gconstpointer data)
+   gsize size;
+   GInputStream *stream;
+ 
++  if (!format_supported (filename))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   path = g_test_get_filename (G_TEST_DIST, filename, NULL);
+   ref = gdk_pixbuf_new_from_file (path, &error);
+   g_assert_no_error (error);
+@@ -138,6 +151,12 @@ test_stream_at_scale (gconstpointer data)
+   GFile *file;
+   GInputStream *stream;
+ 
++  if (!format_supported (filename))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   path = g_test_get_filename (G_TEST_DIST, filename, NULL);
+   ref = gdk_pixbuf_new_from_file_at_scale (path, 20, 30, TRUE, &error);
+   g_assert_no_error (error);
+@@ -167,6 +186,12 @@ test_stream_at_scale_async (gconstpointer data)
+   gsize size;
+   GInputStream *stream;
+ 
++  if (!format_supported (filename))
++    {
++      g_test_skip ("format not supported");
++      return;
++    }
++
+   path = g_test_get_filename (G_TEST_DIST, filename, NULL);
+   ref = gdk_pixbuf_new_from_file_at_scale (path, 40, 10, FALSE, &error);
+   g_assert_no_error (error);
+diff --git a/tests/pixbuf-threads.c b/tests/pixbuf-threads.c
+index 5eeb9dd..f2694fd 100644
+--- a/tests/pixbuf-threads.c
++++ b/tests/pixbuf-threads.c
+@@ -18,7 +18,9 @@
+  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
+  */
+ 
++#include "config.h"
+ #include "gdk-pixbuf/gdk-pixbuf.h"
++#include "test-common.h"
+ 
+ static void
+ load_image (gpointer data, 
+@@ -71,15 +73,24 @@ test_threads (void)
+ 
+   for (i = 0; i < iterations; i++)
+     {
+-      g_thread_pool_push (pool, "valid_jpeg_test", NULL);
+-      g_thread_pool_push (pool, "valid_png_test", NULL);
+-      g_thread_pool_push (pool, "valid_gif_test", NULL);
+-      g_thread_pool_push (pool, "valid_bmp_test", NULL);
+-      g_thread_pool_push (pool, "valid_jpeg_progressive_test", NULL);
+-      g_thread_pool_push (pool, "valid_xpm_test", NULL);
+-      g_thread_pool_push (pool, "valid_ras_test", NULL);
+-      g_thread_pool_push (pool, "valid_tga_test", NULL);
+-      g_thread_pool_push (pool, "valid_tiff1_test", NULL);
++      if (format_supported ("jpeg"))
++        g_thread_pool_push (pool, "valid_jpeg_test", NULL);
++      if (format_supported ("png"))
++        g_thread_pool_push (pool, "valid_png_test", NULL);
++      if (format_supported ("gif"))
++        g_thread_pool_push (pool, "valid_gif_test", NULL);
++      if (format_supported ("bmp"))
++        g_thread_pool_push (pool, "valid_bmp_test", NULL);
++      if (format_supported ("jpeg"))
++        g_thread_pool_push (pool, "valid_jpeg_progressive_test", NULL);
++      if (format_supported ("xpm"))
++        g_thread_pool_push (pool, "valid_xpm_test", NULL);
++      if (format_supported ("ras"))
++        g_thread_pool_push (pool, "valid_ras_test", NULL);
++      if (format_supported ("tga"))
++        g_thread_pool_push (pool, "valid_tga_test", NULL);
++      if (format_supported ("tiff"))
++        g_thread_pool_push (pool, "valid_tiff1_test", NULL);
+     }
+ 
+   g_thread_pool_free (pool, FALSE, TRUE);
+diff --git a/tests/test-common.c b/tests/test-common.c
+new file mode 100644
+index 0000000..c7673e3
+--- /dev/null
++++ b/tests/test-common.c
+@@ -0,0 +1,65 @@
++/* -*- Mode: C; c-basic-offset: 2; -*- */
++/* GdkPixbuf library - test loaders
++ *
++ * Copyright (C) 2014 Red Hat, Inc.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
++ *
++ * Author: Matthias Clasen
++ */
++
++#include "config.h"
++#include "test-common.h"
++#include "gdk-pixbuf/gdk-pixbuf.h"
++
++#include <string.h>
++
++gboolean
++format_supported (const gchar *filename)
++{
++  const gchar *name = NULL;
++  GSList *formats, *l;
++  gboolean retval;
++  const gchar *names[] = { "png", "jpeg", "bmp", "gif", "ras",
++    "tga", "xpm", "xbm" };
++  gint i;
++
++  for (i = 0; i < G_N_ELEMENTS (names); i++)
++    {
++      if (strstr (filename, names[i]))
++        {
++          name = names[i];
++          break;
++        }
++    }
++  if (name == NULL)
++    return FALSE;
++
++  retval = FALSE;
++  formats = gdk_pixbuf_get_formats ();
++  for (l = formats; l; l = l->next)
++    {
++      GdkPixbufFormat *format = l->data;
++
++      if (g_str_equal (gdk_pixbuf_format_get_name (format), name))
++        {
++          retval = TRUE;
++          break;
++        }
++    }
++  g_slist_free (formats);
++
++  return retval;
++}
+diff --git a/tests/test-common.h b/tests/test-common.h
+new file mode 100644
+index 0000000..32ff35a
+--- /dev/null
++++ b/tests/test-common.h
+@@ -0,0 +1,33 @@
++/* -*- Mode: C; c-basic-offset: 2; -*- */
++/* GdkPixbuf library - test loaders
++ *
++ * Copyright (C) 2014 Red Hat, Inc.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA.
++ *
++ * Author: Matthias Clasen
++ */
++
++#ifndef __TEST_COMMON_H__
++
++#include <glib.h>
++
++G_BEGIN_DECLS
++
++gboolean format_supported (const gchar *filename);
++
++G_END_DECLS
++
++#endif  /* __TEST_COMMON_H__ */
+--
+cgit v0.9.2
\ No newline at end of file
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
index 187af46..85a7b43 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
@@ -16,12 +16,14 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
            file://extending-libinstall-dependencies.patch \
+           file://run-ptest \
+           file://tests-check.patch \
            "
 
 SRC_URI[md5sum] = "81161cc895eb43afd9ae7354b87e2261"
 SRC_URI[sha256sum] = "c229c53f59573eab9410b53690a4b9db770312c80a4d84ecd6295aa894574494"
 
-inherit autotools pkgconfig gettext pixbufcache
+inherit autotools pkgconfig gettext pixbufcache ptest
 
 LIBV = "2.10.0"
 
@@ -42,6 +44,7 @@ PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
 
 EXTRA_OECONF = "\
   --disable-introspection \
+  ${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-installed-tests', '--disable-installed-tests', d)} \
 "
 
 PACKAGES =+ "${PN}-xlib"
@@ -64,6 +67,11 @@ FILES_${PN}-dbg += " \
 	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
 "
 
+FILES_${PN}-ptest += "${libdir}/gdk-pixbuf/installed-tests \
+                      ${datadir}/installed-tests/gdk-pixbuf"
+
+RDEPENDS_${PN}-ptest += "gnome-desktop-testing"
+
 PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
 PACKAGES_DYNAMIC_class-native = ""
 
@@ -72,7 +80,12 @@ python populate_packages_prepend () {
 
     loaders_root = d.expand('${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders')
 
-    d.setVar('PIXBUF_PACKAGES', ' '.join(do_split_packages(d, loaders_root, '^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s')))
+    packages = ' '.join(do_split_packages(d, loaders_root, '^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s'))
+    d.setVar('PIXBUF_PACKAGES', packages)
+
+    # The test suite exercises all the loaders, so ensure they are all
+    # dependencies of the ptest package.
+    d.appendVar("RDEPENDS_gdk-pixbuf-ptest", " " + packages)
 }
 
 do_install_append_class-native() {
-- 
1.7.10.4


