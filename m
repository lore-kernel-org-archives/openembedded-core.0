Return-Path: <phil.edworthy@renesas.com>
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
	[210.160.252.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA68B6C55F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 10:10:00 +0000 (UTC)
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
	by relmlie6.idc.renesas.com with ESMTP; 28 Nov 2018 19:10:00 +0900
Received: from vbox.ree.adwin.renesas.com (unknown [10.226.37.67])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C4C6C40244B7;
	Wed, 28 Nov 2018 19:09:59 +0900 (JST)
From: Phil Edworthy <phil.edworthy@renesas.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 10:09:57 +0000
Message-Id: <20181128100957.29244-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] arch-armv7*.inc: Add Cortex vfpv4-d16 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2018 10:10:01 -0000

Some ARM Cortex devices have the VFPv4-D16, but no NEON.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
The additional lines for vpfv4d16 are basically copies of the vpfv3d16 lines.
Tested with thud on Renesas RZ/N1 (Cortex A7 with VFPv4-D16, no NEON), also
applies to sumo.
---
 meta/conf/machine/include/arm/arch-armv7a.inc      | 32 +++++++++++++++++++---
 meta/conf/machine/include/arm/arch-armv7ve.inc     | 32 +++++++++++++++++++---
 meta/conf/machine/include/arm/feature-arm-neon.inc |  3 ++
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  3 +-
 4 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index a2663d8..199e63f 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -10,13 +10,15 @@ require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-vfpv3 armv7at-vfpv3 armv7a-neon armv7at-neon armv7a-neon-vfpv4 armv7at-neon-vfpv4"
+AVAILTUNES += "armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16 armv7a-vfpv3 armv7at-vfpv3 armv7a-vfpv4d16 armv7at-vfpv4d16 armv7a-neon armv7at-neon armv7a-neon-vfpv4 armv7at-neon-vfpv4"
 ARMPKGARCH_tune-armv7a             ?= "armv7a"
 ARMPKGARCH_tune-armv7at            ?= "armv7a"
 ARMPKGARCH_tune-armv7a-vfpv3d16    ?= "armv7a"
 ARMPKGARCH_tune-armv7at-vfpv3d16   ?= "armv7a"
 ARMPKGARCH_tune-armv7a-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7at-vfpv3      ?= "armv7a"
+ARMPKGARCH_tune-armv7a-vfpv4d16    ?= "armv7a"
+ARMPKGARCH_tune-armv7at-vfpv4d16   ?= "armv7a"
 ARMPKGARCH_tune-armv7a-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7at-neon       ?= "armv7a"
 ARMPKGARCH_tune-armv7a-neon-vfpv4  ?= "armv7a"
@@ -27,6 +29,8 @@ TUNE_FEATURES_tune-armv7a-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a} vfpv3d16"
 TUNE_FEATURES_tune-armv7at-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at} vfpv3d16"
 TUNE_FEATURES_tune-armv7a-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3d16} vfpv3"
 TUNE_FEATURES_tune-armv7at-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} vfpv3"
+TUNE_FEATURES_tune-armv7a-vfpv4d16    = "${TUNE_FEATURES_tune-armv7a} vfpv4d16"
+TUNE_FEATURES_tune-armv7at-vfpv4d16   = "${TUNE_FEATURES_tune-armv7at} vfpv4d16"
 TUNE_FEATURES_tune-armv7a-neon        = "${TUNE_FEATURES_tune-armv7a} neon"
 TUNE_FEATURES_tune-armv7at-neon       = "${TUNE_FEATURES_tune-armv7at} neon"
 TUNE_FEATURES_tune-armv7a-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon} vfpv4"
@@ -37,19 +41,23 @@ PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a
 PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfpv3d16 armv7at2-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3d16} armv7a-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3d16} armv7a-vfpv3 armv7at2-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv4d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfpv4d16 armv7at2-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-neon armv7at2-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} armv7a-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} armv7a-neon-vfpv4 armv7at2-neon-vfpv4"
 
 # HF Tunes
-AVAILTUNES += "armv7ahf armv7athf armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3 armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
+AVAILTUNES += "armv7ahf armv7athf armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3 armv7ahf-vfpv4d16 armv7athf-vfpv4d16 armv7ahf-neon armv7athf-neon armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4"
 ARMPKGARCH_tune-armv7ahf             ?= "armv7a"
 ARMPKGARCH_tune-armv7athf            ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-vfpv3d16    ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-vfpv3d16   ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-vfpv3      ?= "armv7a"
