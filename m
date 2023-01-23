Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEFCC25B50
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 18:00:11 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.49979.1674496800445991599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 10:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id 0B90C11866
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 18:59:58 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.33.181]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pK16r-4QxFxp0; Mon, 23 Jan 2023 18:59:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gtk+3: add PACKAGECONFIG for libcloudservice and tracker; fix cups backend
Date: Mon, 23 Jan 2023 18:59:48 +0100
Message-Id: <20230123175948.5509-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674496797-167FD778-AC5F6642/0/0 CLEAN NORMAL
X-TOI-MSGID: 83d5bcd9-6189-4903-80ef-a2ec2ec4cb1f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 18:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176315

Add options to enable support for libcloudprovider and tracker

If the cups backend is enabled, the mandatory file backend gets disabled =
and
thus configure fails. Fix it by not defining the print-backend and just i=
nclude cups
as a dependency. Additionally add it as a runtime dependency.

Now, if cups gets enabled, it should include the following print-backends
by default: cups,lpr,file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
index 1d726b5696..8d01e6077f 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -41,8 +41,10 @@ PACKAGECONFIG[x11] =3D "-Dx11_backend=3Dtrue,-Dx11_bac=
kend=3Dfalse,at-spi2-atk fontcon
 # this is provided by oe-core patch that removes epoxy/gl dependency fro=
m a X11 build
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue,-Dopengl=3Dfalse,libepoxy"
 PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-Dwayland_backend=3D=
false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2=
 wayland-native"
-PACKAGECONFIG[cups] =3D "-Dprint_backends=3Dcups,-Dprint_backends=3Dfile=
,cups"
+PACKAGECONFIG[cups] =3D ",,cups,cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
+PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovid=
ers=3Dfalse,libcloudproviders"
+PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tracke=
r,tracker-miners"
=20
 prepare_gtk_scripts() {
     mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon=
-cache-3.0
--=20
2.34.1


