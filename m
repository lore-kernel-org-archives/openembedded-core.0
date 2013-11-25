Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D13066DCF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 17:59:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Nov 2013 09:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,769,1378882800"; d="scan'208";a="441504911"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Nov 2013 09:59:07 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 6DD736A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 09:59:05 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 19:59:38 +0200
Message-Id: <fa6ca260b0bd959e53e976a863c14f5e9647eec6.1385402073.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1385402073.git.stefanx.stanacar@intel.com>
References: <cover.1385402073.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1385402073.git.stefanx.stanacar@intel.com>
References: <cover.1385402073.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/2] testimage: use the new targetcontrol.py module for running tests
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
X-List-Received-Date: Mon, 25 Nov 2013 17:59:08 -0000

This patch makes the necessary changes for using the targetcontrol.py module
so that one can run the same tests on a qemu instance or a remote machine
based on the value of TEST_TARGET variable: "qemu" or "simpleremote".

When using "qemu" nothing really changes (does what it does currently).
With "simpleremote", the remote machine must be up with network and ssh
and you need to set TEST_TARGET_IP with the IP address of the remote machine
(it can still be a qemu instance that was manually started).

Basically testimage.bbclass now does something along the lines of:
 - load tests -> deploy (prepare) / start target -> run tests.
There were a couple of changes necessary for tests to adjust this change and
also some cleanups/renames that were needed to fit in the picture. (use
ip everywhere when refering to target and server_ip when refering to host/build machine)
Also two unnecessary and unsed methods were dropped from sshcontrol.

[ YOCTO #5554 ]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage-auto.bbclass |   3 +-
 meta/classes/testimage.bbclass      | 104 +++++++++++++-----------------------
 meta/lib/oeqa/oetest.py             |  20 +++----
 meta/lib/oeqa/runtime/ping.py       |   2 +-
 meta/lib/oeqa/runtime/smart.py      |   4 +-
 meta/lib/oeqa/utils/qemurunner.py   |  50 ++++++++++-------
 meta/lib/oeqa/utils/sshcontrol.py   |  20 +++----
 7 files changed, 87 insertions(+), 116 deletions(-)

diff --git a/meta/classes/testimage-auto.bbclass b/meta/classes/testimage-auto.bbclass
index 3d0e289..a5b8f7f 100644
--- a/meta/classes/testimage-auto.bbclass
+++ b/meta/classes/testimage-auto.bbclass
@@ -19,5 +19,4 @@ python do_testimage_auto() {
     testimage_main(d)
 }
 addtask testimage_auto before do_build after do_rootfs
-do_testimage_auto[depends] += "qemu-native:do_populate_sysroot"
-do_testimage_auto[depends] += "qemu-helper-native:do_populate_sysroot"
+do_testimage_auto[depends] += "${TESTIMAGEDEPENDS}"
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 5d61c2b..add8009 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -34,13 +34,19 @@ TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
 
+TEST_TARGET ?= "qemu"
+TEST_TARGET_IP ?= ""
+TEST_SERVER_IP ?= ""
+
+TESTIMAGEDEPENDS = ""
+TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
+
 python do_testimage() {
     testimage_main(d)
 }
 addtask testimage
 do_testimage[nostamp] = "1"
-do_testimage[depends] += "qemu-native:do_populate_sysroot"
-do_testimage[depends] += "qemu-helper-native:do_populate_sysroot"
+do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 
 
 def get_tests_list(d):
@@ -83,15 +89,12 @@ def testimage_main(d):
     import unittest
     import os
     import oeqa.runtime
-    import re
-    import shutil
     import time
-    from oeqa.oetest import runTests
-    from oeqa.utils.sshcontrol import SSHControl
-    from oeqa.utils.qemurunner import QemuRunner
+    from oeqa.oetest import loadTests, runTests
+    from oeqa.targetcontrol import get_target_controller
 
-    testdir = d.getVar("TEST_LOG_DIR", True)
-    bb.utils.mkdirhier(testdir)
+    pn = d.getVar("PN", True)
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
 
     # tests in TEST_SUITES become required tests
     # they won't be skipped even if they aren't suitable for a image (like xorg for minimal)
@@ -99,81 +102,46 @@ def testimage_main(d):
     testslist = get_tests_list(d)
     testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
 
+    # the robot dance
+    target = get_target_controller(d)
+
     class TestContext:
         def __init__(self):
             self.d = d
             self.testslist = testslist
             self.testsrequired = testsrequired
             self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
+            self.target = target
 
     # test context
     tc = TestContext()
 
-    # prepare qemu instance
-    # and boot each supported fs type
-    machine=d.getVar("MACHINE", True)
-    #will handle fs type eventually, stick with ext3 for now
-    #make a copy of the original rootfs and use that for tests
-    origrootfs=os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME",True) + '.ext3')
-    testrootfs=os.path.join(testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.ext3')
+    # this is a dummy load of tests
+    # we are doing that to find compile errors in the tests themselves
+    # before booting the image
     try:
-        shutil.copyfile(origrootfs, testrootfs)
+        loadTests(tc)
     except Exception as e:
-        bb.fatal("Error copying rootfs: %s" % e)
+        bb.fatal("Loading tests failed:\n %s" % e)
 
-    try:
-        boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True))
-    except ValueError:
-        boottime = 1000
-
-    qemu = QemuRunner(machine=machine, rootfs=testrootfs,
-                        tmpdir = d.getVar("TMPDIR", True),
-                        deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
-                        display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
-                        logfile = os.path.join(testdir, "qemu_boot_log.%s" % d.getVar('DATETIME', True)),
-                        boottime = boottime)
-
-    qemuloglink = os.path.join(testdir, "qemu_boot_log")
-    if os.path.islink(qemuloglink):
-        os.unlink(qemuloglink)
-    os.symlink(qemu.logfile, qemuloglink)
-
-    sshlog = os.path.join(testdir, "ssh_target_log.%s" % d.getVar('DATETIME', True))
-    sshloglink = os.path.join(testdir, "ssh_target_log")
-    if os.path.islink(sshloglink):
-        os.unlink(sshloglink)
-    os.symlink(sshlog, sshloglink)
-
-    bb.note("DISPLAY value: %s" % qemu.display)
-    bb.note("rootfs file: %s" %  qemu.rootfs)
-    bb.note("Qemu log file: %s" % qemu.logfile)
-    bb.note("SSH log file: %s" %  sshlog)
+    target.deploy()
 
