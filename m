Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D75F731AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979095"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:07 +1300
Message-Id: <9c2b37f1fcf6ab08e24ded6da325dafb31a654f2.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/26] devtool: update-recipe: use correct method to get bbappend filename
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:51 -0000

The bbappend already exists at this point, so we know what its path is -
there's no need to figure it out from scratch here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 0103d93..195da1a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -908,14 +908,13 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
 
     _remove_source_files(args, remove_files, destpath)
 
-def _update_recipe_patch(args, config, srctree, rd, config_data):
+def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
     """Implement the 'patch' mode of update-recipe"""
     import bb
     import oe.recipeutils
 
     recipefile = rd.getVar('FILE', True)
-    append = os.path.join(config.workspace_path, 'appends', '%s.bbappend' %
-                          os.path.splitext(os.path.basename(recipefile))[0])
+    append = workspace[args.recipename]['bbappend']
     if not os.path.exists(append):
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
                            args.recipename)
@@ -1063,7 +1062,7 @@ def update_recipe(args, config, basepath, workspace):
     if mode == 'srcrev':
         _update_recipe_srcrev(args, srctree, rd, tinfoil.config_data)
     elif mode == 'patch':
-        _update_recipe_patch(args, config, srctree, rd, tinfoil.config_data)
+        _update_recipe_patch(args, config, workspace, srctree, rd, tinfoil.config_data)
     else:
         raise DevtoolError('update_recipe: invalid mode %s' % mode)
 
-- 
2.5.0


