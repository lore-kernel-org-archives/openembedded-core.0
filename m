Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05xz-0007bD-LW
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109312585"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:48 -0800
Message-Id: <9d10e663fef4fccce83fdc1ed2021f1e37402fc6.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
References: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
Subject: [PATCH 05/10] arch-powerpc*.inc: rearrange for gcc-multilib
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
X-List-Received-Date: Wed, 22 Feb 2012 06:46:20 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

make tune_feature names ppc specific

no functional change here

this helps gcc multilib code get tune parameter for any tune.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   24 ++++++++++---------
 .../machine/include/powerpc/arch-powerpc64.inc     |   11 +++++----
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 8347f86..70f7a18 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -5,30 +5,32 @@
 
 DEFAULTTUNE ?= "powerpc"
 
-TUNEVALID[m32] = "Power ELF32 standard ABI"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "powerpc", "", d)}"
+TUNEVALID[ppc-m32] = "Power ELF32 standard ABI"
+TUNE_FEATURE_CCARGS-ppc-m32 ?= "-m32"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc-m32", "${TUNE_FEATURE_CCARGS-ppc-m32}", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc-m32", "powerpc", "", d)}"
 
-TUNEVALID[fpu-hard] = "Use hardware FPU."
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
+TUNEVALID[ppc-fpu-hard] = "Use hardware FPU."
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc-fpu-hard", "-mhard-float", "", d)}"
 
-TUNEVALID[fpu-soft] = "Use software FPU."
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
-TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"
+TUNEVALID[ppc-fpu-soft] = "Use software FPU."
+TUNE_FEATURE_CCARGS-ppc-fpu-soft ?= "-msoft-float"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc-fpu-soft", "${TUNE_FEATURE_CCARGS-ppc-fpu-soft}", "", d)}"
+TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "ppc-fpu-soft", "soft", "", d)}"
 
 ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
 
-PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
+PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "ppc-fpu-hard" , "", "-nf", d)}"
 
 PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
 TUNE_PKGARCH ?= "${PPCPKGARCH}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
-TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
+TUNE_FEATURES_tune-powerpc-nf ?= "ppc-m32 ppc-fpu-soft"
 BASE_LIB_tune-powerpc-nf = "lib"
 PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
-TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
+TUNE_FEATURES_tune-powerpc ?= "ppc-m32 ppc-fpu-hard"
 BASE_LIB_tune-powerpc = "lib"
 PACKAGE_EXTRA_ARCHS_tune-powerpc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} powerpc"
 
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index 7ef8ddc..edbc07c 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -2,11 +2,12 @@ DEFAULTTUNE ?= "powerpc64"
 
 require conf/machine/include/powerpc/arch-powerpc.inc
 
-TUNEVALID[m64] = "Power ELF64 standard ABI"
-TUNE_CONFLICTS[m64] = "m32 nf"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
+TUNEVALID[ppc-m64] = "Power ELF64 standard ABI"
+TUNE_CONFLICTS[ppc-m64] = "ppc-m32 ppc-nf"
+TUNE_FEATURE_CCARGS-ppc-m64 ?= "-m64"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc-m64", "${TUNE_FEATURE_CCARGS-ppc-m64}", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppc-m64" ], "powerpc64", "", d)}"
 
 AVAILTUNES += "powerpc64"
-TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
+TUNE_FEATURES_tune-powerpc64 ?= "ppc-m64 ppc-fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
-- 
1.7.6.4



