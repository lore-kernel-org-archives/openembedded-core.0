Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id EED3575979
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 22:15:18 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so107741579pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TTaWoMFblhOaGTWxW++sEpBHKMNeG4pcWbmCCtgP6z4=;
	b=Wskn2UIJbb3jrCqSKOZXP/ZHJZeTWPMfR8y+wxB8T+Gup0g6uLLM/XS00Bukl/wjIy
	lqqkzGoA0RwE0vHMTLNmZnqmX/J4Wd2NZsENinuDJ5SJMa/9Iza0js39Nxn5v9wZ5dLA
	feauOUfXdW4+MpBzje9wJ6iK/Xi5fgg/Yl1AIoAaNjaM8cFMQl5jH6+TZuDfLN6mPm3v
	5KtPO4X4VPnHqpTcK5/cDGzGZozAtFrKRe0tpH7k0iBP3l1InaHRijg/z6EuVQjcNiXM
	vcm+4+xR4nP6VDWLYUVosxah2kmKXOuObJUd21nL+5fMDghSpxk0CJ7urCPkvIqXjagp
	eccw==
X-Received: by 10.67.4.138 with SMTP id ce10mr65666625pad.102.1437430518696;
	Mon, 20 Jul 2015 15:15:18 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	f1sm23612727pdp.39.2015.07.20.15.15.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 15:15:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 15:15:53 -0700
Message-Id: <62a5e84af02b4ed03f1e6a9516c718b98be20689.1437430369.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437430369.git.chris_larson@mentor.com>
References: <cover.1437430369.git.chris_larson@mentor.com>
Subject: [PATCHv2 3/6] recipetool: also load plugins from BBPATH
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
X-List-Received-Date: Mon, 20 Jul 2015 22:15:21 -0000

This makes it easier to extend, as a layer can add its own sub-commands.

[YOCTO #7625]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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


