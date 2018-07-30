Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id C82897473A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 21:59:11 +0000 (UTC)
Received: from xps.local (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id DAF961C09C8;
	Mon, 30 Jul 2018 23:59:11 +0200 (CEST)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 23:59:06 +0200
Message-Id: <20180730215906.30079-1-martin@geanix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH][sumo] python2: Fix build with gcc8
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
X-List-Received-Date: Mon, 30 Jul 2018 21:59:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 910f68c9c8dc26e12d28ef29e956af63d100f121)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 .../python/python-native_2.7.14.bb            |  1 +
 .../python/python/fix-gc-alignment.patch      | 43 +++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.14.bb |  1 +
 3 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/fix-gc-alignment.patch

diff --git a/meta/recipes-devtools/python/python-native_2.7.14.bb b/meta/recipes-devtools/python/python-native_2.7.14.bb
index 7c491fa3e0..b822583c53 100644
--- a/meta/recipes-devtools/python/python-native_2.7.14.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.14.bb
@@ -16,6 +16,7 @@ SRC_URI += "\
             file://builddir.patch \
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
+            file://fix-gc-alignment.patch \
            "
 
 S = "${WORKDIR}/Python-${PV}"
diff --git a/meta/recipes-devtools/python/python/fix-gc-alignment.patch b/meta/recipes-devtools/python/python/fix-gc-alignment.patch
new file mode 100644
index 0000000000..b63cd08747
--- /dev/null
+++ b/meta/recipes-devtools/python/python/fix-gc-alignment.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Fix for over-aligned GC info
+Patch by Florian Weimer
+
+See: https://bugzilla.redhat.com/show_bug.cgi?id=1540316
+Upstream discussion: https://mail.python.org/pipermail/python-dev/2018-January/152000.html
+
+diff --git a/Include/objimpl.h b/Include/objimpl.h
+index 55e83eced6..aa906144dc 100644
+--- a/Include/objimpl.h
++++ b/Include/objimpl.h
+@@ -248,6 +248,18 @@ PyAPI_FUNC(PyVarObject *) _PyObject_GC_Resize(PyVarObject *, Py_ssize_t);
+ /* for source compatibility with 2.2 */
+ #define _PyObject_GC_Del PyObject_GC_Del
+ 
++/* Former over-aligned definition of PyGC_Head, used to compute the
++   size of the padding for the new version below. */
++union _gc_head;
++union _gc_head_old {
++    struct {
++        union _gc_head *gc_next;
++        union _gc_head *gc_prev;
++        Py_ssize_t gc_refs;
++    } gc;
++    long double dummy;
++};
++
+ /* GC information is stored BEFORE the object structure. */
+ typedef union _gc_head {
+     struct {
+@@ -255,7 +267,8 @@ typedef union _gc_head {
+         union _gc_head *gc_prev;
+         Py_ssize_t gc_refs;
+     } gc;
+-    long double dummy;  /* force worst-case alignment */
++    double dummy;  /* force worst-case alignment */
++    char dummy_padding[sizeof(union _gc_head_old)];
+ } PyGC_Head;
+ 
+ extern PyGC_Head *_PyGC_generation0;
+ 
\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python_2.7.14.bb b/meta/recipes-devtools/python/python_2.7.14.bb
index 3044c3d363..b923b9237b 100644
--- a/meta/recipes-devtools/python/python_2.7.14.bb
+++ b/meta/recipes-devtools/python/python_2.7.14.bb
@@ -30,6 +30,7 @@ SRC_URI += "\
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
   file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
+  file://fix-gc-alignment.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.18.0


