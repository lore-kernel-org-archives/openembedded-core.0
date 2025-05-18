Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0078EC54754
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 16:10:35 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.32754.1747584626453212120
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 09:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id ED046FD2
	for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 18:10:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.15]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uGgaj-1CsWhe0; Sun, 18 May 2025 18:10:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/2] mesa: add support for asahi drivers
Date: Sun, 18 May 2025 18:10:10 +0200
Message-ID: <20250518161010.1879511-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518161010.1879511-1-f_l_k@t-online.de>
References: <20250518161010.1879511-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747584621-E57F84CC-68A1B200/0/0 CLEAN NORMAL
X-TOI-MSGID: 669b8cb7-a805-4175-94ed-bf274a5ca121
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 16:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216780

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 47edf0d512..07a57b11c8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -102,11 +102,12 @@ PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEP=
S}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
=20
 VULKAN_DRIVERS_AMD =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',a=
md', '', d)}"
+VULKAN_DRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc', ',asahi', '', d)}"
 VULKAN_DRIVERS_INTEL =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel l=
ibclc', ',intel', '', d)}"
 VULKAN_DRIVERS_SWRAST =3D ",swrast"
 # Crashes on x32
 VULKAN_DRIVERS_SWRAST:x86-x32 =3D ""
-VULKAN_DRIVERS_LLVM =3D "${VULKAN_DRIVERS_SWRAST}${VULKAN_DRIVERS_AMD}${=
VULKAN_DRIVERS_INTEL}"
+VULKAN_DRIVERS_LLVM =3D "${VULKAN_DRIVERS_SWRAST}${VULKAN_DRIVERS_AMD}${=
VULKAN_DRIVERS_ASAHI}${VULKAN_DRIVERS_INTEL}"
=20
 VULKAN_DRIVERS =3D ""
 VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
@@ -169,13 +170,14 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PA=
CKAGECONFIG', 'v3d', ',v3d', ''
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zink',=
 ',zink', '', d)}"
=20
 # radeonsi requires LLVM
+GALLIUMDRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc', ',asahi', '', d)}"
 GALLIUMDRIVERS_IRIS =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel li=
bclc', ',iris', '', d)}"
 GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd'=
, ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
 # llvmpipe crashes on x32
 GALLIUMDRIVERS_LLVMPIPE:x86-x32 =3D ""
 GALLIUMDRIVERS_SVGA =3D "${@bb.utils.contains('PACKAGECONFIG', 'svga', '=
,svga', '', d)}"
-GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIU=
MDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"
+GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIU=
MDRIVERS_ASAHI}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}${GALLIUMD=
RIVERS_SVGA}"
=20
 PACKAGECONFIG[amd] =3D ""
 PACKAGECONFIG[svga] =3D ""
@@ -201,6 +203,8 @@ PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-=
Dgallium-vdpau=3Ddisabled,libvdpa
=20
 PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimagination-s=
rv=3Dfalse"
=20
+PACKAGECONFIG[asahi] =3D ""
+
 PACKAGECONFIG[intel] =3D ""
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel'=
, ',i915,crocus', '', d)}"
=20
--=20
2.49.0


