Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C57A8737F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 01:05:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 21 Aug 2015 18:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,723,1432623600"; d="scan'208";a="788755771"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2015 18:05:19 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Aug 2015 16:56:14 +0000
Message-Id: <1440176176-35232-2-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1440176176-35232-1-git-send-email-mariano.lopez@linux.intel.com>
References: <1440176176-35232-1-git-send-email-mariano.lopez@linux.intel.com>
Subject: [PATCH 1/3] dump: Created new classes for dump host and target
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
X-List-Received-Date: Sat, 22 Aug 2015 01:05:19 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

It makes sense to separate the dump commands from the
oeRuntimeTest class, this way it can be used in all
the test context.

These are the changes included in this patch:

    - Created classes: BaseDumper, HostDumper, TargetDumper
    - Create an instance of HostDumper in imagetest.bbclass
      and add it to TestContext class, this way any class
      that have access to the TestContext would be able
      to dump logs from the host
    - Create an instance of TargetDumper in QemuTarget
      class after get the runner, this way it is
      accessible during the tests.

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass |  5 +++
 meta/lib/oeqa/oetest.py        | 52 ++++------------------------
 meta/lib/oeqa/targetcontrol.py |  6 ++--
 meta/lib/oeqa/utils/dump.py    | 77 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+), 49 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/dump.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 1d9464f..824b47f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -231,6 +231,7 @@ def testimage_main(d):
     import time
     from oeqa.oetest import loadTests, runTests
     from oeqa.targetcontrol import get_target_controller
+    from oeqa.utils.dump import get_host_dumper
 
     pn = d.getVar("PN", True)
     export = oe.utils.conditional("TEST_EXPORT_ONLY", "1", True, False, d)
@@ -245,6 +246,9 @@ def testimage_main(d):
     testslist = get_tests_list(d)
     testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
 
+    # we need the host dumper in test context
+    host_dumper = get_host_dumper(d)
+
     # the robot dance
     target = get_target_controller(d)
 
@@ -255,6 +259,7 @@ def testimage_main(d):
             self.testsrequired = testsrequired
             self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
             self.target = target
+            self.host_dumper = host_dumper
             self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
             self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
             manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index e765c96..b33ca0a 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -11,8 +11,6 @@ import os, re, mmap
 import unittest
 import inspect
 import subprocess
-import datetime
-import commands
 import bb
 from oeqa.utils.decorators import LogResults
 from sys import exc_info, exc_clear
@@ -124,51 +122,13 @@ class oeRuntimeTest(oeTest):
         # If a test fails or there is an exception
         if not exc_info() == (None, None, None):
             exc_clear()
-            dump_dir = self.create_dump_dir()
+            self.tc.host_dumper.create_dir(self._testMethodName)
+            self.target.target_dumper.dump_target(
+                    self.tc.host_dumper.dump_dir)
+            self.tc.host_dumper.dump_host()
             print ("%s dump data from host and target "
-                "stored in %s" % (self._testMethodName, dump_dir))
-            self.dump_host_logs(dump_dir)
-            self.dump_target_logs(dump_dir)
-
-    def create_dump_dir(self):
-        dump_sub_dir = ("%s_%s" % (
-                datetime.datetime.now().strftime('%Y%m%d%H%M'),
-                self._testMethodName))
-        dump_dir = os.path.join(self.target.dump_dir, dump_sub_dir)
-        os.makedirs(dump_dir)
-        return dump_dir
-
-    def dump_host_logs(self, dump_dir):
-        for cmd in self.target.dump_host.split('\n'):
-            cmd = cmd.lstrip()
-            if not cmd:
-                continue
-            output = commands.getoutput(cmd)
-            filename = "host_%s" % cmd.split()[0]
-            with open(os.path.join(dump_dir, filename), 'w') as f:
-                f.write(output)
-
-    def dump_target_logs(self, dump_dir):
-        for cmd in self.target.dump_target.split('\n'):
-            cmd = cmd.lstrip()
-            if not cmd:
-                continue
-            # This will ping the host from target
-            if cmd == "_ping":
-                 comm = "ping -c3 %s" % self.target.server_ip
-            # This will get all the logs from /var/log/
-            elif cmd == "_logs":
-                comm = 'find /var/log/ -type f 2>/dev/null '
-                comm = '%s-exec echo "%s" \\; ' % (comm, '='*20)
-                comm = '%s-exec echo {} \\; ' % comm
-                comm = '%s-exec echo "%s" \\; ' % (comm, '='*20)
-                comm = '%s-exec cat {} \\; -exec echo "" \\;' % comm
-            else:
-                comm = cmd
-            (status, output) = self.target.run_serial(comm)
-            filename = "target_%s" % cmd.split()[0]
-            with open(os.path.join(dump_dir, filename), 'w') as f:
-                f.write(output)
+                    "stored in %s" % (self._testMethodName,
+                     self.target.target_dumper.dump_dir))
 
     #TODO: use package_manager.py to install packages on any type of image
     def install_packages(self, packagelist):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 59cae2e..2d58f17 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -14,6 +14,7 @@ import logging
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 from oeqa.utils.qemutinyrunner import QemuTinyRunner
+from oeqa.utils.dump import TargetDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
@@ -123,9 +124,6 @@ class QemuTarget(BaseTarget):
         self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.' + self.image_fstype)
         self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.' + self.image_fstype)
         self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
