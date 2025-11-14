Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DF3CE7B05
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:28:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16810.1763123326983087193
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 761511063
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:28:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1C9D3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:28:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] mesa: assign to TOOLS and VULKAN_DRIVERS, don't chain :appends
Date: Fri, 14 Nov 2025 12:28:39 +0000
Message-ID: <20251114122841.649314-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226291

Every append has to be evaluated each time the variable is read, so
construct these variables using basic operators instead.

As the value turns into a comma separated list we still need to be
careful about whitespace.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 77 ++++++++++++++---------------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 6a36aea259f..001be529fca 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -116,39 +116,38 @@ PACKAGECONFIG[vc4] =3D ""
 PACKAGECONFIG[virgl] =3D ""
 PACKAGECONFIG[zink] =3D ""
=20
-VULKAN_DRIVERS =3D ""
=20
 VULKAN_DRIVERS_SWRAST =3D ",swrast"
 # Crashes on x32
 VULKAN_DRIVERS_SWRAST:x86-x32 =3D ""
=20
 # keep sorted by the driver name (rather than PKGCONFIG)
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd ga=
llium-llvm', ',amd', '', d)}"
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi =
libclc gallium-llvm', ',asahi', '', d)}"
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'broadc=
om', ',broadcom', '', d)}"
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagin=
ation', ',imagination-experimental', '', d)}"
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel =
libclc gallium-llvm', ',intel', '', d)}"
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'galliu=
m-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
-VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfro=
st libclc', ',panfrost', '', d)}"
+VULKAN_DRIVERS =3D ""
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-=
llvm', ',amd', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc=
 gallium-llvm', ',asahi', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', '=
,broadcom', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', =
',freedreno', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination'=
, ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc=
 gallium-llvm', ',intel', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm=
', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
+VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost lib=
clc', ',panfrost', '', d)}"
=20
 PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_D=
RIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-hea=
ders"
 PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3Dfal=
se"
=20
 # mesa development and testing tools support, per driver
-TOOLS =3D ""
-TOOLS_DEPS =3D ""
=20
 # keep sorted by the driver name (rather than PKGCONFIG)
-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi=
', '', d)}"
-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etn=
aviv', '', d)}"
-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',f=
reedreno', '', d)}"
-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination', '=
,imagination', '', d)}"
-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima',=
 '', d)}"
-TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',pa=
nfrost', '', d)}"
+TOOLS =3D ""
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '',=
 d)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv',=
 '', d)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedre=
no', '', d)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagi=
nation', '', d)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d=
)}"
+TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost=
', '', d)}"
=20
 # dependencies for tools.
-TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno'=
, ' ncurses libxml2 ', '', d)}"
+TOOLS_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncu=
rses libxml2 ', '', d)}"
=20
 # the fdperf tool requires libconfig (a part of meta-oe) so it needs spe=
cial
 # treatment in addition to the usual 'freedreno tools'.
@@ -157,7 +156,6 @@ PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
 PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TOOLS}')}, -Dtools=
=3D'', ${TOOLS_DEPS}"
 PACKAGECONFIG[xmlconfig] =3D "-Dxmlconfig=3Denabled, -Dxmlconfig=3Ddisab=
led, expat"
=20
-GALLIUMDRIVERS =3D ""
 GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
 GALLIUMDRIVERS_SOFTPIPE =3D ",softpipe"
 # gallium softpipe and llvmpipe was found to crash Xorg on startup in x3=
2 qemu
@@ -165,26 +163,27 @@ GALLIUMDRIVERS_LLVMPIPE:x86-x32 =3D ""
 GALLIUMDRIVERS_SOFTPIPE:x86-x32 =3D ""
=20
 # keep sorted by the driver name (rather than PKGCONFIG)
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi =
libclc gallium-llvm', ',asahi', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel'=
, ',crocus', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnavi=
v', ',etnaviv', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedr=
eno', ',freedreno', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel'=
, ',i915', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel =
libclc gallium-llvm', ',iris', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',=
 ',lima', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'galliu=
m-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'nouvea=
u gallium-llvm', ',nouveau', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfro=
st libclc', ',panfrost', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd ga=
llium-llvm', ',r300', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd', =
',r600', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd ga=
llium-llvm', ',radeonsi', '', d)}"
-GALLIUMDRIVERS:append =3D "${GALLIUMDRIVERS_SOFTPIPE}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'svga g=
allium-llvm', ',svga', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'tegra'=
, ',tegra', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'virgl'=
, ',virgl', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'vc4', =
',vc4', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d', =
',v3d', '', d)}"
-GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zink',=
 ',zink', '', d)}"
+GALLIUMDRIVERS =3D ""
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc=
 gallium-llvm', ',asahi', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',cr=
ocus', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',=
etnaviv', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', =
',freedreno', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i9=
15', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc=
 gallium-llvm', ',iris', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lim=
a', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm=
', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'nouveau gall=
ium-llvm', ',nouveau', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost lib=
clc', ',panfrost', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-=
llvm', ',r300', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600=
', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-=
llvm', ',radeonsi', '', d)}"
+GALLIUMDRIVERS .=3D "${GALLIUMDRIVERS_SOFTPIPE}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium=
-llvm', ',svga', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',te=
gra', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',vi=
rgl', '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4'=
, '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d'=
, '', d)}"
+GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zin=
k', '', d)}"
=20
 PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${@strip_comma('${GALLIU=
MDRIVERS}')}, -Dgallium-drivers=3D'', libdrm"
 PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denable=
d, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
--=20
2.43.0


