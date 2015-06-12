Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DBEC975999
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 13:11:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Jun 2015 06:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,602,1427785200"; d="scan'208";a="507220787"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2015 06:11:18 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jun 2015 16:11:41 +0300
Message-Id: <90713bfda57500b6e4348ed1c69c66552560c2c3.1434114213.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
References: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434114213.git.jussi.kukkonen@intel.com>
References: <cover.1434114213.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 2/6] gtk-update-icon-cache-native: Upgrade, add binary
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
X-List-Received-Date: Fri, 12 Jun 2015 13:11:52 -0000

* Upgrade to GTK+ 3.16.3
* Add gtk-encode-symbolic-svg binary: it is used by icon themes
  (e.g. Adwaita) to generate png versions of svg icons.
* Depend on librsvg-native for gtk-encode-symbolic-svg
* Add a patch that removes Gdk dependency from gtk-encode-symbolic-svg:
  this way the native build stays slim.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gtk+/gtk-update-icon-cache-native_3.16.3.bb    |  63 +++++++++++++
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |  47 ----------
 ...k-dependency-from-gtk-encode-symbolic-svg.patch | 102 +++++++++++++++++++++
 3 files changed, 165 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch

diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
new file mode 100644
index 0000000..f4077d5
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
@@ -0,0 +1,63 @@
+SUMMARY = "Native icon utils for GTK+"
+DESCRIPTION = "gtk-update-icon-cache and gtk-encode-symbolic-svg built from GTK+ natively, for build time and on-host postinst script execution."
+SECTION = "libs"
+
+DEPENDS = "glib-2.0-native gdk-pixbuf-native librsvg-native"
+
+LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
+          file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
+SRC_URI[md5sum] = "af22a1a753ea9b182babfed9d8b38228"
+SRC_URI[sha256sum] = "2943fd4a6b02c2a9b2edd231c1d8f7a1d2f8d36996f14310d34f503dca9ebea4"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
+                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
+                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
+
+S = "${WORKDIR}/gtk+-${PV}"
+
+inherit pkgconfig native
+
+PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
+
+do_configure() {
+	# Quite ugly but defines enough to compile the tools.
+	if ! test -f gtk/config.h; then
+		echo "#define GETTEXT_PACKAGE \"gtk30\"" >> gtk/config.h
+		echo "#define HAVE_UNISTD_H 1" >> gtk/config.h
+		echo "#define HAVE_FTW_H 1" >> gtk/config.h
+	fi
+	if ! test -f gdk/config.h; then
+		touch gdk/config.h
+	fi
+}
+
+do_compile() {
+	${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \
+		${S}/gtk/updateiconcache.c \
+		$(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
+		-o gtk-update-icon-cache
+
+	${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \
+		${S}/gtk/encodesymbolic.c \
+		$(${PKG_CONFIG_FOR_BUILD} --cflags --libs gio-2.0 gdk-pixbuf-2.0) \
+		-o gtk-encode-symbolic-svg
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
+	install -m 0755 ${B}/gtk-encode-symbolic-svg ${D}${bindir}
+
+	create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
+		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
+	create_wrapper ${D}/${bindir}/gtk-encode-symbolic-svg \
+		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
+}
+
+# Prevent bitbake from optimizing away the native librsvg sysroot population
+do_populate_sysroot_setscene[depends] += "librsvg-native:do_populate_sysroot_setscene"
diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
deleted file mode 100644
index 73b7644..0000000
--- a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "gtk-update-icon-cache built natively"
-DESCRIPTION = "Just gtk-update-icon-cache built from GTK+ natively, for on-host postinst script execution."
-SECTION = "libs"
-
-DEPENDS = "gdk-pixbuf-native"
-
-LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
-                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
-
-SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz"
-SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
-SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
-
-S = "${WORKDIR}/gtk+-${PV}"
-
-inherit pkgconfig native
-
-PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
-
-do_configure() {
-	# Quite ugly but defines enough to compile the tool.
-	if ! test -f gtk/config.h; then
-		echo "#define GETTEXT_PACKAGE \"gtk30\"" >> gtk/config.h
-		echo "#define HAVE_UNISTD_H 1" >> gtk/config.h
-		echo "#define HAVE_FTW_H 1" >> gtk/config.h
-
-	fi
-}
-
-do_compile() {
-	${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} ${S}/gtk/updateiconcache.c \
-	$(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
-		-o gtk-update-icon-cache 
-}
-
-do_install() {
-	install -d ${D}${bindir}
-        install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
-
-	create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
-		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
-
-}
diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch b/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
new file mode 100644
index 0000000..237f803
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
@@ -0,0 +1,102 @@
+From 4d09ff324419fe4e671233044e424378da53969b Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 9 Jun 2015 14:20:30 +0300
+Subject: [PATCH] Remove Gdk-dependency from gtk-encode-symbolic-svg
+
+Building gtk-encode-symbolic-svg without building Gdk is useful
+as only the icon tools are needed on the native build: this makes
+native build much faster and requires much less dependencies.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ gtk/encodesymbolic.c | 36 ++++++++++--------------------------
+ 1 file changed, 10 insertions(+), 26 deletions(-)
+
+diff --git a/gtk/encodesymbolic.c b/gtk/encodesymbolic.c
+index 9f7d015..1f07563 100644
+--- a/gtk/encodesymbolic.c
++++ b/gtk/encodesymbolic.c
+@@ -19,7 +19,6 @@
+ 
+ #include <glib.h>
+ #include <gdk-pixbuf/gdk-pixdata.h>
+-#include <gdk/gdk.h>
+ #include <glib/gi18n.h>
+ 
+ #ifdef HAVE_UNISTD_H
+@@ -43,30 +42,18 @@ static GdkPixbuf *
+ load_symbolic_svg (char *file_data, gsize file_len,
+                    int width,
+                    int height,
+-                   const GdkRGBA  *fg,
+-                   const GdkRGBA  *success_color,
+-                   const GdkRGBA  *warning_color,
+-                   const GdkRGBA  *error_color,
++                   const char *css_fg,
++                   const char *css_success,
++                   const char *css_warning,
++                   const char *css_error,
+                    GError        **error)
+ {
+   GInputStream *stream;
+   GdkPixbuf *pixbuf;
+-  gchar *css_fg;
+-  gchar *css_success;
+-  gchar *css_warning;
+-  gchar *css_error;
+   gchar *data;
+   gchar *svg_width, *svg_height;
+   gchar *escaped_file_data;
+ 
+-  css_fg = gdk_rgba_to_string (fg);
+-
+-  css_success = css_warning = css_error = NULL;
+-
+-  css_warning = gdk_rgba_to_string (warning_color);
+-  css_error = gdk_rgba_to_string (error_color);
+-  css_success = gdk_rgba_to_string (success_color);
+-
+   /* Fetch size from the original icon */
+   stream = g_memory_input_stream_new_from_data (file_data, file_len, NULL);
+   pixbuf = gdk_pixbuf_new_from_stream (stream, NULL, error);
+@@ -105,10 +92,6 @@ load_symbolic_svg (char *file_data, gsize file_len,
+                       "</svg>",
+                       NULL);
+   g_free (escaped_file_data);
+-  g_free (css_fg);
+-  g_free (css_warning);
+-  g_free (css_error);
+-  g_free (css_success);
+   g_free (svg_width);
+   g_free (svg_height);
+ 
+@@ -167,7 +150,8 @@ make_symbolic_pixbuf (char *file,
+                       GError        **error)
+ 
+ {
+-  GdkRGBA r = { 1,0,0,1}, g = {0,1,0,1};
++  const char r[] = "rgba(255,0,0,1)";
++  const char g[] = "rgba(0,255,0,1)";
+   GdkPixbuf *loaded;
+   GdkPixbuf *pixbuf;
+   int plane;
+@@ -196,10 +180,10 @@ make_symbolic_pixbuf (char *file,
+        * the "rest", as all color fractions should add up to 1.
+        */
+       loaded = load_symbolic_svg (file_data, file_len, width, height,
+-                                  &g,
+-                                  plane == 0 ? &r : &g,
+-                                  plane == 1 ? &r : &g,
+-                                  plane == 2 ? &r : &g,
++                                  g,
++                                  plane == 0 ? r : g,
++                                  plane == 1 ? r : g,
++                                  plane == 2 ? r : g,
+                                   error);
+       if (loaded == NULL)
+         return NULL;
+-- 
+2.1.4
+
-- 
2.1.4


