Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1D0609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 14:10:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2015 07:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,699,1427785200"; d="scan'208";a="736908879"
Received: from ashussai-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.105.108])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2015 07:10:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 29 Jun 2015 07:10:50 -0700
Message-Id: <1435587050-18517-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH] tune-i586-nlp: Add new tune file to support Quark/X1000 CPU
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
X-List-Received-Date: Mon, 29 Jun 2015 14:10:56 -0000

This tune file is needed to enable a GAS option specific to this cpu family
in order to disable the usage of lock prefix instructions.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/tune-i586-nlp.inc | 19 +++++++++++++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-i586-nlp.inc

diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/tune-i586-nlp.inc
new file mode 100644
index 0000000..94e22c1
--- /dev/null
+++ b/meta/conf/machine/include/tune-i586-nlp.inc
@@ -0,0 +1,19 @@
+# Settings for the GCC(1) cpu-type "quark":
+#
+#
+#
+DEFAULTTUNE ?= "i586-nlp-32"
+
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
+require conf/machine/include/x86/arch-x86.inc
+
+# x86 with no lock prefix
+TUNEVALID[i586-nlp] = "IA32 with Lock Prefix omitted"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "i586-nlp", " -march=i586 -Wa,-momit-lock-prefix=yes", "", d)}"
+
+# Quark tune feature
+AVAILTUNES = "i586-nlp-32"
+TUNE_FEATURES_tune-i586-nlp-32 = "${TUNE_FEATURES_tune-x86} i586-nlp"
+BASE_LIB_tune-i586-nlp-32 = "lib"
+TUNE_PKGARCH_tune-i586-nlp-32 = "i586-nlp-32"
+PACKAGE_EXTRA_ARCHS_tune-i586-nlp-32 = "i586-nlp-32"
-- 
2.1.0


