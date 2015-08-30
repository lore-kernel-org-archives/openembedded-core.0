Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E454176DAA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:33:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2015 09:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758335631"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 09:33:28 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 7A1FF6A4005;
	Sun, 30 Aug 2015 09:32:37 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:33:19 +0300
Message-Id: <1440952399-26609-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] devtool: make plugin_init optional
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
X-List-Received-Date: Sun, 30 Aug 2015 16:33:31 -0000

So far all devtool and recipetool plugins were expected
to have plugin_init function. This function is empty in
most of plugins as they don't require initialisation.

Making plugin_init optional would allow not having empty
plugin_init in every plugin.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py               | 4 ----
 scripts/lib/devtool/deploy.py                    | 5 -----
 scripts/lib/devtool/standard.py                  | 5 -----
 scripts/lib/recipetool/append.py                 | 4 ----
 scripts/lib/recipetool/create_buildsys.py        | 3 ---
 scripts/lib/recipetool/create_buildsys_python.py | 4 ----
 scripts/lib/scriptutils.py                       | 2 +-
 7 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 817703a..2c01428 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -25,10 +25,6 @@ from devtool import exec_build_env_command, setup_tinfoil, parse_recipe
 
 logger = logging.getLogger('devtool')
 
-def plugin_init(pluginlist):
-    """Plugin initialization"""
-    pass
-
 def _get_recipes(workspace, config):
     """Get list of target recipes from the workspace."""
     result = []
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 448db96..fa93adf 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -23,11 +23,6 @@ from devtool import exec_fakeroot, setup_tinfoil, DevtoolError
 
 logger = logging.getLogger('devtool')
 
-def plugin_init(pluginlist):
-    """Plugin initialization"""
-    pass
-
-
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
     import re
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index de7afd9..2507ef9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -31,11 +31,6 @@ from devtool import parse_recipe
 logger = logging.getLogger('devtool')
 
 
-def plugin_init(pluginlist):
-    """Plugin initialization"""
-    pass
-
-
 def add(args, config, basepath, workspace):
     """Entry point for the devtool 'add' subcommand"""
     import bb
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index ed7d0d4..7fe4115 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -33,10 +33,6 @@ logger = logging.getLogger('recipetool')
 
 tinfoil = None
 
-def plugin_init(pluginlist):
-    # Don't need to do anything here right now, but plugins must have this function defined
-    pass
-
 def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 6c9e0ef..ed14a53 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -307,9 +307,6 @@ class MakefileRecipeHandler(RecipeHandler):
             self.genfunction(lines_after, 'do_install', ['# Specify install commands here'])
 
 
-def plugin_init(pluginlist):
-    pass
-
 def register_recipe_handlers(handlers):
     # These are in a specific order so that the right one is detected first
     handlers.append(CmakeRecipeHandler())
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index f4f4212..e0af2a0 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -711,10 +711,6 @@ def has_non_literals(value):
         return any(has_non_literals(v) for v in value)
 
 
-def plugin_init(pluginlist):
-    pass
-
-
 def register_recipe_handlers(handlers):
     # We need to make sure this is ahead of the makefile fallback handler
     handlers.insert(0, PythonRecipeHandler())
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index fdf4b5d..0deecaa 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -57,7 +57,7 @@ def load_plugins(logger, plugins, pluginpath):
             plugin = load_plugin(name)
             if hasattr(plugin, 'plugin_init'):
                 plugin.plugin_init(plugins)
-                plugins.append(plugin)
+            plugins.append(plugin)
 
 def git_convert_standalone_clone(repodir):
     """If specified directory is a git repository, ensure it's a standalone clone"""
-- 
2.1.4


