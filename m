Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 734526A57D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:19 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id m46so1348340wev.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=Gmy6U30BD2FxZ5wjEbX1HqKUxUryictB3oNMVUryA8s=;
	b=VjNq9rP9EHC3TdSnUgCYBIw0M5iwBhx8CaIQ5bxwVkmD8VbFgucBbHra4ZZn/D3iLQ
	fLRCxehQn4hG0V6M5cOo0z2LsptYpV5n1VfxssyKtFUrlCfyvw8NxJYsLdpOocaxQA/n
	S6bYEVawR9WxZ1JmFiBbNv5NfQ+zmSAOtamcsdeQrWymnmTBEzNjsOaDtR8KgGltKn+o
	6LBt2AhUU2fuVuboE4zSaqHSLO3q9h2ITvfdm4VGaJkcewP1MvR6dKXy39jsBfBD0EO8
	79m4affrU0oZ+90rnD4ZO6gD+5o3zNHcqzEn4P7mulEd6TsLHIgueM7ehpCTqjq2Axpa
	3nEw==
X-Received: by 10.194.7.137 with SMTP id j9mr7589211wja.11.1370012960203;
	Fri, 31 May 2013 08:09:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:45 +0100
Message-Id: <c0f0bb25b5abdf0ca64d68495edc994c7d19b310.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmnZz1p+VhdVdigvjuFtzyhJJiX3Iiw5W/0hI1IqpvGG4zDlHGpZYbYh0+zL6Z0V6WrRmNo
Subject: [PATCH 09/11] gtk+3: split into .bb/.inc
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
X-List-Received-Date: Fri, 31 May 2013 15:09:19 -0000

