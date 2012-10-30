Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Ls-0002s1-PG
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TgIG000310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:42 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:50 +0800
Message-ID: <d61bef69c5a31da4cbe88f2c7ffe33ec72777f17.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 09/11] recipes-gnome: replace virtclass-native(sdk) with class-native(sdk)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 09:43:17 -0000
Content-Type: text/plain

The overrides virtclass-native and virtclass-nativesdk are deprecated,
which should be replaced by class-native and class-nativesdk.

[YOCTO #3297]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb | 6 +++---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            | 6 +++---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       | 4 ++--
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             | 4 ++--
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index a77eee1..65a2d68 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF = "\
 "
 X11DEPENDS = "--without-x11"
 X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x11', '--without-x11', d)}"
-X11DEPENDS_virtclass-native = "--without-x11"
+X11DEPENDS_class-native = "--without-x11"
 
 PACKAGES =+ "${PN}-xlib"
 
@@ -73,7 +73,7 @@ fi
 }
 
 PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
-PACKAGES_DYNAMIC_virtclass-native = ""
+PACKAGES_DYNAMIC_class-native = ""
 
 python populate_packages_prepend () {
     postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
@@ -83,7 +83,7 @@ python populate_packages_prepend () {
     do_split_packages(d, loaders_root, '^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s', postinst_pixbufloader)
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 #Use wrapper script rather than binary as required libtool library is not installed now
 	GDK_PIXBUF_MODULEDIR=${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders ${S}/gdk-pixbuf/gdk-pixbuf-query-loaders > ${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
 	sed -i -e 's#${D}##g' ${D}${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index 4d77a14..f80c910 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -7,7 +7,7 @@ POLKIT = "polkit"
 POLKIT_libc-uclibc = ""
 
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT} gobject-introspection-stub"
-DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-stub-native"
+DEPENDS_class-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-stub-native"
 
 PR = "r12"
 
@@ -22,7 +22,7 @@ SRC_URI[archive.sha256sum] = "52008a82a847527877d9e1e549a351c86cc53cada4733b8a70
 S = "${WORKDIR}/GConf-${PV}"
 
 POLKIT_OECONF = "--enable-defaults-service"
-POLKIT_OECONF_virtclass-native = "--disable-defaults-service"
+POLKIT_OECONF_class-native = "--disable-defaults-service"
 POLKIT_OECONF_libc-uclibc = "--disable-default-service"
 
 EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
@@ -39,7 +39,7 @@ do_install_append() {
 
 # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
 RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 FILES_${PN} += "${libdir}/GConf/* \
                 ${libdir}/gio/*/*.so \
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index b2570d6..8ea0b96 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native glib-2.0"
-DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native glib-2.0-native"
+DEPENDS_class-native = "libxml2-native libxslt-native intltool-native glib-2.0-native"
 
 inherit gnome gettext python-dir pythonnative
 
@@ -20,6 +20,6 @@ do_install_append_class-native () {
 FILES_${PN} += "${datadir}/xml* ${PYTHON_SITEPACKAGES_DIR}/*"
 
 RDEPENDS_${PN} = "bash"
-RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index 5481f82..bbf765b 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -38,8 +38,8 @@ LIBV = "2.10.0"
 
 PACKAGES_DYNAMIC += "^gtk-immodule-.* ^gtk-printbackend-.*"
 BBCLASSEXTEND = "native"
-RRECOMMENDS_${PN}_virtclass-native = ""
-DEPENDS_virtclass-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
+RRECOMMENDS_${PN}_class-native = ""
+DEPENDS_class-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
 
 python populate_packages_prepend () {
     prologue = d.getVar("postinst_prologue", True)
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 100b51e..4f838e0 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/utils"
 DEPENDS = "gtk+ cairo libxml2"
-DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
+DEPENDS_class-native = "cairo-native pango-native gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
 PR = "r10"
@@ -19,7 +19,7 @@ EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz"
 
 PACKAGECONFIG ??= "croco"
 # When native we can manage without croco, as it's only for GTK+
-PACKAGECONFIG_virtclass-native = ""
+PACKAGECONFIG_class-native = ""
 
 PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
 
-- 
1.7.11.2



