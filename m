Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D188973F56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:17:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2015 06:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708359992"
Received: from nshraga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.5.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 06:17:16 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 16:17:01 +0300
Message-Id: <1431350231-29495-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 01/11] devtool: standard plugins: add missing docstrings
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
X-List-Received-Date: Mon, 11 May 2015 13:17:16 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 81a44d4..55580ee 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -14,6 +14,7 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+"""Devtool standard plugins"""
 
 import os
 import sys
@@ -29,10 +30,12 @@ from devtool import exec_build_env_command, setup_tinfoil
 logger = logging.getLogger('devtool')
 
 def plugin_init(pluginlist):
+    """Plugin initialization"""
     pass
 
 
 def add(args, config, basepath, workspace):
+    """Entry point for the devtool 'add' subcommand"""
     import bb
     import oe.recipeutils
 
@@ -120,6 +123,7 @@ def add(args, config, basepath, workspace):
 
 
 def _check_compatible_recipe(pn, d):
+    """Check if the recipe is supported by devtool"""
     if pn == 'perf':
         logger.error("The perf recipe does not actually check out source and thus cannot be supported by this tool")
         return False
@@ -152,6 +156,7 @@ def _check_compatible_recipe(pn, d):
 
 
 def _get_recipe_file(cooker, pn):
+    """Find recipe file corresponding a package name"""
     import oe.recipeutils
     recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
     if not recipefile:
@@ -178,6 +183,7 @@ def _parse_recipe(config, tinfoil, pn, appends):
                                        tinfoil.config_data)
 
 def extract(args, config, basepath, workspace):
+    """Entry point for the devtool 'extract' subcommand"""
     import bb
 
     tinfoil = setup_tinfoil()
@@ -195,9 +201,11 @@ def extract(args, config, basepath, workspace):
 
 
 def _extract_source(srctree, keep_temp, devbranch, d):
+    """Extract sources of a recipe"""
     import bb.event
 
     def eventfilter(name, handler, event, d):
+        """Bitbake event filter for devtool extract operation"""
         if name == 'base_eventhandler':
             return True
         else:
@@ -247,6 +255,7 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         # are to handle e.g. linux-yocto's extra tasks
         executed = []
         def exec_task_func(func, report):
+            """Run specific bitbake task for a recipe"""
             if not func in executed:
                 deps = crd.getVarFlag(func, 'deps')
                 if deps:
@@ -319,12 +328,15 @@ def _extract_source(srctree, keep_temp, devbranch, d):
     return initial_rev
 
 def _add_md5(config, recipename, filename):
+    """Record checksum of a recipe to the md5-file of the workspace"""
     import bb.utils
     md5 = bb.utils.md5_file(filename)
     with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
         f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename, config.workspace_path), md5))
 
 def _check_preserve(config, recipename):
+    """Check if a recipe was manually changed and needs to be saved in 'attic'
+       directory"""
     import bb.utils
     origfile = os.path.join(config.workspace_path, '.devtool_md5')
     newfile = os.path.join(config.workspace_path, '.devtool_md5_new')
@@ -358,6 +370,7 @@ def _check_preserve(config, recipename):
 
 
 def modify(args, config, basepath, workspace):
+    """Entry point for the devtool 'modify' subcommand"""
     import bb
     import oe.recipeutils
 
@@ -457,6 +470,7 @@ def modify(args, config, basepath, workspace):
 
 
 def update_recipe(args, config, basepath, workspace):
+    """Entry point for the devtool 'update-recipe' subcommand"""
     if not args.recipename in workspace:
         logger.error("no recipe named %s in your workspace" % args.recipename)
         return -1
@@ -487,7 +501,7 @@ def update_recipe(args, config, basepath, workspace):
         mode = args.mode
 
     def remove_patches(srcuri, patchlist):
-        # Remove any patches that we don't need
+        """Remove patches"""
         updated = False
         for patch in patchlist:
             patchfile = os.path.basename(patch)
@@ -639,6 +653,7 @@ def update_recipe(args, config, basepath, workspace):
 
 
 def status(args, config, basepath, workspace):
+    """Entry point for the devtool 'status' subcommand"""
     if workspace:
         for recipe, value in workspace.iteritems():
             print("%s: %s" % (recipe, value))
@@ -648,6 +663,7 @@ def status(args, config, basepath, workspace):
 
 
 def reset(args, config, basepath, workspace):
+    """Entry point for the devtool 'reset' subcommand"""
     import bb.utils
     if args.recipename:
         if args.all:
@@ -689,6 +705,7 @@ def reset(args, config, basepath, workspace):
 
 
 def build(args, config, basepath, workspace):
+    """Entry point for the devtool 'build' subcommand"""
     import bb
     if not args.recipename in workspace:
         logger.error("no recipe named %s in your workspace" % args.recipename)
@@ -700,6 +717,7 @@ def build(args, config, basepath, workspace):
 
 
 def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
                                        description='Adds a new recipe')
     parser_add.add_argument('recipename', help='Name for new recipe to add')
-- 
2.1.4