I plan on introducing a git master version for automatically testing upstream
development, so this split makes things a lot easier.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc      |  102 +++++++++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb |  111 ++------------------------------
 2 files changed, 107 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3.inc

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
new file mode 100644
index 0000000..4742eb9
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -0,0 +1,102 @@
+SUMMARY = "Multi-platform toolkit for creating GUIs"
+DESCRIPTION = "GTK+ is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
+set of widgets, GTK+ is suitable for projects ranging from small one-off projects to complete application suites."
+HOMEPAGE = "http://www.gtk.org"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "libs"
+
+DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
+           docbook-utils-native gdk-pixbuf-native"
+
+LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
+
+inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings
+
+# This should be in autotools.bbclass, but until something elses uses it putting
+# it here avoids rebuilding everything.
+export PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
+
+do_configure_prepend() {
+    # Do this because the configure script is running ./libtool directly
+    ln -s ${TARGET_PREFIX}libtool libtool || true
+}
+
+# Forcibly disable the GTK+ 2 dependency as we don't want to natively build the
+# entire GTK+ stack, or need GTK+ 2 for gtk-update-icon-cache.
+EXTRA_OECONF += " \
+                 --disable-gtk2-dependency \
+                 --disable-glibtest \
+                 --disable-xinerama \
+                 --enable-modules \
+                 --disable-cups \
+                 --disable-introspection \
+"
+
+PACKAGECONFIG ??= "${@base_contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
+                   ${@base_contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
+
+PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
+PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon"
+
+do_install_append() {
+	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
+}
+
+PACKAGES =+ "${PN}-demo"
+LIBV = "3.0.0"
+
+FILES_${PN}-demo = "${bindir}/gtk3-demo \
+                    ${bindir}/gtk3-demo-application \
+                    ${bindir}/gtk3-widget-factory \
+                    ${datadir}/gtk-3.0/demo"
+
+# The demo uses PNG files and mime type sniffing, so ensure that these
+# dependencies are present.
+RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
+
+FILES_${PN} = "${bindir}/gtk-update-icon-cache-3.0 \
+               ${bindir}/gtk-query-immodules-3.0 \
+               ${bindir}/gtk-launch \
+               ${libdir}/lib*${SOLIBS} \
+               ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
+               ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
+               ${libdir}/gtk-3.0/modules/*.so"
+
+FILES_${PN}-dev += " \
+                    ${datadir}/gtk-3.0/gtkbuilder.rng \
+                    ${datadir}/gtk-3.0/include \
+                    ${libdir}/gtk-3.0/include \
+                    ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \
+                    ${libdir}/gtk-3.0/${LIBV}/immodules/*.la \
+                    ${libdir}/gtk-3.0/3.0.0/printbackends/*.la \
+                    ${libdir}/gtk-3.0/${LIBV}/engines/*.la \
+                    ${libdir}/gtk-3.0/modules/*.la \
+                    ${bindir}/gtk-builder-convert"
+
+FILES_${PN}-dbg += " \
+                    ${libdir}/gtk-3.0/${LIBV}/loaders/.debug \
+                    ${libdir}/gtk-3.0/${LIBV}/immodules/.debug \
+                    ${libdir}/gtk-3.0/${LIBV}/engines/.debug \
+                    ${libdir}/gtk-3.0/${LIBV}/printbackends/.debug \
+                    ${libdir}/gtk-3.0/modules/.debug"
+
+
+PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
+
+ALTERNATIVE_${PN} = "gtk-update-icon-cache"
+ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-3.0"
+
+python populate_packages_prepend () {
+    import os.path
+
+    gtk_libdir = d.expand('${libdir}/gtk-3.0/${LIBV}')
+    immodules_root = os.path.join(gtk_libdir, 'immodules')
+    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
+
+    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')))
+    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
+
+    if (d.getVar('DEBIAN_NAMES', 1)):
+        d.setVar('PKG_${PN}', 'libgtk-3.0')
+}
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 8f254fb..b9d4091 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -1,19 +1,4 @@
-SUMMARY = "Multi-platform toolkit for creating GUIs"
-DESCRIPTION = "GTK+ is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
-set of widgets, GTK+ is suitable for projects ranging from small one-off projects to complete application suites."
-HOMEPAGE = "http://www.gtk.org"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "libs"
-
-DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
-           docbook-utils-native gdk-pixbuf-native"
-
-LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
-                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
+require gtk+3.inc
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
@@ -23,95 +8,9 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
 SRC_URI[md5sum] = "8e878e18fc385f2b813419dc7b40a968"
 SRC_URI[sha256sum] = "1ca80c9c15a1df95d74cefb8c2afe4682ba272a4b489106f04877be2a7aff297"
 
-inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings
-
 S = "${WORKDIR}/gtk+-${PV}"
 
-# This should be in autotools.bbclass, but until something elses uses it putting
-# it here avoids rebuilding everything.
-export PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
-
-do_configure_prepend() {
-    # Do this because the configure script is running ./libtool directly
-    ln -s ${TARGET_PREFIX}libtool libtool || true
-}
-
-# Forcibly disable the GTK+ 2 dependency as we don't want to natively build the
-# entire GTK+ stack, or need GTK+ 2 for gtk-update-icon-cache.
-EXTRA_OECONF += " \
-                 --disable-gtk2-dependency \
-                 --disable-glibtest \
-                 --disable-xinerama \
-                 --enable-modules \
-                 --disable-cups \
-                 --disable-introspection \
-"
-
-PACKAGECONFIG ??= "${@base_contains("DISTRO_FEATURES", "x11", "x11", "", d)} \
-                   ${@base_contains("DISTRO_FEATURES", "wayland", "wayland", "", d)}"
-
-PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes"
-PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon"
-
-do_install_append() {
-	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
-}
-
-PACKAGES =+ "${PN}-demo"
-LIBV = "3.0.0"
-
-FILES_${PN}-demo = "${bindir}/gtk3-demo \
-                    ${bindir}/gtk3-demo-application \
-                    ${bindir}/gtk3-widget-factory \
-                    ${datadir}/gtk-3.0/demo"
-
-# The demo uses PNG files and mime type sniffing, so ensure that these
-# dependencies are present.
-RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
-
-FILES_${PN} = "${bindir}/gtk-update-icon-cache-3.0 \
-               ${bindir}/gtk-query-immodules-3.0 \
-               ${bindir}/gtk-launch \
-               ${libdir}/lib*${SOLIBS} \
-               ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
-               ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
-               ${libdir}/gtk-3.0/modules/*.so"
-
-FILES_${PN}-dev += " \
-                    ${datadir}/gtk-3.0/gtkbuilder.rng \
-                    ${datadir}/gtk-3.0/include \
-                    ${libdir}/gtk-3.0/include \
-                    ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \
-                    ${libdir}/gtk-3.0/${LIBV}/immodules/*.la \
-                    ${libdir}/gtk-3.0/3.0.0/printbackends/*.la \
-                    ${libdir}/gtk-3.0/${LIBV}/engines/*.la \
-                    ${libdir}/gtk-3.0/modules/*.la \
-                    ${bindir}/gtk-builder-convert"
-
-FILES_${PN}-dbg += " \
-                    ${libdir}/gtk-3.0/${LIBV}/loaders/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/immodules/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/engines/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/printbackends/.debug \
-                    ${libdir}/gtk-3.0/modules/.debug"
-
-
-PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
-
-ALTERNATIVE_${PN} = "gtk-update-icon-cache"
-ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-3.0"
-
-python populate_packages_prepend () {
-    import os.path
-
-    gtk_libdir = d.expand('${libdir}/gtk-3.0/${LIBV}')
-    immodules_root = os.path.join(gtk_libdir, 'immodules')
-    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
-
-    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s')))
-    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
-
-    if (d.getVar('DEBIAN_NAMES', 1)):
-        d.setVar('PKG_${PN}', 'libgtk-3.0')
-}
-
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
+                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
+                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
+                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
-- 
1.7.10.4


