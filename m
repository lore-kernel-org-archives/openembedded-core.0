Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18tsp7JhN6zmsvzri1T0YnG2a1iycwO7MU=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmXjq-0004gZ-9i
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 23:03:26 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SKxBbL002610
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 15:59:11 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 15:59:07 -0500
Message-Id: <1311886748-17637-4-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311886748-17637-3-git-send-email-galak@kernel.crashing.org>
References: <1311886748-17637-1-git-send-email-galak@kernel.crashing.org>
	<1311886748-17637-2-git-send-email-galak@kernel.crashing.org>
	<1311886748-17637-3-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 4/5] tune/arch-powerpc: Merge powerpc64 changes into powerpc
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
X-List-Received-Date: Thu, 28 Jul 2011 21:03:26 -0000

We should be able to get away with just one include to handle all
arch-powerpc needs.  Also update comments about the various choices
between 32-bit/64-bit and hard/soft floating point.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   14 ++++++++++----
 .../machine/include/powerpc/arch-powerpc64.inc     |    8 --------
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta/conf/machine/include/powerpc/arch-powerpc64.inc

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 013755d..93b1c05 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -1,7 +1,6 @@
 # Power Architecture definition
-# Four defined ABIs, all combinations of:
-# *) Hard/Soft Floating Point
-# *) 32-bit/64-bit
+# *) Hard/Soft Floating Point on 32-bit
+# *) Hard Floating Point on 64-bit
 
 DEFAULTTUNE ?= "powerpc"
 
@@ -9,6 +8,11 @@ TUNEVALID[m32] = "Power ELF32 standard ABI"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "powerpc", "", d)}"
 
+TUNEVALID[m64] = "Power ELF64 standard ABI"
+TUNE_CONFLICTS[m64] = "m32 nf"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
+
 TUNEVALID[fpu-hard] = "Use hardware FPU."
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
 
@@ -29,4 +33,6 @@ BASE_LIB_tune-powerpc = "lib"
 TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
 BASE_LIB_tune-powerpc-nf = "lib"
 
-
+AVAILTUNES += "powerpc64"
+TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
+BASE_LIB_tune-powerpc64 = "lib64"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
deleted file mode 100644
index a965d59..0000000
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-TUNEVALID[m64] = "Power ELF64 standard ABI"
-TUNE_CONFLICTS[m64] = "m32 nf"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
-
-AVAILTUNES += "powerpc64"
-TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
-BASE_LIB_tune-powerpc64 = "lib64"
-- 
1.7.3.4



