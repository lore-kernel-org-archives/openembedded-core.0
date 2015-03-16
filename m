Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ACDEA723BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778275"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:59 +0000
Message-Id: <76ba56471e4537d7b2443445ecb5381803730e7a.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/16] oe-selftest: add a test for devtool deploy-target
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:17 -0000

Whilst this test would seemingly be better placed as a runtime test,
unfortunately the runtime tests run under bitbake and you can't run
devtool within bitbake (since devtool needs to run bitbake itself).
Additionally we are testing build-time functionality as well, so
really this has to be done as an oe-selftest test.

This test does have a few perhaps unusual requirements in order to run:
 * pexpect is installed
 * MACHINE is set to one of the qemu machines
 * runqemu tap devices have been set up

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-test/images/oe-selftest-image.bb       |  9 ++++
 meta/lib/oeqa/selftest/devtool.py                  | 56 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-selftest/recipes-test/images/oe-selftest-image.bb

diff --git a/meta-selftest/recipes-test/images/oe-selftest-image.bb b/meta-selftest/recipes-test/images/oe-selftest-image.bb
new file mode 100644
index 0000000..f17094c
--- /dev/null
+++ b/meta-selftest/recipes-test/images/oe-selftest-image.bb
@@ -0,0 +1,9 @@
+SUMMARY = "An image used during oe-selftest tests"
+
+IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} dropbear"
+IMAGE_FEATURES = "debug-tweaks"
+
+IMAGE_LINGUAS = " "
+
+inherit core-image
+
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 2574e4b..1caf0f0 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -437,3 +437,59 @@ class DevtoolTests(oeSelfTest):
         self.assertFalse(matches1, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe1)
         matches2 = glob.glob(stampprefix2 + '*')
         self.assertFalse(matches2, 'Stamp files exist for recipe %s that should have been cleaned' % testrecipe2)
+
+    def test_devtool_deploy_target(self):
+        # NOTE: Whilst this test would seemingly be better placed as a runtime test,
+        # unfortunately the runtime tests run under bitbake and you can't run
+        # devtool within bitbake (since devtool needs to run bitbake itself).
+        # Additionally we are testing build-time functionality as well, so
+        # really this has to be done as an oe-selftest test.
+        #
+        # Check preconditions
+        machine = get_bb_var('MACHINE')
+        if not machine.startswith('qemu'):
+            self.skipTest('This test only works with qemu machines')
+        if not os.path.exists('/etc/runqemu-nosudo'):
+            self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        import pexpect
+        # Definitions
+        testrecipe = 'mdadm'
+        testfile = '/sbin/mdadm'
+        testimage = 'oe-selftest-image'
+        testhost = '192.168.7.2'
+        testcommand = '/sbin/mdadm --help'
+        # Build an image to run
+        bitbake("%s qemu-native qemu-helper-native" % testimage)
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        self.add_command_to_tearDown('bitbake -c clean %s' % testimage)
+        self.add_command_to_tearDown('rm -f %s/%s*' % (deploy_dir_image, testimage))
+        # Clean recipe so the first deploy will fail
+        bitbake("%s -c clean" % testrecipe)
+        # Try devtool modify
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Test that deploy-target at this point fails (properly)
+        result = runCmd('devtool deploy-target -n %s root@%s' % (testrecipe, testhost), ignore_status=True)
+        self.assertNotEqual(result.output, 0, 'devtool deploy-target should have failed, output: %s' % result.output)
+        self.assertNotIn(result.output, 'Traceback', 'devtool deploy-target should have failed with a proper error not a traceback, output: %s' % result.output)
+        result = runCmd('devtool build %s' % testrecipe)
+        # First try a dry-run of deploy-target
+        result = runCmd('devtool deploy-target -n %s root@%s' % (testrecipe, testhost))
+        self.assertIn('  %s' % testfile, result.output)
+        # Boot the image
+        console = pexpect.spawn('runqemu %s %s qemuparams="-snapshot" nographic' % (machine, testimage))
+        console.expect("login:", timeout=120)
+        # Now really test deploy-target
+        result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, testhost))
+        result = runCmd('ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@%s %s' % (testhost, testcommand))
+        # Test undeploy-target
+        result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, testhost))
+        result = runCmd('ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@%s %s' % (testhost, testcommand), ignore_status=True)
+        self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
+        console.close()
-- 
1.9.3