+ARMPKGARCH_tune-armv7ahf-vfpv4d16    ?= "armv7a"
+ARMPKGARCH_tune-armv7athf-vfpv4d16   ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7athf-neon       ?= "armv7a"
 ARMPKGARCH_tune-armv7ahf-neon-vfpv4  ?= "armv7a"
@@ -60,6 +68,8 @@ TUNE_FEATURES_tune-armv7ahf-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}
 TUNE_FEATURES_tune-armv7athf-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-vfpv4d16    = "${TUNE_FEATURES_tune-armv7a-vfpv4d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-vfpv4d16   = "${TUNE_FEATURES_tune-armv7at-vfpv4d16} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon        = "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf-neon       = "${TUNE_FEATURES_tune-armv7at-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} callconvention-hard"
@@ -70,19 +80,23 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfpv3d16 armv7at2hf-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3d16} armv7ahf-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3d16} armv7ahf-vfpv3 armv7at2hf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv4d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfpv4d16 armv7at2hf-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-neon armv7at2hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} armv7ahf-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} armv7ahf-neon-vfpv4 armv7at2hf-neon-vfpv4"
 
 # Big Endian
-AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-neon armv7atb-neon armv7ab-neon-vfpv4 armv7atb-neon-vfpv4"
+AVAILTUNES += "armv7ab armv7atb armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3 armv7ab-vfpv4d16 armv7atb-vfpv4d16 armv7ab-neon armv7atb-neon armv7ab-neon-vfpv4 armv7atb-neon-vfpv4"
 ARMPKGARCH_tune-armv7ab             ?= "armv7a"
 ARMPKGARCH_tune-armv7atb            ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-vfpv3d16    ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-vfpv3d16   ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-vfpv3      ?= "armv7a"
+ARMPKGARCH_tune-armv7ab-vfpv4d16    ?= "armv7a"
+ARMPKGARCH_tune-armv7atb-vfpv4d16   ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7atb-neon       ?= "armv7a"
 ARMPKGARCH_tune-armv7ab-neon-vfpv4  ?= "armv7a"
@@ -93,6 +107,8 @@ TUNE_FEATURES_tune-armv7ab-vfpv3d16    = "${TUNE_FEATURES_tune-armv7a-vfpv3d16}
 TUNE_FEATURES_tune-armv7atb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7at-vfpv3d16} bigendian"
 TUNE_FEATURES_tune-armv7ab-vfpv3       = "${TUNE_FEATURES_tune-armv7a-vfpv3} bigendian"
 TUNE_FEATURES_tune-armv7atb-vfpv3      = "${TUNE_FEATURES_tune-armv7at-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7ab-vfpv4d16    = "${TUNE_FEATURES_tune-armv7a-vfpv4d16} bigendian"
+TUNE_FEATURES_tune-armv7atb-vfpv4d16   = "${TUNE_FEATURES_tune-armv7at-vfpv4d16} bigendian"
 TUNE_FEATURES_tune-armv7ab-neon        = "${TUNE_FEATURES_tune-armv7a-neon} bigendian"
 TUNE_FEATURES_tune-armv7atb-neon       = "${TUNE_FEATURES_tune-armv7at-neon} bigendian"
 TUNE_FEATURES_tune-armv7ab-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7a-neon-vfpv4} bigendian"
@@ -103,19 +119,23 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfpv3d16 armv7at2b-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv3d16} armv7ab-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfpv3d16} armv7ab-vfpv3 armv7at2b-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-vfp43d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-vfpv4d16 armv7at2b-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab} armv7ab-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7ab-neon armv7at2b-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon} armv7ab-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon} armv7ab-neon-vfpv4 armv7at2b-neon-vfpv4"
 
 # Big Endian + HF
-AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-neon armv7athfb-neon armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4"
+AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3 armv7ahfb-vfpv4d16 armv7athfb-vfpv4d16 armv7ahfb-neon armv7athfb-neon armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4"
 ARMPKGARCH_tune-armv7ahfb             ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb            ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-vfpv3d16    ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-vfpv3d16   ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-vfpv3       ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-vfpv3      ?= "armv7a"
+ARMPKGARCH_tune-armv7ahfb-vfpv4d16    ?= "armv7a"
+ARMPKGARCH_tune-armv7athfb-vfpv4d16   ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-neon        ?= "armv7a"
 ARMPKGARCH_tune-armv7athfb-neon       ?= "armv7a"
 ARMPKGARCH_tune-armv7ahfb-neon-vfpv4  ?= "armv7a"
