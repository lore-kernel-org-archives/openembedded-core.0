Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 74CD871AD6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945800"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:19 +0300
Message-Id: <66e673061bc14ab9f7bf0b93162872e4f68cb608.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 27/50] gtk+3: update to 3.22.24
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:49 -0000

Rebase Jussi's GL patches.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...Do-not-try-to-initialize-GL-without-libGL.patch |  22 +-
 .../0003-Add-disable-opengl-configure-option.patch | 244 ++++++---------------
 .../gtk+/{gtk+3_3.22.17.bb => gtk+3_3.22.24.bb}    |   4 +-
 3 files changed, 76 insertions(+), 194 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.17.bb => gtk+3_3.22.24.bb} (84%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
index ab7b6594148..cc7edf7607c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
@@ -1,4 +1,4 @@
-From 2d2361f24be1e51201063dbbda570debe8702b6f Mon Sep 17 00:00:00 2001
+From 23a563155406980dfc8cf6f7c2da6cce0ac310f0 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
 Subject: [PATCH 2/4] Do not try to initialize GL without libGL
@@ -15,29 +15,29 @@ before calling epoxy APIs.
 
 Upstream-Status: Denied
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
- configure.ac            | 7 +++++++
+ configure.ac            | 6 ++++++
  gdk/x11/gdkvisual-x11.c | 5 +++++
- 2 files changed, 12 insertions(+)
+ 2 files changed, 11 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index f43ac09..965eec9 100644
+index 757fd7c..0a48875 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -346,6 +346,13 @@ AC_ARG_ENABLE(mir-backend,
-                               [enable the Mir gdk backend])],
- 			      [backend_set=yes])
- 
+@@ -351,6 +351,12 @@ AC_ARG_ENABLE(cloudproviders,
+               [AS_HELP_STRING([--enable-cloudproviders],
+                               [enable libcloudproviders integration])],
+                               [cloudproviders_set=yes])
 +AC_ARG_ENABLE(glx,
 +              [AS_HELP_STRING([--enable-glx],
 +                              [When enabled Gdk will try to initialize GLX])])
 +AS_IF([test "x$enable_glx" != "xno"], [
 +  AC_DEFINE([HAVE_GLX], [], [GLX will be available at runtime])
 +])
-+
+ 
  if test -z "$backend_set"; then
    if test "$platform_win32" = yes; then
-     enable_win32_backend=yes
 diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
 index 81479d8..3c8c5c0 100644
 --- a/gdk/x11/gdkvisual-x11.c
@@ -56,5 +56,5 @@ index 81479d8..3c8c5c0 100644
  
  gint
 -- 
-2.12.0
+2.14.1
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index 9cdee0e54e0..d2f12dc7ff4 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,4 +1,4 @@
-From a2e6b7cbbd6d741fed38d91b3742aa4a08395aba Mon Sep 17 00:00:00 2001
+From de36df70d87ba3453ed4f2b92e990021c67238f5 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
 Subject: [PATCH 3/4] Add --disable-opengl configure option
@@ -19,41 +19,40 @@ as it actually will depend on OpenGL.
 
 Upstream-Status: Inappropriate [Evil eye expected from upstream]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
