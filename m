Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5131C76A51
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 14:43:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 01 Sep 2015 07:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,449,1437462000"; d="scan'208";a="553091785"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2015 07:43:22 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 17:43:21 +0300
Message-Id: <1441118601-14754-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] devtool: update-recipe: better 'auto' mode
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
X-List-Received-Date: Tue, 01 Sep 2015 14:43:25 -0000

Enhance the logic behind the 'auto' mode a bit by only updating the
SRCREV if the changes are already found upstream. The logic is simple:
update SRCREV only if the current local HEAD commit is found in the
remote branch (i.e. 'origin/<branch_name>'). Otherwise resort to
patching.

[YOCTO #7907]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index de7afd9..6f3bb8e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -725,6 +725,31 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
 
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
@@ -745,17 +770,12 @@ def update_recipe(args, config, basepath, workspace):
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
2.1.4


