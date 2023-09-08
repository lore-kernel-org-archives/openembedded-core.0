Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34962EE8012
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:57:49 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.41329.1694185063208584438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 07:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout05.t-online.de (Postfix) with SMTP id 7399512AFD
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Sep 2023 16:57:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.221]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qecvS-0IR6J70; Fri, 8 Sep 2023 16:57:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] RFC: import libxmlb and appstream from meta-oe
Date: Fri,  8 Sep 2023 16:57:33 +0200
Message-ID: <20230908145733.49150-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694185058-2B827649-08FE2869/0/0 CLEAN NORMAL
X-TOI-MSGID: 250fcb9d-77ed-45de-bf31-0a920be33f87
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 14:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187437

The upcoming libadwaita update will have a required dependency on appstre=
am,
so these will be required in oe-core.

In order to be able to use snowball for appstream by default, also libste=
mmer
would need to be moved.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc      |  2 +
 .../0001-remove-hardcoded-path.patch          | 31 ++++++++++++++
 .../appstream/appstream_0.16.3.bb             | 42 +++++++++++++++++++
 .../recipes-support/libxmlb/libxmlb/run-ptest |  3 ++
 .../recipes-support/libxmlb/libxmlb_0.3.14.bb | 24 +++++++++++
 5 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-support/appstream/appstream/0001-remove-=
hardcoded-path.patch
 create mode 100644 meta/recipes-support/appstream/appstream_0.16.3.bb
 create mode 100644 meta/recipes-support/libxmlb/libxmlb/run-ptest
 create mode 100644 meta/recipes-support/libxmlb/libxmlb_0.3.14.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 3619588ae6..18977fd671 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -40,6 +40,7 @@ RECIPE_MAINTAINER:pn-alsa-ucm-conf =3D "Michael Opdenac=
ker <michael.opdenacker@boo
 RECIPE_MAINTAINER:pn-alsa-utils =3D "Michael Opdenacker <michael.opdenac=
ker@bootlin.com>"
 RECIPE_MAINTAINER:pn-apr =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
+RECIPE_MAINTAINER:pn-appstream =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-apt =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-argp-standalone =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-asciidoc =3D "Yi Zhao <yi.zhao@windriver.com>"
@@ -447,6 +448,7 @@ RECIPE_MAINTAINER:pn-libxml-sax-base-perl =3D "Tim Or=
ling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-libxml-sax-perl =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-libxml-simple-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
 RECIPE_MAINTAINER:pn-libxml2 =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-libxmlb =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-libxmu =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libxpm =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libxrandr =3D "Unassigned <unassigned@yoctoproject.=
org>"
diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcod=
ed-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hard=
coded-path.patch
new file mode 100644
index 0000000000..9cbfaca82f
--- /dev/null
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path=
.patch
@@ -0,0 +1,31 @@
+From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 12 Dec 2022 15:42:42 +0100
+Subject: [PATCH] remove hardcoded path
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Dont include hardcoded path. This fixes:
+| cc1: error: include location "/usr/include" is unsafe for cross-compil=
ation [-Werror=3Dpoison-system-directories]
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build       | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index fd0e3373..2f273ada 100644
+--- a/meson.build
++++ b/meson.build
+@@ -124,7 +124,7 @@ if get_option ('gir')
+     dependency('gobject-introspection-1.0', version: '>=3D1.56')
+ endif
+=20
+-stemmer_inc_dirs =3D include_directories(['/usr/include'])
++stemmer_inc_dirs =3D include_directories([''])
+ if get_option('stemming')
+     stemmer_lib =3D cc.find_library('stemmer', required: true)
+     if not cc.has_header('libstemmer.h')
+--=20
+2.34.1
+
diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/re=
cipes-support/appstream/appstream_0.16.3.bb
new file mode 100644
index 0000000000..f2917b1e80
--- /dev/null
+++ b/meta/recipes-support/appstream/appstream_0.16.3.bb
@@ -0,0 +1,42 @@
+SUMMARY =3D "AppStream is a collaborative effort for making machine-read=
able software metadata easily available."
+HOMEPAGE =3D "https://github.com/ximion/appstream"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
+
+DEPENDS =3D " \
+    appstream-native \
+    curl-native \
+    curl \
+    docbook-xml-dtd4-native \
+    gperf-native \
+    glib-2.0 \
+    libyaml \
+    libxml2 \
+    libxmlb \
+    libxslt-native \
+    itstool-native \
+    docbook-xsl-stylesheets-native \
+    python3-pygments-native \
+"
+
+inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
+
+GIR_MESON_OPTION =3D "gir"
+GTKDOC_MESON_OPTION =3D "apidocs"
+
+SRC_URI =3D "https://www.freedesktop.org/software/appstream/releases/App=
Stream-${PV}.tar.xz"
+SRC_URI:append:class-target =3D " file://0001-remove-hardcoded-path.patc=
h"
+SRC_URI[sha256sum] =3D "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8=
e6344a2b318b98b1"
+
+S =3D "${WORKDIR}/AppStream-${PV}"
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
+
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
+PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemming=3Dfalse,libste=
mmer"
+
+FILES:${PN} +=3D "${datadir}"
+
+EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
+
+BBCLASSEXTEND =3D "native"
diff --git a/meta/recipes-support/libxmlb/libxmlb/run-ptest b/meta/recipe=
s-support/libxmlb/libxmlb/run-ptest
new file mode 100644
index 0000000000..6d0bb95d3a
--- /dev/null
+++ b/meta/recipes-support/libxmlb/libxmlb/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libxmlb
diff --git a/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb b/meta/recipe=
s-support/libxmlb/libxmlb_0.3.14.bb
new file mode 100644
index 0000000000..90f8844051
--- /dev/null
+++ b/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "A library to help create and query binary XML blobs"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742"
+
+SRC_URI =3D "git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=
=3Dhttps \
+           file://run-ptest \
+           "
+SRCREV =3D "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "glib-2.0 xz zstd"
+
+inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgc=
onfig
+
+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
+
+GTKDOC_MESON_OPTION =3D "gtkdoc"
+
+FILES:${PN}-bin +=3D "${libexecdir}"
+
+BBCLASSEXTEND =3D "native"
--=20
2.41.0


