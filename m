Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 83C38727E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 10:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SAsCsS029337 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:54:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1yh5lGNk-1Od
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:54:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SArxBn029308
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:54:11 +0100
Message-ID: <1430218439.13022.166.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:53:59 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] lib/oeqa: Add sdk tests for gcc/perl/python
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
X-List-Received-Date: Tue, 28 Apr 2015 10:54:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Enhance testing of the generated SDK tarballs by adding tests for
gcc/perl/python based on the existing runtime tests.

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index da9556a..22d76b3 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -129,6 +129,16 @@ class oeSDKTest(oeTest):
         self.sdktestdir = oeSDKTest.tc.sdktestdir
         super(oeSDKTest, self).__init__(methodName)
 
+    @classmethod
+    def hasHostPackage(self, pkg):
+
+        if re.search(pkg, oeTest.tc.hostpkgmanifest):
+            return True
+        return False
+
+    def _run(self, cmd):
+        return subprocess.check_output(cmd, shell=True)
+
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
diff --git a/meta/lib/oeqa/sdk/gcc.py b/meta/lib/oeqa/sdk/gcc.py
new file mode 100644
index 0000000..67994b9
--- /dev/null
+++ b/meta/lib/oeqa/sdk/gcc.py
@@ -0,0 +1,36 @@
+import unittest
+import os
+import shutil
+from oeqa.oetest import oeSDKTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    machine = oeSDKTest.tc.d.getVar("MACHINE", True)
+    if not oeSDKTest.hasHostPackage("packagegroup-cross-canadian-" + machine):
+        skipModule("SDK doesn't contain a cross-canadian toolchain")
+
+
+class GccCompileTest(oeSDKTest):
+
+    @classmethod
+    def setUpClass(self):
+        for f in ['test.c', 'test.cpp', 'testmakefile']:
+            shutil.copyfile(os.path.join(self.tc.filesdir, f), self.tc.sdktestdir + f)
+
+    def test_gcc_compile(self):
+        self._run('$CC %s/test.c -o %s/test -lm' % (self.tc.sdktestdir, self.tc.sdktestdir))
+
+    def test_gpp_compile(self):
+        self._run('$CXX %s/test.c -o %s/test -lm' % (self.tc.sdktestdir, self.tc.sdktestdir))
+
+    def test_gpp2_compile(self):
+        self._run('$CXX %s/test.cpp -o %s/test -lm' % (self.tc.sdktestdir, self.tc.sdktestdir))
+
+    def test_make(self):
+        self._run('cd %s; make -f testmakefile' % self.tc.sdktestdir)
+
+    @classmethod
+    def tearDownClass(self):
+        files = [self.tc.sdktestdir + f for f in ['test.c', 'test.cpp', 'test.o', 'test', 'testmakefile']]
+        for f in files:
+            bb.utils.remove(f)
diff --git a/meta/lib/oeqa/sdk/perl.py b/meta/lib/oeqa/sdk/perl.py
new file mode 100644
index 0000000..45f422e
--- /dev/null
+++ b/meta/lib/oeqa/sdk/perl.py
@@ -0,0 +1,28 @@
+import unittest
+import os
+import shutil
+from oeqa.oetest import oeSDKTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeSDKTest.hasHostPackage("nativesdk-perl"):
+        skipModule("No perl package in the SDK")
+
+
+class PerlTest(oeSDKTest):
+
+    @classmethod
+    def setUpClass(self):
+        for f in ['test.pl']:
+            shutil.copyfile(os.path.join(self.tc.filesdir, f), self.tc.sdktestdir + f)
+        self.testfile = self.tc.sdktestdir + "test.pl"
+
+    def test_perl_exists(self):
+        self._run('which perl')
+
+    def test_perl_works(self):
+        self._run('perl %s/test.pl' % self.tc.sdktestdir)
+
+    @classmethod
+    def tearDownClass(self):
+        bb.utils.remove("%s/test.pl" % self.tc.sdktestdir)
diff --git a/meta/lib/oeqa/sdk/python.py b/meta/lib/oeqa/sdk/python.py
new file mode 100644
index 0000000..896fab4
--- /dev/null
+++ b/meta/lib/oeqa/sdk/python.py
@@ -0,0 +1,32 @@
+import unittest
+import os
+import shutil
+from oeqa.oetest import oeSDKTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeSDKTest.hasHostPackage("nativesdk-python"):
+        skipModule("No python package in the SDK")
+
+
+class PythonTest(oeSDKTest):
+
+    @classmethod
+    def setUpClass(self):
+        for f in ['test.py']:
+            shutil.copyfile(os.path.join(self.tc.filesdir, f), self.tc.sdktestdir + f)
+
+    def test_python_exists(self):
+        self._run('which python')
+
+    def test_python_stdout(self):
+        output = self._run('python %s/test.py' % self.tc.sdktestdir)
+        self.assertEqual(output.strip(), "the value of a is 0.01", msg="Incorrect output: %s" % output)
+
+    def test_python_testfile(self):
+        self._run('ls /tmp/testfile.python')
+
+    @classmethod
+    def tearDownClass(self):
+        bb.utils.remove("%s/test.py" % self.tc.sdktestdir)
+        bb.utils.remove("/tmp/testfile.python")



