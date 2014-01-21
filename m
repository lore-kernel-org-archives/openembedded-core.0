Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7426E81A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:34:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 14:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470375494"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 14:39:51 -0800
Message-Id: <efb13775e1004bf339bf4f56373923ad59f55272.1390342768.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
References: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390342768.git.dvhart@linux.intel.com>
References: <cover.1390342768.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 05/15] tune: Make 32b or 64b explicit in tune name for core2
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
X-List-Received-Date: Tue, 21 Jan 2014 22:34:23 -0000

Core2 has both a 32b and a 64b variant. Currently, core2 implies 32b,
while core2_64 is the 64b version. This implicit 32b mode will become
confusing in later architectures, such as corei7, where it would be
natural for people to assume "corei7" meant 64 bit.

Rather than carrying forward an implicit 32b mode and rather than
changing the naming scheme part way through the architecture hiearchy,
make the 32b and 64b variant explicit in the tune name by changing core2
to core2_32.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/conf/machine/include/tune-core2.inc |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 2500a74..11517dc 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -6,7 +6,7 @@
 # This tune is recommended for the Intel Core 2 CPU family, including Conroe,
 # Merom and beyond, as well as the first Atom CPUs, Diamondville, and beyond.
 #
-DEFAULTTUNE ?= "core2"
+DEFAULTTUNE ?= "core2-32"
 
 # Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
 require conf/machine/include/tune-i586.inc
@@ -16,11 +16,11 @@ TUNEVALID[core2] = "Enable core2 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "core2", " -march=core2 -mtune=core2 -msse3 -mfpmath=sse", "", d)}"
 
 # Extra tune selections
-AVAILTUNES += "core2"
-TUNE_FEATURES_tune-core2 = "${TUNE_FEATURES_tune-x86} core2"
-BASE_LIB_tune-core2 = "lib"
-TUNE_PKGARCH_tune-core2 = "core2"
-PACKAGE_EXTRA_ARCHS_tune-core2 = "${PACKAGE_EXTRA_ARCHS_tune-i586} core2"
+AVAILTUNES += "core2-32"
+TUNE_FEATURES_tune-core2-32 = "${TUNE_FEATURES_tune-x86} core2"
+BASE_LIB_tune-core2-32 = "lib"
+TUNE_PKGARCH_tune-core2-32 = "core2_32"
+PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i586} core2_32"
 
 AVAILTUNES += "core2-64"
 TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
-- 
1.7.9.5


