Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F76C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:51 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.93.1788990824645394523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=gViS7AtT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2026090921534394fac6763c000207fb-mtckcg@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026090921534394fac6763c000207fb
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7dU4UyIkJXQ1zrNWoHas/+YMtyw743JLUSt3fvfpXQM=;
 b=gViS7AtTACuDYATSO43zQ43lFephuKUK8oy8ECwe+b5LDdavqOzn/E1NRSOBDje6no5Bni
 hfReItPLUYgErJ6UfMZ5klD9ij+bq1gzn0N1XuBq6SMvZOyuCuW9L9HrAHeRHcx0WorHFl4V
 KY8EomiefV+q1b7WC0GO8LfatS2Y4EAO7V/rHFosct+FvzOwiSnrg8N4ovr58UkAqG4cs7Rt
 qwQaPrrvkkmm4VqtYoJVb7l+UWRgYfz6zHZLEd+qwdu7GHHIa8XbqqjrDeVBjelUXCg3cuJS
 og1lvf274oqxy43+kpaQP2q/pnT0jYYTSd+NxMErwvI1EqEwYLqcCafw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 10/15] devtool: ide-sdk: add clangd support for VSCode IntelliSense
Date: Wed,  9 Sep 2026 23:53:10 +0200
Message-ID: <20260909215337.89106-11-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245515

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add an llvm-vs-code-extensions.vscode-clangd based IntelliSense provider
as an alternative to cpptools for ide=code. clangd is matched to the
recipe's real cross compiler via compile_commands.json and --query-driver,
which works for gcc cross-compilers as well as clang. As a fisrst step
clangd is supported if TOOLCHAIN is clang.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 41 ++++++++++++++++++---
 scripts/lib/devtool/ide_sdk.py              |  2 +
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 7c700f258e..acf3db7494 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -228,6 +228,26 @@ class IdeVSCode(IdeBase):
             }
         ]
 
+    def __vscode_settings_clangd(self, settings_dict, modified_recipe):
+        if not (modified_recipe.ide_sdk_intellisense == 'clangd' and modified_recipe.build_tool.is_c_cpp):
+            return
+        # Use the recipe's real cross compiler (gcc or clang, whichever TOOLCHAIN
+        # actually builds it), not a hardcoded 'clang'/'clang++' name.
+        cross_cc = os.path.join(modified_recipe.staging_bindir_toolchain, modified_recipe.cc.split()[0])
+        cross_cxx = os.path.join(modified_recipe.staging_bindir_toolchain, modified_recipe.cxx.split()[0])
+        settings_dict["clangd.path"] = os.path.join(
+            modified_recipe.recipe_sysroot_native, 'usr', 'bin', 'clangd')
+        settings_dict["clangd.arguments"] = [
+            # Allow-list the cross compiler so clangd queries it (not its own
+            # bundled clang) for target-specific builtin includes/defines.
+            # Works for gcc cross-compilers too, not just clang.
+            "--query-driver=%s,%s" % (cross_cc, cross_cxx),
+            "--compile-commands-dir=%s" % modified_recipe.b,
+            "--background-index"
+        ]
+        # Avoid cpptools (if also installed) fighting clangd over IntelliSense.
+        settings_dict["C_Cpp.intelliSenseEngine"] = "disabled"
+
     def vscode_settings(self, modified_recipe, image_recipe):
         files_hide = {
             "**/.git/**": True,
@@ -261,6 +281,7 @@ class IdeVSCode(IdeBase):
         self.__vscode_settings_cmake(settings_dict, modified_recipe)
         self.__vscode_settings_meson(settings_dict, modified_recipe)
         self.__vscode_settings_kernel_module(settings_dict, modified_recipe)
+        self.__vscode_settings_clangd(settings_dict, modified_recipe)
 
         settings_file = 'settings.json'
         IdeBase.update_json_file(
@@ -268,16 +289,22 @@ class IdeVSCode(IdeBase):
 
     def vscode_extensions(self, modified_recipe):
         recommendations = []
-        if modified_recipe.build_tool.is_c_cpp_kernel:
+        # clangd (matched to the recipe's real cross compiler via
+        # compile_commands.json) replaces cpptools as the IntelliSense provider
+        # if toolchain is clang. CodeLLDB/GDB debugging is unaffected either way.
+        use_clangd = (modified_recipe.ide_sdk_intellisense == 'clangd'
+                      and modified_recipe.build_tool.is_c_cpp)
+        if use_clangd:
+            recommendations += [
+                "llvm-vs-code-extensions.vscode-clangd",
+                "vadimcn.vscode-lldb"
+            ]
+        elif modified_recipe.build_tool.is_c_cpp_kernel:
             recommendations += [
                 "ms-vscode.cpptools",
                 "ms-vscode.cpptools-extension-pack",
                 "ms-vscode.cpptools-themes"
             ]
-        # For clang toolchain, CodeLLDB provides native LLDB debugging in VSCode
-        if (modified_recipe.toolchain == 'clang'
-                and modified_recipe.build_tool.is_c_cpp):
-            recommendations.append("vadimcn.vscode-lldb")
         if modified_recipe.build_tool is BuildTool.CMAKE:
             recommendations.append("ms-vscode.cmake-tools")
         if modified_recipe.build_tool is BuildTool.MESON:
@@ -290,6 +317,10 @@ class IdeVSCode(IdeBase):
             self.dot_code_dir(modified_recipe), extensions_file, {"recommendations": recommendations})
 
     def vscode_c_cpp_properties(self, modified_recipe, image_recipe):
+        # cpptools' IntelliSense is disabled in settings.json when clangd is
+        # the active provider, so this file would be inert clutter.
+        if modified_recipe.build_tool.is_c_cpp and modified_recipe.ide_sdk_intellisense == 'clangd':
+            return
         properties_dict = {
             "name": modified_recipe.recipe_id_pretty,
         }
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index ba9d4adff1..a3fbe7cdcb 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -789,6 +789,7 @@ class RecipeModified:
         self.target_arch = None
         self.tmpdir = None
         self.toolchain = None
+        self.ide_sdk_intellisense = None
         self.topdir = None
         self.workdir = None
         # Maps each package name (from PACKAGES) to the glob patterns from its FILES variable
@@ -884,6 +885,7 @@ class RecipeModified:
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
         self.tmpdir = os.path.realpath(recipe_d.getVar('TMPDIR'))
         self.toolchain = recipe_d.getVar('TOOLCHAIN')
+        self.ide_sdk_intellisense = 'clangd' if self.toolchain == 'clang' else 'cpptools'
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
-- 
2.55.0