-        self.dump_target = d.getVar("testimage_dump_target", True)
-        self.dump_host = d.getVar("testimage_dump_host", True)
-        self.dump_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
 
         # Log QemuRunner log output to a file
         import oe.path
@@ -155,6 +153,8 @@ class QemuTarget(BaseTarget):
                             logfile = self.qemulog,
                             boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)))
 
+        self.target_dumper = TargetDumper(d, self.runner)
+
     def deploy(self):
         try:
             bb.utils.mkdirhier(self.testdir)
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
new file mode 100644
index 0000000..1475b27
--- /dev/null
+++ b/meta/lib/oeqa/utils/dump.py
@@ -0,0 +1,77 @@
+import os
+import sys
+import errno
+import datetime
+import itertools
+from commands import runCmd 
+
+def get_host_dumper(d):
+    return HostDumper(d)
+
+
+class BaseDumper(object):
+
+    def __init__(self, d):
+        self.parent_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
+
+    def create_dir(self, dir_suffix):
+        dump_subdir = ("%s_%s" % (
+                datetime.datetime.now().strftime('%Y%m%d%H%M'),
+                dir_suffix))
+        dump_dir = os.path.join(self.parent_dir, dump_subdir)
+        try:
+            os.makedirs(dump_dir)
+        except OSError as err:
+            if err.errno != errno.EEXIST:
+                raise err
+        self.dump_dir = dump_dir
+
+    def write_dump(self, command, output):
+        if isinstance(self, HostDumper):
+            prefix = "host"
+        elif isinstance(self, TargetDumper):
+            prefix = "target"
+        else:
+            prefix = "unknown"
+        for i in itertools.count():
+            filename = "%s_%02d_%s" % (prefix, i, command)
+            fullname = os.path.join(self.dump_dir, filename)
+            if not os.path.exists(fullname):
+                break
+        with open(fullname, 'w') as dump_file:
+            dump_file.write(output)
+
+
+class HostDumper(BaseDumper):
+
+    def __init__(self, d):
+        super(HostDumper, self).__init__(d)
+        self.host_cmds = d.getVar("testimage_dump_host", True)
+
+    def dump_host(self, dump_dir=""):
+        if dump_dir:
+            self.dump_dir = dump_dir
+        for cmd in self.host_cmds.split('\n'):
+            cmd = cmd.lstrip()
+            if not cmd or cmd[0] == '#':
+                continue
+            result = runCmd(cmd, ignore_status=True)
+            self.write_dump(cmd.split()[0], result.output)
+
+
+class TargetDumper(BaseDumper):
+
+    def __init__(self, d, qemurunner):
+        super(TargetDumper, self).__init__(d)
+        self.target_cmds = d.getVar("testimage_dump_target", True)
+        self.runner = qemurunner
+
+    def dump_target(self, dump_dir=""):
+        if dump_dir:
+            self.dump_dir = dump_dir
+        for cmd in self.target_cmds.split('\n'):
+            cmd = cmd.lstrip()
+            if not cmd or cmd[0] == '#':
+                continue
+            (status, output) = self.runner.run_serial(cmd)
+            self.write_dump(cmd.split()[0], output)
-- 
1.8.4.5


