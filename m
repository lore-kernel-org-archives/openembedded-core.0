Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBE7C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 11:19:24 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.25325.1699615153957027495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 03:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id 9F1206E65
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 12:18:30 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.113]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1PWw-3wPS8f0; Fri, 10 Nov 2023 12:18:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gnomebase.bbclass: Use meson as default buildsystem
Date: Fri, 10 Nov 2023 12:18:51 +0100
Message-ID: <20231110111851.305549-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699615110-D6FFA93F-9209268E/0/0 CLEAN NORMAL
X-TOI-MSGID: ca6e96b2-4d8b-474f-b6c5-17867c068a5e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 11:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190406

The vast majority of gnome recipes uses meson. Set it as default
and override the few recipes that still use autotools.

This way we can remove a lot of lines in meta-oe and more important
it would not be needed to explicitly set GNOMEBASEBUILDCLASS =3D "meson" =
for newly
created gnome recipe anymore.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/gnomebase.bbclass                           | 2 +-
 meta/recipes-core/glib-networking/glib-networking_2.76.1.bb     | 1 -
 meta/recipes-core/libxml/libxml2_2.11.5.bb                      | 1 +
 meta/recipes-devtools/python/python3-pygobject_3.46.0.bb        | 1 -
 meta/recipes-gnome/epiphany/epiphany_44.6.bb                    | 1 -
 meta/recipes-gnome/gcr/gcr_4.1.0.bb                             | 1 -
 meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb             | 1 -
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                         | 1 +
 .../gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb | 1 -
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb                    | 1 +
 meta/recipes-gnome/json-glib/json-glib_1.6.6.bb                 | 1 -
 meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb               | 1 -
 meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb                | 1 -
 meta/recipes-gnome/libgudev/libgudev_238.bb                     | 1 -
 meta/recipes-gnome/libnotify/libnotify_0.8.2.bb                 | 1 -
 meta/recipes-gnome/librsvg/librsvg_2.56.3.bb                    | 1 +
 meta/recipes-gnome/libsecret/libsecret_0.21.1.bb                | 1 -
 meta/recipes-graphics/graphene/graphene_1.10.8.bb               | 1 -
 meta/recipes-graphics/pango/pango_1.51.0.bb                     | 1 -
 meta/recipes-support/vte/vte_0.72.2.bb                          | 1 -
 20 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/=
gnomebase.bbclass
index 5e72f549a3..a12e9f31a9 100644
--- a/meta/classes-recipe/gnomebase.bbclass
+++ b/meta/classes-recipe/gnomebase.bbclass
@@ -27,7 +27,7 @@ FILES:${PN} +=3D "${datadir}/application-registry  \
=20
 FILES:${PN}-doc +=3D "${datadir}/devhelp"
=20
-GNOMEBASEBUILDCLASS ??=3D "autotools"
+GNOMEBASEBUILDCLASS ??=3D "meson"
 inherit ${GNOMEBASEBUILDCLASS} pkgconfig
=20
 do_install:append() {
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
index 3687123141..0f8822e160 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
@@ -27,7 +27,6 @@ PACKAGECONFIG[libproxy] =3D "-Dlibproxy=3Denabled,-Dlib=
proxy=3Ddisabled,libproxy"
 PACKAGECONFIG[tests] =3D "-Dinstalled_tests=3Dtrue,-Dinstalled_tests=3Df=
alse"
 PACKAGECONFIG[gnomeproxy] =3D "-Dgnome_proxy=3Denabled,-Dgnome_proxy=3Dd=
isabled,gsettings-desktop-schemas"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptes=
t-gnome
=20
 SRC_URI +=3D "file://run-ptest"
diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-co=
re/libxml/libxml2_2.11.5.bb
index fc82912df2..319833f053 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.11.5.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D2044417e2e=
5006b65a8b9067b683fcf1 \
=20
 DEPENDS =3D "zlib virtual/libiconv"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase
=20
 SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP=
};name=3Dtesttar \
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb b/m=
eta/recipes-devtools/python/python3-pygobject_3.46.0.bb
index 28129fd66a..73a393051a 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
@@ -5,7 +5,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D ""
=20
 inherit gnomebase setuptools3-base gobject-introspection upstream-versio=
n-is-even
diff --git a/meta/recipes-gnome/epiphany/epiphany_44.6.bb b/meta/recipes-=
gnome/epiphany/epiphany_44.6.bb
index d8dd3d6dae..577eb43a80 100644
--- a/meta/recipes-gnome/epiphany/epiphany_44.6.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_44.6.bb
@@ -23,7 +23,6 @@ DEPENDS =3D " \
           desktop-file-utils-native \
           "
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cac=
he
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
diff --git a/meta/recipes-gnome/gcr/gcr_4.1.0.bb b/meta/recipes-gnome/gcr=
/gcr_4.1.0.bb
index 239d9806cc..399f327e04 100644
--- a/meta/recipes-gnome/gcr/gcr_4.1.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.1.0.bb
@@ -15,7 +15,6 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_path_GPG=3D'gpg2'"
=20
 CFLAGS +=3D "-D_GNU_SOURCE"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
 inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-i=
