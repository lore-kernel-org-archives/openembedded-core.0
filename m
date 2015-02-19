Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 076B973617
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2015 08:40:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425687"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:40:04 +0000
Message-Id: <2431f3946f900575e4c3a6c2aaf9c83ec2b7cd7f.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 15/15] devtool: fix broken clones of git recipes
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:47 -0000

Because we move the workdir when extracting source, then move the source
and delete the temporary workdir, you lose the indirection symlink
pointed to by the alternates file (which is created when the fetcher
clones it from DL_DIR with -s) and the resulting repository is broken.
In any case, for a source repo that the user may put their own changes
into, we can't really rely on a clone made with -s in case the
original goes away - because of cleanall, DL_DIR disappearing, etc. So
repack the repository so that it is a complete, non-shared clone after
unpacking.

(While I'm at it, add a test for devtool modify with a git recipe which
verifies that this works.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 33 +++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   |  7 +++++++
 2 files changed, 40 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index f147f24..932d6b9 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -227,6 +227,39 @@ class DevtoolTests(oeSelfTest):
         matches = glob.glob(stampprefix + '*')
         self.assertFalse(matches, 'Stamp files exist for recipe mdadm that should have been cleaned')
 
+    def test_devtool_modify_git(self):
+        # Check preconditions
+        workspacedir = os.path.join(self.builddir, 'workspace')
+        self.assertTrue(not os.path.exists(workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        testrecipe = 'mkelfimage'
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
+        # Clean up anything in the workdir/sysroot/sstate cache
+        bitbake('%s -c cleansstate' % testrecipe)
+        # Try modifying a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile')), 'Extracted source could not be found')
+        self.assertTrue(os.path.isdir(os.path.join(tempdir, '.git')), 'git repository for external source tree not found')
+        self.assertTrue(os.path.exists(os.path.join(workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created')
+        matches = glob.glob(os.path.join(workspacedir, 'appends', 'mkelfimage_*.bbappend'))
+        self.assertTrue(matches, 'bbappend not created')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Check git repo
+        result = runCmd('git status --porcelain', cwd=tempdir)
+        self.assertEqual(result.output.strip(), "", 'Created git repo is not clean')
+        result = runCmd('git symbolic-ref HEAD', cwd=tempdir)
+        self.assertEqual(result.output.strip(), "refs/heads/devtool", 'Wrong branch in git repo')
+        # Try building
+        bitbake(testrecipe)
+
     def test_devtool_update_recipe(self):
         # Check preconditions
         workspacedir = os.path.join(self.builddir, 'workspace')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index bf18aae..cabf3fe 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -202,6 +202,13 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             # Handle if S is set to a subdirectory of the source
             srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
 
+        if os.path.exists(os.path.join(srcsubdir, '.git')):
+            alternatesfile = os.path.join(srcsubdir, '.git', 'objects', 'info', 'alternates')
+            if os.path.exists(alternatesfile):
+                # This will have been cloned with -s, so we need to convert it to a full clone
+                bb.process.run('git repack -a', cwd=srcsubdir)
+                os.remove(alternatesfile)
+
         patchdir = os.path.join(srcsubdir, 'patches')
         haspatches = False
         if os.path.exists(patchdir):
-- 
1.9.3


