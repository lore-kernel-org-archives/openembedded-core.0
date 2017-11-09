Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 19D68784F7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:40 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401048"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:11 +1300
Message-Id: <071fbf6a3d2adca7784000661f44f1e424828c31.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/24] devtool: make find-recipe and edit-recipe always work with any recipe
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:40 -0000

After some reconsideration I think it's a bit annoying for users to be
forced to use an option to work with recipes where the file isn't in the
workspace, so let's just have these commands check the workspace first
for the recipe, and if it isn't there then load the cache and get it
that way.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/utilcmds.py | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index b745116..7cd139f 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -32,6 +32,12 @@ logger = logging.getLogger('devtool')
 
 def _find_recipe_path(args, config, basepath, workspace):
     if args.any_recipe:
+        logger.warning('-a/--any-recipe option is now always active, and thus the option will be removed in a future release')
+    if args.recipename in workspace:
+        recipefile = workspace[args.recipename]['recipefile']
+    else:
+        recipefile = None
+    if not recipefile:
         tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
         try:
             rd = parse_recipe(config, tinfoil, args.recipename, True)
@@ -40,12 +46,6 @@ def _find_recipe_path(args, config, basepath, workspace):
             recipefile = rd.getVar('FILE')
         finally:
             tinfoil.shutdown()
-    else:
-        check_workspace_recipe(workspace, args.recipename)
-        recipefile = workspace[args.recipename]['recipefile']
-        if not recipefile:
-            raise DevtoolError("Recipe file for %s is not under the workspace" %
-                               args.recipename)
     return recipefile
 
 
@@ -222,19 +222,21 @@ The ./configure %s output for %s follows.
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
-    parser_edit_recipe = subparsers.add_parser('edit-recipe', help='Edit a recipe file in your workspace',
-                                         description='Runs the default editor (as specified by the EDITOR variable) on the specified recipe. Note that the recipe file itself must be in the workspace (i.e. as a result of "devtool add" or "devtool upgrade"); you can override this with the -a/--any-recipe option.',
+    parser_edit_recipe = subparsers.add_parser('edit-recipe', help='Edit a recipe file',
+                                         description='Runs the default editor (as specified by the EDITOR variable) on the specified recipe. Note that this will be quicker for recipes in the workspace as the cache does not need to be loaded in that case.',
                                          group='working')
     parser_edit_recipe.add_argument('recipename', help='Recipe to edit')
-    parser_edit_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Edit any recipe, not just where the recipe file itself is in the workspace')
+    # FIXME drop -a at some point in future
+    parser_edit_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Does nothing (exists for backwards-compatibility)')
     parser_edit_recipe.set_defaults(func=edit_recipe)
 
     # Find-recipe
-    parser_find_recipe = subparsers.add_parser('find-recipe', help='Find a recipe file in your workspace',
-                                         description='By default, this will find a recipe file in your workspace; you can override this with the -a/--any-recipe option.',
+    parser_find_recipe = subparsers.add_parser('find-recipe', help='Find a recipe file',
+                                         description='Finds a recipe file. Note that this will be quicker for recipes in the workspace as the cache does not need to be loaded in that case.',
                                          group='working')
     parser_find_recipe.add_argument('recipename', help='Recipe to find')
-    parser_find_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Find any recipe, not just where the recipe file itself is in the workspace')
+    # FIXME drop -a at some point in future
+    parser_find_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Does nothing (exists for backwards-compatibility)')
     parser_find_recipe.set_defaults(func=find_recipe)
 
     # NOTE: Needed to override the usage string here since the default
-- 
2.9.5


