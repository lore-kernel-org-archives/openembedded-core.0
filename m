Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8FAC3DA70
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 13:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18557.1721395530425841378
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 06:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67FD71042
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A42873F762
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] gtk+3: upgrade 3.24.42 -> 3.24.43
Date: Fri, 19 Jul 2024 14:25:21 +0100
Message-Id: <20240719132523.976790-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719132523.976790-1-ross.burton@arm.com>
References: <20240719132523.976790-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 13:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202262

* Stop looking for modules in cwd (CVE-2024-6655)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 97 +++++++++----------
 .../{gtk+3_3.24.42.bb =3D> gtk+3_3.24.43.bb}    |  2 +-
 2 files changed, 48 insertions(+), 51 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.42.bb =3D> gtk+3_3.24.43.bb} =
(87%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gn=
ome/gtk+/gtk+3/opengl.patch
index 8f2feb0ee75..d846045c248 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -1,4 +1,4 @@
-From 4a0716f04fb25b51b08e994bd5a900b2e7f7fed5 Mon Sep 17 00:00:00 2001
+From 24a0d767251b81810767e03aa1db8cc497408db3 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
 Subject: [PATCH] Do not try to initialize GL without libGL
@@ -21,7 +21,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com=
>
  docs/tools/widgets.c             |  6 +++++-
  gdk/gdkconfig.h.meson            |  1 +
  gdk/gdkdisplay.c                 |  4 ++++
- gdk/gdkgl.c                      | 10 ++++++++++
+ gdk/gdkgl.c                      | 11 ++++++++++-
  gdk/gdkglcontext.c               |  6 ++++++
  gdk/gdkwindow.c                  | 13 +++++++++++++
  gdk/meson.build                  |  8 +++++++-
@@ -37,10 +37,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.c=
om>
  meson_options.txt                |  2 ++
  tests/meson.build                |  9 +++++++--
  testsuite/gtk/objects-finalize.c |  2 ++
- 21 files changed, 128 insertions(+), 13 deletions(-)
+ 21 files changed, 128 insertions(+), 14 deletions(-)
=20
 diff --git a/demos/gtk-demo/meson.build b/demos/gtk-demo/meson.build
-index 252da16d05..4b57cff6ac 100644
+index 252da16..4b57cff 100644
 --- a/demos/gtk-demo/meson.build
 +++ b/demos/gtk-demo/meson.build
 @@ -28,7 +28,6 @@ demos =3D files([
@@ -63,7 +63,7 @@ index 252da16d05..4b57cff6ac 100644
    demos +=3D files('pagesetup.c')
  endif
 diff --git a/docs/tools/meson.build b/docs/tools/meson.build
-index 05621ee7ed..3d0a333b32 100644
+index 05621ee..3d0a333 100644
 --- a/docs/tools/meson.build
 +++ b/docs/tools/meson.build
 @@ -2,10 +2,13 @@ if x11_enabled
@@ -83,7 +83,7 @@ index 05621ee7ed..3d0a333b32 100644
                             include_directories: [ confinc, gdkinc, gtki=
nc, testinc, ],
                             dependencies: libgtk_dep)
 diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
-index 932daf1746..348807e133 100644
+index 932daf1..348807e 100644
 --- a/docs/tools/widgets.c
 +++ b/docs/tools/widgets.c
 @@ -8,7 +8,9 @@
@@ -110,7 +110,7 @@ index 932daf1746..348807e133 100644
 =20
    return info;
 diff --git a/gdk/gdkconfig.h.meson b/gdk/gdkconfig.h.meson
-index 7db19e0470..088651bafa 100644
+index 7db19e0..088651b 100644
 --- a/gdk/gdkconfig.h.meson
 +++ b/gdk/gdkconfig.h.meson
 @@ -15,6 +15,7 @@ G_BEGIN_DECLS
@@ -122,7 +122,7 @@ index 7db19e0470..088651bafa 100644
  G_END_DECLS
 =20
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 748f54860c..04ef2c09d4 100644
+index fd5e9ea..87b45e7 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
 @@ -2420,7 +2420,11 @@ gboolean
@@ -138,7 +138,7 @@ index 748f54860c..04ef2c09d4 100644
 =20
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 9690077cc2..55f85ef605 100644
+index 0940c06..4b56614 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -21,8 +21,9 @@
@@ -152,7 +152,7 @@ index 9690077cc2..55f85ef605 100644
  #include <math.h>
  #include <string.h>
 =20
-@@ -36,6 +37,7 @@
+@@ -36,6 +37,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *sur=
face,
                                 g_object_ref (window),  g_object_unref);
  }
 =20
