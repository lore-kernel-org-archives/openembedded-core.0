Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id F034F761D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 19:57:20 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so1215406pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oYEP+1ilh91Z+sZfLvcY15Uapx7Lux7kt2gDhQ1/d18=;
	b=NE7194sjl//f01vAEjdm7mBbyR8jy5dWRCs/xpTg+Ot8/5rJLNKU8CZCF1wV00iphh
	jTsCEdkJ7qj0n3TgHQAbCT+S5Aa3YM58ZR3TMsy/BZxvjuMqDHCvL3/YNkwiL0+HWvoR
	fCPI18Zhs0Kx/J1ea4pj0FQWTnzw/SmARCGzxBzEi593pereq2zzKy+kJyKkcR+jChoe
	jijCAzveHZ4IoI7/5LAUGoXRVDpybxkCAbNDk1OJYQK98boy5bguAtPtg3y6aSrtFNJJ
	/3lDTpBxp3rvvqs4+y/PCdkP5iqbBXEAeOXZpj3KtUow1bWoPW8OsFpZAGY9YZ+/gWtL
	Oiww==
X-Received: by 10.70.88.80 with SMTP id be16mr21544006pdb.37.1437681441043;
	Thu, 23 Jul 2015 12:57:21 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id j9sm5019734pdl.65.2015.07.23.12.57.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 12:57:19 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 12:58:08 -0700
Message-Id: <f5d190c54cc1ad1ad1e64f4732b9bf32eea4fadb.1437663603.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
References: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCHv3 3/7] recipetool: also load plugins from BBPATH
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
X-List-Received-Date: Thu, 23 Jul 2015 19:57:21 -0000

This makes it easier to extend, as a layer can add its own sub-commands.

The bitbake path setup is moved earlier, as it has to be done before
tinfoil_init.

[YOCTO #7625]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/recipetool | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index 3063cf7..37c2dd3 100755
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
 
@@ -55,12 +52,26 @@ def main():
     parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
 
-    scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'recipetool'))
+    import scriptpath
+    bitbakepath = scriptpath.add_bitbake_lib_path()
+    if not bitbakepath:
+        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+        sys.exit(1)
+    logger.debug('Found bitbake path: %s' % bitbakepath)
+
+    tinfoil = tinfoil_init(False)
+    for path in ([scripts_path] +
+                 tinfoil.config_data.getVar('BBPATH', True).split(':')):
+        pluginpath = os.path.join(path, 'lib', 'recipetool')
+        scriptutils.load_plugins(logger, plugins, pluginpath)
+
     registered = False
     for plugin in plugins:
         if hasattr(plugin, 'register_command'):
             registered = True
             plugin.register_command(subparsers)
+        if hasattr(plugin, 'tinfoil_init'):
+            plugin.tinfoil_init(tinfoil)
 
     if not registered:
         logger.error("No commands registered - missing plugins?")
@@ -73,17 +84,11 @@ def main():
     elif args.quiet:
         logger.setLevel(logging.ERROR)
 
-    import scriptpath
-    bitbakepath = scriptpath.add_bitbake_lib_path()
-    if not bitbakepath:
-        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
-        sys.exit(1)
-    logger.debug('Found bitbake path: %s' % bitbakepath)
-
     scriptutils.logger_setup_color(logger, args.color)
 
     try:
-        tinfoil_init(getattr(args, 'parserecipes', False))
+        if getattr(args, 'parserecipes', False):
+            tinfoil.parseRecipes()
         ret = args.func(args)
     except bb.BBHandledException:
         ret = 1
-- 
2.2.1


