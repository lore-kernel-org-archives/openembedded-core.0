Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D15E67701D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520265"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:21:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:24 +0100
Message-Id: <fb47af4c61a5023bc43d30a03debcaf1d03696b9.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/27] devtool: check that source tree still exists
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:13 -0000

Sometimes, particularly if you extracted the source to /tmp which is on
tmpfs, the external source tree that is being pointed to may no longer
exist when you come to run "devtool build" or "devtool update-recipe"
etc. Make all of the commands that need to check for a recipe being in
the workspace call a single function and have that function additionally
check the source tree still exists where appropriate.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 14 ++++++++++++++
 scripts/lib/devtool/build.py    |  6 ++----
 scripts/lib/devtool/deploy.py   |  7 +++----
 scripts/lib/devtool/package.py  |  6 ++----
 scripts/lib/devtool/standard.py | 11 ++++-------
 5 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 404d3e6..fb699b5 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -136,3 +136,17 @@ def parse_recipe(config, tinfoil, pn, appends):
                         not path.startswith(config.workspace_path)]
     return oe.recipeutils.parse_recipe(recipefile, append_files,
                                        tinfoil.config_data)
+
+def check_workspace_recipe(workspace, pn, checksrc=True):
+    """
+    Check that a recipe is in the workspace and (optionally) that source
+    is present.
+    """
+    if not pn in workspace:
+        raise DevtoolError("No recipe named '%s' in your workspace" % pn)
+    if checksrc:
+        srctree = workspace[pn]['srctree']
+        if not os.path.exists(srctree):
+            raise DevtoolError("Source tree %s for recipe %s does not exist" % (srctree, pn))
+        if not os.listdir(srctree):
+            raise DevtoolError("Source tree %s for recipe %s is empty" % (srctree, pn))
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 335aff5..9b58858 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -21,7 +21,7 @@ import bb
 import logging
 import argparse
 import tempfile
-from devtool import exec_build_env_command, DevtoolError
+from devtool import exec_build_env_command, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -42,9 +42,7 @@ def _create_conf_file(values, conf_file=None):
 
 def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
-    if not args.recipename in workspace:
-        raise DevtoolError("no recipe named %s in your workspace" %
-                           args.recipename)
+    check_workspace_recipe(workspace, args.recipename)
 
     build_task = config.get('Build', 'build_task', 'populate_sysroot')
 
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index fa93adf..41b666f 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -19,7 +19,7 @@
 import os
 import subprocess
 import logging
-from devtool import exec_fakeroot, setup_tinfoil, DevtoolError
+from devtool import exec_fakeroot, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -28,9 +28,8 @@ def deploy(args, config, basepath, workspace):
     import re
     import oe.recipeutils
 
-    if not args.recipename in workspace:
-        raise DevtoolError("no recipe named %s in your workspace" %
-                           args.recipename)
+    check_workspace_recipe(workspace, args.recipename, checksrc=False)
+
     try:
         host, destdir = args.target.split(':')
     except ValueError:
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index 3a7a36b..28ecfed 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -20,7 +20,7 @@ import os
 import subprocess
 import logging
 from bb.process import ExecutionError
-from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -30,9 +30,7 @@ def plugin_init(pluginlist):
 
 def package(args, config, basepath, workspace):
     """Entry point for the devtool 'package' subcommand"""
-    if not args.recipename in workspace:
-        raise DevtoolError("no recipe named %s in your workspace" %
-                           args.recipename)
+    check_workspace_recipe(workspace, args.recipename)
 
     image_pkgtype = config.get('Package', 'image_pkgtype', '')
     if not image_pkgtype:
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d5900b4..018ef2a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -25,7 +25,7 @@ import logging
 import argparse
 import scriptutils
 import errno
-from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -776,9 +776,7 @@ def _guess_recipe_update_mode(srctree, rdata):
 
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
-    if not args.recipename in workspace:
-        raise DevtoolError("no recipe named %s in your workspace" %
-                           args.recipename)
+    check_workspace_recipe(workspace, args.recipename)
 
     if args.append:
         if not os.path.exists(args.append):
@@ -830,9 +828,8 @@ def reset(args, config, basepath, workspace):
     if args.recipename:
         if args.all:
             raise DevtoolError("Recipe cannot be specified if -a/--all is used")
-        elif not args.recipename in workspace:
-            raise DevtoolError("no recipe named %s in your workspace" %
-                               args.recipename)
+        else:
+            check_workspace_recipe(workspace, args.recipename, checksrc=False)
     elif not args.all:
         raise DevtoolError("Recipe must be specified, or specify -a/--all to "
                            "reset all recipes")
-- 
2.1.0


