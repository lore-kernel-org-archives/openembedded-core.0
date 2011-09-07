Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1R1KHv-0007ka-71
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 17:43:43 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id E410A1C0F59D;
	Wed,  7 Sep 2011 17:38:40 +0200 (CEST)
X-Auth-Info: +in0bQXXrdGXRROR1lkiujHkOq+WfR1RN3yqdOLS/X0=
Received: from mail.denx.de (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id CEEA61C0007E;
	Wed,  7 Sep 2011 17:38:40 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail.denx.de (Postfix) with ESMTP id 81F97340047;
	Wed,  7 Sep 2011 17:38:40 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 547)
	id D77BCAFF; Wed,  7 Sep 2011 17:38:39 +0200 (CEST)
From: Ilya Yanok <yanok@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 17:38:36 +0200
Message-Id: <1315409916-2298-1-git-send-email-yanok@emcraft.com>
X-Mailer: git-send-email 1.7.6
Cc: Ilya Yanok <yanok@emcraft.com>
Subject: [PATCH] arch-powerpc: set PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Wed, 07 Sep 2011 15:43:43 -0000

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
1.7.6



