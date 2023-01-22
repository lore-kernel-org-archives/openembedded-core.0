Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8A2C25B4E
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 07:08:01 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.14494.1674371273210344803
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jan 2023 23:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id C4BA21B57B
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 08:06:46 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.234]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pJURA-07Y1Ev0; Sun, 22 Jan 2023 08:06:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gtk4: add PACKAGECONFIG for cloudproviders
Date: Sun, 22 Jan 2023 08:06:32 +0100
Message-Id: <20230122070632.756193-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674371204-20E74D98-B93B6178/0/0 CLEAN NORMAL
X-TOI-MSGID: ebc30e27-fd66-478e-800c-d20c32d751e7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 07:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176257

- Add missing cups runtime dependency
- Create packages for the printbackends only for target
  This fixes:

  NOTE: Multiple providers are available for runtime gtk4-printbackend-cu=
ps (gtk4, gtk4-native)
  Consider defining a PREFERRED_RPROVIDER entry to match gtk4-printbacken=
d-cups
  NOTE: Multiple providers are available for runtime gtk4-printbackend-fi=
le (gtk4, gtk4-native)
  Consider defining a PREFERRED_RPROVIDER entry to match gtk4-printbacken=
d-file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk4_4.8.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.8.3.bb
index 6101905128..5112d3b38b 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
@@ -65,7 +65,8 @@ PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('=
DISTRO_FEATURES', 'x11', d)
=20
 PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-sp=
i2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr li=
bxrender libxcomposite libxfixes xinerama"
 PACKAGECONFIG[wayland] =3D "-Dwayland-backend=3Dtrue,-Dwayland-backend=3D=
false,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-nati=
ve"
-PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups"
+PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Denabled,-Dcloudpro=
viders=3Ddisabled,libcloudproviders"
+PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups,cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
 PACKAGECONFIG[ffmpeg] =3D "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddis=
abled,ffmpeg"
@@ -114,7 +115,7 @@ RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
 RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland"=
, "wayland-protocols", "", d)}"
=20
-PACKAGES_DYNAMIC +=3D "^gtk4-printbackend-.*"
+PACKAGES_DYNAMIC:class-target +=3D "^gtk4-printbackend-.*"
 python populate_packages:prepend () {
     import os.path
=20
--=20
2.34.1


