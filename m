Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2317F76E09
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 16:16:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 31 Aug 2015 09:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,442,1437462000"; d="scan'208";a="552303486"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2015 09:16:36 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 08:10:01 +0000
Message-Id: <a4f997d66770ac00e0d312dfb4ad5a5a8bb9a444.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441007355.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v3 3/3] oeqa/selftest: new tests for devtool upgrage feature
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
X-List-Received-Date: Mon, 31 Aug 2015 16:16:38 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Basic tests for the devtool's upgrade feature, including:
      - Parameter check
      - Upgrading an example recipe (devtool-upgrade_0.1.bb)
      - Status after upgrade

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 70ee634..ce3d45e 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -887,3 +887,39 @@ class DevtoolTests(DevtoolBase):
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
+        recipe='devtool-upgrade'
+        version='0.2'
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        # Check that recipe is not already under devtool control
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output)
+        # Check upgrade. Code does not check if new PV is older or newer that current PV, so, it may be that
+        # we are downgrading instead of upgrading.
+        result = runCmd('devtool upgrade %s %s -V %s' % (recipe, tempdir, version))
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


