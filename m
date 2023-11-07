Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A7FC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:01:42 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.7183.1699351297747083929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 02:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 6A0E215779
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Nov 2023 11:01:35 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.54]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0Itq-4YZ7tB0; Tue, 7 Nov 2023 11:01:34 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][RFC][PATCH] vala.bbclass: enable vapi build if class is inherited
Date: Tue,  7 Nov 2023 11:01:49 +0100
Message-ID: <20231107100149.1048627-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699351294-3FFFCEA2-2C0F4D18/0/0 CLEAN NORMAL
X-TOI-MSGID: bad6a41c-d908-4ed9-9b77-b967ac0f25e8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 10:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190261

Try to enable vapi build automatically if GI_DATA_ENABLED =3D True.
Do it basically the same way it is done for gi

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/vala.bbclass              | 23 +++++++++++++++++++
 .../libdazzle/libdazzle_3.44.0.bb             |  1 +
 .../appstream/appstream_0.16.3.bb             |  2 --
 3 files changed, 24 insertions(+), 2 deletions(-)

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


