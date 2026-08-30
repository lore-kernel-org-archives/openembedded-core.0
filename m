Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B6CC624D0
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:27 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17149.1788126560349108171
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=VJLjsnqF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202608302149172c58e4b39c0002072f-deda8k@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202608302149172c58e4b39c0002072f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=O74ILPKjsMtLZF35PvGlc+SYG3LTRheACCWsCJMwFXk=;
 b=VJLjsnqFF6RoD25gv6tepuq+w2fxVlIu7KgFH0x6UDp9V6Gs3bjmaUSgxK+rLThYV417AG
 qQgHIfheqVef/fRd52uUdimH72XCbSafJOiclXVU3OTUcw54qzflQ3yQw7FR/RqvoKChcAaW
 ddtlv44I/AwqHXK9yFN4t5YwvV4d+P1pBGIAXz05SbxZoZpnyqQF+JxpqhsUce0fEeSHSfHI
 yNTRVlCeRxVNmA0vc8sBpLGp+jL+Gu4HvQ3F1EaQ3L3o2V1lg+VTYhhIifXX6aZIQFoL63Rn
 2keumP57nhxBs1yz1Ht8jRhvIu/+NlXRrrBtMTOCxQzLnj//5kqV4mBA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 03/25] devtool: ide-sdk: VSCode IntelliSense for rootfs-dbg sources
Date: Sun, 30 Aug 2026 23:48:25 +0200
Message-ID: <20260830214912.1346063-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244704

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add includePath fallback entries to c_cpp_properties.json pointing at
recipe-sysroot/usr/include and rootfs-dbg/usr/src/debug, so the C/C++
extension can resolve symbols in other recipes' sources whenever they
are opened from rootfs-dbg, e.g. while stepping into them with the
debugger.

Also widen files.readonlyInclude from just the recipe's sysroots to
the whole TMPDIR: more robust, since it also covers oe-workdir, rootfs,
and other generated content reachable from the workspace. oe-logs and
oe-workdir are kept visible in the VSCode explorer instead of being
hidden via files.exclude, so build logs and temp scripts can still be
browsed, while staying out of the file watcher/indexer and read-only.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     |  8 ++--
 scripts/lib/devtool/ide_plugins/ide_code.py | 44 +++++++++++++++------
 scripts/lib/devtool/ide_sdk.py              |  2 +
 3 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 7c989f9dc2..c0df13b718 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3945,11 +3945,11 @@ class DevtoolIdeSdkKernelTests(DevtoolIdeSdkTests):
                          os.path.join(tempdir, 'Makefile'),
                          'makefilePath should point to the Makefile in the source tree')
 
-        # Verify kernel sources are set read-only
+        # Verify kernel sources (under TMPDIR) are set read-only
+        tmpdir = get_bb_var('TMPDIR', recipe_name)
         readonly_includes = settings_d.get('files.readonlyInclude', {})
-        self.assertTrue(
-            any(k for k in readonly_includes if 'staging_kernel' in k.lower() or 'linux' in k.lower()),
-            'Kernel staging dir should be set read-only in files.readonlyInclude: %s' % readonly_includes)
+        self.assertIn(os.path.realpath(tmpdir) + '/**', readonly_includes,
+                     'TMPDIR should be set read-only in files.readonlyInclude: %s' % readonly_includes)
 
         # Verify the cross-build environment is exported for the terminal
         self.assertIn('terminal.integrated.env.linux', settings_d,
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 1a8a79f623..5abf0492e8 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -205,9 +205,6 @@ class IdeVSCode(IdeBase):
         settings_dict["files.watcherExclude"].update(files_excludes_kernel)
         settings_dict["python.analysis.exclude"] += kernel_exclude_patterns
 
-        # protect the kernel sources
-        settings_dict["files.readonlyInclude"][modified_recipe.staging_kernel_dir + '/**'] = True
-
         # Export the complete cross-build environment
         settings_dict["terminal.integrated.env.linux"] = modified_recipe.exported_vars
 
@@ -232,12 +229,15 @@ class IdeVSCode(IdeBase):
         ]
 
     def vscode_settings(self, modified_recipe, image_recipe):
