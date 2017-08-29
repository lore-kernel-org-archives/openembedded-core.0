Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 483B378307
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 7EE5C2E2F6;
	Tue, 29 Aug 2017 23:21:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 8iNJdPe-vnK7; Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 565112E324;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41CCC1A0B0;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 369821A0B2;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 2B0FC2198;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLfbu030166;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLf2V030163;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:20:57 +0200
Message-Id: <dd1e476df4b5449c1309330287959e97f50cfbab.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 01/25] gtk+3: Update the patches to work with old versions of patch
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:52 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The patch "0003-Add-disable-opengl-configure-option.patch" used Git
rename syntax, which is not supported by patch 2.6.x and older.

(From OE-Core rev: 43e640ddcf32c718b3e0bb3f3654ed60eb497058)

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gtk+/gtk+3/0001-Hardcoded-libtool.patch        |  12 +-
 ...Do-not-try-to-initialize-GL-without-libGL.patch |   8 +-
 .../0003-Add-disable-opengl-configure-option.patch | 268 +++++++++++++++------
 ...4-configure.ac-Fix-wayland-protocols-path.patch |   8 +-
 4 files changed, 207 insertions(+), 89 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
index 0bda1f1074..c210bbc7d5 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
@@ -1,4 +1,4 @@
-From 5a73a5b92566e314bbc8a1bd40f1ec204837c111 Mon Sep 17 00:00:00 2001
+From 0ecaa5bab162abf0cb2057d77beeb7b89d5873b4 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 14:53:56 +0300
 Subject: [PATCH 1/4] Hardcoded libtool
@@ -12,10 +12,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 23d3077..b6931d6 100644
+index 6628e21..f43ac09 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -610,7 +610,7 @@ AC_MSG_CHECKING([whether to write dependencies into .pc files])
+@@ -617,7 +617,7 @@ AC_MSG_CHECKING([whether to write dependencies into .pc files])
  case $enable_explicit_deps in
    auto)
      export SED
@@ -24,7 +24,7 @@ index 23d3077..b6931d6 100644
      if test "x$deplibs_check_method" != xpass_all || test "x$enable_static" = xyes ; then
        enable_explicit_deps=yes
      else
-@@ -876,7 +876,7 @@ else
+@@ -895,7 +895,7 @@ else
      dnl Now we check to see if our libtool supports shared lib deps
      dnl (in a rather ugly way even)
      if $dynworks; then
