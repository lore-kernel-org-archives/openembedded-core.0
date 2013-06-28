Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 563746ADA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:13:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 03:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323846697"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 03:04:43 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id A2F0C6A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:04:40 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 13:04:42 +0300
Message-Id: <b00e5c01290cab40c0a0ca9adf63fd800a4e704e.1372413711.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 7/8] lib/oeqa/runtime: image sanity tests
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
X-List-Received-Date: Fri, 28 Jun 2013 10:13:08 -0000

These are basic sanity tests. A test can be force run by setting
TEST_SUITES = "ping ssh <module-name>" in local.conf.
By default there are suites for minimal, sato and sato-sdk images.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/lib/oeqa/runtime/__init__.py |  0
 meta/lib/oeqa/runtime/connman.py  | 34 ++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/dmesg.py    | 10 ++++++++++
 meta/lib/oeqa/runtime/multilib.py | 14 ++++++++++++++
 meta/lib/oeqa/runtime/ping.py     | 11 +++++++++++
 meta/lib/oeqa/runtime/rpm.py      | 25 +++++++++++++++++++++++++
 meta/lib/oeqa/runtime/smart.py    | 23 +++++++++++++++++++++++
 meta/lib/oeqa/runtime/ssh.py      | 16 ++++++++++++++++
 8 files changed, 133 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/__init__.py
 create mode 100644 meta/lib/oeqa/runtime/connman.py
 create mode 100644 meta/lib/oeqa/runtime/dmesg.py
 create mode 100644 meta/lib/oeqa/runtime/multilib.py
 create mode 100644 meta/lib/oeqa/runtime/ping.py
 create mode 100644 meta/lib/oeqa/runtime/rpm.py
 create mode 100644 meta/lib/oeqa/runtime/smart.py
 create mode 100644 meta/lib/oeqa/runtime/ssh.py

diff --git a/meta/lib/oeqa/runtime/__init__.py b/meta/lib/oeqa/runtime/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime/connman.py
new file mode 100644
index 0000000..835e135
--- /dev/null
+++ b/meta/lib/oeqa/runtime/connman.py
@@ -0,0 +1,34 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("connman"):
+        skipModule("No connman package in image")
+
+
+class ConnmanTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ssh')
+    def test_connmand_help(self):
+        (status, output) = self.target.run('/usr/sbin/connmand --help')
+        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
+
+
+    @skipUnlessPassed('test_connmand_help')
+    def test_connmand_running(self):
+        status = self.target.run('ls -l `which ps` | grep busybox')[0]
+        if status == 0:
+            oeRuntimeTest.pscmd = 'ps'
+        else:
+            oeRuntimeTest.pscmd = 'ps -ef'
+        (status, output) = self.target.run(oeRuntimeTest.pscmd + ' | grep [c]onnmand')
+        self.assertEqual(status, 0, msg="no connmand process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])
+
+    @skipUnlessPassed('test_connmand_running')
+    def test_connmand_unique(self):
+        self.target.run('/usr/sbin/connmand')
+        output = self.target.run(oeRuntimeTest.pscmd + ' | grep -c [c]onnmand')[1]
+        self.assertEqual(output, "1", msg="more than one connmand running in background, ps output: %s\n%s" % (output, self.target.run(oeRuntimeTest.pscmd)[1]))
+
+
diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
new file mode 100644
index 0000000..3acf09e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/dmesg.py
@@ -0,0 +1,10 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+
+class DmesgTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ssh')
+    def test_dmesg(self):
+        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -i error')
+        self.assertEqual(status, 1, msg = "Error messages in dmesg log: %s" % output)
diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime/multilib.py
new file mode 100644
index 0000000..397d075
--- /dev/null
+++ b/meta/lib/oeqa/runtime/multilib.py
@@ -0,0 +1,14 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest, skipModule
+
+def setUpModule():
+    multilibs = oeRuntimeTest.tc.d.getVar("MULTILIBS", True) or ""
+    if "multlib:lib32" not in multilibs:
+        skipModule("this isn't a multilib:lib32 image")
+
+
+class MultilibFileTest(oeRuntimeTest):
+
+    def test_file_connman(self):
+        (status, output) = self.target.run('file -L /usr/sbin/connmand | grep "ELF 32-bit LSB executable"')
+        self.assertEqual(status, 0, msg="status and output : %s and %s" % (status,output))
diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime/ping.py
new file mode 100644
index 0000000..d6a0c28
--- /dev/null
+++ b/meta/lib/oeqa/runtime/ping.py
@@ -0,0 +1,11 @@
+import subprocess
+import unittest
+import sys
+from oeqa.oetest import oeRuntimeTest
+
+class PingTest(oeRuntimeTest):
+
+    def test_ping(self):
+        status = subprocess.call("ping -w 30 -c 1 %s" % oeRuntimeTest.tc.qemu.ip, shell=True, stdout=subprocess.PIPE)
+        self.assertEqual(status, 0)
+
diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
new file mode 100644
index 0000000..57101b0
--- /dev/null
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -0,0 +1,25 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("package-management"):
+            skipModule("rpm module skipped: target doesn't have package-management in IMAGE_FEATURES")
+    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES", True).split()[0]:
+            skipModule("rpm module skipped: target doesn't have rpm as primary package manager")
+
+
+class RpmHelpTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ssh')
+    def test_rpm_help(self):
+        (status, output) = self.target.run('rpm --help')
+        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
+
+class RpmQueryTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_rpm_help')
+    def test_rpm_query(self):
+        (status, output) = self.target.run('rpm -q rpm')
+        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
+
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
new file mode 100644
index 0000000..b7d4e3e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -0,0 +1,23 @@
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("package-management"):
+        skipModule("Image doesn't have package management feature")
+    if not oeRuntimeTest.hasPackage("smart"):
+        skipModule("Image doesn't have smart installed")
+
+class SmartHelpTest(oeRuntimeTest):
+
+    def test_smart_help(self):
+        status = self.target.run('smart --help')[0]
+        self.assertEqual(status, 0)
+
+class SmartQueryTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_smart_help')
+    def test_smart_query(self):
+        (status, output) = self.target.run('smart query rpm')
+        self.assertEqual(status, 0, msg="status and output : %s and %s" % (status,output))
+
diff --git a/meta/lib/oeqa/runtime/ssh.py b/meta/lib/oeqa/runtime/ssh.py
new file mode 100644
index 0000000..8c96020
--- /dev/null
+++ b/meta/lib/oeqa/runtime/ssh.py
@@ -0,0 +1,16 @@
+import subprocess
+import unittest
+import sys
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+
+def setUpModule():
+    if not (oeRuntimeTest.hasPackage("dropbear") or oeRuntimeTest.hasPackage("openssh")):
+        skipModule("No ssh package in image")
+
+class SshTest(oeRuntimeTest):
+
+    @skipUnlessPassed('test_ping')
+    def test_ssh(self):
+        (status, output) = self.target.run('uname -a')
+        self.assertEqual(status, 0, msg="SSH Test failed: %s" % output)
-- 
1.8.1.4


