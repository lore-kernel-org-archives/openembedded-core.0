Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA267C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 15:11:42 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.205785.1672326701644001073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 07:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout07.t-online.de (Postfix) with SMTP id 210C317B35
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:11:40 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.205]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAuZH-2Izhp30; Thu, 29 Dec 2022 16:11:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gtk-icon-cache.bbclass: replace += by :append
Date: Thu, 29 Dec 2022 16:11:10 +0100
Message-Id: <20221229151110.224320-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672326699-2F7FF535-C3544359/0/0 CLEAN NORMAL
X-TOI-MSGID: b09a9885-09d0-4bf5-ab03-d1ec3aa75e8c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175101

While updating gnome-control-center I encountered an issue where
gtk-update-icon-cache could not be found and do_configure failed:

| Program glib-compile-schemas found: YES (glib-compile-schemas)
| Program gtk4-update-icon-cache found: NO
| Program gtk-update-icon-cache found: NO
|
| ../gnome-control-center-43.2/meson.build:298:6: ERROR: Program 'gtk-upd=
ate-icon-cache' not found or not executable

This can be fixed by using DEPENDS:append instead of DEPENDS +=3D

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/gtk-icon-cache.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/gtk-icon-cache.bbclass b/meta/classes-re=
cipe/gtk-icon-cache.bbclass
index 9ecb49916c..2096dcfcbb 100644
--- a/meta/classes-recipe/gtk-icon-cache.bbclass
+++ b/meta/classes-recipe/gtk-icon-cache.bbclass
@@ -16,10 +16,11 @@ GTKIC_CMD =3D "${@ 'gtk4-update-icon-cache' if d.getV=
ar('GTKIC_VERSION') =3D=3D '4' el
 inherit features_check
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-DEPENDS +=3D" ${@ '' if d.getVar('BPN') =3D=3D 'hicolor-icon-theme' else=
 'hicolor-icon-theme' } \
-            ${@ '' if d.getVar('BPN') =3D=3D 'gdk-pixbuf' else 'gdk-pixb=
uf' } \
-            ${@ '' if d.getVar('BPN') =3D=3D d.getVar('GTKPN') else d.ge=
tVar('GTKPN') } \
-            ${GTKPN}-native \
+DEPENDS:append =3D " \
+	${@ '' if d.getVar('BPN') =3D=3D 'hicolor-icon-theme' else 'hicolor-ico=
n-theme' } \
+	${@ '' if d.getVar('BPN') =3D=3D 'gdk-pixbuf' else 'gdk-pixbuf' } \
+	${@ '' if d.getVar('BPN') =3D=3D d.getVar('GTKPN') else d.getVar('GTKPN=
') } \
+	${GTKPN}-native \
 "
=20
 PACKAGE_WRITE_DEPS +=3D "${GTKPN}-native gdk-pixbuf-native"
--=20
2.34.1


