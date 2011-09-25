Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <woglinde@rhein.zuhause.netz>) id 1R7uhJ-0007ta-In
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 21:49:09 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 004461100118;
	Sun, 25 Sep 2011 21:37:54 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CEC3A1100120;
	Sun, 25 Sep 2011 21:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225144251.adsl.alicedsl.de
	[92.225.144.251]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sun, 25 Sep 2011 21:37:51 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 867CF3000E; Sun, 25 Sep 2011 21:37:50 +0200 (CEST)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 21:37:47 +0200
Message-Id: <1316979467-687-4-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.6.3
In-Reply-To: <1316979467-687-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1316979467-687-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 3/3] tune: enable d16 feature for cortexa8 and cortexa9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Sep 2011 19:49:09 -0000


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 meta/conf/machine/include/arm/arch-armv7.inc  |   25 +++++++++++++++++++++----
 meta/conf/machine/include/arm/arch-armv7a.inc |   24 ++++++++++++++++++++----
 meta/conf/machine/include/tune-cortexa8.inc   |    8 ++++++--
 meta/conf/machine/include/tune-cortexa9.inc   |    8 ++++++--
 4 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/machine/include/arm/arch-armv7.inc
index 8bc8d10..0a45726 100644
--- a/meta/conf/machine/include/arm/arch-armv7.inc
+++ b/meta/conf/machine/include/arm/arch-armv7.inc
@@ -7,49 +7,66 @@ TUNE_CONFLICTS[armv7] = "armv4 armv5 armv6"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=armv7", "", d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
+require conf/machine/include/arm/feature-arm-d16.inc
 require conf/machine/include/arm/feature-arm-neon.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv7 armv7t armv7-neon armv7t-neon"
+AVAILTUNES += "armv7 armv7t armv7-d16 armv7t-d16 armv7-neon armv7t-neon"
 TUNE_FEATURES_tune-armv7 ?= "armv7 vfp"
 TUNE_FEATURES_tune-armv7t ?= "armv7 vfp thumb"
+TUNE_FEATURES_tune-armv7-d16 ?= "armv7 vfp d16"
+TUNE_FEATURES_tune-armv7t-d16 ?= "armv7 vfp d16 thumb"
 TUNE_FEATURES_tune-armv7-neon ?= "armv7 vfp neon"
 TUNE_FEATURES_tune-armv7t-neon ?= "armv7 vfp neon thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv7 = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7t = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7-vfp armv7t2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7-vfp-d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7t-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7-vfp-d16 armv7at2-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon
+AVAILTUNES += "armv7hf armv7thf armv7hf-d16 armv7thf-d16 armv7hf-neon armv7thf-neon"
 TUNE_FEATURES_tune-armv7hf ?= "${TUNE_FEATURES_tune-armv7} callconvention-hard"
 TUNE_FEATURES_tune-armv7thf ?= "${TUNE_FEATURES_tune-armv7t} callconvention-hard"
+TUNE_FEATURES_tune-armv7hf-d16 ?= "${TUNE_FEATURES_tune-armv7-vpf16} callconvention-hard"
+TUNE_FEATURES_tune-armv7thf-d16 ?= "${TUNE_FEATURES_tune_armv7t-d16} callconvention-hard"
 TUNE_FEATURES_tune-armv7hf-neon ?= "${TUNE_FEATURES_tune-armv7-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7thf-neon ?= "${TUNE_FEATURES_tune_armv7t-neon} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv7hf = "${PACKAGE_EXTRA_ARCHS_tune-armv6hf} armv7hf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7thf = "${PACKAGE_EXTRA_ARCHS_tune-armv6thf} armv7hf-vfp armv7t2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7hf-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7hf-vfp-d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7thf-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7hf-vfp-d16 armv7at2hf-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7hf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7thf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7hf-vfp-neon armv7at2hf-vfp-neon"
 
 # Big Endian
-AVAILTUNES += "armv7b armv7tb armv7b-neon armv7tb-neon"
+AVAILTUNES += "armv7b armv7tb armv7b-d16 armv7tb-d16 armv7b-neon armv7tb-neon"
 TUNE_FEATURES_tune-armv7b ?= "${TUNE_FEATURES_tune-armv7} bigendian"
 TUNE_FEATURES_tune-armv7tb ?= "${TUNE_FEATURES_tune-armv7t} bigendian"
