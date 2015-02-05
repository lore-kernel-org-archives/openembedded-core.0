Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCF572701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 14:05:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 05 Feb 2015 05:59:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,524,1418112000"; d="scan'208";a="647782347"
Received: from mhgreen-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.49])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2015 06:04:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 14:03:59 +0000
Message-Id: <628a48c41256492cb36dae8500c756e82d1a3dfa.1423144990.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423144990.git.paul.eggleton@linux.intel.com>
References: <cover.1423144990.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423144990.git.paul.eggleton@linux.intel.com>
References: <cover.1423144990.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] devtool: improve command-line help
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
X-List-Received-Date: Thu, 05 Feb 2015 14:05:36 -0000

Based on feedback from Scott Rifenbark <scott.m.rifenbark@intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 | 18 ++++++++++--------
 scripts/lib/devtool/standard.py | 13 ++++++++++---
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index d6e1b97..981ff51 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -112,8 +112,8 @@ def read_workspace():
                     break
 
 def create_workspace(args, config, basepath, workspace):
-    if args.directory:
-        workspacedir = os.path.abspath(args.directory)
+    if args.layerpath:
+        workspacedir = os.path.abspath(args.layerpath)
     else:
         workspacedir = os.path.abspath(os.path.join(basepath, 'workspace'))
     _create_workspace(workspacedir, config, basepath, args.create_only)
@@ -177,18 +177,20 @@ def main():
         pth = os.path.dirname(pth)
 
     parser = argparse.ArgumentParser(description="OpenEmbedded development tool",
-                                     epilog="Use %(prog)s <command> --help to get help on a specific command")
+                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('--basepath', help='Base directory of SDK / build directory')
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
-    parser.add_argument('--color', help='Colorize output', choices=['auto', 'always', 'never'], default='auto')
+    parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
 
-    subparsers = parser.add_subparsers(dest="subparser_name")
+    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
 
     if not context.fixed_setup:
-        parser_create_workspace = subparsers.add_parser('create-workspace', help='Set up a workspace')
-        parser_create_workspace.add_argument('directory', nargs='?', help='Directory for the workspace')
-        parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace, do not alter configuration')
+        parser_create_workspace = subparsers.add_parser('create-workspace',
+                                                        help='Set up a workspace',
+                                                        description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.')
+        parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
+        parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
         parser_create_workspace.set_defaults(func=create_workspace)
 
     scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'devtool'))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 69bb228..ae64840 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -499,6 +499,7 @@ def build(args, config, basepath, workspace):
 
 def register_commands(subparsers, context):
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
+                                       description='Adds a new recipe',
                                        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_add.add_argument('recipename', help='Name for new recipe to add')
     parser_add.add_argument('srctree', help='Path to external source tree')
@@ -506,15 +507,17 @@ def register_commands(subparsers, context):
     parser_add.set_defaults(func=add)
 
     parser_add = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
+                                       description='Enables modifying the source for an existing recipe',
                                        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_add.add_argument('recipename', help='Name for recipe to edit')
     parser_add.add_argument('srctree', help='Path to external source tree')
     parser_add.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
     parser_add.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
-    parser_add.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_add.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x)')
     parser_add.set_defaults(func=modify)
 
     parser_add = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
+                                       description='Extracts the source for an existing recipe',
                                        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_add.add_argument('recipename', help='Name for recipe to extract the source for')
     parser_add.add_argument('srctree', help='Path to where to extract the source tree')
@@ -523,22 +526,26 @@ def register_commands(subparsers, context):
     parser_add.set_defaults(func=extract)
 
     parser_add = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
+                                       description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary)',
                                        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_add.add_argument('recipename', help='Name of recipe to update')
     parser_add.add_argument('--initial-rev', help='Starting revision for patches')
     parser_add.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
     parser_add.set_defaults(func=update_recipe)
 
-    parser_status = subparsers.add_parser('status', help='Show status',
+    parser_status = subparsers.add_parser('status', help='Show workspace status',
+                                          description='Lists recipes currently in your workspace and the paths to their respective external source trees',
                                           formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_status.set_defaults(func=status)
 
-    parser_build = subparsers.add_parser('build', help='Build recipe',
+    parser_build = subparsers.add_parser('build', help='Build a recipe',
+                                         description='Builds the specified recipe using bitbake (up to do_install)',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_build.add_argument('recipename', help='Recipe to build')
     parser_build.set_defaults(func=build)
 
     parser_reset = subparsers.add_parser('reset', help='Remove a recipe from your workspace',
+                                         description='Removes the specified recipe from your workspace (resetting its state)',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_reset.add_argument('recipename', help='Recipe to reset')
     parser_reset.set_defaults(func=reset)
-- 
1.9.3


