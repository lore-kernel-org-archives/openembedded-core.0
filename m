Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNRbW-0006SV-Pr
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 16:59:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Nov 2011 07:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,470,1315206000"; d="scan'208";a="71404715"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by azsmga001.ch.intel.com with ESMTP; 07 Nov 2011 07:53:07 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 09:53:33 -0600
Message-Id: <8451372b6ab4f34a0ef907f0a3e3713bcdf1932f.1320638388.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
References: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1320638388.git.tom.zanussi@intel.com>
References: <cover.1320638388.git.tom.zanussi@intel.com>
Subject: [PATCH 3/6] machine/include/tune-atom.inc: add atom-specific settings
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
X-List-Received-Date: Mon, 07 Nov 2011 15:59:23 -0000

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
1.7.0.4



