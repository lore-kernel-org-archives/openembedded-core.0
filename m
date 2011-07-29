Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18TICMer1n0U937G3le5bd2JZAyLY6juYg=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qmaga-0008B4-Pn
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 02:12:17 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6T081nm031450
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 19:08:01 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 19:08:01 -0500
Message-Id: <1311898081-13085-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] tune/powerpc: Cleanup setting of TUNE_PKGARCH
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
X-List-Received-Date: Fri, 29 Jul 2011 00:12:17 -0000

Add some uniformity to the naming scheme and reduce a bit of redudancy.

Names are now back to: ppc603e, ppce300c2, ppce500, ppce500mc,
ppce500v2.

On 64-bit we'll have something like ppc64e5500.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    5 +++--
 meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500.inc         |    2 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |    2 +-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 93b1c05..a8226ea 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -3,6 +3,7 @@
 # *) Hard Floating Point on 64-bit
 
 DEFAULTTUNE ?= "powerpc"
+TUNE_PKGARCH ?= "ppc"
 
 TUNEVALID[m32] = "Power ELF32 standard ABI"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
@@ -12,6 +13,7 @@ TUNEVALID[m64] = "Power ELF64 standard ABI"
 TUNE_CONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
+TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "64", "", d)}"
 
 TUNEVALID[fpu-hard] = "Use hardware FPU."
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "", d)}"
@@ -23,8 +25,7 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
 ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
 
 PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-nf", "", d)}"
-
-TUNE_PKGARCH ?= "${TUNE_ARCH}${PPCPKGSFX_FPU}"
+TUNE_PKGARCH .= "${PPCPKGSFX_FPU}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 7c05394..12ba425 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc603e", "", d)}"
+TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "603e", "", d)}"
 
 AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index bad2611..6fe3e42 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "-mcpu=e300c2", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "ppce300c2", "${TUNE_ARCH}", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "e300c2", "${TUNE_ARCH}", d)}"
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index c34d631..0e850f1 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "-mcpu=8540", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppce500", "", d)}"
+TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "e500", "", d)}"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 73217dd..9fee226 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "", d)}"
+TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "e500mc", "", d)}"
 
 AVAILTUNES += "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index 819d68a..2a0451b 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "-mcpu=8548", "", d)}"
-TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "ppce500v2", "", d)}"
+TUNE_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "e500v2", "", d)}"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe", "", d)}"
-- 
1.7.3.4



