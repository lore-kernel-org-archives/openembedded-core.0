Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C7F10781F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:19 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133875"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:20 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:37:10 -0500
Message-Id: <d33940eedfcc126d0a5ac058ac09728209e4bca4.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 24/29] oeqa/selftest/cases: Move devtool deploy test case to own module
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The devtool deploy test case uses runqemu that uses tinfoil so
tinfoil requires to run on the main thread.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py        | 91 ++-----------------------
 meta/lib/oeqa/selftest/cases/devtool_deploy.py | 93 ++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 87 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/devtool_deploy.py

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c66e77a9ace..3d8d246bb7c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -6,7 +6,7 @@ import glob
 import fnmatch
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import create_temp_layer, runqemu
+from oeqa.utils.commands import create_temp_layer
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
@@ -114,6 +114,9 @@ class DevtoolBase(OESelftestTestCase):
 
 
 class DevtoolCommon(DevtoolBase):
+    _use_own_builddir = True
+    _main_thread = False
+
     @classmethod
     def setUpClass(cls):
         super(DevtoolCommon, cls).setUpClass()
@@ -1144,92 +1147,6 @@ class DevtoolTests(DevtoolCommon):
         matches2 = glob.glob(stampprefix2 + '*')
         self.assertFalse(matches2, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe2)
 
-    @OETestID(1272)
-    def test_devtool_deploy_target(self):
-        # NOTE: Whilst this test would seemingly be better placed as a runtime test,
-        # unfortunately the runtime tests run under bitbake and you can't run
-        # devtool within bitbake (since devtool needs to run bitbake itself).
-        # Additionally we are testing build-time functionality as well, so
-        # really this has to be done as an oe-selftest test.
-        #
-        # Check preconditions
-        machine = self.get_bb_var('MACHINE')
-        if not machine.startswith('qemu'):
-            self.skipTest('This test only works with qemu machines')
-        if not os.path.exists('/etc/runqemu-nosudo'):
-            self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
-        result = self.runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
-        if result.status != 0:
-            result = self.runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
-            if result.status != 0:
-                self.skipTest('Failed to determine if tap devices exist with ifconfig or ip: %s' % result.output)
-        for line in result.output.splitlines():
-            if line.startswith('tap'):
-                break
-        else:
-            self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
-        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
-        # Definitions
-        testrecipe = 'mdadm'
-        testfile = '/sbin/mdadm'
-        testimage = 'oe-selftest-image'
-        testcommand = '/sbin/mdadm --help'
-        # Build an image to run
-        self.bitbake("%s qemu-native qemu-helper-native" % testimage)
-        deploy_dir_image = self.get_bb_var('DEPLOY_DIR_IMAGE')
-        self.add_command_to_tearDown('bitbake -c clean %s' % testimage)
-        self.add_command_to_tearDown('rm -f %s/%s*' % (deploy_dir_image, testimage))
-        # Clean recipe so the first deploy will fail
-        self.bitbake("%s -c clean" % testrecipe)
-        # Try devtool modify
-        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
-        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
-        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        # Test that deploy-target at this point fails (properly)
-        result = self.runCmd('devtool deploy-target -n %s root@localhost' % testrecipe, ignore_status=True)
-        self.assertNotEqual(result.output, 0, 'devtool deploy-target should have failed, output: %s' % result.output)
-        self.assertNotIn(result.output, 'Traceback', 'devtool deploy-target should have failed with a proper error not a traceback, output: %s' % result.output)
-        result = self.runCmd('devtool build %s' % testrecipe)
-        # First try a dry-run of deploy-target
-        result = self.runCmd('devtool deploy-target -n %s root@localhost' % testrecipe)
-        self.assertIn('  %s' % testfile, result.output)
-        # Boot the image
-        with runqemu(testimage) as qemu:
-            # Now really test deploy-target
-            result = self.runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
-            # Run a test command to see if it was installed properly
-            sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-            result = self.runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
-            # Check if it deployed all of the files with the right ownership/perms
-            # First look on the host - need to do this under pseudo to get the correct ownership/perms
-            bb_vars = self.get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
-            installdir = bb_vars['D']
-            fakerootenv = bb_vars['FAKEROOTENV']
-            fakerootcmd = bb_vars['FAKEROOTCMD']
-            result = self.runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
-            filelist1 = self._process_ls_output(result.output)
-
-            # Now look on the target
-            tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
-            self.track_for_cleanup(tempdir2)
-            tmpfilelist = os.path.join(tempdir2, 'files.txt')
-            with open(tmpfilelist, 'w') as f:
-                for line in filelist1:
-                    splitline = line.split()
-                    f.write(splitline[-1] + '\n')
-            result = self.runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, qemu.ip))
-            filelist2 = self._process_ls_output(result.output)
-            filelist1.sort(key=lambda item: item.split()[-1])
-            filelist2.sort(key=lambda item: item.split()[-1])
-            self.assertEqual(filelist1, filelist2)
-            # Test undeploy-target
-            result = self.runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
-            result = self.runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
-            self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
-
     @OETestID(1366)
     def test_devtool_build_image(self):
         """Test devtool build-image plugin"""
