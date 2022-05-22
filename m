Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81881C433EF
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 08:48:26 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.14164.1653209296976799116
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 01:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout07.t-online.de (Postfix) with SMTP id 08B3E313
	for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 10:48:14 +0200 (CEST)
Received: from localhost.localdomain ([84.163.33.213]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nshG0-29T2lp0; Sun, 22 May 2022 10:48:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv5 5/5] libsdl2: add PACKAGECONFIG options
Date: Sun, 22 May 2022 10:47:52 +0200
Message-Id: <20220522084752.1855131-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220522084752.1855131-1-f_l_k@t-online.de>
References: <20220522084752.1855131-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653209293-0000C4DD-75783EAC/0/0 CLEAN NORMAL
X-TOI-MSGID: 1c205275-83e4-4e65-b939-b5c1ea6687d4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 08:48:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165971

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.20.bb
index 358efc8694..1f18aa35f8 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -61,7 +61,7 @@ PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATU=
RES', 'opengl gles2', d)}"
=20
 PACKAGECONFIG ??=3D " \
     ${PACKAGECONFIG_GL} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11 =
wayland', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pipewire pulsea=
udio x11 wayland', d)} \
     ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
 "
 PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"
@@ -70,7 +70,12 @@ PACKAGECONFIG[directfb]   =3D "-DSDL_DIRECTFB=3DON,-DS=
DL_DIRECTFB=3DOFF,directfb,direc
 PACKAGECONFIG[gles2]      =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
 PACKAGECONFIG[jack]       =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"
 PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libd=
rm virtual/libgbm"
+PACKAGECONFIG[libdecor]   =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND=
_LIBDECOR=3DOFF,libdecor,libdecor"
+# The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
+#  so we'll just use libusb when it's available.
+PACKAGECONFIG[libusb] =3D ",,libusb1"
 PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
+PACKAGECONFIG[pipewire]   =3D "-DSDL_PIPEWIRE=3DON,-DSDL_PIPEWIRE=3DOFF,=
pipewire"
 PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
 PACKAGECONFIG[wayland]    =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wa=
yland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/li=
bx11 libxext libxrandr libxrender"
--=20
2.25.1


