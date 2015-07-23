Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7E567761E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 19:57:24 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so1219623pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bwF92Qe95ELDL/Lj+TgE1y76CPTSX3UH0HdVh9WqH04=;
	b=ubbFOfCay6ovWGqNm4zRjKzO/nOSg9SDw8yOVV1kEdsQoWJWQoVowNWt/8Alq+Rxbd
	EhN0D0O3LO71FKl8/EAq/1jyWC0Hu1UgK/59RhGhTuwn8Cif66mDLuSUoJ2F14/h7zh8
	EzAe3gPN4Mbu1Swxa7GAiYkItASV+KatgFmGceaC4/LPJKDqykvNcuw3v2+rlNSVJTe8
	1XdA0cAsENlaHRD+7OM5rZIoh7N6TCzm/ZXamp0+mxUCJtT6LA9ArZJdKaJV77fTZbuU
	+j9O8FeSbRA4xnDqK9XewWThZpXpYshEiKNcAFvLI2DGNx7BNNu1O+FsFe2bDuzXCbN+
	KEJA==
X-Received: by 10.70.42.166 with SMTP id p6mr22164459pdl.118.1437681444513;
	Thu, 23 Jul 2015 12:57:24 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id j9sm5019734pdl.65.2015.07.23.12.57.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 12:57:23 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 12:58:10 -0700
Message-Id: <02e74e479b986d8927c39f6711834d7500421721.1437663603.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
References: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3 5/7] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Thu, 23 Jul 2015 19:57:27 -0000

From: Christopher Larson <chris_larson@mentor.com>

This makes it easier to extend, as a layer can add its own sub-commands.

Argument parsing is also separated into two steps, the same way it's done in
recipetool, as we need access to the global command-line arguments early,
before plugins are loaded, both for debugging arguments and for the bitbake
path (we need to load the bitbake module to get tinfoil, which is now needed
to load the plugins).

Rather than constructing tinfoil once and passing it through into sub-commands
for their use, we have to construct it for configuration metadata, use it, and
then shut it down, as some sub-commands call out to recipetool, which needs
its own tinfoil instance, and therefore needs to acquire the bitbake lock. If
we're still holding the lock at that point, that's clearly a problem.

[YOCTO #7625]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/devtool                 | 57 ++++++++++++++++++++++++++---------------
 scripts/lib/devtool/__init__.py |  4 +--
 2 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index fa799f6..557a830 100755
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
+    global_args, unparsed_args = parser.parse_known_args()
 
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
+    if global_args.debug:
         logger.setLevel(logging.DEBUG)
-    elif args.quiet:
+    elif global_args.quiet:
         logger.setLevel(logging.ERROR)
 
-    if args.basepath:
+    if global_args.basepath:
         # Override
-        basepath = args.basepath
+        basepath = global_args.basepath
     elif not context.fixed_setup:
         basepath = os.environ.get('BUILDDIR')
         if not basepath:
@@ -246,7 +237,31 @@ def main():
         logger.debug('Using standard bitbake path %s' % bitbakepath)
         scriptpath.add_oe_lib_path()
 
-    scriptutils.logger_setup_color(logger, args.color)
+    scriptutils.logger_setup_color(logger, global_args.color)
+
+    tinfoil = setup_tinfoil(config_only=True)
+    for path in ([scripts_path] +
+                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
+        pluginpath = os.path.join(path, 'lib', 'devtool')
+        scriptutils.load_plugins(logger, plugins, pluginpath)
+    tinfoil.cooker.shutdown(force=True)
+    tinfoil.cooker.unlockBitbake()
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
+    args = parser.parse_args(unparsed_args, namespace=global_args)
 
     if args.subparser_name != 'create-workspace':
         read_workspace()
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
 
-- 
2.2.1


