Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05xy-0007b0-0V
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:18 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109312583"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:46 -0800
Message-Id: <ff200bd7959bd8df44ad1e35c48078e756b0ea77.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
References: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
Subject: [PATCH 03/10] arch-mips.inc: rearrange for gcc-multilib
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
X-List-Received-Date: Wed, 22 Feb 2012 06:46:18 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

make tune feature names mips specific
no functional changes here

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/mips/arch-mips.inc |   65 +++++++++++++------------
 1 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index b7ded76..b674d66 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -7,61 +7,64 @@
 DEFAULTTUNE ?= "mips"
 
 # Endianess
-TUNEVALID[bigendian] = "Enable big-endian mode"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-meb", "-mel", d)}"
+TUNEVALID[mips-bigendian] = "Enable big-endian mode"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips-bigendian", "-meb", "-mel", d)}"
 
 # ABI flags
-TUNEVALID[o32] = "MIPS o32 ABI"
-TUNECONFLICT[o32] = "n32 n64"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "o32", "-mabi=32", "", d)}"
+TUNEVALID[mips-o32] = "MIPS o32 ABI"
+TUNECONFLICT[mips-o32] = "mips-n32 mips-n64"
+TUNE_FEATURE_CCARGS-mips-o32 ?= "-mabi=32"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips-o32", "${TUNE_FEATURE_CCARGS-mips-o32}", "", d)}"
 
-TUNEVALID[n32] = "MIPS64 n32 ABI"
-TUNECONFLICT[n32] = "o32 n64"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n32", "-mabi=n32", "", d)}"
+TUNEVALID[mips-n32] = "MIPS64 n32 ABI"
+TUNECONFLICT[mips-n32] = "mips-o32 mips-n64"
+TUNE_FEATURE_CCARGS-mips-n32 ?= "-mabi=n32"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips-n32", "${TUNE_FEATURE_CCARGS-mips-n32}", "", d)}"
 
-TUNEVALID[n64] = "MIPS64 n64 ABI"
-TUNECONFLICT[n64] = "o32 n32"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-mabi=64", "", d)}"
+TUNEVALID[mips-n64] = "MIPS64 n64 ABI"
+TUNECONFLICT[mips-n64] = "mips-o32 mips-n32"
+TUNE_FEATURE_CCARGS-mips-n64 ?= "-mabi=64"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips-n64", "${TUNE_FEATURE_CCARGS-mips-n64}", "", d)}"
 
 # Floating point
-TUNEVALID[fpu-hard] = "Use hardware FPU"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "-msoft-float", d)}"
-TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "", "soft", d)}"
+TUNEVALID[mips-fpu-hard] = "Use hardware FPU"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips-fpu-hard", "-mhard-float", "-msoft-float", d)}"
+TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "mips-fpu-hard", "", "soft", d)}"
 
 # Package naming
-MIPSPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
-MIPSPKGSFX_BYTE = "${@bb.utils.contains("TUNE_FEATURES", "n64" , "64", "", d)}"
-MIPSPKGSFX_BYTE .= "${@bb.utils.contains("TUNE_FEATURES", "n32" , "64", "", d)}"
-MIPSPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
-MIPSPKGSFX_ABI = "${@bb.utils.contains("TUNE_FEATURES", "n32", "-n32", "", d)}"
+MIPSPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "mips-bigendian", "", "el", d)}"
+MIPSPKGSFX_BYTE = "${@bb.utils.contains("TUNE_FEATURES", "mips-n64" , "64", "", d)}"
+MIPSPKGSFX_BYTE .= "${@bb.utils.contains("TUNE_FEATURES", "mips-n32" , "64", "", d)}"
+MIPSPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "mips-fpu-hard" , "", "-nf", d)}"
+MIPSPKGSFX_ABI = "${@bb.utils.contains("TUNE_FEATURES", "mips-n32", "-n32", "", d)}"
 
 TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
 TUNE_PKGARCH ?= "${TUNE_ARCH}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
 
 # Base tunes
 AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
-TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
+TUNE_FEATURES_tune-mips = "mips-o32 mips-bigendian mips-fpu-hard"
 BASE_LIB_tune-mips = "lib"
-TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
+TUNE_FEATURES_tune-mips64-n32 = "mips-n32 mips-bigendian mips-fpu-hard"
 BASE_LIB_tune-mips64-n32 = "lib32"
-TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
+TUNE_FEATURES_tune-mips64 = "mips-n64 mips-bigendian mips-fpu-hard"
 BASE_LIB_tune-mips64 = "lib64"
-TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
+TUNE_FEATURES_tune-mipsel = "mips-o32 mips-fpu-hard"
 BASE_LIB_tune-mipsel = "lib"
-TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
+TUNE_FEATURES_tune-mips64el-n32 = "mips-n32 mips-fpu-hard"
 BASE_LIB_tune-mips64el-n32 = "lib32"
-TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
+TUNE_FEATURES_tune-mips64el = "mips-n64 mips-fpu-hard"
 BASE_LIB_tune-mips64el = "lib64"
-TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
+TUNE_FEATURES_tune-mips-nf = "mips-o32 mips-bigendian"
 BASE_LIB_tune-mips-nf = "lib"
-TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
+TUNE_FEATURES_tune-mips64-nf-n32 = "mips-n32 mips-bigendian"
 BASE_LIB_tune-mips64-nf-n32 = "lib32"
-TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
+TUNE_FEATURES_tune-mips64-nf = "mips-n64 mips-bigendian"
 BASE_LIB_tune-mips64-nf = "lib64"
-TUNE_FEATURES_tune-mipsel-nf = "o32"
+TUNE_FEATURES_tune-mipsel-nf = "mips-o32"
 BASE_LIB_tune-mipsel-nf = "lib"
-TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
+TUNE_FEATURES_tune-mips64el-nf-n32 = "mips-n32"
 BASE_LIB_tune-mips64el-nf-n32 = "lib32"
-TUNE_FEATURES_tune-mips64el-nf = "n64"
+TUNE_FEATURES_tune-mips64el-nf = "mips-n64"
 BASE_LIB_tune-mips64el-nf = "lib64"
 
-- 
1.7.6.4



