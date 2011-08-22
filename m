Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUJ-0006yL-7w
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:56:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970249"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:48 -0700
Message-Id: <9367246f3304f18ffb82a2b588337a073d830b51.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/19] tune: Add hard floating point variants of cortexa8 tunes
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
X-List-Received-Date: Mon, 22 Aug 2011 21:56:55 -0000

From: Darren Hart <dvhart@linux.intel.com>

Enable machines or distros to select the hard floating point abi for cortexa8
machines. I left out the arm7a thumb+neon combinations as they were not
present in the original non-hf set.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/conf/machine/include/tune-cortexa8.inc |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 67c5f0b..edd1717 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -5,12 +5,22 @@ require conf/machine/include/arm/arch-armv7a.inc
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", "-mtune=cortex-a8", "", d)}"
 
-AVAILTUNES += "cortexa8 cortexa8t"
+# Little Endian base configs
+AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon"
 TUNE_FEATURES_tune-cortexa8 = "${TUNE_FEATURES_tune-armv7a} cortexa8"
 TUNE_FEATURES_tune-cortexa8t = "${TUNE_FEATURES_tune-armv7at} cortexa8"
-TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-cortexa8} neon"
-
+TUNE_FEATURES_tune-cortexa8-neon = "${TUNE_FEATURES_tune-armv7a-neon} cortexa8"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8 = "${PACKAGE_EXTRA_ARCHS_tune-armv7a}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8t = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
 PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon}"
 
+# VFP Tunes
+AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon"
+TUNE_FEATURES_tune-cortexa8hf ?= "${TUNE_FEATURES_tune-armv7ahf} cortexa8"
+TUNE_FEATURES_tune-cortexa8thf ?= "${TUNE_FEATURES_tune-armv7athf} cortexa8"
+TUNE_FEATURES_tune-cortexa8hf-neon ?= "${TUNE_FEATURES_tune-armv7ahf-neon} cortexa8"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8thf = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf}"
+PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon}"
+
+
-- 
1.7.6



