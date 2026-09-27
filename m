Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969CFCA5FA2
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 17:45:19 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40680.1790531113091596644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 10:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=Ll4akzZE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026092717451099ad3ff8a7000207a0-ymyhf2@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026092717451099ad3ff8a7000207a0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 19:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LEinUEP9iLO2rOo3v/EFuhYFeFNxAgtzCxZuVwFsWGA=;
 b=Ll4akzZET2ulJVugR1VEOfOYPec7nV19/EQXpULinN7aPiySOmhg85CWrhywjmy3bGpMjT
 EBnRKqzCYWeGO/uaPTQiJsa1y6KLnlllBHFFlst8yHmO4FveknPcbJlBjRCpyrqvArBJiv13
 3YvBUW2c/fn9Wyz72kZfhMKKO597igtghH8f/+O6cB93HvqD2mefjA21RmtNVz/iOByM1Mpf
 IoeoxiLsZFkQp2++Qrn3fFc6kTaT0XviV8ZwOQBaXSTr0LlrEK7fb5PO/35iXT5U/9fyuOc3
 V25NKqr2DN+XhSAzmer6UBan27nmCN3G9fKNctuOzubgHiawtXEsdiOQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/5] devtool: ide-sdk: allow combining shared and modified modes
Date: Sun, 27 Sep 2026 19:44:52 +0200
Message-ID: <20260927174506.652690-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260927174506.652690-1-adrian.freihofer@siemens.com>
References: <20260927174506.652690-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 17:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246705

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Modified mode sets up the IDE for devtool-modified recipes, while shared
mode provides a standalone cross-toolchain and sysroots for work outside
those recipe workspaces. Previously these workflows needed separate
ide-sdk invocations, potentially building the same image twice.

Accept repeated --mode flags to run both workflows together. Modified
recipes still get their recipe-specific IDE configurations; the shared
environment can also be sourced to build other source code with the
cross-toolchain. When an image is supplied, its rootfs-dbg provides
debug symbols and sources for image-backed debugging, and --nfs can
export that rootfs for a running target.

Collect image settings from both workflows, build the image once, then
populate shared sysroots and generate both sets of IDE configurations.
Either mode can still be selected alone, and modified remains the
default when --mode is omitted.

For example, after devtool modify cmake-example:

    devtool ide-sdk -m modified -m shared \
        cmake-example core-image-minimal --ide=code --nfs=rootfs-dbg

From the build directory, open the modified recipe's generated IDE
configuration:

    code workspace/sources/cmake-example

