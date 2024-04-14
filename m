Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F14C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 14:06:45 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.32886.1713103596584753728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 07:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout12.t-online.de (Postfix) with SMTP id CC2A523FD
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 16:06:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.46.194]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rw0V7-2H1t9l0; Sun, 14 Apr 2024 16:06:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH] xwayland: update 23.2.5 -> 23.2.6
Date: Sun, 14 Apr 2024 16:06:52 +0200
Message-ID: <20240414140652.102954-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713103593-4FFFCD04-86FA59CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a34e36a-9da6-4238-87b9-09551340e926
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 14:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198209

- add a PACKAGECONFIG for libdecor

! This will require to move libei from meta-oe to oe-core !

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xwayland/{xwayland_23.2.5.bb =3D> xwayland_23.2.6.bb}      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.5.bb =3D> xwayland_=
23.2.6.bb} (89%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_23.2.6.bb
similarity index 89%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
index b934a873d1..62241a1258 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.6.bb
@@ -10,20 +10,21 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5df87950af51ac2c5822094553ea1=
880"
=20
 SRC_URI =3D "https://www.x.org/archive/individual/xserver/xwayland-${PV}=
.tar.xz"
-SRC_URI[sha256sum] =3D "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f=
526a625ff9f4bd90"
+SRC_URI[sha256sum] =3D "1c9a366b4e7ccadba0f9bd313c59eae12d23bd72543b22a2=
6eaf8b20835cfc6d"
=20
 UPSTREAM_CHECK_REGEX =3D "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
=20
 inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-DEPENDS +=3D "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayla=
nd-native wayland-protocols libdrm libepoxy libxcvt"
+DEPENDS +=3D "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayla=
nd-native wayland-protocols libdrm libei libepoxy libxcvt"
=20
 OPENGL_PKGCONFIGS =3D "glx glamor dri3"
 PACKAGECONFIG ??=3D "${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${=
OPENGL_PKGCONFIGS}', '', d)} \
 "
 PACKAGECONFIG[dri3] =3D "-Ddri3=3Dtrue,-Ddri3=3Dfalse,libxshmfence"
+PACKAGECONFIG[libdecor] =3D "-Dlibdecor=3Dtrue,-Dlibdecor=3Dfalse,libdec=
or"
 PACKAGECONFIG[glx] =3D "-Dglx=3Dtrue,-Dglx=3Dfalse,virtual/libgl virtual=
/libx11"
 PACKAGECONFIG[glamor] =3D "-Dglamor=3Dtrue,-Dglamor=3Dfalse,libepoxy vir=
tual/libgbm,libegl"
 PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libunw=
ind"
--=20
2.44.0


