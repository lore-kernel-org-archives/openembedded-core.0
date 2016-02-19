Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CDBC877156
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773716"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:51 +1300
Message-Id: <89a6e9052be8f05fc4ce9a55455bba7aff35d441.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/14] devtool: reset: fix preserving patches/other files next to recipes
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:40 -0000

If files had been created next to the recipe (for example devtool add,
edit the source and commit and then devtool update-recipe), running
devtool reset failed to preserve those files and gave an error due
to trying to rmdir the directory containing them which wasn't empty.
Fix the preservation of files in the "attic" directory properly so
we catch anything under the directory for the recipe, and replicate
the same structure in the attic directory rather than slightly
flattening it as we were before.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 590dfef..bbbe426 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -190,7 +190,7 @@ def add(args, config, basepath, workspace):
             shutil.move(recipes[0], recipefile)
         else:
             raise DevtoolError('Command \'%s\' did not create any recipe file:\n%s' % (e.command, e.stdout))
-        attic_recipe = os.path.join(config.workspace_path, 'attic', os.path.basename(recipefile))
+        attic_recipe = os.path.join(config.workspace_path, 'attic', recipename, os.path.basename(recipefile))
         if os.path.exists(attic_recipe):
             logger.warn('A modified recipe from a previous invocation exists in %s - you may wish to move this over the top of the new recipe if you had changes in it that you want to continue with' % attic_recipe)
     finally:
@@ -645,7 +645,7 @@ def _check_preserve(config, recipename):
     import bb.utils
     origfile = os.path.join(config.workspace_path, '.devtool_md5')
     newfile = os.path.join(config.workspace_path, '.devtool_md5_new')
-    preservepath = os.path.join(config.workspace_path, 'attic')
+    preservepath = os.path.join(config.workspace_path, 'attic', recipename)
     with open(origfile, 'r') as f:
         with open(newfile, 'w') as tf:
             for line in f.readlines():
@@ -1256,7 +1256,7 @@ def reset(args, config, basepath, workspace):
     for pn in recipes:
         _check_preserve(config, pn)
 
-        preservepath = os.path.join(config.workspace_path, 'attic', pn)
+        preservepath = os.path.join(config.workspace_path, 'attic', pn, pn)
         def preservedir(origdir):
             if os.path.exists(origdir):
                 for root, dirs, files in os.walk(origdir):
@@ -1265,7 +1265,7 @@ def reset(args, config, basepath, workspace):
                         _move_file(os.path.join(origdir, fn),
                                    os.path.join(preservepath, fn))
                     for dn in dirs:
-                        os.rmdir(os.path.join(root, dn))
+                        preservedir(os.path.join(root, dn))
                 os.rmdir(origdir)
 
         preservedir(os.path.join(config.workspace_path, 'recipes', pn))
-- 
2.5.0