-    pn = d.getVar("PN", True)
-    #catch exceptions when loading or running tests (mostly our own errors)
     try:
-        if qemu.launch():
-
-            # set more context - ssh instance and qemu
-            # we do these here because we needed qemu to boot and get the ip
-            tc.qemu = qemu
-            tc.target = SSHControl(host=qemu.ip,logfile=sshlog)
-            # run tests and get the results
-            starttime = time.time()
-            result = runTests(tc)
-            stoptime = time.time()
-            if result.wasSuccessful():
-                bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
-                msg = "%s - OK - All required tests passed" % pn
-                skipped = len(result.skipped)
-                if skipped:
-                    msg += " (skipped=%d)" % skipped
-                bb.plain(msg)
-            else:
-                raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
+        target.start()
+        # run tests and get the results
+        starttime = time.time()
+        result = runTests(tc)
+        stoptime = time.time()
+        if result.wasSuccessful():
+            bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
+            msg = "%s - OK - All required tests passed" % pn
+            skipped = len(result.skipped)
+            if skipped:
+                msg += " (skipped=%d)" % skipped
+            bb.plain(msg)
         else:
-            raise bb.build.FuncFailed("%s - FAILED to start qemu - check the task log and the boot log" % pn)
+            raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
     finally:
-        qemu.kill()
+        target.stop()
 
 testimage_main[vardepsexclude] =+ "BB_ORIGENV"
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 3bb3589..38f9aef 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -14,7 +14,7 @@ import bb
 from oeqa.utils.sshcontrol import SSHControl
 
 
-def runTests(tc):
+def loadTests(tc):
 
     # set the context object passed from the test class
     setattr(oeTest, "tc", tc)
@@ -24,12 +24,16 @@ def runTests(tc):
     suite = unittest.TestSuite()
     testloader = unittest.TestLoader()
     testloader.sortTestMethodsUsing = None
-    runner = unittest.TextTestRunner(verbosity=2)
+    suite = testloader.loadTestsFromNames(tc.testslist)
+
+    return suite
+
+def runTests(tc):
 
