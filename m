Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qlbvr-0000ud-B4
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 09:19:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2011 00:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,268,1309762800"; d="scan'208";a="31467634"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2011 00:15:31 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	nitin.a.kamble@intel.com
Date: Mon, 25 Jul 2011 17:48:27 -0700
Message-Id: <a2c665c907a6916f87cec3d35a58b477453cd961.1311641177.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311641177.git.nitin.a.kamble@intel.com>
References: <cover.1311641177.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1311641177.git.nitin.a.kamble@intel.com>
References: <cover.1311641177.git.nitin.a.kamble@intel.com>
Subject: [RFC x32 1/3] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Tue, 26 Jul 2011 07:19:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

And also make some of the variable (DEFAULTTUNE, TUNE_PKGARCH)
assignments weak, so that these vars can be overridden in the
local.conf file.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/machine/include/ia32/arch-ia32.inc |   22 +++++++++++++++++-----
 meta/conf/machine/include/tune-core2.inc     |    8 ++++++--
 meta/conf/machine/include/tune-i586.inc      |    4 ++--
 meta/conf/machine/include/tune-x86_64.inc    |    2 +-
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index 3a9d0bc..a282aa9 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -2,18 +2,25 @@
 # IA32 Architecture definition
 #
 
-DEFAULTTUNE = "x86"
-TARGET_FPU = "hard"
+DEFAULTTUNE ?= "x86_64-x32"
+TARGET_FPU ?= "hard"
+TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86", "x86_64", d)}"
 
 # ELF32 ABI
 TUNEVALID[m32] = "IA32 ELF32 standard ABI"
-TUNECONFLICTS[m32] = "m64"
+TUNECONFLICTS[m32] = "m64 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "i586", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
 
+# x32 ABI
+TUNEVALID[mx32] = "IA32 ELF32 standard ABI"
+TUNECONFLICTS[mx32] = "m64 m32"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x86_64", "" ,d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
+
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-TUNECONFLICT[m64] = "m32"
+TUNECONFLICT[m64] = "m32 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "x86_64", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 
@@ -26,4 +33,9 @@ PACKAGE_EXTRA_ARCHS_tune-x86 = "x86"
 AVAILTUNES += "x86-64"
 TUNE_FEATURES_tune-x86-64 ?= "m64"
 BASE_LIB_tune-x86-64 = "lib64"
-PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
\ No newline at end of file
+PACKAGE_EXTRA_ARCHS_tune-x86-64 = "x86_64"
+
+AVAILTUNES += "x86-64-x32"
+TUNE_FEATURES_tune-x86-64-x32 ?= "mx32"
+BASE_LIB_tune-x86-64-x32 = "lib"
+PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "x86_64-x32"
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index e94c290..0eb74ba 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -1,8 +1,8 @@
 require conf/machine/include/tune-i586.inc
 
-DEFAULTTUNE = "core2"
+DEFAULTTUNE ?= "core2"
 TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "m32", "i686", "x86_64", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "m32", "core2", "core2-64", d)}"
+TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "m32", "core2", "core2-64", d)}"
 
 # Extra tune features
 TUNEVALID[core2] = "Enable core2 specific processor optimizations"
@@ -19,3 +19,7 @@ TUNE_FEATURES_tune-core2-64 ?= "${TUNE_FEATURES_tune-x86-64} core2"
 BASE_LIB_tune-core2-64 = "lib64"
 PACKAGE_EXTRA_ARCHS_tune-core2-64 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} core2-64"
 
+AVAILTUNES += "core2-x32"
+TUNE_FEATURES_tune-core2-x32 ?= "${TUNE_FEATURES_tune-x86-64-x32} core2"
+BASE_LIB_tune-core2-x32 = "lib"
+PACKAGE_EXTRA_ARCHS_tune-core2-x32 = "${PACKAGE_EXTRA_ARCHS_tune-x86-64-x32} core2-x32"
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index 88c9221..a5e1950 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/ia32/arch-ia32.inc
 
-DEFAULTTUNE = "i586"
-TUNE_PKGARCH = "i586"
+DEFAULTTUNE ?= "i586"
+TUNE_PKGARCH ?= "i586"
 
 # Extra tune features
 TUNEVALID[i586] = "Enable i586 specific processor optimizations"
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



