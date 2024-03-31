Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20649CD128A
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 16:07:16 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.19435.1711901234671435353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 09:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout09.t-online.de (Postfix) with SMTP id A0A8169786
	for <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 18:06:44 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.46.245]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rqxhk-263rCz0; Sun, 31 Mar 2024 18:06:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] vte: update 0.74.2 -> 0.76.0
Date: Sun, 31 Mar 2024 18:06:55 +0200
Message-ID: <20240331160655.2455620-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711901204-0A7FB923-02A56208/0/0 CLEAN NORMAL
X-TOI-MSGID: e588538f-982e-44e1-aed5-4162ef932a2d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 16:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197665

- add missing lz4 dependency
- add PACKAGECONFIG for gtk+3
- if wayland and opengl are available, gtk4 will be used
- for plain x11 it can be built with or without opengl depending on DISTR=
O_FEATURE

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/vte/{vte_0.74.2.bb =3D> vte_0.76.0.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/vte/{vte_0.74.2.bb =3D> vte_0.76.0.bb} (87%)

diff --git a/meta/recipes-support/vte/vte_0.74.2.bb b/meta/recipes-suppor=
t/vte/vte_0.76.0.bb
similarity index 87%
rename from meta/recipes-support/vte/vte_0.74.2.bb
rename to meta/recipes-support/vte/vte_0.76.0.bb
index d8eafde2fb..701b7417e3 100644
--- a/meta/recipes-support/vte/vte_0.74.2.bb
+++ b/meta/recipes-support/vte/vte_0.76.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057 \
 "
=20
-DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gper=
f-native icu"
+DEPENDS =3D "glib-2.0 glib-2.0-native lz4 libpcre2 libxml2-native gperf-=
native icu"
=20
 GIR_MESON_OPTION =3D 'gir'
 GIDOCGEN_MESON_OPTION =3D "docs"
@@ -19,7 +19,7 @@ GIDOCGEN_MESON_OPTION =3D "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection systemd vala
=20
 SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
-SRC_URI[archive.sha256sum] =3D "a535fb2a98fea8a2449cd1a02cccf5190131dddf=
f52e715afdace3feb536eae7"
+SRC_URI[archive.sha256sum] =3D "bbce30b8f504370b12d6439c07a82993e97d7e9a=
fe2dd367817cd58ff029ffda"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
@@ -29,9 +29,10 @@ EXTRA_OEMESON:append =3D " ${@bb.utils.contains('GI_DA=
TA_ENABLED', 'False', '-Ddoc
 PACKAGECONFIG ??=3D " \
 	gnutls \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'gtk4', 'gtk3=
', d)} \
 "
 PACKAGECONFIG[fribidi] =3D "-Dfribidi=3Dtrue,-Dfribidi=3Dfalse,fribidi"
+PACKAGECONFIG[gtk3] =3D "-Dgtk3=3Dtrue,-Dgtk3=3Dfalse,gtk+3"
 PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
 PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd=
"
--=20
2.44.0


