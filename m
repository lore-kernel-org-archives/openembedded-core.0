Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 366C175EA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 15:57:28 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so7778943pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rxTTzHmZOIz6Dj2gYDLDVqlN3VTZR+BNJLRO9F6Bcw0=;
	b=H0iNt4dpzJnGYXdvN+eRhueMm3JM9QOeJIObDQP45U/NOWXl+0zZbvxHJuNBFd/14w
	NIxt01FGBdkqWbE3Rs8p52FgHk2iJr8n8QFZnV0YN7BdetUlvVn7riZxS3GrUH/JnzPr
	1Wce1ZRKyWule5n9NM1diJvJ1BnuVLrF3189otv23JrYr/yrW5N1K/j5Q/NVbpttSn2p
	bCoqJCUH06V+5l6E9kGrGyGrYbHIN3qLOhaVzQOnpAYqry/itW5xP1FHCQ4S6H9O+XDN
	J02c/VBcVm+7Z7tYhu5pASly22YUQc1oili7iP1pFbs9SH1XsDQ3obyTZUz/XynR3amY
	doIQ==
X-Received: by 10.70.94.98 with SMTP id db2mr82839882pdb.130.1436889449169;
	Tue, 14 Jul 2015 08:57:29 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id k5sm1781519pdb.53.2015.07.14.08.57.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 08:57:28 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 08:57:42 -0700
Message-Id: <34337e7400db6002b7d708a32609e2731d908a1f.1436889188.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
References: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
In-Reply-To: <cover.1436889188.git.chris_larson@mentor.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/6] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Tue, 14 Jul 2015 15:57:31 -0000

From: Christopher Larson <chris_larson@mentor.com>

This makes it easier to extend, as a layer can add its own sub-commands.

tinfoil is now passed into the commands, as we needed to parse the
configuration metadata to get BBPATH, and we don't want to construct tinfoil
more than once, otherwise we have to deal with startup and shutdown of cooker.

[YOCTO #7625]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/devtool                 | 57 +++++++++++++++++++++++++----------------
 scripts/lib/devtool/__init__.py |  4 +--
 scripts/lib/devtool/deploy.py   |  6 ++---
 scripts/lib/devtool/standard.py | 15 +++++------
 4 files changed, 46 insertions(+), 36 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index fa799f6..01bb412 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -35,7 +35,7 @@ context = None
 scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
-from devtool import DevtoolError
+from devtool import DevtoolError, setup_tinfoil
 import scriptutils
 logger = scriptutils.logger_create('devtool')
 
@@ -186,37 +186,28 @@ def main():
         pth = os.path.dirname(pth)
 
     parser = argparse.ArgumentParser(description="OpenEmbedded development tool",
+                                     add_help=False,
                                      epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('--basepath', help='Base directory of SDK / build directory')
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
     parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
 
-    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
+    initial_args, unparsed_args = parser.parse_known_args()
 
-    if not context.fixed_setup:
-        parser_create_workspace = subparsers.add_parser('create-workspace',
-                                                        help='Set up a workspace',
-                                                        description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.')
-        parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
-        parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
-        parser_create_workspace.set_defaults(func=create_workspace)
+    # Help is added here rather than via add_help=True, as we don't want it to
+    # be handled by parse_known_args()
+    parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
+                        help='show this help message and exit')
 
-    scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'devtool'))
-    for plugin in plugins:
-        if hasattr(plugin, 'register_commands'):
-            plugin.register_commands(subparsers, context)
-
-    args = parser.parse_args()
-
-    if args.debug:
+    if initial_args.debug:
         logger.setLevel(logging.DEBUG)
-    elif args.quiet:
+    elif initial_args.quiet:
         logger.setLevel(logging.ERROR)
 
-    if args.basepath:
+    if initial_args.basepath:
         # Override
-        basepath = args.basepath
+        basepath = initial_args.basepath
     elif not context.fixed_setup:
         basepath = os.environ.get('BUILDDIR')
         if not basepath:
@@ -246,13 +237,35 @@ def main():
         logger.debug('Using standard bitbake path %s' % bitbakepath)
         scriptpath.add_oe_lib_path()
 
