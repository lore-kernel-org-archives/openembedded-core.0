Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id C663C7320C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:50:01 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so151184834wgq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 13:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=UMzwIYu1P8csVVeomuM0k8NOFM4GuiIle1pDSd51Lc4=;
	b=GUlfMVAFXWO0AnWziJcuuOp7nfAD258yB5B8iEoBh1m/Im3hFOadEblBQzppWkT/N7
	s/uRoddgKRHCqgaiUpAH50InT3VvLzIcISlYlRr54OPrm3tiuz8kLPbHEOExECiv3S3G
	kOzYg/lEYDW5w5YRC59Ndoen3a+PS7u6ZaX0OgolfIlcUHMfd73bZM+DyZT0blR4MUPV
	GtmadCVBmfsKRWLB1PtOWlVwCRMnp7x43CuuvLlpq8vKA5Xa0tJCCvF/hyD4+9uyvi8c
	H2BTxOtMJRQjFwb5fE5Ko9guwF00He9hBLnugNZ9WS/CQlDYKzYGIdN10yO1A7dTiBpG
	E2Bw==
X-Received: by 10.194.2.137 with SMTP id 9mr32411661wju.75.1435611002124;
	Mon, 29 Jun 2015 13:50:02 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id a19sm13834151wiv.2.2015.06.29.13.50.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 13:50:00 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 13:50:06 -0700
Message-Id: <397fbab47f7a0a148d451bc94b32d1fb73e45674.1435610769.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <56786ff2078de10d157e2b211ce3d57141e673a8.1435610769.git.kergoth@gmail.com>
References: <56786ff2078de10d157e2b211ce3d57141e673a8.1435610769.git.kergoth@gmail.com>
In-Reply-To: <cover.1435610769.git.kergoth@gmail.com>
References: <cover.1435610769.git.kergoth@gmail.com>
Subject: [PATCH 2/3] recipetool: also load plugins from BBPATH
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
X-List-Received-Date: Mon, 29 Jun 2015 20:50:04 -0000

This makes it easier to extend, as a layer can add its own sub-commands.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/recipetool | 67 ++++++++++++++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index 3063cf7..5ebef6b 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -36,11 +36,8 @@ def tinfoil_init(parserecipes):
     import logging
     tinfoil = bb.tinfoil.Tinfoil()
     tinfoil.prepare(not parserecipes)
-
-    for plugin in plugins:
-        if hasattr(plugin, 'tinfoil_init'):
-            plugin.tinfoil_init(tinfoil)
     tinfoil.logger.setLevel(logger.getEffectiveLevel())
+    return tinfoil
 
 def main():
 
@@ -48,42 +45,58 @@ def main():
         logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
         sys.exit(1)
 
-    parser = argparse.ArgumentParser(description="OpenEmbedded recipe tool",
-                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
-    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
-    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
-    parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
-    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+    def create_global_parser(**kwargs):
+        parser = argparse.ArgumentParser(description="OpenEmbedded recipe tool",
+                                         epilog="Use %(prog)s <subcommand> --help to get help on a specific command", **kwargs)
+        parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+        parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+        parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
+        return parser
+
+    parser = create_global_parser(add_help=False)
+    initial_args, unparsed_args = parser.parse_known_args(sys.argv[1:])
+    if initial_args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif initial_args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    # Re-create the parser here because adding the subparsers doesn't cause
+    # ArgumentParser to re-generate the formatted help text after
+    # parse_known_args()
+    parser = create_global_parser()
+
+    import scriptpath
+    bitbakepath = scriptpath.add_bitbake_lib_path()
+    if not bitbakepath:
+        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+        sys.exit(1)
+    logger.debug('Found bitbake path: %s' % bitbakepath)
 
-    scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'recipetool'))
+    scriptutils.logger_setup_color(logger, initial_args.color)
+
+    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+    tinfoil = tinfoil_init(False)
+    for path in ([scripts_path] +
+                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
+        pluginpath = os.path.join(path, 'lib', 'recipetool')
+        scriptutils.load_plugins(logger, plugins, pluginpath)
     registered = False
     for plugin in plugins:
         if hasattr(plugin, 'register_command'):
             registered = True
             plugin.register_command(subparsers)
+        if hasattr(plugin, 'tinfoil_init'):
+            plugin.tinfoil_init(tinfoil)
 
     if not registered:
         logger.error("No commands registered - missing plugins?")
         sys.exit(1)
 
-    args = parser.parse_args()
-
-    if args.debug:
-        logger.setLevel(logging.DEBUG)
-    elif args.quiet:
-        logger.setLevel(logging.ERROR)
-
-    import scriptpath
-    bitbakepath = scriptpath.add_bitbake_lib_path()
-    if not bitbakepath:
-        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
-        sys.exit(1)
-    logger.debug('Found bitbake path: %s' % bitbakepath)
-
-    scriptutils.logger_setup_color(logger, args.color)
+    args = parser.parse_args(unparsed_args, namespace=initial_args)
 
     try:
-        tinfoil_init(getattr(args, 'parserecipes', False))
+        if getattr(args, 'parserecipes', False):
+            tinfoil.parseRecipes()
         ret = args.func(args)
     except bb.BBHandledException:
         ret = 1
-- 
2.2.1