@@ -160,7 +160,7 @@ index 9690077cc2..55f85ef605 100644
  static const char *
  get_vertex_type_name (int type)
  {
-@@ -208,6 +210,7 @@
+@@ -208,6 +210,7 @@ use_texture_rect_program (GdkGLContextPaintData *pai=
nt_data)
        glUseProgram (paint_data->current_program->program);
      }
  }
@@ -168,7 +168,7 @@ index 9690077cc2..55f85ef605 100644
 =20
  void
  gdk_gl_texture_quads (GdkGLContext *paint_context,
-@@ -216,6 +219,7 @@
+@@ -216,6 +219,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
                        GdkTexturedQuad *quads,
                        gboolean flip_colors)
  {
@@ -176,7 +176,7 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContextPaintData *paint_data  =3D gdk_gl_context_get_paint_data =
(paint_context);
    GdkGLContextProgram *program;
    GdkWindow *window =3D gdk_gl_context_get_window (paint_context);
-@@ -289,6 +293,7 @@
+@@ -289,6 +293,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
 =20
    glDisableVertexAttribArray (program->position_location);
    glDisableVertexAttribArray (program->uv_location);
@@ -184,7 +184,7 @@ index 9690077cc2..55f85ef605 100644
  }
 =20
  /* x,y,width,height describes a rectangle in the gl render buffer
-@@ -337,6 +342,7 @@
+@@ -337,6 +342,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
                          int                   width,
                          int                   height)
  {
@@ -192,7 +192,7 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContext *paint_context, *current_context;
    cairo_surface_t *image;
    cairo_matrix_t matrix;
-@@ -703,6 +709,7 @@
+@@ -727,6 +733,7 @@ out:
    if (clip_region)
      cairo_region_destroy (clip_region);
 =20
@@ -200,7 +200,7 @@ index 9690077cc2..55f85ef605 100644
  }
 =20
  /* This is always called with the paint context current */
-@@ -710,6 +717,7 @@
+@@ -734,6 +741,7 @@ void
  gdk_gl_texture_from_surface (cairo_surface_t *surface,
  			     cairo_region_t  *region)
  {
@@ -208,14 +208,14 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    double device_x_offset, device_y_offset;
-@@ -810,4 +818,5 @@
+@@ -834,4 +842,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surfac=
e,
 =20
    glDisable (GL_SCISSOR_TEST);
    glDeleteTextures (1, &texture_id);
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index 3b23639e1c..1f04f8e0b2 100644
+index cb0ed90..7ed74f3 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -228,7 +228,7 @@ index 3b23639e1c..1f04f8e0b2 100644
 =20
  typedef struct {
    GdkDisplay *display;
-@@ -243,6 +245,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *cont=
ext,
+@@ -246,6 +248,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *cont=
ext,
                                 int              height,
                                 guint            texture_target)
  {
@@ -236,7 +236,7 @@ index 3b23639e1c..1f04f8e0b2 100644
    GdkGLContextPrivate *priv =3D gdk_gl_context_get_instance_private (co=
ntext);
 =20
    g_return_if_fail (GDK_IS_GL_CONTEXT (context));
-@@ -286,6 +289,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *cont=
ext,
+@@ -289,6 +292,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *cont=
ext,
              glTexSubImage2D (texture_target, 0, 0, i, width, 1, GL_BGRA=
, GL_UNSIGNED_INT_8_8_8_8_REV, (unsigned char*) data + (i * stride));
          }
      }
@@ -244,7 +244,7 @@ index 3b23639e1c..1f04f8e0b2 100644
  }
 =20
  static gboolean
-@@ -774,6 +778,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
+@@ -801,6 +805,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
  static void
  gdk_gl_context_check_extensions (GdkGLContext *context)
  {
@@ -252,7 +252,7 @@ index 3b23639e1c..1f04f8e0b2 100644
    GdkGLContextPrivate *priv =3D gdk_gl_context_get_instance_private (co=
ntext);
    gboolean has_npot, has_texture_rectangle;
 =20
-@@ -853,6 +858,7 @@ gdk_gl_context_check_extensions (GdkGLContext *conte=
xt)
+@@ -888,6 +893,7 @@ gdk_gl_context_check_extensions (GdkGLContext *conte=
xt)
                         priv->use_texture_rectangle ? "yes" : "no"));
 =20
    priv->extensions_checked =3D TRUE;
