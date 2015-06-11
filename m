Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE93758D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 11:34:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2015 04:34:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709156451"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 04:34:21 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 14:34:09 +0300
Message-Id: <1434022456-26266-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1434022456-26266-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v2 03/10] devtool: update-recipe: do rev parsing in a separate function
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
X-List-Received-Date: Thu, 11 Jun 2015 11:34:23 -0000

Split out the logic of determining "initial rev" and "update rev" into a
separate function.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 55 +++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index aed76ea..c8ba247 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -514,6 +514,36 @@ def modify(args, config, basepath, workspace):
 
     return 0
 
+def _get_patchset_revs(args, srctree, recipe_path):
+    """Get initial and update rev of a recipe. These are the start point of the
+    whole patchset and start point for the patches to be re-generated/updated.
+    """
+    import bb
+
+    if args.initial_rev:
+        return args.initial_rev, args.initial_rev
+
+    # Parse initial rev from recipe
+    commits = []
+    initial_rev = None
+    with open(recipe_path, 'r') as f:
+        for line in f:
+            if line.startswith('# initial_rev:'):
+                initial_rev = line.split(':')[-1].strip()
+            elif line.startswith('# commit:'):
+                commits.append(line.split(':')[-1].strip())
+
+    update_rev = initial_rev
+    if initial_rev:
+        # Find first actually changed revision
+        stdout, _ = bb.process.run('git rev-list --reverse %s..HEAD' %
+                                   initial_rev, cwd=srctree)
+        newcommits = stdout.split()
+        for i in xrange(min(len(commits), len(newcommits))):
+            if newcommits[i] == commits[i]:
+                update_rev = commits[i]
+
+    return initial_rev, update_rev
 
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
@@ -618,34 +648,11 @@ def update_recipe(args, config, basepath, workspace):
             logger.info('You will need to update SRC_URI within the recipe to point to a git repository where you have pushed your changes')
 
     elif mode == 'patch':
-        commits = []
-        update_rev = None
-        if args.initial_rev:
-            initial_rev = args.initial_rev
-        else:
-            initial_rev = None
-            with open(append, 'r') as f:
-                for line in f:
-                    if line.startswith('# initial_rev:'):
-                        initial_rev = line.split(':')[-1].strip()
-                    elif line.startswith('# commit:'):
-                        commits.append(line.split(':')[-1].strip())
-
-            if initial_rev:
-                # Find first actually changed revision
-                (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
-                newcommits = stdout.split()
-                for i in xrange(min(len(commits), len(newcommits))):
-                    if newcommits[i] == commits[i]:
-                        update_rev = commits[i]
-
+        initial_rev, update_rev = _get_patchset_revs(args, srctree, append)
         if not initial_rev:
             logger.error('Unable to find initial revision - please specify it with --initial-rev')
             return -1
 
-        if not update_rev:
-            update_rev = initial_rev
-
         # Find list of existing patches in recipe file
         existing_patches = oe.recipeutils.get_recipe_patches(rd)
 
-- 
2.1.4


