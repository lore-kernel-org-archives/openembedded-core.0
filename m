Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D03C7731CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:40:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 00:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,445,1444719600"; d="scan'208";a="843854164"
Received: from lleszczu-mobl.igk.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.252.17.67])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2015 00:39:52 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 10:39:45 +0200
Message-Id: <1450427985-12504-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/5] devtool: update-recipe: create kernel config fragment
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
X-List-Received-Date: Fri, 18 Dec 2015 08:40:20 -0000

Create kernel config fragment if the user makes modifications to
.config. User may change .config e.g. by directly editing it or by
running the 'do_menuconfig' bitbake task which will copy the modified
.config back to the source tree. Devtool generates one monolithic
fragment by simply doing a diff between .config and .config.orig files
in the source directory. If either of these files is missing, the config
fragment is not gerenrated or updated. The output is a file,
'devtool-fragment.cfg' that gets added to SRC_URI in the recipe (as well
as copied into the 'oe-local-files' directory if that is present in the
source tree).

This patch also changes the devtool 'extract' command to create the
.config.orig file at the source tree creation time.

[YOCTO #6658]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 50 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f817671..aa9414b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -20,6 +20,7 @@ import os
 import sys
 import re
 import shutil
+import subprocess
 import tempfile
 import logging
 import argparse
@@ -474,6 +475,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
         if kconfig:
             # Store kernel config in srctree
             shutil.copy2(kconfig, srcsubdir)
+            shutil.copy2(kconfig, os.path.join(srcsubdir, '.config.orig'))
 
 
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
@@ -804,6 +806,30 @@ def _export_patches(srctree, rd, start_rev, destdir):
     return (updated, added, existing_patches)
 
 
+def _create_kconfig_diff(srctree, rd, outfile):
+    """Create a kernel config fragment"""
+    # Only update config fragment if both config files exist
+    orig_config = os.path.join(srctree, '.config.orig')
+    new_config = os.path.join(srctree, '.config')
+    if os.path.exists(orig_config) and os.path.exists(new_config):
+        cmd = ['diff', '--new-line-format=%L', '--old-line-format=',
+               '--unchanged-line-format=', orig_config, new_config]
+        pipe = subprocess.Popen(cmd, stdout=subprocess.PIPE,
+                                stderr=subprocess.PIPE)
+        stdout, stderr = pipe.communicate()
+        if pipe.returncode == 1:
+            with open(outfile, 'w') as fobj:
+                fobj.write(stdout)
+        elif pipe.returncode == 0:
+            if os.path.exists(outfile):
+                # Remove fragment file in case of empty diff
+                os.unlink(outfile)
+        else:
+            raise bb.process.ExecutionError(cmd, pipe.returncode, stdout, stderr)
+        return True
+    return False
+
+
 def _export_local_files(srctree, rd, destdir):
     """Copy local files from srctree to given location.
        Returns three-tuple of dicts:
@@ -824,6 +850,7 @@ def _export_local_files(srctree, rd, destdir):
     updated = OrderedDict()
     added = OrderedDict()
     removed = OrderedDict()
+    local_files_dir = os.path.join(srctree, 'oe-local-files')
     git_files = _git_ls_tree(srctree)
     if 'oe-local-files' in git_files:
         # If tracked by Git, take the files from srctree HEAD. First get
@@ -834,11 +861,32 @@ def _export_local_files(srctree, rd, destdir):
                         env=dict(os.environ, GIT_WORK_TREE=destdir,
                                  GIT_INDEX_FILE=tmp_index))
         new_set = _git_ls_tree(srctree, tree, True).keys()
-    elif os.path.isdir(os.path.join(srctree, 'oe-local-files')):
+    elif os.path.isdir(local_files_dir):
         # If not tracked by Git, just copy from working copy
         new_set = _ls_tree(os.path.join(srctree, 'oe-local-files'))
         bb.process.run(['cp', '-ax',
                         os.path.join(srctree, 'oe-local-files', '.'), destdir])
+    else:
+        new_set = []
+
+    # Special handling for kernel config
+    if bb.data.inherits_class('kernel-yocto', rd):
+        fragment_fn = 'devtool-fragment.cfg'
+        fragment_path = os.path.join(destdir, fragment_fn)
+        if _create_kconfig_diff(srctree, rd, fragment_path):
+            if os.path.exists(fragment_path):
+                if fragment_fn not in new_set:
+                    new_set.append(fragment_fn)
+                # Copy fragment to local-files
+                if os.path.isdir(local_files_dir):
+                    shutil.copy2(fragment_path, local_files_dir)
+            else:
+                if fragment_fn in new_set:
+                    new_set.remove(fragment_fn)
+                # Remove fragment from local-files
+                if os.path.exists(os.path.join(local_files_dir, fragment_fn)):
+                    os.unlink(os.path.join(local_files_dir, fragment_fn))
+
     if new_set is not None:
         for fname in new_set:
             if fname in existing_files:
-- 
2.1.4


