Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D125A7414A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963912"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:45:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:07 +0100
Message-Id: <4de64e1e78740992b1ccfdaa37a1355b4416c82d.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/9] devtool: add missing docstrings
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
X-List-Received-Date: Thu, 14 May 2015 17:45:54 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/__init__.py |  5 ++++-
 scripts/lib/devtool/deploy.py   |  6 +++++-
 scripts/lib/devtool/standard.py | 20 +++++++++++++++++++-
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index f19d032..8866512 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -16,7 +16,7 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-
+"""Devtool plugins module"""
 
 import os
 import sys
@@ -26,6 +26,7 @@ import logging
 logger = logging.getLogger('devtool')
 
 def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
+    """Run a program in bitbake build context"""
     import bb
     if not 'cwd' in options:
         options["cwd"] = builddir
@@ -49,6 +50,7 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
         return bb.process.run('%s%s' % (init_prefix, cmd), **options)
 
 def exec_watch(cmd, **options):
+    """Run program with stdout shown on sys.stdout"""
     if isinstance(cmd, basestring) and not "shell" in options:
         options["shell"] = True
 
@@ -68,6 +70,7 @@ def exec_watch(cmd, **options):
     return buf
 
 def setup_tinfoil():
+    """Initialize tinfoil api from bitbake"""
     import scriptpath
     bitbakepath = scriptpath.add_bitbake_lib_path()
     if not bitbakepath:
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 4f968c6..3c7abfa 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -14,6 +14,7 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+"""Devtool plugin containing the deploy subcommands"""
 
 import os
 import subprocess
@@ -23,10 +24,12 @@ from devtool import exec_build_env_command
 logger = logging.getLogger('devtool')
 
 def plugin_init(pluginlist):
+    """Plugin initialization"""
     pass
 
 
 def deploy(args, config, basepath, workspace):
+    """Entry point for the devtool 'deploy' subcommand"""
     import re
 
     if not args.recipename in workspace:
@@ -87,7 +90,7 @@ def deploy(args, config, basepath, workspace):
     return 0
 
 def undeploy(args, config, basepath, workspace):
-
+    """Entry point for the devtool 'undeploy' subcommand"""
     deploy_file = os.path.join(basepath, 'target_deploy', args.target, args.recipename + '.list')
     if not os.path.exists(deploy_file):
          logger.error('%s has not been deployed' % args.recipename)
@@ -122,6 +125,7 @@ def undeploy(args, config, basepath, workspace):
 
 
 def register_commands(subparsers, context):
+    """Register devtool subcommands from the deploy plugin"""
     parser_deploy = subparsers.add_parser('deploy-target', help='Deploy recipe output files to live target machine')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a9dd3b2..2f8b194 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -14,6 +14,7 @@
 # You should have received a copy of the GNU General Public License along
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+"""Devtool standard plugins"""
 
 import os
 import sys
@@ -28,10 +29,12 @@ from devtool import exec_build_env_command, setup_tinfoil
 logger = logging.getLogger('devtool')
 
 def plugin_init(pluginlist):
+    """Plugin initialization"""
     pass
 
 
 def add(args, config, basepath, workspace):
+    """Entry point for the devtool 'add' subcommand"""
     import bb
     import oe.recipeutils
 
@@ -119,6 +122,7 @@ def add(args, config, basepath, workspace):
 
 
 def _check_compatible_recipe(pn, d):
+    """Check if the recipe is supported by devtool"""
     if pn == 'perf':
         logger.error("The perf recipe does not actually check out source and thus cannot be supported by this tool")
         return False
@@ -151,6 +155,7 @@ def _check_compatible_recipe(pn, d):
 
 
 def _get_recipe_file(cooker, pn):
+    """Find recipe file corresponding a package name"""
     import oe.recipeutils
     recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
     if not recipefile:
@@ -187,6 +192,7 @@ def _ls_tree(directory):
 
 
 def extract(args, config, basepath, workspace):
+    """Entry point for the devtool 'extract' subcommand"""
     import bb
 
     tinfoil = setup_tinfoil()
@@ -204,10 +210,12 @@ def extract(args, config, basepath, workspace):
 
 
 def _extract_source(srctree, keep_temp, devbranch, d):
+    """Extract sources of a recipe"""
     import bb.event
     import oe.recipeutils
 
     def eventfilter(name, handler, event, d):
+        """Bitbake event filter for devtool extract operation"""
         if name == 'base_eventhandler':
             return True
         else:
@@ -257,6 +265,7 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         # are to handle e.g. linux-yocto's extra tasks
         executed = []
         def exec_task_func(func, report):
+            """Run specific bitbake task for a recipe"""
             if not func in executed:
                 deps = crd.getVarFlag(func, 'deps')
                 if deps:
@@ -343,12 +352,15 @@ def _extract_source(srctree, keep_temp, devbranch, d):
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
@@ -382,6 +394,7 @@ def _check_preserve(config, recipename):
 
 
 def modify(args, config, basepath, workspace):
+    """Entry point for the devtool 'modify' subcommand"""
     import bb
     import oe.recipeutils
 
@@ -481,6 +494,7 @@ def modify(args, config, basepath, workspace):
 
 
 def update_recipe(args, config, basepath, workspace):
+    """Entry point for the devtool 'update-recipe' subcommand"""
     if not args.recipename in workspace:
         logger.error("no recipe named %s in your workspace" % args.recipename)
         return -1
@@ -511,7 +525,7 @@ def update_recipe(args, config, basepath, workspace):
         mode = args.mode
 
     def remove_patches(srcuri, patchlist):
-        # Remove any patches that we don't need
+        """Remove patches"""
         updated = False
         for patch in patchlist:
             patchfile = os.path.basename(patch)
@@ -663,6 +677,7 @@ def update_recipe(args, config, basepath, workspace):
 
 
 def status(args, config, basepath, workspace):
+    """Entry point for the devtool 'status' subcommand"""
     if workspace:
         for recipe, value in workspace.iteritems():
             print("%s: %s" % (recipe, value))
@@ -672,6 +687,7 @@ def status(args, config, basepath, workspace):
 
 
 def reset(args, config, basepath, workspace):
+    """Entry point for the devtool 'reset' subcommand"""
     import bb.utils
     if args.recipename:
         if args.all:
@@ -713,6 +729,7 @@ def reset(args, config, basepath, workspace):
 
 
 def build(args, config, basepath, workspace):
+    """Entry point for the devtool 'build' subcommand"""
     import bb
     if not args.recipename in workspace:
         logger.error("no recipe named %s in your workspace" % args.recipename)
@@ -724,6 +741,7 @@ def build(args, config, basepath, workspace):
 
 
 def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
                                        description='Adds a new recipe')
     parser_add.add_argument('recipename', help='Name for new recipe to add')
-- 
2.1.0


