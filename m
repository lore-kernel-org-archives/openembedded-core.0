Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 79EF060125
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 13:05:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 02 Oct 2015 06:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,623,1437462000"; d="scan'208";a="656554864"
Received: from amattock-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.24.105])
	by orsmga003.jf.intel.com with ESMTP; 02 Oct 2015 06:05:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 14:05:07 +0100
Message-Id: <17f5024dde8e9f24511626a5e58c55b4dad486cf.1443791083.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443791083.git.paul.eggleton@linux.intel.com>
References: <cover.1443791083.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1443791083.git.paul.eggleton@linux.intel.com>
References: <cover.1443791083.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] devtool: update-recipe: avoid updating patches that have not changed
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
X-List-Received-Date: Fri, 02 Oct 2015 13:05:19 -0000

Use "git cherry" against the original tag that we made when we extracted
the source in order to find the revisions that are definitely new. This
allows you to modify a commit in the middle of the series and then run
devtool update-recipe and not have the subsequent patches unnecessarily
modified.

Fixes [YOCTO #8388].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8676e42..6ce3144 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -605,6 +605,7 @@ def _get_patchset_revs(args, srctree, recipe_path):
                 commits.append(line.split(':')[-1].strip())
 
     update_rev = initial_rev
+    changed_revs = None
     if initial_rev:
         # Find first actually changed revision
         stdout, _ = bb.process.run('git rev-list --reverse %s..HEAD' %
@@ -614,7 +615,21 @@ def _get_patchset_revs(args, srctree, recipe_path):
             if newcommits[i] == commits[i]:
                 update_rev = commits[i]
 
-    return initial_rev, update_rev
+        try:
+            stdout, _ = bb.process.run('git cherry devtool-patched',
+                                        cwd=srctree)
+        except bb.process.ExecutionError as err:
+            stdout = None
+
+        if stdout is not None:
+            changed_revs = []
+            for line in stdout.splitlines():
+                if line.startswith('+ '):
+                    rev = line.split()[1]
+                    if rev in newcommits:
+                        changed_revs.append(rev)
+
+    return initial_rev, update_rev, changed_revs
 
 def _remove_file_entries(srcuri, filelist):
     """Remove file:// entries from SRC_URI"""
@@ -835,7 +850,7 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
                            args.recipename)
 
-    initial_rev, update_rev = _get_patchset_revs(args, srctree, append)
+    initial_rev, update_rev, changed_revs = _get_patchset_revs(args, srctree, append)
     if not initial_rev:
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
@@ -888,8 +903,16 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
                 _move_file(os.path.join(local_files_dir, basepath), path)
                 updatefiles = True
             for basepath, path in upd_p.iteritems():
+                patchfn = os.path.join(patches_dir, basepath)
+                if changed_revs is not None:
+                    # Avoid updating patches that have not actually changed
+                    with open(patchfn, 'r') as f:
+                        firstlineitems = f.readline().split()
+                        if len(firstlineitems) > 1 and len(firstlineitems[1]) == 40:
+                            if not firstlineitems[1] in changed_revs:
+                                continue
                 logger.info('Updating patch %s' % basepath)
-                _move_file(os.path.join(patches_dir, basepath), path)
+                _move_file(patchfn, path)
                 updatefiles = True
             # Add any new files
             files_dir = os.path.join(os.path.dirname(recipefile),
-- 
2.1.0


