Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FC1CD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 18:28:55 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.35237.1694975324394990697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 11:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id C265D11AF6
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 20:28:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhwVa-1kKiby0; Sun, 17 Sep 2023 20:28:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/4] appstream: import recipe from meta-oe
Date: Sun, 17 Sep 2023 20:28:24 +0200
Message-ID: <20230917182829.2153680-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230917182829.2153680-1-f_l_k@t-online.de>
References: <20230917182829.2153680-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1694975318-2B024649-B44B7A34/0/0 CLEAN NORMAL
X-TOI-MSGID: f2075439-bbf4-4673-85e6-0d88f30a96c4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 18:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187813

libadwaita 1.4.0 has a dependency on it

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36 +++++++++++++++
 .../0001-remove-hardcoded-path.patch          | 31 +++++++++++++
 .../appstream/appstream_0.16.3.bb             | 45 +++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/appstream/appstream/0001-meson-d=
o-not-rely-on-an-exe-wrapper.patch
 create mode 100644 meta/recipes-support/appstream/appstream/0001-remove-=
hardcoded-path.patch
 create mode 100644 meta/recipes-support/appstream/appstream_0.16.3.bb

diff --git a/meta/recipes-support/appstream/appstream/0001-meson-do-not-r=
ely-on-an-exe-wrapper.patch b/meta/recipes-support/appstream/appstream/00=
01-meson-do-not-rely-on-an-exe-wrapper.patch
new file mode 100644
index 0000000000..d4f2951e7a
--- /dev/null
+++ b/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-=
an-exe-wrapper.patch
@@ -0,0 +1,36 @@
+From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau@r=
edhat.com>
+Date: Wed, 26 Jul 2023 23:21:10 +0400
+Subject: meson: do not rely on an exe wrapper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport [https://github.com/ximion/appstream/commit/79=
bf322768990b28c29a9d907edcca52ff48e0b8]
+---
+ data/meson.build | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/data/meson.build b/data/meson.build
+index aea0cb25..ec0e434f 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -7,6 +7,13 @@ install_data('its/metainfo.its',
+ install_data('its/metainfo.loc',
+               install_dir: join_paths(get_option('datadir'), 'gettext',=
 'its'))
+=20
++# Do not rely on an exe wrapper for rel-info, use the system one in tha=
t case
++if meson.is_cross_build()
++    dependency('appstream', version: '>=3D' + as_version, native: true,
++               not_found_message: 'Native appstream required for cross-=
building')
++    ascli_exe =3D find_program('appstreamcli')
++endif
++
+ # NOTE: We do not translate the release notes on purpose here.
+ # If you do want to give translators a chance to translate them,
+ # ascli news-to-metainfo needs to produce a temporary file to translate
+--=20
+2.41.0
+
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
index 0000000000..bde679e256
--- /dev/null
+++ b/meta/recipes-support/appstream/appstream_0.16.3.bb
@@ -0,0 +1,45 @@
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
+SRC_URI =3D " \
+	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}=
.tar.xz \
+	file://0001-remove-hardcoded-path.patch \
+	file://0001-meson-do-not-rely-on-an-exe-wrapper.patch \
+"
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
--=20
2.41.0


