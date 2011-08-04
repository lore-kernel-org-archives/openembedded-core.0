Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5X5-0005NC-PM
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; 
   d="scan'208";a="4260475"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:55 -0700
Message-Id: <2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
Subject: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Thu, 04 Aug 2011 21:32:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/ia32/arch-ia32.inc |   23 ++++++++++++++++++++---
 meta/conf/machine/include/tune-core2.inc     |    4 ++++
 meta/conf/machine/include/tune-x86_64.inc    |    2 +-
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index 2709440..fb527da 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -6,17 +6,29 @@ DEFAULTTUNE ?= "x86"
 TARGET_FPU ?= ""
 X86ARCH32 ?= "i586"
 X86ARCH64 ?= "x86_64"
+X86ARCHX32 ?= "x86_64"
 
 # ELF32 ABI
 TUNEVALID[m32] = "IA32 ELF32 standard ABI"
-TUNECONFLICTS[m32] = "m64"
+TUNECONFLICTS[m32] = "m64 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}"
+ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "32", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
 
+# x32 ABI
+TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"
+TUNECONFLICTS[mx32] = "m64 m32"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCHX32}", "" ,d)}"
+ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
+TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
+TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
+
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-TUNECONFLICT[m64] = "m32"
+TUNECONFLICT[m64] = "m32 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}"
+ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "64", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 
 TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d)}"
@@ -30,4 +42,9 @@ PACKAGE_EXTRA_ARCHS_tune-x86 = "x86"
 AVAILTUNES += "x86-64"
 TUNE_FEATURES_tune-x86-64 ?= "m64"
 BASE_LIB_tune-x86-64 ?= "lib64"
-PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
+PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86-64"
+
+AVAILTUNES += "x86-64-x32"
+TUNE_FEATURES_tune-x86-64-x32 ?= "mx32"
+BASE_LIB_tune-x86-64-x32 ?= "lib"
+PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86-64-x32"
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 25c2226..8a4de3e 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -18,3 +18,7 @@ TUNE_FEATURES_tune-core2-64 ?= "${TUNE_FEATURES_tune-x86-64} core2"
 BASE_LIB_tune-core2-64 ?= "lib64"
 PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64"
 
+AVAILTUNES += "core2-x32"
+TUNE_FEATURES_tune-core2-x32 ?= "${TUNE_FEATURES_tune-x86-64-x32} core2"
+BASE_LIB_tune-core2-x32 ?= "lib"
+PACKAGE_EXTRA_ARCHS_tune-core2-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-x32"
diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/machine/include/tune-x86_64.inc
index 04b0f96..50f20ba 100644
--- a/meta/conf/machine/include/tune-x86_64.inc
+++ b/meta/conf/machine/include/tune-x86_64.inc
@@ -1,3 +1,3 @@
 require conf/machine/include/ia32/arch-ia32.inc
 
-DEFAULTTUNE = "x86-64"
+DEFAULTTUNE ?= "x86-64"
-- 
1.7.6



