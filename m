Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id 294CE60249
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 00:38:41 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6700IW9TS2EM50@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2016 19:38:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=mDV3o1hIAAAA:8
	a=Oe5AkTeDd5ir9bbEqjoA:9 a=enP4xquki5MA:10
Received: by 100.15.86.14 with SMTP id 6aea45d3; Tue, 26 Apr 2016 00:38:26 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 136A5161BC9;	Mon,
	25 Apr 2016 20:38:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 20:38:24 -0400
Message-id: <1461631104-25529-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] arch-armv7ve: inherit armv7a tunes file
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
X-List-Received-Date: Tue, 26 Apr 2016 00:38:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

armv7a is a subset of armv7ve:
https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html

   -march=armv7ve is the armv7-a architecture with virtualization extensions.

By inheriting armv7a from armv7ve it's possible for e.g. Cortex-A15 machines
to include tune-cortexa15.inc and have a full range of optimizations, but
set DEFAULTTUNE as "armv7a" to produce binaries compatible with Cortex-A8
machines, etc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/conf/machine/include/arm/arch-armv7ve.inc | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index 79e1ef6..e13156c 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -5,8 +5,7 @@ TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
 
-require conf/machine/include/arm/arch-armv6.inc
-require conf/machine/include/arm/feature-arm-neon.inc
+require conf/machine/include/arm/arch-armv7a.inc
 
 # Little Endian base configs
 AVAILTUNES += "armv7ve armv7vet armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3 armv7ve-neon armv7vet-neon armv7ve-neon-vfpv4 armv7vet-neon-vfpv4"
@@ -30,8 +29,8 @@ TUNE_FEATURES_tune-armv7ve-neon        = "${TUNE_FEATURES_tune-armv7ve}  neon"
 TUNE_FEATURES_tune-armv7vet-neon       = "${TUNE_FEATURES_tune-armv7vet} neon"
 TUNE_FEATURES_tune-armv7ve-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon}  vfpv4"
 TUNE_FEATURES_tune-armv7vet-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon} vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-armv7ve             = "${PACKAGE_EXTRA_ARCHS_tune-armv6}  armv7ve armv7ve-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7vet            = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7ve armv7ve-vfp armv7vet2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ve             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}  armv7ve armv7ve-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vet            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ve armv7ve-vfp armv7vet2-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve}  armv7ve-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vet-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv7ve-vfpv3d16 armv7vet2-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-vfpv3d16}  armv7ve-vfpv3"
@@ -63,8 +62,8 @@ TUNE_FEATURES_tune-armv7vehf-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}
 TUNE_FEATURES_tune-armv7vethf-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       callconvention-hard"
 TUNE_FEATURES_tune-armv7vehf-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  callconvention-hard"
 TUNE_FEATURES_tune-armv7vethf-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehf             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf}  armv7vehf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7vethf            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7vehf-vfp armv7vet2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}  armv7vehf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7vehf-vfp armv7vet2hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf}  armv7vehf-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethf-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv7vehf-vfpv3d16 armv7vet2hf-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-vfpv3d16}  armv7vehf-vfpv3"
@@ -96,8 +95,8 @@ TUNE_FEATURES_tune-armv7veb-neon        = "${TUNE_FEATURES_tune-armv7ve-neon}
 TUNE_FEATURES_tune-armv7vetb-neon       = "${TUNE_FEATURES_tune-armv7vet-neon}       bigendian"
 TUNE_FEATURES_tune-armv7veb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7ve-neon-vfpv4}  bigendian"
 TUNE_FEATURES_tune-armv7vetb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vet-neon-vfpv4} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7veb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6b}  armv7veb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7vetb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb} armv7veb-vfp armv7vet2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7veb             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ab}  armv7veb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vetb            = "${PACKAGE_EXTRA_ARCHS_tune-armv7atb} armv7veb-vfp armv7vet2b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb}  armv7veb-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vetb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv7veb-vfpv3d16 armv7vet2b-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7veb-vfpv3d16}  armv7veb-vfpv3"
@@ -129,8 +128,8 @@ TUNE_FEATURES_tune-armv7vehfb-neon        = "${TUNE_FEATURES_tune-armv7vehf-neon
 TUNE_FEATURES_tune-armv7vethfb-neon       = "${TUNE_FEATURES_tune-armv7vethf-neon}       bigendian"
 TUNE_FEATURES_tune-armv7vehfb-neon-vfpv4  = "${TUNE_FEATURES_tune-armv7vehf-neon-vfpv4}  bigendian"
 TUNE_FEATURES_tune-armv7vethfb-neon-vfpv4 = "${TUNE_FEATURES_tune-armv7vethf-neon-vfpv4} bigendian"
-PACKAGE_EXTRA_ARCHS_tune-armv7vehfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb}  armv7vehfb-vfp"
-PACKAGE_EXTRA_ARCHS_tune-armv7vethfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7vehfb-vfp armv7vet2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vehfb             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb}  armv7vehfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7vethfb            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7vehfb-vfp armv7vet2hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16    = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb}  armv7vehfb-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vethfb-vfpv3d16   = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv7vehfb-vfpv3d16 armv7vet2hfb-vfpv3d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb-vfpv3d16}  armv7vehfb-vfpv3"
-- 
2.2.0


