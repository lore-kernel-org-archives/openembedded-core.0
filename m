Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 58D566E682
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:11:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213513"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:11:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:34 +1300
Message-Id: <ffb67e8e1512e7d48282a5d1b0d7ef3401684e21.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 15/18] devtool: clarify help text
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:15 -0000

* Make some minor clarifications to help text
* Drop ArgumentDefaultsHelpFormatter and just put the defaults in the
  text itself where needed (because otherwise you get defaults shown for
  store_true options which is somewhat confusing).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 |  2 +-
 scripts/lib/devtool/build.py    |  3 +--
 scripts/lib/devtool/standard.py | 28 ++++++++++++----------------
 scripts/lib/devtool/upgrade.py  |  4 ++--
 4 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 1fcb42c..9d3287c 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -258,7 +258,7 @@ def main():
 
     if not context.fixed_setup:
         parser_create_workspace = subparsers.add_parser('create-workspace',
-                                                        help='Set up a workspace',
+                                                        help='Set up workspace in an alternative location',
                                                         description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.')
         parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
         parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 0b8e88b..a9a0778 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -73,8 +73,7 @@ def build(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_build = subparsers.add_parser('build', help='Build a recipe',
-                                         description='Builds the specified recipe using bitbake (up to and including do_%s)' % _get_build_task(context.config),
-                                         formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+                                         description='Builds the specified recipe using bitbake (up to and including do_%s)' % _get_build_task(context.config))
     parser_build.add_argument('recipename', help='Recipe to build')
     parser_build.add_argument('-s', '--disable-parallel-make', action="store_true", help='Disable make parallelism')
     parser_build.set_defaults(func=build)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index bc92456..274d0fc 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1085,8 +1085,8 @@ def reset(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
-                                       description='Adds a new recipe')
-    parser_add.add_argument('recipename', help='Name for new recipe to add')
+                                       description='Adds a new recipe to the workspace to build a specified source tree')
+    parser_add.add_argument('recipename', help='Name for new recipe to add (just name - no version, path or extension)')
     parser_add.add_argument('srctree', help='Path to external source tree')
     group = parser_add.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
@@ -1098,45 +1098,41 @@ def register_commands(subparsers, context):
     parser_add.set_defaults(func=add)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
-                                       description='Enables modifying the source for an existing recipe',
-                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
-    parser_modify.add_argument('recipename', help='Name for recipe to edit')
+                                       description='Enables modifying the source for an existing recipe')
+    parser_modify.add_argument('recipename', help='Name of existing recipe to edit (just name - no version, path or extension)')
     parser_modify.add_argument('srctree', help='Path to external source tree')
     parser_modify.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
     parser_modify.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
     group = parser_modify.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
-    parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x)')
+    parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x) (default "%(default)s")')
     parser_modify.set_defaults(func=modify)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-                                       description='Extracts the source for an existing recipe',
-                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
-    parser_extract.add_argument('recipename', help='Name for recipe to extract the source for')
+                                       description='Extracts the source for an existing recipe')
+    parser_extract.add_argument('recipename', help='Name of recipe to extract the source for')
     parser_extract.add_argument('srctree', help='Path to where to extract the source tree')
-    parser_extract.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_extract.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (default "%(default)s")')
     parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_extract.set_defaults(func=extract, no_workspace=True)
 
     parser_update_recipe = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
-                                       description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV)')
+                                       description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV). Note that these changes need to have been committed to the git repository in order to be recognised.')
     parser_update_recipe.add_argument('recipename', help='Name of recipe to update')
     parser_update_recipe.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
-    parser_update_recipe.add_argument('--initial-rev', help='Starting revision for patches')
+    parser_update_recipe.add_argument('--initial-rev', help='Override starting revision for patches')
     parser_update_recipe.add_argument('--append', '-a', help='Write changes to a bbappend in the specified layer instead of the recipe', metavar='LAYERDIR')
     parser_update_recipe.add_argument('--wildcard-version', '-w', help='In conjunction with -a/--append, use a wildcard to make the bbappend apply to any recipe version', action='store_true')
     parser_update_recipe.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
     parser_update_recipe.set_defaults(func=update_recipe)
 
     parser_status = subparsers.add_parser('status', help='Show workspace status',
-                                          description='Lists recipes currently in your workspace and the paths to their respective external source trees',
-                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+                                          description='Lists recipes currently in your workspace and the paths to their respective external source trees')
     parser_status.set_defaults(func=status)
 
     parser_reset = subparsers.add_parser('reset', help='Remove a recipe from your workspace',
-                                         description='Removes the specified recipe from your workspace (resetting its state)',
-                                         formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+                                         description='Removes the specified recipe from your workspace (resetting its state)')
     parser_reset.add_argument('recipename', nargs='?', help='Recipe to reset')
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 761aa99..7bbb915 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -361,8 +361,8 @@ def upgrade(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_upgrade = subparsers.add_parser('upgrade', help='Upgrade an existing recipe',
-                                           description='Upgrades an existing recipe to a new upstream version')
-    parser_upgrade.add_argument('recipename', help='Name for recipe to extract the source for')
+                                           description='Upgrades an existing recipe to a new upstream version. Puts the upgraded recipe file into the workspace along with any associated files, and extracts the source tree to a specified location (in case patches need rebasing or adding to as a result of the upgrade).')
+    parser_upgrade.add_argument('recipename', help='Name of recipe to upgrade (just name - no version, path or extension)')
     parser_upgrade.add_argument('srctree', help='Path to where to extract the source tree')
     parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV)')
     parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (if fetching from an SCM such as git)')
-- 
2.1.0