ntrospection gettext mime mime-xdg
=20
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb b/meta/r=
ecipes-gnome/gnome/adwaita-icon-theme_45.0.bb
index 4dbcced5c3..0bd98288f6 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc84cac88e46f=
c07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=3D96143d33de3a79321b1006c=
4e8ed07e7 \
                     file://COPYING_LGPL;md5=3De6a600fd5e1d9cbde2d9836802=
33ad02"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase allarch gtk-icon-cache
=20
 SRC_URI[archive.sha256sum] =3D "2442bfb06f4e6cc95bf6e2682fdff98fa5eddc68=
8751b9d6215c623cb4e42ff1"
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome=
/gnome/gconf_3.2.6.bb
index 4930aeb9f0..1e29bd9bb0 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b=
5b66355690e9abc605"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native dbus dbus-glib libxml2 intltool-na=
tive"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gtk-doc gettext gobject-introspection gio-module-cache
=20
 SRC_URI =3D "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}=
.tar.xz;name=3Darchive \
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-deskt=
op-schemas_44.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettin=
gs-desktop-schemas_44.0.bb
index 8e30d5e524..5ccc1a7dd4 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_44.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-sche=
mas_44.0.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 DEPENDS =3D "glib-2.0"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext
=20
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-=
gnome/gtk-doc/gtk-doc_1.33.2.bb
index 150eca9274..2e8ab1c771 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -5,6 +5,7 @@ HOMEPAGE =3D "https://www.gtk.org/docs/"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase
=20
 # Configure the scripts correctly (and build their dependencies) only if=
 they are actually
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb b/meta/recip=
es-gnome/json-glib/json-glib_1.6.6.bb
index 9c34fb7f40..a9a71953c3 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac=
38fefcd64b04bb903e34"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase lib_package gobject-introspection gi-docgen gettext pt=
est-gnome manpages upstream-version-is-even
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.4.0.bb
index d8aa2cd697..cc05756805 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libadwaita"
 LICENSE=3D"LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
     gtk4 \
diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb b/meta/reci=
pes-gnome/libdazzle/libdazzle_3.44.0.bb
index 49ebc818b0..9bca7e9dce 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
@@ -7,7 +7,6 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libdazzle"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libdazzle/issues"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05189ec81232da84bd6=
e1a"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase upstream-version-is-even vala features_check gobject-i=
ntrospection
=20
 DEPENDS =3D "glib-2.0-native glib-2.0 gtk+3"
diff --git a/meta/recipes-gnome/libgudev/libgudev_238.bb b/meta/recipes-g=
nome/libgudev/libgudev_238.bb
index c71e4bda74..5923544eca 100644
--- a/meta/recipes-gnome/libgudev/libgudev_238.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_238.bb
@@ -14,7 +14,6 @@ RCONFLICTS:${PN} =3D "systemd (<=3D 220)"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gobject-introspection gtk-doc
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb b/meta/recip=
es-gnome/libnotify/libnotify_0.8.2.bb
index 6888c33d14..1ca7ef8714 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
@@ -14,7 +14,6 @@ DEPENDS =3D "glib-2.0 glib-2.0-native gdk-pixbuf"
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,gtk+3"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
 inherit gnomebase gi-docgen features_check gobject-introspection
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.56.3.bb
index 4b9aaeecbe..c4f34f2e29 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
@@ -14,6 +14,7 @@ SECTION =3D "x11/utils"
 DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-na=
tive"
 BBCLASSEXTEND =3D "native nativesdk"
=20
+GNOMEBASEBUILDCLASS =3D "autotools"
 inherit cargo_common gnomebase pixbufcache gobject-introspection rust va=
la gi-docgen cargo-update-recipe-crates
=20
 require ${BPN}-crates.inc
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb b/meta/reci=
pes-gnome/libsecret/libsecret_0.21.1.bb
index 63102476cb..f762d7c343 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb
@@ -8,7 +8,6 @@ HOMEPAGE =3D "https://github.com/GNOME/libsecret"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D23c2a5e0106b99d75238986559bb5=
fc6"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gi-docgen vala gobject-introspection manpages
=20
diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
index 55d8a2d74e..e2e82b32aa 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE =3D "http://ebassi.github.io/graphene/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da7d871d9e23c450c421a85bb2=
819f648"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gobject-introspection gtk-doc
=20
diff --git a/meta/recipes-graphics/pango/pango_1.51.0.bb b/meta/recipes-g=
raphics/pango/pango_1.51.0.bb
index 77a1901248..85a0270a3f 100644
--- a/meta/recipes-graphics/pango/pango_1.51.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.51.0.bb
@@ -11,7 +11,6 @@ LICENSE =3D "LGPL-2.0-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb854063f=
7e7"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gi-docgen ptest-gnome upstream-version-is-even gobject=
-introspection
=20
diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-suppor=
t/vte/vte_0.72.2.bb
index 4249b75ac0..44e71491f6 100644
--- a/meta/recipes-support/vte/vte_0.72.2.bb
+++ b/meta/recipes-support/vte/vte_0.72.2.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gper=
f-native icu"
=20
-GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D 'gir'
 GIDOCGEN_MESON_OPTION =3D "docs"
=20
--=20
2.42.0