diff --git a/meta/lib/oeqa/selftest/cases/devtool_deploy.py b/meta/lib/oeqa/selftest/cases/devtool_deploy.py
new file mode 100644
index 00000000000..3ad9f8ba565
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/devtool_deploy.py
@@ -0,0 +1,93 @@
+import os
+import tempfile
+
+from oeqa.selftest.cases import devtool
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.utils.commands import runqemu
+
+class DevtoolDeployTests(devtool.DevtoolCommon):
+    @OETestID(1272)
+    def test_devtool_deploy_target(self):
+        # NOTE: Whilst this test would seemingly be better placed as a runtime test,
+        # unfortunately the runtime tests run under bitbake and you can't run
+        # devtool within bitbake (since devtool needs to run bitbake itself).
+        # Additionally we are testing build-time functionality as well, so
+        # really this has to be done as an oe-selftest test.
+        #
+        # Check preconditions
+        machine = self.get_bb_var('MACHINE')
+        if not machine.startswith('qemu'):
+            self.skipTest('This test only works with qemu machines')
+        if not os.path.exists('/etc/runqemu-nosudo'):
+            self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
+        result = self.runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
+        if result.status != 0:
+            result = self.runCmd('PATH="$PATH:/sbin:/usr/sbin" ifconfig -a', ignore_status=True)
+            if result.status != 0:
+                self.skipTest('Failed to determine if tap devices exist with ifconfig or ip: %s' % result.output)
+        for line in result.output.splitlines():
+            if line.startswith('tap'):
+                break
+        else:
+            self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Definitions
+        testrecipe = 'mdadm'
+        testfile = '/sbin/mdadm'
+        testimage = 'oe-selftest-image'
+        testcommand = '/sbin/mdadm --help'
+        # Build an image to run
+        self.bitbake("%s qemu-native qemu-helper-native" % testimage)
+        deploy_dir_image = self.get_bb_var('DEPLOY_DIR_IMAGE')
+        self.add_command_to_tearDown('bitbake -c clean %s' % testimage)
+        self.add_command_to_tearDown('rm -f %s/%s*' % (deploy_dir_image, testimage))
+        # Clean recipe so the first deploy will fail
+        self.bitbake("%s -c clean" % testrecipe)
+        # Try devtool modify
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        result = self.runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Test that deploy-target at this point fails (properly)
+        result = self.runCmd('devtool deploy-target -n %s root@localhost' % testrecipe, ignore_status=True)
+        self.assertNotEqual(result.output, 0, 'devtool deploy-target should have failed, output: %s' % result.output)
+        self.assertNotIn(result.output, 'Traceback', 'devtool deploy-target should have failed with a proper error not a traceback, output: %s' % result.output)
+        result = self.runCmd('devtool build %s' % testrecipe)
+        # First try a dry-run of deploy-target
+        result = self.runCmd('devtool deploy-target -n %s root@localhost' % testrecipe)
+        self.assertIn('  %s' % testfile, result.output)
+        # Boot the image
+        with runqemu(testimage) as qemu:
+            # Now really test deploy-target
+            result = self.runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+            # Run a test command to see if it was installed properly
+            sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+            result = self.runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
+            # Check if it deployed all of the files with the right ownership/perms
+            # First look on the host - need to do this under pseudo to get the correct ownership/perms
+            bb_vars = self.get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD'], testrecipe)
+            installdir = bb_vars['D']
+            fakerootenv = bb_vars['FAKEROOTENV']
+            fakerootcmd = bb_vars['FAKEROOTCMD']
+            result = self.runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
+            filelist1 = self._process_ls_output(result.output)
+
+            # Now look on the target
+            tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
+            self.track_for_cleanup(tempdir2)
+            tmpfilelist = os.path.join(tempdir2, 'files.txt')
+            with open(tmpfilelist, 'w') as f:
+                for line in filelist1:
+                    splitline = line.split()
+                    f.write(splitline[-1] + '\n')
+            result = self.runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, qemu.ip))
+            filelist2 = self._process_ls_output(result.output)
+            filelist1.sort(key=lambda item: item.split()[-1])
+            filelist2.sort(key=lambda item: item.split()[-1])
+            self.assertEqual(filelist1, filelist2)
+            # Test undeploy-target
+            result = self.runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+            result = self.runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
+            self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
-- 
2.11.0


