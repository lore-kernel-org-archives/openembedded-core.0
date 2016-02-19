Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6378977156
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773739"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:52 +1300
Message-Id: <1f0070081bdeeb24b633243bf31d25a9e5adf815.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/14] devtool: update-recipe: don't show workspace recipe warning if no update
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:43 -0000

If we didn't make any changes to the file then there's no point warning
the user that we have done.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index bbbe426..804c127 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1034,6 +1034,7 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
                     'changes')
 
     _remove_source_files(args, remove_files, destpath)
+    return True
 
 def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
     """Implement the 'patch' mode of update-recipe"""
@@ -1135,10 +1136,12 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
             elif not updatefiles:
                 # Neither patches nor recipe were updated
                 logger.info('No patches or files need updating')
+                return False
     finally:
         shutil.rmtree(tempdir)
 
     _remove_source_files(args, remove_files, destpath)
+    return True
 
 def _guess_recipe_update_mode(srctree, rdata):
     """Guess the recipe update mode to use"""
@@ -1187,15 +1190,16 @@ def update_recipe(args, config, basepath, workspace):
         mode = args.mode
 
     if mode == 'srcrev':
-        _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
+        updated = _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
     elif mode == 'patch':
-        _update_recipe_patch(args, config, workspace, srctree, rd, tinfoil.config_data)
+        updated = _update_recipe_patch(args, config, workspace, srctree, rd, tinfoil.config_data)
     else:
         raise DevtoolError('update_recipe: invalid mode %s' % mode)
 
-    rf = rd.getVar('FILE', True)
-    if rf.startswith(config.workspace_path):
-        logger.warn('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
+    if updated:
+        rf = rd.getVar('FILE', True)
+        if rf.startswith(config.workspace_path):
+            logger.warn('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
 
     return 0
 
-- 
2.5.0