-    scriptutils.logger_setup_color(logger, args.color)
+    scriptutils.logger_setup_color(logger, initial_args.color)
+
+    tinfoil = setup_tinfoil(config_only=True)
+    for path in ([scripts_path] +
+                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
+        pluginpath = os.path.join(path, 'lib', 'devtool')
+        scriptutils.load_plugins(logger, plugins, pluginpath)
+
+    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
+
+    if not context.fixed_setup:
+        parser_create_workspace = subparsers.add_parser('create-workspace',
+                                                        help='Set up a workspace',
+                                                        description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.')
+        parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
+        parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
+        parser_create_workspace.set_defaults(func=create_workspace)
+
+    for plugin in plugins:
+        if hasattr(plugin, 'register_commands'):
+            plugin.register_commands(subparsers, context)
+
+    args = parser.parse_args(unparsed_args, namespace=initial_args)
 
     if args.subparser_name != 'create-workspace':
         read_workspace()
 
     try:
-        ret = args.func(args, config, basepath, workspace)
+        ret = args.func(args, config, basepath, workspace, tinfoil)
     except DevtoolError as err:
         if str(err):
             logger.error(str(err))
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 61b810c..b54ddf5 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -96,7 +96,7 @@ def exec_fakeroot(d, cmd, **kwargs):
             newenv[splitval[0]] = splitval[1]
     return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv, **kwargs)
 
-def setup_tinfoil():
+def setup_tinfoil(config_only=False):
     """Initialize tinfoil api from bitbake"""
     import scriptpath
     bitbakepath = scriptpath.add_bitbake_lib_path()
@@ -106,7 +106,7 @@ def setup_tinfoil():
 
     import bb.tinfoil
     tinfoil = bb.tinfoil.Tinfoil()
-    tinfoil.prepare(False)
+    tinfoil.prepare(config_only)
     tinfoil.logger.setLevel(logger.getEffectiveLevel())
     return tinfoil
 
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 448db96..3bc59de 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -28,7 +28,7 @@ def plugin_init(pluginlist):
     pass
 
 
-def deploy(args, config, basepath, workspace):
+def deploy(args, config, basepath, workspace, tinfoil):
     """Entry point for the devtool 'deploy' subcommand"""
     import re
     import oe.recipeutils
@@ -46,7 +46,7 @@ def deploy(args, config, basepath, workspace):
     deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
     deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
 
-    tinfoil = setup_tinfoil()
+    tinfoil.parseRecipes()
     try:
         rd = oe.recipeutils.parse_recipe_simple(tinfoil.cooker, args.recipename, tinfoil.config_data)
     except Exception as e:
@@ -100,7 +100,7 @@ def deploy(args, config, basepath, workspace):
 
     return 0
 
-def undeploy(args, config, basepath, workspace):
+def undeploy(args, config, basepath, workspace, tinfoil):
     """Entry point for the devtool 'undeploy' subcommand"""
     deploy_file = os.path.join(basepath, 'target_deploy', args.target, args.recipename + '.list')
     if not os.path.exists(deploy_file):
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ea21877..8fe32b7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -193,12 +193,11 @@ def _ls_tree(directory):
     return ret
 
 
-def extract(args, config, basepath, workspace):
+def extract(args, config, basepath, workspace, tinfoil):
     """Entry point for the devtool 'extract' subcommand"""
     import bb
 
-    tinfoil = setup_tinfoil()
-
+    tinfoil.parseRecipes()
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
         return 1
@@ -409,7 +408,7 @@ def _check_preserve(config, recipename):
                     tf.write(line)
     os.rename(newfile, origfile)
 
-def modify(args, config, basepath, workspace):
+def modify(args, config, basepath, workspace, tinfoil):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
     import oe.recipeutils
@@ -423,8 +422,7 @@ def modify(args, config, basepath, workspace):
                            "(specify -x to extract source from recipe)" %
                            args.srctree)
 
-    tinfoil = setup_tinfoil()
-
+    tinfoil.parseRecipes()
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
         return 1
@@ -747,7 +745,7 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
 
     _remove_patch_files(args, removepatches, destpath)
 
-def update_recipe(args, config, basepath, workspace):
+def update_recipe(args, config, basepath, workspace, tinfoil):
     """Entry point for the devtool 'update-recipe' subcommand"""
     if not args.recipename in workspace:
         raise DevtoolError("no recipe named %s in your workspace" %
@@ -761,8 +759,7 @@ def update_recipe(args, config, basepath, workspace):
             raise DevtoolError('conf/layer.conf not found in bbappend '
                                'destination layer "%s"' % args.append)
 
-    tinfoil = setup_tinfoil()
-
+    tinfoil.parseRecipes()
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
         return 1
-- 
2.2.1


