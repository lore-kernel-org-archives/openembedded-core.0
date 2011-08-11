Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19x37WOCPfM3sHMb0xkhgQ9N7WhK64X7KU=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrOro-0005xx-G7
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 08:35:44 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7B6VDYk024845
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 01:31:14 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 01:31:13 -0500
Message-Id: <1313044273-29854-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH v2] tune-ppce5500: Add a set of tune files for PowerPC e5500 core
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
X-List-Received-Date: Thu, 11 Aug 2011 06:35:44 -0000

The PPC e5500 is a 64-bit core so we add both a 32 and 64-bit set of
tune files to allow for:

* pure 32-bit build
* pure 64-bit build
* 32-bit base, 64-bit multilib
* 64-bit base, 32-bit multilib

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/tune-ppce5500-32b.inc |   15 +++++++++++++++
 meta/conf/machine/include/tune-ppce5500-64b.inc |   15 +++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppce5500-32b.inc
 create mode 100644 meta/conf/machine/include/tune-ppce5500-64b.inc

diff --git a/meta/conf/machine/include/tune-ppce5500-32b.inc b/meta/conf/machine/include/tune-ppce5500-32b.inc
new file mode 100644
index 0000000..7a9e533
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce5500-32b.inc
@@ -0,0 +1,15 @@
+DEFAULTTUNE ?= "ppce5500"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[ppce5500] = "Enable ppce5500 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "-mcpu=e5500", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500", "${PPCPKGARCH}", d)}"
+
+AVAILTUNES = "ppce5500"
+TUNE_FEATURES_tune-ppce5500 = "m32 ppce5500"
+PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc ppce5500"
+BASE_LIB_tune-ppce5500 = "lib"
+
+# glibc configure options to get e5500 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "--with-cpu=e5500", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce5500-64b.inc b/meta/conf/machine/include/tune-ppce5500-64b.inc
new file mode 100644
index 0000000..683d25f
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce5500-64b.inc
@@ -0,0 +1,15 @@
+DEFAULTTUNE ?= "ppc64e5500"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[ppc64e5500] = "Enable ppc64e5500 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "-mcpu=e5500", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "ppc64e5500", "${PPCPKGARCH}", d)}"
+
+AVAILTUNES = "ppc64e5500"
+TUNE_FEATURES_tune-ppc64e5500 = "m64 ppc64e5500"
+PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "powerpc64 ppc64e5500"
+BASE_LIB_tune-ppc64e5500 = "lib64"
+
+# glibc configure options to get e5500 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "--with-cpu=e5500", "", d)}"
-- 
1.7.3.4



