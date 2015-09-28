Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1E6600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 10:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8SArqi4003678 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:53:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aFFAFJdWkOnt
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:53:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8SArZmu003658
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:53:47 +0100
Message-ID: <1443437615.19044.275.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2015 11:53:35 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] classes/meta: Add DISTRO_FEATURES check for gtk+/gtk3+
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
X-List-Received-Date: Mon, 28 Sep 2015 10:53:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you currently do a DISTRO_FEATURES_remove = "x11" with OE-Core, you
see failures due to dependency problems. The work in resolving this was
partially completed a while back. This adds in the markup mainly for
gtk/gtk3+ recipes and means "bitbake world" will work successfully.

Rather than code the gtk/gtk+ specific distro features into each recipe,
a shared variable is used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 29b762b..b8fd039 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -47,3 +47,6 @@ DISTRO_VERSION ??= "nodistro.0"
 
 # Missing checksums should raise an error
 BB_STRICT_CHECKSUM = "1"
+
+GTKDISTROFEATURES = "directfb x11"
+GTK3DISTROFEATURES = "x11 wayland"
diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index eea4d70..81ca98a 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 require avahi.inc
 
-inherit python-dir pythonnative
+inherit python-dir pythonnative distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 
 PACKAGECONFIG ??= "python"
 PACKAGECONFIG[python] = "--enable-python,--disable-python,python-native python"
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index f5575d2..e0a1021 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -19,7 +19,8 @@ SRC_URI = "git://github.com/connectivity/connman-gnome.git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep gtk-icon-cache pkgconfig
+inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 
 RDEPENDS_${PN} = "connman"
 
diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index e4c33a8..e0cbee9 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -26,7 +26,9 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 EXTRA_OECONF = "--disable-docs --with-python-includes=${STAGING_INCDIR}/../"
 
-inherit autotools pkgconfig distutils-base
+inherit autotools pkgconfig distutils-base distro_features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 
 do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/
diff --git a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
index 506fb25..c3745c0 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
 	   gsettings-desktop-schemas gnome-desktop3"
 
-inherit gnomebase gsettings
+inherit gnomebase gsettings distro_features_check
+# libwnck3 is x11 only
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
 SRC_URI[archive.md5sum] = "3296af4532b8019775f4b40d21a341ae"
 SRC_URI[archive.sha256sum] = "d527f1770779ec22d955aeb13b148a846a26144e433ff0480c981af80e2390b1"
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
index 1f2f06c..aa11fa2 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
@@ -12,6 +12,9 @@ SRC_URI[archive.sha256sum] = "3a8f196b46eb9dbd3ba2afb8fb5fef6a8825539d449a021813
 
 DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification iso-codes"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
+
 EXTRA_OECONF = "--disable-desktop-docs"
 
 PACKAGES =+ "libgnome-desktop3"
diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index be5273d..44859f6 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 SECTION = "libs"
 
 inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "directfb x11"
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 
 X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index f29f0d3..558cdd7 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -10,7 +10,8 @@ DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings
+inherit autotools pkgconfig gtk-doc update-alternatives gtk-immodules-cache gsettings distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # This should be in autotools.bbclass, but until something elses uses it putting
 # it here avoids rebuilding everything.
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index c30454c..545c139 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -34,6 +34,9 @@ RDEPENDS_${PN}-dev = ""
 inherit gnomebase
 GNOME_COMPRESS_TYPE="bz2"
 
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
+
 python populate_packages_prepend() {
     engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
     themes_root = os.path.join(d.getVar('datadir', True), "themes")
diff --git a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
index 889fd89..d7a9df1 100644
--- a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -13,6 +13,9 @@ S = "${WORKDIR}/git/gtk-theme-torturer"
 
 CFLAGS += "-Wl,-rpath-link,${STAGING_LIBDIR}"
 
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
+
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 torturer ${D}${bindir}
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 15267ca..b2651df 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -11,7 +11,8 @@ SECTION = "libs"
 PR = "r5"
 DEPENDS = "zlib gdk-pixbuf gtk+"
 
-inherit autotools pkgconfig gnomebase gtk-doc
+inherit autotools pkgconfig gnomebase gtk-doc distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 GNOME_COMPRESS_TYPE="bz2"
 
 SRC_URI += "file://glade-cruft.patch file://no-xml2.patch file://python_environment.patch"
diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
index d0f5175..3ee1ae9 100644
--- a/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
+++ b/meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
@@ -13,3 +13,8 @@ PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-s
 inherit gnomebase
 SRC_URI[archive.md5sum] = "4538672e0d775fadedf10abeb8020047"
 SRC_URI[archive.sha256sum] = "f5080076346609b4c36394b879f3a86b92ced3b90a37cb54c8e9a14f00e7921c"
+
+inherit distro_features_check
+# libxres means x11 only
+REQUIRED_DISTRO_FEATURES = "x11"
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index cc1c02b..9881c94 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -23,6 +23,9 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
+
 PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto presentproto"
 LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl libgcrypt"
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index bb69d54..45dbe3c 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -2,6 +2,9 @@ require oprofileui.inc
 
 DEPENDS += "gtk+ libglade libxml2 avahi-ui gconf"
 
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
+
 SRCREV = "389e1875af4721d52c7e65cf9cfffb69b0ed6a59"
 PV = "0.0+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 19c3e10..c161c6d 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -19,7 +19,8 @@ SRC_URI_append_mips64n32 = " file://rmb-mips.patch"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 
 # We do not yet work for aarch64.
 #
diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
index 9deccae..84e5d589 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 DEPENDS = "gtk+ libxml2"
 RDEPENDS_${PN} = "trace-cmd"
 
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
+
 EXTRA_OEMAKE = "\
     'prefix=${prefix}' \
     'bindir_relative=${@oe.path.relative(prefix, bindir)}' \
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 54cfbbc..a909756 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -16,7 +16,9 @@ SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gtk-doc lib_package pkgconfig
+inherit autotools gtk-doc lib_package pkgconfig distro_features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 
 do_configure_prepend() {
 	touch ${S}/ChangeLog
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
index 4e37ff2..36341a2 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
@@ -8,6 +8,9 @@ SECTION = "x11/base"
 DEPENDS = "gtk+"
 RDEPENDS_gtk-theme-sato = "gtk-sato-engine"
 
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
+
 PACKAGES += "gtk-theme-sato"
 FILES_${PN} = "${libdir}/gtk-2.0/*/engines/*.so "
 FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*.la"
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
index 91fd150..341a29b 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
@@ -15,4 +15,6 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
diff --git a/meta/recipes-support/libfm/libfm_1.2.3.bb b/meta/recipes-support/libfm/libfm_1.2.3.bb
index 629502f..695bc42 100644
--- a/meta/recipes-support/libfm/libfm_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.3.bb
@@ -18,7 +18,8 @@ SRC_URI[sha256sum] = "c692f1624a4cbc8d1dd55f3b3f3369fbf5d26f63a916e2c295230b2344
 
 PR = "r1"
 
-inherit autotools pkgconfig gtk-doc
+inherit autotools pkgconfig gtk-doc distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 
 do_configure[dirs] =+ "${S}/m4"
 
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 874062a..c043444 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -4,7 +4,8 @@ LICENSE = "LGPLv2.0"
 DEPENDS = " glib-2.0 gtk+ intltool-native ncurses gobject-introspection-stub"
 RDEPENDS_libvte = "vte-termcap"
 
-inherit gnome gtk-doc
+inherit gnome gtk-doc distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTKDISTROFEATURES}"
 
 EXTRA_OECONF = "--disable-python --disable-introspection"
 



