Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.3016.1616185849505161916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 13:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=nicucJFj;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616185850;
  x=1647721850;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zGbW1myqwK0GgVXFFFe9qcpSYfFwOhWOXSpeTLYr5YU=;
  b=nicucJFjkVFLLhdMDVWhtsp1P4OrW7Y+kSs9fKq9a9o8QSaIA5XQ9xTP
   lse4t6Zm7xwZ/ydE8xBEMfwpeBB/m7hWZWqRUnx0YcusxC2LhltCdWVXg
   7m9NZ5v8TpmAEHsl2LOxvpXBKvSC5Fdp++Q7JC1xTI6ryOegQDa8NL8MQ
   NyidG8zrPGTx62M/vxlg/FdMLdeYZsHqPIMyKtS7iIagwNIxJ2iCoDOhN
   ZtH9tM+66YAZPINemUc/Ec9iAi5DI5dIGuowxNIRewK6ftCtmyGDLix2D
   kUR1dJHaYCjr0y26xcXymuiv2FLwwCU+lGiZCs8CwBtJ5kes2S2/kIb0+
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>, Paul Barker
	<pbarker@konsulko.com>
Subject: [PATCH] bitbake.conf: Prevent pyc file creation in pseudo context for shell tasks
Date: Fri, 19 Mar 2021 21:30:31 +0100
Message-ID: <20210319203032.16009-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In commit 73d538f2 (bitbake.conf: Prevent pyc file generation in
pseudo context), pyc generation was disabled for fakeroot python
tasks. However, Python applications started from a fakeroot shell task
were not affected by this and would still generate pyc files, which
could trigger pseudo to abort. To avoid this, add
PYTHONDONTWRITEBYTECODE=1 also to FAKEROOTENV.

Also add a test case to ensure that pyc files are not created by
Python applications started from shell tasks that are executed under
pseudo.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../pseudo-pyc-test/files/test-app1.py        |  5 +++
 .../pseudo-pyc-test/files/test-app2.py        |  4 +++
 ...-pyc-test.bb => pseudo-pyc-python-test.bb} |  0
 .../pseudo-pyc-test/pseudo-pyc-shell-test.bb  | 16 ++++++++++
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oeqa/selftest/cases/pseudo.py        | 32 ++++++++++++-------
 6 files changed, 47 insertions(+), 12 deletions(-)
 create mode 100755 meta-selftest/recipes-test/pseudo-pyc-test/files/test-app1.py
 create mode 100755 meta-selftest/recipes-test/pseudo-pyc-test/files/test-app2.py
 rename meta-selftest/recipes-test/pseudo-pyc-test/{pseudo-pyc-test.bb => pseudo-pyc-python-test.bb} (100%)
 create mode 100644 meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-shell-test.bb

diff --git a/meta-selftest/recipes-test/pseudo-pyc-test/files/test-app1.py b/meta-selftest/recipes-test/pseudo-pyc-test/files/test-app1.py
new file mode 100755
index 0000000000..7578870765
--- /dev/null
+++ b/meta-selftest/recipes-test/pseudo-pyc-test/files/test-app1.py
@@ -0,0 +1,5 @@
+#!/usr/bin/env python3
+import sys
+
+import pseudo_pyc_test1
+print(pseudo_pyc_test1.STRING)
diff --git a/meta-selftest/recipes-test/pseudo-pyc-test/files/test-app2.py b/meta-selftest/recipes-test/pseudo-pyc-test/files/test-app2.py
new file mode 100755
index 0000000000..2ee1e24e52
--- /dev/null
+++ b/meta-selftest/recipes-test/pseudo-pyc-test/files/test-app2.py
@@ -0,0 +1,4 @@
+#!/usr/bin/env python3
+
+import pseudo_pyc_test2
+print(pseudo_pyc_test2.STRING)
diff --git a/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-python-test.bb
similarity index 100%
rename from meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
rename to meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-python-test.bb
diff --git a/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-shell-test.bb b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-shell-test.bb
new file mode 100644
index 0000000000..1e0c532a3a
--- /dev/null
+++ b/meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-shell-test.bb
@@ -0,0 +1,16 @@
+SUMMARY = "pseudo env test"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://test-app1.py"
+SRC_URI += "file://test-app2.py"
+
+do_compile() {
+	${WORKDIR}/test-app1.py
+}
+
+do_install() {
+	${WORKDIR}/test-app2.py
+}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ecd4d1638e..3a158d0e6f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -694,7 +694,7 @@ export PSEUDO_DISABLED = "1"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
 FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 FAKEROOTLOGS = "${WORKDIR}/pseudo/pseudo.log"
diff --git a/meta/lib/oeqa/selftest/cases/pseudo.py b/meta/lib/oeqa/selftest/cases/pseudo.py
index 33593d5ce9..4265b39ecf 100644
--- a/meta/lib/oeqa/selftest/cases/pseudo.py
+++ b/meta/lib/oeqa/selftest/cases/pseudo.py
@@ -9,19 +9,29 @@ from oeqa.utils.commands import bitbake, get_test_layer
 from oeqa.selftest.case import OESelftestTestCase
 
 class Pseudo(OESelftestTestCase):
+    def setUp(self):
+        metaselftestpath = get_test_layer()
+        lib_path = os.path.join(metaselftestpath, 'lib')
+        self.write_config('export PYTHONPATH="%s"' % lib_path)
 
-    def test_pseudo_pyc_creation(self):
-        self.write_config("")
+        self.pycache_path = os.path.join(lib_path, '__pycache__')
+        if os.path.exists(self.pycache_path):
+            shutil.rmtree(self.pycache_path)
 
-        metaselftestpath = get_test_layer()
-        pycache_path = os.path.join(metaselftestpath, 'lib/__pycache__')
-        if os.path.exists(pycache_path):
-            shutil.rmtree(pycache_path)
+    def test_pseudo_pyc_creation_in_python_task(self):
+        bitbake('pseudo-pyc-python-test -c install')
+
+        test1_pyc_present = len(glob.glob(os.path.join(self.pycache_path, 'pseudo_pyc_test1.*.pyc')))
+        self.assertTrue(test1_pyc_present, 'python test1 pyc file missing, should be created outside of pseudo context.')
+
+        test2_pyc_present = len(glob.glob(os.path.join(self.pycache_path, 'pseudo_pyc_test2.*.pyc')))
+        self.assertFalse(test2_pyc_present, 'python test2 pyc file present, should not be created in pseudo context.')
 
-        bitbake('pseudo-pyc-test -c install')
+    def test_pseudo_pyc_creation_in_shell_task(self):
+        bitbake('pseudo-pyc-shell-test -c install')
 
-        test1_pyc_present = len(glob.glob(os.path.join(pycache_path, 'pseudo_pyc_test1.*.pyc')))
-        self.assertTrue(test1_pyc_present, 'test1 pyc file missing, should be created outside of pseudo context.')
+        test1_pyc_present = len(glob.glob(os.path.join(self.pycache_path, 'pseudo_pyc_test1.*.pyc')))
+        self.assertTrue(test1_pyc_present, 'shell test1 pyc file missing, should be created outside of pseudo context.')
 
-        test2_pyc_present = len(glob.glob(os.path.join(pycache_path, 'pseudo_pyc_test2.*.pyc')))
-        self.assertFalse(test2_pyc_present, 'test2 pyc file present, should not be created in pseudo context.')
+        test2_pyc_present = len(glob.glob(os.path.join(self.pycache_path, 'pseudo_pyc_test2.*.pyc')))
+        self.assertFalse(test2_pyc_present, 'shell test2 pyc file present, should not be created in pseudo context.')
