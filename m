Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id C8E1D7D4F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:26:15 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a12so1361607wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kBefiptQd6hu/WM+WEeKUomAXzJEzm/GQ1lJJ026Rz0=;
	b=Z85TG68IUHAJrRQV8WEHuQmGN/9sXqKIuTiVVyHo+LqL37c20INxYbw33QxDikqrlW
	C23M9/PJF2RRegn3TIfQwI+9428niyUW58E8pKazF7j511rbbx9WkquBQp+aw9CjCp+z
	ClOxzgA+VFuFDz6/VE6P8DjQ85uoAFWsdut5LU1xE101xY7bHYTghwB8ic8blwjiU+tw
	WxNCO2dQleeqU3jyklmCFVFQTryKz6vVatwiq0R/flKXncJXZzYpAL8F0YVS8iDVrren
	pwUx/x03S3UGEIODo7Py8OxyabdUS+3yX5EeRf6eMDNmszxULQjgVADujz100O0BaMS/
	YN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kBefiptQd6hu/WM+WEeKUomAXzJEzm/GQ1lJJ026Rz0=;
	b=Um4M3ueSYebi/6VZEQaFV4x43JqsiQhaH5h8jv/miaRQh6RW8QEpBnHFQrmJ1swfDX
	ibgjDeMxOSEwknjnCTjZSCg/qGpRWslRNMYC+8vKwR6G4iGpzPZo1XD9/TzjyjRZLWJJ
	leHeuK/anhUQPOuyeOpijZuH+NeGefq8rxNakdj/Zr12UB1uNE+bh+7mxgmaLxuHjQNF
	s6U5c6DrgX9UR97Zfv+7QjuABZyy+auKaXgVHouhKJecQwqvgbMhL4gwc1nb8pLnvoMg
	TFH745wCWVN9XcnGwyONUot7cpZviqvEQ2WAdtAv2lK+2skYXrFj8CSFDxxlhf75b0Wg
	rovg==
X-Gm-Message-State: APjAAAW+l9GXI3mtlNgdi232uzckavTGGTWxmc6U82ThaAga/MPWnI53
	8EzhLchi7oDl8bDbcyx3C07F2YOotH8=
X-Google-Smtp-Source: APXvYqwJFKXnO3vSFScBPHnuZ0JEkjUeZ5nMRD+lpUOKduwzaV7gp3W6KO6orhLevTuxpu1tgLwn6w==
X-Received: by 2002:adf:d84d:: with SMTP id k13mr22989331wrl.154.1556105176067;
	Wed, 24 Apr 2019 04:26:16 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	s189sm35931055wmf.45.2019.04.24.04.26.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 04:26:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 13:26:09 +0200
Message-Id: <20190424112609.58224-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] gtk-doc.bbclass: unify option setting for meson-based recipes
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
X-List-Received-Date: Wed, 24 Apr 2019 11:26:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is done similarly to gobject-introspection work by Andreas Müller,
and allows dropping duplicate clutter from the recipes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/gtk-doc.bbclass                          | 11 +++++++++++
 meta/recipes-core/glib-2.0/glib.inc                   |  6 +-----
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb    |  6 ------
 .../gobject-introspection_1.60.1.bb                   |  2 ++
 meta/recipes-gnome/json-glib/json-glib_1.4.4.bb       |  7 -------
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc     |  6 +-----
 meta/recipes-graphics/pango/pango_1.42.4.bb           |  5 +----
 meta/recipes-support/atk/at-spi2-core_2.30.0.bb       |  6 +-----
 meta/recipes-support/atk/atk_2.30.0.bb                |  6 ------
 meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb    |  7 +------
 10 files changed, 18 insertions(+), 44 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 707d74d1083..7dd662bf868 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -10,13 +10,24 @@
 GTKDOC_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', \
                       bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d), 'False', d)}"
 
+# meson: default option name to enable/disable gtk-doc. This matches most
+# project's configuration. In doubts - check meson_options.txt in project's
+# source path.
+GTKDOC_MESON_OPTION ?= 'docs'
+GTKDOC_MESON_ENABLE_FLAG ?= 'true'
+GTKDOC_MESON_DISABLE_FLAG ?= 'false'
+
+# Auto enable/disable based on GTKDOC_ENABLED
 EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GTKDOC_ENABLED', 'True', '--enable-gtk-doc --enable-gtk-doc-html --disable-gtk-doc-pdf', \
                                                                                     '--disable-gtk-doc', d)} "
+EXTRA_OEMESON_prepend_class-target = "-D${GTKDOC_MESON_OPTION}=${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_MESON_ENABLE_FLAG}', '${GTKDOC_MESON_DISABLE_FLAG}', d)} "
 
 # When building native recipes, disable gtkdoc, as it is not necessary,
 # pulls in additional dependencies, and makes build times longer
 EXTRA_OECONF_prepend_class-native = "--disable-gtk-doc "
 EXTRA_OECONF_prepend_class-nativesdk = "--disable-gtk-doc "