+TUNE_FEATURES_tune-armv7b-d16 ?= "${TUNE_FEATURES_tune-armv7-d16} bigendian"
+TUNE_FEATURES_tune-armv7tb-d16 ?= "${TUNE_FEATURES_tune-armv7t-d16} bigendian"
 TUNE_FEATURES_tune-armv7b-neon ?= "${TUNE_FEATURES_tune-armv7-neon} bigendian"
 TUNE_FEATURES_tune-armv7tb-neon ?= "${TUNE_FEATURES_tune-armv7t-neon} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7b = "${PACKAGE_EXTRA_ARCHS_tune-armv6} armv7b-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7tb = "${PACKAGE_EXTRA_ARCHS_tune-armv6t} armv7b-vfp armv7t2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7b-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7b-vfp-d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7tb-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7b-vfp-d16 armv7at2b-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7b-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7b-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7tb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7b-vfp-neon armv7at2b-vfp-neon"
 
 # Big Endian + VFP
-AVAILTUNES += "armv7hfb armv7thfb armv7hfb-neon armv7thfb-neon"
+AVAILTUNES += "armv7hfb armv7thfb armv7hfb-d16 armv7thfb-d16 armv7hfb-neon armv7thfb-neon"
 TUNE_FEATURES_tune-armv7hfb ?= "${TUNE_FEATURES_tune-armv7b} callconvention-hard"
 TUNE_FEATURES_tune-armv7thfb ?= "${TUNE_FEATURES_tune-armv7tb} callconvention-hard"
+TUNE_FEATURES_tune-armv7hfb-d16 ?= "${TUNE_FEATURES_tune-armv7b-d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7thfb-d16 ?= "${TUNE_FEATURES_tune_armv7tb-d16} callconvention-hard"
 TUNE_FEATURES_tune-armv7hfb-neon ?= "${TUNE_FEATURES_tune-armv7b-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7thfb-neon ?= "${TUNE_FEATURES_tune_armv7tb-neon} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv7hfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6hfb} armv7hfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7thfb = "${PACKAGE_EXTRA_ARCHS_tune-armv6thfb} armv7hfb-vfp armv7t2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7hfb-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7hfb-vfp-d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7thfb-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7hfb-vfp-d16 armv7at2hfb-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7hfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7hfb-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7thfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7hfb-vfp-neon armv7at2hfb-vfp-neon"
 
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index d508352..c95ec72 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -9,46 +9,62 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a
 require conf/machine/include/arm/arch-armv7.inc
 
 # Little Endian base configs
-AVAILTUNES += "armv7a armv7at armv7a-neon armv7at-neon"
+AVAILTUNES += "armv7a armv7at armv7a-d16 armv7at-d16 armv7a-neon armv7at-neon"
 TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
 TUNE_FEATURES_tune-armv7at ?= "armv7a vfp thumb"
+TUNE_FEATURES_tune-armv7a-d16 ?= "armv7a vfp d16"
+TUNE_FEATURES_tune-armv7at-d16 ?= "armv7a vfp d16 thumb"
 TUNE_FEATURES_tune-armv7a-neon ?= "armv7a vfp neon"
 TUNE_FEATURES_tune-armv7at-neon ?= "armv7a vfp neon thumb"
 PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a armv7a-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7a-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a armv7a-vfp armv7at2-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7at-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-d16 armv7at2-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon"
+AVAILTUNES += "armv7hf armv7thf armv7hf-d16 armv7thf-d16 armv7hf-neon armv7thf-neon"
 TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahf-d16 ?= "${TUNE_FEATURES_tune-armv7a-d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7athf-d16 ?= "${TUNE_FEATURES_tune_armv7at-d16} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf-neon ?= "${TUNE_FEATURES_tune_armv7at-neon} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf = "${PACKAGE_EXTRA_ARCHS_tune-armv7hf} armv7ahf-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf = "${PACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7ahf-vfp armv7at2hf-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahf-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athf-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-d16 armv7at2hf-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} armv7ahf-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} armv7ahf-vfp-neon armv7at2hf-vfp-neon"
 
 # Big Endian
-AVAILTUNES += "armv7ab armv7atb armv7ab-neon armv7atb-neon"
+AVAILTUNES += "armv7ab armv7atb armv7ab-d16 armv7atb-d16 armv7ab-neon armv7atb-neon"
 TUNE_FEATURES_tune-armv7ab ?= "${TUNE_FEATURES_tune-armv7a} bigendian"
 TUNE_FEATURES_tune-armv7atb ?= "${TUNE_FEATURES_tune-armv7at} bigendian"
