Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D8F056FF6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 04:44:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2016 21:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,465,1459839600"; d="scan'208";a="996301608"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2016 21:44:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 16:43:40 +1200
Message-Id: <51df8170189201b5141824cdd19274c491a41899.1465791249.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465791249.git.paul.eggleton@linux.intel.com>
References: <cover.1465791249.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465791249.git.paul.eggleton@linux.intel.com>
References: <cover.1465791249.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] devtool: reset: allow specifying multiple recipes
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
X-List-Received-Date: Mon, 13 Jun 2016 04:44:13 -0000

Allow specifying more than one recipe on the devtool reset command line.

Also tweak the help text slightly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a2516d6..ed49a93 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1304,14 +1304,15 @@ def reset(args, config, basepath, workspace):
         if args.all:
             raise DevtoolError("Recipe cannot be specified if -a/--all is used")
         else:
-            check_workspace_recipe(workspace, args.recipename, checksrc=False)
+            for recipe in args.recipename:
+                check_workspace_recipe(workspace, recipe, checksrc=False)
     elif not args.all:
         raise DevtoolError("Recipe must be specified, or specify -a/--all to "
                            "reset all recipes")
     if args.all:
         recipes = list(workspace.keys())
     else:
-        recipes = [args.recipename]
+        recipes = args.recipename
 
     if recipes and not args.no_clean:
         if len(recipes) == 1:
@@ -1449,9 +1450,9 @@ def register_commands(subparsers, context):
     parser_status.set_defaults(func=status)
 
     parser_reset = subparsers.add_parser('reset', help='Remove a recipe from your workspace',
-                                         description='Removes the specified recipe from your workspace (resetting its state)',
+                                         description='Removes the specified recipe(s) from your workspace (resetting its state back to that defined by the metadata).',
                                          group='working', order=-100)
-    parser_reset.add_argument('recipename', nargs='?', help='Recipe to reset')
+    parser_reset.add_argument('recipename', nargs='*', help='Recipe to reset')
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_reset.set_defaults(func=reset)
-- 
2.5.5


