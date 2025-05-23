Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F65C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 08:51:18 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.43792.1747990275264982789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 01:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout05.t-online.de (Postfix) with SMTP id 829BB1E38
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 10:51:13 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.17]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uIO7T-1DZQKf0; Fri, 23 May 2025 10:51:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: make asahi dependent on opencl
Date: Fri, 23 May 2025 10:51:03 +0200
Message-ID: <20250523085103.654849-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747990271-FE7FA569-6013CAA7/0/0 CLEAN NORMAL
X-TOI-MSGID: dd22b711-d0a8-4ef9-8018-f784d905d637
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 08:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217181

asahi not only depends on libclc but also requires rusticl

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 5262b3001e..0caf5d0a18 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -102,7 +102,7 @@ PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}=
"
 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
=20
 VULKAN_DRIVERS_AMD =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',a=
md', '', d)}"
-VULKAN_DRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc', ',asahi', '', d)}"
+VULKAN_DRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc opencl', ',asahi', '', d)}"
 VULKAN_DRIVERS_INTEL =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel l=
ibclc', ',intel', '', d)}"
 VULKAN_DRIVERS_SWRAST =3D ",swrast"
 # Crashes on x32
@@ -170,7 +170,7 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'v3d', ',v3d', ''
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zink',=
 ',zink', '', d)}"
=20
 # radeonsi requires LLVM
-GALLIUMDRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc', ',asahi', '', d)}"
+GALLIUMDRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc opencl', ',asahi', '', d)}"
 GALLIUMDRIVERS_IRIS =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel li=
bclc', ',iris', '', d)}"
 GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd'=
, ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
--=20
2.49.0