@@ -261,7 +261,7 @@ index 3b23639e1c..1f04f8e0b2 100644
 =20
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 727b0cf1f4..d4d91b0d16 100644
+index 62e0cf8..b8bda71 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -321,7 +321,7 @@ index 727b0cf1f4..d4d91b0d16 100644
            cairo_region_destroy (opaque_region);
 =20
 diff --git a/gdk/meson.build b/gdk/meson.build
-index 4bb1bf2b6c..64172b8d3e 100644
+index 297c38c..fc71f8f 100644
 --- a/gdk/meson.build
 +++ b/gdk/meson.build
 @@ -56,7 +56,6 @@ gdk_gir_public_headers =3D files(
@@ -354,7 +354,7 @@ index 4bb1bf2b6c..64172b8d3e 100644
  gdkconfig =3D configure_file(
    input  : 'gdkconfig.h.meson',
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 7e08f472cc..30fd7b6089 100644
+index 7e08f47..30fd7b6 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -379,7 +379,7 @@ index 7e08f472cc..30fd7b6089 100644
    display_class->get_default_seat =3D gdk_x11_display_get_default_seat;
 =20
 diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
-index 81479d81f4..3c8c5c02ff 100644
+index 81479d8..3c8c5c0 100644
 --- a/gdk/x11/gdkvisual-x11.c
 +++ b/gdk/x11/gdkvisual-x11.c
 @@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
@@ -396,7 +396,7 @@ index 81479d81f4..3c8c5c02ff 100644
 =20
  gint
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 194bc82e29..0302bb68d4 100644
+index 89f0666..d3e1440 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -409,7 +409,7 @@ index 194bc82e29..0302bb68d4 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
 =20
-@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Cl=
ass *klass)
+@@ -5906,7 +5908,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Cl=
ass *klass)
    impl_class->set_opaque_region =3D gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width =3D gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu =3D gdk_x11_window_show_window_menu;
@@ -420,7 +420,7 @@ index 194bc82e29..0302bb68d4 100644
    impl_class->get_unscaled_size =3D gdk_x11_window_get_unscaled_size;
  }
 diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
-index edb0ea7dbf..a317d61cca 100644
+index edb0ea7..a317d61 100644
 --- a/gdk/x11/gdkx-autocleanups.h
 +++ b/gdk/x11/gdkx-autocleanups.h
 @@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_objec=
t_unref)
@@ -434,7 +434,7 @@ index edb0ea7dbf..a317d61cca 100644
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
 diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
-index 1f64bccb6d..4db6c18351 100644
+index 1f64bcc..4db6c18 100644
 --- a/gdk/x11/gdkx.h
 +++ b/gdk/x11/gdkx.h
 @@ -43,7 +43,9 @@
@@ -448,7 +448,7 @@ index 1f64bccb6d..4db6c18351 100644
  #include <gdk/x11/gdkx11monitor.h>
  #include <gdk/x11/gdkx11property.h>
 diff --git a/gdk/x11/meson.build b/gdk/x11/meson.build
-index 754ae0a615..0318c83877 100644
+index 754ae0a..0318c83 100644
 --- a/gdk/x11/meson.build
 +++ b/gdk/x11/meson.build
 @@ -14,7 +14,6 @@ gdk_x11_sources =3D files(
@@ -480,7 +480,7 @@ index 754ae0a615..0318c83877 100644
  install_headers('gdkx.h', subdir: 'gtk-3.0/gdk/')
 =20
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 802303ea9f..6439d7745d 100644
+index 802303e..6439d77 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -29,7 +29,9 @@
@@ -568,10 +568,10 @@ index 802303ea9f..6439d7745d 100644
 =20
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index 4fd0c3039c..a8e59ed077 100644
+index a3a3419..274600e 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
-@@ -33,8 +33,10 @@
+@@ -35,8 +35,10 @@
 =20
  #ifdef GDK_WINDOWING_X11
  #include "x11/gdkx.h"
@@ -582,7 +582,7 @@ index 4fd0c3039c..a8e59ed077 100644
 =20
  #ifdef GDK_WINDOWING_WIN32
  #include "win32/gdkwin32.h"
-@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
+@@ -221,6 +223,7 @@ add_label_row (GtkInspectorGeneral *gen,
    gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label)=
;
  }
 =20
@@ -590,7 +590,7 @@ index 4fd0c3039c..a8e59ed077 100644
  #ifdef GDK_WINDOWING_X11
  static void
  append_glx_extension_row (GtkInspectorGeneral *gen,
-@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
+@@ -230,6 +233,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
    add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_=
glx_extension (dpy, 0, ext), 0);
  }
  #endif
