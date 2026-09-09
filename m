Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B361C79FBB
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:51 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84.1788990825113338710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=PPvm9otI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260909215343654ceae7580002070c-tlkoty@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260909215343654ceae7580002070c
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IJLW+xAN4FHkjAQUK44OVLT5tWuXDo4u5gXnKQ8PVIk=;
 b=PPvm9otIMjNabkturIEkkt+XFkXhF++8G9/Tn9p2J71SJXibKIg5vFUuRRGosIu0FI6pdS
 DMTx5l2mRPnyny95RXS5i+dfGdwcZwqm7swEbi7nT88ri6WCn8tmVYY3UbSDuYoBALHLbMi/
 4X+K89GzUbM0sBFXdMD98Hzd1ueppiL66M6qPfjicajDZ16iCrv4an2KXOSRHS9+mSxZ5/A9
 rWAQ3SLcouA7/+VuawpvifjEEPUxj25GQpbNHVzjLXNRp8QuhVBRgANr8g2J54quU49vrqnD
 GE8GWkeJd+5AR9BYGDHZAn/PnvwC23ekaUfW7mQv68VUeFfQPhKsHOUw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 12/15] devtool: ide-sdk: format C/C++ with clangd when .clang-format is present
Date: Wed,  9 Sep 2026 23:53:12 +0200
Message-ID: <20260909215337.89106-13-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245504

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add "[cpp]"/"[c]" defaultFormatter and editor.formatOnSave settings
pointing at the clangd VSCode extension, so devtool ide-sdk-generated
workspaces auto-format on save using the recipe's own .clang-format
style.

Only enabled when clangd is the active IntelliSense engine
(IDE_SDK_INTELLISENSE == "clangd", which also gates whether the clangd
extension is recommended/installed) and a .clang-format file exists in
the recipe source tree, so gcc/cpptools recipes and recipes without a
.clang-format are unaffected.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 8a8ab8bf3d..f8036f15de 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -248,6 +248,19 @@ class IdeVSCode(IdeBase):
         # Avoid cpptools (if also installed) fighting clangd over IntelliSense.
         settings_dict["C_Cpp.intelliSenseEngine"] = "disabled"
 
+    def __vscode_settings_format(self, settings_dict, modified_recipe):
+        # clangd is the only formatter wired up here, so only enable it when
+        # clangd is actually the active IntelliSense engine (its extension is
+        # recommended/available).
+        if not (modified_recipe.ide_sdk_intellisense == 'clangd' and modified_recipe.build_tool.is_c_cpp):
+            return
+        # Respect the project's own formatting style only if it opted in.
+        if not os.path.isfile(os.path.join(modified_recipe.real_srctree, '.clang-format')):
+            return
+        settings_dict["[cpp]"] = {"editor.defaultFormatter": "llvm-vs-code-extensions.vscode-clangd"}
+        settings_dict["[c]"] = {"editor.defaultFormatter": "llvm-vs-code-extensions.vscode-clangd"}
+        settings_dict["editor.formatOnSave"] = True
+
     def vscode_settings(self, modified_recipe, image_recipe):
         files_hide = {
             "**/.git/**": True,
@@ -282,6 +295,7 @@ class IdeVSCode(IdeBase):
         self.__vscode_settings_meson(settings_dict, modified_recipe)
         self.__vscode_settings_kernel_module(settings_dict, modified_recipe)
         self.__vscode_settings_clangd(settings_dict, modified_recipe)
+        self.__vscode_settings_format(settings_dict, modified_recipe)
 
         settings_file = 'settings.json'
         IdeBase.update_json_file(
-- 
2.55.0


