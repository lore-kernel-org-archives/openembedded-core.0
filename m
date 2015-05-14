Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE2D6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963881"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:45:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:04 +0100
Message-Id: <18178d3c20842823de96dbe5cc8b2773d71eebd3.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/9] devtool: extract: remove patches when S=WORKDIR
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
X-List-Received-Date: Thu, 14 May 2015 17:45:52 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Before this change, all files from the recipe (SRC_URI), including
patches, were added to to srctree repository when S==WORKDIR. The patch
files are useless as they are automatically applied on top of the
srctree by devtool.

This change causes devtool extract to not commit these unnecessary (and
possibly confusing) patch file(s) into srctree repository.

[YOCTO #7602]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 81a44d4..3bc84c7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -177,6 +177,16 @@ def _parse_recipe(config, tinfoil, pn, appends):
     return oe.recipeutils.parse_recipe(recipefile, append_files,
                                        tinfoil.config_data)
 
+
+def _ls_tree(directory):
+    """Recursive listing of files in a directory"""
+    ret = []
+    for root, dirs, files in os.walk(directory):
+        ret.extend([os.path.relpath(os.path.join(root, fname), directory) for
+                    fname in files])
+    return ret
+
+
 def extract(args, config, basepath, workspace):
     import bb
 
@@ -196,6 +206,7 @@ def extract(args, config, basepath, workspace):
 
 def _extract_source(srctree, keep_temp, devbranch, d):
     import bb.event
+    import oe.recipeutils
 
     def eventfilter(name, handler, event, d):
         if name == 'base_eventhandler':
@@ -264,7 +275,21 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         logger.info('Unpacking...')
         exec_task_func('do_unpack', False)
         srcsubdir = crd.getVar('S', True)
-        if srcsubdir != workdir and os.path.dirname(srcsubdir) != workdir:
+        if srcsubdir == workdir:
+            # Find non-patch sources that were "unpacked" to srctree directory
+            recipe_patches = [os.path.basename(patch) for patch in
+                              oe.recipeutils.get_recipe_patches(crd)]
+            src_files = [fname for fname in _ls_tree(workdir) if
+                         os.path.basename(fname) not in recipe_patches]
+            # Force separate S so that patch files can be left out from srctree
+            srcsubdir = tempfile.mkdtemp(dir=workdir)
+            crd.setVar('S', srcsubdir)
+            # Move source files to S
+            for path in src_files:
+                tgt_dir = os.path.join(srcsubdir, os.path.dirname(path))
+                bb.utils.mkdirhier(tgt_dir)
+                shutil.move(os.path.join(workdir, path), tgt_dir)
+        elif os.path.dirname(srcsubdir) != workdir:
             # Handle if S is set to a subdirectory of the source
             srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
 
-- 
2.1.0


