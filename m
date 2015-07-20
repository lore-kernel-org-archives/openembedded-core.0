Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5881C75979
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 22:15:20 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so107847522pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dfz4J8C2PSFHdQCJYAhOlm/m4D1Uh0M/leGX3IKuPuI=;
	b=kVJMWx9/lcJPu40IjBD95OnWjh/9X3Oow8CxUeKy3ZfzAffM9KjDwwEurtQUPUh5/f
	c+lwI2TUpQX5RdY5JK/5JeW4iSwBtXko0c2ChQupxqoHSGpL4dXlJXO39Mz6j9xFwMKE
	+/B/p2l2uOISxg1sHpODrXt0WIDndnq7S9wbFB/OiJ/UpT7LlJHEnLwXKm7synSqWAS1
	Xw1a7A9CmokdochRyo8NKaZADt+5u6dYO9+aZEKoEBPlXROtl1xlmfgXkhm3+6pfHpx/
	O0Nxf4zGKbfmqhigBZQSy6LkO708nsi1aTILbdrVA2gh7VXgERtmVcuFgs3wrMKm6+Ib
	USiQ==
X-Received: by 10.66.121.163 with SMTP id ll3mr66447399pab.100.1437430521205; 
	Mon, 20 Jul 2015 15:15:21 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	f1sm23612727pdp.39.2015.07.20.15.15.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 15:15:20 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 15:15:54 -0700
Message-Id: <019657e96ff75872fb4bf93661118fcd3d670188.1437430369.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437430369.git.chris_larson@mentor.com>
References: <cover.1437430369.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 4/6] devtool: also load plugins from BBPATH
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
X-List-Received-Date: Mon, 20 Jul 2015 22:15:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

This makes it easier to extend, as a layer can add its own sub-commands.

tinfoil is now passed into the commands, as we needed to parse the
configuration metadata to get BBPATH, and we don't want to construct tinfoil
more than once, otherwise we have to deal with startup and shutdown of cooker.

[YOCTO #7625]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/devtool                 | 57 ++++++++++++++++++++++++++---------------
 scripts/lib/devtool/__init__.py |  4 +--
 2 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index fa799f6..b2ffc31 100755
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
@@ -246,7 +237,31 @@ def main():
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
+    args = parser.parse_args(unparsed_args, namespace=initial_args)
 
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


