Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 42A8871D02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Oct 2016 06:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="1050466331"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2016 06:28:16 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 3EDF76A4006;
	Wed, 26 Oct 2016 06:27:41 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:55 +0300
Message-Id: <275ee458391d7c3ab4c20dabf01dd654a3525807.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 14/14] gtk+3: Upgrade 3.20.9 -> 3.22.1
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:19 -0000

Six-monthly feature release.

* Rebase the --disable-opengl patch.
* Remove a backported patch.
* Inherit gettext as that seems to have been missing.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   2 +-
 ...Redo-focus-handling-in-treeview-once-more.patch |  39 ---
 .../0003-Add-disable-opengl-configure-option.patch | 365 ++++++++-------------
 .../gtk+/{gtk+3_3.20.9.bb => gtk+3_3.22.1.bb}      |   5 +-
 4 files changed, 132 insertions(+), 279 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.20.9.bb => gtk+3_3.22.1.bb} (78%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 83e9b92..8a08f2d 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check upstream-version-is-even gobject-introspection
+inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check upstream-version-is-even gobject-introspection
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # This should be in autotools.bbclass, but until something elses uses it putting
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch
deleted file mode 100644
index e819add..0000000
--- a/meta/recipes-gnome/gtk+/gtk+3/0001-Redo-focus-handling-in-treeview-once-more.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Backport [29faa2db]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-
-From 29faa2db44b04b9cf7f4d96e32691f424490c730 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Sun, 11 Sep 2016 11:47:55 -0400
-Subject: [PATCH] Redo focus handling in treeview once more
-
-The fix for bug 767468 had some unintended side-effects. This is
-an attempt at doing the same fix (don't grab focus when we are
-grab-shadowed), while avoiding the breakage, by using GTK+'s
-internal tracking for grab-shadowed-ness.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=770508
----
- gtk/gtktreeview.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/gtk/gtktreeview.c b/gtk/gtktreeview.c
-index a7463cc..73d3557 100644
---- a/gtk/gtktreeview.c
-+++ b/gtk/gtktreeview.c
-@@ -3050,11 +3050,10 @@ static void
- grab_focus_and_unset_draw_keyfocus (GtkTreeView *tree_view)
- {
-   GtkWidget *widget = GTK_WIDGET (tree_view);
--  GtkWidget *grab_widget = gtk_grab_get_current ();
- 
-   if (gtk_widget_get_can_focus (widget) &&
-       !gtk_widget_has_focus (widget) &&
--      (!grab_widget || grab_widget == widget))
-+      !_gtk_widget_get_shadowed (widget))
-     gtk_widget_grab_focus (widget);
- 
-   tree_view->priv->draw_keyfocus = 0;
--- 
-2.9.3
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index 0912c44..e6ee21b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,7 +1,7 @@
-From a8fa547fdc1416b330aced805f5343ad912932ae Mon Sep 17 00:00:00 2001
+From cdfd6216ac49fc7622d563d671a5b6511492827d Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
-Subject: [PATCH 3/4] Add --disable-opengl configure option
+Subject: [PATCH] Add --disable-opengl configure option
 
 --disable-opengl will remove the dependency on libepoxy and on the
 OpenGL APIs. This is useful for those who want to keep using gtk+3
@@ -14,40 +14,41 @@ the very least modified.
 
 The patch is _not_ great from a maintenance point of view and
 modifying the library API is also a fairly nasty thing to do.
-Long-term it would be good to find an alternative solution to this
-(maybe a no-op backend for libepoxy?)
+Next long term release (4.0) will require alternative solutions
+as it actually will depend on OpenGL.
 
 Upstream-Status: Inappropriate [Evil eye expected from upstream]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- configure.ac                      | 13 +++++++++++--
- demos/gtk-demo/glarea.c           | 13 +++++++++++++
- docs/tools/Makefile.am            |  9 +++++++--
- docs/tools/widgets.c              |  4 +++-
- gdk/gdkdisplay.c                  |  4 +++-
- gdk/gdkgl.c                       | 10 ++++++++++
- gdk/gdkglcontext.c                |  6 ++++++
- gdk/gdkwindow.c                   | 13 +++++++++++++
- gdk/x11/Makefile.am               | 30 ++++++++++++++++++++++++++----
- gdk/x11/gdkdisplay-x11.c          |  6 +++++-
- gdk/x11/gdkscreen-x11.c           |  5 +++++
- gdk/x11/gdkwindow-x11.c           |  4 ++++
- gdk/x11/gdkx-autocleanups.h       |  2 ++
- gdk/x11/gdkx-with-gl-context.h    | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- gdk/x11/gdkx-without-gl-context.h | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- gdk/x11/gdkx.h                    | 59 -----------------------------------------------------------
- gtk/Makefile.am                   |  3 +--
- gtk/gtkglarea.c                   | 20 +++++++++++++++++++-
- gtk/inspector/general.c           |  6 ++++++
- tests/Makefile.am                 | 10 +++++++---
- testsuite/gtk/objects-finalize.c  |  2 ++
- 21 files changed, 260 insertions(+), 76 deletions(-)
+ configure.ac                               | 13 +++++--
+ demos/gtk-demo/glarea.c                    | 13 +++++++
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
+ 20 files changed, 201 insertions(+), 18 deletions(-)
+ rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (98%)
+ create mode 100644 gdk/x11/gdkx-without-gl-context.h
 
 diff --git a/configure.ac b/configure.ac
-index a01824e..dde9dc5 100644
+index 1cfdbc4..2d1a945 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -342,6 +342,15 @@ AC_ARG_ENABLE(mir-backend,
+@@ -346,6 +346,15 @@ AC_ARG_ENABLE(mir-backend,
                                [enable the Mir gdk backend])],
  			      [backend_set=yes])
  
