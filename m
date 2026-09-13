Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4D6C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:06:44 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5785.1789329997495386601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=fgjzGUz0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202609132006345755c5e14d0002078c-odhjxv@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202609132006345755c5e14d0002078c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 22:06:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zjzsY0q1afdmjv8tu7uuAdhZ2q21zcbFdGGuCtZJoUE=;
 b=fgjzGUz04oXN+iHKQY9tNPQu4s7gEpRIgLGAHFOFIyffJDz4pXyWsOQsGD5NB65VeOd40+
 OrCwgEPcU7mKXXfRyRFPgIv+aWZZCEzhuvG/WyC6MqVRZWPE3YYiedU6iuoJz5Kb936GXVfj
 3YUjizCQ8jm3kzcxmKJaqd0TUq9m56C1x8xNxUiwikmXqdieiJMfGf4PUpDN9+KkKzq06Y3g
 HBUMGQEJOMLxgnJc2C6d/uPu4GLhEquhek4uPkpLrH5HBuR8atT4aSAHDOAhCk7bvE9LiMlW
 CYfHvPBouNE+mWeb4WKKk+3iwgqZxfZFkaArEm2iufrCmNWZ1U3aLG6g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/6] devtool: ide-sdk: add initialize_modified_recipe() plugin hook
Date: Sun, 13 Sep 2026 22:05:52 +0200
Message-ID: <20260913200624.331753-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260913200624.331753-1-adrian.freihofer@siemens.com>
References: <20260913200624.331753-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245723

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add IdeBase.initialize_modified_recipe() plugin hook which allows IDE
plugins to run code at recipe initialization time within the shared
tinfoil session.

Default implementation is a no-op, so existing IDE plugins are
unaffected.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 4 ++++
 scripts/lib/devtool/ide_sdk.py              | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index bc0b2ca9b7..333ec9bac8 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -353,6 +353,10 @@ class IdeBase:
         logger.warn("Shared sysroot mode is not supported for IDE %s" %
                     self.ide_name)
 
+    def initialize_modified_recipe(self, config, tinfoil, recipe_modified):
+        """Hook called once per modified recipe, inside the shared tinfoil session"""
+        pass
+
     def setup_modified_recipe(self, args, image_recipe, modified_recipe):
         logger.warn("Modified recipe mode is not supported for IDE %s" %
                     self.ide_name)
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 14271ae871..d47906700b 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1746,6 +1746,7 @@ def ide_setup(args, config, basepath, workspace):
         config, args.recipenames)
     orig_recipe_bbappend_contents = RecipeModified.strip_bbappend_sections(
         config, args.recipenames)
+    ide = ide_plugins[args.ide]()
     tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
     try:
         # define mode depending on recipes which need to be processed
@@ -1868,6 +1869,7 @@ def ide_setup(args, config, basepath, workspace):
                 recipe_modified = RecipeModified(
                     recipe_name, orig_recipe_bbappend_contents.get(recipe_name))
                 recipe_modified.initialize(config, workspace, tinfoil)
+                ide.initialize_modified_recipe(config, tinfoil, recipe_modified)
                 bootstrap_tasks += recipe_modified.bootstrap_tasks
                 recipes_modified.append(recipe_modified)
 
@@ -1926,8 +1928,6 @@ def ide_setup(args, config, basepath, workspace):
                 config.init_path, basepath,
                 bb_cmd + ' '.join(bootstrap_tasks_late), watch=True)
 
-    # Instantiate the active IDE plugin
-    ide = ide_plugins[args.ide]()
     if args.mode == DevtoolIdeMode.shared:
         ide.setup_shared_sysroots(shared_env)
     elif args.mode == DevtoolIdeMode.modified:
-- 
2.55.0