@@ -126,6 +146,8 @@ TUNE_FEATURES_tune-armv7ahfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ahf-vfpv3d
 TUNE_FEATURES_tune-armv7athfb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7athf-vfpv3d16} bigendian"
 TUNE_FEATURES_tune-armv7ahfb-vfpv3       = "${TUNE_FEATURES_tune-armv7ahf-vfpv3} bigendian"
 TUNE_FEATURES_tune-armv7athfb-vfpv3      = "${TUNE_FEATURES_tune-armv7athf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7ahfb-vfpv4d16    = "${TUNE_FEATURES_tune-armv7ahf-vfpv4d16} bigendian"
+TUNE_FEATURES_tune-armv7athfb-vfpv4d16   = "${TUNE_FEATURES_tune-armv7athf-vfpv4d16} bigendian"
 TUNE_FEATURES_tune-armv7ahfb-neon        = "${TUNE_FEATURES_tune-armv7ahf-neon} bigendian"
 TUNE_FEATURES_tune-armv7athfb-neon       = "${TUNE_FEATURES_tune-armv7athf-neon} bigendian"
 TUNE_FEATURES_tune-armv7ahfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ahf-neon-vfpv4} bigendian"
@@ -136,6 +158,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-arm
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfpv3d16 armv7at2hfb-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv3d16} armv7ahfb-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv3d16} armv7ahfb-vfpv3 armv7at2hfb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-vfpv4d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfpv4d16 armv7at2hfb-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-neon armv7at2hfb-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon} armv7ahfb-neon-vfpv4"
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index 4d9260f..fc172d0 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -8,13 +8,15 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:'
 require conf/machine/include/arm/arch-armv7a.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv7ve armv7vet armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3 armv7ve-neon armv7vet-neon armv7ve-neon-vfpv4 armv7vet-neon-vfpv4"
+AVAILTUNES += "armv7ve armv7vet armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3 armv7ve-vfpv4d16 armv7vet-vfpv4d16 armv7ve-neon armv7vet-neon armv7ve-neon-vfpv4 armv7vet-neon-vfpv4"
 ARMPKGARCH_tune-armv7ve             ?= "armv7ve"
 ARMPKGARCH_tune-armv7vet            ?= "armv7ve"
 ARMPKGARCH_tune-armv7ve-vfpv3d16    ?= "armv7ve"
 ARMPKGARCH_tune-armv7vet-vfpv3d16   ?= "armv7ve"
 ARMPKGARCH_tune-armv7ve-vfpv3       ?= "armv7ve"
 ARMPKGARCH_tune-armv7vet-vfpv3      ?= "armv7ve"
+ARMPKGARCH_tune-armv7ve-vfpv4d16    ?= "armv7ve"
+ARMPKGARCH_tune-armv7vet-vfpv4d16   ?= "armv7ve"
 ARMPKGARCH_tune-armv7ve-neon        ?= "armv7ve"
 ARMPKGARCH_tune-armv7vet-neon       ?= "armv7ve"
 ARMPKGARCH_tune-armv7ve-neon-vfpv4  ?= "armv7ve"
@@ -25,6 +27,8 @@ TUNE_FEATURES_tune-armv7ve-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve} vfpv3d16
 TUNE_FEATURES_tune-armv7vet-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet} vfpv3d16"
 TUNE_FEATURES_tune-armv7ve-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16} vfpv3"
 TUNE_FEATURES_tune-armv7vet-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} vfpv3"
+TUNE_FEATURES_tune-armv7ve-vfpv4d16    = "${TUNE_FEATURES_tune-armv7ve} vfpv4d16"
+TUNE_FEATURES_tune-armv7vet-vfpv4d16   = "${TUNE_FEATURES_tune-armv7vet} vfpv4d16"
 TUNE_FEATURES_tune-armv7ve-neon        = "${TUNE_FEATURES_tune-armv7ve} neon"
 TUNE_FEATURES_tune-armv7vet-neon       = "${TUNE_FEATURES_tune-armv7vet} neon"
 TUNE_FEATURES_tune-armv7ve-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon} vfpv4"
@@ -35,19 +39,23 @@ PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfpv3d16 armv7vet2-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16} armv7ve-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16} armv7ve-vfpv3 armv7vet2-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv4d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfpv4d16 armv7vet2-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} armv7ve-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-neon armv7vet2-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} armv7ve-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} armv7ve-neon-vfpv4 armv7vet2-neon-vfpv4"
 
 # HF Tunes
