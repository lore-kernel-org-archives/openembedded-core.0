Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E268C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 17:37:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.140747.1671125844073907287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 09:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LC8V4M70;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 31FE21C0008;
	Thu, 15 Dec 2022 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671125841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2EuCXgGRPLFVGAvw8yRXM7N4c/1I7O/qVYRaTgVfoDY=;
	b=LC8V4M70b0sFbxk+FxEaKVUGZqQ+tSY+0/LpffQx+8OdxcgKfwtOvyzTfW3y6COksf3bS+
	M0MUfV2U+bFzqWOaSenWFAwv2DdkoXL3I+qpPIdCjR0qupXXP0byfrhxxRxPij6GwfXJ2u
	ZqKbC+Af9URfeXMceWbLQ1NxTJnjafyNJ7JUHKK0nuD1LCpxxaqwDDIwomMKj+i1xPxkAR
	NZJbY8pI7ACwJN/gyXz3Ami+I1E4Pwhd+QNf8ltVm94tUsJC4WF0KrIZui023kGgW72/bw
	mm/Ct062cIWEr1ldg2Mo06Bw09UgpJX7gtq5mP5aauTEvhYGx0NhF/ZXU68pgQ==
Date: Thu, 15 Dec 2022 18:37:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH 1/4] gtk+3: port to Meson
Message-ID: <Y5tbUKYNZect76lv@mail.local>
References: <20221213161732.865885-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213161732.865885-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 17:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174586

Hello Ross,

This breaks on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/6322/steps/12/logs/stdio

This is oe-core, without poky

