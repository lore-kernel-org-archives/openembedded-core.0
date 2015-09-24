Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE26373D17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:53:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2015 04:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="796374466"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2015 04:53:18 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 14:53:05 +0300
Message-Id: <1443095587-13852-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v3 08/10] devtool: file mover function that creates target dir
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
X-List-Received-Date: Thu, 24 Sep 2015 11:53:19 -0000

Helper function for replacing a pattern like:
  target_dir = os.path.dirname(target)
  bb.utils.mkdirhier(target_dir)
  shutil.move(source, target)

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7c8e447..efa6fd1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -174,6 +174,13 @@ def _check_compatible_recipe(pn, d):
                            "from working. You will need to disable this "
                            "first." % pn)
 
+def _move_file(src, dst):
+    """Move a file. Creates all the directory components of destination path."""
+    dst_d = os.path.dirname(dst)
+    if dst_d:
+        bb.utils.mkdirhier(dst_d)
+    shutil.move(src, dst)
+
 def _ls_tree(directory):
     """Recursive listing of files in a directory"""
     ret = []
@@ -330,9 +337,8 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             crd.setVar('S', srcsubdir)
             # Move source files to S
             for path in src_files:
-                tgt_dir = os.path.join(srcsubdir, os.path.dirname(path))
-                bb.utils.mkdirhier(tgt_dir)
-                shutil.move(os.path.join(workdir, path), tgt_dir)
+                _move_file(os.path.join(workdir, path),
+                           os.path.join(srcsubdir, path))
         elif os.path.dirname(srcsubdir) != workdir:
             # Handle if S is set to a subdirectory of the source
             srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
@@ -893,8 +899,8 @@ def reset(args, config, basepath, workspace):
                 for root, dirs, files in os.walk(origdir):
                     for fn in files:
                         logger.warn('Preserving %s in %s' % (fn, preservepath))
-                        bb.utils.mkdirhier(preservepath)
-                        shutil.move(os.path.join(origdir, fn), os.path.join(preservepath, fn))
+                        _move_file(os.path.join(origdir, fn),
+                                   os.path.join(preservepath, fn))
                     for dn in dirs:
                         os.rmdir(os.path.join(root, dn))
                 os.rmdir(origdir)
-- 
2.1.4


