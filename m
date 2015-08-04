Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 3D84A75EEA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 14:52:12 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8AD7DF811DC; Tue,  4 Aug 2015 08:52:11 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id E1E9FF811DC;
	Tue,  4 Aug 2015 08:52:10 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Aug 2015 08:52:19 -0600
Message-Id: <1438699939-9055-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] python3: Fix nativesdk build
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
X-List-Received-Date: Tue, 04 Aug 2015 14:52:15 -0000

The nativesdk package is built without Py_DEBUG which causes some
compile errors.  This patch fixes those errors allowing the nativesdk
package to build.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../python/python3/fix-nativesdk-build.patch       | 28 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.4.3.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/fix-nativesdk-build.patch

diff --git a/meta/recipes-devtools/python/python3/fix-nativesdk-build.patch b/meta/recipes-devtools/python/python3/fix-nativesdk-build.patch
new file mode 100644
index 0000000..d0cba39
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/fix-nativesdk-build.patch
@@ -0,0 +1,28 @@
+Index: Python-3.4.3/Objects/unicodeobject.c
+===================================================================
+--- Python-3.4.3.orig/Objects/unicodeobject.c
++++ Python-3.4.3/Objects/unicodeobject.c
+@@ -418,6 +418,9 @@ _PyUnicode_CheckConsistency(PyObject *op
+     }
+     return 1;
+ }
++#else
++int
++_PyUnicode_CheckConsistency(PyObject *op, int check_content) { return 1; }
+ #endif
+ 
+ static PyObject*
+Index: Python-3.4.3/Objects/obmalloc.c
+===================================================================
+--- Python-3.4.3.orig/Objects/obmalloc.c
++++ Python-3.4.3/Objects/obmalloc.c
+@@ -2141,7 +2141,9 @@ _PyObject_DebugMallocStats(FILE *out)
+ 
+             if (p->ref.count == 0) {
+                 /* currently unused */
++#ifdef Py_DEBUG
+                 assert(pool_is_in_list(p, arenas[i].freepools));
++#endif
+                 continue;
+             }
+             ++numpools[sz];
diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index 6c2e21d..582f6b0 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -38,6 +38,7 @@ SRC_URI += "\
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://setup.py-find-libraries-in-staging-dirs.patch \
            "
+SRC_URI_append_class-nativesdk = "file://fix-nativesdk-build.patch"
 SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
 SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
 
-- 
1.9.1


