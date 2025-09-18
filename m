Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAFFCAC5B3
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:21 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.283.1758229695077333227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=g5ZwR9/I;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2025091821081261536d7b1d0002076a-4ytd7s@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025091821081261536d7b1d0002076a
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JKVlmVnLKwpwvjQ4vIkqcyeq2JSrGNHs6tXhQ2vyxuA=;
 b=g5ZwR9/Iiv3e2cihdhRLiCtsUnBwS1nJlKujtOEvFWgVKiq/cseVnfAcEhv2WbkaC3Msbs
 j2NAAlzxVcyN7HbObGTfBK3eUgk81pPIPqtCMa1sPpg3PzKdgc/7eOefG12TDlz9pVymWSrm
 y1waReeU85BHJO6rp47j0nbMnuNShFHZ6WtEtq+Gp1zntBXTTf6NOrlPhthPw5D+E3tV1bO6
 o+ryCb1EQPqdbKN9HYKYpX7/NXvQeBWJdm5xGdDTHHSXff3V5dWKbKm+H7bZ5DMS67UGXM6+
 2/8B6qsg5RTSnv/7R+ggPGNqA5ugMGG7GnVgz/AKkFxOI9jzMaEW7P6g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 19/19] devtool: ide-sdk: support kernel module development
Date: Thu, 18 Sep 2025 23:07:21 +0200
Message-ID: <20250918210754.477049-20-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223678

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This add very basic support for kernel module development with devtool
ide-sdk. It exports the kernel build environment and sets up
tasks for building and cleaning the module. But it does not yet support
install, deploy, and debug tasks. It looks like possible to offer the
same level of support as for CMake and Meson based projects, but that
requires more work.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |   7 ++
 scripts/lib/devtool/ide_plugins/ide_code.py | 103 +++++++++++++++-----
 scripts/lib/devtool/ide_sdk.py              |  34 ++++++-
 3 files changed, 117 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index f9eeaec6608..2f645b205a2 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -19,6 +19,7 @@ class BuildTool(Enum):
     UNDEFINED = auto()
     CMAKE = auto()
     MESON = auto()
+    KERNEL_MODULE = auto()
 
     @property
     def is_c_ccp(self):
@@ -28,6 +29,12 @@ class BuildTool(Enum):
             return True
         return False
 
+    @property
+    def is_c_cpp_kernel(self):
+        if self.is_c_ccp or self is BuildTool.KERNEL_MODULE:
+            return True
+        return False
+
 
 class GdbServerModes(Enum):
     ONCE = auto()
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index d69da3862ff..38fa4dcff98 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -138,6 +138,59 @@ class IdeVSCode(IdeBase):
         settings_dict["cmake.configureOnOpen"] = True
         settings_dict["cmake.sourceDirectory"] = modified_recipe.real_srctree
 
+    def __vscode_settings_kernel_module(self, settings_dict, modified_recipe):
+        if modified_recipe.build_tool is not BuildTool.KERNEL_MODULE:
+            return
+
+        # Define kernel exclude patterns once
+        kernel_exclude_patterns = [
+            "**/.*.cmd",
+            "**/.*.d",
+            "**/.*.S",
+            "**/.tmp*",
+            "**/*.tmp",
+            "**/*.o",
+            "**/*.a",
+            "**/*.builtin",
+            "**/*.order",
+            "**/*.orig",
+            "**/*.symvers",
+            "**/*.modinfo",
+            "**/*.map",
+            "*.cache/**"
+        ]
+        files_excludes_kernel = {pattern: True for pattern in kernel_exclude_patterns}
+
+        settings_dict["files.exclude"].update(files_excludes_kernel)
+        settings_dict["files.watcherExclude"].update(files_excludes_kernel)
+        settings_dict["python.analysis.exclude"] += kernel_exclude_patterns
+
+        # protect the kernel sources
+        settings_dict["files.readonlyInclude"][modified_recipe.staging_kernel_dir + '/**'] = True
+
+        # Export the complete cross-build environment
+        settings_dict["terminal.integrated.env.linux"] = modified_recipe.exported_vars
+
+        # and the make configuration
+        make_executable = os.path.join(
+            modified_recipe.recipe_sysroot_native, 'usr', 'bin', 'make')
+        settings_dict["makefile.configurations"] = [
+            {
+                "name": ' '.join(modified_recipe.make_targets),
+                "makePath": make_executable,
+                "makeDirectory": modified_recipe.srctree,
+                "makefilePath": os.path.join(modified_recipe.srctree, "Makefile"),
+                "makeArgs": modified_recipe.extra_oemake + modified_recipe.make_targets
+            },
+            {
+                "name": "clean",
+                "makePath": make_executable,
+                "makeDirectory": modified_recipe.srctree,
+                "makefilePath": os.path.join(modified_recipe.srctree, "Makefile"),
+                "makeArgs": modified_recipe.extra_oemake + ["clean"]
+            }
+        ]
+
     def vscode_settings(self, modified_recipe, image_recipe):
         files_excludes = {
             "**/.git/**": True,
@@ -165,35 +218,27 @@ class IdeVSCode(IdeBase):
         }
         self.__vscode_settings_cmake(settings_dict, modified_recipe)
         self.__vscode_settings_meson(settings_dict, modified_recipe)
