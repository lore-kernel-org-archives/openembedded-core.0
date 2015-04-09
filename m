Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C814372D74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:17:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2015 05:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="706187283"
Received: from heimdall.fi.intel.com ([10.237.72.168])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 05:16:56 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:16:27 +0300
Message-Id: <403461cbc38423d684894f0471993d858aafdcb5.1428577515.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
References: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1428577515.git.jussi.kukkonen@intel.com>
References: <cover.1428577515.git.jussi.kukkonen@intel.com>
Subject: [PATCH 7/7] gtk+3: Upgrade to 3.16.0
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
X-List-Received-Date: Thu, 09 Apr 2015 12:17:24 -0000

* Drop --disable-gtk2-dependency and the patch for
  gtk/native/Makefile.am: gtk-update-icon-cache is no longer used at
  build time and as a result the option was removed.
* Add dependency to libepoxy
* Add dependency to virtual/mesa for wayland-egl
* Package new binaries gtk3-icon-browser and gtk-encode-symbolic-svg
* Patch configure.ac to prevent include path poisoning

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc                  | 14 ++++-----
 ...ve-includedir-poisoning-from-configure.ac.patch | 34 ++++++++++++++++++++++
 .../gtk+/gtk+3/fix-flags-for-native.patch          | 33 ---------------------
 .../gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.0.bb}      |  6 ++--
 4 files changed, 44 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Remove-includedir-poisoning-from-configure.ac.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.0.bb} (73%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 3e36676..3823fb3 100644
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
diff --git a/meta/recipes-gnome/gtk+/gtk+3/Remove-includedir-poisoning-from-configure.ac.patch b/meta/recipes-gnome/gtk+/gtk+3/Remove-includedir-poisoning-from-configure.ac.patch
new file mode 100644
index 0000000..37cd724
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/Remove-includedir-poisoning-from-configure.ac.patch
@@ -0,0 +1,34 @@
+From b5091089aa9c48574563ec6fd61b22e18e584d6a Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 2 Apr 2015 16:16:41 +0300
+Subject: [PATCH] Remove includedir poisoning from configure.ac
+
+configure.ac tries to workaround pkg-config dropping the default include
+directories, but ends up poisoning the sysroot includedirs with system
+ones.
+
+Issue is filed upstream at
+https://bugzilla.gnome.org/show_bug.cgi?id=747445
+
+Upstream-Status: Submitted
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 38126da..a6c1058 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -348,8 +348,7 @@ backend_immodules=
+ have_gio_unix=no
+ GDK_BACKENDS=
+ GDK_EXTRA_LIBS=
+-# expoxy.pc has Cflags: -I${includedir}, but pkg-config swallows that :-(
+-GDK_EXTRA_CFLAGS="-I${prefix}/include"
++GDK_EXTRA_CFLAGS=
+ GDK_WINDOWING=
+ PANGO_PACKAGES="pango pangocairo"
+ 
+-- 
+2.1.4
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
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.16.0.bb
similarity index 73%
rename from meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.16.0.bb
index f4f1971..b7f5bc1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.12.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.16.0.bb
@@ -4,11 +4,11 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
-           file://fix-flags-for-native.patch \
+           file://Remove-includedir-poisoning-from-configure.ac.patch \
           "
 
-SRC_URI[md5sum] = "0d6d8f9f79132b3b47475d047b369b1c"
-SRC_URI[sha256sum] = "61d74eea74231b1ea4b53084a9d6fc9917ab0e1d71b69d92cbf60a4b4fb385d0"
+SRC_URI[md5sum] = "11c97ce2527956e0ddb5ad5b236e4572"
+SRC_URI[sha256sum] = "ce617318fe18092383cf6ed5d8c688a95a97f2d4c68481317a6a531e288c26ea"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.1.4


