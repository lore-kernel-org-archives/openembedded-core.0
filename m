Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1D67705E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 13:22:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Oct 2015 06:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,712,1437462000"; d="scan'208";a="585320314"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2015 06:22:37 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 16:25:31 +0300
Message-Id: <5527fe6c68bc5b1d18917fc58adca19706d0ef73.1445432850.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445432850.git.jussi.kukkonen@intel.com>
References: <cover.1445432850.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 1/1] gtk+3: Do not try to initialize GL without libgl
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
X-List-Received-Date: Wed, 21 Oct 2015 13:22:38 -0000

Gdk initialization ends up calling epoxy GLX api, which calls exit()
if libGL.so.1 is not present. In practice this prevents all GTK+
applications from starting if GLX is not present.

If opengl and x11 distro features are set, make gtk+3 RDEPEND on libgl.
If opengl and x11 distro features are not set, use #ifdef to prevent
the GL initialization.

Remove libgl dependency from gtk3-demo: it can now run without
libgl (although trying to run the glarea demo will exit in that case).

[YOCTO #8529]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  4 +-
 ...Do-not-try-to-initialize-GL-without-libGL.patch | 60 ++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb            |  1 +
 3 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 54f84fc..22a40d8 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -32,9 +32,11 @@ EXTRA_OECONF += " \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "opengl x11", "glx", "", d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
 
 PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon virtual/mesa"
 
 do_install_append() {
@@ -57,7 +59,7 @@ FILES_${PN}-demo = "${bindir}/gtk3-demo \
 
 # The demo uses PNG files and mime type sniffing, so ensure that these
 # dependencies are present.
-RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info libgl"
+RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
 
 FILES_${PN} = "${bindir}/gtk-update-icon-cache-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
diff --git a/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch b/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch
new file mode 100644
index 0000000..c8c480c
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch
@@ -0,0 +1,60 @@
+From fc22058a10db913534f11348f86681fe9e1838e5 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 16 Oct 2015 16:35:16 +0300
+Subject: [PATCH] Do not try to initialize GL without libGL
+
+_gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys
+GLX api which will exit() if libGL.so.1 is not present. We do not
+want that to happen and we don't want every app to have to set
+"GDK_GL=disabled" environment variable: so use #ifdef set based on
+opengl distro feature.
+
+Upstream is not interested in the fix as it is: Either epoxy should be
+fixed (to not exit) or GTK+ possibly could do some additional probing
+before calling epoxy APIs.
+
+Upstream-Status: Denied
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac            | 7 +++++++
+ gdk/x11/gdkvisual-x11.c | 5 +++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 729a62e..58cc1ac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -328,6 +328,13 @@ AC_ARG_ENABLE(mir-backend,
+                               [enable the Mir gdk backend])],
+ 			      [backend_set=yes])
+ 
++AC_ARG_ENABLE(glx,
++              [AS_HELP_STRING([--enable-glx],
++                              [When enabled Gdk will try to initialize GLX])])
++AS_IF([test "x$enable_glx" != "xno"], [
++  AC_DEFINE([HAVE_GLX], [], [GLX will be available at runtime])
++])
++
+ if test -z "$backend_set"; then
+   if test "$platform_win32" = yes; then
+     enable_win32_backend=yes
+diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
+index f3b062d..c8243f4 100644
+--- a/gdk/x11/gdkvisual-x11.c
++++ b/gdk/x11/gdkvisual-x11.c
+@@ -345,7 +345,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
+   /* If GL is available we want to pick better default/rgba visuals,
+      as we care about glx details such as alpha/depth/stencil depth,
+      stereo and double buffering */
++  /* update_visuals_for_gl() will end up calling epoxy GLX api which
++     will exit if libgl is not there: so only do this if we know GL
++     is available */
++#ifdef HAVE_GLX
+   _gdk_x11_screen_update_visuals_for_gl (screen);
++#endif
+ }
+ 
+ gint
+-- 
+2.1.4
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb b/meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb
index 1d736a4..381e607 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.16.6.bb
@@ -5,6 +5,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
            file://Dont-force-csd.patch \
+           file://Do-not-try-to-initialize-GL-without-libGL.patch \
           "
 
 SRC_URI[md5sum] = "fc59e5c8b5a4585b60623dd708df400b"
-- 
2.1.4