+        self.__vscode_settings_kernel_module(settings_dict, modified_recipe)
 
         settings_file = 'settings.json'
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), settings_file, settings_dict)
 
-    def __vscode_extensions_cmake(self, modified_recipe, recommendations):
-        if modified_recipe.build_tool is not BuildTool.CMAKE:
-            return
-        recommendations += [
-            "ms-vscode.cmake-tools",
-            "ms-vscode.cpptools",
-            "ms-vscode.cpptools-extension-pack",
-            "ms-vscode.cpptools-themes"
-        ]
-
-    def __vscode_extensions_meson(self, modified_recipe, recommendations):
-        if modified_recipe.build_tool is not BuildTool.MESON:
-            return
-        recommendations += [
-            'mesonbuild.mesonbuild',
-            "ms-vscode.cpptools",
-            "ms-vscode.cpptools-extension-pack",
-            "ms-vscode.cpptools-themes"
-        ]
-
     def vscode_extensions(self, modified_recipe):
         recommendations = []
-        self.__vscode_extensions_cmake(modified_recipe, recommendations)
-        self.__vscode_extensions_meson(modified_recipe, recommendations)
+        if modified_recipe.build_tool.is_c_cpp_kernel:
+            recommendations += [
+                "ms-vscode.cpptools",
+                "ms-vscode.cpptools-extension-pack",
+                "ms-vscode.cpptools-themes"
+            ]
+        if modified_recipe.build_tool is BuildTool.CMAKE:
+            recommendations.append("ms-vscode.cmake-tools")
+        if modified_recipe.build_tool is BuildTool.MESON:
+            recommendations.append("mesonbuild.mesonbuild")
+        if modified_recipe.build_tool is BuildTool.KERNEL_MODULE:
+            recommendations.append("ms-vscode.makefile-tools")
+
         extensions_file = 'extensions.json'
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), extensions_file, {"recommendations": recommendations})
@@ -207,6 +252,15 @@ class IdeVSCode(IdeBase):
         elif modified_recipe.build_tool is BuildTool.MESON:
             properties_dict["configurationProvider"] = "mesonbuild.mesonbuild"
             properties_dict["compilerPath"] = os.path.join(modified_recipe.staging_bindir_toolchain, modified_recipe.cxx.split()[0])
+        elif modified_recipe.build_tool is BuildTool.KERNEL_MODULE:
+            # Using e.g. configurationProvider = "ms-vscode.makefile-tools" was not successful
+            properties_dict["compilerPath"] = os.path.join(modified_recipe.staging_bindir_toolchain, modified_recipe.kernel_cc.split()[0])
+            properties_dict["includePath"] = [
+                "${workspaceFolder}/**",
+                os.path.join(modified_recipe.staging_kernel_dir, "include", "**")
+            ]
+            # https://www.kernel.org/doc/html/next/process/programming-language.html
+            properties_dict["cStandard"] = "gnu11"
         else:  # no C/C++ build
             return
 