- configure.ac                      | 13 +++++++--
- demos/gtk-demo/glarea.c           | 14 +++++++++
- docs/tools/Makefile.am            |  9 ++++--
- docs/tools/widgets.c              |  4 ++-
- gdk/gdkdisplay.c                  |  4 ++-
- gdk/gdkgl.c                       | 10 +++++++
- gdk/gdkglcontext.c                |  6 ++++
- gdk/gdkwindow.c                   | 13 +++++++++
- gdk/x11/Makefile.am               | 30 +++++++++++++++++---
- gdk/x11/gdkdisplay-x11.c          |  6 +++-
- gdk/x11/gdkscreen-x11.c           |  5 ++++
- gdk/x11/gdkwindow-x11.c           |  4 +++
- gdk/x11/gdkx-autocleanups.h       |  2 ++
- gdk/x11/gdkx-with-gl-context.h    | 59 ++++++++++++++++++++++++++++++++++++++
- gdk/x11/gdkx-without-gl-context.h | 58 +++++++++++++++++++++++++++++++++++++
- gdk/x11/gdkx.h                    | 60 ---------------------------------------
- gtk/Makefile.am                   |  3 +-
- gtk/gtkglarea.c                   | 20 ++++++++++++-
- gtk/inspector/general.c           |  6 ++++
- tests/Makefile.am                 | 10 +++++--
- testsuite/gtk/objects-finalize.c  |  2 ++
- 21 files changed, 261 insertions(+), 77 deletions(-)
- create mode 100644 gdk/x11/gdkx-with-gl-context.h
+ configure.ac                               | 13 +++++--
+ demos/gtk-demo/glarea.c                    | 14 ++++++++
+ docs/tools/Makefile.am                     |  9 +++--
+ docs/tools/widgets.c                       |  4 ++-
+ gdk/gdkdisplay.c                           |  4 ++-
+ gdk/gdkgl.c                                | 10 ++++++
+ gdk/gdkglcontext.c                         |  6 ++++
+ gdk/gdkwindow.c                            | 13 +++++++
+ gdk/x11/Makefile.am                        | 30 +++++++++++++---
+ gdk/x11/gdkdisplay-x11.c                   |  6 +++-
+ gdk/x11/gdkscreen-x11.c                    |  5 +++
+ gdk/x11/gdkwindow-x11.c                    |  4 +++
+ gdk/x11/gdkx-autocleanups.h                |  2 ++
+ gdk/x11/{gdkx.h => gdkx-with-gl-context.h} |  1 -
+ gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++++++++++
+ gtk/Makefile.am                            |  3 +-
+ gtk/gtkglarea.c                            | 20 ++++++++++-
+ gtk/inspector/general.c                    |  6 ++++
+ tests/Makefile.am                          | 10 ++++--
+ testsuite/gtk/objects-finalize.c           |  2 ++
+ 20 files changed, 202 insertions(+), 18 deletions(-)
+ rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (98%)
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
- delete mode 100644 gdk/x11/gdkx.h
 
 diff --git a/configure.ac b/configure.ac
-index 965eec9..00bf544 100644
+index 0a48875..6f0a3a6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -346,6 +346,15 @@ AC_ARG_ENABLE(mir-backend,
-                               [enable the Mir gdk backend])],
- 			      [backend_set=yes])
- 
+@@ -351,6 +351,15 @@ AC_ARG_ENABLE(cloudproviders,
+               [AS_HELP_STRING([--enable-cloudproviders],
+                               [enable libcloudproviders integration])],
+                               [cloudproviders_set=yes])
 +AC_ARG_ENABLE(opengl,
 +              [AS_HELP_STRING([--enable-opengl],
 +                              [When enabled, Gtk+ will use libepoxy and exposes GtkGLArea widget ])])
@@ -66,16 +65,16 @@ index 965eec9..00bf544 100644
  AC_ARG_ENABLE(glx,
                [AS_HELP_STRING([--enable-glx],
                                [When enabled Gdk will try to initialize GLX])])
-@@ -1352,7 +1361,7 @@ CFLAGS="$saved_cflags"
+@@ -1372,7 +1381,7 @@ CFLAGS="$saved_cflags"
  LDFLAGS="$saved_ldflags"
  
  GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
--GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends epoxy >= epoxy_required_version"
-+GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends $EPOXY_PACKAGES"
+-GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES"
++GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES"
  
  PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
  GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
-@@ -1386,7 +1395,7 @@ fi
+@@ -1406,7 +1415,7 @@ fi
  PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
  
  GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
@@ -210,10 +209,10 @@ index 932daf1..54239d6 100644
  
    return info;
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 6b012ca..311c7f7 100644
+index 40225e9..c55e1de 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
-@@ -2409,7 +2409,9 @@ gboolean
+@@ -2406,7 +2406,9 @@ gboolean
  gdk_display_make_gl_context_current (GdkDisplay   *display,
                                       GdkGLContext *context)
  {
@@ -347,7 +346,7 @@ index c79dca0..8a7bec2 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 689d666..fb84256 100644
+index c0e0a7d..437ab03 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -360,7 +359,7 @@ index 689d666..fb84256 100644
  
  /* for the use of round() */
  #include "fallback-c89.c"
-@@ -2819,6 +2821,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
+@@ -2822,6 +2824,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
  {
    GError *internal_error = NULL;
  
@@ -374,7 +373,7 @@ index 689d666..fb84256 100644
    if (_gdk_gl_flags & GDK_GL_DISABLE)
      {
        g_set_error_literal (error, GDK_GL_ERROR,
-@@ -2954,6 +2963,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
+@@ -2957,6 +2966,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
          }
        else
          {
@@ -382,7 +381,7 @@ index 689d666..fb84256 100644
  	  gdk_gl_context_make_current (context);
            /* With gl we always need a surface to combine the gl
               drawing with the native drawing. */
-@@ -2968,6 +2978,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
+@@ -2971,6 +2981,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
            glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
  
            glViewport (0, 0, ww, wh);
@@ -390,7 +389,7 @@ index 689d666..fb84256 100644
          }
      }
  
-@@ -3031,6 +3042,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
+@@ -3034,6 +3045,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
  
            gdk_gl_context_make_current (window->gl_paint_context);
  
@@ -398,7 +397,7 @@ index 689d666..fb84256 100644
            if (!cairo_region_is_empty (opaque_region))
              gdk_gl_texture_from_surface (window->current_paint.surface,
                                           opaque_region);
-@@ -3041,6 +3053,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
+@@ -3044,6 +3056,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
                                             window->current_paint.need_blend_region);
                glDisable(GL_BLEND);
              }