+TUNE_FEATURES_tune-armv7ab-d16 ?= "${TUNE_FEATURES_tune-armv7a-d16} bigendian"
+TUNE_FEATURES_tune-armv7atb-d16 ?= "${TUNE_FEATURES_tune-armv7at-d16} bigendian"
 TUNE_FEATURES_tune-armv7ab-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} bigendian"
 TUNE_FEATURES_tune-armv7atb-neon ?= "${TUNE_FEATURES_tune-armv7at-neon} bigendian"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7ab-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7ab-vfp armv7at2b-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ab-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7ab-vfp-d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7atb-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ab-vfp-d16 armv7at2b-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ab-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7ab-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7atb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7ab-vfp-neon armv7at2b-vfp-neon"
 
 # Big Endian + VFP
-AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon"
+AVAILTUNES += "armv7ahfb armv7athfb armv7ahfb-d16 armv7athfb-d16 armv7ahfb-neon armv7athfb-neon"
 TUNE_FEATURES_tune-armv7ahfb ?= "${TUNE_FEATURES_tune-armv7ab} callconvention-hard"
 TUNE_FEATURES_tune-armv7athfb ?= "${TUNE_FEATURES_tune-armv7atb} callconvention-hard"
+TUNE_FEATURES_tune-armv7ahfb-d16 ?= "${TUNE_FEATURES_tune-armv7ab-d16} callconvention-hard"
+TUNE_FEATURES_tune-armv7athfb-d16 ?= "${TUNE_FEATURES_tune_armv7atb-d16} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahfb-neon ?= "${TUNE_FEATURES_tune-armv7ab-neon} callconvention-hard"
 TUNE_FEATURES_tune-armv7athfb-neon ?= "${TUNE_FEATURES_tune_armv7atb-neon} callconvention-hard"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb = "${PACKAGE_EXTRA_ARCHS_tune-armv7hfb} armv7ahfb-vfp"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb = "${PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7ahfb-vfp armv7at2hfb-vfp"
+PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-d16"
+PACKAGE_EXTRA_ARCHS_tune-armv7athfb-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-d16 armv7at2hfb-vfp-d16"
 PACKAGE_EXTRA_ARCHS_tune-armv7ahfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahfb} armv7ahfb-vfp-neon"
 PACKAGE_EXTRA_ARCHS_tune-armv7athfb-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7athfb} armv7ahfb-vfp-neon armv7at2hfb-vfp-neon"
 
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 797f448..45f7fa9 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -6,19 +6,23 @@ TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon"
+AVAILTUNES += "cortexa8 cortexa8t cortexa8-d16 cortexa8-neon"
 TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
 TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
+TUNE_FEATURES_tune-cortexa8-d16 = "${TUNE_FEATURES_tune-armv7a-d16} cortexa8"
 TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-d16}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon}"
 
 # VFP Tunes
-AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon"
+AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-d16 cortexa8hf-neon"
 TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
 TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
+TUNE_FEATURES_tune-cortexa8hf-d16 ?= "${TUNE_FEATURES_tune-armv7ahf-d16} cortexa8"
 TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-d16}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 28049ab..f67fd15 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -6,19 +6,23 @@ TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", "-mtune=cortex-a9", "", d)}"
 
 # Little Endian base configs
-AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon"
+AVAILTUNES += "cortexa9 cortexa9t cortexa9-d16 cortexa9-neon"
 TUNE_FEATURES_tune-cortexa9 = "${TUNE_FEATURES_tune-armv7a} cortexa9"
 TUNE_FEATURES_tune-cortexa9t = "${TUNE_FEATURES_tune-armv7at} cortexa9"
+TUNE_FEATURES_tune-cortexa9-d16 = "${TUNE_FEATURES_tune-armv7a-d16} cortexa9"
 TUNE_FEATURES_tune-cortexa9-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa9"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-d16}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon}"
 
 # VFP Tunes
-AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon"
+AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-d16 cortexa9hf-neon"
 TUNE_FEATURES_tune-cortexa9hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa9"
 TUNE_FEATURES_tune-cortexa9thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa9"
+TUNE_FEATURES_tune-cortexa9hf-d16 ?= "${TUNE_FEATURES_tune-armv7ahf-d16} cortexa9"
 TUNE_FEATURES_tune-cortexa9hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa9"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-d16 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-d16}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
-- 
1.7.6.3


