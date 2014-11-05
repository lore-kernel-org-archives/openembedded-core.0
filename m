Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 2027A6FCA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 14:57:37 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A42FAF811E3; Wed,  5 Nov 2014 07:57:38 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D5220F811DF;
	Wed,  5 Nov 2014 07:57:37 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Nov 2014 07:57:38 -0700
Message-Id: <1415199458-26876-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] python-pygtk: Clean up incorrect "fix"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Nov 2014 14:57:44 -0000

This patch removes most of "dirty fix #1" which is no longer needed
(no dependency on python-pygobject-dev exists).  A side effect is
that the pygtk code generator will also be installed.

Merge 'fix-path.inc' into this recipe as it is not used by any other
recipe.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-devtools/python/fix-path.inc          | 22 ------------------
 .../recipes-devtools/python/python-pygtk_2.24.0.bb | 27 +++++++++++++++++-----
 2 files changed, 21 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/fix-path.inc

diff --git a/meta/recipes-devtools/python/fix-path.inc b/meta/recipes-devtools/python/fix-path.inc
deleted file mode 100644
index 0738c59..0000000
--- a/meta/recipes-devtools/python/fix-path.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-do_install_append() {
-        for i in `find ${D} -name "*.py"` ; do \
-            sed -i -e s:${D}::g $i
-        done
-
-        for i in `find ${D} -name "*.la"` ; do \
-            sed -i -e s:${STAGING_LIBDIR}:${libdir}:g $i
-        done
-        
-        if test -e ${D}${bindir} ; then
-            for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
-
-        if test -e ${D}${sbindir} ; then
-            for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
-}
-
diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index bd26ebb..053f37f 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -40,16 +40,31 @@ do_configure_prepend() {
 	sed -i 's:tests docs:tests:' ${S}/Makefile.am
 }
 
-# dirty fix #1: remove dependency on python-pygobject-dev
+# dirty fix #2: fix build system paths leaking in
 do_install_append() {
-	find ${D} -name "*.la"|xargs rm -f
-	rm -f ${D}/${bindir}/pygtk-codegen-2.0
+        for i in `find ${D} -name "*.py"` ; do \
+            sed -i -e s:${D}::g $i
+        done
+
+        for i in `find ${D} -name "*.la"` ; do \
+            sed -i -e s:${STAGING_LIBDIR}:${libdir}:g $i
+        done
+        
+        if test -e ${D}${bindir} ; then
+            for i in ${D}${bindir}/* ; do \
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+            done
+        fi
+
+        if test -e ${D}${sbindir} ; then
+            for i in ${D}${sbindir}/* ; do \
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+            done
+        fi
+
 	sed -i -e '1s|^#!.*python|#!/usr/bin/env python|' ${D}${bindir}/pygtk-demo
 }
 
-# dirty fix #2: fix build system paths leaking in
-require fix-path.inc
-
 PACKAGES =+ "${PN}-demo"
 FILES_${PN}-demo = " ${bindir}/pygtk-demo ${libdir}/pygtk "
 RDEPENDS_${PN}-demo = "python-pygtk python-stringold python-lang"
-- 
1.9.1


