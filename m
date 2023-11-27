Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2439EC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:02:17 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.91724.1701079329608426040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 24B262221B
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 11:02:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.136]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r7YRK-3UzVnF0; Mon, 27 Nov 2023 11:02:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] add PREFERRED_PROVIDER variables for llvm
Date: Mon, 27 Nov 2023 11:02:04 +0100
Message-ID: <20231127100204.236485-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701079326-39FF895D-DE720904/0/0 CLEAN NORMAL
X-TOI-MSGID: 3e50e6ff-4613-4954-bf76-a25e69d2ce85
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191265

gallium-llvm needs to be built with clang if you, for example
want to have support for opencl or want to build the intel-clc compiler.
meta-clang recommends to set

PREFERRED_PROVIDER_llvm =3D "clang"
PREFERRED_PROVIDER_llvm-native =3D "clang-native"

The current problem is that this is not taken into account in mesa and th=
erefore
both llvm and clang are included. This leads to files that are provided b=
y both
packages and would also unnecessarily increase the build time.

Add PREFERRED_PROVIDER_llvm and PREFERRED_PROVIDER_llvm-native and make s=
ure that the mesa recipe takes these variables into account.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/default-providers.inc | 2 ++
 meta/recipes-graphics/mesa/mesa.inc            | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
index d18173c744..819d71628b 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -37,6 +37,8 @@ PREFERRED_PROVIDER_dbus-glib ?=3D "dbus-glib"
 PREFERRED_PROVIDER_dbus-glib-native ?=3D "dbus-glib-native"
 PREFERRED_PROVIDER_gdk-pixbuf ?=3D "gdk-pixbuf"
 PREFERRED_PROVIDER_libgcc ?=3D "libgcc"
+PREFERRED_PROVIDER_llvm ?=3D "llvm"
+PREFERRED_PROVIDER_llvm-native ?=3D "llvm-native"
 PREFERRED_PROVIDER_nativesdk-libgcc ?=3D "nativesdk-libgcc"
 PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers"
 PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?=3D "nativesdk-linux-li=
bc-headers"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index e5c405a972..1a971242c9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -183,7 +183,7 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'r600', ',r600',
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'virgl'=
, ',virgl', '', d)}"
=20
 PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@strip_comma('${GALLIU=
MDRIVERS}')}, -Dgallium-drivers=3D'', libdrm"
-PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denable=
d, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
+PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denable=
d, -Dllvm=3Ddisabled, ${PREFERRED_PROVIDER_llvm} ${PREFERRED_PROVIDER_llv=
m-native} elfutils"
 PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Ddisabled"
 PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,li=
bva-initial"
 PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddi=
sabled,libvdpau"
--=20
2.42.1


