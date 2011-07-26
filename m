Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qlh3m-0003LS-7C
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:48:30 +0200
Received: by rex (Postfix, from userid 1000)
	id 0309F20D6F; Tue, 26 Jul 2011 13:44:09 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 13:44:07 +0100
Message-Id: <992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 12:48:30 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++++++++-
 meta/conf/machine/include/tune-ppc603e.inc         |   12 ++++-
 meta/conf/machine/include/tune-ppce300c2.inc       |   12 ++++-
 meta/conf/machine/include/tune-ppce500.inc         |   13 ++++--
 meta/conf/machine/include/tune-ppce500mc.inc       |   12 ++++-
 meta/conf/machine/include/tune-ppce500v2.inc       |   12 ++++-
 6 files changed, 88 insertions(+), 18 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 17ace32..3f7befb 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -1,3 +1,44 @@
-TUNE_ARCH = "powerpc"
+# Power Architecture definition
+# Four defined ABIs, all combinations of:
+# *) Hard/Soft Floating Point
+# *) 32-bit/64-bit
+
+DEFAULTTUNE ?= "powerpc"
+
+TUNEVALID[m32] = "Power ELF32 standard ABI"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
+
+TUNEVALID[m32-arch] = "Enable powerpc package architecture"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m32-arch" ], "powerpc", "", d)}"
+
+TUNEVALID[m64] = "Power ELF64 standard ABI"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-m64", "", d)}"
+
+TUNEVALID[m64-arch] = "Enable powerpc64 package architecture"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64-arch" ], "powerpc64", "", d)}"
+
+TUNEVALID[fpu-hard] = "Use hardware FPU."
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
+
+TUNEVALID[fpu-soft] = "Use software FPU."
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-msoft-float", "", d)}"
+TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"
+
+TUNEVALID[spe] = "Enable SPE ABI extensions"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
+
+ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
+
+# Basic tune definitions
+AVAILTUNES += "powerpc powerpc-nf" 
+TUNE_FEATURES_tune-powerpc ?= "m32 m32-arch fpu-hard"
+BASE_LIB_tune-powerpc = "lib"
+TUNE_FEATURES_tune-powerpc-nf ?= "m32 m32-arch fpu-soft"
+BASE_LIB_tune-powerpc-nf = "lib"
+
+AVAILTUNES += "powerpc64 powerpc64-nf"
+TUNE_FEATURES_tune-powerpc64 ?= "m64 m64-arch fpu-hard"
+BASE_LIB_tune-powerpc64 = "lib64"
+TUNE_FEATURES_tune-powerpc64-nf ?= "m64 m64-arch fpu-soft"
+BASE_LIB_tune-powerpc64-nf = "lib64"
 
-ABIEXTENSION = "${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 61c0669..6991ae0 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -1,5 +1,11 @@
+DEFAULTTUNE ?= "ppc603e"
+
 require conf/machine/include/powerpc/arch-powerpc.inc
 
-TUNE_CCARGS = "-mcpu=603e  -mhard-float"
-TUNE_PKGARCH = "ppc603e"
-PACKAGE_EXTRA_ARCHS = "powerpc ppc603e"
+TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
+
+AVAILTUNES += "ppc603e"
+TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
+PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index a38e97c..652422f 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -1,5 +1,11 @@
+DEFAULTTUNE ?= "ppce300"
+
 require conf/machine/include/powerpc/arch-powerpc.inc
 
-TUNE_CCARGS = "-mcpu=e300c2 -msoft-float"
-TUNE_PKGARCH = "ppce300"
-PACKAGE_EXTRA_ARCHS = "powerpc ppce300"
+TUNEVALID[ppce300] = "Enable ppce300 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "-mcpu=e300c2", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300", "ppce300", "", d)}"
+
+AVAILTUNES += "ppce300"
+TUNE_FEATURES_tune-ppce300 = "m32 fpu-soft ppce300"
+PACKAGE_EXTRA_ARCHS_tune-ppce300 = "powerpc ppce300"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 22208f0..fe62445 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -1,6 +1,11 @@
+DEFAULTTUNE ?= "ppce500"
+
 require conf/machine/include/powerpc/arch-powerpc.inc
 
-TUNE_CCARGS = "-mcpu=8540"
-BASE_PACKAGE_ARCH = "ppce500"
-TUNE_PKGARCH = "ppce500"
-PACKAGE_EXTRA_ARCHS = "powerpc ppce500"
+TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "", d)}"
+
+AVAILTUNES += "ppce500"
+TUNE_FEATURES_tune-ppce500 = "m32 ppce500"
+PACKAGE_EXTRA_ARCHS_tune-ppce500 = "powerpc ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 182d019..0d3640f 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -1,5 +1,11 @@
+DEFAULTTUNE ?= "ppce500mc"
+
 require conf/machine/include/powerpc/arch-powerpc.inc
 
-TUNE_CCARGS = "-mcpu=e500mc"
-TUNE_PKGARCH = "ppce500mc"
-PACKAGE_EXTRA_ARCHS = "powerpc ppce500mc"
+TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
+
+AVAILTUNES += "ppce500mc"
+TUNE_FEATURES_tune-ppce500mc = "m32 ppce500mc"
+PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index daf2d58..e6b48a2 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -1,5 +1,11 @@
+DEFAULTTUNE ?= "ppce500v2"
+
 require conf/machine/include/powerpc/arch-powerpc.inc
 
-TUNE_CCARGS = "-mcpu=8548 -mabi=spe -mspe"
-TUNE_PKGARCH = "ppce500v2"
-PACKAGE_EXTRA_ARCHS = "powerpc ppce500v2"
+TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "", d)}"
+
+AVAILTUNES += "ppce500v2"
+TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
+PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "powerpc ppce500v2"
-- 
1.7.4.1



