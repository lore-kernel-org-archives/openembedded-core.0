Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 143857713C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 02:54:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2016 18:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="36152729"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2016 18:54:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 15:53:53 +1300
Message-Id: <dd3f9171c800905b5fe6f3ebe7a453e7d4957bb5.1453776397.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453776397.git.paul.eggleton@linux.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453776397.git.paul.eggleton@linux.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] devtool: move edit-recipe to a separate module
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
X-List-Received-Date: Tue, 26 Jan 2016 02:54:32 -0000

standard.py is getting a bit large; move the "utility" commands to
another module.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 36 ---------------------
 scripts/lib/devtool/utilcmds.py | 70 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 36 deletions(-)
 create mode 100644 scripts/lib/devtool/utilcmds.py

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f19de27..83ec7d8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1258,36 +1258,6 @@ def reset(args, config, basepath, workspace):
     return 0
 
 
-def edit_recipe(args, config, basepath, workspace):
-    """Entry point for the devtool 'edit-recipe' subcommand"""
-    if args.any_recipe:
-        tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
-        try:
-            rd = parse_recipe(config, tinfoil, args.recipename, True)
-            if not rd:
-                return 1
-            recipefile = rd.getVar('FILE', True)
-        finally:
-            tinfoil.shutdown()
-    else:
-        check_workspace_recipe(workspace, args.recipename)
-        recipefile = workspace[args.recipename]['recipefile']
-        if not recipefile:
-            raise DevtoolError("Recipe file for %s is not under the workspace" %
-                               args.recipename)
-
-    editor = os.environ.get('EDITOR', None)
-    if not editor:
-        raise DevtoolError("EDITOR environment variable not set")
-
-    import subprocess
-    try:
-        subprocess.check_call('%s "%s"' % (editor, recipefile), shell=True)
-    except subprocess.CalledProcessError as e:
-        return e.returncode
-
-    return 0
-
 def get_default_srctree(config, recipename=''):
     """Get the default srctree path"""
     srctreeparent = config.get('General', 'default_source_parent_dir', config.workspace_path)
@@ -1365,9 +1335,3 @@ def register_commands(subparsers, context):
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_reset.set_defaults(func=reset)
-
-    parser_edit_recipe = subparsers.add_parser('edit-recipe', help='Edit a recipe file in your workspace',
-                                         description='Runs the default editor (as specified by the EDITOR variable) on the specified recipe. Note that the recipe file itself must be in the workspace (i.e. as a result of "devtool add" or "devtool upgrade"); you can override this with the -a/--any-recipe option.')
-    parser_edit_recipe.add_argument('recipename', help='Recipe to edit')
-    parser_edit_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Edit any recipe, not just where the recipe file itself is in the workspace')
-    parser_edit_recipe.set_defaults(func=edit_recipe)
diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
new file mode 100644
index 0000000..375d7a3
--- /dev/null
+++ b/scripts/lib/devtool/utilcmds.py
@@ -0,0 +1,70 @@
+# Development tool - utility commands plugin
+#
+# Copyright (C) 2015-2016 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+"""Devtool utility plugins"""
+
+import os
+import sys
+import shutil
+import tempfile
+import logging
+import argparse
+import subprocess
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError
+from devtool import parse_recipe
+
+logger = logging.getLogger('devtool')
+
+
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
+        recipefile = workspace[args.recipename]['recipefile']
+        if not recipefile:
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
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_edit_recipe = subparsers.add_parser('edit-recipe', help='Edit a recipe file in your workspace',
+                                         description='Runs the default editor (as specified by the EDITOR variable) on the specified recipe. Note that the recipe file itself must be in the workspace (i.e. as a result of "devtool add" or "devtool upgrade"); you can override this with the -a/--any-recipe option.')
+    parser_edit_recipe.add_argument('recipename', help='Recipe to edit')
+    parser_edit_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Edit any recipe, not just where the recipe file itself is in the workspace')
+    parser_edit_recipe.set_defaults(func=edit_recipe)
-- 
2.5.0


