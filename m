Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/auLO82F3N0WmlnvgopwXWKRHiYMd9lTY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoU4r-0006TI-Gv
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 07:33:09 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p735Sleu017970
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 00:28:48 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 00:28:47 -0500
Message-Id: <1312349327-27463-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH v2] tune/arch-powerpc: Use fpu-soft to set PPCPKGSFX_FPU
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
X-List-Received-Date: Wed, 03 Aug 2011 05:33:10 -0000

Its more likely that we explicitly set soft-floating point support for a
given target than hard.  So use 'fpu-soft' in TUNE_FEATURES rather than
'fpu-hard' to determine setting 'nf' (no-float) in PPCPKGSFX_FPU.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
* Removed setting of 'fpu-hard' from the tune files that it set

 meta/conf/machine/include/powerpc/arch-powerpc.inc |    2 +-
 meta/conf/machine/include/tune-ppc603e.inc         |    2 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index da1a1d6..c073f18 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -18,7 +18,7 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
 
 ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
 
-PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
+PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "-nf", "", d)}"
 
 PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
 TUNE_PKGARCH ?= "${PPCPKGARCH}"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index da8114f..9abb694 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -7,5 +7,5 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "
 TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${PPCPKGARCH}', d)}"
 
 AVAILTUNES += "ppc603e"
-TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
+TUNE_FEATURES_tune-ppc603e = "m32 ppc603e"
 PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 64e7bdc..b5031f4 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -7,5 +7,5 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc
 TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "${PPCPKGARCH}", d)}"
 
 AVAILTUNES += "ppce500mc"
-TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
+TUNE_FEATURES_tune-ppce500mc = "m32 ppce500mc"
 PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
-- 
1.7.3.4



