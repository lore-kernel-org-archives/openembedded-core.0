Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc9-0005NF-U2
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233782"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:30 -0800
Message-Id: <85874f6c96c451b91693477ff7900f993f6a2d2d.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/26] arch-powerpc: set PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:58 -0000

From: Ilya Yanok <yanok@emcraft.com>

Set PACKAGE_EXTRA_ARCHS for the generic tunes ("powerpc" and
"powerpc-nf") thus allowing to use them instead of tuning to the
specific CPU.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++++--
 meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index da1a1d6..8347f86 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -25,9 +25,11 @@ TUNE_PKGARCH ?= "${PPCPKGARCH}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
-TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
-BASE_LIB_tune-powerpc = "lib"
 TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
 BASE_LIB_tune-powerpc-nf = "lib"
+PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
+TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
+BASE_LIB_tune-powerpc = "lib"
+PACKAGE_EXTRA_ARCHS_tune-powerpc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} powerpc"
 
 
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index c743dde..663f220 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -8,7 +8,7 @@ TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${P
 
 AVAILTUNES = "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
-PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
+PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
 
 # glibc configure options to get 603e specific library (for sqrt)
 GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-with-cpu=603e", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index 5eea4a6..bdca1aa 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -8,4 +8,4 @@ TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2",
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
-PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "powerpc-nf ppce300c2"
+PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 33820ef..950c46d 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -8,7 +8,7 @@ TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc",
 
 AVAILTUNES = "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
-PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
+PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce500mc"
 
 # glibc configure options to get e500mc specific library (for sqrt)
 GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-with-cpu=e500mc", "", d)}"
-- 
1.7.6.4



