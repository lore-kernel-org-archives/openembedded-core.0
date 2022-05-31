Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43664C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 19:06:50 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.1826.1654024008019603121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 12:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 895A97FB
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 21:06:46 +0200 (CEST)
Received: from localhost.localdomain ([84.163.46.125]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nw7CX-0ho03g0; Tue, 31 May 2022 21:06:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 4/4] libsdl2: dont mix opengl and gles backends for
 wayland
Date: Tue, 31 May 2022 21:06:20 +0200
Message-Id: <20220531190620.186764-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531190620.186764-1-f_l_k@t-online.de>
References: <20220531190620.186764-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654024005-01439E5E-123DE313/0/0 CLEAN NORMAL
X-TOI-MSGID: b6413099-f273-40de-8792-46fd17b9ca53
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 19:06:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166332

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


