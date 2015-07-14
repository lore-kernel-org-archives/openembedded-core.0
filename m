Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 29C4A65D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 15:57:26 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so7778495pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=94Tcd3b5hNqV5KuVTl4j0rBvZt8EVJeuykfDVlMNRvY=;
	b=AEqjmw8BjOVQgECDF84G1lDEfRzOQ0s1hHzxIMr3gSyVkVX7MZ//zM4o9sbR62fQzP
	wvSOE3IsubsYHy5ms6N6bEOjnZG0EKXzQ4iQ0oemZq9pumtXzK3114JyGCsjq7vnSxhC
	foDPmWAmK7I1cm9+LqZpMep/fyDnlo4PnHfbVPSBjZpD9loQ0ROoNsSI1WQahTNMcOnm
	Lwg1dyk6MyvZVoEnjSvSEsK8cjW3pxucHmVU1bT8D4LU83M8Uf7qB4yjozMN2HPA2U72
	p/0G1uIAlUDYgat6ykeyn4Saa/r1LuIk1sVLrm7DJLNiphtltgnfiYMHyTXH05UJOUmD
	12lQ==
X-Received: by 10.66.222.41 with SMTP id qj9mr82519065pac.139.1436889447266;
	Tue, 14 Jul 2015 08:57:27 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id k5sm1781519pdb.53.2015.07.14.08.57.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 08:57:26 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 08:57:41 -0700
Message-Id: <c8597d645516fe31b05cbb958c373ec206bb5a17.1436889188.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
References: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
In-Reply-To: <cover.1436889188.git.chris_larson@mentor.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] recipetool: also load plugins from BBPATH
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
X-List-Received-Date: Tue, 14 Jul 2015 15:57:27 -0000

This makes it easier to extend, as a layer can add its own sub-commands.

[YOCTO #7625]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/recipetool | 52 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index 3063cf7..6061d7b 100755
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
 
@@ -49,28 +46,22 @@ def main():
         sys.exit(1)
 
     parser = argparse.ArgumentParser(description="OpenEmbedded recipe tool",
+                                     add_help=False,
                                      epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
     parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
-    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
-
-    scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'recipetool'))
-    registered = False
-    for plugin in plugins:
-        if hasattr(plugin, 'register_command'):
-            registered = True
-            plugin.register_command(subparsers)
 
-    if not registered:
-        logger.error("No commands registered - missing plugins?")
-        sys.exit(1)
+    initial_args, unparsed_args = parser.parse_known_args(sys.argv[1:])
 
-    args = parser.parse_args()
+    # Help is added here rather than via add_help=True, as we don't want it to
+    # be handled by parse_known_args()
+    parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
+                        help='show this help message and exit')
 
-    if args.debug:
+    if initial_args.debug:
         logger.setLevel(logging.DEBUG)
-    elif args.quiet:
+    elif initial_args.quiet:
         logger.setLevel(logging.ERROR)
 
     import scriptpath
@@ -80,10 +71,31 @@ def main():
         sys.exit(1)
     logger.debug('Found bitbake path: %s' % bitbakepath)
 
-    scriptutils.logger_setup_color(logger, args.color)
+    scriptutils.logger_setup_color(logger, initial_args.color)
+
+    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+    tinfoil = tinfoil_init(False)
+    for path in ([scripts_path] +
+                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
+        pluginpath = os.path.join(path, 'lib', 'recipetool')
+        scriptutils.load_plugins(logger, plugins, pluginpath)
+    registered = False
+    for plugin in plugins:
+        if hasattr(plugin, 'register_command'):
+            registered = True
+            plugin.register_command(subparsers)
+        if hasattr(plugin, 'tinfoil_init'):
+            plugin.tinfoil_init(tinfoil)
+
+    if not registered:
+        logger.error("No commands registered - missing plugins?")
+        sys.exit(1)
+
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


