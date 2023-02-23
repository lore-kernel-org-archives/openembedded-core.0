Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196C9C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 22:44:25 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.3853.1677192262015211963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 14:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id 6739D1D7F5
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 23:44:19 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.239.43]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pVKK2-29hcMT0; Thu, 23 Feb 2023 23:44:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv5] vte: update 0.70.2 -> 0.70.3
Date: Thu, 23 Feb 2023 23:44:11 +0100
Message-Id: <20230223224411.4043797-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1677192258-E4D742C2-9AAEE086/0/0 CLEAN NORMAL
X-TOI-MSGID: ceeced58-91d6-4f5a-99d3-ed64d1660663
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 22:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177636

- Allow to build the gtk4 widget and vapi
  This is needed to build gtk4 based terminals like blackbox
- Update dependencies
- Cleanup recipe

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../vte/{vte_0.70.2.bb =3D> vte_0.70.3.bb}      | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-support/vte/{vte_0.70.2.bb =3D> vte_0.70.3.bb} (70%)

diff --git a/meta/recipes-support/vte/vte_0.70.2.bb b/meta/recipes-suppor=
t/vte/vte_0.70.3.bb
similarity index 70%
rename from meta/recipes-support/vte/vte_0.70.2.bb
rename to meta/recipes-support/vte/vte_0.70.3.bb
index ec2fb1f522..a194b4067f 100644
--- a/meta/recipes-support/vte/vte_0.70.2.bb
+++ b/meta/recipes-support/vte/vte_0.70.3.bb
@@ -11,34 +11,32 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057 \
 "
=20
-DEPENDS =3D "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
+DEPENDS =3D "fribidi glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native=
 icu pango zlib"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D 'gir'
 GIDOCGEN_MESON_OPTION =3D "docs"
=20
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection vala
=20
-# vapigen.m4 is required when vala is not present (but the one from vala=
 should be used normally)
 SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
-SRC_URI[archive.sha256sum] =3D "4d15b4380de3f564d57eabd006389c407c705df5=
b0c70030fdcc24971a334d80"
+SRC_URI[archive.sha256sum] =3D "9457134a02f3157fca04f7e0d39bdb0f3099be0a=
3ce82b7139d0c98a80748f23"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-# Help g-ir-scanner find the .so for linking
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
-}
-
 # Package additional files
 FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
=20
-PACKAGECONFIG ??=3D "gnutls"
-PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala"
+PACKAGECONFIG:class-target ??=3D " \
+    gnutls \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'gir vala', '', d)} =
\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
+"
+PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
+PACKAGECONFIG[gir] =3D "-Dgir=3Dtrue,-Dgir=3Dfalse"
+PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
 PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd=
"
-# vala requires gir
-PACKAGECONFIG:remove:class-native =3D "vala"
=20
 CFLAGS +=3D "-D_GNU_SOURCE"
=20
--=20
2.34.1


