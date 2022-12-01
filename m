Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2874C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 16:04:44 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.47876.1669910683112336256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 08:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id C98622BE8D
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Dec 2022 17:04:40 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.248]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0m3E-1OnxDO0; Thu, 1 Dec 2022 17:04:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv10 2/4] gtk4: import recipe from meta-gnome
Date: Thu,  1 Dec 2022 17:04:31 +0100
Message-Id: <20221201160433.111286-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201160433.111286-1-f_l_k@t-online.de>
References: <20221201160433.111286-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669910680-2C8B9EA1-45A4419A/0/0 CLEAN NORMAL
X-TOI-MSGID: 486a7920-0811-4823-b58d-9d73824519fd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 16:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174194

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk4_4.8.2.bb | 129 ++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk4_4.8.2.bb

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.8.2.bb
new file mode 100644
index 0000000000..98850f7ea0
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
@@ -0,0 +1,129 @@
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
+    atk \
+    cairo \
+    fribidi \
+    gdk-pixbuf \
+    gdk-pixbuf-native \
+    gi-docgen \
+    glib-2.0 \
+    graphene \
+    harfbuzz \
+    jpeg \
+    libepoxy \
+    libpng \
+    librsvg \
+    libxkbcommon \
+    pango \
+    tiff \
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
+SRC_URI[sha256sum] =3D "85b7a160b6e02eafa4e7d38f046f8720fab537d3fe73c01c=
864333a983a692a9"
+
+S =3D "${WORKDIR}/gtk-${PV}"
+
+inherit meson gettext pkgconfig gi-docgen update-alternatives gsettings =
features_check gobject-introspection
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
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+
+EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Ddemos=3Dfalse"
+
+PACKAGECONFIG ??=3D "gstreamer ${@bb.utils.filter('DISTRO_FEATURES', 'wa=
yland x11 vulkan', d)}"
+PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x=
11', d)}"
+PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)}"
+
+PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-sp=
i2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr li=
bxrender libxcomposite libxfixes xinerama"
+PACKAGECONFIG[wayland] =3D "-Dwayland-backend=3Dtrue,-Dwayland-backend=3D=
false,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-nati=
ve"
+PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups"
+PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
+PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
+PACKAGECONFIG[ffmpeg] =3D "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddis=
abled,ffmpeg"
+# gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
+PACKAGECONFIG[gstreamer] =3D "-Dmedia-gstreamer=3Denabled,-Dmedia-gstrea=
mer=3Ddisabled,gstreamer1.0-plugins-bad"
+PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tra=
cker"
+PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled, vulka=
n-loader vulkan-headers shaderc-native"
+
+LIBV =3D "4.0.0"
+
+FILES:${PN}:append =3D " \
+    ${datadir}/glib-2.0/schemas/ \
+    ${datadir}/gtk-4.0/emoji/ \
+    ${datadir}/metainfo/ \
+    ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
+    ${libdir}/gtk-4.0/${LIBV}/media \
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
+    gtk_libdir =3D d.expand('${libdir}/gtk-4.0/${LIBV}')
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


