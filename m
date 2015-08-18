Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 80A1A7689C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 23:00:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 18 Aug 2015 16:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,705,1432623600"; d="scan'208";a="771352657"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2015 16:00:58 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2015 14:52:38 +0000
Message-Id: <1439909558-29117-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2] testimage: Run commands in target and host when test fails
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
X-List-Received-Date: Tue, 18 Aug 2015 23:01:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This patch modify three files altought two of them
are minimal modifications. This version includes
the changes proposed by Paul.

testimage.bbclass:
    Create new vars for easy modification of the dump
directory and commands to be run on host and target
when a test fails
    TESTIMAGE_DUMP_DIR: Directory to save the dumps
    testimage_dump_target: Commands to run on target
    testimage_dump_host: Commands to run on host

oetest.py:
    - Allow to use the vars defined in testimage class
    - Now able to run commands in the host and dump the
      results
    - Fix an issue with the condition where to run the
      dump commands (Before it run the commands every
      test after a failure, now it runs the commands only
      in tests that failed)
    - Fix the output to stdout

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 24 +++++++++++++++++++++
 meta/lib/oeqa/oetest.py        | 48 +++++++++++++++++++++++++++++-------------
 meta/lib/oeqa/targetcontrol.py |  3 +++
 3 files changed, 60 insertions(+), 15 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 140babe..1d9464f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -56,6 +56,30 @@ TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:d
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
 
+TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests/"
+
+testimage_dump_target () {
+    top -bn1
+    ps
+    free
+    df
+    _ping
+    dmesg
+    netstat -an
+    ip address
+    _logs
+}
+
+testimage_dump_host () {
+    top -bn1
+    ps -ef
+    free
+    df
+    memstat
+    dmesg
+    netstat -an
+}
+
 python do_testimage() {
     testimage_main(d)
 }
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index dfed3de..e765c96 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -12,8 +12,10 @@ import unittest
 import inspect
 import subprocess
 import datetime
+import commands
 import bb
 from oeqa.utils.decorators import LogResults
+from sys import exc_info, exc_clear
 
 def loadTests(tc, type="runtime"):
     if type == "runtime":
@@ -120,35 +122,51 @@ class oeRuntimeTest(oeTest):
 
     def tearDown(self):
         # If a test fails or there is an exception
-        if (self._resultForDoCleanups.failures or
-                self._resultForDoCleanups.errors):
-            self.dump_target_logs()
-
-    def dump_target_logs(self):
-        commands = ["top -bn1", "ps", "free", "df", "_ping", "dmesg", "netstat -a", "ifconfig -a", "_logs"]
-        dump_dir = "/tmp/oe-saved-tests"
+        if not exc_info() == (None, None, None):
+            exc_clear()
+            dump_dir = self.create_dump_dir()
+            print ("%s dump data from host and target "
+                "stored in %s" % (self._testMethodName, dump_dir))
+            self.dump_host_logs(dump_dir)
+            self.dump_target_logs(dump_dir)
+
+    def create_dump_dir(self):
         dump_sub_dir = ("%s_%s" % (
                 datetime.datetime.now().strftime('%Y%m%d%H%M'),
                 self._testMethodName))
-        dump_dir = os.path.join(dump_dir, dump_sub_dir)
+        dump_dir = os.path.join(self.target.dump_dir, dump_sub_dir)
         os.makedirs(dump_dir)
-        bb.warn("%s failed: getting data from target and "
-                "saving into %s" % (self._testMethodName, dump_dir))
-        for command in commands:
+        return dump_dir
+
+    def dump_host_logs(self, dump_dir):
+        for cmd in self.target.dump_host.split('\n'):
+            cmd = cmd.lstrip()
+            if not cmd:
+                continue
+            output = commands.getoutput(cmd)
+            filename = "host_%s" % cmd.split()[0]
+            with open(os.path.join(dump_dir, filename), 'w') as f:
+                f.write(output)
+
+    def dump_target_logs(self, dump_dir):
+        for cmd in self.target.dump_target.split('\n'):
+            cmd = cmd.lstrip()
+            if not cmd:
+                continue
             # This will ping the host from target
-            if command == "_ping":
+            if cmd == "_ping":
                  comm = "ping -c3 %s" % self.target.server_ip
             # This will get all the logs from /var/log/
-            elif command == "_logs":
+            elif cmd == "_logs":
                 comm = 'find /var/log/ -type f 2>/dev/null '
                 comm = '%s-exec echo "%s" \\; ' % (comm, '='*20)
                 comm = '%s-exec echo {} \\; ' % comm
                 comm = '%s-exec echo "%s" \\; ' % (comm, '='*20)
                 comm = '%s-exec cat {} \\; -exec echo "" \\;' % comm
             else:
-                comm = command 
+                comm = cmd
             (status, output) = self.target.run_serial(comm)
-            filename = command.split()[0]
+            filename = "target_%s" % cmd.split()[0]
             with open(os.path.join(dump_dir, filename), 'w') as f:
                 f.write(output)
 
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index c76887b..59cae2e 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -123,6 +123,9 @@ class QemuTarget(BaseTarget):
         self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
         self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
         self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
+        self.dump_target = d.getVar("testimage_dump_target", True)
+        self.dump_host = d.getVar("testimage_dump_host", True)
+        self.dump_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
 
         # Log QemuRunner log output to a file
         import oe.path
-- 
1.8.4.5