@@ -479,7 +478,7 @@ index 6289f3a..cbbac79 100644
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index ad65e29..91345ee 100644
+index e9a263f..2829a31 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -492,7 +491,7 @@ index ad65e29..91345ee 100644
  #include "gdk-private.h"
  
  #include <glib.h>
-@@ -2994,7 +2996,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
+@@ -3169,7 +3171,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
    display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
    display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
  
@@ -554,71 +553,21 @@ index edb0ea7..a317d61 100644
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
-diff --git a/gdk/x11/gdkx-with-gl-context.h b/gdk/x11/gdkx-with-gl-context.h
-new file mode 100644
-index 0000000..ae05fa6
---- /dev/null
+diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
+similarity index 98%
+rename from gdk/x11/gdkx.h
+rename to gdk/x11/gdkx-with-gl-context.h
+index 1f64bcc..ae05fa6 100644
+--- a/gdk/x11/gdkx.h
 +++ b/gdk/x11/gdkx-with-gl-context.h
-@@ -0,0 +1,59 @@
-+/* GDK - The GIMP Drawing Kit
-+ * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with this library. If not, see <http://www.gnu.org/licenses/>.
-+ */
-+
-+/*
-+ * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
-+ * file for a list of people on the GTK+ Team.  See the ChangeLog
-+ * files for a list of changes.  These files are distributed with
-+ * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
-+ */
-+
-+#ifndef __GDK_X_H__
-+#define __GDK_X_H__
-+
-+#include <gdk/gdk.h>
-+
-+#include <X11/Xlib.h>
-+#include <X11/Xutil.h>
-+
-+#define __GDKX_H_INSIDE__
-+
-+#include <gdk/x11/gdkx11applaunchcontext.h>
-+#include <gdk/x11/gdkx11cursor.h>
-+#include <gdk/x11/gdkx11device.h>
-+#include <gdk/x11/gdkx11device-core.h>
-+#include <gdk/x11/gdkx11device-xi2.h>
-+#include <gdk/x11/gdkx11devicemanager.h>
-+#include <gdk/x11/gdkx11devicemanager-core.h>
-+#include <gdk/x11/gdkx11devicemanager-xi2.h>
-+#include <gdk/x11/gdkx11display.h>
-+#include <gdk/x11/gdkx11displaymanager.h>
-+#include <gdk/x11/gdkx11dnd.h>
-+#include <gdk/x11/gdkx11glcontext.h>
-+#include <gdk/x11/gdkx11keys.h>
-+#include <gdk/x11/gdkx11property.h>
-+#include <gdk/x11/gdkx11screen.h>
-+#include <gdk/x11/gdkx11selection.h>
-+#include <gdk/x11/gdkx11utils.h>
-+#include <gdk/x11/gdkx11visual.h>
-+#include <gdk/x11/gdkx11window.h>
-+
-+#include <gdk/x11/gdkx-autocleanups.h>
-+
-+#undef __GDKX_H_INSIDE__
-+
-+#endif /* __GDK_X_H__ */
+@@ -45,7 +45,6 @@
+ #include <gdk/x11/gdkx11dnd.h>
+ #include <gdk/x11/gdkx11glcontext.h>
+ #include <gdk/x11/gdkx11keys.h>
+-#include <gdk/x11/gdkx11monitor.h>
+ #include <gdk/x11/gdkx11property.h>
+ #include <gdk/x11/gdkx11screen.h>
+ #include <gdk/x11/gdkx11selection.h>
 diff --git a/gdk/x11/gdkx-without-gl-context.h b/gdk/x11/gdkx-without-gl-context.h
 new file mode 100644
 index 0000000..c9e2617
