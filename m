Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 53E43774FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:04:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 03:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5042695"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 03:04:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 22:03:23 +1200
Message-Id: <7c15d9828801d9345c93c0ba40adeb2341471f01.1473155977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/9] devtool: update-recipe: support files with subdir=
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
X-List-Received-Date: Tue, 06 Sep 2016 10:04:01 -0000

It's rare but there are recipes that have individual files (as opposed
to archives) in SRC_URI using subdir= to put them under the source tree,
the examples in OE-Core being bzip2 and openssl. This broke devtool
update-recipe (and devtool finish) because the file wasn't unpacked into
the oe-local-files directory and thus when it came time to update the
recipe, the file was assumed to have been deleted by the user and thus
the file was erroneously removed. Add logic to handle these properly so
that this doesn't happen.

(We still have another potential problem in that these files become part
of the initial commit from upstream, which could be confusing because
they didn't come from there - but that's a separate issue and not one
that is trivially solved.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py      | 12 ++++++++++--
 scripts/lib/devtool/standard.py | 38 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index e7dd8af..a0d78dd 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -400,8 +400,16 @@ def get_recipe_local_files(d, patches=False):
                     bb.utils.exec_flat_python_func('patch_path', uri, fetch, '')):
                 continue
             # Skip files that are referenced by absolute path
-            if not os.path.isabs(fetch.ud[uri].basepath):
-                ret[fetch.ud[uri].basepath] = fetch.localpath(uri)
+            fname = fetch.ud[uri].basepath
+            if os.path.isabs(fname):
+                continue
+            # Handle subdir=
+            subdir = fetch.ud[uri].parm.get('subdir', '')
+            if subdir:
+                if os.path.isabs(subdir):
+                    continue
+                fname = os.path.join(subdir, fname)
+            ret[fname] = fetch.localpath(uri)
     return ret
 
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 98451da..baef23e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -307,6 +307,13 @@ def _move_file(src, dst):
         bb.utils.mkdirhier(dst_d)
     shutil.move(src, dst)
 
+def _copy_file(src, dst):
+    """Copy a file. Creates all the directory components of destination path."""
+    dst_d = os.path.dirname(dst)
+    if dst_d:
+        bb.utils.mkdirhier(dst_d)
+    shutil.copy(src, dst)
+
 def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
     """List contents of a git treeish"""
     import bb
@@ -1050,6 +1057,23 @@ def _export_local_files(srctree, rd, destdir):
             elif fname != '.gitignore':
                 added[fname] = None
 
+        workdir = rd.getVar('WORKDIR', True)
+        s = rd.getVar('S', True)
+        if not s.endswith(os.sep):
+            s += os.sep
+
+        if workdir != s:
+            # Handle files where subdir= was specified
+            for fname in list(existing_files.keys()):
+                # FIXME handle both subdir starting with BP and not?
+                fworkpath = os.path.join(workdir, fname)
+                if fworkpath.startswith(s):
+                    fpath = os.path.join(srctree, os.path.relpath(fworkpath, s))
+                    if os.path.exists(fpath):
+                        origpath = existing_files.pop(fname)
+                        if not filecmp.cmp(origpath, fpath):
+                            updated[fpath] = origpath
+
         removed = existing_files
     return (updated, added, removed)
 
@@ -1122,7 +1146,12 @@ def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remo
             files_dir = _determine_files_dir(rd)
             for basepath, path in upd_f.items():
                 logger.info('Updating file %s' % basepath)
-                _move_file(os.path.join(local_files_dir, basepath), path)
+                if os.path.isabs(basepath):
+                    # Original file (probably with subdir pointing inside source tree)
+                    # so we do not want to move it, just copy
+                    _copy_file(basepath, path)
+                else:
+                    _move_file(os.path.join(local_files_dir, basepath), path)
                 update_srcuri= True
             for basepath, path in new_f.items():
                 logger.info('Adding new file %s' % basepath)
@@ -1205,7 +1234,12 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
             # Update existing files
             for basepath, path in upd_f.items():
                 logger.info('Updating file %s' % basepath)
-                _move_file(os.path.join(local_files_dir, basepath), path)
+                if os.path.isabs(basepath):
+                    # Original file (probably with subdir pointing inside source tree)
+                    # so we do not want to move it, just copy
+                    _copy_file(basepath, path)
+                else:
+                    _move_file(os.path.join(local_files_dir, basepath), path)
                 updatefiles = True
             for basepath, path in upd_p.items():
                 patchfn = os.path.join(patches_dir, basepath)
-- 
2.5.5


