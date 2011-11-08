Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMI-0002iP-Q5
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587153"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:54 -0800
Message-Id: <10574d8a7512619a2e325de21cc78aad11b7b9e2.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/17] machine/include/tune-atom.inc: add atom-specific settings
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:23 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Atom tunings are currently the same as core2; this patch changes them
to make use of atom-specific settings such as the atom arch and
instruction support in gcc.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/conf/machine/include/tune-atom.inc |   26 ++++++++++++++++++++++++--
 1 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/tune-atom.inc
index 5e1bb74..ab4aa14 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/tune-atom.inc
@@ -1,2 +1,24 @@
-# Atom tunings are the same as core2 for now...
-require conf/machine/include/tune-core2.inc
+DEFAULTTUNE ?= "atom"
+TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "atom", "atom-64", d)}"
+
+require conf/machine/include/tune-i586.inc
+
+# Extra tune features
+TUNEVALID[atom] = "Enable atom-specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "atom", "-march=atom -mssse3 -mfpmath=sse", "", d)}"
+
+# Extra tune selections
+AVAILTUNES += "atom"
+TUNE_FEATURES_tune-atom ?= "${TUNE_FEATURES_tune-x86} atom"
+BASE_LIB_tune-atom ?= "lib"
+PACKAGE_EXTRA_ARCHS_tune-atom = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586 i686 atom"
+
+AVAILTUNES += "atom-64"
+TUNE_FEATURES_tune-atom-64 ?= "${TUNE_FEATURES_tune-x86-64} atom"
+BASE_LIB_tune-atom-64 ?= "lib64"
+PACKAGE_EXTRA_ARCHS_tune-atom-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} atom-64"
+
+AVAILTUNES += "atom-64-x32"
+TUNE_FEATURES_tune-atom-64-x32 ?= "${TUNE_FEATURES_tune-x86-64-x32} atom"
+BASE_LIB_tune-atom-64-x32 ?= "libx32"
+PACKAGE_EXTRA_ARCHS_tune-atom-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} atom-64-x32"
-- 
1.7.6.4