@@ -63,7 +64,7 @@ index a01824e..dde9dc5 100644
  AC_ARG_ENABLE(glx,
                [AS_HELP_STRING([--enable-glx],
                                [When enabled Gdk will try to initialize GLX])])
-@@ -1333,7 +1342,7 @@ CFLAGS="$saved_cflags"
+@@ -1352,7 +1361,7 @@ CFLAGS="$saved_cflags"
  LDFLAGS="$saved_ldflags"
  
  GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
@@ -72,7 +73,7 @@ index a01824e..dde9dc5 100644
  
  PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
  GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
-@@ -1367,7 +1376,7 @@ fi
+@@ -1386,7 +1395,7 @@ fi
  PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
  
  GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
@@ -82,11 +83,14 @@ index a01824e..dde9dc5 100644
    GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
  fi
 diff --git a/demos/gtk-demo/glarea.c b/demos/gtk-demo/glarea.c
-index 3aba729..c6c79f7 100644
+index 715b067..4a9c7c8 100644
 --- a/demos/gtk-demo/glarea.c
 +++ b/demos/gtk-demo/glarea.c
-@@ -5,7 +5,9 @@
+@@ -3,9 +3,12 @@
+  * GtkGLArea is a widget that allows custom drawing using OpenGL calls.
+  */
  
++#include "config.h"
  #include <math.h>
  #include <gtk/gtk.h>
 +#if HAVE_OPENGL
