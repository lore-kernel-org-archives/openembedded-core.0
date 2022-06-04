Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F6DC43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 05:30:58 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.7340.1654320646447514622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 22:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id A4D979A05
	for <openembedded-core@lists.openembedded.org>;
 Sat,  4 Jun 2022 07:30:44 +0200 (CEST)
Received: from localhost.localdomain ([84.163.41.60]) by fwd71.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxMN0-0Vhqdg0; Sat, 4 Jun 2022 07:30:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2 4/6] libsdl2: dont mix opengl and gles backends for
 wayland
Date: Sat,  4 Jun 2022 07:30:26 +0200
Message-Id: <20220604053028.4682-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220604053028.4682-1-f_l_k@t-online.de>
References: <20220604053028.4682-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654320642-014319F2-8E712E3B/0/0 CLEAN NORMAL
X-TOI-MSGID: f54f53bf-4ad7-4df0-a212-53956c0cb3c4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 05:30:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166534

This fixes "Could not initialize egl display" in libsdl2 apps for
wayland without DISTRO_FEATURE x11

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.22.bb
index 8519e7f732..e057b5cbbc 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
@@ -56,14 +56,16 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -D=
SDL_ARTS=3DOFF \
=20
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
-PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d=
)}"
+PACKAGECONFIG_GL ?=3D " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', =
d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'gles2', '=
', d)} \
+"
=20
 PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}"
 PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
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


