Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNRbV-0006SL-Ml
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 16:59:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Nov 2011 07:53:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,470,1315206000"; d="scan'208";a="82021970"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2011 07:53:03 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 09:53:31 -0600
Message-Id: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1320638388.git.tom.zanussi@intel.com>
References: <cover.1320638388.git.tom.zanussi@intel.com>
Subject: [PATCH 1/6] tune-corei7: Add tune file for Intel Core i7 machines
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
X-List-Received-Date: Mon, 07 Nov 2011 15:59:24 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a tune file for Intel Core i7 machines both with and without AVX
support.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/conf/machine/include/tune-corei7.inc |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-corei7.inc

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
new file mode 100644
index 0000000..2e0c67f
--- /dev/null
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -0,0 +1,17 @@
+DEFAULTTUNE ?= "corei7"
+TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "avx", "corei7-avx", "corei7", d)}"
+
+require conf/machine/include/tune-x86_64.inc
+
+TUNEVALID[corei7] = "Enable corei7-specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "corei7", "-march=corei7${COREI7_AVX}", "", d)}"
+
+COREI7_AVX = "${@bb.utils.contains("TUNE_FEATURES", [ "corei7", "avx" ], "-avx", "", d)}"
+
+AVAILTUNES += "corei7"
+TUNE_FEATURES_tune-corei7 = "${TUNE_FEATURES_tune-x86-64} corei7"
+PACKAGE_EXTRA_ARCHS_tune-corei7 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} corei7"
+
+AVAILTUNES += "corei7-avx"
+TUNE_FEATURES_tune-corei7-avx = "${TUNE_FEATURES_tune-x86-64} corei7 avx"
+PACKAGE_EXTRA_ARCHS_tune-corei7-avx = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} corei7-avx"
-- 
1.7.0.4