+EXTRA_OEMESON_prepend_class-native = "-D${GTKDOC_MESON_OPTION}=${GTKDOC_MESON_DISABLE_FLAG} "
+EXTRA_OEMESON_prepend_class-nativesdk = "-D${GTKDOC_MESON_OPTION}=${GTKDOC_MESON_DISABLE_FLAG} "
 
 # Even though gtkdoc is disabled on -native, gtk-doc package is still
 # needed for m4 macros.
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 574bb38557b..69bcd0dd1d0 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,11 +30,7 @@ LEAD_SONAME = "libglib-2.0.*"
 
 inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
 
-GTKDOC_ENABLE_FLAG = "-Dgtk_doc=true"
-GTKDOC_DISABLE_FLAG = "-Dgtk_doc=false"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
-                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 # This avoids the need to depend on target python3, which in case of mingw is not even possible.
 # meson's python configuration pokes into python3 configuration, so this provides the native config to it.
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
index e423b996871..7fef697f3fa 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
@@ -34,14 +34,8 @@ SRC_URI[sha256sum] = "dd50973c7757bcde15de6bcd3a6d462a445efd552604ae6435a0532fbb
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-GTKDOC_ENABLE_FLAG = "-Ddocs=true"
-GTKDOC_DISABLE_FLAG = "-Ddocs=false"
-
 GIR_MESON_OPTION = 'gir'
 
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
-                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
-
 EXTRA_OEMESON_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dinstalled_tests=true', '-Dinstalled_tests=false', d)}"
 
 LIBV = "2.10.0"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
index f87597f190c..40beab0c413 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
@@ -28,6 +28,8 @@ SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-fo
 
 inherit meson pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even multilib_script
 
+GTKDOC_MESON_OPTION = "gtk_doc"
+
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
 DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
index 31c008db475..1c663f93e16 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
@@ -19,13 +19,6 @@ SRC_URI[archive.sha256sum] = "720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9f
 
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
 
-# This builds both API docs (via gtk-doc)
-GTKDOC_ENABLE_FLAG = "-Ddocs=true"
-GTKDOC_DISABLE_FLAG = "-Ddocs=false"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
-                                                                                    '${GTKDOC_DISABLE_FLAG}', d)} "
-
 do_install_append() {
 	if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
 		rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 5f7daf8124c..11826a6f0c9 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -13,10 +13,6 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 DEPENDS = "clutter-1.0 gtk+3"
 PACKAGES  =+ "${PN}-examples"
 
-GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
-GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
-                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
+GTKDOC_MESON_OPTION = "enable_docs"
 
 GIR_MESON_OPTION = 'enable_gi'
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index f3be9f44e1b..58e1f41be53 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -26,10 +26,7 @@ DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo h
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = ",,virtual/libx11 libxft"
 
-GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
-GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
-                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
+GTKDOC_MESON_OPTION = "enable_docs"
 GIR_MESON_OPTION = 'gir'
 
 LEAD_SONAME = "libpango-1.0*"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
index 36e8a9ef486..cfe0ddeef2d 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
@@ -22,11 +22,7 @@ inherit meson gtk-doc gettext systemd pkgconfig upstream-version-is-even gobject
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
                   -Ddbus_daemon=${bindir}/dbus-daemon"
 
-GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
-GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
-                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
+GTKDOC_MESON_OPTION = "enable_docs"
 
 GIR_MESON_OPTION = 'enable-introspection'
 GIR_MESON_ENABLE_FLAG = 'yes'
diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.30.0.bb
index 84fdb1510ad..4e22b3f8113 100644
--- a/meta/recipes-support/atk/atk_2.30.0.bb
+++ b/meta/recipes-support/atk/atk_2.30.0.bb
@@ -14,12 +14,6 @@ DEPENDS = "gettext-native glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-GTKDOC_ENABLE_FLAG = "-Ddocs=true"
-GTKDOC_DISABLE_FLAG = "-Ddocs=false"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
-                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
-
 SRC_URI_append = " \
                    file://0001-meson.build-enable-introspection-for-cross-compile.patch \
                    file://0001-Switch-from-filename-to-basename.patch \
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
index b095397ec28..e718b2248db 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
@@ -26,12 +26,7 @@ PACKAGECONFIG[gssapi] = "-Dgssapi=true,-Dgssapi=false,krb5"
 
 EXTRA_OEMESON_append = " -Dvapi=false"
 
-GTKDOC_ENABLE_FLAG = "-Ddoc=true"
-GTKDOC_DISABLE_FLAG = "-Ddoc=false"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
-                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
-
+GTKDOC_MESON_OPTION = "doc"
 
 # When built without gnome support, libsoup-2.4 will contain only one shared lib
 # and will therefore become subject to renaming by debian.bbclass. Prevent
-- 
2.17.1


