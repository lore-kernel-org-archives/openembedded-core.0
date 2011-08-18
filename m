Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QtvyT-00030B-TO
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 08:21:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Aug 2011 23:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208,223";a="38924491"
Received: from unknown (HELO envy.home) ([10.255.14.197])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2011 23:16:10 -0700
Message-ID: <4E4CAE28.8050600@linux.intel.com>
Date: Wed, 17 Aug 2011 23:16:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH][RFC] cortexa8: use hard floating point
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
X-List-Received-Date: Thu, 18 Aug 2011 06:21:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From what I could gather, it makes sense to address using mfloat-abi=hard
for the beagleboard in the cortexa8 tune file. Before I submit this as a pull
request, I'd appreciate a sanity check from the Beagleboard experts.

Is there any reason the cortexa8 tune file should not be using "hf" by default?

Thanks,

Darren

--------
Fixes [YOCTO #1203]

mfloat-abi is currently set to soft for beagleboard (cortexa8) and needs to be
set to hard to take advantage of the floating point hardware.

Append "hf" to each of the cortexa8 TUNE_FEATURES and PACKAGE_EXTRA_ARCHS
variables. This enables "callconvention-hard" from the included
arch-armv7a.inc.

Add a missing closing quote to the VFP AVAILTUNES append operation.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/machine/include/arm/arch-armv7a.inc |    2 +-
 meta/conf/machine/include/tune-cortexa8.inc   |   10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 704f86b..d508352 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -20,7 +20,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a ar
 PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon
+AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon"
 TUNE_FEATURES_tune-armv7ahf ?= "${TUNE_FEATURES_tune-armv7a} callconvention-hard"
 TUNE_FEATURES_tune-armv7athf ?= "${TUNE_FEATURES_tune-armv7at} callconvention-hard"
 TUNE_FEATURES_tune-armv7ahf-neon ?= "${TUNE_FEATURES_tune-armv7a-neon} callconvention-hard"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 02b560c..e7483b9 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -6,11 +6,11 @@ TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
 
 AVAILTUNES += "cortexa8 cortexa8t"
-TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
-TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
+TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
+TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7athf} cortexa8"
 TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-cortexa8} neon"
 
-PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
 
-- 
1.7.1
-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


