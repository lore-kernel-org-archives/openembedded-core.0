Received: from gate.crashing.org ([63.228.1.57])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkGIh-0001DM-Ml
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 16:02:01 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6MDvmmo016716
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 08:57:49 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 08:57:48 -0500
Message-Id: <1311343068-942-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] gcc-4.6: Fix packaging of native toolchains
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
X-List-Received-Date: Fri, 22 Jul 2011 14:02:01 -0000

The base gcc package is missing liblto_plugin.so.  If we try a simple
hello world compile we get something like:

root@p5020-ds:~# gcc hello.c
gcc: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
compilation terminated.

We need to include liblto_plugin.so in the base gcc package and not
gcc-dev.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index a724594..4c1e1e1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r1"
+PR = "r2"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index e6105da..a0e5da4 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -17,6 +17,7 @@ FILES_${PN} = "\
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
-- 
1.7.3.4