-AVAILTUNES += "armv7vehf armv7vethf armv7vehf-vfpv3d16 armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3 armv7vehf-neon armv7vethf-neon armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4"
+AVAILTUNES += "armv7vehf armv7vethf armv7vehf-vfpv3d16 armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3 armv7vehf-vfpv4d16 armv7vethf-vfpv4d16 armv7vehf-neon armv7vethf-neon armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4"
 ARMPKGARCH_tune-armv7vehf             ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethf            ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehf-vfpv3d16    ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethf-vfpv3d16   ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehf-vfpv3       ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethf-vfpv3      ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehf-vfpv4d16    ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethf-vfpv4d16   ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehf-neon        ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethf-neon       ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehf-neon-vfpv4  ?= "armv7ve"
@@ -58,6 +66,8 @@ TUNE_FEATURES_tune-armv7vehf-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv3d1
 TUNE_FEATURES_tune-armv7vethf-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} callconvention-hard"
 TUNE_FEATURES_tune-armv7vehf-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3} callconvention-hard"
 TUNE_FEATURES_tune-armv7vethf-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3} callconvention-hard"
+TUNE_FEATURES_tune-armv7vehf-vfpv4d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv4d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7vethf-vfpv4d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv4d16} callconvention-hard"
 TUNE_FEATURES_tune-armv7vehf-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7vethf-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7vehf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} callconvention-hard"
@@ -68,19 +78,23 @@ PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-arm
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfpv3d16 armv7vet2hf-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16} armv7vehf-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16} armv7vehf-vfpv3 armv7vet2hf-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} armv7vehf-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv4d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfpv4d16 armv7vet2hf-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} armv7vehf-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-neon armv7vet2hf-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} armv7vehf-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} armv7vehf-neon-vfpv4 armv7vet2hf-neon-vfpv4"
 
 # Big Endian
-AVAILTUNES += "armv7veb armv7vetb armv7veb-vfpv3d16 armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3 armv7veb-neon armv7vetb-neon armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4"
+AVAILTUNES += "armv7veb armv7vetb armv7veb-vfpv3d16 armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3 armv7veb-vfpv4d16 armv7vetb-vfpv4d16 armv7veb-neon armv7vetb-neon armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4"
 ARMPKGARCH_tune-armv7veb             ?= "armv7ve"
 ARMPKGARCH_tune-armv7vetb            ?= "armv7ve"
 ARMPKGARCH_tune-armv7veb-vfpv3d16    ?= "armv7ve"
 ARMPKGARCH_tune-armv7vetb-vfpv3d16   ?= "armv7ve"
 ARMPKGARCH_tune-armv7veb-vfpv3       ?= "armv7ve"
 ARMPKGARCH_tune-armv7vetb-vfpv3      ?= "armv7ve"
+ARMPKGARCH_tune-armv7veb-vfpv4d16    ?= "armv7ve"
+ARMPKGARCH_tune-armv7vetb-vfpv4d16   ?= "armv7ve"
 ARMPKGARCH_tune-armv7veb-neon        ?= "armv7ve"
 ARMPKGARCH_tune-armv7vetb-neon       ?= "armv7ve"
 ARMPKGARCH_tune-armv7veb-neon-vfpv4  ?= "armv7ve"
@@ -91,6 +105,8 @@ TUNE_FEATURES_tune-armv7veb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv3d16
 TUNE_FEATURES_tune-armv7vetb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv3d16} bigendian"
 TUNE_FEATURES_tune-armv7veb-vfpv3       = "${TUNE_FEATURES_tune-armv7ve-vfpv3} bigendian"
 TUNE_FEATURES_tune-armv7vetb-vfpv3      = "${TUNE_FEATURES_tune-armv7vet-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7veb-vfpv4d16    = "${TUNE_FEATURES_tune-armv7ve-vfpv4d16} bigendian"
+TUNE_FEATURES_tune-armv7vetb-vfpv4d16   = "${TUNE_FEATURES_tune-armv7vet-vfpv4d16} bigendian"
 TUNE_FEATURES_tune-armv7veb-neon        = "${TUNE_FEATURES_tune-armv7ve-neon} bigendian"
 TUNE_FEATURES_tune-armv7vetb-neon       = "${TUNE_FEATURES_tune-armv7vet-neon} bigendian"
 TUNE_FEATURES_tune-armv7veb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} bigendian"
