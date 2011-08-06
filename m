Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19uriP3XNRlDDTjbonTjokqEHGEi858QPY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QpjK5-0005Za-Qy
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 18:02:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p76FvXCH016491
	for <openembedded-core@lists.openembedded.org>;
	Sat, 6 Aug 2011 10:57:34 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 10:57:33 -0500
Message-Id: <1312646253-18170-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] tune-ppc: Update to pass glibc configure option to get cpu specific support
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
X-List-Received-Date: Sat, 06 Aug 2011 16:02:02 -0000

We need --with-cpu based to glibc to get proper support on 603e & e500mc
to pickup proper math libs to deal with sqrt.  These core do not
implement the fsqrt[s] instructions that the normal PPC math libs
utilize.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/tune-ppc603e.inc   |    3 +++
 meta/conf/machine/include/tune-ppce500mc.inc |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 9abb694..c6e31f1 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -9,3 +9,6 @@ TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', 'ppc603e', '${P
 AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 ppc603e"
 PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"
+
+# glibc configure options to get 603e specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "--with-cpu=603e"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index b5031f4..7313279 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -9,3 +9,6 @@ TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "ppce500mc",
 AVAILTUNES += "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 ppce500mc"
 PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "powerpc ppce500mc"
+
+# glibc configure options to get e500mc specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "--with-cpu=e500mc"
-- 
1.7.3.4



