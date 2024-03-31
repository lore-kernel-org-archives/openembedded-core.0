Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A1CD128A
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 15:58:45 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.19265.1711900722309323186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 08:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id 835061682D
	for <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 17:58:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.46.245]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rqxZu-3QbYQL0; Sun, 31 Mar 2024 17:58:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] gtk+3: disable wayland without opengl
Date: Sun, 31 Mar 2024 17:58:49 +0200
Message-ID: <20240331155849.2454690-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711900718-5958E94C-C3A006F9/0/0 CLEAN NORMAL
X-TOI-MSGID: 9440344f-a6cc-451b-bad7-c8ca37fc1fbf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 15:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197664

Wayland backend requires epoxy so it will pull in a requirement for openg=
l
While doing some tests in building old stuff like matchbox-terminal with
vte 0.76, I encountered an issue with building matchbox-terminal without
opengl in DISTRO_FEATURES.

Explicitly stating that the Wayland backend requires opengl fixes this pr=
oblem
and allows matchbox-terminal to be used without.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
index 4a04c06432..e1603b43fc 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -33,7 +33,10 @@ GTKDOC_MESON_OPTION =3D 'gtk_doc'
 EXTRA_OEMESON =3D "-Dxinerama=3Dno -Dtests=3Dfalse"
 EXTRA_OEMESON:append:class-native =3D " -Ddemos=3Dfalse -Dexamples=3Dfal=
se"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayla=
nd x11', d)}"
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'opengl x11', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'wayland', ''=
, d)} \
+"
 PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x=
11', d)}"
 PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)}"
=20
--=20
2.44.0


