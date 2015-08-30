Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35BAC76EBF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:09:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2015 09:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758326867"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 09:09:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E33936A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:44 +0300
Message-Id: <060fecc2faba48316c68fc10f6a7e67f2bc8f775.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 11/11] oe-selftest: test devtool build-image plugin
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
X-List-Received-Date: Sun, 30 Aug 2015 16:09:04 -0000

Added test case to test functionaly of build-image plugin:

Add two packages to workspace and run 'devtool build-image
core-image-minimal'.

Checked if command is successful.

Checked if expected package is added to generated
core-image-minimal.bbappend file.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 70ee634..a6474b7 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -887,3 +887,29 @@ class DevtoolTests(DevtoolBase):
             result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
             result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
             self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
+
+    def test_devtool_build_image(self):
+        """Test devtool build-image plugin"""
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        image = 'core-image-minimal'
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake -c clean %s' % image)
+        bitbake('%s -c clean' % image)
+        # Add target and native recipes to workspace
+        for recipe in ('mdadm', 'parted-native'):
+            tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+            self.track_for_cleanup(tempdir)
+            self.add_command_to_tearDown('bitbake -c clean %s' % recipe)
+            runCmd('devtool modify %s -x %s' % (recipe, tempdir))
+        # Try to build image
+        result = runCmd('devtool build-image %s' % image)
+        self.assertNotEqual(result, 0, 'devtool build-image failed')
+        # Check if image.bbappend has required content
+        bbappend = os.path.join(workspacedir, 'appends', image+'.bbappend')
+        self.assertTrue(os.path.isfile(bbappend), 'bbappend not created %s' % result.output)
+        # NOTE: native recipe parted-native should not be in IMAGE_INSTALL_append
+        self.assertTrue('IMAGE_INSTALL_append = " mdadm"\n' in open(bbappend).readlines(),
+                        'IMAGE_INSTALL_append = " mdadm" not found in %s' % bbappend)
-- 
2.1.4


