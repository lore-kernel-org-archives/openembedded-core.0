Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC27FC72CE
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 15:13:42 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32153.1774192414293889704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 08:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=dpM6528d;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260322151331f239a7f3d8000207e1-gfgnzb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260322151331f239a7f3d8000207e1
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Mar 2026 16:13:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+qWFJLbmdyfC5DaqGBtB/XO0H5NT6fdPVUNm1h2qds8=;
 b=dpM6528dMGFRGpEPPNwK2qo84clYcDbSvt7UmkT+hl1TX8xppvmzLLvUk4XsnQ0FajpGls
 QiyeoYDDLUbT5zU4BD9MtzhTmQw9oUkkdsmPVcgAM2bPOyLhc5PgVXztmDyHcmK/UK6gYKzH
 0ttdN/vKSBZgTuCXkgEWBcaGZ0rqTITmjCbe10/OOoxeBV6xxhEP2enBw0gWas/imEpoJggB
 S4vqJPoJjxa2oYZeNKd4I/ZgqFz0iZWT5anBo+0pPQ4O1qSBTmzSkmes4KKlkW9ad0X9tm6F
 XEdzyQk3vbCitofVO7p2ER+wVlnhwbCqCz9Lc74jSAtRHj0WazYwy22g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 7/9] devtool: ide-sdk add LLDB support for clang toolchain
Date: Sun, 22 Mar 2026 16:12:58 +0100
Message-ID: <20260322151320.661246-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260322151320.661246-1-adrian.freihofer@siemens.com>
References: <20260322151320.661246-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 15:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233681

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add support for LLDB (CodeLLDB) remote debugging in VSCode when using
the clang toolchain. This includes:

- New LldbServerConfig class for configuring lldb-server on the target
- LldbServerConfigVSCode for VSCode-specific LLDB configuration
- RecipeLldbNative to handle lldb-native (architecture-agnostic) on the
  host
- CodeLLDB VSCode extension recommendation for clang toolchain
- Launch configuration generator for LLDB debugging
- Proper handling of source maps and debug symbol paths for LLDB

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  63 +++++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py | 114 +++++++++++++++++++-
 scripts/lib/devtool/ide_sdk.py              |  61 ++++++++++-
 3 files changed, 229 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 8c41afc640..d7d06567ee 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -181,6 +181,69 @@ class GdbCrossConfig(DebuggerCrossConfig):
         return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.port
 
 
+class LldbServerConfig(DebuggerCrossConfig):
+    """Configure lldb-server (platform mode) on the target for CodeLLDB remote debugging.
+
+    Unlike gdbserver, lldb-server platform mode is architecture-agnostic on the host
+    side: a single lldb-native binary handles all target architectures via the
+    LLDB platform protocol that CodeLLDB speaks natively.
+
+    The ATTACH mode is not supported because lldb-server platform does not take a
+    PID argument; attaching is done client-side via 'process attach'.
+    """
+
+    def __init__(self, image_recipe, modified_recipe, binary,
+                 default_mode=GdbServerModes.MULTI):
+        super().__init__(image_recipe, modified_recipe, binary,
+                         default_mode)
+
+    def _lldb_server_tmp_dir(self, mode):
+        return os.path.join('/tmp', 'lldb_server_%s' % self.id_pretty_mode(mode))
+
+    def _lldb_server_pid_file(self, mode):
+        return os.path.join(self._lldb_server_tmp_dir(mode), 'lldb_server.pid')
+
+    def _lldb_server_log_file(self, mode):
+        return os.path.join(self._lldb_server_tmp_dir(mode), 'lldb_server.log')
+
+    def _target_start_cmd(self, mode):
+        """SSH command to start lldb-server in platform mode on the target."""
+        lldb_server = self.gdb_cross.gdbserver_path
+        # Use '*:<port>' so lldb-server binds on all interfaces (0.0.0.0), not
+        # just loopback.  The bare ':<port>' form only binds to 127.0.0.1 in
+        # lldb-server 21.x and the remote lldb client connects from the host.
+        # Start from /tmp because lldb-server creates temp files in its cwd and
+        # the SSH default cwd (/home/root) may not exist on a minimal image.
+        if mode == GdbServerModes.ONCE:
+            cmd = "cd /tmp && %s platform --one-shot --server --listen *:%s" % (
+                lldb_server, self.port)
+        elif mode == GdbServerModes.MULTI:
+            pid_file = self._lldb_server_pid_file(mode)
+            tmp_dir = self._lldb_server_tmp_dir(mode)
+            log_file = self._lldb_server_log_file(mode)
+            cmd = "test -f %s && exit 0; " % pid_file
+            cmd += "mkdir -p %s; " % tmp_dir
+            cmd += "cd %s; " % tmp_dir
+            cmd += "%s platform --server --listen *:%s > %s 2>&1 & " % (
+                lldb_server, self.port, log_file)
+            cmd += "echo \\$! > %s;" % pid_file
+        else:
+            raise DevtoolError(
+                "lldb-server does not support mode %s "
+                "(ATTACH is handled client-side with 'process attach')" % mode)
+        return "\"/bin/sh -c '" + cmd + "'\""
+
+    def _target_kill_cmd(self):
+        """SSH command to stop a MULTI-mode lldb-server on the target."""
+        pid_file = self._lldb_server_pid_file(GdbServerModes.MULTI)
+        tmp_dir = self._lldb_server_tmp_dir(GdbServerModes.MULTI)
+        cmd = ("test -f %(pf)s && kill \\$(cat %(pf)s) 2>/dev/null; rm -rf %(td)s"
+               % {'pf': pid_file, 'td': tmp_dir})
+        return "\"/bin/sh -c '" + cmd + "'\""
+
+    def server_modes(self):
+        """ATTACH mode is not applicable for lldb-server platform."""
+        return [self.default_mode]
 
 
 class IdeBase:
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 7fe5a40eb1..1b8434ab1c 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -9,7 +9,7 @@ import json
 import logging
 import os
 import shutil