@@ -33,7 +33,7 @@ index 23d3077..b6931d6 100644
          module_deplibs_check=`$module_libtool_config | \
              grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
              sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
-@@ -1630,7 +1630,7 @@ AC_SUBST(GTK_PRINT_BACKENDS)
+@@ -1649,7 +1649,7 @@ AC_SUBST(GTK_PRINT_BACKENDS)
  # We are using gmodule-no-export now, but I'm leaving the stripping
  # code in place for now, since pango and atk still require gmodule.
  export SED
@@ -43,5 +43,5 @@ index 23d3077..b6931d6 100644
    GDK_DEP_LIBS=`echo $GDK_DEP_LIBS | sed -e "s/$export_dynamic//"`
    GTK_DEP_LIBS=`echo $GTK_DEP_LIBS | sed -e "s/$export_dynamic//"`
 -- 
-2.1.4
+2.12.0
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
index 989716e513..ab7b659414 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
@@ -1,4 +1,4 @@
-From d63b926f8c8d8b5c9f9ec33d078b775f0409d88a Mon Sep 17 00:00:00 2001
+From 2d2361f24be1e51201063dbbda570debe8702b6f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
 Subject: [PATCH 2/4] Do not try to initialize GL without libGL
@@ -21,10 +21,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index b6931d6..e27da49 100644
+index f43ac09..965eec9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -342,6 +342,13 @@ AC_ARG_ENABLE(mir-backend,
+@@ -346,6 +346,13 @@ AC_ARG_ENABLE(mir-backend,
                                [enable the Mir gdk backend])],
  			      [backend_set=yes])
  
@@ -56,5 +56,5 @@ index 81479d8..3c8c5c0 100644
  
  gint
 -- 
-2.1.4
+2.12.0
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index e6ee21b64f..eaf6aec2aa 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,7 +1,7 @@
-From cdfd6216ac49fc7622d563d671a5b6511492827d Mon Sep 17 00:00:00 2001
+From a2e6b7cbbd6d741fed38d91b3742aa4a08395aba Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
-Subject: [PATCH] Add --disable-opengl configure option
+Subject: [PATCH 3/4] Add --disable-opengl configure option
 
 --disable-opengl will remove the dependency on libepoxy and on the
 OpenGL APIs. This is useful for those who want to keep using gtk+3
@@ -20,32 +20,34 @@ as it actually will depend on OpenGL.
 Upstream-Status: Inappropriate [Evil eye expected from upstream]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- configure.ac                               | 13 +++++--
- demos/gtk-demo/glarea.c                    | 13 +++++++
- docs/tools/Makefile.am                     |  9 +++--
- docs/tools/widgets.c                       |  4 ++-
- gdk/gdkdisplay.c                           |  4 ++-
- gdk/gdkgl.c                                | 10 ++++++
- gdk/gdkglcontext.c                         |  6 ++++
- gdk/gdkwindow.c                            | 13 +++++++
- gdk/x11/Makefile.am                        | 30 +++++++++++++---
- gdk/x11/gdkdisplay-x11.c                   |  6 +++-
- gdk/x11/gdkscreen-x11.c                    |  5 +++
- gdk/x11/gdkwindow-x11.c                    |  4 +++
- gdk/x11/gdkx-autocleanups.h                |  2 ++
- gdk/x11/{gdkx.h => gdkx-with-gl-context.h} |  1 -
- gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++++++++++
- gtk/Makefile.am                            |  3 +-
- gtk/gtkglarea.c                            | 20 ++++++++++-
- gtk/inspector/general.c                    |  6 ++++
- tests/Makefile.am                          | 10 ++++--
- testsuite/gtk/objects-finalize.c           |  2 ++
- 20 files changed, 201 insertions(+), 18 deletions(-)
- rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (98%)
+ configure.ac                      | 13 +++++++--
+ demos/gtk-demo/glarea.c           | 14 +++++++++
+ docs/tools/Makefile.am            |  9 ++++--
+ docs/tools/widgets.c              |  4 ++-
+ gdk/gdkdisplay.c                  |  4 ++-
+ gdk/gdkgl.c                       | 10 +++++++
+ gdk/gdkglcontext.c                |  6 ++++
+ gdk/gdkwindow.c                   | 13 +++++++++
+ gdk/x11/Makefile.am               | 30 +++++++++++++++++---
+ gdk/x11/gdkdisplay-x11.c          |  6 +++-
+ gdk/x11/gdkscreen-x11.c           |  5 ++++
+ gdk/x11/gdkwindow-x11.c           |  4 +++
+ gdk/x11/gdkx-autocleanups.h       |  2 ++
+ gdk/x11/gdkx-with-gl-context.h    | 59 ++++++++++++++++++++++++++++++++++++++
+ gdk/x11/gdkx-without-gl-context.h | 58 +++++++++++++++++++++++++++++++++++++
+ gdk/x11/gdkx.h                    | 60 ---------------------------------------
+ gtk/Makefile.am                   |  3 +-
+ gtk/gtkglarea.c                   | 20 ++++++++++++-
+ gtk/inspector/general.c           |  6 ++++
+ tests/Makefile.am                 | 10 +++++--
+ testsuite/gtk/objects-finalize.c  |  2 ++
+ 21 files changed, 261 insertions(+), 77 deletions(-)
+ create mode 100644 gdk/x11/gdkx-with-gl-context.h
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
+ delete mode 100644 gdk/x11/gdkx.h
 
 diff --git a/configure.ac b/configure.ac
-index 1cfdbc4..2d1a945 100644
+index 965eec9..00bf544 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -346,6 +346,15 @@ AC_ARG_ENABLE(mir-backend,
@@ -83,7 +85,7 @@ index 1cfdbc4..2d1a945 100644
    GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
  fi
 diff --git a/demos/gtk-demo/glarea.c b/demos/gtk-demo/glarea.c
-index 715b067..4a9c7c8 100644
+index b51e4ae..82409c7 100644
 --- a/demos/gtk-demo/glarea.c
 +++ b/demos/gtk-demo/glarea.c
 @@ -3,9 +3,12 @@
@@ -99,7 +101,7 @@ index 715b067..4a9c7c8 100644
  
  static GtkWidget *demo_window = NULL;
  
-@@ -23,6 +25,8 @@ enum {
+@@ -23,6 +26,8 @@ enum {
  /* Rotation angles on each axis */
  static float rotation_angles[N_AXIS] = { 0.0 };
  
@@ -108,7 +110,7 @@ index 715b067..4a9c7c8 100644
  /* The object we are drawing */
  static const GLfloat vertex_data[] = {
    0.f,   0.5f,   0.f, 1.f,
-@@ -215,6 +219,7 @@ compute_mvp (float *res,
+@@ -215,6 +220,7 @@ compute_mvp (float *res,
  static GLuint position_buffer;
  static GLuint program;
  static GLuint mvp_location;
@@ -116,7 +118,7 @@ index 715b067..4a9c7c8 100644
  
  /* We need to set up our state when we realize the GtkGLArea widget */
  static void
-@@ -241,8 +246,10 @@ realize (GtkWidget *widget)
+@@ -241,8 +247,10 @@ realize (GtkWidget *widget)
        fragment_path = "/glarea/glarea-gl.fs.glsl";
      }
  
@@ -127,7 +129,7 @@ index 715b067..4a9c7c8 100644
  }
  
  /* We should tear down the state when unrealizing */
-@@ -254,10 +261,13 @@ unrealize (GtkWidget *widget)
+@@ -254,10 +262,13 @@ unrealize (GtkWidget *widget)
    if (gtk_gl_area_get_error (GTK_GL_AREA (widget)) != NULL)
      return;
  
@@ -141,7 +143,7 @@ index 715b067..4a9c7c8 100644
  static void
  draw_triangle (void)
  {
-@@ -290,6 +300,7 @@ draw_triangle (void)
+@@ -290,6 +301,7 @@ draw_triangle (void)
    glBindBuffer (GL_ARRAY_BUFFER, 0);
    glUseProgram (0);
  }
@@ -149,7 +151,7 @@ index 715b067..4a9c7c8 100644
  
  static gboolean
  render (GtkGLArea    *area,
-@@ -298,6 +309,7 @@ render (GtkGLArea    *area,
+@@ -298,6 +310,7 @@ render (GtkGLArea    *area,
    if (gtk_gl_area_get_error (area) != NULL)
      return FALSE;
  
@@ -157,7 +159,7 @@ index 715b067..4a9c7c8 100644
    /* Clear the viewport */
    glClearColor (0.5, 0.5, 0.5, 1.0);
    glClear (GL_COLOR_BUFFER_BIT);
-@@ -307,6 +319,7 @@ render (GtkGLArea    *area,
+@@ -307,6 +320,7 @@ render (GtkGLArea    *area,
  
    /* Flush the contents of the pipeline */
    glFlush ();
@@ -208,7 +210,7 @@ index 932daf1..54239d6 100644
  
    return info;
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index ed0e65f..1f81b71 100644
+index 6b012ca..311c7f7 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
 @@ -2409,7 +2409,9 @@ gboolean
@@ -223,7 +225,7 @@ index ed0e65f..1f81b71 100644
  
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 51d2b02..efa9e95 100644
+index 8e7b8c2..b579b22 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -22,7 +22,9 @@
@@ -276,7 +278,7 @@ index 51d2b02..efa9e95 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    cairo_matrix_t matrix;
-@@ -706,6 +713,7 @@ out:
+@@ -707,6 +714,7 @@ out:
    if (clip_region)
      cairo_region_destroy (clip_region);
  
@@ -284,7 +286,7 @@ index 51d2b02..efa9e95 100644
  }
  
  /* This is always called with the paint context current */
-@@ -713,6 +721,7 @@ void
+@@ -714,6 +722,7 @@ void
  gdk_gl_texture_from_surface (cairo_surface_t *surface,
  			     cairo_region_t  *region)
  {
@@ -292,14 +294,14 @@ index 51d2b02..efa9e95 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    double device_x_offset, device_y_offset;
-@@ -813,4 +822,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
+@@ -814,4 +823,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
  
    glDisable (GL_SCISSOR_TEST);
    glDeleteTextures (1, &texture_id);
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index bf6e45f..d016e4b 100644
+index c79dca0..8a7bec2 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -312,7 +314,7 @@ index bf6e45f..d016e4b 100644
  
  typedef struct {
    GdkDisplay *display;
-@@ -243,6 +243,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
+@@ -243,6 +245,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
                                 int              height,
                                 guint            texture_target)
  {
@@ -320,7 +322,7 @@ index bf6e45f..d016e4b 100644
    GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
  
    g_return_if_fail (GDK_IS_GL_CONTEXT (context));
-@@ -286,6 +287,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
+@@ -286,6 +289,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
              glTexSubImage2D (texture_target, 0, 0, i, width, 1, GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV, (unsigned char*) data + (i * stride));
          }
      }
@@ -328,7 +330,7 @@ index bf6e45f..d016e4b 100644
  }
  
  static gboolean
-@@ -760,6 +764,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
+@@ -774,6 +778,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
  static void
  gdk_gl_context_check_extensions (GdkGLContext *context)
  {
@@ -336,7 +338,7 @@ index bf6e45f..d016e4b 100644
    GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
    gboolean has_npot, has_texture_rectangle;
  
-@@ -824,6 +829,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
+@@ -847,6 +852,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
                         priv->use_texture_rectangle ? "yes" : "no"));
  
    priv->extensions_checked = TRUE;
@@ -345,7 +347,7 @@ index bf6e45f..d016e4b 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 514732d..0e4fc7e 100644
+index 689d666..fb84256 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -358,7 +360,7 @@ index 514732d..0e4fc7e 100644
  
  /* for the use of round() */
  #include "fallback-c89.c"
-@@ -2801,6 +2803,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
+@@ -2819,6 +2821,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
  {
    GError *internal_error = NULL;
  
@@ -372,7 +374,7 @@ index 514732d..0e4fc7e 100644
    if (_gdk_gl_flags & GDK_GL_DISABLE)
      {
        g_set_error_literal (error, GDK_GL_ERROR,
-@@ -2936,6 +2945,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
+@@ -2954,6 +2963,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
          }
        else
          {
@@ -380,7 +382,7 @@ index 514732d..0e4fc7e 100644
  	  gdk_gl_context_make_current (context);
            /* With gl we always need a surface to combine the gl
               drawing with the native drawing. */
-@@ -2950,6 +2960,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
+@@ -2968,6 +2978,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
            glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
  
            glViewport (0, 0, ww, wh);
@@ -388,7 +390,7 @@ index 514732d..0e4fc7e 100644
          }
      }
  
-@@ -3013,6 +3024,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
+@@ -3031,6 +3042,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
  
            gdk_gl_context_make_current (window->gl_paint_context);
  
@@ -396,7 +398,7 @@ index 514732d..0e4fc7e 100644
            if (!cairo_region_is_empty (opaque_region))
              gdk_gl_texture_from_surface (window->current_paint.surface,
                                           opaque_region);
-@@ -3023,6 +3035,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
+@@ -3041,6 +3053,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
                                             window->current_paint.need_blend_region);
                glDisable(GL_BLEND);
              }
@@ -502,10 +504,10 @@ index ad65e29..91345ee 100644
    display_class->get_default_seat = gdk_x11_display_get_default_seat;
  
 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index 450872d..f8a2f6e 100644
+index 7bf9979..cd1cc9d 100644
 --- a/gdk/x11/gdkscreen-x11.c
 +++ b/gdk/x11/gdkscreen-x11.c
-@@ -1642,3 +1642,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
+@@ -1643,3 +1643,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
  {
    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
  }
@@ -515,7 +517,7 @@ index 450872d..f8a2f6e 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index fe311a7..d16bdfe 100644
+index 3d6fd3b..2bd5c87 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -528,7 +530,7 @@ index fe311a7..d16bdfe 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5781,7 +5783,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5801,7 +5803,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -552,21 +554,71 @@ index edb0ea7..a317d61 100644
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
-diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
-similarity index 98%
-rename from gdk/x11/gdkx.h
-rename to gdk/x11/gdkx-with-gl-context.h
-index 1f64bcc..ae05fa6 100644
---- a/gdk/x11/gdkx.h
+diff --git a/gdk/x11/gdkx-with-gl-context.h b/gdk/x11/gdkx-with-gl-context.h
+new file mode 100644
+index 0000000..ae05fa6
+--- /dev/null
 +++ b/gdk/x11/gdkx-with-gl-context.h
-@@ -45,7 +45,6 @@
- #include <gdk/x11/gdkx11dnd.h>
- #include <gdk/x11/gdkx11glcontext.h>
- #include <gdk/x11/gdkx11keys.h>
--#include <gdk/x11/gdkx11monitor.h>
- #include <gdk/x11/gdkx11property.h>
- #include <gdk/x11/gdkx11screen.h>
- #include <gdk/x11/gdkx11selection.h>
+@@ -0,0 +1,59 @@
++/* GDK - The GIMP Drawing Kit
++ * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library. If not, see <http://www.gnu.org/licenses/>.
++ */
++
++/*
++ * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
++ * file for a list of people on the GTK+ Team.  See the ChangeLog
++ * files for a list of changes.  These files are distributed with
++ * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
++ */
++
++#ifndef __GDK_X_H__
++#define __GDK_X_H__
++
++#include <gdk/gdk.h>
++
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++
++#define __GDKX_H_INSIDE__
++
++#include <gdk/x11/gdkx11applaunchcontext.h>
++#include <gdk/x11/gdkx11cursor.h>
++#include <gdk/x11/gdkx11device.h>
++#include <gdk/x11/gdkx11device-core.h>
++#include <gdk/x11/gdkx11device-xi2.h>
++#include <gdk/x11/gdkx11devicemanager.h>
++#include <gdk/x11/gdkx11devicemanager-core.h>
++#include <gdk/x11/gdkx11devicemanager-xi2.h>
++#include <gdk/x11/gdkx11display.h>
++#include <gdk/x11/gdkx11displaymanager.h>
++#include <gdk/x11/gdkx11dnd.h>
++#include <gdk/x11/gdkx11glcontext.h>
++#include <gdk/x11/gdkx11keys.h>
++#include <gdk/x11/gdkx11property.h>
++#include <gdk/x11/gdkx11screen.h>
++#include <gdk/x11/gdkx11selection.h>
++#include <gdk/x11/gdkx11utils.h>
++#include <gdk/x11/gdkx11visual.h>
++#include <gdk/x11/gdkx11window.h>
++
++#include <gdk/x11/gdkx-autocleanups.h>
++
++#undef __GDKX_H_INSIDE__
++
++#endif /* __GDK_X_H__ */
 diff --git a/gdk/x11/gdkx-without-gl-context.h b/gdk/x11/gdkx-without-gl-context.h
 new file mode 100644
 index 0000000..c9e2617
@@ -631,11 +683,77 @@ index 0000000..c9e2617
 +#undef __GDKX_H_INSIDE__
 +
 +#endif /* __GDK_X_H__ */
+diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
+deleted file mode 100644
+index 1f64bcc..0000000
+--- a/gdk/x11/gdkx.h
++++ /dev/null
+@@ -1,60 +0,0 @@
+-/* GDK - The GIMP Drawing Kit
+- * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
+- *
+- * This library is free software; you can redistribute it and/or
+- * modify it under the terms of the GNU Lesser General Public
+- * License as published by the Free Software Foundation; either
+- * version 2 of the License, or (at your option) any later version.
+- *
+- * This library is distributed in the hope that it will be useful,
+- * but WITHOUT ANY WARRANTY; without even the implied warranty of
+- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * Lesser General Public License for more details.
+- *
+- * You should have received a copy of the GNU Lesser General Public
+- * License along with this library. If not, see <http://www.gnu.org/licenses/>.
+- */
+-
+-/*
+- * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
+- * file for a list of people on the GTK+ Team.  See the ChangeLog
+- * files for a list of changes.  These files are distributed with
+- * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
+- */
+-
+-#ifndef __GDK_X_H__
+-#define __GDK_X_H__
+-
+-#include <gdk/gdk.h>
+-
+-#include <X11/Xlib.h>
+-#include <X11/Xutil.h>
+-
+-#define __GDKX_H_INSIDE__
+-
+-#include <gdk/x11/gdkx11applaunchcontext.h>
+-#include <gdk/x11/gdkx11cursor.h>
+-#include <gdk/x11/gdkx11device.h>
+-#include <gdk/x11/gdkx11device-core.h>
+-#include <gdk/x11/gdkx11device-xi2.h>
+-#include <gdk/x11/gdkx11devicemanager.h>
+-#include <gdk/x11/gdkx11devicemanager-core.h>
+-#include <gdk/x11/gdkx11devicemanager-xi2.h>
+-#include <gdk/x11/gdkx11display.h>
+-#include <gdk/x11/gdkx11displaymanager.h>
+-#include <gdk/x11/gdkx11dnd.h>
+-#include <gdk/x11/gdkx11glcontext.h>
+-#include <gdk/x11/gdkx11keys.h>
+-#include <gdk/x11/gdkx11monitor.h>
+-#include <gdk/x11/gdkx11property.h>
+-#include <gdk/x11/gdkx11screen.h>
+-#include <gdk/x11/gdkx11selection.h>
+-#include <gdk/x11/gdkx11utils.h>
+-#include <gdk/x11/gdkx11visual.h>
+-#include <gdk/x11/gdkx11window.h>
+-
+-#include <gdk/x11/gdkx-autocleanups.h>
+-
+-#undef __GDKX_H_INSIDE__
+-
+-#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 3b76b82..eb4a065 100644
+index 45fb7c2..ce81011 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1378,14 +1378,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
+@@ -1411,14 +1411,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
  	&& cp xgen-gptbc gtkprivatetypebuiltins.c  \
  	&& rm -f xgen-gptbc
  
@@ -748,7 +866,7 @@ index 094378e..f7c7f47 100644
  
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index 31dd6aa..1cedbd3 100644
+index c241ec8..24576dd 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
 @@ -33,8 +33,10 @@
@@ -778,7 +896,7 @@ index 31dd6aa..1cedbd3 100644
  
  #ifdef GDK_WINDOWING_WAYLAND
  static void
-@@ -220,6 +224,7 @@ append_egl_extension_row (GtkInspectorGeneral *gen,
+@@ -254,6 +258,7 @@ wayland_get_display (struct wl_display *wl_display)
  static void
  init_gl (GtkInspectorGeneral *gen)
  {
@@ -786,7 +904,7 @@ index 31dd6aa..1cedbd3 100644
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
      {
-@@ -246,6 +251,7 @@ init_gl (GtkInspectorGeneral *gen)
+@@ -280,6 +285,7 @@ init_gl (GtkInspectorGeneral *gen)
      }
    else
  #endif
@@ -795,7 +913,7 @@ index 31dd6aa..1cedbd3 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 649981f..a0e48a6 100644
+index f86c166..ba1acad 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
@@ -807,7 +925,7 @@ index 649981f..a0e48a6 100644
  	testgrid			\
  	testgtk				\
  	testheaderbar			\
-@@ -169,12 +167,18 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
+@@ -170,12 +168,18 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
  	testactionbar			\
  	testwindowsize			\
  	testpopover			\
@@ -843,5 +961,5 @@ index 0b3a519..07b096f 100644
  	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
  	  all_types[i] != GDK_TYPE_DRAWING_CONTEXT &&
 -- 
-2.1.4
+2.12.0
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
index 634b3a46ff..aca55ceaf4 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
@@ -1,4 +1,4 @@
-From 97b78e566634579bbae51be914aeaaa921137a8b Mon Sep 17 00:00:00 2001
+From 34f4d3928e8206a89b0a601bdf79d6194b3cc77e Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 9 Jun 2016 11:21:36 +0300
 Subject: [PATCH 4/4] configure.ac: Fix wayland-protocols path
@@ -19,10 +19,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index a3e9beb..dde9dc5 100644
+index 00bf544..5515915 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -461,7 +461,7 @@ fi
+@@ -465,7 +465,7 @@ fi
  if test "$enable_wayland_backend" = "yes"; then
    # For the cairo image backend
    cairo_backends="$cairo_backends cairo"
@@ -32,5 +32,5 @@ index a3e9beb..dde9dc5 100644
    GDK_WINDOWING="$GDK_WINDOWING
  #define GDK_WINDOWING_WAYLAND"
 -- 
-2.1.4
+2.12.0
 
-- 
2.12.0


