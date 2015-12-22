Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 68FE7731B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979059"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:04 +1300
Message-Id: <a38f3cded0036d3dd29b43e471ee0130acd6abbb.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/26] devtool: edit-recipe: add new subcommand
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:42 -0000

Add an "edit-recipe" subcommand that runs your default editor (as
specified by the EDITOR environment variable) on the specified recipe in
the workspace. Note that by default the recipe file itself must be in
the workspace - i.e. as a result of "devtool add" or "devtool upgrade";
however there is a -a/--any-recipe option to override this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a5e81f3..c11de9d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1140,6 +1140,44 @@ def reset(args, config, basepath, workspace):
     return 0
 
 
+def edit_recipe(args, config, basepath, workspace):
+    """Entry point for the devtool 'edit-recipe' subcommand"""
+    if args.any_recipe:
+        tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+        try:
+            rd = parse_recipe(config, tinfoil, args.recipename, True)
+            if not rd:
+                return 1
+            recipefile = rd.getVar('FILE', True)
+        finally:
+            tinfoil.shutdown()
+    else:
+        check_workspace_recipe(workspace, args.recipename)
+        bbappend = workspace[args.recipename]['bbappend']
+        bbfile = os.path.basename(bbappend).replace('.bbappend', '.bb').replace('%', '*')
+        recipefile = glob.glob(os.path.join(config.workspace_path,
+                                            'recipes',
+                                            args.recipename,
+                                            bbfile))
+        if recipefile:
+            recipefile = recipefile[0]
+        else:
+            raise DevtoolError("Recipe file for %s is not under the workspace" %
+                               args.recipename)
+
+    editor = os.environ.get('EDITOR', None)
+    if not editor:
+        raise DevtoolError("EDITOR environment variable not set")
+
+    import subprocess
+    try:
+        subprocess.check_call('%s "%s"' % (editor, recipefile), shell=True)
+    except subprocess.CalledProcessError as e:
+        return e.returncode
+
+    return 0
+
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
@@ -1204,3 +1242,9 @@ def register_commands(subparsers, context):
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_reset.set_defaults(func=reset)
+
+    parser_edit_recipe = subparsers.add_parser('edit-recipe', help='Edit a recipe file in your workspace',
+                                         description='Runs the default editor (as specified by the EDITOR variable) on the specified recipe. Note that the recipe file itself must be in the workspace (i.e. as a result of "devtool add" or "devtool upgrade"); you can override this with the -a/--any-recipe option.')
+    parser_edit_recipe.add_argument('recipename', help='Recipe to edit')
+    parser_edit_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Edit any recipe, not just where the recipe file itself is in the workspace')
+    parser_edit_recipe.set_defaults(func=edit_recipe)
-- 
2.5.0


