Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D01A0741CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:22:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2015 08:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,666,1427785200"; d="scan'208";a="733054208"
Received: from josuerfi-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.73.119])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2015 08:22:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 23 Jun 2015 08:22:47 -0700
Message-Id: <1435072967-10333-1-git-send-email-sgw@linux.intel.com>
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
X-List-Received-Date: Tue, 23 Jun 2015 15:22:47 -0000

This tune file is needed to enable a GAS option specific to this cpu family
in order to disable the usage of lock prefix instructions.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/tune-i586-nlp.inc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-i586-nlp.inc

diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/tune-i586-nlp.inc
new file mode 100644
index 0000000..6815a16
--- /dev/null
+++ b/meta/conf/machine/include/tune-i586-nlp.inc
@@ -0,0 +1,20 @@
+#
+# Settings for the GAS(1) cpu-type quark/x1000 which has issues
+# with lock-prefix so use that option to omit them.
+#
+
+DEFAULTTUNE ?= "i586-nlp"
+
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
+require conf/machine/include/tune-i586.inc
+
+# x86 with no lock prefix
+TUNEVALID[nlp] = "IA32 with Lock Prefix omitted"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "nlp", " -Wa,-momit-lock-prefix=yes", "", d)}"
+
+# Quark tune feature 
+AVAILTUNES = "i586-nlp"
+TUNE_FEATURES_tune-i586-nlp = "${TUNE_FEATURES_tune-i586} nlp"
+TUNE_PKGARCH_tune-i586-nlp = "i586-nlp"
+PACKAGE_EXTRA_ARCHS_tune-i586-nlp = "${PACKAGE_EXTRA_ARCHS_tune-i586} i586-nlp"
+
-- 
2.1.0


