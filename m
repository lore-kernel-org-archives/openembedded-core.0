Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DF6EEC280
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:08:14 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5269.1771880890345232511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=gU95EMC4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-202602232108073c933d809e00020772-tnbweu@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202602232108073c933d809e00020772
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Feb 2026 22:08:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pRi//hZvV0Dfe3KJSLgK7jlXqFMe9XFeR3gn8CBHxXw=;
 b=gU95EMC4blYIDpaxFBClpC6QbTRYSHHymVHfOCNDzZV6jn3c7SwkpFknN7nQFsRh2zH36w
 VDnfD+U6IRcKvOtSWJGoMqz6PyHoyflbYQ6V2GTcf6zmTl+1KqG6/3bq2aPTtqrPX4JvRdZB
 qQuiafiei3zvuPMaC/kK94gYSFpmEXEZmrAJ6ACR9vYuo5B/vSrEi2gaTTywbulYigd3kbqH
 KOErpHNx+92Dp5+iLcuunf4WUCbPSIWpUdBpBboNKuAP1mzdhQy84rz56laQjmQ+5iYiiqKF
 OeLj5aphwyV5UTgN3d0CfJTBs+JQrMMyHJq7lVn0D3/uPMfs/r7EtmgA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/7] devtool: ide-sdk: support kernel module development
Date: Mon, 23 Feb 2026 22:06:38 +0100
Message-ID: <20260223210748.1905502-6-adrian.freihofer@siemens.com>
In-Reply-To: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
References: <20260223210748.1905502-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231699

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This add very basic support for kernel module development with devtool
ide-sdk. It exports the kernel build environment and sets up
tasks for building and cleaning the module. But it does not yet support
install, deploy, and debug tasks. It looks like possible to offer the
same level of support as for CMake and Meson based projects, but that
requires more work.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |   7 +
 scripts/lib/devtool/ide_plugins/ide_code.py | 186 +++++++++++++++++---
 scripts/lib/devtool/ide_sdk.py              |  33 +++-
 3 files changed, 199 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 80dfc1e235..eaf88e78cd 100644
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
index c2ee9b91c6..84cf35b50f 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -149,6 +149,59 @@ class IdeVSCode(IdeBase):
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
@@ -176,35 +229,27 @@ class IdeVSCode(IdeBase):
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
@@ -218,6 +263,15 @@ class IdeVSCode(IdeBase):
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
 
@@ -314,8 +368,15 @@ class IdeVSCode(IdeBase):
 
         return launch_config
 
-    def vscode_launch(self, modified_recipe):
-        """GDB Launch configuration for binaries (elf files)"""
+    def vscode_launch(self, args, modified_recipe):
+        """GDB launch configurations for user-space binaries.
+
+        Kernel modules are not debugged via gdbserver and have no launch entry.
+        Their deployment workflow is driven entirely by tasks.json:
+          install && deploy-target  ->  reload module (rmmod + insmod)  ->  verify module
+        These tasks can be triggered from the Tasks menu (Ctrl+Shift+P > Run Task)
+        or via the default build task (Ctrl+Shift+B for install && deploy-target).
+        """
 
         configurations = []
         for gdb_cross_config in self.gdb_cross_configs:
@@ -411,6 +472,79 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
 
