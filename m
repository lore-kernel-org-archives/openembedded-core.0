Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEp-00069o-Fm
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 May 2011 18:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; 
   d="scan'208";a="2310652"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2011 18:32:27 -0700
Message-Id: <72fe1428a39b19acd1669a95a93b5844e31e6cb8.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Wed, 11 May 2011 14:05:02 -0700
Date: Sat, 14 May 2011 18:32:27 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 10/15] tune-cortexa8.inc: Define variable for controlling FP ABI
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
X-List-Received-Date: Sun, 15 May 2011 01:35:22 -0000

From: Khem Raj <raj.khem@gmail.com>

ARM_FP_ABI also is poked from gcc configure to enable hardfp
for parameter

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-cortexa8.inc |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index a5b982a..d5e15c6 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -3,11 +3,17 @@
 # [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html 
 # [3] https://support.codesourcery.com/GNUToolchain/kbentry29
 
-TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -fno-tree-vectorize"
+# Can be one of ['softfp' 'hardfp']
+ARM_FP_ABI ?= "softfp"
+
+ARM_FP_OPT = "${@['-mfloat-abi=softfp', '-mfloat-abi=hard'][bb.data.getVar('ARM_FP_ABI', d, 1) == 'hardfp']}"
+ARM_FP_PACKAGESUFFIX = "${@['', '-hardfp'][bb.data.getVar('ARM_FP_ABI', d, 1) == 'hardfp']}"
+
+TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon ${ARM_FP_OPT} -fno-tree-vectorize"
 
 # Other potentially useful options
 #-ftree-vectorize -ffast-math -fno-omit-frame-pointer
 
-FEED_ARCH = "armv7a"
-BASE_PACKAGE_ARCH = "armv7a"
-PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a"
+FEED_ARCH = "armv7a${ARM_FP_PACKAGESUFFIX}"
+BASE_PACKAGE_ARCH = "armv7a${ARM_FP_PACKAGESUFFIX}"
+PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a${ARM_FP_PACKAGESUFFIX}"
-- 
1.7.1.1



