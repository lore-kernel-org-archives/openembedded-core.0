Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C914D7687B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537263"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:12 +0100
Message-Id: <f0c916a66e9e992549c41973e773fdfe0474347a.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/9] devtool: update-recipe: better 'auto' mode
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:42 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Enhance the logic behind the 'auto' mode a bit by only updating the
SRCREV if the changes are already found upstream. The logic is simple:
update SRCREV only if the current local HEAD commit is found in the
remote branch (i.e. 'origin/<branch_name>'). Otherwise resort to
patching.

This affects a couple of the oe-selftest tests so update those as well.

[YOCTO #7907]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 32 ++++++++++++++++++++++++++------
 scripts/lib/devtool/standard.py   | 34 +++++++++++++++++++++++++++-------
 2 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 255f2c3..6e731d6 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -547,8 +547,8 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('echo "A new file" > devtool-new-file', cwd=tempdir)
         result = runCmd('git add devtool-new-file', cwd=tempdir)
         result = runCmd('git commit -m "Add a new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
-        result = runCmd('devtool update-recipe %s' % testrecipe)
+        self.add_command_to_tearDown('cd %s; rm -rf %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = runCmd('devtool update-recipe -m srcrev %s' % testrecipe)
         result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
         self.assertNotEqual(result.output.strip(), "", '%s recipe should be modified' % testrecipe)
         status = result.output.splitlines()
@@ -585,6 +585,26 @@ class DevtoolTests(DevtoolBase):
                         matched = True
                         break
                 self.assertTrue(matched, 'Unexpected diff remove line: %s' % line)
+        # Now try with auto mode
+        runCmd('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
+        result = runCmd('devtool update-recipe %s' % testrecipe)
+        result = runCmd('git rev-parse --show-toplevel')
+        topleveldir = result.output.strip()
+        result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
+        status = result.output.splitlines()
+        relpatchpath = os.path.join(os.path.relpath(os.path.dirname(recipefile), topleveldir), testrecipe)
+        expectedstatus = [('M', os.path.relpath(recipefile, topleveldir)),
+                          ('??', '%s/0001-Change-the-Makefile.patch' % relpatchpath),
+                          ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
+        for line in status:
+            statusline = line.split(None, 1)
+            for fstatus, fn in expectedstatus:
+                if fn == statusline[1]:
+                    if fstatus != statusline[0]:
+                        self.fail('Unexpected status in line: %s' % line)
+                    break
+            else:
+                self.fail('Unexpected modified file in line: %s' % line)
 
     @testcase(1170)
     def test_devtool_update_recipe_append(self):
@@ -708,7 +728,7 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % templayerdir)
         result = runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
         # Create the bbappend
-        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertNotIn('WARNING:', result.output)
         # Check recipe is still clean
         result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
@@ -729,12 +749,12 @@ class DevtoolTests(DevtoolBase):
             self.assertEqual(expectedlines, f.readlines())
 
         # Check we can run it again and bbappend isn't modified
-        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         with open(bbappendfile, 'r') as f:
             self.assertEqual(expectedlines, f.readlines())
         # Drop new commit and check SRCREV changes
         result = runCmd('git reset HEAD^', cwd=tempsrcdir)
-        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
         expectedlines = ['SRCREV = "%s"\n' % result.output,
@@ -747,7 +767,7 @@ class DevtoolTests(DevtoolBase):
         os.remove(bbappendfile)
         result = runCmd('git commit -a -m "Change the Makefile"', cwd=tempsrcdir)
         result = runCmd('bitbake-layers remove-layer %s' % templayerdir, cwd=self.builddir)
-        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        result = runCmd('devtool update-recipe -m srcrev %s -a %s' % (testrecipe, templayerdir))
         self.assertIn('WARNING: Specified layer is not currently enabled in bblayers.conf', result.output)
         self.assertFalse(os.path.exists(os.path.join(appenddir, testrecipe)), 'Patch directory should not be created')
         result = runCmd('git rev-parse HEAD', cwd=tempsrcdir)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f2dc745..c398e4c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -757,6 +757,31 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
 
     _remove_patch_files(args, removepatches, destpath)
 
+def _guess_recipe_update_mode(srctree, rdata):
+    """Guess the recipe update mode to use"""
+    src_uri = (rdata.getVar('SRC_URI', False) or '').split()
+    git_uris = [uri for uri in src_uri if uri.startswith('git://')]
+    if not git_uris:
+        return 'patch'
+    # Just use the first URI for now
+    uri = git_uris[0]
+    # Check remote branch
+    upstr_branch = 'master'
+    for paramdef in uri.split(';')[1:]:
+        name, value = paramdef.split('=', 1)
+        if name == 'branch':
+            upstr_branch = value
+    # Check if current branch HEAD is found in upstream branch
+    stdout, _ = bb.process.run('git rev-parse HEAD', cwd=srctree)
+    head_rev = stdout.rstrip()
+    stdout, _ = bb.process.run('git branch -r --contains %s' % head_rev,
+                               cwd=srctree)
+    remote_brs = [branch.strip() for branch in stdout.splitlines()]
+    if 'origin/' + upstr_branch in remote_brs:
+        return 'srcrev'
+
+    return 'patch'
+
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
     if not args.recipename in workspace:
@@ -777,17 +802,12 @@ def update_recipe(args, config, basepath, workspace):
     if not rd:
         return 1
 
-    orig_src_uri = rd.getVar('SRC_URI', False) or ''
+    srctree = workspace[args.recipename]['srctree']
     if args.mode == 'auto':
-        if 'git://' in orig_src_uri:
-            mode = 'srcrev'
-        else:
-            mode = 'patch'
+        mode = _guess_recipe_update_mode(srctree, rd)
     else:
         mode = args.mode
 
-    srctree = workspace[args.recipename]['srctree']
-
     if mode == 'srcrev':
         _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
     elif mode == 'patch':
-- 
2.1.0


