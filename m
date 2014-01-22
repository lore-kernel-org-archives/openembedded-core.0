Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 744C26CDF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:53:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 16:49:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470435606"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 16:53:09 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 16:58:50 -0800
Message-Id: <063e274c29765319b8db44b21ea516ddd0e3c032.1390351667.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
References: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390351667.git.dvhart@linux.intel.com>
References: <cover.1390351667.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 05/19] tune: Make 32b or 64b explicit in tune name for core2
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
X-List-Received-Date: Wed, 22 Jan 2014 00:53:38 -0000

Core2 has both a 32b and a 64b variant. Currently, core2 implies 32b,
while core2_64 is the 64b version. This implicit 32b mode will become
confusing in later architectures, such as corei7, where it would be
natural for people to assume "corei7" meant 64 bit.

Rather than carrying forward an implicit 32b mode and rather than
changing the naming scheme part way through the architecture hiearchy,
make the 32b and 64b variant explicit in the tune name by changing core2
to core2_32.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
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


