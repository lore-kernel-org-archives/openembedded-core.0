Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAA975E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537218"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:08 +0100
Message-Id: <585586b39e36a8d9c68d79330bbab5cbd7636d2c.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/9] devtool: improve modified file preservation to handle directory structures
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:35 -0000

Allow the _add_md5() function to be called with a directory in order to
recursively add the files under it. Additionally, we need to skip
preserving empty directories (since directories aren't listed in the md5
file).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e59fb5e..6d65d57 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -362,14 +362,23 @@ def _extract_source(srctree, keep_temp, devbranch, d):
     return initial_rev
 
 def _add_md5(config, recipename, filename):
-    """Record checksum of a recipe to the md5-file of the workspace"""
+    """Record checksum of a file (or recursively for a directory) to the md5-file of the workspace"""
     import bb.utils
-    md5 = bb.utils.md5_file(filename)
-    with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
-        f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename, config.workspace_path), md5))
+
+    def addfile(fn):
+        md5 = bb.utils.md5_file(fn)
+        with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
+            f.write('%s|%s|%s\n' % (recipename, os.path.relpath(fn, config.workspace_path), md5))
+
+    if os.path.isdir(filename):
+        for root, _, files in os.walk(os.path.dirname(filename)):
+            for f in files:
+                addfile(os.path.join(root, f))
+    else:
+        addfile(filename)
 
 def _check_preserve(config, recipename):
-    """Check if a recipe was manually changed and needs to be saved in 'attic'
+    """Check if a file was manually changed and needs to be saved in 'attic'
        directory"""
     import bb.utils
     origfile = os.path.join(config.workspace_path, '.devtool_md5')
@@ -830,10 +839,13 @@ def reset(args, config, basepath, workspace):
         preservepath = os.path.join(config.workspace_path, 'attic', pn)
         def preservedir(origdir):
             if os.path.exists(origdir):
-                for fn in os.listdir(origdir):
-                    logger.warn('Preserving %s in %s' % (fn, preservepath))
-                    bb.utils.mkdirhier(preservepath)
-                    shutil.move(os.path.join(origdir, fn), os.path.join(preservepath, fn))
+                for root, dirs, files in os.walk(origdir):
+                    for fn in files:
+                        logger.warn('Preserving %s in %s' % (fn, preservepath))
+                        bb.utils.mkdirhier(preservepath)
+                        shutil.move(os.path.join(origdir, fn), os.path.join(preservepath, fn))
+                    for dn in dirs:
+                        os.rmdir(os.path.join(root, dn))
                 os.rmdir(origdir)
 
         preservedir(os.path.join(config.workspace_path, 'recipes', pn))
-- 
2.1.0


