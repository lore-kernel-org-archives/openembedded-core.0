Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED39476DDA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:49:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2015 08:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="548961139"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2015 08:49:48 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 07:43:24 +0000
Message-Id: <195df149001acccaffb6ecfbc9b837c2e8a6720d.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1440574631.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 2/2] oeqa/selftest: new tests for devtool upgrage feature
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
X-List-Received-Date: Wed, 26 Aug 2015 15:49:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Basic tests for the devtool's upgrade feature, including:
      * Parameter check
      * Upgrading a real recipe (e2fsprogrs) without patching and
      	checing its output
      * Devtool status after upgrade

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index b59db15..f72e010 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -857,3 +857,39 @@ class DevtoolTests(DevtoolBase):
             result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
             result = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, testcommand), ignore_status=True)
             self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
+
+    def test_devtool_upgrade(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        # Check parameters
+        result = runCmd('devtool upgrade -h')
+        for param in 'recipename srctree --version -V --branch -b --keep-temp --no-patch'.split():
+            self.assertIn(param, result.output)
+        # For the moment, we are using a real recipe.
+        recipe='e2fsprogs'
+        version='1.42.13'
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        # Check that recipe is not already under devtool control
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        # Check upgrade. Code does not check if new PV is older or newer that current PV, so, it may be that
+        # we are downgrading instead of upgrading.
+        result = runCmd('devtool upgrade %s %s -V %s --no-patch' % (recipe, tempdir, version))
+        # Check if srctree at least is populated
+        self.assertTrue(len(os.listdir(tempdir)) > 0, 'scrtree (%s) should be populated with new (%s) source code' % (tempdir, version))
+        # Check new recipe folder is present
+        self.assertTrue(os.path.exists(os.path.join(workspacedir,'recipes',recipe)), 'Recipe folder should exist')
+        # Check new recipe file is present
+        self.assertTrue(os.path.exists(os.path.join(workspacedir,'recipes',recipe,"%s_%s.bb" % (recipe,version))), 'Recipe folder should exist')
+        # Check devtool status and make sure recipe is present
+        result = runCmd('devtool status')
+        self.assertIn(recipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Check devtool reset recipe
+        result = runCmd('devtool reset %s -n' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-- 
1.8.4.5