In another shell in the build directory, source the shared SDK environment
to build other source code with its cross-toolchain:

    . tmp/deploy/images/*/environment-setup-*
    cd /path/to/other/source
    make
---
 scripts/lib/devtool/ide_sdk.py | 55 +++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index ac07dae656..9faf041957 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1732,6 +1732,8 @@ class RecipeModified:
 def ide_setup(args, config, basepath, workspace):
     """Generate the IDE configuration for the workspace"""
 
+    modes = set(args.mode or [DevtoolIdeMode.modified])
+
     # Explicitely passing some special recipes does not make sense
     for recipe in args.recipenames:
         if recipe in ['meta-ide-support', 'build-sysroots']:
@@ -1780,8 +1782,8 @@ def ide_setup(args, config, basepath, workspace):
                     recipes_other_names.append(recipe)
 
         invalid_params = False
-        if args.mode == DevtoolIdeMode.shared:
-            if len(recipes_modified_names):
+        if DevtoolIdeMode.shared in modes:
+            if recipes_modified_names and DevtoolIdeMode.modified not in modes:
                 logger.error("In shared sysroots mode modified recipes %s cannot be handled." % str(
                     recipes_modified_names))
                 invalid_params = True
@@ -1791,7 +1793,7 @@ def ide_setup(args, config, basepath, workspace):
         if args.nfs_extract_dir and not args.nfs:
             logger.error("--nfs-extract-dir requires --nfs.")
             invalid_params = True
-        if args.mode == DevtoolIdeMode.modified:
+        if DevtoolIdeMode.modified in modes:
             if not recipes_modified_names:
                 appends_dir = os.path.join(config.workspace_path, 'appends')
                 recipes_modified_names = sorted(
@@ -1802,7 +1804,7 @@ def ide_setup(args, config, basepath, workspace):
                     logger.info(
                         "No modified recipes specified, using workspace bbappends from %s: %s",
                         appends_dir, ', '.join(recipes_modified_names))
-            if len(recipes_other_names):
+            if recipes_other_names and DevtoolIdeMode.shared not in modes:
                 logger.error("Only in shared sysroots mode not modified recipes %s can be handled." % str(
                     recipes_other_names))
                 invalid_params = True
@@ -1849,7 +1851,7 @@ def ide_setup(args, config, basepath, workspace):
 
         # Provide a Direct SDK with shared sysroots
         recipes_not_modified = []
-        if args.mode == DevtoolIdeMode.shared:
+        if DevtoolIdeMode.shared in modes:
             ide_support = RecipeMetaIdeSupport()
             ide_support.initialize(config, tinfoil)
             bootstrap_tasks += ide_support.bootstrap_tasks
@@ -1875,7 +1877,7 @@ def ide_setup(args, config, basepath, workspace):
                         config, tinfoil, recipes_images, recipe_name)
 
         recipes_modified = []
-        if args.mode == DevtoolIdeMode.modified:
+        if DevtoolIdeMode.modified in modes:
             logger.info("Setting up workspaces for modified recipe: %s" %
                         str(recipes_modified_names))
             DebuggerCrossConfig._port_next = int(args.gdbserver_port_start)
@@ -1920,7 +1922,7 @@ def ide_setup(args, config, basepath, workspace):
         if recipe_modified.update_bbappend():
             recipe_bbappend_changed = True
     shared_bbappend_changed = False
-    if args.mode == DevtoolIdeMode.shared:
+    if modes == {DevtoolIdeMode.shared}:
         for image in recipes_images:
             if image.extra_image_install_debugfs or args.nfs:
                 if image.update_image_bbappend([], args.nfs):
@@ -1945,28 +1947,20 @@ def ide_setup(args, config, basepath, workspace):
             exec_build_env_command(
                 config.init_path, basepath,
                 bb_cmd + ' '.join(bootstrap_tasks), watch=True)
-        if args.mode == DevtoolIdeMode.shared and image_bootstrap_tasks:
+        if modes == {DevtoolIdeMode.shared} and image_bootstrap_tasks:
             exec_build_env_command(
                 config.init_path, basepath,
                 bb_cmd + ' '.join(image_bootstrap_tasks), watch=True)
-        if bootstrap_tasks_late:
+        if modes == {DevtoolIdeMode.shared} and bootstrap_tasks_late:
             exec_build_env_command(
                 config.init_path, basepath,
                 bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
 
-    if args.mode == DevtoolIdeMode.shared:
+    if modes == {DevtoolIdeMode.shared}:
         if args.nfs and not args.skip_bitbake:
             for image in recipes_images:
                 image.extract_nfs_rootfs(nfs_export_base_dir, args.nfs, args.target)
-        for ide in ides:
-            ide.setup_shared_sysroots(shared_env)
-            for image in recipes_images:
-                ide.setup_shared_image(args, shared_env, image, config.workspace_path)
-            for recipe_name in recipes_other_names:
-                ide.setup_shared_recipe(
-                    args, shared_env, recipes_images[0] if recipes_images else None,
-                    config.workspace_path, recipe_name)
-    elif args.mode == DevtoolIdeMode.modified:
+    if DevtoolIdeMode.modified in modes:
         for recipe_modified in recipes_modified:
             if recipe_modified.build_tool is BuildTool.CMAKE:
                 recipe_modified.cmake_preset()
@@ -2022,8 +2016,20 @@ def ide_setup(args, config, basepath, workspace):
         if args.nfs and not args.skip_bitbake:
             for ri in recipes_images:
                 ri.extract_nfs_rootfs(nfs_export_base_dir, args.nfs, args.target)
-    else:
-        raise DevtoolError("Must not end up here.")
+
+    if DevtoolIdeMode.shared in modes:
+        if DevtoolIdeMode.modified in modes and bootstrap_tasks_late and not args.skip_bitbake:
+            exec_build_env_command(
+                config.init_path, basepath,
+                bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
+        for ide in ides:
+            ide.setup_shared_sysroots(shared_env)
+            for image in recipes_images:
+                ide.setup_shared_image(args, shared_env, image, config.workspace_path)
+            for recipe_name in recipes_other_names:
+                ide.setup_shared_recipe(
+                    args, shared_env, recipes_images[0] if recipes_images else None,
+                    config.workspace_path, recipe_name)
 
 
 def register_commands(subparsers, context):
@@ -2062,8 +2068,8 @@ def register_commands(subparsers, context):
         'In modified mode at least the image recipe is required; if no modified recipe is passed, '
         'all modified recipes are taken from <workspace>/appends/*.bbappend.')
     parser_ide_sdk.add_argument(
-        '-m', '--mode', type=DevtoolIdeMode, default=DevtoolIdeMode.modified,
-        help='Different SDK types are supported:\n'
+        '-m', '--mode', type=DevtoolIdeMode, action='append',
+        help='Different SDK types are supported. Repeat --mode to generate both:\n'
         '- "' + DevtoolIdeMode.modified.name + '" (default):\n'
         '  devtool modify creates a workspace to work on the source code of a recipe.\n'
         '  devtool ide-sdk builds the SDK and generates the IDE configuration(s) in the workspace directorie(s)\n'
@@ -2080,7 +2086,8 @@ def register_commands(subparsers, context):
         '  An image recipe may also be supplied to build a target image and generate image-based IDE configurations.\n'
         '  With an image recipe, --nfs exports its rootfs for NFS booting.\n'
         '  To use this tool-chain the environment-* file found in the deploy..image folder needs to be sourced into a shell.\n'
-        '  In case of VSCode and cmake the tool-chain is also exposed as a cmake-kit')
+        '  In case of VSCode and cmake the tool-chain is also exposed as a cmake-kit.\n'
+        '  Combine with --mode modified to generate recipe IDE configurations and shared sysroots from one image build.')
     default_ide = list(ide_plugins.keys())[0]
     ide_choices = list(ide_plugins.keys()) + ['all']
     parser_ide_sdk.add_argument(
-- 
2.55.0


