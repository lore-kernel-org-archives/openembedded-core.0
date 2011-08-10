Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19s+jIKk+R21Ulxxz599ktvnF7wa39HaBA=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qr0Dt-00069O-8d
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 06:16:53 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7A4CNI2021651
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 23:12:23 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 23:12:23 -0500
Message-Id: <1312949543-29183-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] gcc: move --enable-target-optspace workaround to just gcc-4.5.1
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
X-List-Received-Date: Wed, 10 Aug 2011 04:16:53 -0000

For ppc we disable '--enable-target-optspace' because of a bug in gcc
4.5.x.  gcc 4.6.x fixes this issue so no need to do this.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    8 ++++++++
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    7 +------
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index 1b21a75..54a2d87 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -93,6 +93,14 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
 				--disable-libgomp \
 				--disable-libssp"
 
+# disable --enable-target-optspace for powerpc SPE
+# at -Os libgcc.so.1 creates references into
+# hidden symbols in libgcc.a which linker complains
+# when linking shared libraries further in the build like (gnutls)
+
+SPECIAL_ARCH_LIST = "powerpc"
+OPTSPACE = ${@base_contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}", "", "--enable-target-optspace",d)}
+
 EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index f952ac8..0f40ac9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r4"
+PR = "r5"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 869d1b6..56721ce 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -12,13 +12,8 @@ JAVA_sh3 ?= ""
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
 FORTRAN ?= ",f77"
 LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
-# disable --enable-target-optspace for powerpc SPE
-# at -Os libgcc.so.1 creates references into
-# hidden symbols in libgcc.a which linker complains
-# when linking shared libraries further in the build like (gnutls)
 
-SPECIAL_ARCH_LIST = "powerpc"
-OPTSPACE = ${@base_contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}", "", "--enable-target-optspace",d)}
+OPTSPACE ?= "--enable-target-optspace"
 
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""
-- 
1.7.3.4



