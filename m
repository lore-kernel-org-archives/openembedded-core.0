Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7483FC9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 17:45:18 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40682.1790531113091861050
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 10:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=gamGrtVq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260927174509846b971676000207b1-jbow_y@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260927174509846b971676000207b1
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 19:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=YpQB1fxyy5exLq1yzilaxDQeFie3Mhh53svccIz5/0E=;
 b=gamGrtVqN8u6whpXgA6/Ks2mvSj1cxX0UAU0sxMzoP5MsCk8yJR3NpU43GLKwMltLpyOW+
 d2xDEDPqh7FHVHiAfPcsz/ZaGsSVL8f6FaC00IKYOuhgB5u8GulwnLRSkcwgzf5/uIxP46YD
 GI32W8zOD4PQ0yCp9cv0XKh8094z73M6Pi/Ot5ZPfwb+Bt6/KiAwjvfdX+MFUr8o0xRCsktJ
 TbQbNhO0bnWllXQbEsj+VVifDdO6EibOJgS8Nuehp7VpO2uGPE67TEBymYWeK2j3jgka5yVF
 pwmgjrzz3fD2uHgPOW9vcMJwFzhU/pveVtL+1klFitq15BAvY4F3QdQg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/5] devtool: ide-sdk: support shared recipe IDE hooks
Date: Sun, 27 Sep 2026 19:44:49 +0200
Message-ID: <20260927174506.652690-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260927174506.652690-1-adrian.freihofer@siemens.com>
References: <20260927174506.652690-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 17:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246702

From: Adrian Freihofer <adrian.freihofer@siemens.com>

In shared mode, unmodified recipes are built into the sysroots,
but IDE plugins cannot prepare recipe-specific dependencies or
generate configurations for an explicitly named recipe.

Add initialization and setup hooks for each shared recipe. Plugins
can request build tasks and image debug packages during setup;
finalize the image bbappend before its build and generate recipe
projects after the shared sysroots are ready.

For example, a plugin can use a virtual/kernel recipe and an image
to create a kernel debugging project without devtool modify.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  6 ++++++
 scripts/lib/devtool/ide_sdk.py              | 23 ++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 2cdb2e504a..87e5db6b68 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -367,6 +367,12 @@ class IdeBase:
         logger.warn("Shared sysroot mode is not supported for IDE %s" %
                     self.ide_name)
 
+    def initialize_shared_recipe(self, config, tinfoil, images, recipe_name):
+        return []
+
+    def setup_shared_recipe(self, args, shared_env, image, workspace_path, recipe_name):
+        pass
+
     def initialize_modified_recipe(self, config, tinfoil, recipe_modified):
         """Hook called once per modified recipe, inside the shared tinfoil session"""
         pass
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 1eb4d94fc6..2f23741371 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1870,6 +1870,10 @@ def ide_setup(args, config, basepath, workspace):
             bootstrap_tasks_late += build_sysroots.bootstrap_tasks
             shared_env = SharedSysrootsEnv()
             shared_env.initialize(ide_support, build_sysroots)
+            for recipe_name in recipes_other_names:
+                for ide in ides:
+                    bootstrap_tasks += ide.initialize_shared_recipe(
+                        config, tinfoil, recipes_images, recipe_name)
 
         recipes_modified = []
         if args.mode == DevtoolIdeMode.modified:
@@ -1916,9 +1920,18 @@ def ide_setup(args, config, basepath, workspace):
     for recipe_modified in recipes_modified:
         if recipe_modified.update_bbappend():
             recipe_bbappend_changed = True
+    shared_bbappend_changed = False
+    if args.mode == DevtoolIdeMode.shared:
+        for image in recipes_images:
+            if image.extra_image_install_debugfs:
+                bootstrap_tasks = [task for task in bootstrap_tasks
+                                   if task not in image.bootstrap_tasks]
+                image_bootstrap_tasks += image.bootstrap_tasks
+                if image.update_image_bbappend([], None):
+                    shared_bbappend_changed = True
 
     if not args.skip_bitbake:
-        if recipe_bbappend_changed:
+        if recipe_bbappend_changed or shared_bbappend_changed:
             # The bbappend content just written differs from the one bitbake
             # parsed during the tinfoil session above. See update_image_bbappend()'s
             # matching reset for phase 2 for why this is needed.
@@ -1940,10 +1953,18 @@ def ide_setup(args, config, basepath, workspace):
             exec_build_env_command(
                 config.init_path, basepath,
                 bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
+        if args.mode == DevtoolIdeMode.shared and image_bootstrap_tasks:
+            exec_build_env_command(
+                config.init_path, basepath,
+                bb_cmd + ' '.join(image_bootstrap_tasks), watch=True)
 
     if args.mode == DevtoolIdeMode.shared:
         for ide in ides:
             ide.setup_shared_sysroots(shared_env)
+            for recipe_name in recipes_other_names:
+                ide.setup_shared_recipe(
+                    args, shared_env, recipes_images[0] if recipes_images else None,
+                    config.workspace_path, recipe_name)
     elif args.mode == DevtoolIdeMode.modified:
         for recipe_modified in recipes_modified:
             if recipe_modified.build_tool is BuildTool.CMAKE:
-- 
2.55.0