-        files_excludes = {
+        files_hide = {
             "**/.git/**": True,
-            "**/oe-logs/**": True,
-            "**/oe-workdir/**": True,
             "**/source-date-epoch/**": True
         }
+        files_watcher_exclude = dict(files_hide)
+        files_watcher_exclude.update({
+            "**/oe-logs/**": True,
+            "**/oe-workdir/**": True,
+        })
         python_exclude = [
             "**/.git/**",
             "**/oe-logs/**",
@@ -245,14 +245,16 @@ class IdeVSCode(IdeBase):
             "**/source-date-epoch/**"
         ]
         files_readonly = {
-            modified_recipe.recipe_sysroot + '/**': True,
-            modified_recipe.recipe_sysroot_native + '/**': True,
+            modified_recipe.tmpdir + '/**': True,
+            "**/oe-logs/**": True,
+            "**/oe-workdir/**": True,
         }
         if image_recipe.rootfs_dbg is not None:
             files_readonly[image_recipe.rootfs_dbg + '/**'] = True
         settings_dict = {
-            "files.watcherExclude": files_excludes,
-            "files.exclude": files_excludes,
+            "files.watcherExclude": files_watcher_exclude,
+            "files.exclude": files_hide,
+            "search.exclude": dict(files_watcher_exclude),
             "files.readonlyInclude": files_readonly,
             "python.analysis.exclude": python_exclude
         }
@@ -287,7 +289,7 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), extensions_file, {"recommendations": recommendations})
 
-    def vscode_c_cpp_properties(self, modified_recipe):
+    def vscode_c_cpp_properties(self, modified_recipe, image_recipe):
         properties_dict = {
             "name": modified_recipe.recipe_id_pretty,
         }
@@ -322,6 +324,24 @@ class IdeVSCode(IdeBase):
         else:  # no C/C++ build
             return
 
+        # configurationProvider/compileCommands only cover the recipe under
+        # development. Add includePath as a fallback so the C/C++ extension
+        # also resolves symbols in other recipes sources found in rootfs-dbg.
+        if image_recipe.rootfs_dbg is not None:
+            recipe_sysroot_include = os.path.join(modified_recipe.recipe_sysroot, "usr", "include")
+            # rootfs_dbg/usr/include is empty, target headers come from recipe-sysroot,
+            # consistent with the GDB sourceFileMap for "/usr/include".
+            rootfs_dbg_src_debug = os.path.join(image_recipe.rootfs_dbg, "usr", "src", "debug")
+            include_path = properties_dict.get("includePath", ["${workspaceFolder}/**"])
+            for path in (recipe_sysroot_include, rootfs_dbg_src_debug + "/**"):
+                if path not in include_path:
+                    include_path.append(path)
+            properties_dict["includePath"] = include_path
+            # That's the default, but make it easy to change if a big index is preferred.
+            properties_dict["browse"] = {
+                "limitSymbolsToIncludedHeaders": True
+            }
+
         properties_dicts = {
             "configurations": [
                 properties_dict
@@ -873,7 +893,7 @@ class IdeVSCode(IdeBase):
     def setup_modified_recipe(self, args, image_recipe, modified_recipe):
         self.vscode_settings(modified_recipe, image_recipe)
         self.vscode_extensions(modified_recipe)
-        self.vscode_c_cpp_properties(modified_recipe)
+        self.vscode_c_cpp_properties(modified_recipe, image_recipe)
         if args.target:
             if modified_recipe.toolchain == 'clang':
                 self.initialize_cross_debug_configs(
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 6f08940c9c..d7575ec523 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -457,6 +457,7 @@ class RecipeModified:
         self.staging_incdir = None
         self.strip_cmd = None
         self.target_arch = None
+        self.tmpdir = None
         self.toolchain = None
         self.topdir = None
         self.workdir = None
@@ -545,6 +546,7 @@ class RecipeModified:
             recipe_d.getVar('STAGING_INCDIR'))
         self.strip_cmd = recipe_d.getVar('STRIP')
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
+        self.tmpdir = os.path.realpath(recipe_d.getVar('TMPDIR'))
         self.toolchain = recipe_d.getVar('TOOLCHAIN')
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
-- 
2.55.0