-from devtool.ide_plugins import BuildTool, IdeBase, DebuggerCrossConfig, GdbCrossConfig, GdbServerModes, get_devtool_deploy_opts
+from devtool.ide_plugins import BuildTool, IdeBase, DebuggerCrossConfig, GdbCrossConfig, GdbServerModes, LldbServerConfig, get_devtool_deploy_opts
 
 logger = logging.getLogger('devtool')
 
@@ -43,6 +43,28 @@ class GdbCrossConfigVSCode(GdbCrossConfig):
         ]
 
 
+class LldbServerConfigVSCode(LldbServerConfig):
+    """VSCode-specific lldb-server configuration for CodeLLDB remote debugging."""
+
+    def __init__(self, image_recipe, modified_recipe, binary,
+                 default_mode=GdbServerModes.MULTI):
+        super().__init__(image_recipe, modified_recipe, binary,
+                         default_mode)
+
+    def target_ssh_gdbserver_start_args(self, mode=None):
+        """SSH argument list to start lldb-server on the target"""
+        if mode is None:
+            mode = self.default_mode
+        return self._target_ssh_args() + [
+            self._target_start_cmd(mode)
+        ]
+
+    def target_ssh_gdbserver_kill_args(self):
+        """SSH argument list to stop a running MULTI-mode lldb-server"""
+        return self._target_ssh_args() + [
+            self._target_kill_cmd()
+        ]
+
 class IdeVSCode(IdeBase):
     """Manage IDE configurations for VSCode
 
@@ -243,6 +265,10 @@ class IdeVSCode(IdeBase):
                 "ms-vscode.cpptools-extension-pack",
                 "ms-vscode.cpptools-themes"
             ]
+        # For clang toolchain, CodeLLDB provides native LLDB debugging in VSCode
+        if (modified_recipe.toolchain == 'clang'
+                and modified_recipe.build_tool.is_c_cpp):
+            recommendations.append("vadimcn.vscode-lldb")
         if modified_recipe.build_tool is BuildTool.CMAKE:
             recommendations.append("ms-vscode.cmake-tools")
         if modified_recipe.build_tool is BuildTool.MESON:
@@ -286,7 +312,9 @@ class IdeVSCode(IdeBase):
             self.dot_code_dir(modified_recipe), prop_file, properties_dicts)
 
     def vscode_launch_bin_dbg(self, gdb_cross_config, gdbserver_mode):
-        """Dispatch to the GDB launch config generator."""
+        """Dispatch to the GDB or LLDB launch config generator."""
+        if isinstance(gdb_cross_config, LldbServerConfig):
+            return self._vscode_launch_bin_dbg_lldb(gdb_cross_config, gdbserver_mode)
         return self._vscode_launch_bin_dbg_gdb(gdb_cross_config, gdbserver_mode)
 
     def _vscode_launch_bin_dbg_gdb(self, gdb_cross_config, gdbserver_mode):
@@ -373,6 +401,80 @@ class IdeVSCode(IdeBase):
 
         return launch_config
 
+    def _vscode_launch_bin_dbg_lldb(self, lldb_config, gdbserver_mode):
+        """Generate a CodeLLDB (type: lldb) launch configuration entry for launch.json.
+
+        CodeLLDB connects to lldb-server via the LLDB platform protocol.  The
+        initCommands select the remote platform and open the connection before
+        the process is launched, so CodeLLDB can inspect and control it.
+        """
+        modified_recipe = lldb_config.modified_recipe
+        gdb_cross = modified_recipe.gdb_cross
+
+        init_commands = [
+            "platform select remote-linux",
+            "platform connect connect://%s:%d" % (gdb_cross.host, lldb_config.port),
+            # Clear the default step-avoid-regexp so std:: and other library
+            # namespaces are not silently skipped on step-in. (default is "std::" in LLDB 15+)
+            "settings set target.process.thread.step-avoid-regexp \"\"",
+        ]
+        # Point LLDB at the installed files in ${D} so it resolves shared
+        # library paths automatically (equivalent of GDB's 'set sysroot').
+        # target.sysroot is not a valid LLDB setting; use the module search
+        # path substitution instead, which requires a target to exist and
+        # therefore must run in preRunCommands, not initCommands.
+        pre_run_commands = [
+            "target modules search-paths add / %s" % modified_recipe.d,
+        ]
+
+        # Search for header files in recipe-sysroot (same as GDB sourceFileMap).
+        source_map = {
+            "/usr/include": os.path.join(modified_recipe.recipe_sysroot, "usr", "include")
+        }
+        if lldb_config.image_recipe.rootfs_dbg:
+            # Map build-time paths back to the workspace source tree.
+            for target_path, host_path in modified_recipe.reverse_debug_prefix_map.items():
+                if host_path.startswith(modified_recipe.real_srctree):
+                    source_map[target_path] = (
+                        "${workspaceFolder}"
+                        + host_path[len(modified_recipe.real_srctree):])
+                else:
+                    source_map[target_path] = host_path
+            if "/usr/src/debug" in source_map:
+                logger.error(
+                    'Key "/usr/src/debug" already exists in source_map. '
+                    'Something with DEBUG_PREFIX_MAP looks unexpected and finding '
+                    'sources in the rootfs-dbg will not work as expected.')
+            else:
+                source_map["/usr/src/debug"] = os.path.join(
+                    lldb_config.image_recipe.rootfs_dbg, "usr", "src", "debug")
+
+            # Point LLDB at the .debug directories in rootfs-dbg.
+            debug_search_paths = " ".join(
+                modified_recipe.solib_search_path(lldb_config.image_recipe))
+            init_commands.append(
+                "settings set target.debug-file-search-paths %s" % debug_search_paths)
+        else:
+            logger.warning(
+                "Cannot setup debug symbols configuration for LLDB. "
+                "IMAGE_GEN_DEBUGFS is not enabled.")
+
+        launch_config = {
+            "name": lldb_config.id_pretty_mode(gdbserver_mode),
+            "type": "lldb",
+            "request": "launch",
+            "program": lldb_config.binary.binary_host_path,
+            "stopOnEntry": False,
+            "cwd": "/tmp",
+            "preLaunchTask": lldb_config.id_pretty_mode(gdbserver_mode),
+            "initCommands": init_commands,
+            "preRunCommands": pre_run_commands,
+        }
+        if source_map:
+            launch_config["sourceMap"] = source_map
+
+        return launch_config
+
     def vscode_launch(self, args, modified_recipe):
         """GDB launch configurations for user-space binaries.
 
