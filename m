Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QdmMC-0005V3-WE
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:50:49 +0200
Received: by rex (Postfix, from userid 1000)
	id EA91C30C04; Mon,  4 Jul 2011 17:46:32 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 17:46:25 +0100
Message-Id: <b9d14362b1aed4bf4cb2ee2f2fa41b615ec19d70.1309797628.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
References: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
References: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/8] gcc: Fix removal of libiberty.a
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
X-List-Received-Date: Mon, 04 Jul 2011 16:50:49 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

The changes in commit 553a92c442bc3a35d1520a22e640a3a0e377b8f7 were not applying correctly
due to the error: "find: paths must precede expression"

This patch corrects the find syntax.

[YOCTO #1199]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 .../gcc/gcc-cross-intermediate.inc                 |    4 ++--
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |    4 ++--
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    4 ++--
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index a012049..6844995 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r4"
+PR = "r5"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index 05b5dbc..df5958a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -40,8 +40,8 @@ do_install () {
 	rm -rf ${D}${datadir}/
 
 	# We use libiberty from binutils
-	find -name libiberty.a ${D}${exec_prefix}/lib | xargs rm -f
-	find -name libiberty.h ${D}${exec_prefix}/lib | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
 
 	# Insert symlinks into libexec so when tools without a prefix are searched for, the correct ones are
 	# found. These need to be relative paths so they work in different locations.
diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
index b51336b..3d27788 100644
--- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
@@ -29,8 +29,8 @@ do_install () {
 	done
 
 	# We use libiberty from binutils
-	find -name libiberty.a ${D}${exec_prefix}/lib | xargs rm -f
-	find -name libiberty.h ${D}${exec_prefix}/lib | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
 
 	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
 	if [ "${PN}" == "gcc-cross" -o "${PN}" == "gcc-crosssdk" ]; then
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index 43e2bd5..6cc308c 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -88,8 +88,8 @@ do_install () {
 	rm -f *gcc-?.?*
 
 	# We use libiberty from binutils
-	find -name libiberty.a ${D}${exec_prefix}/lib | xargs rm -f
-	find -name libiberty.h ${D}${exec_prefix}/lib | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
+	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
 
 	# Symlinks so we can use these trivially on the target
 	ln -sf ${TARGET_PREFIX}g77 g77 || true
diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
index e04f443..785d719 100644
--- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r5"
+PR = "r6"
 require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
-- 
1.7.4.1



