Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B89B16E30D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:53:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 16:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442600442"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 16:53:09 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 16:58:51 -0800
Message-Id: <02d30ff2a0efe917ef2dd2e2697e58e742fce346.1390351667.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
References: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390351667.git.dvhart@linux.intel.com>
References: <cover.1390351667.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 06/19] tune-corei7: Add support for cpu-type corei7
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
X-List-Received-Date: Wed, 22 Jan 2014 00:53:09 -0000

corei7 offers a significant advancement since the previous core2
cpu-type described in the tune-core2 file.

From the GCC(1):
Intel Core i7 CPU with 64-bit extensions, MMX, SSE, SSE2, SSE3,
               SSSE3, SSE4.1 and SSE4.2 instruction set support.

This offers optimizations for Nehalem and Silvermont (e.g. Bay Trail)
CPUs (and beyond).

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta/conf/machine/include/tune-corei7.inc |   35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-corei7.inc

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
new file mode 100644
index 0000000..5464fed
--- /dev/null
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -0,0 +1,35 @@
+# Settings for the GCC(1) cpu-type "corei7":
+#
+#     Intel Core i7 CPU with 64-bit extensions, MMX, SSE, SSE2, SSE3, SSSE3, SSE4.1
+#     and SSE4.2 instruction set support.
+#
+# This tune is recommended for Intel Nehalem and Silvermont (e.g. Bay Trail) CPUs
+# (and beyond).
+#
+DEFAULTTUNE ?= "corei7-64"
+
+# Pull in the previous tune in to pull in PACKAGE_EXTRA_ARCHS
+require conf/machine/include/tune-core2.inc
+
+# Extra tune features
+TUNEVALID[corei7] = "Enable corei7 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "corei7", " -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2", "", d)}"
+
+# Extra tune selections
+AVAILTUNES += "corei7-32"
+TUNE_FEATURES_tune-corei7-32 = "${TUNE_FEATURES_tune-x86} corei7"
+BASE_LIB_tune-corei7-32 = "lib"
+TUNE_PKGARCH_tune-corei7-32 = "corei7_32"
+PACKAGE_EXTRA_ARCHS_tune-corei7-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2} corei7_32"
+
+AVAILTUNES += "corei7-64"
+TUNE_FEATURES_tune-corei7-64 = "${TUNE_FEATURES_tune-x86-64} corei7"
+BASE_LIB_tune-corei7-64 = "lib64"
+TUNE_PKGARCH_tune-corei7-64 = "corei7_64"
+PACKAGE_EXTRA_ARCHS_tune-corei7-64 = "${PACKAGE_EXTRA_ARCHS_tune-core2-64} corei7_64"
+
+AVAILTUNES += "corei7-64-x32"
+TUNE_FEATURES_tune-corei7-64-x32 = "${TUNE_FEATURES_tune-x86-64-x32} corei7"
+BASE_LIB_tune-corei7-64-x32 = "libx32"
+TUNE_PKGARCH_tune-corei7-64-x32 = "corei7_64_x32"
+PACKAGE_EXTRA_ARCHS_tune-corei7-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-core2-64-x32} corei7_64_x32"
-- 
1.7.9.5


