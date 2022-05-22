Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A167FC433EF
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 08:48:16 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web09.14662.1653209288201482290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 01:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id 7BDF032C6
	for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 10:48:05 +0200 (CEST)
Received: from localhost.localdomain ([84.163.33.213]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nshFs-29T2ll0; Sun, 22 May 2022 10:48:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv5 1/5] libsdl2: align native and target build
Date: Sun, 22 May 2022 10:47:48 +0200
Message-Id: <20220522084752.1855131-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653209284-0000C4DD-550F63A0/0/0 CLEAN NORMAL
X-TOI-MSGID: 910bf1c9-3360-406a-9d12-763d31914a62
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 08:48:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165967

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.20.bb
index c1c827af79..358efc8694 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -57,14 +57,11 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -D=
SDL_ARTS=3DOFF \
=20
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
-PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d=
)}"
+PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl gle=
s2', d)}"
=20
-PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}"
-PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??=3D " \
     ${PACKAGECONFIG_GL} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11'=
, d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', =
'', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11 =
wayland', d)} \
     ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
 "
 PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"
--=20
2.25.1