@@ -682,8 +784,12 @@ class IdeVSCode(IdeBase):
         self.vscode_extensions(modified_recipe)
         self.vscode_c_cpp_properties(modified_recipe)
         if args.target:
-            self.initialize_gdb_cross_configs(
-                image_recipe, modified_recipe, GdbCrossConfigVSCode)
+            if modified_recipe.toolchain == 'clang':
+                self.initialize_gdb_cross_configs(
+                    image_recipe, modified_recipe, LldbServerConfigVSCode)
+            else:
+                self.initialize_gdb_cross_configs(
+                    image_recipe, modified_recipe, GdbCrossConfigVSCode)
             self.vscode_launch(args, modified_recipe)
             self.vscode_tasks(args, modified_recipe)
 
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 76cbccf618..7c461e6b0e 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -137,6 +137,45 @@ class RecipeGdbCross(RecipeNative):
         return self.target_device.host
 
 
+class RecipeLldbNative(RecipeNative):
+    """Handle lldb on the host and lldb-server on the target device.
+
+    Unlike GDB which requires a per-architecture gdb-cross-<arch> binary, LLDB
+    is architecture-agnostic: a single lldb-native installation can debug any
+    target architecture via the LLDB platform protocol.
+
+    On the target side, lldb-server (the ${PN}-server sub-package from the lldb
+    recipe) provides the platform server that CodeLLDB connects to.
+    """
+
+    def __init__(self, args, target_device):
+        super().__init__('lldb-native')
+        self.target_device = target_device
+        self._lldb = None
+        self._lldb_server_path = None
+
+    def __find_lldb_server(self, config, tinfoil):
+        """Absolute path of lldb-server on the target (from the lldb recipe)."""
+        recipe_d_lldb = parse_recipe(
+            config, tinfoil, 'lldb', appends=True, filter_workspace=False)
+        if not recipe_d_lldb:
+            raise DevtoolError("Parsing lldb recipe failed")
+        return os.path.join(recipe_d_lldb.getVar('bindir'), 'lldb-server')
+
+    def initialize(self, config, workspace, tinfoil):
+        super()._initialize(config, workspace, tinfoil)
+        self._lldb = os.path.join(self.staging_bindir_native, 'lldb')
+        self._lldb_server_path = self.__find_lldb_server(config, tinfoil)
+
+    @property
+    def gdbserver_path(self):
+        return self._lldb_server_path
+
+    @property
+    def host(self):
+        return self.target_device.host
+
+
 class RecipeImage:
     """Handle some image recipe related properties
 
@@ -169,8 +208,9 @@ class RecipeImage:
         if image_d.getVar('IMAGE_GEN_DEBUGFS') == "1":
             self.__rootfs_dbg = os.path.join(workdir, 'rootfs-dbg')
 
-        self.gdbserver_missing = 'gdbserver' not in image_d.getVar(
-            'IMAGE_INSTALL') and 'tools-debug' not in image_d.getVar('IMAGE_FEATURES')
+        package_install = image_d.getVar('PACKAGE_INSTALL').split()
+        self.gdbserver_missing = 'gdbserver' not in package_install
+        self.lldb_server_missing = 'lldb-server' not in package_install
 
     @property
     def debug_support(self):
@@ -1172,8 +1212,11 @@ def ide_setup(args, config, basepath, workspace):
                                 recipe_modified.toolchain or '')
                 if debugger_key not in debuggers:
                     target_device = TargetDevice(args)
-                    debugger = RecipeGdbCross(
-                        args, recipe_modified.target_arch, target_device)
+                    if recipe_modified.toolchain == 'clang':
+                        debugger = RecipeLldbNative(args, target_device)
+                    else:
+                        debugger = RecipeGdbCross(
+                            args, recipe_modified.target_arch, target_device)
                     debugger.initialize(config, workspace, tinfoil)
                     bootstrap_tasks += debugger.bootstrap_tasks
                     debuggers[debugger_key] = debugger
@@ -1197,12 +1240,20 @@ def ide_setup(args, config, basepath, workspace):
     wants_gdbserver = any(
         r.wants_gdbserver and r.toolchain == 'gcc'
         for r in recipes_modified)
+    wants_lldb_server = any(
+        r.wants_gdbserver and r.toolchain == 'clang'
+        for r in recipes_modified)
     for recipe_image in recipes_images:
         if wants_gdbserver and recipe_image.gdbserver_missing:
             logger.warning(
                 "gdbserver not installed in image %s. Remote debugging will not be available" % recipe_image)
+        if wants_lldb_server and recipe_image.lldb_server_missing:
+            logger.warning(
+                "lldb-server not installed in image %s. "
+                "Remote debugging with LLDB (CodeLLDB) will not be available. "
+                "Add 'lldb-server' to IMAGE_INSTALL." % recipe_image)
 
-        if wants_gdbserver and recipe_image.combine_dbg_image is False:
+        if (wants_gdbserver or wants_lldb_server) and recipe_image.combine_dbg_image is False:
             logger.warning(
                 'IMAGE_CLASSES += "image-combined-dbg" is missing for image %s. Remote debugging will not find debug symbols from rootfs-dbg.' % recipe_image)
 
-- 
2.53.0