@@ -598,7 +598,7 @@ index 4fd0c3039c..a8e59ed077 100644
 =20
  #ifdef GDK_WINDOWING_WAYLAND
  static void
-@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
+@@ -279,6 +283,7 @@ wayland_get_display (struct wl_display *wl_display)
  static void
  init_gl (GtkInspectorGeneral *gen)
  {
@@ -606,7 +606,7 @@ index 4fd0c3039c..a8e59ed077 100644
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
      {
-@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
+@@ -305,6 +310,7 @@ init_gl (GtkInspectorGeneral *gen)
      }
    else
  #endif
@@ -615,7 +615,7 @@ index 4fd0c3039c..a8e59ed077 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/meson.build b/meson.build
-index aed48fc3f6..bfc33af0f6 100644
+index 67b24e5..c1cc09a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -137,6 +137,7 @@ wayland_enabled        =3D get_option('wayland_backe=
nd')
@@ -646,7 +646,7 @@ index aed48fc3f6..bfc33af0f6 100644
  if iso_codes_dep.found()
    cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_variable(pkgco=
nfig: 'prefix'))
  else
-@@ -912,9 +917,15 @@ else
+@@ -914,9 +919,15 @@ else
    gio_packages =3D ['gio-2.0', glib_req]
  endif
 =20
@@ -663,7 +663,7 @@ index aed48fc3f6..bfc33af0f6 100644
                       ['fribidi', fribidi_req]))
 =20
  gtk_packages =3D ' '.join([
-@@ -928,7 +939,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
+@@ -930,7 +941,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
  # Requires.private
  pc_gdk_extra_libs +=3D cairo_libs
 =20
@@ -673,7 +673,7 @@ index aed48fc3f6..bfc33af0f6 100644
    gtk_private_packages +=3D ['pangoft2']
  endif
 diff --git a/meson_options.txt b/meson_options.txt
-index 94099aa01e..8bd096896d 100644
+index 94099aa..8bd0968 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -19,6 +19,8 @@ option('profiler', type: 'boolean', value: false,
@@ -686,7 +686,7 @@ index 94099aa01e..8bd096896d 100644
  # Print backends
  option('print_backends', type : 'string', value : 'auto',
 diff --git a/tests/meson.build b/tests/meson.build
-index 586fe2f45e..6ecf317dde 100644
+index 6ff249f..f2a9fba 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -5,7 +5,6 @@ gtk_tests =3D [
@@ -697,7 +697,7 @@ index 586fe2f45e..6ecf317dde 100644
    ['listmodel'],
    ['motion-compression'],
    ['styleexamples'],
-@@ -54,7 +53,6 @@ gtk_tests =3D [
+@@ -55,7 +54,6 @@ gtk_tests =3D [
    ['testfullscreen'],
    ['testgeometry'],
    ['testgiconpixbuf'],
@@ -705,7 +705,7 @@ index 586fe2f45e..6ecf317dde 100644
    ['testgmenu'],
    ['testgrid'],
    ['testgrouping'],
-@@ -137,6 +135,13 @@ if x11_enabled
+@@ -138,6 +136,13 @@ if x11_enabled
    ]
  endif
 =20
@@ -720,10 +720,10 @@ index 586fe2f45e..6ecf317dde 100644
    gtk_tests +=3D [['testfontchooserdialog']]
  endif
 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-fi=
nalize.c
-index 24540e313f..e0f863ab6a 100644
+index 95b565c..7f340c3 100644
 --- a/testsuite/gtk/objects-finalize.c
 +++ b/testsuite/gtk/objects-finalize.c
-@@ -116,7 +116,9 @@ main (int argc, char **argv)
+@@ -109,7 +109,9 @@ main (int argc, char **argv)
  	  all_types[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
  	  all_types[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
  	  all_types[i] !=3D GDK_TYPE_X11_DISPLAY_MANAGER &&
@@ -733,6 +733,3 @@ index 24540e313f..e0f863ab6a 100644
  #endif
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pix=
buf_loader_close() */
  	  all_types[i] !=3D GDK_TYPE_PIXBUF_LOADER &&
---=20
-2.30.2
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.43.bb
similarity index 87%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
index 61cecce4d1c..a8cc1152c34 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
@@ -5,7 +5,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+=
-${PV}.tar.xz \
            file://opengl.patch \
            "
-SRC_URI[sha256sum] =3D "50f89f615092d4dd01bbd759719f8bd380e5f149f6fd78a9=
4725e2de112377e2"
+SRC_URI[sha256sum] =3D "7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb=
5be476d51bf2f3c7"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.34.1


