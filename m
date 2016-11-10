Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B140A60720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 01:45:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 17:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,616,1473145200"; d="scan'208";a="189697394"
Received: from yspay-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.149])
	by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2016 17:45:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 14:45:18 +1300
Message-Id: <d773290fd743d15ea73086982be5b60236693cdd.1478742229.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/7] devtool: update-recipe: support replacing remote patches
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
X-List-Received-Date: Thu, 10 Nov 2016 01:45:59 -0000

If you have a patch remotely fetched in a recipe (e.g. from an http
server) that needs updating then add a local version and substitute the
entry in SRC_URI to point to it.

One can argue about how desirable it is to be modifying patches fetched
in this way, but then one can argue about how desirable it is to have
such patches in the recipe in the first place - and in any case if
devtool update-recipe is to correctly transfer changes to such patches
made in the git repository within the source tree to the recipe then
there isn't much choice but to do it this way.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index af0d467..34de7bd 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1104,6 +1104,15 @@ def _remove_file_entries(srcuri, filelist):
                 break
     return entries, remaining
 
+def _replace_srcuri_entry(srcuri, filename, newentry):
+    """Replace entry corresponding to specified file with a new entry"""
+    basename = os.path.basename(filename)
+    for i in range(len(srcuri)):
+        if os.path.basename(srcuri[i].split(';')[0]) == basename:
+            srcuri.pop(i)
+            srcuri.insert(i, newentry)
+            break
+
 def _remove_source_files(append, files, destpath):
     """Unlink existing patch files"""
     for path in files:
@@ -1424,6 +1433,10 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
 
+    dl_dir = rd.getVar('DL_DIR', True)
+    if not dl_dir.endswith('/'):
+        dl_dir += '/'
+
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
         local_files_dir = tempfile.mkdtemp(dir=tempdir)
@@ -1468,6 +1481,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                 logger.info('No patches or local source files needed updating')
         else:
             # Update existing files
+            files_dir = _determine_files_dir(rd)
             for basepath, path in upd_f.items():
                 logger.info('Updating file %s' % basepath)
                 if os.path.isabs(basepath):
@@ -1479,11 +1493,19 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                 updatefiles = True
             for basepath, path in upd_p.items():
                 patchfn = os.path.join(patches_dir, basepath)
-                logger.info('Updating patch %s' % basepath)
+                if os.path.dirname(path) + '/' == dl_dir:
+                    # This is a a downloaded patch file - we now need to
+                    # replace the entry in SRC_URI with our local version
+                    logger.info('Replacing remote patch %s with updated local version' % basepath)
+                    path = os.path.join(files_dir, basepath)
+                    _replace_srcuri_entry(srcuri, basepath, 'file://%s' % basepath)
+                    updaterecipe = True
+                else:
+                    logger.info('Updating patch %s' % basepath)
+                logger.debug('Moving new patch %s to %s' % (patchfn, path))
                 _move_file(patchfn, path)
                 updatefiles = True
             # Add any new files
-            files_dir = _determine_files_dir(rd)
             for basepath, path in new_f.items():
                 logger.info('Adding new file %s' % basepath)
                 _move_file(os.path.join(local_files_dir, basepath),
-- 
2.5.5