@@ -104,7 +108,7 @@ index 3aba729..c6c79f7 100644
  /* The object we are drawing */
  static const GLfloat vertex_data[] = {
    0.f,   0.5f,   0.f, 1.f,
-@@ -213,6 +217,7 @@ compute_mvp (float *res,
+@@ -215,6 +219,7 @@ compute_mvp (float *res,
  static GLuint position_buffer;
  static GLuint program;
  static GLuint mvp_location;
@@ -112,18 +116,18 @@ index 3aba729..c6c79f7 100644
  
  /* We need to set up our state when we realize the GtkGLArea widget */
  static void
-@@ -223,8 +228,10 @@ realize (GtkWidget *widget)
-   if (gtk_gl_area_get_error (GTK_GL_AREA (widget)) != NULL)
-     return;
+@@ -241,8 +246,10 @@ realize (GtkWidget *widget)
+       fragment_path = "/glarea/glarea-gl.fs.glsl";
+     }
  
 +#ifdef HAVE_OPENGL
    init_buffers (&position_buffer, NULL);
-   init_shaders (&program, &mvp_location);
+   init_shaders (vertex_path, fragment_path, &program, &mvp_location);
 +#endif
  }
  
  /* We should tear down the state when unrealizing */
-@@ -236,10 +243,13 @@ unrealize (GtkWidget *widget)
+@@ -254,10 +261,13 @@ unrealize (GtkWidget *widget)
    if (gtk_gl_area_get_error (GTK_GL_AREA (widget)) != NULL)
      return;
  
@@ -137,7 +141,7 @@ index 3aba729..c6c79f7 100644
  static void
  draw_triangle (void)
  {
-@@ -272,6 +282,7 @@ draw_triangle (void)
+@@ -290,6 +300,7 @@ draw_triangle (void)
    glBindBuffer (GL_ARRAY_BUFFER, 0);
    glUseProgram (0);
  }
@@ -145,7 +149,7 @@ index 3aba729..c6c79f7 100644
  
  static gboolean
  render (GtkGLArea    *area,
-@@ -280,6 +291,7 @@ render (GtkGLArea    *area,
+@@ -298,6 +309,7 @@ render (GtkGLArea    *area,
    if (gtk_gl_area_get_error (area) != NULL)
      return FALSE;
  
@@ -153,7 +157,7 @@ index 3aba729..c6c79f7 100644
    /* Clear the viewport */
    glClearColor (0.5, 0.5, 0.5, 1.0);
    glClear (GL_COLOR_BUFFER_BIT);
-@@ -289,6 +301,7 @@ render (GtkGLArea    *area,
+@@ -307,6 +319,7 @@ render (GtkGLArea    *area,
  
    /* Flush the contents of the pipeline */
    glFlush ();
@@ -204,10 +208,10 @@ index 932daf1..54239d6 100644
  
    return info;
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 6150ef7..2223629 100644
+index ed0e65f..1f81b71 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
-@@ -2360,7 +2360,9 @@ gboolean
+@@ -2409,7 +2409,9 @@ gboolean
  gdk_display_make_gl_context_current (GdkDisplay   *display,
                                       GdkGLContext *context)
  {
@@ -219,7 +223,7 @@ index 6150ef7..2223629 100644
  
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index e8ba770..ba7c84b 100644
+index 51d2b02..efa9e95 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -22,7 +22,9 @@
@@ -240,7 +244,7 @@ index e8ba770..ba7c84b 100644
  static const char *
  get_vertex_type_name (int type)
  {
-@@ -254,6 +257,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint_data)
+@@ -208,6 +211,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint_data)
        glUseProgram (paint_data->current_program->program);
      }
  }
@@ -248,15 +252,15 @@ index e8ba770..ba7c84b 100644
  
  void
  gdk_gl_texture_quads (GdkGLContext *paint_context,
-@@ -261,6 +265,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
-                       int n_quads,
-                       GdkTexturedQuad *quads)
+@@ -216,6 +220,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+                       GdkTexturedQuad *quads,
+                       gboolean flip_colors)
  {
 +#ifdef HAVE_OPENGL
    GdkGLContextPaintData *paint_data  = gdk_gl_context_get_paint_data (paint_context);
    GdkGLContextProgram *program;
    GdkWindow *window = gdk_gl_context_get_window (paint_context);
-@@ -324,6 +329,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+@@ -289,6 +294,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
  
    glDisableVertexAttribArray (program->position_location);
    glDisableVertexAttribArray (program->uv_location);
@@ -264,7 +268,7 @@ index e8ba770..ba7c84b 100644
  }
  
  /* x,y,width,height describes a rectangle in the gl render buffer
-@@ -372,6 +378,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
+@@ -337,6 +343,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
                          int                   width,
                          int                   height)
  {
@@ -272,7 +276,7 @@ index e8ba770..ba7c84b 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    cairo_matrix_t matrix;
-@@ -692,6 +699,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
+@@ -706,6 +713,7 @@ out:
    if (clip_region)
      cairo_region_destroy (clip_region);
  
@@ -280,7 +284,7 @@ index e8ba770..ba7c84b 100644
  }
  
  /* This is always called with the paint context current */
-@@ -699,6 +707,7 @@ void
+@@ -713,6 +721,7 @@ void
  gdk_gl_texture_from_surface (cairo_surface_t *surface,
  			     cairo_region_t  *region)
  {
@@ -288,14 +292,14 @@ index e8ba770..ba7c84b 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    double device_x_offset, device_y_offset;
-@@ -799,4 +808,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
+@@ -813,4 +822,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
  
    glDisable (GL_SCISSOR_TEST);
    glDeleteTextures (1, &texture_id);
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index 00a33eb..bd8a793 100644
+index bf6e45f..d016e4b 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -308,23 +312,23 @@ index 00a33eb..bd8a793 100644
  
  typedef struct {
    GdkDisplay *display;
-@@ -239,6 +241,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
+@@ -243,6 +243,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
                                 int              height,
                                 guint            texture_target)
  {
 +#ifdef HAVE_OPENGL
-   g_return_if_fail (GDK_IS_GL_CONTEXT (context));
+   GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
  
-   glPixelStorei (GL_UNPACK_ALIGNMENT, 4);
-@@ -246,6 +249,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
-   glTexImage2D (texture_target, 0, GL_RGBA, width, height, 0, GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV,
-                 cairo_image_surface_get_data (image_surface));
-   glPixelStorei (GL_UNPACK_ROW_LENGTH, 0);
+   g_return_if_fail (GDK_IS_GL_CONTEXT (context));
+@@ -286,6 +287,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
+             glTexSubImage2D (texture_target, 0, 0, i, width, 1, GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV, (unsigned char*) data + (i * stride));
+         }
+     }
 +#endif
  }
  
- static void
-@@ -635,6 +639,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
+ static gboolean
+@@ -760,6 +764,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
  static void
  gdk_gl_context_check_extensions (GdkGLContext *context)
  {
@@ -332,7 +336,7 @@ index 00a33eb..bd8a793 100644
    GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
    gboolean has_npot, has_texture_rectangle;
  
-@@ -677,6 +682,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
+@@ -824,6 +829,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
                         priv->use_texture_rectangle ? "yes" : "no"));
  
    priv->extensions_checked = TRUE;
@@ -341,10 +345,10 @@ index 00a33eb..bd8a793 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 66ebb9d..74a0c3a 100644
+index 514732d..0e4fc7e 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
-@@ -44,7 +44,9 @@
+@@ -45,7 +45,9 @@
  
  #include <math.h>
  
@@ -354,7 +358,7 @@ index 66ebb9d..74a0c3a 100644
  
  /* for the use of round() */
  #include "fallback-c89.c"
-@@ -2759,6 +2761,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
+@@ -2801,6 +2803,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
  {
    GError *internal_error = NULL;
  
@@ -368,7 +372,7 @@ index 66ebb9d..74a0c3a 100644
    if (_gdk_gl_flags & GDK_GL_DISABLE)
      {
        g_set_error_literal (error, GDK_GL_ERROR,
-@@ -2955,6 +2964,7 @@ gdk_window_begin_paint_region (GdkWindow       *window,
+@@ -2936,6 +2945,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
          }
        else
          {
@@ -376,7 +380,7 @@ index 66ebb9d..74a0c3a 100644
  	  gdk_gl_context_make_current (context);
            /* With gl we always need a surface to combine the gl
               drawing with the native drawing. */
-@@ -2969,6 +2979,7 @@ gdk_window_begin_paint_region (GdkWindow       *window,
+@@ -2950,6 +2960,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
            glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
  
            glViewport (0, 0, ww, wh);
@@ -384,7 +388,7 @@ index 66ebb9d..74a0c3a 100644
          }
      }
  
-@@ -3117,6 +3128,7 @@ gdk_window_end_paint (GdkWindow *window)
+@@ -3013,6 +3024,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
  
            gdk_gl_context_make_current (window->gl_paint_context);
  
@@ -392,7 +396,7 @@ index 66ebb9d..74a0c3a 100644
            if (!cairo_region_is_empty (opaque_region))
              gdk_gl_texture_from_surface (window->current_paint.surface,
                                           opaque_region);
-@@ -3127,6 +3139,7 @@ gdk_window_end_paint (GdkWindow *window)
+@@ -3023,6 +3035,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
                                             window->current_paint.need_blend_region);
                glDisable(GL_BLEND);
              }
@@ -401,10 +405,10 @@ index 66ebb9d..74a0c3a 100644
            cairo_region_destroy (opaque_region);
  
 diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
-index c488a31..4ce3c07 100644
+index 6289f3a..cbbac79 100644
 --- a/gdk/x11/Makefile.am
 +++ b/gdk/x11/Makefile.am
-@@ -39,8 +39,6 @@ libgdk_x11_la_SOURCES = 	\
+@@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES = 	\
  	gdkeventtranslator.c	\
  	gdkeventtranslator.h	\
  	gdkgeometry-x11.c  	\
@@ -412,8 +416,8 @@ index c488a31..4ce3c07 100644
 -	gdkglcontext-x11.h	\
  	gdkkeys-x11.c		\
  	gdkmain-x11.c		\
- 	gdkproperty-x11.c	\
-@@ -53,14 +51,32 @@ libgdk_x11_la_SOURCES = 	\
+ 	gdkmonitor-x11.c	\
+@@ -56,14 +54,32 @@ libgdk_x11_la_SOURCES = 	\
  	gdkwindow-x11.h		\
  	gdkxftdefaults.c	\
  	gdkxid.c		\
@@ -447,15 +451,15 @@ index c488a31..4ce3c07 100644
  libgdkx11include_HEADERS = 	\
  	gdkx-autocleanups.h	\
  	gdkx11applaunchcontext.h \
-@@ -74,7 +90,6 @@ libgdkx11include_HEADERS = 	\
+@@ -77,7 +93,6 @@ libgdkx11include_HEADERS = 	\
  	gdkx11display.h		\
  	gdkx11displaymanager.h	\
  	gdkx11dnd.h		\
 -	gdkx11glcontext.h	\
  	gdkx11keys.h		\
+ 	gdkx11monitor.h		\
  	gdkx11property.h	\
- 	gdkx11screen.h		\
-@@ -83,9 +98,16 @@ libgdkx11include_HEADERS = 	\
+@@ -87,9 +102,16 @@ libgdkx11include_HEADERS = 	\
  	gdkx11visual.h		\
  	gdkx11window.h
  
@@ -473,7 +477,7 @@ index c488a31..4ce3c07 100644
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index de91c64..42d50f6 100644
+index ad65e29..91345ee 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -486,7 +490,7 @@ index de91c64..42d50f6 100644
  #include "gdk-private.h"
  
  #include <glib.h>
-@@ -2959,7 +2961,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
+@@ -2994,7 +2996,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
    display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
    display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
  
@@ -498,10 +502,10 @@ index de91c64..42d50f6 100644
    display_class->get_default_seat = gdk_x11_display_get_default_seat;
  
 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index 9d8ed20..bd46b00 100644
+index 450872d..f8a2f6e 100644
 --- a/gdk/x11/gdkscreen-x11.c
 +++ b/gdk/x11/gdkscreen-x11.c
-@@ -1968,3 +1968,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
+@@ -1642,3 +1642,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
  {
    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
  }
@@ -511,7 +515,7 @@ index 9d8ed20..bd46b00 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 9ed087a..30d6eb7 100644
+index fe311a7..d16bdfe 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -524,7 +528,7 @@ index 9ed087a..30d6eb7 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5782,7 +5784,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5781,7 +5783,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -548,71 +552,21 @@ index edb0ea7..a317d61 100644
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
@@ -677,76 +631,11 @@ index 0000000..c9e2617
 +#undef __GDKX_H_INSIDE__
 +
 +#endif /* __GDK_X_H__ */
-diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
-deleted file mode 100644
-index ae05fa6..0000000
---- a/gdk/x11/gdkx.h
-+++ /dev/null
-@@ -1,59 +0,0 @@
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
-index 6a53a2b..49a35e6 100644
+index 3b76b82..eb4a065 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1351,14 +1351,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
+@@ -1378,14 +1378,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
  	&& cp xgen-gptbc gtkprivatetypebuiltins.c  \
  	&& rm -f xgen-gptbc
  
@@ -763,7 +652,7 @@ index 6a53a2b..49a35e6 100644
  gtktestutils.c: gtktypefuncs.c
  
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 245fc6b..4214ad1 100644
+index 094378e..f7c7f47 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -28,7 +28,9 @@
@@ -776,7 +665,7 @@ index 245fc6b..4214ad1 100644
  
  /**
   * SECTION:gtkglarea
-@@ -357,9 +359,12 @@ gtk_gl_area_real_create_context (GtkGLArea *area)
+@@ -368,9 +370,12 @@ gtk_gl_area_real_create_context (GtkGLArea *area)
  static void
  gtk_gl_area_resize (GtkGLArea *area, int width, int height)
  {
@@ -789,7 +678,7 @@ index 245fc6b..4214ad1 100644
  /*
   * Creates all the buffer objects needed for rendering the scene
   */
-@@ -467,6 +472,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
+@@ -482,6 +487,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
  
    priv->needs_render = TRUE;
  }
@@ -797,7 +686,7 @@ index 245fc6b..4214ad1 100644
  
  /**
   * gtk_gl_area_attach_buffers:
-@@ -485,6 +491,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
+@@ -500,6 +506,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
  void
  gtk_gl_area_attach_buffers (GtkGLArea *area)
  {
@@ -805,7 +694,7 @@ index 245fc6b..4214ad1 100644
    GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
  
    g_return_if_fail (GTK_IS_GL_AREA (area));
-@@ -517,11 +524,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
+@@ -532,11 +539,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
          glFramebufferRenderbufferEXT (GL_FRAMEBUFFER_EXT, GL_STENCIL_ATTACHMENT_EXT,
                                        GL_RENDERBUFFER_EXT, priv->depth_stencil_buffer);
      }
@@ -819,7 +708,7 @@ index 245fc6b..4214ad1 100644
    GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
  
    if (priv->context == NULL)
-@@ -553,6 +562,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
+@@ -568,6 +577,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
        glDeleteFramebuffersEXT (1, &priv->frame_buffer);
        priv->frame_buffer = 0;
      }
@@ -827,7 +716,7 @@ index 245fc6b..4214ad1 100644
  }
  
  static void
-@@ -663,6 +673,7 @@ gtk_gl_area_draw (GtkWidget *widget,
+@@ -678,6 +688,7 @@ gtk_gl_area_draw (GtkWidget *widget,
    GtkGLArea *area = GTK_GL_AREA (widget);
    GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
    gboolean unused;
@@ -835,7 +724,7 @@ index 245fc6b..4214ad1 100644
    int w, h, scale;
    GLenum status;
  
-@@ -674,7 +685,6 @@ gtk_gl_area_draw (GtkWidget *widget,
+@@ -689,7 +700,6 @@ gtk_gl_area_draw (GtkWidget *widget,
                                       gtk_widget_get_allocated_height (widget));
        return FALSE;
      }
@@ -843,7 +732,7 @@ index 245fc6b..4214ad1 100644
    if (priv->context == NULL)
      return FALSE;
  
-@@ -720,6 +730,14 @@ gtk_gl_area_draw (GtkWidget *widget,
+@@ -735,6 +745,14 @@ gtk_gl_area_draw (GtkWidget *widget,
      }
  
    return TRUE;
@@ -859,7 +748,7 @@ index 245fc6b..4214ad1 100644
  
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index 4eab3a7..c4e900e 100644
+index 31dd6aa..1cedbd3 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
 @@ -33,8 +33,10 @@
@@ -873,7 +762,7 @@ index 4eab3a7..c4e900e 100644
  
  #ifdef GDK_WINDOWING_WIN32
  #include "win32/gdkwin32.h"
-@@ -147,6 +149,7 @@ append_extension_row (GtkInspectorGeneral *gen,
+@@ -196,6 +198,7 @@ add_label_row (GtkInspectorGeneral *gen,
    gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
  }
  
@@ -881,15 +770,15 @@ index 4eab3a7..c4e900e 100644
  #ifdef GDK_WINDOWING_X11
  static void
  append_glx_extension_row (GtkInspectorGeneral *gen,
-@@ -156,6 +159,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
-   append_extension_row (gen, ext, epoxy_has_glx_extension (dpy, 0, ext));
+@@ -205,6 +208,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
+   add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_glx_extension (dpy, 0, ext), 0);
  }
  #endif
 +#endif
  
  #ifdef GDK_WINDOWING_WAYLAND
  static void
-@@ -171,6 +175,7 @@ append_egl_extension_row (GtkInspectorGeneral *gen,
+@@ -220,6 +224,7 @@ append_egl_extension_row (GtkInspectorGeneral *gen,
  static void
  init_gl (GtkInspectorGeneral *gen)
  {
@@ -897,7 +786,7 @@ index 4eab3a7..c4e900e 100644
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
      {
-@@ -197,6 +202,7 @@ init_gl (GtkInspectorGeneral *gen)
+@@ -246,6 +251,7 @@ init_gl (GtkInspectorGeneral *gen)
      }
    else
  #endif
@@ -906,7 +795,7 @@ index 4eab3a7..c4e900e 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 681807d..2941a36 100644
+index 649981f..a0e48a6 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
@@ -918,19 +807,20 @@ index 681807d..2941a36 100644
  	testgrid			\
  	testgtk				\
  	testheaderbar			\
-@@ -169,11 +167,17 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
+@@ -169,12 +167,18 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
  	testactionbar			\
  	testwindowsize			\
  	testpopover			\
 -	gdkgears			\
  	listmodel			\
  	testpopup			\
+ 	testpopupat			\
  	$(NULL)
  
 +if HAVE_OPENGL
 +noinst_PROGRAMS +=
-+	testglarea                      \
-+	testglblending                  \
++	testglarea			\
++	testglblending			\
 +	gdkgears
 +endif
 +
@@ -938,7 +828,7 @@ index 681807d..2941a36 100644
  noinst_PROGRAMS += testerrors
  endif
 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-finalize.c
-index e0ebee0..703643c 100644
+index 0b3a519..07b096f 100644
 --- a/testsuite/gtk/objects-finalize.c
 +++ b/testsuite/gtk/objects-finalize.c
 @@ -115,8 +115,10 @@ main (int argc, char **argv)
@@ -951,4 +841,7 @@ index e0ebee0..703643c 100644
 +#endif
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbuf_loader_close() */
  	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
- 	  all_types[i] != gdk_pixbuf_simple_anim_iter_get_type())
+ 	  all_types[i] != GDK_TYPE_DRAWING_CONTEXT &&
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.1.bb
similarity index 78%
rename from meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.1.bb
index 38e095a..5fb0edd 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.20.9.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.1.bb
@@ -7,10 +7,9 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://0004-configure.ac-Fix-wayland-protocols-path.patch \
-           file://0001-Redo-focus-handling-in-treeview-once-more.patch \
           "
-SRC_URI[md5sum] = "cc76cac5e18c772c6784bf19a3dff08b"
-SRC_URI[sha256sum] = "83a609ba2f3424b5509e73967c49c67833af466d6f91081b24ee5c64fce6ac17"
+SRC_URI[md5sum] = "ebfa5e52167f2b8a4ec6024d51d86f1f"
+SRC_URI[sha256sum] = "127c8c5cfc32681f9ab3cb542eb0d5c16c1c02faba68bf8fcac9a3cf278ef471"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.1.4


