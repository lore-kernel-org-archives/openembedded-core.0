Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+oh1L0cWGNL4m8WPYuBImQjdxFhNxvEOY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QntRQ-0003kX-7A
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:26:01 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p71ELelU024083
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 09:21:41 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 09:21:40 -0500
Message-Id: <1312208500-13381-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] gcc: Add ability for tune files to pass in configure options to gcc
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
X-List-Received-Date: Mon, 01 Aug 2011 14:26:01 -0000

Added a ${GCC_EXTRA_OECONF} to the the building up of gcc's
${EXTRA_OECONF}.  This is similar to what we have in the glibc recipe
files.

This allows for a tune file to add something like:

GCC_EXTRA_OECONF += "--with-cpu=e5500"

If needed.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 ++
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    2 +-
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 4c1e1e1..b054266 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r2"
+PR = "r3"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 9f5ba33..aac6d69 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -20,6 +20,7 @@ LANGUAGES ?= "c,c++${FORTRAN}${JAVA}"
 SPECIAL_ARCH_LIST = "powerpc"
 OPTSPACE = ${@base_contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}", "", "--enable-target-optspace",d)}
 
+GCC_EXTRA_OECONF ?= ""
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""
 EXTRA_OECONF_INITIAL ?= ""
@@ -39,6 +40,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
                 --enable-libstdcxx-pch \
                 --program-prefix=${TARGET_PREFIX} \
                 ${OPTSPACE} \
+                ${GCC_EXTRA_OECONF} \
                 ${EXTRA_OECONF_BASE} \
                 ${EXTRA_OECONF_FPU} \
                 ${EXTRA_OECONF_PATHS} \
diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
index 12e42c4..f036cb1 100644
--- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r7"
+PR = "r8"
 require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
index 2df12ef..9fd2b0a 100644
--- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
@@ -1,4 +1,4 @@
-PR = "r4"
+PR = "r5"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
-- 
1.7.3.4