On 13/12/2022 16:17:29+0000, Ross Burton wrote:
> GTK+ 3.24.36 will drop the autotools build, so get ahead of the curve
> and switch to Meson.
> 
> The tarball is missing one meson.build file so add that explictly for
> now.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+3.inc             |  34 +-
>  ...t-try-to-initialize-GL-without-libGL.patch |  57 --
>  ...-Add-disable-opengl-configure-option.patch | 874 ------------------
>  .../recipes-gnome/gtk+/gtk+3/buildpaths.patch |  57 ++
>  .../gtk+/gtk+3/link_fribidi.patch             |  19 -
>  meta/recipes-gnome/gtk+/gtk+3/meson.build     |  14 +
>  meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 696 ++++++++++++++
>  meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb      |   6 +-
>  8 files changed, 782 insertions(+), 975 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
>  delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
>  create mode 100644 meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
>  delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
>  create mode 100644 meta/recipes-gnome/gtk+/gtk+3/meson.build
>  create mode 100644 meta/recipes-gnome/gtk+/gtk+3/opengl.patch
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 5b7b73ac8dc..1d726b56969 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -6,12 +6,11 @@ HOMEPAGE = "http://www.gtk.org"
>  BUGTRACKER = "https://bugzilla.gnome.org/"
>  SECTION = "libs"
>  
> -DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
> -           gdk-pixbuf-native"
> +DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf gdk-pixbuf-native"
>  
>  LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
>  
> -inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings features_check gobject-introspection
> +inherit meson gettext pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings features_check gobject-introspection
>  
>  BBCLASSEXTEND = "native nativesdk"
>  
> @@ -22,10 +21,6 @@ UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.tar"
>  
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  
> -# This should be in autotools.bbclass, but until something elses uses it putting
> -# it here avoids rebuilding everything.
> -export PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
> -
>  do_configure:prepend() {
>      # These files are generated by wayland-scanner but will race over modification
>      # time between the copies in the sysroot from wayland-protocols and the copy
> @@ -33,27 +28,21 @@ do_configure:prepend() {
>      rm -f ${S}/modules/input/*-text-input-*.[ch]
>  }
>  
> -EXTRA_OECONF += " \
> -                 --disable-glibtest \
> -                 --disable-xinerama \
> -                 --enable-modules \
> -                 ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \
> -                 "
> +GTKDOC_MESON_OPTION = 'gtk_doc'
>  
> -do_compile:prepend() {
> -        export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
> -}
> +EXTRA_OEMESON = "-Dxinerama=no -Dtests=false"
> +EXTRA_OEMESON:append:class-native = " -Ddemos=false -Dexamples=false"
>  
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland x11', d)}"
>  PACKAGECONFIG:class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>  
> -PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
> +PACKAGECONFIG[x11] = "-Dx11_backend=true,-Dx11_backend=false,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
>  # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
> -PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
> -PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
> -PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
> -PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
> +PACKAGECONFIG[opengl] = "-Dopengl=true,-Dopengl=false,libepoxy"
> +PACKAGECONFIG[wayland] = "-Dwayland_backend=true,-Dwayland_backend=false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
> +PACKAGECONFIG[cups] = "-Dprint_backends=cups,-Dprint_backends=file,cups"
> +PACKAGECONFIG[colord] = "-Dcolord=yes,-Dcolord=no,colord"
>  
>  prepare_gtk_scripts() {
>      mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
> @@ -96,7 +85,8 @@ FILES:${PN}-demo = "${bindir}/gtk3-demo \
>  FILES:${PN}:append = " ${bindir}/gtk-update-icon-cache-3.0 \
>                 ${bindir}/gtk-query-immodules-3.0 \
>                 ${bindir}/gtk-launch \
> -               ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
> +               ${datadir}/themes ${datadir}/gtk-3.0/emoji \
> +               ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
>                 ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
>                 ${libdir}/gtk-3.0/modules/*.so"
>  
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
> deleted file mode 100644
> index 80dc2d7a05b..00000000000
> --- a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 6575ab0f0e8c1bba033ad1616511e37a2ec995ff Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Fri, 16 Oct 2015 16:35:16 +0300
> -Subject: [PATCH] Do not try to initialize GL without libGL
> -
> -_gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys
> -GLX api which will exit() if libGL.so.1 is not present. We do not
> -want that to happen and we don't want every app to have to set
> -"GDK_GL=disabled" environment variable: so use #ifdef set based on
> -opengl distro feature.
> -
> -Upstream is not interested in the fix as it is: Either epoxy should be
> -fixed (to not exit) or GTK+ possibly could do some additional probing
> -before calling epoxy APIs.
> -
> -Upstream-Status: Denied
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -
> ----
> - configure.ac            | 6 ++++++
> - gdk/x11/gdkvisual-x11.c | 5 +++++
> - 2 files changed, 11 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index e9f5583..bd651bb 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -346,6 +346,12 @@ AC_ARG_ENABLE(cloudproviders,
> -               [AS_HELP_STRING([--enable-cloudproviders],
> -                               [enable libcloudproviders integration])],
> -                               [cloudproviders_set=yes])
> -+AC_ARG_ENABLE(glx,
> -+              [AS_HELP_STRING([--enable-glx],
> -+                              [When enabled Gdk will try to initialize GLX])])
> -+AS_IF([test "x$enable_glx" != "xno"], [
> -+  AC_DEFINE([HAVE_GLX], [], [GLX will be available at runtime])
> -+])
> - 
> - AC_ARG_ENABLE(profiler,
> -               [AS_HELP_STRING([--enable-profiler],
> -diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
> -index 81479d8..3c8c5c0 100644
> ---- a/gdk/x11/gdkvisual-x11.c
> -+++ b/gdk/x11/gdkvisual-x11.c
> -@@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
> -   /* If GL is available we want to pick better default/rgba visuals,
> -      as we care about glx details such as alpha/depth/stencil depth,
> -      stereo and double buffering */
> -+  /* update_visuals_for_gl() will end up calling epoxy GLX api which
> -+     will exit if libgl is not there: so only do this if we know GL
> -+     is available */
> -+#ifdef HAVE_GLX
> -   _gdk_x11_screen_update_visuals_for_gl (screen);
> -+#endif
> - }
> - 
> - gint
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
> deleted file mode 100644
> index fe671445365..00000000000
> --- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
> +++ /dev/null
> @@ -1,874 +0,0 @@
> -From e59cb71740ff70022bb2d9bd3685a1d77b43cac0 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Tue, 21 Jun 2016 15:11:39 +0300
> -Subject: [PATCH] Add --disable-opengl configure option
> -
> ---disable-opengl will remove the dependency on libepoxy and on the
> -OpenGL APIs. This is useful for those who want to keep using gtk+3
> -without the "opengl" distro feature.
> -
> -GtkGLArea is still part of the API (it just doesn't work) even when
> -OpenGL is disabled. GdkX11GLContext was removed from the Gtk API
> -completely: that object exposes GL API elements so it had to be at
> -the very least modified.
> -
> -The patch is _not_ great from a maintenance point of view and
> -modifying the library API is also a fairly nasty thing to do.
> -Next long term release (4.0) will require alternative solutions
> -as it actually will depend on OpenGL.
> -
> -Upstream-Status: Inappropriate [Evil eye expected from upstream]
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - configure.ac                               | 13 ++++-
> - demos/gtk-demo/glarea.c                    | 14 ++++++
> - docs/tools/Makefile.am                     |  9 +++-
> - docs/tools/widgets.c                       |  4 +-
> - gdk/gdk-sources.inc                        |  8 ++-
> - gdk/gdkdisplay.c                           |  4 +-
> - gdk/gdkgl.c                                | 10 ++++
> - gdk/gdkglcontext.c                         |  6 +++
> - gdk/gdkwindow.c                            | 13 +++++
> - gdk/x11/Makefile.am                        | 30 +++++++++--
> - gdk/x11/gdkdisplay-x11.c                   |  6 ++-
> - gdk/x11/gdkscreen-x11.c                    |  5 ++
> - gdk/x11/gdkwindow-x11.c                    |  4 ++
> - gdk/x11/gdkx-autocleanups.h                |  2 +
> - gdk/x11/{gdkx.h => gdkx-with-gl-context.h} |  1 -
> - gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++
> - gtk/Makefile.am                            |  2 +-
> - gtk/gtkglarea.c                            | 20 +++++++-
> - gtk/inspector/general.c                    |  6 +++
> - tests/Makefile.am                          | 10 ++--
> - testsuite/gtk/objects-finalize.c           |  2 +
> - 21 files changed, 208 insertions(+), 19 deletions(-)
> - rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (98%)
> - create mode 100644 gdk/x11/gdkx-without-gl-context.h
> -
> -diff --git a/configure.ac b/configure.ac
> -index 9ed65e5f8a..70c68364ff 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -346,6 +346,15 @@ AC_ARG_ENABLE(cloudproviders,
> -               [AS_HELP_STRING([--enable-cloudproviders],
> -                               [enable libcloudproviders integration])],
> -                               [cloudproviders_set=yes])
> -+AC_ARG_ENABLE(opengl,
> -+              [AS_HELP_STRING([--enable-opengl],
> -+                              [When enabled, Gtk+ will use libepoxy and exposes GtkGLArea widget ])])
> -+AS_IF([test "x$enable_opengl" != "xno"], [
> -+  AC_DEFINE([HAVE_OPENGL], [1], [libepoxy and opengl APIs are available at buildtime])
> -+  EPOXY_PACKAGES="epoxy >= epoxy_required_version"
> -+])
> -+AM_CONDITIONAL([HAVE_OPENGL],[test "x$enable_opengl" != "xno"])
> -+
> - AC_ARG_ENABLE(glx,
> -               [AS_HELP_STRING([--enable-glx],
> -                               [When enabled Gdk will try to initialize GLX])])
> -@@ -1367,7 +1376,7 @@ CFLAGS="$saved_cflags"
> - LDFLAGS="$saved_ldflags"
> - 
> - GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
> --GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fribidi >= fribidi_required_version"
> -+GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fribidi >= fribidi_required_version"
> - 
> - PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
> - GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
> -@@ -1401,7 +1410,7 @@ fi
> - PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
> - 
> - GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
> --GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES epoxy >= epoxy_required_version fribidi >= fribidi_required_version"
> -+GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $EPOXY_PACKAGES fribidi >= fribidi_required_version"
> - if test "x$enable_x11_backend" = xyes -o "x$enable_wayland_backend" = xyes; then
> -   GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
> - fi
> -diff --git a/demos/gtk-demo/glarea.c b/demos/gtk-demo/glarea.c
> -index b51e4ae1fe..82409c7358 100644
> ---- a/demos/gtk-demo/glarea.c
> -+++ b/demos/gtk-demo/glarea.c
> -@@ -3,9 +3,12 @@
> -  * GtkGLArea is a widget that allows custom drawing using OpenGL calls.
> -  */
> - 
> -+#include "config.h"
> - #include <math.h>
> - #include <gtk/gtk.h>
> -+#if HAVE_OPENGL
> - #include <epoxy/gl.h>
> -+#endif
> - 
> - static GtkWidget *demo_window = NULL;
> - 
> -@@ -23,6 +26,8 @@ enum {
> - /* Rotation angles on each axis */
> - static float rotation_angles[N_AXIS] = { 0.0 };
> - 
> -+#ifdef HAVE_OPENGL
> -+
> - /* The object we are drawing */
> - static const GLfloat vertex_data[] = {
> -   0.f,   0.5f,   0.f, 1.f,
> -@@ -215,6 +220,7 @@ compute_mvp (float *res,
> - static GLuint position_buffer;
> - static GLuint program;
> - static GLuint mvp_location;
> -+#endif
> - 
> - /* We need to set up our state when we realize the GtkGLArea widget */
> - static void
> -@@ -241,8 +247,10 @@ realize (GtkWidget *widget)
> -       fragment_path = "/glarea/glarea-gl.fs.glsl";
> -     }
> - 
> -+#ifdef HAVE_OPENGL
> -   init_buffers (&position_buffer, NULL);
> -   init_shaders (vertex_path, fragment_path, &program, &mvp_location);
> -+#endif
> - }
> - 
> - /* We should tear down the state when unrealizing */
> -@@ -254,10 +262,13 @@ unrealize (GtkWidget *widget)
> -   if (gtk_gl_area_get_error (GTK_GL_AREA (widget)) != NULL)
> -     return;
> - 
> -+#ifdef HAVE_OPENGL
> -   glDeleteBuffers (1, &position_buffer);
> -   glDeleteProgram (program);
> -+#endif
> - }
> - 
> -+#ifdef HAVE_OPENGL
> - static void
> - draw_triangle (void)
> - {
> -@@ -290,6 +301,7 @@ draw_triangle (void)
> -   glBindBuffer (GL_ARRAY_BUFFER, 0);
> -   glUseProgram (0);
> - }
> -+#endif
> - 
> - static gboolean
> - render (GtkGLArea    *area,
> -@@ -298,6 +310,7 @@ render (GtkGLArea    *area,
> -   if (gtk_gl_area_get_error (area) != NULL)
> -     return FALSE;
> - 
> -+#ifdef HAVE_OPENGL
> -   /* Clear the viewport */
> -   glClearColor (0.5, 0.5, 0.5, 1.0);
> -   glClear (GL_COLOR_BUFFER_BIT);
> -@@ -307,6 +320,7 @@ render (GtkGLArea    *area,
> - 
> -   /* Flush the contents of the pipeline */
> -   glFlush ();
> -+#endif
> - 
> -   return TRUE;
> - }
> -diff --git a/docs/tools/Makefile.am b/docs/tools/Makefile.am
> -index bec43e3a55..189e8fc926 100644
> ---- a/docs/tools/Makefile.am
> -+++ b/docs/tools/Makefile.am
> -@@ -9,13 +9,18 @@ AM_CPPFLAGS = \
> - 	$(GTK_DEBUG_FLAGS)		\
> - 	$(GTK_DEP_CFLAGS)
> - 
> -+if HAVE_OPENGL
> -+GEARS_LDADD = $(top_builddir)/tests/gtkgears.o
> -+endif
> -+
> - DEPS = \
> --	$(top_builddir)/gtk/libgtk-3.la
> -+	$(top_builddir)/gtk/libgtk-3.la	\
> -+	$(GEARS_LDADD)
> - 
> - LDADDS = \
> - 	$(top_builddir)/gtk/libgtk-3.la	\
> - 	$(top_builddir)/gdk/libgdk-3.la	\
> --	$(top_builddir)/tests/gtkgears.o \
> -+	$(GEARS_LDADD)			\
> - 	$(GTK_DEP_LIBS)			\
> - 	$(GDK_DEP_LIBS)			\
> - 	-lm
> -diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
> -index 932daf1746..54239d6129 100644
> ---- a/docs/tools/widgets.c
> -+++ b/docs/tools/widgets.c
> -@@ -1526,9 +1526,11 @@ create_gl_area (void)
> -   widget = gtk_frame_new (NULL);
> -   gtk_frame_set_shadow_type (GTK_FRAME (widget), GTK_SHADOW_IN);
> - 
> -+#ifdef HAVE_OPENGL
> -   gears = gtk_gears_new ();
> -   gtk_container_add (GTK_CONTAINER (widget), gears);
> -- 
> -+#endif
> -+
> -   info = new_widget_info ("glarea", widget, MEDIUM);
> - 
> -   return info;
> -diff --git a/gdk/gdk-sources.inc b/gdk/gdk-sources.inc
> -index 9235edb6cf..349acb8f4c 100644
> ---- a/gdk/gdk-sources.inc
> -+++ b/gdk/gdk-sources.inc
> -@@ -146,7 +146,6 @@ x11_introspection_files = 		\
> - 	x11/gdkeventsource.c		\
> - 	x11/gdkeventtranslator.c	\
> - 	x11/gdkgeometry-x11.c		\
> --	x11/gdkglcontext-x11.c		\
> - 	x11/gdkkeys-x11.c		\
> - 	x11/gdkmain-x11.c		\
> - 	x11/gdkmonitor-x11.c		\
> -@@ -172,7 +171,6 @@ x11_introspection_files = 		\
> - 	x11/gdkx11display.h		\
> - 	x11/gdkx11displaymanager.h	\
> - 	x11/gdkx11dnd.h			\
> --	x11/gdkx11glcontext.h		\
> - 	x11/gdkx11keys.h		\
> - 	x11/gdkx11monitor.h		\
> - 	x11/gdkx11property.h		\
> -@@ -182,6 +180,12 @@ x11_introspection_files = 		\
> - 	x11/gdkx11visual.h		\
> - 	x11/gdkx11window.h
> - 
> -+if HAVE_OPENGL
> -+x11_introspection_files += 		\
> -+	x11/gdkglcontext-x11.c		\
> -+	x11/gdkx11glcontext.h
> -+endif
> -+
> - w32_introspection_files =		\
> - 	win32/gdkcursor-win32.c		\
> - 	win32/gdkdevicemanager-win32.c	\
> -diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
> -index 748f54860c..911ab2a65f 100644
> ---- a/gdk/gdkdisplay.c
> -+++ b/gdk/gdkdisplay.c
> -@@ -2420,7 +2420,9 @@ gboolean
> - gdk_display_make_gl_context_current (GdkDisplay   *display,
> -                                      GdkGLContext *context)
> - {
> --  return GDK_DISPLAY_GET_CLASS (display)->make_gl_context_current (display, context);
> -+  if (GDK_DISPLAY_GET_CLASS (display)->make_gl_context_current)
> -+    return GDK_DISPLAY_GET_CLASS (display)->make_gl_context_current (display, context);
> -+  return FALSE;
> - }
> - 
> - GdkRenderingMode
> -diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
> -index 9690077cc2..55f85ef605 100644
> ---- a/gdk/gdkgl.c
> -+++ b/gdk/gdkgl.c
> -@@ -26,7 +26,9 @@
> - # include "win32/gdkwin32.h"
> - #endif
> - 
> -+#ifdef HAVE_OPENGL
> - #include <epoxy/gl.h>
> -+#endif
> - #include <math.h>
> - #include <string.h>
> - 
> -@@ -40,6 +42,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *surface,
> -                                g_object_ref (window),  g_object_unref);
> - }
> - 
> -+#ifdef HAVE_OPENGL
> - static const char *
> - get_vertex_type_name (int type)
> - {
> -@@ -212,6 +215,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint_data)
> -       glUseProgram (paint_data->current_program->program);
> -     }
> - }
> -+#endif
> - 
> - void
> - gdk_gl_texture_quads (GdkGLContext *paint_context,
> -@@ -220,6 +224,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
> -                       GdkTexturedQuad *quads,
> -                       gboolean flip_colors)
> - {
> -+#ifdef HAVE_OPENGL
> -   GdkGLContextPaintData *paint_data  = gdk_gl_context_get_paint_data (paint_context);
> -   GdkGLContextProgram *program;
> -   GdkWindow *window = gdk_gl_context_get_window (paint_context);
> -@@ -293,6 +298,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
> - 
> -   glDisableVertexAttribArray (program->position_location);
> -   glDisableVertexAttribArray (program->uv_location);
> -+#endif
> - }
> - 
> - /* x,y,width,height describes a rectangle in the gl render buffer
> -@@ -341,6 +347,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
> -                         int                   width,
> -                         int                   height)
> - {
> -+#ifdef HAVE_OPENGL
> -   GdkGLContext *paint_context;
> -   cairo_surface_t *image;
> -   cairo_matrix_t matrix;
> -@@ -718,6 +725,7 @@ out:
> -   if (clip_region)
> -     cairo_region_destroy (clip_region);
> - 
> -+#endif
> - }
> - 
> - /* This is always called with the paint context current */
> -@@ -725,6 +733,7 @@ void
> - gdk_gl_texture_from_surface (cairo_surface_t *surface,
> - 			     cairo_region_t  *region)
> - {
> -+#ifdef HAVE_OPENGL
> -   GdkGLContext *paint_context;
> -   cairo_surface_t *image;
> -   double device_x_offset, device_y_offset;
> -@@ -825,4 +834,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
> - 
> -   glDisable (GL_SCISSOR_TEST);
> -   glDeleteTextures (1, &texture_id);
> -+#endif
> - }
> -diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
> -index 3b23639e1c..1f04f8e0b2 100644
> ---- a/gdk/gdkglcontext.c
> -+++ b/gdk/gdkglcontext.c
> -@@ -85,7 +85,9 @@
> - #include "gdkintl.h"
> - #include "gdk-private.h"
> - 
> -+#ifdef HAVE_OPENGL
> - #include <epoxy/gl.h>
> -+#endif
> - 
> - typedef struct {
> -   GdkDisplay *display;
> -@@ -243,6 +245,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
> -                                int              height,
> -                                guint            texture_target)
> - {
> -+#ifdef HAVE_OPENGL
> -   GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
> - 
> -   g_return_if_fail (GDK_IS_GL_CONTEXT (context));
> -@@ -286,6 +289,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
> -             glTexSubImage2D (texture_target, 0, 0, i, width, 1, GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV, (unsigned char*) data + (i * stride));
> -         }
> -     }
> -+#endif
> - }
> - 
> - static gboolean
> -@@ -774,6 +778,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
> - static void
> - gdk_gl_context_check_extensions (GdkGLContext *context)
> - {
> -+#ifdef HAVE_OPENGL
> -   GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
> -   gboolean has_npot, has_texture_rectangle;
> - 
> -@@ -853,6 +858,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
> -                        priv->use_texture_rectangle ? "yes" : "no"));
> - 
> -   priv->extensions_checked = TRUE;
> -+#endif
> - }
> - 
> - /**
> -diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
> -index 727b0cf1f4..d4d91b0d16 100644
> ---- a/gdk/gdkwindow.c
> -+++ b/gdk/gdkwindow.c
> -@@ -45,7 +45,9 @@
> - 
> - #include <math.h>
> - 
> -+#ifdef HAVE_OPENGL
> - #include <epoxy/gl.h>
> -+#endif
> - 
> - /* for the use of round() */
> - #include "fallback-c89.c"
> -@@ -2844,6 +2846,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
> - {
> -   GError *internal_error = NULL;
> - 
> -+#ifndef HAVE_OPENGL
> -+  g_set_error_literal (error, GDK_GL_ERROR,
> -+                       GDK_GL_ERROR_NOT_AVAILABLE,
> -+                       _("GL support disabled with --disable-opengl"));
> -+  return NULL;
> -+#endif
> -+
> -   if (_gdk_gl_flags & GDK_GL_DISABLE)
> -     {
> -       g_set_error_literal (error, GDK_GL_ERROR,
> -@@ -2979,6 +2988,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
> -         }
> -       else
> -         {
> -+#ifdef HAVE_OPENGL
> - 	  gdk_gl_context_make_current (context);
> -           /* With gl we always need a surface to combine the gl
> -              drawing with the native drawing. */
> -@@ -2993,6 +3003,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
> -           glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
> - 
> -           glViewport (0, 0, ww, wh);
> -+#endif
> -         }
> -     }
> - 
> -@@ -3056,6 +3067,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
> - 
> -           gdk_gl_context_make_current (window->gl_paint_context);
> - 
> -+#ifdef HAVE_OPENGL
> -           if (!cairo_region_is_empty (opaque_region))
> -             gdk_gl_texture_from_surface (window->current_paint.surface,
> -                                          opaque_region);
> -@@ -3066,6 +3078,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
> -                                            window->current_paint.need_blend_region);
> -               glDisable(GL_BLEND);
> -             }
> -+#endif
> - 
> -           cairo_region_destroy (opaque_region);
> - 
> -diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
> -index 32b1f24434..63523130ce 100644
> ---- a/gdk/x11/Makefile.am
> -+++ b/gdk/x11/Makefile.am
> -@@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES = 	\
> - 	gdkeventtranslator.c	\
> - 	gdkeventtranslator.h	\
> - 	gdkgeometry-x11.c  	\
> --	gdkglcontext-x11.c	\
> --	gdkglcontext-x11.h	\
> - 	gdkkeys-x11.c		\
> - 	gdkmain-x11.c		\
> - 	gdkmonitor-x11.c	\
> -@@ -56,14 +54,32 @@ libgdk_x11_la_SOURCES = 	\
> - 	gdkwindow-x11.h		\
> - 	gdkxftdefaults.c	\
> - 	gdkxid.c		\
> --	gdkx.h			\
> - 	gdkprivate-x11.h	\
> - 	xsettings-client.h	\
> - 	xsettings-client.c
> - 
> -+if HAVE_OPENGL
> -+libgdk_x11_la_SOURCES +=        \
> -+	gdkglcontext-x11.c	\
> -+	gdkglcontext-x11.h
> -+endif
> -+
> - libgdkinclude_HEADERS = 	\
> - 	gdkx.h
> - 
> -+if HAVE_OPENGL
> -+GDKX_HEADER = gdkx-with-gl-context.h
> -+else
> -+GDKX_HEADER = gdkx-without-gl-context.h
> -+endif
> -+
> -+BUILT_SOURCES = gdkx.h
> -+
> -+.PHONY: gdkx.h
> -+gdkx.h:
> -+	$(AM_V_GEN) cd $(srcdir) \
> -+	&& (cmp -s $(GDKX_HEADER) gdkx.h || cp $(GDKX_HEADER) gdkx.h )
> -+
> - libgdkx11include_HEADERS = 	\
> - 	gdkx-autocleanups.h	\
> - 	gdkx11applaunchcontext.h \
> -@@ -77,7 +93,6 @@ libgdkx11include_HEADERS = 	\
> - 	gdkx11display.h		\
> - 	gdkx11displaymanager.h	\
> - 	gdkx11dnd.h		\
> --	gdkx11glcontext.h	\
> - 	gdkx11keys.h		\
> - 	gdkx11monitor.h		\
> - 	gdkx11property.h	\
> -@@ -87,10 +102,17 @@ libgdkx11include_HEADERS = 	\
> - 	gdkx11visual.h		\
> - 	gdkx11window.h
> - 
> -+if HAVE_OPENGL
> -+libgdkx11include_HEADERS += gdkx11glcontext.h
> -+endif
> -+
> - # We need to include all these C files here since the conditionals
> - # don't seem to be correctly expanded for the dist files.
> - EXTRA_DIST += 			\
> -+	gdkx.h			\
> - 	gdksettings.c	\
> - 	meson.build
> - 
> -+MAINTAINERCLEANFILES = gdkx.h
> -+
> - -include $(top_srcdir)/git.mk
> -diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
> -index 7e08f472cc..30fd7b6089 100644
> ---- a/gdk/x11/gdkdisplay-x11.c
> -+++ b/gdk/x11/gdkdisplay-x11.c
> -@@ -37,7 +37,9 @@
> - #include "gdkdisplay-x11.h"
> - #include "gdkprivate-x11.h"
> - #include "gdkscreen-x11.h"
> -+#ifdef HAVE_OPENGL
> - #include "gdkglcontext-x11.h"
> -+#endif
> - #include "gdk-private.h"
> - #include "gdkprofilerprivate.h"
> - 
> -@@ -3191,7 +3193,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
> -   display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
> -   display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
> - 
> --  display_class->make_gl_context_current = gdk_x11_display_make_gl_context_current;
> -+#ifdef HAVE_OPENGL
> -+   display_class->make_gl_context_current = gdk_x11_display_make_gl_context_current;
> -+#endif
> - 
> -   display_class->get_default_seat = gdk_x11_display_get_default_seat;
> - 
> -diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
> -index c2b7480c48..114fd4c67a 100644
> ---- a/gdk/x11/gdkscreen-x11.c
> -+++ b/gdk/x11/gdkscreen-x11.c
> -@@ -1842,3 +1842,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
> - {
> -   return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
> - }
> -+
> -+#ifndef HAVE_OPENGL
> -+/* Function from in gdk/x11/gdkglcontext-x11.c */
> -+void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
> -+#endif
> -diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
> -index 194bc82e29..0302bb68d4 100644
> ---- a/gdk/x11/gdkwindow-x11.c
> -+++ b/gdk/x11/gdkwindow-x11.c
> -@@ -36,7 +36,9 @@
> - #include "gdkasync.h"
> - #include "gdkeventsource.h"
> - #include "gdkdisplay-x11.h"
> -+#ifdef HAVE_OPENGL
> - #include "gdkglcontext-x11.h"
> -+#endif
> - #include "gdkprivate-x11.h"
> - #include "gdk-private.h"
> - 
> -@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
> -   impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
> -   impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
> -   impl_class->show_window_menu = gdk_x11_window_show_window_menu;
> -+#ifdef HAVE_OPENGL
> -   impl_class->create_gl_context = gdk_x11_window_create_gl_context;
> -   impl_class->invalidate_for_new_frame = gdk_x11_window_invalidate_for_new_frame;
> -+#endif
> -   impl_class->get_unscaled_size = gdk_x11_window_get_unscaled_size;
> - }
> -diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
> -index edb0ea7dbf..a317d61cca 100644
> ---- a/gdk/x11/gdkx-autocleanups.h
> -+++ b/gdk/x11/gdkx-autocleanups.h
> -@@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_object_unref)
> - G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Display, g_object_unref)
> - G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DisplayManager, g_object_unref)
> - G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DragContext, g_object_unref)
> -+#ifdef HAVE_OPENGL
> - G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11GLContext, g_object_unref)
> -+#endif
> - G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
> - G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
> - G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
> -diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
> -similarity index 98%
> -rename from gdk/x11/gdkx.h
> -rename to gdk/x11/gdkx-with-gl-context.h
> -index 1f64bccb6d..ae05fa6b1f 100644
> ---- a/gdk/x11/gdkx.h
> -+++ b/gdk/x11/gdkx-with-gl-context.h
> -@@ -45,7 +45,6 @@
> - #include <gdk/x11/gdkx11dnd.h>
> - #include <gdk/x11/gdkx11glcontext.h>
> - #include <gdk/x11/gdkx11keys.h>
> --#include <gdk/x11/gdkx11monitor.h>
> - #include <gdk/x11/gdkx11property.h>
> - #include <gdk/x11/gdkx11screen.h>
> - #include <gdk/x11/gdkx11selection.h>
> -diff --git a/gdk/x11/gdkx-without-gl-context.h b/gdk/x11/gdkx-without-gl-context.h
> -new file mode 100644
> -index 0000000000..c9e261720f
> ---- /dev/null
> -+++ b/gdk/x11/gdkx-without-gl-context.h
> -@@ -0,0 +1,58 @@
> -+/* GDK - The GIMP Drawing Kit
> -+ * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
> -+ *
> -+ * This library is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU Lesser General Public
> -+ * License as published by the Free Software Foundation; either
> -+ * version 2 of the License, or (at your option) any later version.
> -+ *
> -+ * This library is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+ * Lesser General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU Lesser General Public
> -+ * License along with this library. If not, see <http://www.gnu.org/licenses/>.
> -+ */
> -+
> -+/*
> -+ * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
> -+ * file for a list of people on the GTK+ Team.  See the ChangeLog
> -+ * files for a list of changes.  These files are distributed with
> -+ * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
> -+ */
> -+
> -+#ifndef __GDK_X_H__
> -+#define __GDK_X_H__
> -+
> -+#include <gdk/gdk.h>
> -+
> -+#include <X11/Xlib.h>
> -+#include <X11/Xutil.h>
> -+
> -+#define __GDKX_H_INSIDE__
> -+
> -+#include <gdk/x11/gdkx11applaunchcontext.h>
> -+#include <gdk/x11/gdkx11cursor.h>
> -+#include <gdk/x11/gdkx11device.h>
> -+#include <gdk/x11/gdkx11device-core.h>
> -+#include <gdk/x11/gdkx11device-xi2.h>
> -+#include <gdk/x11/gdkx11devicemanager.h>
> -+#include <gdk/x11/gdkx11devicemanager-core.h>
> -+#include <gdk/x11/gdkx11devicemanager-xi2.h>
> -+#include <gdk/x11/gdkx11display.h>
> -+#include <gdk/x11/gdkx11displaymanager.h>
> -+#include <gdk/x11/gdkx11dnd.h>
> -+#include <gdk/x11/gdkx11keys.h>
> -+#include <gdk/x11/gdkx11property.h>
> -+#include <gdk/x11/gdkx11screen.h>
> -+#include <gdk/x11/gdkx11selection.h>
> -+#include <gdk/x11/gdkx11utils.h>
> -+#include <gdk/x11/gdkx11visual.h>
> -+#include <gdk/x11/gdkx11window.h>
> -+
> -+#include <gdk/x11/gdkx-autocleanups.h>
> -+
> -+#undef __GDKX_H_INSIDE__
> -+
> -+#endif /* __GDK_X_H__ */
> -diff --git a/gtk/Makefile.am b/gtk/Makefile.am
> -index 946e72febc..b01da7f128 100644
> ---- a/gtk/Makefile.am
> -+++ b/gtk/Makefile.am
> -@@ -467,7 +467,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_s
> - 	  ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-gtfsrc.c | \
> - 	  $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
> - 	  sort | uniq | \
> --	  $(SED) '{ s/^/*tp++ = /; s/$$/();/; s/^.*\(gdk_x11\|gtk_plug_\|gtk_socket_\).*$$/#ifdef GDK_WINDOWING_X11\n&\n#endif/; }' >> xgen-gtf \
> -+	  $(SED) '{ s/^/*tp++ = /; s/$$/();/; s/^.*\(gdk_x11\|gtk_plug_\|gtk_socket_\).*$$/#ifdef GDK_WINDOWING_X11\n&\n#endif/; s/^.*gdk_x11_gl.*$$/#ifdef HAVE_OPENGL\n&\n#endif/; }' >> xgen-gtf \
> - 	&& cp xgen-gtf $@ && rm -f xgen-gtf
> - $(srcdir)/gtktestutils.c: gtktypefuncs.inc
> - 
> -diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
> -index 802303ea9f..33001cfb61 100644
> ---- a/gtk/gtkglarea.c
> -+++ b/gtk/gtkglarea.c
> -@@ -29,7 +29,9 @@
> - #include "gtkprivate.h"
> - #include "gtkrender.h"
> - 
> -+#ifdef HAVE_OPENGL
> - #include <epoxy/gl.h>
> -+#endif
> - 
> - /**
> -  * SECTION:gtkglarea
> -@@ -369,9 +371,12 @@ gtk_gl_area_real_create_context (GtkGLArea *area)
> - static void
> - gtk_gl_area_resize (GtkGLArea *area, int width, int height)
> - {
> -+#ifdef HAVE_OPENGL
> -   glViewport (0, 0, width, height);
> -+#endif
> - }
> - 
> -+#ifdef HAVE_OPENGL
> - /*
> -  * Creates all the buffer objects needed for rendering the scene
> -  */
> -@@ -483,6 +488,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
> - 
> -   priv->needs_render = TRUE;
> - }
> -+#endif
> - 
> - /**
> -  * gtk_gl_area_attach_buffers:
> -@@ -501,6 +507,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
> - void
> - gtk_gl_area_attach_buffers (GtkGLArea *area)
> - {
> -+#ifdef HAVE_OPENGL
> -   GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
> - 
> -   g_return_if_fail (GTK_IS_GL_AREA (area));
> -@@ -533,11 +540,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
> -         glFramebufferRenderbuffer (GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT,
> -                                    GL_RENDERBUFFER, priv->depth_stencil_buffer);
> -     }
> -+#endif
> - }
> - 
> - static void
> - gtk_gl_area_delete_buffers (GtkGLArea *area)
> - {
> -+#ifdef HAVE_OPENGL
> -   GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
> - 
> -   if (priv->context == NULL)
> -@@ -569,6 +578,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
> -       glDeleteFramebuffers (1, &priv->frame_buffer);
> -       priv->frame_buffer = 0;
> -     }
> -+#endif
> - }
> - 
> - static void
> -@@ -679,6 +689,7 @@ gtk_gl_area_draw (GtkWidget *widget,
> -   GtkGLArea *area = GTK_GL_AREA (widget);
> -   GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
> -   gboolean unused;
> -+#ifdef HAVE_OPENGL
> -   int w, h, scale;
> -   GLenum status;
> - 
> -@@ -690,7 +701,6 @@ gtk_gl_area_draw (GtkWidget *widget,
> -                                      gtk_widget_get_allocated_height (widget));
> -       return FALSE;
> -     }
> --
> -   if (priv->context == NULL)
> -     return FALSE;
> - 
> -@@ -736,6 +746,14 @@ gtk_gl_area_draw (GtkWidget *widget,
> -     }
> - 
> -   return TRUE;
> -+#else
> -+  if (priv->error != NULL)
> -+      gtk_gl_area_draw_error_screen (area,
> -+                                     cr,
> -+                                     gtk_widget_get_allocated_width (widget),
> -+                                     gtk_widget_get_allocated_height (widget));
> -+  return FALSE;
> -+#endif
> - }
> - 
> - static gboolean
> -diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
> -index 4fd0c3039c..a8e59ed077 100644
> ---- a/gtk/inspector/general.c
> -+++ b/gtk/inspector/general.c
> -@@ -33,8 +33,10 @@
> - 
> - #ifdef GDK_WINDOWING_X11
> - #include "x11/gdkx.h"
> -+#ifdef HAVE_OPENGL
> - #include <epoxy/glx.h>
> - #endif
> -+#endif
> - 
> - #ifdef GDK_WINDOWING_WIN32
> - #include "win32/gdkwin32.h"
> -@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
> -   gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
> - }
> - 
> -+#ifdef HAVE_OPENGL
> - #ifdef GDK_WINDOWING_X11
> - static void
> - append_glx_extension_row (GtkInspectorGeneral *gen,
> -@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
> -   add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_glx_extension (dpy, 0, ext), 0);
> - }
> - #endif
> -+#endif
> - 
> - #ifdef GDK_WINDOWING_WAYLAND
> - static void
> -@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
> - static void
> - init_gl (GtkInspectorGeneral *gen)
> - {
> -+#ifdef HAVE_OPENGL
> - #ifdef GDK_WINDOWING_X11
> -   if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
> -     {
> -@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
> -     }
> -   else
> - #endif
> -+#endif
> - #ifdef GDK_WINDOWING_WAYLAND
> -   if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
> -     {
> -diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index f283e89831..5e7180e923 100644
> ---- a/tests/Makefile.am
> -+++ b/tests/Makefile.am
> -@@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
> - 	testfullscreen			\
> - 	testgeometry			\
> - 	testgiconpixbuf			\
> --	testglarea			\
> --	testglblending			\
> - 	testgrid			\
> - 	testgtk				\
> - 	testheaderbar			\
> -@@ -172,12 +170,18 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
> - 	testactionbar			\
> - 	testwindowsize			\
> - 	testpopover			\
> --	gdkgears			\
> - 	listmodel			\
> - 	testpopup			\
> - 	testpopupat			\
> - 	$(NULL)
> - 
> -+if HAVE_OPENGL
> -+noinst_PROGRAMS +=
> -+	testglarea			\
> -+	testglblending			\
> -+	gdkgears
> -+endif
> -+
> - if USE_WAYLAND
> - noinst_PROGRAMS += testforeign
> - endif
> -diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-finalize.c
> -index 24540e313f..e0f863ab6a 100644
> ---- a/testsuite/gtk/objects-finalize.c
> -+++ b/testsuite/gtk/objects-finalize.c
> -@@ -116,7 +116,9 @@ main (int argc, char **argv)
> - 	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
> - 	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
> - 	  all_types[i] != GDK_TYPE_X11_DISPLAY_MANAGER &&
> -+#ifdef HAVE_OPENGL
> - 	  all_types[i] != GDK_TYPE_X11_GL_CONTEXT &&
> -+#endif
> - #endif
> - 	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbuf_loader_close() */
> - 	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
> --- 
> -2.34.1
> -
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch b/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
> new file mode 100644
> index 00000000000..627d1d4b7e3
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
> @@ -0,0 +1,57 @@
> +Use basename not full filename to remove buildpaths from the packages.
> +
> +Upstream-Status: Backport [8eb4e59613a0979757332eb833231b947d61f13d]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/gdk/gdkenumtypes.c.template b/gdk/gdkenumtypes.c.template
> +index df9edfefa1..c5104e0e0d 100644
> +--- a/gdk/gdkenumtypes.c.template
> ++++ b/gdk/gdkenumtypes.c.template
> +@@ -5,7 +5,7 @@
> + /*** END file-header ***/
> + 
> + /*** BEGIN file-production ***/
> +-/* enumerations from "@filename@" */
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> + 
> + /*** BEGIN value-header ***/
> +diff --git a/gtk/gtkprivatetypebuiltins.c.template b/gtk/gtkprivatetypebuiltins.c.template
> +index 2565208bfc..d7961be8ef 100644
> +--- a/gtk/gtkprivatetypebuiltins.c.template
> ++++ b/gtk/gtkprivatetypebuiltins.c.template
> +@@ -7,7 +7,7 @@
> + /*** END file-header ***/
> + 
> + /*** BEGIN file-production ***/
> +-/* enumerations from "@filename@" */
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> + 
> + /*** BEGIN value-header ***/
> +diff --git a/gtk/gtkprivatetypebuiltins.h.template b/gtk/gtkprivatetypebuiltins.h.template
> +index a21e9aac05..5ecd4d392f 100644
> +--- a/gtk/gtkprivatetypebuiltins.h.template
> ++++ b/gtk/gtkprivatetypebuiltins.h.template
> +@@ -14,7 +14,7 @@ G_BEGIN_DECLS
> + 
> + /*** BEGIN file-production ***/
> + 
> +-/* enumerations from "@filename@" */
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> + 
> + /*** BEGIN value-header ***/
> +diff --git a/gtk/gtktypebuiltins.c.template b/gtk/gtktypebuiltins.c.template
> +index f4d748b7b9..9a5a360f09 100644
> +--- a/gtk/gtktypebuiltins.c.template
> ++++ b/gtk/gtktypebuiltins.c.template
> +@@ -6,7 +6,7 @@
> + /*** END file-header ***/
> + 
> + /*** BEGIN file-production ***/
> +-/* enumerations from "@filename@" */
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> + 
> + /*** BEGIN value-header ***/
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch b/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
> deleted file mode 100644
> index e4bbd799f11..00000000000
> --- a/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Link with libfribidi, this is to avoid under linking where these functions are
> -used but the library is not linked in, and they are marked undefined by BFD linker
> -but gold linker refuses to link
> -
> -| ./.libs/libgdk-3.so: error: undefined reference to 'fribidi_get_bidi_type'
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> ---- a/gdk/Makefile.am
> -+++ b/gdk/Makefile.am
> -@@ -55,6 +55,7 @@ LDADD = 					\
> - 	-version-info $(LT_VERSION_INFO)	\
> - 	-export-dynamic 			\
> - 	-rpath $(libdir) 			\
> -+	-lfribidi	 			\
> - 	$(no_undefined)
> - 
> - #
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/meson.build b/meta/recipes-gnome/gtk+/gtk+3/meson.build
> new file mode 100644
> index 00000000000..94cf47a37f7
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+3/meson.build
> @@ -0,0 +1,14 @@
> +# This file is missing from the 3.24.35 tarball
> +
> +wayland_cursor_sources = files([
> +  'wayland-cursor.c',
> +  'xcursor.c',
> +  'os-compatibility.c'
> +])
> +
> +libwayland_cursor = static_library('wayland+cursor',
> +  sources: wayland_cursor_sources,
> +  include_directories: [ confinc, ],
> +  dependencies: [ glib_dep, wlclientdep, ],
> +  c_args: common_cflags,
> +)
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
> new file mode 100644
> index 00000000000..f5bb84ec3a7
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
> @@ -0,0 +1,696 @@
> +From f8a2999fb2c9d5577a927dd841e79240c13ad5e1 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Fri, 16 Oct 2015 16:35:16 +0300
> +Subject: [PATCH] Do not try to initialize GL without libGL
> +
> +_gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys
> +GLX api which will exit() if libGL.so.1 is not present. We do not
> +want that to happen and we don't want every app to have to set
> +"GDK_GL=disabled" environment variable: so use #ifdef set based on
> +opengl distro feature.
> +
> +Upstream is not interested in the fix as it is: Either epoxy should be
> +fixed (to not exit) or GTK+ possibly could do some additional probing
> +before calling epoxy APIs.
> +
> +Upstream-Status: Denied
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + config.h.meson                   |  2 ++
> + docs/tools/meson.build           |  7 +++++--
> + docs/tools/widgets.c             |  6 +++++-
> + gdk/gdkconfig.h.meson            |  1 +
> + gdk/gdkdisplay.c                 |  4 ++++
> + gdk/gdkgl.c                      | 10 ++++++++++
> + gdk/gdkglcontext.c               |  6 ++++++
> + gdk/gdkwindow.c                  | 13 +++++++++++++
> + gdk/meson.build                  |  1 +
> + gdk/x11/Makefile.am              |  2 --
> + gdk/x11/gdkdisplay-x11.c         |  6 +++++-
> + gdk/x11/gdkvisual-x11.c          |  5 +++++
> + gdk/x11/gdkwindow-x11.c          |  4 ++++
> + gdk/x11/gdkx-autocleanups.h      |  2 ++
> + gdk/x11/meson.build              |  5 ++++-
> + gtk/gtkglarea.c                  | 19 +++++++++++++++++++
> + gtk/inspector/general.c          |  6 ++++++
> + meson.build                      | 17 ++++++++++++++---
> + meson_options.txt                |  2 ++
> + tests/meson.build                |  9 +++++++--
> + testsuite/gtk/objects-finalize.c |  2 ++
> + 21 files changed, 117 insertions(+), 12 deletions(-)
> +
> +diff --git a/config.h.meson b/config.h.meson
> +index b502611cb7..0bf6678d5e 100644
> +--- a/config.h.meson
> ++++ b/config.h.meson
> +@@ -20,6 +20,8 @@
> + /* define if we have colord */
> + #mesondefine HAVE_COLORD
> + 
> ++#mesondefine HAVE_OPENGL
> ++
> + /* Define if the GNU dcgettext() function is already present or preinstalled.
> +    */
> + #mesondefine HAVE_DCGETTEXT
> +diff --git a/docs/tools/meson.build b/docs/tools/meson.build
> +index 05621ee7ed..3d0a333b32 100644
> +--- a/docs/tools/meson.build
> ++++ b/docs/tools/meson.build
> +@@ -2,10 +2,13 @@ if x11_enabled
> +   doc_shooter_sources = [
> +     'shadow.c',
> +     'shooter.c',
> +-    'widgets.c',
> +-    '../../tests/gtkgears.c',
> ++    'widgets.c'
> +   ]
> + 
> ++  if opengl_enabled
> ++  doc_shooter_sources += ['../../tests/gtkgears.c']
> ++  endif
> ++
> +   doc_shooter = executable('doc-shooter', doc_shooter_sources,
> +                            include_directories: [ confinc, gdkinc, gtkinc, testinc, ],
> +                            dependencies: libgtk_dep)
> +diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
> +index 932daf1746..348807e133 100644
> +--- a/docs/tools/widgets.c
> ++++ b/docs/tools/widgets.c
> +@@ -8,7 +8,9 @@
> + #include <X11/Xatom.h>
> + #include <gdkx.h>
> + #include "widgets.h"
> ++#ifdef HAVE_OPENGL
> + #include "gtkgears.h"
> ++#endif
> + 
> + #define SMALL_WIDTH  240
> + #define SMALL_HEIGHT 75
> +@@ -1526,9 +1528,11 @@ create_gl_area (void)
> +   widget = gtk_frame_new (NULL);
> +   gtk_frame_set_shadow_type (GTK_FRAME (widget), GTK_SHADOW_IN);
> + 
> ++#ifdef HAVE_OPENGL
> +   gears = gtk_gears_new ();
> +   gtk_container_add (GTK_CONTAINER (widget), gears);
> +- 
> ++#endif
> ++
> +   info = new_widget_info ("glarea", widget, MEDIUM);
> + 
> +   return info;
> +diff --git a/gdk/gdkconfig.h.meson b/gdk/gdkconfig.h.meson
> +index 7db19e0470..088651bafa 100644
> +--- a/gdk/gdkconfig.h.meson
> ++++ b/gdk/gdkconfig.h.meson
> +@@ -15,6 +15,7 @@ G_BEGIN_DECLS
> + #mesondefine GDK_WINDOWING_WAYLAND
> + #mesondefine GDK_WINDOWING_WIN32
> + #mesondefine GDK_WINDOWING_QUARTZ
> ++#mesondefine GDK_WITH_OPENGL
> + 
> + G_END_DECLS
> + 
> +diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
> +index 748f54860c..04ef2c09d4 100644
> +--- a/gdk/gdkdisplay.c
> ++++ b/gdk/gdkdisplay.c
> +@@ -2420,7 +2420,11 @@ gboolean
> + gdk_display_make_gl_context_current (GdkDisplay   *display,
> +                                      GdkGLContext *context)
> + {
> ++#ifdef HAVE_OPENGL
> +   return GDK_DISPLAY_GET_CLASS (display)->make_gl_context_current (display, context);
> ++#else
> ++  return FALSE;
> ++#endif
> + }
> + 
> + GdkRenderingMode
> +diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
> +index 9690077cc2..55f85ef605 100644
> +--- a/gdk/gdkgl.c
> ++++ b/gdk/gdkgl.c
> +@@ -26,7 +26,9 @@
> + # include "win32/gdkwin32.h"
> + #endif
> + 
> ++#ifdef HAVE_OPENGL
> + #include <epoxy/gl.h>
> ++#endif
> + #include <math.h>
> + #include <string.h>
> + 
> +@@ -40,6 +42,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *surface,
> +                                g_object_ref (window),  g_object_unref);
> + }
> + 
> ++#ifdef HAVE_OPENGL
> + static const char *
> + get_vertex_type_name (int type)
> + {
> +@@ -212,6 +215,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint_data)
> +       glUseProgram (paint_data->current_program->program);
> +     }
> + }
> ++#endif
> + 
> + void
> + gdk_gl_texture_quads (GdkGLContext *paint_context,
> +@@ -220,6 +224,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
> +                       GdkTexturedQuad *quads,
> +                       gboolean flip_colors)
> + {
> ++#ifdef HAVE_OPENGL
> +   GdkGLContextPaintData *paint_data  = gdk_gl_context_get_paint_data (paint_context);
> +   GdkGLContextProgram *program;
> +   GdkWindow *window = gdk_gl_context_get_window (paint_context);
> +@@ -293,6 +298,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
> + 
> +   glDisableVertexAttribArray (program->position_location);
> +   glDisableVertexAttribArray (program->uv_location);
> ++#endif
> + }
> + 
> + /* x,y,width,height describes a rectangle in the gl render buffer
> +@@ -341,6 +347,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
> +                         int                   width,
> +                         int                   height)
> + {
> ++#ifdef HAVE_OPENGL
> +   GdkGLContext *paint_context;
> +   cairo_surface_t *image;
> +   cairo_matrix_t matrix;
> +@@ -718,6 +725,7 @@ out:
> +   if (clip_region)
> +     cairo_region_destroy (clip_region);
> + 
> ++#endif
> + }
> + 
> + /* This is always called with the paint context current */
> +@@ -725,6 +733,7 @@ void
> + gdk_gl_texture_from_surface (cairo_surface_t *surface,
> + 			     cairo_region_t  *region)
> + {
> ++#ifdef HAVE_OPENGL
> +   GdkGLContext *paint_context;
> +   cairo_surface_t *image;
> +   double device_x_offset, device_y_offset;
> +@@ -825,4 +834,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
> + 
> +   glDisable (GL_SCISSOR_TEST);
> +   glDeleteTextures (1, &texture_id);
> ++#endif
> + }
> +diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
> +index 3b23639e1c..1f04f8e0b2 100644
> +--- a/gdk/gdkglcontext.c
> ++++ b/gdk/gdkglcontext.c
> +@@ -85,7 +85,9 @@
> + #include "gdkintl.h"
> + #include "gdk-private.h"
> + 
> ++#ifdef HAVE_OPENGL
> + #include <epoxy/gl.h>
> ++#endif
> + 
> + typedef struct {
> +   GdkDisplay *display;
> +@@ -243,6 +245,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
> +                                int              height,
> +                                guint            texture_target)
> + {
> ++#ifdef HAVE_OPENGL
> +   GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
> + 
> +   g_return_if_fail (GDK_IS_GL_CONTEXT (context));
> +@@ -286,6 +289,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
> +             glTexSubImage2D (texture_target, 0, 0, i, width, 1, GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV, (unsigned char*) data + (i * stride));
> +         }
> +     }
> ++#endif
> + }
> + 
> + static gboolean
> +@@ -774,6 +778,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
> + static void
> + gdk_gl_context_check_extensions (GdkGLContext *context)
> + {
> ++#ifdef HAVE_OPENGL
> +   GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
> +   gboolean has_npot, has_texture_rectangle;
> + 
> +@@ -853,6 +858,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
> +                        priv->use_texture_rectangle ? "yes" : "no"));
> + 
> +   priv->extensions_checked = TRUE;
> ++#endif
> + }
> + 
> + /**
> +diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
> +index 727b0cf1f4..d4d91b0d16 100644
> +--- a/gdk/gdkwindow.c
> ++++ b/gdk/gdkwindow.c
> +@@ -45,7 +45,9 @@
> + 
> + #include <math.h>
> + 
> ++#ifdef HAVE_OPENGL
> + #include <epoxy/gl.h>
> ++#endif
> + 
> + /* for the use of round() */
> + #include "fallback-c89.c"
> +@@ -2844,6 +2846,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
> + {
> +   GError *internal_error = NULL;
> + 
> ++#ifndef HAVE_OPENGL
> ++  g_set_error_literal (error, GDK_GL_ERROR,
> ++                       GDK_GL_ERROR_NOT_AVAILABLE,
> ++                       _("GL support disabled with --disable-opengl"));
> ++  return NULL;
> ++#endif
> ++
> +   if (_gdk_gl_flags & GDK_GL_DISABLE)
> +     {
> +       g_set_error_literal (error, GDK_GL_ERROR,
> +@@ -2979,6 +2988,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
> +         }
> +       else
> +         {
> ++#ifdef HAVE_OPENGL
> + 	  gdk_gl_context_make_current (context);
> +           /* With gl we always need a surface to combine the gl
> +              drawing with the native drawing. */
> +@@ -2993,6 +3003,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
> +           glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
> + 
> +           glViewport (0, 0, ww, wh);
> ++#endif
> +         }
> +     }
> + 
> +@@ -3056,6 +3067,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
> + 
> +           gdk_gl_context_make_current (window->gl_paint_context);
> + 
> ++#ifdef HAVE_OPENGL
> +           if (!cairo_region_is_empty (opaque_region))
> +             gdk_gl_texture_from_surface (window->current_paint.surface,
> +                                          opaque_region);
> +@@ -3066,6 +3078,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
> +                                            window->current_paint.need_blend_region);
> +               glDisable(GL_BLEND);
> +             }
> ++#endif
> + 
> +           cairo_region_destroy (opaque_region);
> + 
> +diff --git a/gdk/meson.build b/gdk/meson.build
> +index 4bb1bf2b6c..69c7abf15c 100644
> +--- a/gdk/meson.build
> ++++ b/gdk/meson.build
> +@@ -166,6 +166,7 @@ gdkconfig_cdata.set('GDK_WINDOWING_WAYLAND', wayland_enabled)
> + gdkconfig_cdata.set('GDK_WINDOWING_WIN32', win32_enabled)
> + gdkconfig_cdata.set('GDK_WINDOWING_BROADWAY', broadway_enabled)
> + gdkconfig_cdata.set('GDK_WINDOWING_QUARTZ', quartz_enabled)
> ++gdkconfig_cdata.set('GDK_WITH_OPENGL', opengl_enabled)
> + 
> + gdkconfig = configure_file(
> +   input  : 'gdkconfig.h.meson',
> +diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
> +index 32b1f24434..d73eee604a 100644
> +--- a/gdk/x11/Makefile.am
> ++++ b/gdk/x11/Makefile.am
> +@@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES = 	\
> + 	gdkeventtranslator.c	\
> + 	gdkeventtranslator.h	\
> + 	gdkgeometry-x11.c  	\
> +-	gdkglcontext-x11.c	\
> +-	gdkglcontext-x11.h	\
> + 	gdkkeys-x11.c		\
> + 	gdkmain-x11.c		\
> + 	gdkmonitor-x11.c	\
> +diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
> +index 7e08f472cc..30fd7b6089 100644
> +--- a/gdk/x11/gdkdisplay-x11.c
> ++++ b/gdk/x11/gdkdisplay-x11.c
> +@@ -37,7 +37,9 @@
> + #include "gdkdisplay-x11.h"
> + #include "gdkprivate-x11.h"
> + #include "gdkscreen-x11.h"
> ++#ifdef HAVE_OPENGL
> + #include "gdkglcontext-x11.h"
> ++#endif
> + #include "gdk-private.h"
> + #include "gdkprofilerprivate.h"
> + 
> +@@ -3191,7 +3193,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
> +   display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
> +   display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
> + 
> +-  display_class->make_gl_context_current = gdk_x11_display_make_gl_context_current;
> ++#ifdef HAVE_OPENGL
> ++   display_class->make_gl_context_current = gdk_x11_display_make_gl_context_current;
> ++#endif
> + 
> +   display_class->get_default_seat = gdk_x11_display_get_default_seat;
> + 
> +diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
> +index 81479d81f4..3c8c5c02ff 100644
> +--- a/gdk/x11/gdkvisual-x11.c
> ++++ b/gdk/x11/gdkvisual-x11.c
> +@@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
> +   /* If GL is available we want to pick better default/rgba visuals,
> +      as we care about glx details such as alpha/depth/stencil depth,
> +      stereo and double buffering */
> ++  /* update_visuals_for_gl() will end up calling epoxy GLX api which
> ++     will exit if libgl is not there: so only do this if we know GL
> ++     is available */
> ++#ifdef HAVE_GLX
> +   _gdk_x11_screen_update_visuals_for_gl (screen);
> ++#endif
> + }
> + 
> + gint
> +diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
> +index 194bc82e29..0302bb68d4 100644
> +--- a/gdk/x11/gdkwindow-x11.c
> ++++ b/gdk/x11/gdkwindow-x11.c
> +@@ -36,7 +36,9 @@
> + #include "gdkasync.h"
> + #include "gdkeventsource.h"
> + #include "gdkdisplay-x11.h"
> ++#ifdef HAVE_OPENGL
> + #include "gdkglcontext-x11.h"
> ++#endif
> + #include "gdkprivate-x11.h"
> + #include "gdk-private.h"
> + 
> +@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
> +   impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
> +   impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
> +   impl_class->show_window_menu = gdk_x11_window_show_window_menu;
> ++#ifdef HAVE_OPENGL
> +   impl_class->create_gl_context = gdk_x11_window_create_gl_context;
> +   impl_class->invalidate_for_new_frame = gdk_x11_window_invalidate_for_new_frame;
> ++#endif
> +   impl_class->get_unscaled_size = gdk_x11_window_get_unscaled_size;
> + }
> +diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
> +index edb0ea7dbf..a317d61cca 100644
> +--- a/gdk/x11/gdkx-autocleanups.h
> ++++ b/gdk/x11/gdkx-autocleanups.h
> +@@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_object_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Display, g_object_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DisplayManager, g_object_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DragContext, g_object_unref)
> ++#ifdef HAVE_OPENGL
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11GLContext, g_object_unref)
> ++#endif
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
> + G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
> +diff --git a/gdk/x11/meson.build b/gdk/x11/meson.build
> +index 754ae0a615..ffbceb60b4 100644
> +--- a/gdk/x11/meson.build
> ++++ b/gdk/x11/meson.build
> +@@ -14,7 +14,6 @@ gdk_x11_sources = files(
> +   'gdkeventsource.c',
> +   'gdkeventtranslator.c',
> +   'gdkgeometry-x11.c',
> +-  'gdkglcontext-x11.c',
> +   'gdkkeys-x11.c',
> +   'gdkmain-x11.c',
> +   'gdkproperty-x11.c',
> +@@ -29,6 +28,10 @@ gdk_x11_sources = files(
> +   'gdkmonitor-x11.c',
> + )
> + 
> ++if opengl_enabled
> ++  gdk_x11_sources += files('gdkglcontext-x11.c')
> ++endif
> ++
> + gdk_x11_public_headers = files(
> +   'gdkx-autocleanups.h',
> +   'gdkx11applaunchcontext.h',
> +diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
> +index 802303ea9f..6439d7745d 100644
> +--- a/gtk/gtkglarea.c
> ++++ b/gtk/gtkglarea.c
> +@@ -29,7 +29,9 @@
> + #include "gtkprivate.h"
> + #include "gtkrender.h"
> + 
> ++#ifdef HAVE_OPENGL
> + #include <epoxy/gl.h>
> ++#endif
> + 
> + /**
> +  * SECTION:gtkglarea
> +@@ -369,9 +371,12 @@ gtk_gl_area_real_create_context (GtkGLArea *area)
> + static void
> + gtk_gl_area_resize (GtkGLArea *area, int width, int height)
> + {
> ++#ifdef HAVE_OPENGL
> +   glViewport (0, 0, width, height);
> ++#endif
> + }
> + 
> ++#ifdef HAVE_OPENGL
> + /*
> +  * Creates all the buffer objects needed for rendering the scene
> +  */
> +@@ -483,6 +488,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
> + 
> +   priv->needs_render = TRUE;
> + }
> ++#endif
> + 
> + /**
> +  * gtk_gl_area_attach_buffers:
> +@@ -501,6 +507,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
> + void
> + gtk_gl_area_attach_buffers (GtkGLArea *area)
> + {
> ++#ifdef HAVE_OPENGL
> +   GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
> + 
> +   g_return_if_fail (GTK_IS_GL_AREA (area));
> +@@ -533,11 +540,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
> +         glFramebufferRenderbuffer (GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT,
> +                                    GL_RENDERBUFFER, priv->depth_stencil_buffer);
> +     }
> ++#endif
> + }
> + 
> + static void
> + gtk_gl_area_delete_buffers (GtkGLArea *area)
> + {
> ++#ifdef HAVE_OPENGL
> +   GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
> + 
> +   if (priv->context == NULL)
> +@@ -569,6 +578,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
> +       glDeleteFramebuffers (1, &priv->frame_buffer);
> +       priv->frame_buffer = 0;
> +     }
> ++#endif
> + }
> + 
> + static void
> +@@ -679,6 +689,7 @@ gtk_gl_area_draw (GtkWidget *widget,
> +   GtkGLArea *area = GTK_GL_AREA (widget);
> +   GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
> +   gboolean unused;
> ++#ifdef HAVE_OPENGL
> +   int w, h, scale;
> +   GLenum status;
> + 
> +@@ -736,6 +747,14 @@ gtk_gl_area_draw (GtkWidget *widget,
> +     }
> + 
> +   return TRUE;
> ++#else
> ++  if (priv->error != NULL)
> ++      gtk_gl_area_draw_error_screen (area,
> ++                                     cr,
> ++                                     gtk_widget_get_allocated_width (widget),
> ++                                     gtk_widget_get_allocated_height (widget));
> ++  return FALSE;
> ++#endif
> + }
> + 
> + static gboolean
> +diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
> +index 4fd0c3039c..a8e59ed077 100644
> +--- a/gtk/inspector/general.c
> ++++ b/gtk/inspector/general.c
> +@@ -33,8 +33,10 @@
> + 
> + #ifdef GDK_WINDOWING_X11
> + #include "x11/gdkx.h"
> ++#ifdef HAVE_OPENGL
> + #include <epoxy/glx.h>
> + #endif
> ++#endif
> + 
> + #ifdef GDK_WINDOWING_WIN32
> + #include "win32/gdkwin32.h"
> +@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
> +   gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
> + }
> + 
> ++#ifdef HAVE_OPENGL
> + #ifdef GDK_WINDOWING_X11
> + static void
> + append_glx_extension_row (GtkInspectorGeneral *gen,
> +@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
> +   add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_glx_extension (dpy, 0, ext), 0);
> + }
> + #endif
> ++#endif
> + 
> + #ifdef GDK_WINDOWING_WAYLAND
> + static void
> +@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
> + static void
> + init_gl (GtkInspectorGeneral *gen)
> + {
> ++#ifdef HAVE_OPENGL
> + #ifdef GDK_WINDOWING_X11
> +   if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
> +     {
> +@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
> +     }
> +   else
> + #endif
> ++#endif
> + #ifdef GDK_WINDOWING_WAYLAND
> +   if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
> +     {
> +diff --git a/meson.build b/meson.build
> +index f2e63a8655..eea5347930 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -136,6 +136,7 @@ wayland_enabled        = get_option('wayland_backend')
> + broadway_enabled       = get_option('broadway_backend')
> + quartz_enabled         = get_option('quartz_backend')
> + win32_enabled          = get_option('win32_backend')
> ++opengl_enabled         = get_option('opengl')
> + 
> + os_unix   = false
> + os_linux  = false
> +@@ -450,7 +451,7 @@ pangocairo_dep = dependency('pangocairo', version: cairo_req,
> +                             fallback : ['pango', 'libpangocairo_dep'])
> + pixbuf_dep     = dependency('gdk-pixbuf-2.0', version: gdk_pixbuf_req,
> +                             fallback : ['gdk-pixbuf', 'gdkpixbuf_dep'])
> +-epoxy_dep      = dependency('epoxy', version: epoxy_req,
> ++epoxy_dep      = dependency('epoxy', version: epoxy_req, required: opengl_enabled,
> +                             fallback: ['libepoxy', 'libepoxy_dep'])
> + atk_dep        = dependency('atk', version: atk_req,
> +                             fallback : ['atk', 'libatk_dep'])
> +@@ -496,6 +497,10 @@ if tracker3_enabled
> +   endif
> + endif
> + 
> ++if opengl_enabled
> ++  cdata.set('HAVE_OPENGL', 1)
> ++endif
> ++
> + if iso_codes_dep.found()
> +   cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_pkgconfig_variable('prefix'))
> + else
> +@@ -926,9 +931,15 @@ else
> +   gio_packages = ['gio-2.0', glib_req]
> + endif
> + 
> ++if opengl_enabled
> ++  epoxy_packages = ['epoxy', epoxy_req]
> ++else
> ++  epoxy_packages = []
> ++endif
> ++
> + pkgconf.set('GDK_PRIVATE_PACKAGES',
> +             ' '.join(gio_packages + x11_pkgs + wayland_pkgs + cairo_backends +
> +-                     ['epoxy', epoxy_req] + cloudproviders_packages +
> ++                     epoxy_packages + cloudproviders_packages +
> +                      ['fribidi', fribidi_req]))
> + 
> + gtk_packages = ' '.join([
> +@@ -942,7 +953,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
> + # Requires.private
> + pc_gdk_extra_libs += cairo_libs
> + 
> +-gtk_private_packages = atk_pkgs + wayland_pkgs + ['epoxy', epoxy_req, 'fribidi', fribidi_req]
> ++gtk_private_packages = atk_pkgs + wayland_pkgs + epoxy_packages + ['fribidi', fribidi_req]
> + if wayland_enabled or x11_enabled
> +   gtk_private_packages += ['pangoft2']
> + endif
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 94099aa01e..8bd096896d 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -19,6 +19,8 @@ option('profiler', type: 'boolean', value: false,
> +   description : 'Enable profiler support')
> + option('tracker3', type: 'boolean', value: false,
> +   description : 'Enable Tracker3 filechooser search')
> ++option('opengl', type: 'boolean', value: true,
> ++  description : 'Enable use of GL')
> + 
> + # Print backends
> + option('print_backends', type : 'string', value : 'auto',
> +diff --git a/tests/meson.build b/tests/meson.build
> +index 586fe2f45e..6ecf317dde 100644
> +--- a/tests/meson.build
> ++++ b/tests/meson.build
> +@@ -5,7 +5,6 @@ gtk_tests = [
> +   ['scrolling-performance', ['frame-stats.c', 'variable.c']],
> +   ['blur-performance', ['../gtk/gtkcairoblur.c']],
> +   ['flicker'],
> +-  ['gdkgears', ['gtkgears.c']],
> +   ['listmodel'],
> +   ['motion-compression'],
> +   ['styleexamples'],
> +@@ -54,7 +53,6 @@ gtk_tests = [
> +   ['testfullscreen'],
> +   ['testgeometry'],
> +   ['testgiconpixbuf'],
> +-  ['testglblending', ['gtkgears.c']],
> +   ['testgmenu'],
> +   ['testgrid'],
> +   ['testgrouping'],
> +@@ -137,6 +135,13 @@ if x11_enabled
> +   ]
> + endif
> + 
> ++if opengl_enabled
> ++  gtk_tests += [
> ++    ['gdkgears', ['gtkgears.c']],
> ++    ['testglblending', ['gtkgears.c']],
> ++  ]
> ++endif
> ++
> + if os_linux
> +   gtk_tests += [['testfontchooserdialog']]
> + endif
> +diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-finalize.c
> +index 24540e313f..e0f863ab6a 100644
> +--- a/testsuite/gtk/objects-finalize.c
> ++++ b/testsuite/gtk/objects-finalize.c
> +@@ -116,7 +116,9 @@ main (int argc, char **argv)
> + 	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
> + 	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
> + 	  all_types[i] != GDK_TYPE_X11_DISPLAY_MANAGER &&
> ++#ifdef HAVE_OPENGL
> + 	  all_types[i] != GDK_TYPE_X11_GL_CONTEXT &&
> ++#endif
> + #endif
> + 	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbuf_loader_close() */
> + 	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
> index 3a63ef57fcf..7c6ea104c7b 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
> @@ -3,9 +3,9 @@ require gtk+3.inc
>  MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  
>  SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
> -           file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
> -           file://0003-Add-disable-opengl-configure-option.patch \
> -           file://link_fribidi.patch \
> +           file://meson.build;subdir=${S}/gdk/wayland/cursor \
> +           file://buildpaths.patch \
> +           file://opengl.patch \
>             "
>  SRC_URI[sha256sum] = "ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06965629fef60bd1"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174540): https://lists.openembedded.org/g/openembedded-core/message/174540
> Mute This Topic: https://lists.openembedded.org/mt/95647794/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

