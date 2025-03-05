Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A792C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 16:55:35 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.18389.1741193726445850969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 08:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout05.t-online.de (Postfix) with SMTP id 56358AB4
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Mar 2025 17:55:24 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.117]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tps1i-4aRAWn0; Wed, 5 Mar 2025 17:55:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libsdl2: fix PACKAGECONFIG for libusb
Date: Wed,  5 Mar 2025 17:55:59 +0100
Message-ID: <20250305165559.1200289-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741193723-46FFA99A-45D2BA49/0/0 CLEAN NORMAL
X-TOI-MSGID: 88665bf9-e52d-40f2-8ba1-326910a85729
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 16:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212344

libusb is required to support some older low level input
devices. Meanwhile this is guarded by an option:
SDL_HIDAPI_LIBUSB

Use it for the PACKAGECONFIG to allow build with libusb support again

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb b/meta/reci=
pes-graphics/libsdl2/libsdl2_2.30.12.bb
index 8f4d41ad84..b0ad55e314 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
@@ -70,7 +70,7 @@ PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_=
KMSDRM=3DOFF,libdrm virtual/lib
 PACKAGECONFIG[libsamplerate] =3D "-DSDL_LIBSAMPLERATE=3DON,-DSDL_LIBSAMP=
LERATE=3DOFF,libsamplerate0"
 # The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
 #  so we'll just use libusb when it's available.
-PACKAGECONFIG[libusb] =3D ",,libusb1"
+PACKAGECONFIG[libusb] =3D "-DSDL_HIDAPI_LIBUSB=3DON,-DSDL_HIDAPI_LIBUSB=3D=
OFF,libusb1"
 PACKAGECONFIG[libdecor] =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND_L=
IBDECOR=3DOFF,libdecor,libdecor"
 PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
 PACKAGECONFIG[pipewire] =3D "-DSDL_PIPEWIRE_SHARED=3DON,-DSDL_PIPEWIRE_S=
HARED=3DOFF,pipewire"
--=20
2.48.1


