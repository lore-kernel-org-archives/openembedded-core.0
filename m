Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 505F07568B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 14:22:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 16 Jun 2015 07:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="744449802"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 07:22:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 17:22:55 +0300
Message-Id: <9445f8200ebe59ee467ee0af8763fbc886f579d7.1434464336.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
References: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434464336.git.jussi.kukkonen@intel.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
Subject: [PATCH v3 3/6] gtk+3: Upgrade to 3.16.3
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
X-List-Received-Date: Tue, 16 Jun 2015 14:22:28 -0000

* Drop --disable-gtk2-dependency and the patch for
  gtk/native/Makefile.am: gtk-update-icon-cache is no longer used at
  build time and as a result the option was removed.
* Add dependency to libepoxy
* Add dependency to virtual/mesa for wayland-egl
* Package new binaries gtk3-icon-browser and gtk-encode-symbolic-svg
* Add a backported patch that allows server side window decorations
  in all cases
* RRECOMMEND adwaita-icon-theme-symbolic: GTK+ widgets expect a
  symbolic theme to be installed

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  15 +--
 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch | 118 +++++++++++++++++++++
 .../gtk+/gtk+3/fix-flags-for-native.patch          |  33 ------
 .../gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.3.bb}      |   6 +-
 4 files changed, 129 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.3.bb} (75%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 3e36676..721ec94 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 
 DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
-           docbook-utils-native gdk-pixbuf-native"
+           docbook-utils-native gdk-pixbuf-native libepoxy"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
@@ -22,10 +22,7 @@ do_configure_prepend() {
     ln -s ${TARGET_PREFIX}libtool libtool
 }
 
-# Forcibly disable the GTK+ 2 dependency as we don't want to natively build the
-# entire GTK+ stack, or need GTK+ 2 for gtk-update-icon-cache.
 EXTRA_OECONF += " \
-                 --disable-gtk2-dependency \
                  --disable-glibtest \
                  --disable-xinerama \
                  --enable-modules \
@@ -37,7 +34,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)}
                    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
 
 PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
-PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon"
+PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon virtual/mesa"
 
 do_install_append() {
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
@@ -48,12 +45,14 @@ LIBV = "3.0.0"
 
 FILES_${PN}-demo = "${bindir}/gtk3-demo \
                     ${bindir}/gtk3-demo-application \
+                    ${bindir}/gtk3-icon-browser \
                     ${bindir}/gtk3-widget-factory \
                     ${datadir}/gtk-3.0/demo \
                     ${datadir}/applications/gtk3-demo.desktop \
+                    ${datadir}/applications/gtk3-icon-browser.desktop \
                     ${datadir}/applications/gtk3-widget-factory.desktop \
-                    ${datadir}/icons/hicolor/*/apps/gtk3-demo.png \
-                    ${datadir}/icons/hicolor/*/apps/gtk3-widget-factory.png"
+                    ${datadir}/icons/hicolor/*/apps/gtk3-demo*.png \
+                    ${datadir}/icons/hicolor/*/apps/gtk3-widget-factory*.png"
 
 # The demo uses PNG files and mime type sniffing, so ensure that these
 # dependencies are present.
@@ -62,6 +61,7 @@ RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
 FILES_${PN} = "${bindir}/gtk-update-icon-cache-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
                ${bindir}/gtk-launch \
+               ${bindir}/gtk-encode-symbolic-svg \
                ${libdir}/lib*${SOLIBS} \
                ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
                ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
@@ -85,6 +85,7 @@ FILES_${PN}-dbg += " \
                     ${libdir}/gtk-3.0/${LIBV}/printbackends/.debug \
                     ${libdir}/gtk-3.0/modules/.debug"
 
+RRECOMMENDS_${PN} = "adwaita-icon-theme-symbolic"
 
 PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch b/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
new file mode 100644
index 0000000..32d8a84
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
@@ -0,0 +1,118 @@
+window: Check if we can use CSD before enabling them
+
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+From c5e5ee67490e7e7af56052d8f8beb75db002c2f1 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Wed, 3 Jun 2015 14:07:29 +0100
+Subject: window: Check if we can use CSD before enabling them
+
+The change in 03213b9509fc1df16c66194ea168aed6c15110e9 changed the rules
+as to when CSD can be enabled, but it also unconditionally enables CSD
+with the implicit assumption that client-side shadows were the real
+issue, and that we could work around that by drawing our own borders.
+This also means that setting a titlebar for a GtkWindow will enable CSD
+unconditionally.
+
+In reality, some window managers (like Matchbox) *only* support
+server-side decorations, and will ignore all hints to the contrary, to
+the point of drawing decorations at random locations on top of the
+window.
+
+Since CSD are enabled unconditionally, the GTK_CSD environment variable
+is also not a suitable escape hatch.
+
+In the grand tradition of asking ourselves if we should do something
+just because we can, we should split the environment checks from the
+checks on what the user requested; by doing that, we can also check
+when enabling client-side decorations, and ideally bail out if needed.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=750343
+
+diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
+index 423c6bd..9fe882f 100644
+--- a/gtk/gtkwindow.c
++++ b/gtk/gtkwindow.c
+@@ -4056,6 +4056,32 @@ gtk_window_supports_client_shadow (GtkWindow *window)
+   return TRUE;
+ }
+ 
++static gboolean
++gtk_window_can_use_csd (GtkWindow *window)
++{
++  const gchar *csd_env;
++
++#ifdef GDK_WINDOWING_BROADWAY
++  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
++    return TRUE;
++#endif
++
++#ifdef GDK_WINDOWING_WAYLAND
++  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
++    return TRUE;
++#endif
++
++#ifdef GDK_WINDOWING_MIR
++  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
++    return TRUE;
++#endif
++
++  csd_env = g_getenv ("GTK_CSD");
++
++  /* If GTK_CSD is unset we default to CSD support */
++  return csd_env == NULL || (strcmp (csd_env, "1") == 0);
++}
++
+ static void
+ gtk_window_enable_csd (GtkWindow *window)
+ {
+@@ -4063,6 +4089,10 @@ gtk_window_enable_csd (GtkWindow *window)
+   GtkWidget *widget = GTK_WIDGET (window);
+   GdkVisual *visual;
+ 
++  /* If the environment does not support CSD, then there's no point in enabling them */
++  if (!gtk_window_can_use_csd (window))
++    return;
++
+   /* We need a visual with alpha for client shadows */
+   if (priv->use_client_shadow)
+     {
+@@ -5839,7 +5869,6 @@ static gboolean
+ gtk_window_should_use_csd (GtkWindow *window)
+ {
+   GtkWindowPrivate *priv = window->priv;
+-  const gchar *csd_env;
+ 
+   if (priv->csd_requested)
+     return TRUE;
+@@ -5850,24 +5879,7 @@ gtk_window_should_use_csd (GtkWindow *window)
+   if (priv->type == GTK_WINDOW_POPUP)
+     return FALSE;
+ 
+-#ifdef GDK_WINDOWING_BROADWAY
+-  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
+-    return TRUE;
+-#endif
+-
+-#ifdef GDK_WINDOWING_WAYLAND
+-  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
+-    return TRUE;
+-#endif
+-
+-#ifdef GDK_WINDOWING_MIR
+-  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
+-    return TRUE;
+-#endif
+-
+-  csd_env = g_getenv ("GTK_CSD");
+-
+-  return (g_strcmp0 (csd_env, "1") == 0);
++  return gtk_window_can_use_csd (window);
+ }
+ 
+ static void
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch b/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
deleted file mode 100644
index 9ae1088..0000000
--- a/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5e16904f94b5f5961f8f6e75716e6d7d228de119 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 28 Mar 2014 03:10:12 +0000
-Subject: [PATCH] gtk/native/Makefile.am: unset target FLAGS for native build
-
-The target gtk+3 does a native build in its "native" directory, we need
-unset the target FLAGS for native build, otherwise, there might be build
-failures.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- gtk/native/Makefile.am | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/gtk/native/Makefile.am b/gtk/native/Makefile.am
-index 64899e9..a1c814a 100644
---- a/gtk/native/Makefile.am
-+++ b/gtk/native/Makefile.am
-@@ -3,6 +3,9 @@ AM_CFLAGS = @CFLAGS_FOR_BUILD@
- CPP = @CPP_FOR_BUILD@
- AM_CPPFLAGS = @CPPFLAGS_FOR_BUILD@
- AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
-+CFLAGS =
-+CPPFLAGS =
-+LDFLAGS =
- 
- if CROSS_COMPILING
- if !USE_EXTERNAL_ICON_CACHE
--- 
-1.8.3.4
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.16.3.bb
similarity index 75%
rename from meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.16.3.bb
index f4f1971..b73789e 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.16.3.bb
@@ -4,11 +4,11 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
-           file://fix-flags-for-native.patch \
+           file://Dont-force-csd.patch \
           "
 
-SRC_URI[md5sum] = "0d6d8f9f79132b3b47475d047b369b1c"
-SRC_URI[sha256sum] = "61d74eea74231b1ea4b53084a9d6fc9917ab0e1d71b69d92cbf60a4b4fb385d0"
+SRC_URI[md5sum] = "af22a1a753ea9b182babfed9d8b38228"
+SRC_URI[sha256sum] = "2943fd4a6b02c2a9b2edd231c1d8f7a1d2f8d36996f14310d34f503dca9ebea4"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.1.4


