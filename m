Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4278A7807B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 01:59:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 18:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,273,1496127600"; d="scan'208";a="985963857"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 27 Jun 2017 18:59:28 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jun 2017 09:59:19 +0800
Message-Id: <1498615159-6719-4-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 3/3] devtool: find-recipe: enable new subcommand for devtool
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
X-List-Received-Date: Wed, 28 Jun 2017 01:59:27 -0000

devtool find-recipe will prints out the path to the recipe
in a workspace.

This subcommand can also help to find recipe outside of
current workspace using "-a" or "--any-recipe" option.

This enhancement helps developer to get the recipe path
when working with devtool.

[YOCTO #11434]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/devtool/utilcmds.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index 938d88a..c8cb760 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -30,9 +30,8 @@ from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
 
-
-def edit_recipe(args, config, basepath, workspace):
-    """Entry point for the devtool 'edit-recipe' subcommand"""
+def find_recipe(args, config, basepath, workspace):
+    """Entry point for the devtool 'find-recipe' subcommand"""
     if args.any_recipe:
         tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
         try:
@@ -49,7 +48,10 @@ def edit_recipe(args, config, basepath, workspace):
             raise DevtoolError("Recipe file for %s is not under the workspace" %
                                args.recipename)
 
-    return scriptutils.run_editor(recipefile, logger)
+
+def edit_recipe(args, config, basepath, workspace):
+    """Entry point for the devtool 'edit-recipe' subcommand"""
+    return scriptutils.run_editor(find_recipe(args, config, basepath, workspace), logger)
 
 
 def configure_help(args, config, basepath, workspace):
@@ -220,6 +222,14 @@ def register_commands(subparsers, context):
     parser_edit_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Edit any recipe, not just where the recipe file itself is in the workspace')
     parser_edit_recipe.set_defaults(func=edit_recipe)
 
+    # Find-recipe
+    parser_find_recipe = subparsers.add_parser('find-recipe', help='Find a recipe file in your workspace',
+                                         description='By default, this will find a recipe file in your workspace; you can override this with the -a/--any-recipe option.',
+                                         group='working')
+    parser_find_recipe.add_argument('recipename', help='Recipe to find')
+    parser_find_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Find any recipe, not just where the recipe file itself is in the workspace')
+    parser_find_recipe.set_defaults(func=find_recipe)
+
     # NOTE: Needed to override the usage string here since the default
     # gets the order wrong - recipename must come before --arg
     parser_configure_help = subparsers.add_parser('configure-help', help='Get help on configure script options',
-- 
2.7.4


