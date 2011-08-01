Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7L-0006Zd-JX
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147086"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:36:07 -0700
Message-Id: <f2fee70727d940b61a8470d13c22a3313d9ee3ae.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 15/22] tune/powerpc: Cleanup setting of TUNE_PKGARCH
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:52 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Based on Kumar Gala <galak@kernel.crashing.org>'s patch.

By default we use ppc, or ppc64.  Each tune either specifies their
manual version or can use the PPC_PKGARCH to specify a new prefix
if they support both float and no-float variants.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    3 ++-
 .../machine/include/powerpc/arch-powerpc64.inc     |    1 +
 meta/conf/machine/include/tune-ppc603e.inc         |    4 ++--
 meta/conf/machine/include/tune-ppce300c2.inc       |    5 +++--
 meta/conf/machine/include/tune-ppce500.inc         |    5 +++--
 meta/conf/machine/include/tune-ppce500mc.inc       |    5 +++--
 meta/conf/machine/include/tune-ppce500v2.inc       |    5 +++--
 7 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 013755d..2621932 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -8,6 +8,7 @@ DEFAULTTUNE ?= "powerpc"
 TUNEVALID[m32] = "Power ELF32 standard ABI"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "powerpc", "", d)}"
+PPC_PKGARCH = "ppc"
 
 TUNEVALID[fpu-hard] = "Use hardware FPU."
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
@@ -20,7 +21,7 @@ ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-e
 
 PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-nf", "", d)}"
 
-TUNE_PKGARCH ?= "${TUNE_ARCH}${PPCPKGSFX_FPU}"
+TUNE_PKGARCH ?= "${PPC_PKGARCH}${PPCPKGSFX_FPU}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index a965d59..0a104a2 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -2,6 +2,7 @@ TUNEVALID[m64] = "Power ELF64 standard ABI"
 TUNE_CONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
+PPC_PKGARCH = "ppc64"
 
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 7c05394..2eec64b 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -4,8 +4,8 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
+PPC_PKGARCH_tune-ppc603e = "ppc603e"
 
 AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
-PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
+PACKAGE_EXTRA_ARCHS_tune-ppc603e = "ppc ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index bad2611..7763d86 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -4,8 +4,9 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "-mcpu=e300c2", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2", "${TUNE_ARCH}", d)}"
+PPC_PKGARCH_tune-ppce300c2 = "ppce300c2"
+TUNE_PKGARCH_tune-ppce300c2 = "ppce300c2"
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
-PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "powerpc-nf ppce300c2"
+PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "ppc-nf ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index c34d631..4399e3c 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -4,12 +4,13 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "", d)}"
+PPC_PKGARCH_tune-ppce500 = "ppce500"
+TUNE_PKGARCH_tune-ppce500 = "ppce500"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
 
-TARGET_FPU = "ppc-efs"
+TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500", "spe" ], "ppc-efs", "", d)}"
 
 AVAILTUNES += "ppce500"
 TUNE_FEATURES_tune-ppce500 = "m32 spe ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 73217dd..076f04c 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -4,8 +4,9 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
+PPC_PKGARCH_tune-ppce500mc = "ppce500mc"
+TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
 
 AVAILTUNES += "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
-PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
+PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "ppc ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 819d68a..2fef6d0 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -4,12 +4,13 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "", d)}"
+PPC_PKGARCH_tune-ppce500v2 = "ppce500v2"
+TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
 
-TARGET_FPU = "ppc-efd"
+TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500v2", "spe" ], "ppc-efd", "", d)}"
 
 AVAILTUNES += "ppce500v2"
 TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
-- 
1.7.3.4



