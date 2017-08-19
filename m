Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 40D58783E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 17:22:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2017 10:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="1164282548"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2017 10:22:09 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 10:21:57 -0700
Message-Id: <1503163317-30004-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2] python2.7: improve reproducibility
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
X-List-Received-Date: Sat, 19 Aug 2017 17:22:08 -0000

The compiled .pyc files contain time stamp corresponding to the compile time.
This prevents binary reproducibility. This patch allows to achieve binary
reproducibility by overriding the build time stamp by the value
exported via SOURCE_DATE_EPOCH.

Patch by Bernhard M. Wiedemann, backported from https://github.com/python/cpython/pull/296

[YOCTO#11241]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 ...pport_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.13.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch

diff --git a/meta/recipes-devtools/python/python/support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch b/meta/recipes-devtools/python/python/support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch
new file mode 100644
index 0000000..1265179
--- /dev/null
+++ b/meta/recipes-devtools/python/python/support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch
@@ -0,0 +1,34 @@
+The compiled .pyc files contain time stamp corresponding to the compile time.
+This prevents binary reproducibility. This patch allows to achieve binary
+reproducibility by overriding the build time stamp by the value 
+exported via SOURCE_DATE_EPOCH. 
+
+Patch by Bernhard M. Wiedemann
+
+Upstream-Status: Backport
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+Fri Feb 24 17:08:25 UTC 2017 - bwiedemann@suse.com
+
+- Add reproducible.patch to allow reproducible builds of various
+  python packages like python-amqp
+  Upstream: https://github.com/python/cpython/pull/296
+
+
+@@ -0,0 +1,15 @@
+Index: Python-2.7.13/Lib/py_compile.py
+===================================================================
+--- Python-2.7.13.orig/Lib/py_compile.py
++++ Python-2.7.13/Lib/py_compile.py
+@@ -108,6 +108,10 @@ def compile(file, cfile=None, dfile=None
+             timestamp = long(os.fstat(f.fileno()).st_mtime)
+         except AttributeError:
+             timestamp = long(os.stat(file).st_mtime)
++        sde = os.environ.get('SOURCE_DATE_EPOCH')
++        if sde and timestamp > int(sde):
++            timestamp = int(sde)
++            os.utime(file, (timestamp, timestamp))
+         codestring = f.read()
+     try:
+         codeobject = __builtin__.compile(codestring, dfile or file,'exec')
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 98bc8ad..4d73cd2 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -28,6 +28,7 @@ SRC_URI += "\
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
   file://Don-t-use-getentropy-on-Linux.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
+  file://support_SOURCE_DATE_EPOCH_in_py_compile_2.7.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


