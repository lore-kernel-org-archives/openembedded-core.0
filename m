Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4ADC4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 12:26:43 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.9003.1699360002399435486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 04:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id 0915110FFB
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Nov 2023 13:26:40 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.54]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0LAD-2GxlQH0; Tue, 7 Nov 2023 13:26:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][RFC][PATCHv2] vala.bbclass: enable vapi build if class is inherited
Date: Tue,  7 Nov 2023 13:26:54 +0100
Message-ID: <20231107122654.881882-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699359997-3FFFCEA2-948A149A/0/0 CLEAN NORMAL
X-TOI-MSGID: f374f1ea-3fe5-4d46-b5a2-7d58f6cc2e48
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 12:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190277

Try to enable vapi build automatically if GI_DATA_ENABLED =3D True.
Do it basically the same way it is done for gi

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/vala.bbclass              | 23 +++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_4.1.0.bb           |  2 --
 .../libadwaita/libadwaita_1.4.0.bb            |  2 --
 .../libdazzle/libdazzle_3.44.0.bb             |  1 +
 .../libportal/libportal_0.7.1.bb              |  2 +-
 meta/recipes-gnome/librsvg/librsvg_2.56.3.bb  |  2 --
 .../appstream/appstream_0.16.3.bb             |  2 --
 7 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/vala.bbclass b/meta/classes-recipe/vala.=
bbclass
index 460ddb36f0..45c3993c54 100644
--- a/meta/classes-recipe/vala.bbclass
+++ b/meta/classes-recipe/vala.bbclass
@@ -16,6 +16,29 @@ export STAGING_DATADIR
 # Upstream Vala >=3D 0.11 looks in XDG_DATA_DIRS for .vapi files
 export XDG_DATA_DIRS =3D "${STAGING_DATADIR}:${STAGING_LIBDIR}"
=20
+VALA_ENABLED:class-native =3D "False"
+VALA_ENABLED ?=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'True=
', 'False', d)}"
+
+# meson: default option name to enable/disable vala. This matches most
+# project's configuration. In doubts - check meson_options.txt in projec=
t's
+# source path.
+VALA_MESON_OPTION ?=3D 'vapi'
+VALA_MESON_ENABLE_FLAG ?=3D 'true'
+VALA_MESON_DISABLE_FLAG ?=3D 'false'
+
+# Define vala options such that they can be disabled completely when VAL=
A_MESON_OPTION is empty
+VALAMESONTARGET =3D "-D${VALA_MESON_OPTION}=3D${@bb.utils.contains('VALA=
_ENABLED', 'True', '${VALA_MESON_ENABLE_FLAG}', '${VALA_MESON_DISABLE_FLA=
G}', d)} "
+VALAMESONBUILD =3D "-D${VALA_MESON_OPTION}=3D${VALA_MESON_DISABLE_FLAG} =
"
+
+EXTRA_OECONF:prepend:class-target =3D "${@bb.utils.contains('VALA_ENABLE=
D', 'True', '--enable-vala', '--disable-vala', d)} "
+EXTRA_OEMESON:prepend:class-target =3D "${@['', '${VALAMESONTARGET}'][d.=
getVar('VALA_MESON_OPTION') !=3D '']} "
+# When building native recipes, disable vala, as it is not necessary,
+# pulls in additional dependencies, and makes build times longer
+EXTRA_OECONF:prepend:class-native =3D "--disable-vala "
+EXTRA_OEMESON:prepend:class-native =3D "${@['', '${VALAMESONBUILD}'][d.g=
etVar('VALA_MESON_OPTION') !=3D '']}"
+EXTRA_OECONF:prepend:class-nativesdk =3D "--disable-vala "
+EXTRA_OEMESON:prepend:class-nativesdk =3D "${@['', '${VALAMESONBUILD}'][=
d.getVar('VALA_MESON_OPTION') !=3D '']}"
+
 # Package additional files
 FILES:${PN}-dev +=3D "\
     ${datadir}/vala/vapi/*.vapi \
diff --git a/meta/recipes-gnome/gcr/gcr_4.1.0.bb b/meta/recipes-gnome/gcr=
/gcr_4.1.0.bb
index 239d9806cc..79e5169298 100644
--- a/meta/recipes-gnome/gcr/gcr_4.1.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.1.0.bb
@@ -27,13 +27,11 @@ PACKAGECONFIG ??=3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
-	${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)} \
 "
 PACKAGECONFIG[gtk] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
 PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret,openssh"
 #'Use systemd socket activation for server programs'
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
-PACKAGECONFIG[vapi] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.4.0.bb
index d8aa2cd697..b44284b499 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb
@@ -24,5 +24,3 @@ GTKDOC_MESON_OPTION =3D 'gtk_doc'
 PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
-
-EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb b/meta/reci=
pes-gnome/libdazzle/libdazzle_3.44.0.bb
index 49ebc818b0..e561bfa22a 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb
@@ -15,5 +15,6 @@ DEPENDS =3D "glib-2.0-native glib-2.0 gtk+3"
 SRC_URI[archive.sha256sum] =3D "3cd3e45eb6e2680cb05d52e1e80dd8f9d59d4765=
212f0e28f78e6c1783d18eae"
=20
 GIR_MESON_OPTION =3D 'with_introspection'
+VALA_MESON_OPTION =3D "with_vapi"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
diff --git a/meta/recipes-gnome/libportal/libportal_0.7.1.bb b/meta/recip=
es-gnome/libportal/libportal_0.7.1.bb
index 22e45559c9..e754096b5e 100644
--- a/meta/recipes-gnome/libportal/libportal_0.7.1.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.7.1.bb
@@ -17,4 +17,4 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 ${@bb.utils.contains('DISTR=
O_FEATURES', 'opengl', 'gtk4', '', d)}"
=20
-EXTRA_OEMESON =3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dva=
pi=3Dtrue', '-Dvapi=3Dfalse', d)} -Dbackend-qt5=3Ddisabled"
+EXTRA_OEMESON =3D "-Dbackend-qt5=3Ddisabled"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.56.3.bb
index 4b9aaeecbe..03d7cc92f2 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
@@ -57,10 +57,8 @@ CVE_STATUS[CVE-2018-1000041] =3D "not-applicable-platf=
orm: Issue only applies on W
 CACHED_CONFIGUREVARS =3D "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=3D${STAGING=
_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
=20
 PACKAGECONFIG ??=3D "gdkpixbuf"
-PACKAGECONFIG:append:class-target =3D " ${@bb.utils.contains('GI_DATA_EN=
ABLED', 'True', 'vala', '', d)}"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] =3D "--enable-pixbuf-loader,--disable-pixbuf-lo=
ader,gdk-pixbuf-native"
-PACKAGECONFIG[vala] =3D "--enable-vala,--disable-vala"
=20
 do_install:append() {
 	# Loadable modules don't need .a or .la on Linux
diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/re=
cipes-support/appstream/appstream_0.16.3.bb
index bde679e256..dafeff2555 100644
--- a/meta/recipes-support/appstream/appstream_0.16.3.bb
+++ b/meta/recipes-support/appstream/appstream_0.16.3.bb
@@ -40,6 +40,4 @@ PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemmi=
ng=3Dfalse,libstemmer"
=20
 FILES:${PN} +=3D "${datadir}"
=20
-EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
-
 BBCLASSEXTEND =3D "native"
--=20
2.42.0


