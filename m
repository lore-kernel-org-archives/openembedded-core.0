Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A6A85731B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272694"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:52 +1300
Message-Id: <61cf082dc4dc6fba8266a6dcbe89001ca5206406.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/14] devtool: add sdk-install subcommand
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:18 -0000

Add the ability to install additional pre-built items (from shared
state) into the extensible SDK. This can already be done implicitly by
adding something to DEPENDS within a recipe you're working on and then
running "devtool build", but it's useful to be able to explicitly
install things particularly if you're using the extensible SDK as a
traditional toolchain.

Note that for this command to be useful you need to have SSTATE_MIRRORS
set in your SDK configuration, and that mirror needs to be populated
with sstate artifacts for recipes you wish to be able to install.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 63 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 80ea871..12de942 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -8,7 +8,7 @@ import shutil
 import errno
 import sys
 import tempfile
-from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -235,6 +235,64 @@ def sdk_update(args, config, basepath, workspace):
             return -1
     return 0
 
+def sdk_install(args, config, basepath, workspace):
+    """Entry point for the devtool sdk-install command"""
+
+    import oe.recipeutils
+    import bb.process
+
+    for recipe in args.recipename:
+        if recipe in workspace:
+            raise DevtoolError('recipe %s is a recipe in your workspace' % recipe)
+
+    tasks = ['do_populate_sysroot', 'do_packagedata']
+    stampprefixes = {}
+    def checkstamp(recipe):
+        stampprefix = stampprefixes[recipe]
+        stamps = glob.glob(stampprefix + '*')
+        for stamp in stamps:
+            if '.sigdata.' not in stamp and stamp.startswith((stampprefix + '.', stampprefix + '_setscene.')):
+                return True
+        else:
+            return False
+
+    install_recipes = []
+    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+    try:
+        for recipe in args.recipename:
+            rd = parse_recipe(config, tinfoil, recipe, True)
+            if not rd:
+                return 1
+            stampprefixes[recipe] = '%s.%s' % (rd.getVar('STAMP', True), tasks[0])
+            if checkstamp(recipe):
+                logger.info('%s is already installed' % recipe)
+            else:
+                install_recipes.append(recipe)
+    finally:
+        tinfoil.shutdown()
+
+    if install_recipes:
+        logger.info('Installing %s...' % ', '.join(install_recipes))
+        install_tasks = []
+        for recipe in install_recipes:
+            for task in tasks:
+                if recipe.endswith('-native') and 'package' in task:
+                    continue
+                install_tasks.append('%s:%s' % (recipe, task))
+        try:
+            exec_build_env_command(config.init_path, basepath, 'bitbake --setscene-only %s' % ' '.join(install_tasks))
+        except bb.process.ExecutionError as e:
+            raise DevtoolError('Failed to install %s:\n%s' % (recipe, str(e)))
+        failed = False
+        for recipe in install_recipes:
+            if checkstamp(recipe):
+                logger.info('Successfully installed %s' % recipe)
+            else:
+                raise DevtoolError('Failed to install %s - unavailable' % recipe)
+                failed = True
+        if failed:
+            return 2
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from the sdk plugin"""
     if context.fixed_setup:
@@ -242,3 +300,6 @@ def register_commands(subparsers, context):
         parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from', nargs='?')
         parser_sdk.add_argument('--skip-prepare', action="store_true", help='Skip re-preparing the build system after updating (for debugging only)')
         parser_sdk.set_defaults(func=sdk_update)
+        parser_sdk_install = subparsers.add_parser('sdk-install', help='Install additional SDK components', description='Installs additional recipe development files into the SDK. (You can use "devtool search" to find available recipes.)')
+        parser_sdk_install.add_argument('recipename', help='Name of the recipe to install the development artifacts for', nargs='+')
+        parser_sdk_install.set_defaults(func=sdk_install)
-- 
2.5.0


