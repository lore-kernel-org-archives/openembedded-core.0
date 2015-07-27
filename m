Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4D9A7632E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926484"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:04:06 +0100
Message-Id: <63ceadc345253630e38b33ecb72675497c9b5e79.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/11] oeqa/selftest/devtool: use new runqemu function
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:17 -0000

Use the common code we now have to run QEMU instead of running it
ourselves, avoiding reliance on the machine showing up at 192.168.7.2.
This also makes a copy of the image rather than using -snapshot so if we
need to inspect the image after a failure, we can.

Fixes [YOCTO #7928].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 72 ++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 21cd7f5..c833e54 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -8,7 +8,7 @@ import glob
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, runqemu
 from oeqa.utils.decorators import testcase
 
 class DevtoolBase(oeSelfTest):
@@ -799,12 +799,10 @@ class DevtoolTests(DevtoolBase):
             self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
         workspacedir = os.path.join(self.builddir, 'workspace')
         self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
-        import pexpect
         # Definitions
         testrecipe = 'mdadm'
         testfile = '/sbin/mdadm'
         testimage = 'oe-selftest-image'
-        testhost = '192.168.7.2'
         testcommand = '/sbin/mdadm --help'
         # Build an image to run
         bitbake("%s qemu-native qemu-helper-native" % testimage)
@@ -821,44 +819,42 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
         # Test that deploy-target at this point fails (properly)
-        result = runCmd('devtool deploy-target -n %s root@%s' % (testrecipe, testhost), ignore_status=True)
+        result = runCmd('devtool deploy-target -n %s root@localhost' % testrecipe, ignore_status=True)
         self.assertNotEqual(result.output, 0, 'devtool deploy-target should have failed, output: %s' % result.output)
         self.assertNotIn(result.output, 'Traceback', 'devtool deploy-target should have failed with a proper error not a traceback, output: %s' % result.output)
         result = runCmd('devtool build %s' % testrecipe)
         # First try a dry-run of deploy-target
-        result = runCmd('devtool deploy-target -n %s root@%s' % (testrecipe, testhost))
+        result = runCmd('devtool deploy-target -n %s root@localhost' % testrecipe)
         self.assertIn('  %s' % testfile, result.output)
         # Boot the image
-        console = pexpect.spawn('runqemu %s %s qemuparams="-snapshot" nographic' % (machine, testimage))
-        console.expect("login:", timeout=120)
-        # Now really test deploy-target
-        result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, testhost))
-        # Run a test command to see if it was installed properly
-        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-        result = runCmd('ssh %s root@%s %s' % (sshargs, testhost, testcommand))
-        # Check if it deployed all of the files with the right ownership/perms
-        # First look on the host - need to do this under pseudo to get the correct ownership/perms
-        installdir = get_bb_var('D', testrecipe)
-        fakerootenv = get_bb_var('FAKEROOTENV', testrecipe)
-        fakerootcmd = get_bb_var('FAKEROOTCMD', testrecipe)
-        result = runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
-        filelist1 = self._process_ls_output(result.output)
-
-        # Now look on the target
-        tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
-        self.track_for_cleanup(tempdir2)
-        tmpfilelist = os.path.join(tempdir2, 'files.txt')
-        with open(tmpfilelist, 'w') as f:
-            for line in filelist1:
-                splitline = line.split()
-                f.write(splitline[-1] + '\n')
-        result = runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, testhost))
-        filelist2 = self._process_ls_output(result.output)
-        filelist1.sort(key=lambda item: item.split()[-1])
-        filelist2.sort(key=lambda item: item.split()[-1])
-        self.assertEqual(filelist1, filelist2)
-        # Test undeploy-target
-        result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, testhost))
-        result = runCmd('ssh %s root@%s %s' % (sshargs, testhost, testcommand), ignore_status=True)
-        self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
-        console.close()
+        with runqemu(testimage, self) as qemu:
+            # Now really test deploy-target
+            result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+            # Run a test command to see if it was installed properly
+            sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand))
+            # Check if it deployed all of the files with the right ownership/perms
+            # First look on the host - need to do this under pseudo to get the correct ownership/perms
+            installdir = get_bb_var('D', testrecipe)
+            fakerootenv = get_bb_var('FAKEROOTENV', testrecipe)
+            fakerootcmd = get_bb_var('FAKEROOTCMD', testrecipe)
+            result = runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
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
+            result = runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, qemu.ip))
+            filelist2 = self._process_ls_output(result.output)
+            filelist1.sort(key=lambda item: item.split()[-1])
+            filelist2.sort(key=lambda item: item.split()[-1])
+            self.assertEqual(filelist1, filelist2)
+            # Test undeploy-target
+            result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+            result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
+            self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
-- 
2.1.0