+    suite = loadTests(tc)
     bb.note("Test modules  %s" % tc.testslist)
-    suite = testloader.loadTestsFromNames(tc.testslist)
     bb.note("Found %s tests" % suite.countTestCases())
-
+    runner = unittest.TextTestRunner(verbosity=2)
     result = runner.run(suite)
 
     return result
@@ -87,11 +91,7 @@ class oeRuntimeTest(oeTest):
 
     @classmethod
     def restartTarget(self,params=None):
-
-        if oeRuntimeTest.tc.qemu.restart(params):
-            oeRuntimeTest.tc.target.host = oeRuntimeTest.tc.qemu.ip
-        else:
-            raise Exception("Restarting target failed")
+        oeRuntimeTest.tc.target.restart(params)
 
 
 def getmodule(pos=2):
@@ -109,7 +109,7 @@ def skipModule(reason, pos=2):
     else:
         raise Exception("\nTest %s wants to be skipped.\nReason is: %s" \
                 "\nTest was required in TEST_SUITES, so either the condition for skipping is wrong" \
-                "\nor the image really doesn't have the requred feature/package when it should." % (modname, reason))
+                "\nor the image really doesn't have the required feature/package when it should." % (modname, reason))
 
 def skipModuleIf(cond, reason):
 
diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime/ping.py
index 0d028f9..a73c724 100644
--- a/meta/lib/oeqa/runtime/ping.py
+++ b/meta/lib/oeqa/runtime/ping.py
@@ -11,7 +11,7 @@ class PingTest(oeRuntimeTest):
         count = 0
         endtime = time.time() + 60
         while count < 5 and time.time() < endtime:
-            proc = subprocess.Popen("ping -c 1 %s" % oeRuntimeTest.tc.qemu.ip, shell=True, stdout=subprocess.PIPE)
+            proc = subprocess.Popen("ping -c 1 %s" % self.target.ip, shell=True, stdout=subprocess.PIPE)
             output += proc.communicate()[0]
             if proc.poll() == 0:
                 count += 1
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index c3fdf7d..7ef4b0e 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -46,7 +46,7 @@ class SmartRepoTest(SmartTest):
 
     @classmethod
     def setUpClass(self):
-        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), oeRuntimeTest.tc.qemu.host_ip)
+        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), oeRuntimeTest.tc.target.server_ip)
         self.repo_server.start()
 
     @classmethod
@@ -58,7 +58,7 @@ class SmartRepoTest(SmartTest):
 
     def test_smart_channel_add(self):
         image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
-        deploy_url = 'http://%s:%s/%s' %(self.tc.qemu.host_ip, self.repo_server.port, image_pkgtype)
+        deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
         pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True)
         for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
             if arch in pkgarchs:
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 256cf3c..5366a63 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -16,25 +16,30 @@ import bb
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display = None, tmpdir = None, deploy_dir_image = None, logfile = None, boottime = 400, runqemutime = 60):
-        # Popen object
-        self.runqemu = None
-
-        self.machine = machine
-        self.rootfs = rootfs
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime):
 
+        # Popen object for runqemu
+        self.runqemu = None
+        # pid of the qemu process that runqemu will start
         self.qemupid = None
+        # target ip - from the command line
         self.ip = None
+        # host ip - where qemu is running
+        self.server_ip = None
 
+        self.machine = machine
+        self.rootfs = rootfs
         self.display = display
         self.tmpdir = tmpdir
         self.deploy_dir_image = deploy_dir_image
         self.logfile = logfile
         self.boottime = boottime
-        self.runqemutime = runqemutime
+
+        self.runqemutime = 60
 
         self.create_socket()
 
+
     def create_socket(self):
 
         self.bootlog = ''
@@ -57,7 +62,7 @@ class QemuRunner:
             with open(self.logfile, "a") as f:
                 f.write("%s" % msg)
 
-    def launch(self, qemuparams = None):
+    def start(self, qemuparams = None):
 
         if self.display:
             os.environ["DISPLAY"] = self.display
@@ -96,14 +101,19 @@ class QemuRunner:
 
         if self.is_alive():
             bb.note("qemu started - qemu procces pid is %s" % self.qemupid)
