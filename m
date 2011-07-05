Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWp-0006vI-W2
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:40 +0200
Received: by rex (Postfix, from userid 1000)
	id ACCDA292E7; Tue,  5 Jul 2011 23:51:19 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:02 +0100
Message-Id: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 01/17] gcc: Fix unpackaged files warnings, broken symlink and superfluous files
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
X-List-Received-Date: Tue, 05 Jul 2011 22:55:40 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-package-target.inc |   25 +++++++++++++++++----
 1 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index 8c66c72..69abf72 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -6,6 +6,8 @@ PACKAGES = "\
   gfortran gfortran-symlinks \
   gcov gcov-symlinks \
   ${PN}-doc \
+  ${PN}-dev \
+  ${PN}-dbg \
 "
 
 FILES_${PN} = "\
@@ -19,6 +21,12 @@ FILES_${PN} = "\
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
 "
+FILES_${PN}-dbg += "\
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
+"
+FILES_${PN}-dev = "\
+  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
+"
 FILES_${PN}-symlinks = "\
   ${bindir}/cc \
   ${bindir}/gcc \
@@ -93,16 +101,23 @@ do_install () {
 	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
 	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
 
+	# Not sure why we end up with these but we don't want them...
+	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
+
 	# Symlinks so we can use these trivially on the target
-	ln -sf ${TARGET_PREFIX}g77 g77 || true
-	ln -sf ${TARGET_PREFIX}gfortran gfortran || true
+	if [ -e ${TARGET_PREFIX}g77 ]; then
+		ln -sf ${TARGET_PREFIX}g77 g77 || true
+		ln -sf g77 f77 || true
+	fi
+	if [ -e ${TARGET_PREFIX}gfortran ]; then
+		ln -sf ${TARGET_PREFIX}gfortran gfortran || true
+		ln -sf gfortran f95 || true
+	fi
 	ln -sf ${TARGET_PREFIX}g++ g++
 	ln -sf ${TARGET_PREFIX}gcc gcc
-	ln -sf g77 f77 || true
-	ln -sf gfortran f95 || true
+	ln -sf ${TARGET_PREFIX}cpp cpp
 	ln -sf g++ c++
 	ln -sf gcc cc
-	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${bindir}/cpp
 
 	chown -R root:root ${D}
 }
-- 
1.7.4.1



