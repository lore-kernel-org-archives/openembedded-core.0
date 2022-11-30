Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD995C4332F
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 05:35:20 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.3816.1669786512075227948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 21:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id 2F2AAC1F2
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 06:35:10 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.245]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0FkQ-0QHosF0; Wed, 30 Nov 2022 06:35:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv8 3/4] gtk4: import recipe from meta-gnome
Date: Wed, 30 Nov 2022 06:34:49 +0100
Message-Id: <20221130053450.95655-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130053450.95655-1-f_l_k@t-online.de>
References: <20221130053450.95655-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669786506-E5FDF07E-96AE9510/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d05e0e4-6d55-41f8-b127-5042400df9cc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173993

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk4_4.6.7.bb | 142 ++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk4_4.6.7.bb

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.6.7.bb
new file mode 100644
index 0000000000..c71be23a7d
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb
@@ -0,0 +1,142 @@
+SUMMARY =3D "Multi-platform toolkit for creating GUIs"
+DESCRIPTION =3D "GTK is a multi-platform toolkit for creating graphical =
user interfaces. Offering a complete \
+set of widgets, GTK is suitable for projects ranging from small one-off =
projects to complete application suites."
+HOMEPAGE =3D "http://www.gtk.org"
+BUGTRACKER =3D "https://bugzilla.gnome.org/"
+SECTION =3D "libs"
+
+DEPENDS =3D " \
+    sassc-native \
+    glib-2.0 \
+    libepoxy \
+    graphene \
+    cairo \
+    pango \
+    atk \
+    jpeg \
+    libpng \
+    librsvg \
+    tiff \
+    gdk-pixbuf-native gdk-pixbuf \
+"
+
+LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D " \
+    file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \
+    file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce88af737=
 \
+    file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50e08086f2=
 \
+    file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19=
d29fb2 \
+"
+
+MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
+
+UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
+
+SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
+SRC_URI[sha256sum] =3D "effd2e7c4b5e2a5c7fad43e0f24adea68baa4092abb0b752=
caff278e6bb010e8"
+
+S =3D "${WORKDIR}/gtk-${PV}"
+
+inherit meson gettext pkgconfig gtk-doc update-alternatives gsettings fe=
atures_check gobject-introspection
+
+# TBD: nativesdk
+# gobject-introspection.bbclass pins introspection off for nativesk. As =
long as
+# we do not remove this wisdom or hack gtk4, it is not possible to build
+# nativesdk-gtk4
+BBCLASSEXTEND =3D "native"
+
+GSETTINGS_PACKAGE:class-native =3D ""
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+GTKDOC_MESON_OPTION =3D 'gtk_doc'
+
+EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse"
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
, d)}"
+PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x=
11', d)}"
+PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)}"
+
+PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-sp=
i2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr li=
bxrender libxcomposite libxfixes xinerama"
+PACKAGECONFIG[wayland] =3D "-Dwayland-backend=3Dtrue,-Dwayland-backend=3D=
false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2=
 wayland-native"
+PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups"
+PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
+# gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
+PACKAGECONFIG[gstreamer] =3D "-Dmedia-gstreamer=3Denabled,-Dmedia-gstrea=
mer=3Ddisabled,gstreamer1.0-plugins-bad"
+PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tra=
cker"
+
+
+do_compile:prepend() {
+    export GIR_EXTRA_LIBS_PATH=3D"${B}/gdk/.libs"
+}
+
+
+PACKAGES =3D+ "${PN}-demo"
+LIBV =3D "4.0.0"
+
+FILES:${PN}-demo =3D " \
+    ${datadir}/applications/org.gtk.Demo4.desktop \
+    ${datadir}/applications/org.gtk.IconBrowser4.desktop \
+    ${datadir}/applications/org.gtk.WidgetFactory4.desktop \
+    ${datadir}/icons/hicolor/*/apps/org.gtk.Demo4*.* \
+    ${datadir}/icons/hicolor/*/apps/org.gtk.IconBrowser4*.* \
+    ${datadir}/icons/hicolor/*/apps/org.gtk.WidgetFactory4*.* \
+    ${bindir}/gtk4-demo \
+    ${bindir}/gtk4-demo-application \
+    ${bindir}/gtk4-icon-browser \
+    ${bindir}/gtk4-widget-factory \
+"
+
+FILES:${PN}:append =3D " \
+    ${datadir}/glib-2.0/schemas/ \
+    ${datadir}/gtk-4.0/emoji/ \
+    ${datadir}/metainfo/ \
+    ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
+    ${libdir}/gtk-4.0/${LIBV}/printbackends \
+    ${bindir}/gtk4-update-icon-cache \
+    ${bindir}/gtk4-launch \
+"
+
+FILES:${PN}-dev +=3D " \
+    ${datadir}/gtk-4.0/gtk4builder.rng \
+    ${datadir}/gtk-4.0/include \
+    ${datadir}/gtk-4.0/valgrind \
+    ${datadir}/gettext/its \
+    ${bindir}/gtk4-builder-tool \
+    ${bindir}/gtk4-encode-symbolic-svg \
+    ${bindir}/gtk4-query-settings \
+"
+
+GTKBASE_RRECOMMENDS ?=3D " \
+    liberation-fonts \
+    gdk-pixbuf-loader-png \
+    gdk-pixbuf-loader-jpeg \
+    gdk-pixbuf-loader-gif \
+    gdk-pixbuf-loader-xpm \
+    shared-mime-info \
+    adwaita-icon-theme-symbolic \
+"
+
+GTKBASE_RRECOMMENDS:class-native ?=3D ""
+
+GTKGLIBC_RRECOMMENDS ?=3D "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
+
+RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
+RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
+RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland"=
, "wayland-protocols", "", d)}"
+
+PACKAGES_DYNAMIC +=3D "^gtk4-printbackend-.*"
+python populate_packages:prepend () {
+    import os.path
+
+    gtk_libdir =3D d.expand('${libdir}/gtk-3.0/${LIBV}')
+    printmodules_root =3D os.path.join(gtk_libdir, 'printbackends');
+
+    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$=
', 'gtk4-printbackend-%s', 'GTK printbackend module for %s')
+
+    if (d.getVar('DEBIAN_NAMES')):
+        d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
+}
--=20
2.34.1