@@ -101,19 +117,23 @@ PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-vfpv3d16 armv7vet2b-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16} armv7veb-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16} armv7veb-vfpv3 armv7vet2b-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv7veb-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv4d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-vfpv4d16 armv7vet2b-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv7veb-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-neon armv7vet2b-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-neon} armv7veb-neon-vfpv4"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb-neon} armv7veb-neon-vfpv4 armv7vet2b-neon-vfpv4"
 
 # Big Endian + HF
-AVAILTUNES += "armv7vehfb armv7vethfb armv7vehfb-vfpv3d16 armv7vethfb-vfpv3d16 armv7vehfb-vfpv3 armv7vethfb-vfpv3 armv7vehfb-neon armv7vethfb-neon armv7vehfb-neon-vfpv4 armv7vethfb-neon-vfpv4"
+AVAILTUNES += "armv7vehfb armv7vethfb armv7vehfb-vfpv3d16 armv7vethfb-vfpv3d16 armv7vehfb-vfpv3 armv7vethfb-vfpv3 armv7vehfb-vfpv4d16 armv7vethfb-vfpv4d16 armv7vehfb-neon armv7vethfb-neon armv7vehfb-neon-vfpv4 armv7vethfb-neon-vfpv4"
 ARMPKGARCH_tune-armv7vehfb             ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethfb            ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehfb-vfpv3d16    ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethfb-vfpv3d16   ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehfb-vfpv3       ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethfb-vfpv3      ?= "armv7ve"
+ARMPKGARCH_tune-armv7vehfb-vfpv4d16    ?= "armv7ve"
+ARMPKGARCH_tune-armv7vethfb-vfpv4d16   ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehfb-neon        ?= "armv7ve"
 ARMPKGARCH_tune-armv7vethfb-neon       ?= "armv7ve"
 ARMPKGARCH_tune-armv7vehfb-neon-vfpv4  ?= "armv7ve"
@@ -124,6 +144,8 @@ TUNE_FEATURES_tune-armv7vehfb-vfpv3d16    = "${TUNE_FEATURES_tune-armv7vehf-vfpv
 TUNE_FEATURES_tune-armv7vethfb-vfpv3d16   = "${TUNE_FEATURES_tune-armv7vethf-vfpv3d16} bigendian"
 TUNE_FEATURES_tune-armv7vehfb-vfpv3       = "${TUNE_FEATURES_tune-armv7vehf-vfpv3} bigendian"
 TUNE_FEATURES_tune-armv7vethfb-vfpv3      = "${TUNE_FEATURES_tune-armv7vethf-vfpv3} bigendian"
+TUNE_FEATURES_tune-armv7vehfb-vfpv4d16    = "${TUNE_FEATURES_tune-armv7vehf-vfpv4d16} bigendian"
+TUNE_FEATURES_tune-armv7vethfb-vfpv4d16   = "${TUNE_FEATURES_tune-armv7vethf-vfpv4d16} bigendian"
 TUNE_FEATURES_tune-armv7vehfb-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon} bigendian"
 TUNE_FEATURES_tune-armv7vethfb-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon} bigendian"
 TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4} bigendian"
@@ -134,6 +156,8 @@ PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-ar
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfpv3d16 armv7vet2hfb-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16} armv7vehfb-vfpv3"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16} armv7vehfb-vfpv3 armv7vet2hfb-vfpv3"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv4d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb} armv7vehfb-vfpv4d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv4d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfpv4d16 armv7vet2hfb-vfpv4d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb} armv7vehfb-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-neon armv7vet2hfb-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-neon} armv7vehfb-neon-vfpv4"
diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index b34af8e..eaddd05 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -16,3 +16,6 @@ TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' vfpv3', ''
 TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' vfpv4', '', d)}"
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv4', 'neon' ], ' neon-vfpv4', '', d)}"
+
+TUNEVALID[vfpv4d16] = "Enable Vector Floating Point Version 4 with 16 registers (vfpv4-d16) unit."
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4d16', ' vfpv4-d16', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 7ae7456..678888e 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -6,7 +6,8 @@ TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vfp', '', d)}"
 
 TUNE_CCARGS  .= "${@ (' -mfpu=%s' % d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
-ARMPKGSFX_FPU = "${@ ('-%s'       % d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
+# The following deals with both vfpv3-d16 and vfpv4-d16
+ARMPKGSFX_FPU = "${@ ('-%s'       % d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('-d16', 'd16')) if (d.getVar('TUNE_CCARGS_MFPU') != '') else ''}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
 TUNE_CCARGS_MFLOAT = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') != '') else '' }"
-- 
2.7.4


