Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEB0C9833F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 17:45:19 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40681.1790531113091811559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 10:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=lcQcTcXP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202609271745097564ca292d000207da-psgtln@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202609271745097564ca292d000207da
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 19:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=v7XI7ZqKK/ojtr9qTcDWU+j1P190kCcVYldJRcSFvUA=;
 b=lcQcTcXP8QpgAN4mo6KF1szlWnKmra6U49PiYm9jv8vT5uzHrcb2tQzlWPb0LdYA4Z9kwK
 GZHYc0P05Dk73OcqeYaDcGXWFloE/5zsNXfSBLp3lf4XQipwCPHBKGU80rJt9OxP46dUQjYq
 Bdh1UltvWHBmm302T580gxex58+VamFomO1+k3PTvr1j5k7owvC63OJ8C2w80PHHMzFrc6wm
 s73E7AM+wQmr0CSbnzh0Wwbc8/aUVt04D5xwrV8QjJWrPzHC8Wjbei4/Z/XT9KvnUyU19Te3
 lzdb4uD87aqmxPMa6iTjr/cTl+eJcBMXzlp/O6bwIX0KpxJ0wFVW5Xfg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/5] devtool: ide-sdk: initialize shared images for IDE plugins
Date: Sun, 27 Sep 2026 19:44:50 +0200
Message-ID: <20260927174506.652690-3-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246704

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Shared mode treated images as build dependencies only. IDE plugins
could not request image debug packages or create configurations
using the built rootfs. Add initialization and setup hooks for each
supplied image.

Build shared images after writing plugin-requested debug settings
and before populating shared sysroots. Image-aware plugins can now
generate debugger projects without naming a recipe to debug or
changing the image task hash during the build.
---
 scripts/lib/devtool/ide_plugins/__init__.py |  6 +++++
 scripts/lib/devtool/ide_sdk.py              | 26 ++++++++++-----------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 87e5db6b68..7841bc37b9 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -367,6 +367,12 @@ class IdeBase:
         logger.warn("Shared sysroot mode is not supported for IDE %s" %
                     self.ide_name)
 
+    def initialize_shared_image(self, config, tinfoil, image):
+        return []
+
+    def setup_shared_image(self, args, shared_env, image, workspace_path):
+        pass
+
     def initialize_shared_recipe(self, config, tinfoil, images, recipe_name):
         return []
 
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 2f23741371..68005170c4 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1842,13 +1842,9 @@ def ide_setup(args, config, basepath, workspace):
                 raise DevtoolError(
                     "%s does not exist. Run devtool ide-sdk --nfs=%s without "
                     "--skip-bitbake first." % (recipe_image.nfs_deploy_dir, args.nfs))
-            if args.mode == DevtoolIdeMode.modified:
-                # Keep the image build separate so that the complete bbappend
-                # (IMAGE_ vars + QB_SLIRP_OPT) can be written in one step
-                # before the image is built, avoiding sstate hash mismatches.
-                image_bootstrap_tasks += recipe_image.bootstrap_tasks
-            else:
-                bootstrap_tasks += recipe_image.bootstrap_tasks
+            # Build images only after the complete bbappend has been written,
+            # so the build never sees changing image task hashes.
+            image_bootstrap_tasks += recipe_image.bootstrap_tasks
             recipes_images.append(recipe_image)
 
         # Provide a Direct SDK with shared sysroots
@@ -1870,6 +1866,9 @@ def ide_setup(args, config, basepath, workspace):
             bootstrap_tasks_late += build_sysroots.bootstrap_tasks
             shared_env = SharedSysrootsEnv()
             shared_env.initialize(ide_support, build_sysroots)
+            for image in recipes_images:
+                for ide in ides:
+                    bootstrap_tasks += ide.initialize_shared_image(config, tinfoil, image)
             for recipe_name in recipes_other_names:
                 for ide in ides:
                     bootstrap_tasks += ide.initialize_shared_recipe(
@@ -1924,9 +1923,6 @@ def ide_setup(args, config, basepath, workspace):
     if args.mode == DevtoolIdeMode.shared:
         for image in recipes_images:
             if image.extra_image_install_debugfs:
-                bootstrap_tasks = [task for task in bootstrap_tasks
-                                   if task not in image.bootstrap_tasks]
-                image_bootstrap_tasks += image.bootstrap_tasks
                 if image.update_image_bbappend([], None):
                     shared_bbappend_changed = True
 
@@ -1949,18 +1945,20 @@ def ide_setup(args, config, basepath, workspace):
             exec_build_env_command(
                 config.init_path, basepath,
                 bb_cmd + ' '.join(bootstrap_tasks), watch=True)
-        if bootstrap_tasks_late:
-            exec_build_env_command(
-                config.init_path, basepath,
-                bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
         if args.mode == DevtoolIdeMode.shared and image_bootstrap_tasks:
             exec_build_env_command(
                 config.init_path, basepath,
                 bb_cmd + ' '.join(image_bootstrap_tasks), watch=True)
+        if bootstrap_tasks_late:
+            exec_build_env_command(
+                config.init_path, basepath,
+                bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
 
     if args.mode == DevtoolIdeMode.shared:
         for ide in ides:
             ide.setup_shared_sysroots(shared_env)
+            for image in recipes_images:
+                ide.setup_shared_image(args, shared_env, image, config.workspace_path)
             for recipe_name in recipes_other_names:
                 ide.setup_shared_recipe(
                     args, shared_env, recipes_images[0] if recipes_images else None,
-- 
2.55.0