+    @staticmethod
+    def _ssh_args(target_device, remote_cmd):
+        """Build a VS Code task 'args' list for an ssh command to the target."""
+        args = list(target_device.extraoptions)
+        if target_device.ssh_port:
+            args += list(target_device.ssh_port)
+        args += [target_device.target, remote_cmd]
+        return args
+
+    def vscode_tasks_kernel_module(self, args, modified_recipe):
+        """Generate tasks.json for kernel module recipes.
+
+        Three tasks are generated and chained in sequence:
+          1. install && deploy-target  - run bitbake do_install and push the
+             freshly built .ko to the target via devtool deploy-target.
+          2. reload module  - single SSH call: rmmod (errors ignored) then insmod
+             using the path reported by find so depmod is not required.
+          3. verify module  - SSH call: lsmod | grep <module> to confirm the new
+             module is loaded; output is visible in the task terminal.
+
+        The tasks are linked via dependsOn / dependsOrder: sequence so that
+        running the verify task automatically executes the full chain.  The
+        launch.json 'reload kernel module' entry uses preLaunchTask: verify,
+        providing a single F5 / click action for the complete reload cycle.
+        """
+        td = modified_recipe.gdb_cross.target_device
+        ko_name = modified_recipe.bpn + '.ko'
+        # rmmod / lsmod use the kernel module name (- replaced by _ per kernel convention)
+        mod_name = modified_recipe.bpn.replace('-', '_')
+        install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
+        reload_task_name = "reload module %s" % modified_recipe.recipe_id_pretty
+        verify_task_name = "verify module %s" % modified_recipe.recipe_id_pretty
+        run_install_deploy = modified_recipe.gen_install_deploy_script(args)
+        tasks_dict = {
+            "version": "2.0.0",
+            "tasks": [
+                {
+                    "label": install_task_name,
+                    "type": "shell",
+                    "command": run_install_deploy,
+                    "args": [
+                        "--target",
+                        args.target
+                    ],
+                    "problemMatcher": []
+                },
+                {
+                    "label": reload_task_name,
+                    "type": "shell",
+                    "command": td.ssh_sshexec,
+                    "args": self._ssh_args(
+                        td,
+                        "rmmod %(mod)s 2>/dev/null; insmod $(find /lib/modules -name '%(ko)s' | head -n 1)"
+                        % {"mod": mod_name, "ko": ko_name}),
+                    "dependsOn": [install_task_name],
+                    "dependsOrder": "sequence",
+                    "problemMatcher": []
+                },
+                {
+                    "label": verify_task_name,
+                    "type": "shell",
+                    "command": td.ssh_sshexec,
+                    "args": self._ssh_args(td, "lsmod | grep %s" % mod_name),
+                    "dependsOn": [reload_task_name],
+                    "dependsOrder": "sequence",
+                    "problemMatcher": []
+                }
+            ]
+        }
+        tasks_file = 'tasks.json'
+        IdeBase.update_json_file(
+            self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
+
     def vscode_tasks_fallback(self, args, modified_recipe):
         oe_init_dir = modified_recipe.oe_init_dir
         oe_init = ". %s %s > /dev/null && " % (modified_recipe.oe_init_build_env, modified_recipe.topdir)
@@ -533,6 +667,8 @@ class IdeVSCode(IdeBase):
     def vscode_tasks(self, args, modified_recipe):
         if modified_recipe.build_tool.is_c_ccp:
             self.vscode_tasks_cpp(args, modified_recipe)
+        elif modified_recipe.build_tool == BuildTool.KERNEL_MODULE:
+            self.vscode_tasks_kernel_module(args, modified_recipe)
         else:
             self.vscode_tasks_fallback(args, modified_recipe)
 
@@ -543,7 +679,7 @@ class IdeVSCode(IdeBase):
         if args.target:
             self.initialize_gdb_cross_configs(
                 image_recipe, modified_recipe, GdbCrossConfigVSCode)
-            self.vscode_launch(modified_recipe)
+            self.vscode_launch(args, modified_recipe)
             self.vscode_tasks(args, modified_recipe)
 
 
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index d6cda4be9d..9bccd76f0c 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -24,6 +24,7 @@ import bb
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError, parse_recipe
 from devtool.standard import get_real_srctree
 from devtool.ide_plugins import BuildTool
+from oe.kernel_module import kernel_module_os_env
 
 
 logger = logging.getLogger('devtool')
@@ -441,6 +442,11 @@ class RecipeModified:
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
@@ -514,9 +520,32 @@ class RecipeModified:
             self.extra_oemeson = recipe_d.getVar('EXTRA_OEMESON')
             self.meson_cross_file = recipe_d.getVar('MESON_CROSS_FILE')
             self.build_tool = BuildTool.MESON
+        elif bb.data.inherits_class('module', recipe_d):
+            self.build_tool = BuildTool.KERNEL_MODULE
+            self.wants_gdbserver = False
+            self.wants_debug_build = False
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
2.53.0