-            cmdline = open('/proc/%s/cmdline' % self.qemupid).read()
-            self.ip, _, self.host_ip = cmdline.split('ip=')[1].split(' ')[0].split(':')[0:3]
-            if not re.search("^((?:[0-9]{1,3}\.){3}[0-9]{1,3})$", self.ip):
-                bb.note("Couldn't get ip from qemu process arguments, I got '%s'" % self.ip)
-                bb.note("Here is the ps output:\n%s" % cmdline)
-                self.kill()
+            cmdline = ''
+            with open('/proc/%s/cmdline' % self.qemupid) as p:
+                cmdline = p.read()
+            ips = re.findall("((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
+            if not ips or len(ips) != 3:
+                bb.note("Couldn't get ip from qemu process arguments! Here is the qemu command line used: %s" % cmdline)
+                self.stop()
                 return False
-            bb.note("IP found: %s" % self.ip)
+            else:
+                self.ip = ips[0]
+                self.server_ip = ips[1]
+            bb.note("Target IP: %s" % self.ip)
+            bb.note("Server IP: %s" % self.server_ip)
             bb.note("Waiting at most %d seconds for login banner" % self.boottime )
             endtime = time.time() + self.boottime
             socklist = [self.server_socket]
@@ -138,18 +148,18 @@ class QemuRunner:
                 lines = "\n".join(self.bootlog.splitlines()[-5:])
                 bb.note("Last 5 lines of text:\n%s" % lines)
                 bb.note("Check full boot log: %s" % self.logfile)
-                self.kill()
+                self.stop()
                 return False
         else:
             bb.note("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
             output = self.runqemu.stdout
-            self.kill()
+            self.stop()
             bb.note("Output from runqemu:\n%s" % output.read())
             return False
 
         return self.is_alive()
 
-    def kill(self):
+    def stop(self):
 
         if self.runqemu:
             bb.note("Sending SIGTERM to runqemu")
@@ -170,9 +180,9 @@ class QemuRunner:
     def restart(self, qemuparams = None):
         bb.note("Restarting qemu process")
         if self.runqemu.poll() is None:
-            self.kill()
+            self.stop()
         self.create_socket()
-        if self.launch(qemuparams):
+        if self.start(qemuparams):
             return True
         return False
 
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 07257b8..a0dcf02 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -13,8 +13,8 @@ import select
 
 class SSHControl(object):
 
-    def __init__(self, host=None, timeout=300, logfile=None):
-        self.host = host
+    def __init__(self, ip=None, timeout=300, logfile=None):
+        self.ip = ip
         self.timeout = timeout
         self._starttime = None
         self._out = ''
@@ -35,7 +35,7 @@ class SSHControl(object):
     def _internal_run(self, cmd):
         # We need this for a proper PATH
         cmd = ". /etc/profile; " + cmd
-        command = self.ssh + [self.host, cmd]
+        command = self.ssh + [self.ip, cmd]
         self.log("[Running]$ %s" % " ".join(command))
         self._starttime = time.time()
         # ssh hangs without os.setsid
@@ -48,10 +48,10 @@ class SSHControl(object):
         if time is 0 will let cmd run until it finishes.
         Time can be passed to here or can be set per class instance."""
 
-        if self.host:
+        if self.ip:
             sshconn = self._internal_run(cmd)
         else:
-            raise Exception("Remote IP/host hasn't been set, I can't run ssh without one.")
+            raise Exception("Remote IP hasn't been set, I can't run ssh without one.")
 
         # run the command forever
         if timeout == 0:
@@ -108,15 +108,9 @@ class SSHControl(object):
         return (ret, out)
 
     def copy_to(self, localpath, remotepath):
-        actualcmd = [localpath, 'root@%s:%s' % (self.host, remotepath)]
+        actualcmd = [localpath, 'root@%s:%s' % (self.ip, remotepath)]
         return self._internal_scp(actualcmd)
 
     def copy_from(self, remotepath, localpath):
-        actualcmd = ['root@%s:%s' % (self.host, remotepath), localpath]
+        actualcmd = ['root@%s:%s' % (self.ip, remotepath), localpath]
         return self._internal_scp(actualcmd)
-
-    def get_status(self):
-        return self._ret
-
-    def get_output(self):
-        return self._out
-- 
1.8.3.1