@@ -683,77 +632,11 @@ index 0000000..c9e2617
 +#undef __GDKX_H_INSIDE__
 +
 +#endif /* __GDK_X_H__ */
-diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
-deleted file mode 100644
-index 1f64bcc..0000000
---- a/gdk/x11/gdkx.h
-+++ /dev/null
-@@ -1,60 +0,0 @@
--/* GDK - The GIMP Drawing Kit
-- * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
-- *
-- * This library is free software; you can redistribute it and/or
-- * modify it under the terms of the GNU Lesser General Public
-- * License as published by the Free Software Foundation; either
-- * version 2 of the License, or (at your option) any later version.
-- *
-- * This library is distributed in the hope that it will be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- * Lesser General Public License for more details.
-- *
-- * You should have received a copy of the GNU Lesser General Public
-- * License along with this library. If not, see <http://www.gnu.org/licenses/>.
-- */
--
--/*
-- * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
-- * file for a list of people on the GTK+ Team.  See the ChangeLog
-- * files for a list of changes.  These files are distributed with
-- * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
-- */
--
--#ifndef __GDK_X_H__
--#define __GDK_X_H__
--
--#include <gdk/gdk.h>
--
--#include <X11/Xlib.h>
--#include <X11/Xutil.h>
--
--#define __GDKX_H_INSIDE__
--
--#include <gdk/x11/gdkx11applaunchcontext.h>
--#include <gdk/x11/gdkx11cursor.h>
--#include <gdk/x11/gdkx11device.h>
--#include <gdk/x11/gdkx11device-core.h>
--#include <gdk/x11/gdkx11device-xi2.h>
--#include <gdk/x11/gdkx11devicemanager.h>
--#include <gdk/x11/gdkx11devicemanager-core.h>
--#include <gdk/x11/gdkx11devicemanager-xi2.h>
--#include <gdk/x11/gdkx11display.h>
--#include <gdk/x11/gdkx11displaymanager.h>
--#include <gdk/x11/gdkx11dnd.h>
--#include <gdk/x11/gdkx11glcontext.h>
--#include <gdk/x11/gdkx11keys.h>
--#include <gdk/x11/gdkx11monitor.h>
--#include <gdk/x11/gdkx11property.h>
--#include <gdk/x11/gdkx11screen.h>
--#include <gdk/x11/gdkx11selection.h>
--#include <gdk/x11/gdkx11utils.h>
--#include <gdk/x11/gdkx11visual.h>
--#include <gdk/x11/gdkx11window.h>
--
--#include <gdk/x11/gdkx-autocleanups.h>
--
--#undef __GDKX_H_INSIDE__
--
--#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 45fb7c2..ce81011 100644
+index 842c2f9..0921bc7 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1411,14 +1411,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
+@@ -1416,14 +1416,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
  	&& cp xgen-gptbc gtkprivatetypebuiltins.c  \
  	&& rm -f xgen-gptbc
  
@@ -913,7 +796,7 @@ index c241ec8..24576dd 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index f86c166..ba1acad 100644
+index e2db6e4..e51cf34 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
@@ -949,17 +832,16 @@ diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-finalize.c
 index 0b3a519..07b096f 100644
 --- a/testsuite/gtk/objects-finalize.c
 +++ b/testsuite/gtk/objects-finalize.c
-@@ -115,8 +115,10 @@ main (int argc, char **argv)
+@@ -115,7 +115,9 @@ main (int argc, char **argv)
  	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
  	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
  	  all_types[i] != GDK_TYPE_X11_DISPLAY_MANAGER &&
 +#ifdef HAVE_OPENGL
  	  all_types[i] != GDK_TYPE_X11_GL_CONTEXT &&
- #endif
 +#endif
+ #endif
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbuf_loader_close() */
  	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
- 	  all_types[i] != GDK_TYPE_DRAWING_CONTEXT &&
 -- 
-2.12.0
+2.14.1
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.17.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.17.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb
index 66a54639df7..02eca3f5cbd 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.17.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
           "
-SRC_URI[md5sum] = "29f85430cf7cfa8ca8d0703ba65dbe11"
-SRC_URI[sha256sum] = "a6c1fb8f229c626a3d9c0e1ce6ea138de7f64a5a6bc799d45fa286fe461c3437"
+SRC_URI[md5sum] = "b782a15b7b5b2005a1ce4647fb002a49"
+SRC_URI[sha256sum] = "cbb16e4cfc928ab8f5f22f7290616f95f6ebc8c97cc724a2007b07ced833592b"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.14.1


