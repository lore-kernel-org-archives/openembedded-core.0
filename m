Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18XkVQl+rE2UP2WzJGfMM8A+BMrz2fXQQc=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qrjp8-0006nN-8A
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 06:58:22 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7C4rokw009172
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 23:53:51 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 23:53:50 -0500
Message-Id: <1313124830-10039-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH v4] tune-ppc: Update to pass glibc configure option to get cpu specific support
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
X-List-Received-Date: Fri, 12 Aug 2011 04:58:22 -0000

We need --with-cpu based to glibc to get proper support on 603e & e500mc
to pickup proper math libs to deal with sqrt.  These core do not
implement the fsqrt[s] instructions that the normal PPC math libs
utilize.

This causes use to not set AVAILTUNES specifically to the sub-arch only
as we arent generically compatiable.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
v4:
Clean version against upstream

 meta/conf/machine/include/tune-ppc603e.inc   |    5 ++++-
 meta/conf/machine/include/tune-ppce500mc.inc |    5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index da8114f..c743dde 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -6,6 +6,9 @@ TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "", d)}"
 TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${PPCPKGARCH}', d)}"
 
-AVAILTUNES += "ppc603e"
+AVAILTUNES = "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
 PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
+
+# glibc configure options to get 603e specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-with-cpu=603e", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 64e7bdc..33820ef 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -6,6 +6,9 @@ TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-mcpu=e500mc", "", d)}"
 TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc", "${PPCPKGARCH}", d)}"
 
-AVAILTUNES += "ppce500mc"
+AVAILTUNES = "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
 PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
+
+# glibc configure options to get e500mc specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-with-cpu=e500mc", "", d)}"
-- 
1.7.3.4