@@ -369,6 +423,9 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
 
+    def vscode_tasks_kernel_module(self, args, modified_recipe):
+        pass
+
     def vscode_tasks_fallback(self, args, modified_recipe):
         oe_init_dir = modified_recipe.oe_init_dir
         oe_init = ". %s %s > /dev/null && " % (modified_recipe.oe_init_build_env, modified_recipe.topdir)
@@ -491,6 +548,8 @@ class IdeVSCode(IdeBase):
     def vscode_tasks(self, args, modified_recipe):
         if modified_recipe.build_tool.is_c_ccp:
             self.vscode_tasks_cpp(args, modified_recipe)
+        elif modified_recipe.build_tool == BuildTool.KERNEL_MODULE:
+            self.vscode_tasks_kernel_module(args, modified_recipe)
         else:
             self.vscode_tasks_fallback(args, modified_recipe)
 
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 432dba89d9b..f38ef90be68 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -24,6 +24,7 @@ import bb
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError, parse_recipe
 from devtool.standard import get_real_srctree
 from devtool.ide_plugins import BuildTool
+from oe.kernel_module import kernel_module_os_env
 
 
 logger = logging.getLogger('devtool')
@@ -436,6 +437,11 @@ class RecipeModified:
         self.mesonopts = None
         self.extra_oemeson = None
         self.meson_cross_file = None
+        # kernel module
+        self.make_targets = None
+        self.extra_oemake = None
+        self.kernel_cc = None
+        self.staging_kernel_dir = None
 
         # Populated after bitbake built all the recipes
         self._installed_binaries = None
@@ -499,9 +505,6 @@ class RecipeModified:
         self.f_do_install_dirs = recipe_d.getVarFlag(
             'do_install', 'dirs').split()
 
-        self.reverse_debug_prefix_map = self.extract_debug_prefix_map_paths(
-            recipe_d.getVar('DEBUG_PREFIX_MAP'))
-
         self.__init_exported_variables(recipe_d)
         self.__init_systemd_services(recipe_d)
         self.__init_init_scripts(recipe_d)
@@ -516,9 +519,30 @@ class RecipeModified:
             self.extra_oemeson = recipe_d.getVar('EXTRA_OEMESON')
             self.meson_cross_file = recipe_d.getVar('MESON_CROSS_FILE')
             self.build_tool = BuildTool.MESON
+        elif bb.data.inherits_class('module', recipe_d):
+            self.build_tool = BuildTool.KERNEL_MODULE
+            make_targets = recipe_d.getVar('MAKE_TARGETS')
+            if make_targets:
+                self.make_targets = shlex.split(make_targets)
+            else:
+                self.make_targets = ["all"]
+            extra_oemake = recipe_d.getVar('EXTRA_OEMAKE')
+            if extra_oemake:
+                self.extra_oemake = shlex.split(extra_oemake)
+            else:
+                self.extra_oemake = []
+            self.kernel_cc = recipe_d.getVar('KERNEL_CC')
+            self.staging_kernel_dir = recipe_d.getVar('STAGING_KERNEL_DIR')
+            # Export up the environment for building kernel modules
+            kernel_module_os_env(recipe_d, self.exported_vars)
 
-        self.reverse_debug_prefix_map = self._init_reverse_debug_prefix_map(
-            recipe_d.getVar('DEBUG_PREFIX_MAP'))
+        # For the kernel the KERNEL_CC variable contains the prefix-map arguments
+        if self.build_tool is BuildTool.KERNEL_MODULE:
+            self.reverse_debug_prefix_map = self._init_reverse_debug_prefix_map(
+                self.kernel_cc)
+        else:
+            self.reverse_debug_prefix_map = self._init_reverse_debug_prefix_map(
+                recipe_d.getVar('DEBUG_PREFIX_MAP'))
 
         # Recipe ID is the identifier for IDE config sections
         self.recipe_id = self.bpn + "-" + self.package_arch
-- 
2.51.0


