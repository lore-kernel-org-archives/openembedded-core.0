Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BD843731DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 14:18:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 18 Feb 2016 06:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,465,1449561600"; d="scan'208";a="918493648"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2016 06:18:58 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 16:18:55 +0200
Message-Id: <1455805135-20814-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1455805135-20814-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1455805135-20814-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 2/2] devtool: update-recipe: create config fragment
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
X-List-Received-Date: Thu, 18 Feb 2016 14:18:58 -0000

Create config fragment if the user makes modifications to kernel config.
User may change .config e.g. by directly editing it or by running the
'do_menuconfig' bitbake task. Devtool generates one monolithic fragment
by simply doing a diff between .config and .config.baseline files in the
source directory.  If either of these files is missing, the config
fragment is not gerenrated or updated. The output is a file,
'devtool-fragment.cfg' that gets added to SRC_URI in the recipe (as well
as copied into the 'oe-local-files' directory if that is present in the
source tree).

${S}/.config will be a symlink to ${B}/.config. We need to do this as
devtool is not able to access ${B} because ${B} is set in a .bbappend in
the workspace layer which is not parsed by devtool itself.

[YOCTO #8999]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 56 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a540a9b..b763976 100644
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
@@ -775,6 +776,10 @@ def modify(args, config, basepath, workspace):
         if bb.data.inherits_class('kernel', rd):
             f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout '
                     'do_fetch do_unpack do_patch do_kernel_configme do_kernel_configcheck"\n')
+            f.write('\ndo_configure_append() {\n'
+                    '    cp ${B}/.config ${S}/.config.baseline\n'
+                    '    ln -sfT ${B}/.config ${S}/.config\n'
+                    '}\n')
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
             for commit in commits:
@@ -916,6 +921,33 @@ def _export_patches(srctree, rd, start_rev, destdir):
     return (updated, added, existing_patches)
 
 
+def _create_kconfig_diff(srctree, rd, outfile):
+    """Create a kconfig fragment"""
+    # Only update config fragment if both config files exist
+    orig_config = os.path.join(srctree, '.config.baseline')
+    new_config = os.path.join(srctree, '.config')
+    if os.path.exists(orig_config) and os.path.exists(new_config):
+        cmd = ['diff', '--new-line-format=%L', '--old-line-format=',
+               '--unchanged-line-format=', orig_config, new_config]
+        pipe = subprocess.Popen(cmd, stdout=subprocess.PIPE,
+                                stderr=subprocess.PIPE)
+        stdout, stderr = pipe.communicate()
+        if pipe.returncode == 1:
+            logger.info("Updating config fragment %s" % outfile)
+            with open(outfile, 'w') as fobj:
+                fobj.write(stdout)
+        elif pipe.returncode == 0:
+            logger.info("Would remove config fragment %s" % outfile)
+            if os.path.exists(outfile):
+                # Remove fragment file in case of empty diff
+                logger.info("Removing config fragment %s" % outfile)
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
@@ -936,6 +968,7 @@ def _export_local_files(srctree, rd, destdir):
     updated = OrderedDict()
     added = OrderedDict()
     removed = OrderedDict()
+    local_files_dir = os.path.join(srctree, 'oe-local-files')
     git_files = _git_ls_tree(srctree)
     if 'oe-local-files' in git_files:
         # If tracked by Git, take the files from srctree HEAD. First get
@@ -946,11 +979,32 @@ def _export_local_files(srctree, rd, destdir):
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
2.6.2


