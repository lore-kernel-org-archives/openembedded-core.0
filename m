Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571AEC88E6C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:06:45 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5787.1789329997540646078
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=PGPKopOX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260913200634916842f3d100020709-irvevl@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260913200634916842f3d100020709
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8kb/t81zCx7cxXAM5iRn67xfUKfOn9hprI9PaDl4sSE=;
 b=PGPKopOXTiiP/ILTYsaXndM+WhE89GNemXgwOgnHu7q4iUOZsrbSzKsWQYpeKOxwN1NRjT
 kj7lICfkFxStUPSiAdkoDqGNWcLjH7QNzJjI1LCv4UtM3cfpzadEnclO4fAtOQcnSQr/QZi9
 iOfGN/ibL9T6ebjzNmbgSu0GoMO/nezVlTf1mr8ZpaUiWSZBdRVHQZdgW3cmaYhFBw9qZXDY
 VExCdFutANMp7aP/4fWE4/54F5PNShh9f7LnDoQyrcWsRjFq1YE+1nG++9lhXNRP8m8JWCTx
 dRS7ZuEQzA2qsnL9U1zr5/+qJF0o+xj98bFva0izEudrIL/tdw+LPcVw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/6] devtool: ide-sdk: allow --ide to select multiple plugins
Date: Sun, 13 Sep 2026 22:05:53 +0200
Message-ID: <20260913200624.331753-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260913200624.331753-1-adrian.freihofer@siemens.com>
References: <20260913200624.331753-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245721

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Accept a comma separated list of IDE plugin names for --ide (e.g.
--ide code,none) instead of a single name, so the configuration for
several IDEs/tools can be generated in one invocation.

This can be useful when working with multiple IDEs or tools
simultaneously, as it allows for a more streamlined setup process.

It also allows to optimize the oe-selftest process to build once and
test across multiple IDEs rather than building and starting a Qemu
separately for each one.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index d47906700b..44e11ce517 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1746,7 +1746,7 @@ def ide_setup(args, config, basepath, workspace):
         config, args.recipenames)
     orig_recipe_bbappend_contents = RecipeModified.strip_bbappend_sections(
         config, args.recipenames)
-    ide = ide_plugins[args.ide]()
+    ides = [ide_plugins[name]() for name in args.ide]
     tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
     try:
         # define mode depending on recipes which need to be processed
@@ -1869,7 +1869,8 @@ def ide_setup(args, config, basepath, workspace):
                 recipe_modified = RecipeModified(
                     recipe_name, orig_recipe_bbappend_contents.get(recipe_name))
                 recipe_modified.initialize(config, workspace, tinfoil)
-                ide.initialize_modified_recipe(config, tinfoil, recipe_modified)
+                for ide in ides:
+                    ide.initialize_modified_recipe(config, tinfoil, recipe_modified)
                 bootstrap_tasks += recipe_modified.bootstrap_tasks
                 recipes_modified.append(recipe_modified)
 
@@ -1929,15 +1930,17 @@ def ide_setup(args, config, basepath, workspace):
                 bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
 
     if args.mode == DevtoolIdeMode.shared:
-        ide.setup_shared_sysroots(shared_env)
+        for ide in ides:
+            ide.setup_shared_sysroots(shared_env)
     elif args.mode == DevtoolIdeMode.modified:
         for recipe_modified in recipes_modified:
             if recipe_modified.build_tool is BuildTool.CMAKE:
                 recipe_modified.cmake_preset()
             if recipe_modified.build_tool is BuildTool.MESON:
                 recipe_modified.gen_meson_wrapper()
-            ide.setup_modified_recipe(
-                args, recipe_image, recipe_modified)
+            for ide in ides:
+                ide.setup_modified_recipe(
+                    args, recipe_image, recipe_modified)
 
             if recipe_modified.wants_debug_build and recipe_modified.debug_build != '1':
                 logger.warn(
@@ -2043,9 +2046,21 @@ def register_commands(subparsers, context):
         '  To use this tool-chain the environment-* file found in the deploy..image folder needs to be sourced into a shell.\n'
         '  In case of VSCode and cmake the tool-chain is also exposed as a cmake-kit')
     default_ide = list(ide_plugins.keys())[0]
+
+    def ide_list(value):
+        """argparse type: comma separated list of IDE plugin names"""
+        names = value.split(',')
+        for name in names:
+            if name not in ide_plugins:
+                raise ValueError(
+                    "invalid choice: %r (choose from %s)" % (
+                        name, ', '.join(sorted(ide_plugins.keys()))))
+        return names
     parser_ide_sdk.add_argument(
-        '-i', '--ide', choices=ide_plugins.keys(), default=default_ide,
-        help='Setup the configuration for this IDE (default: %s)' % default_ide)
+        '-i', '--ide', type=ide_list, default=[default_ide],
+        metavar='{%s}' % ','.join(ide_plugins.keys()),
+        help='Comma separated list of IDEs to setup the configuration for '
+        '(choices: %s, default: %s)' % (', '.join(ide_plugins.keys()), default_ide))
     parser_ide_sdk.add_argument(
         '-t', '--target', default='root@192.168.7.2',
         help='Live target machine running an ssh server: user@hostname.')
-- 
2.55.0


