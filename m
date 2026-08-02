Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98623C55182
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:53:53 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29487.1785700422332029363
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=bWQYuH84;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026080219534049d7ff1f2a0002077e-u1g4ys@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026080219534049d7ff1f2a0002077e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xPPzwRPdJA5zHeEAV1m7w+T21hQQaSdHa1HExur50Z0=;
 b=bWQYuH8452ZTejPjsMuaqPtMemT/21+8A5wwEeRtH8KW1wXB09eyv+9bgQbaJMKdhfvKLl
 EnaNK30R01eCc6a9FJ92IWNyn1LVRj+iJOSsFgxuhrwx3zKn4K2hzVLhUS/1KSvDSI67P7jr
 pyYcNg4GM4AUkse9pIL9SsKrsQ7Kp1NhlcwQ9Sj1h0ny0LSOGqDUS3IbZUrqt3aI3R6Mvw2N
 uMpDvWzwTgbz+zYNwPEKh3IcSXBJQFlVINeXF5CYuBZpu5d7vpTlk8zOWmcJGXWgkoDAXGUX
 xW2U6l2z/FHSRdgKaU96Om6L49Jb8n2IeFjWopEbmoqAJVyMGfTEQVyQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 08/14] devtool: ide-sdk debugger back-end abstraction
Date: Sun,  2 Aug 2026 21:52:55 +0200
Message-ID: <20260802195324.64533-9-adrian.freihofer@siemens.com>
In-Reply-To: <20260802195324.64533-1-adrian.freihofer@siemens.com>
References: <20260802195324.64533-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242584

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Refactor the devtool ide-sdk support for remote debugging with
gdbserver. The main goal is to cleanly separate the generation of the
host-side debugger configuration (gdbinit, wrapper scripts) from the
IDE-specific launch/task config generation, and to provide a common
interface for supporting multiple debug server back-ends (gdbserver,
lldb-server) in the future.

The following renames are applied throughout the devtool ide-sdk code:
- GdbServerModes              -> DebuggerServerModes (enum class)
- GdbCrossConfig              -> DebuggerCrossConfig (base) + GdbCrossConfig (subclass)
- RecipeModified.gdb_cross    -> debugger_cross (attribute)
- DebuggerCrossConfig.gdb_cross -> debugger_cross (attribute)
- gdbserver_default_mode      -> default_mode (attribute)
- gdbserver_port / port       -> debug_server_port (attribute)
- gdbserver_mode (parameter/variable) -> server_mode
- gdbserver_script_file / gdbserver_script -> server_script_file / server_script
- _target_gdbserver_start_cmd -> _target_start_cmd
- _target_gdbserver_kill_cmd  -> _target_kill_cmd
- gdb_cross_configs           -> cross_debug_configs (IdeBase attribute)
- initialize_gdb_cross_configs -> initialize_cross_debug_configs (IdeBase method)

Also: skip building gdb-cross for clang-toolchain recipes
(toolchain == 'gcc' guard). Clang recipes will use lldb-server instead
of gdbserver in the future. For gcc recipes the behaviour is unchanged.

Also fix a typo in the GDB configuration generator where the property
was named "is_c_ccp" instead of "is_c_cpp".

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 187 +++++++++++---------
 scripts/lib/devtool/ide_plugins/ide_code.py | 155 ++++++++--------
 scripts/lib/devtool/ide_plugins/ide_none.py |  54 +++---
 scripts/lib/devtool/ide_sdk.py              |  25 +--
 4 files changed, 232 insertions(+), 189 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 94ed7c9e6d..4a1686a034 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -22,7 +22,7 @@ class BuildTool(Enum):
     KERNEL_MODULE = auto()
 
     @property
-    def is_c_ccp(self):
+    def is_c_cpp(self):
         if self is BuildTool.CMAKE:
             return True
         if self is BuildTool.MESON:
@@ -31,134 +31,157 @@ class BuildTool(Enum):
 
     @property
     def is_c_cpp_kernel(self):
-        if self.is_c_ccp or self is BuildTool.KERNEL_MODULE:
+        if self.is_c_cpp or self is BuildTool.KERNEL_MODULE:
             return True
         return False
 
 
-class GdbServerModes(Enum):
+class DebuggerServerModes(Enum):
     ONCE = auto()
     ATTACH = auto()
     MULTI = auto()
 
 
-class GdbCrossConfig:
-    """Base class defining the GDB configuration generator interface
+class DebuggerCrossConfig:
+    """Base class defining the cross-debugger configuration generator interface.
 
-    Generate a GDB configuration for a binary on the target device.
+    Manages the per-binary port assignment, script paths, and SSH argument
+    construction that are common to all debugger back-ends (GDB, LLDB).
+    Concrete subclasses provide the back-end-specific remote start/kill commands.
     """
-    _gdbserver_port_next = 1234
-    _gdb_cross_configs = {}
+    _port_next = 1234
+    _configs = {}
 
-    def __init__(self, image_recipe, modified_recipe, binary, gdbserver_default_mode):
+    def __init__(self, image_recipe, modified_recipe, binary, default_mode):
         self.image_recipe = image_recipe
         self.modified_recipe = modified_recipe
-        self.gdb_cross = modified_recipe.gdb_cross
+        self.debugger_cross = modified_recipe.debugger_cross
         self.binary = binary
-        self.gdbserver_default_mode = gdbserver_default_mode
+        self.default_mode = default_mode
         self.binary_pretty = self.binary.binary_path.replace(os.sep, '-').lstrip('-')
-        self.gdbserver_port = GdbCrossConfig._gdbserver_port_next
-        GdbCrossConfig._gdbserver_port_next += 1
-        self.id_pretty = "%d_%s" % (self.gdbserver_port, self.binary_pretty)
+        self.debug_server_port = DebuggerCrossConfig._port_next
+        DebuggerCrossConfig._port_next += 1
+        self.id_pretty = "%d_%s" % (self.debug_server_port, self.binary_pretty)
 
-        # Track all generated gdbserver configs to avoid duplicates
-        if self.id_pretty in GdbCrossConfig._gdb_cross_configs:
+        if self.id_pretty in DebuggerCrossConfig._configs:
             raise DevtoolError(
-                "gdbserver config for binary %s is already generated" % binary)
-        GdbCrossConfig._gdb_cross_configs[self.id_pretty] = self
+                "debugger config for binary %s is already generated" % binary)
+        DebuggerCrossConfig._configs[self.id_pretty] = self
 
-    def id_pretty_mode(self, gdbserver_mode):
-        return "%s_%s" % (self.id_pretty, gdbserver_mode.name.lower())
+    def id_pretty_mode(self, mode):
+        return "%s_%s" % (self.id_pretty, mode.name.lower())
 
-    # GDB and gdbserver script on the host
+    # Host-side script paths
     @property
     def script_dir(self):
         return self.modified_recipe.ide_sdk_scripts_dir
 
+    def server_script(self, mode):
+        raise NotImplementedError
+
+    # SSH argument helpers
+    def _target_ssh_args(self):
+        ssh_args = []
+        if self.debugger_cross.target_device.ssh_port:
+            ssh_args += self.debugger_cross.target_device.ssh_port
+        if self.debugger_cross.target_device.extraoptions:
+            ssh_args.extend(self.debugger_cross.target_device.extraoptions)
+        if self.debugger_cross.target_device.target:
+            ssh_args.append(self.debugger_cross.target_device.target)
+        return ssh_args
+
+    def server_modes(self):
+        """List of debug-server modes for which scripts are generated."""
+        modes = [self.default_mode]
+        if self.binary.runs_as_service and self.default_mode != DebuggerServerModes.ATTACH:
+            modes.append(DebuggerServerModes.ATTACH)
+        return modes
+
+    def initialize(self):
+        """Called after construction to generate any required config files."""
+        pass
+
+    # Abstract — subclasses must implement
+    def _target_start_cmd(self, mode):
+        raise NotImplementedError
+
+    def _target_kill_cmd(self):
+        raise NotImplementedError
+
+
+class GdbCrossConfig(DebuggerCrossConfig):
+    """GDB-specific cross-debugging configuration.
+
+    Manages gdbserver on the target and gdb-cross on the host.  Provides
+    gdbinit / gdb wrapper scripts used by ide=none as well as the
+    target-side tmp/pid/log paths consumed by the gdbserver start command.
+    """
+
+    def __init__(self, image_recipe, modified_recipe, binary,
+                 default_mode=DebuggerServerModes.MULTI):
+        super().__init__(image_recipe, modified_recipe, binary,
+                         default_mode)
+
+    # GDB-specific host paths
     @property
     def gdbinit_dir(self):
         return os.path.join(self.script_dir, 'gdbinit')
 
-    def gdbserver_script_file(self, gdbserver_mode):
-        return 'gdbserver_' + self.id_pretty_mode(gdbserver_mode)
-
-    def gdbserver_script(self, gdbserver_mode):
-        return os.path.join(self.script_dir, self.gdbserver_script_file(gdbserver_mode))
-
     @property
     def gdbinit(self):
-        return os.path.join(
-            self.gdbinit_dir, 'gdbinit_' + self.id_pretty)
+        return os.path.join(self.gdbinit_dir, 'gdbinit_' + self.id_pretty)
 
     @property
     def gdb_script(self):
-        return os.path.join(
-            self.script_dir, 'gdb_' + self.id_pretty)
+        return os.path.join(self.script_dir, 'gdb_' + self.id_pretty)
+
+    def server_script_file(self, mode):
+        return 'gdbserver_' + self.id_pretty_mode(mode)
+
+    def server_script(self, mode):
+        return os.path.join(self.script_dir, self.server_script_file(mode))
 
     # gdbserver files on the target
-    def gdbserver_tmp_dir(self, gdbserver_mode):
-        return os.path.join('/tmp', 'gdbserver_%s' % self.id_pretty_mode(gdbserver_mode))
+    def _gdbserver_tmp_dir(self, mode):
+        return os.path.join('/tmp', 'gdbserver_%s' % self.id_pretty_mode(mode))
 
-    def gdbserver_pid_file(self, gdbserver_mode):
-        return os.path.join(self.gdbserver_tmp_dir(gdbserver_mode), 'gdbserver.pid')
+    def _gdbserver_pid_file(self, mode):
+        return os.path.join(self._gdbserver_tmp_dir(mode), 'gdbserver.pid')
 
-    def gdbserver_log_file(self, gdbserver_mode):
-        return os.path.join(self.gdbserver_tmp_dir(gdbserver_mode), 'gdbserver.log')
+    def _gdbserver_log_file(self, mode):
+        return os.path.join(self._gdbserver_tmp_dir(mode), 'gdbserver.log')
 
-    def _target_gdbserver_start_cmd(self, gdbserver_mode):
-        """Get the ssh command to start gdbserver on the target device
+    def _target_start_cmd(self, server_mode):
+        """SSH command to start gdbserver on the target device.
 
-        returns something like:
+        Returns something like:
           "\"/bin/sh -c '/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example'\""
-        or for multi mode:
-          "\"/bin/sh -c 'if [ \"$1\" = \"stop\" ]; then ... else ... fi'\""
         """
-        if gdbserver_mode == GdbServerModes.ONCE:
+        if server_mode == DebuggerServerModes.ONCE:
             gdbserver_cmd_start = "%s --once :%s %s" % (
-                self.gdb_cross.gdbserver_path, self.gdbserver_port, self.binary.binary_path)
-        elif gdbserver_mode == GdbServerModes.ATTACH:
+                self.debugger_cross.debug_server_path, self.debug_server_port, self.binary.binary_path)
+        elif server_mode == DebuggerServerModes.ATTACH:
             pid_command = self.binary.pid_command
             if pid_command:
                 gdbserver_cmd_start = "%s --attach :%s \\$(%s)" % (
-                    self.gdb_cross.gdbserver_path,
-                    self.gdbserver_port,
+                    self.debugger_cross.debug_server_path,
+                    self.debug_server_port,
                     pid_command)
             else:
                 raise DevtoolError("Cannot use gdbserver attach mode for binary %s. No PID found." % self.binary.binary_path)
-        elif gdbserver_mode == GdbServerModes.MULTI:
-            gdbserver_cmd_start = "test -f %s && exit 0; " % self.gdbserver_pid_file(gdbserver_mode)
-            gdbserver_cmd_start += "mkdir -p %s; " % self.gdbserver_tmp_dir(gdbserver_mode)
+        elif server_mode == DebuggerServerModes.MULTI:
+            gdbserver_cmd_start = "test -f %s && exit 0; " % self._gdbserver_pid_file(server_mode)
+            gdbserver_cmd_start += "mkdir -p %s; " % self._gdbserver_tmp_dir(server_mode)
             gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & " % (
-                self.gdb_cross.gdbserver_path, self.gdbserver_port, self.gdbserver_log_file(gdbserver_mode))
-            gdbserver_cmd_start += "echo \\$! > %s;" % self.gdbserver_pid_file(gdbserver_mode)
+                self.debugger_cross.debug_server_path, self.debug_server_port, self._gdbserver_log_file(server_mode))
+            gdbserver_cmd_start += "echo \\$! > %s;" % self._gdbserver_pid_file(server_mode)
         else:
-            raise DevtoolError("Unsupported gdbserver mode: %s" % gdbserver_mode)
+            raise DevtoolError("Unsupported gdbserver mode: %s" % server_mode)
         return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
 
-    def _target_gdbserver_kill_cmd(self):
-        """Get the ssh command to kill gdbserver on the target device"""
-        return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.gdbserver_port
-
-    def _target_ssh_gdbserver_args(self):
-        ssh_args = []
-        if self.gdb_cross.target_device.ssh_port:
-            ssh_args += self.gdb_cross.target_device.ssh_port
-        if self.gdb_cross.target_device.extraoptions:
-            ssh_args.extend(self.gdb_cross.target_device.extraoptions)
-        if self.gdb_cross.target_device.target:
-            ssh_args.append(self.gdb_cross.target_device.target)
-        return ssh_args
-
-    def gdbserver_modes(self):
-        """Get the list of gdbserver modes for which scripts are generated"""
-        modes = [self.gdbserver_default_mode]
-        if self.binary.runs_as_service and self.gdbserver_default_mode != GdbServerModes.ATTACH:
-            modes.append(GdbServerModes.ATTACH)
-        return modes
-
-    def initialize(self):
-        """Interface function to initialize the gdb config generation"""
-        pass
+    def _target_kill_cmd(self):
+        """SSH command to kill gdbserver on the target device."""
+        return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.debug_server_port
 
 
 
@@ -167,7 +190,7 @@ class IdeBase:
 
     def __init__(self):
         self.ide_name = 'undefined'
-        self.gdb_cross_configs = []
+        self.cross_debug_configs = []
 
     @classmethod
     def ide_plugin_priority(cls):
@@ -182,12 +205,12 @@ class IdeBase:
         logger.warn("Modified recipe mode is not supported for IDE %s" %
                     self.ide_name)
 
-    def initialize_gdb_cross_configs(self, image_recipe, modified_recipe, gdb_cross_config_class=GdbCrossConfig):
+    def initialize_cross_debug_configs(self, image_recipe, modified_recipe, cross_debug_config_class=GdbCrossConfig):
         for _, exec_bin in modified_recipe.installed_binaries.items():
-            gdb_cross_config = gdb_cross_config_class(
+            cross_debug_config = cross_debug_config_class(
                 image_recipe, modified_recipe, exec_bin)
-            gdb_cross_config.initialize()
-            self.gdb_cross_configs.append(gdb_cross_config)
+            cross_debug_config.initialize()
+            self.cross_debug_configs.append(cross_debug_config)
 
     @staticmethod
     def gen_oe_scripts_sym_link(modified_recipe):
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 38f73e355c..dfaba3cff6 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -9,27 +9,27 @@ import json
 import logging
 import os
 import shutil
-from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, GdbServerModes, get_devtool_deploy_opts
+from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, get_devtool_deploy_opts
 
 logger = logging.getLogger('devtool')
 
 
 class GdbCrossConfigVSCode(GdbCrossConfig):
     def __init__(self, image_recipe, modified_recipe, binary,
-                 gdbserver_default_mode=GdbServerModes.ONCE):
+                 default_mode=DebuggerServerModes.ONCE):
         super().__init__(image_recipe, modified_recipe, binary,
-                         gdbserver_default_mode)
+                         default_mode)
 
-    def target_ssh_gdbserver_start_args(self, gdbserver_mode=None):
+    def target_ssh_gdbserver_start_args(self, mode=None):
         """Get the ssh command arguments to start gdbserver on the target device
 
         returns something like:
           ['-p', '2222', 'root@target', '"/bin/sh -c \'/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example\'"']
         """
-        if gdbserver_mode is None:
-            gdbserver_mode = self.gdbserver_default_mode
-        return self._target_ssh_gdbserver_args() + [
-            self._target_gdbserver_start_cmd(gdbserver_mode)
+        if mode is None:
+            mode = self.default_mode
+        return self._target_ssh_args() + [
+            self._target_start_cmd(mode)
         ]
 
     def target_ssh_gdbserver_kill_args(self):
@@ -38,13 +38,10 @@ class GdbCrossConfigVSCode(GdbCrossConfig):
         returns something like:
           ['-p', '2222', 'root@target', '"kill $(pgrep -o -f \'gdbserver --attach :1234\') 2>/dev/null || true"']
         """
-        return self._target_ssh_gdbserver_args() + [
-            self._target_gdbserver_kill_cmd()
+        return self._target_ssh_args() + [
+            self._target_kill_cmd()
         ]
 
-    def initialize(self):
-        pass
-
 
 class IdeVSCode(IdeBase):
     """Manage IDE configurations for VSCode
@@ -329,22 +326,27 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), prop_file, properties_dicts)
 
-    def vscode_launch_bin_dbg(self, gdb_cross_config, gdbserver_mode):
-        modified_recipe = gdb_cross_config.modified_recipe
+    def vscode_launch_bin_dbg(self, cross_debug_config, server_mode):
+        """Dispatch to the GDB launch config generator."""
+        return self._vscode_launch_bin_dbg_gdb(cross_debug_config, server_mode)
+
+    def _vscode_launch_bin_dbg_gdb(self, cross_debug_config, server_mode):
+        """Generate a cppdbg (GDB) launch configuration entry for launch.json."""
+        modified_recipe = cross_debug_config.modified_recipe
 
         launch_config = {
-            "name": gdb_cross_config.id_pretty_mode(gdbserver_mode),
+            "name": cross_debug_config.id_pretty_mode(server_mode),
             "type": "cppdbg",
             "request": "launch",
-            "program": gdb_cross_config.binary.binary_host_path,
+            "program": cross_debug_config.binary.binary_host_path,
             "stopAtEntry": True,
             "cwd": "${workspaceFolder}",
             "environment": [],
             "externalConsole": False,
             "MIMode": "gdb",
-            "preLaunchTask": gdb_cross_config.id_pretty_mode(gdbserver_mode),
-            "miDebuggerPath": modified_recipe.gdb_cross.gdb,
-            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.gdb_cross.host, gdb_cross_config.gdbserver_port)
+            "preLaunchTask": cross_debug_config.id_pretty_mode(server_mode),
+            "miDebuggerPath": modified_recipe.debugger_cross.gdb,
+            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.debugger_cross.host, cross_debug_config.debug_server_port)
         }
 
         # Search for header files in recipe-sysroot.
@@ -360,9 +362,9 @@ class IdeVSCode(IdeBase):
             }
         ]
 
-        if gdb_cross_config.image_recipe.rootfs_dbg:
+        if cross_debug_config.image_recipe.rootfs_dbg:
             launch_config['additionalSOLibSearchPath'] = modified_recipe.solib_search_path_str(
-                gdb_cross_config.image_recipe)
+                cross_debug_config.image_recipe)
             # First: Search for sources of this recipe in the workspace folder
             # If compiled with DEBUG_PREFIX_MAP = "", no reverse map is is needed. The binaries
             # contain the full path to the source files. But by default there is a reverse map.
@@ -383,7 +385,7 @@ class IdeVSCode(IdeBase):
                 )
             else:
                 src_file_map["/usr/src/debug"] = os.path.join(
-                    gdb_cross_config.image_recipe.rootfs_dbg, "usr", "src", "debug")
+                    cross_debug_config.image_recipe.rootfs_dbg, "usr", "src", "debug")
         else:
             logger.warning(
                 "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
@@ -406,8 +408,8 @@ class IdeVSCode(IdeBase):
         launch_config['setupCommands'] = setup_commands
 
         # Add postDebugTask for attach mode to clean up gdbserver
-        if gdbserver_mode == GdbServerModes.ATTACH:
-            kill_task_label = "kill_gdbserver_" + gdb_cross_config.id_pretty_mode(gdbserver_mode)
+        if server_mode == DebuggerServerModes.ATTACH:
+            kill_task_label = "kill_gdbserver_" + cross_debug_config.id_pretty_mode(server_mode)
             launch_config["postDebugTask"] = kill_task_label
 
         return launch_config
@@ -423,10 +425,10 @@ class IdeVSCode(IdeBase):
         """
 
         configurations = []
-        for gdb_cross_config in self.gdb_cross_configs:
-            if gdb_cross_config.modified_recipe is modified_recipe:
-                for gdbserver_mode in gdb_cross_config.gdbserver_modes():
-                    configurations.append(self.vscode_launch_bin_dbg(gdb_cross_config, gdbserver_mode))
+        for cross_debug_config in self.cross_debug_configs:
+            if cross_debug_config.modified_recipe is modified_recipe:
+                for server_mode in cross_debug_config.server_modes():
+                    configurations.append(self.vscode_launch_bin_dbg(cross_debug_config, server_mode))
         launch_dict = {
             "version": "0.2.0",
             "configurations": configurations
@@ -450,16 +452,16 @@ class IdeVSCode(IdeBase):
                 }
             ]
         }
-        for gdb_cross_config in self.gdb_cross_configs:
-            if gdb_cross_config.modified_recipe is not modified_recipe:
+        for cross_debug_config in self.cross_debug_configs:
+            if cross_debug_config.modified_recipe is not modified_recipe:
                 continue
-            for gdbserver_mode in gdb_cross_config.gdbserver_modes():
+            for server_mode in cross_debug_config.server_modes():
                 new_task = {
-                    "label": gdb_cross_config.id_pretty_mode(gdbserver_mode),
+                    "label": cross_debug_config.id_pretty_mode(server_mode),
                     "type": "shell",
                     "isBackground": True,
-                    "command": gdb_cross_config.gdb_cross.target_device.ssh_sshexec,
-                    "args": gdb_cross_config.target_ssh_gdbserver_start_args(gdbserver_mode),
+                    "command": cross_debug_config.debugger_cross.target_device.ssh_sshexec,
+                    "args": cross_debug_config.target_ssh_gdbserver_start_args(server_mode),
                     "problemMatcher": [
                         {
                             "pattern": [
@@ -479,7 +481,7 @@ class IdeVSCode(IdeBase):
                     ]
                 }
                 # Deploy the artifacts to the target before starting gdbserver if not already running
-                if gdbserver_mode != GdbServerModes.ATTACH:
+                if server_mode != DebuggerServerModes.ATTACH:
                     new_task['dependsOn'] = [
                         install_task_name
                     ]
@@ -495,13 +497,13 @@ class IdeVSCode(IdeBase):
                 # 4. Press the Stop button which detaches gdbserver from the debugged process
                 # 5. Start debugging again in attach mode
                 # Without this kill task, step 5 would fail because gdbserver is still running
-                if gdbserver_mode == GdbServerModes.ATTACH:
-                    new_task_kill_label = "kill_gdbserver_"+ gdb_cross_config.id_pretty_mode(gdbserver_mode)
+                if server_mode == DebuggerServerModes.ATTACH:
+                    new_task_kill_label = "kill_gdbserver_"+ cross_debug_config.id_pretty_mode(server_mode)
                     new_task_kill = {
                         "label": new_task_kill_label,
                         "type": "shell",
-                        "command": gdb_cross_config.gdb_cross.target_device.ssh_sshexec,
-                        "args": gdb_cross_config.target_ssh_gdbserver_kill_args(),
+                        "command": cross_debug_config.debugger_cross.target_device.ssh_sshexec,
+                        "args": cross_debug_config.target_ssh_gdbserver_kill_args(),
                         "presentation": {
                             "close": True
                         },
@@ -538,7 +540,7 @@ class IdeVSCode(IdeBase):
         launch.json 'reload kernel module' entry uses preLaunchTask: verify,
         providing a single F5 / click action for the complete reload cycle.
         """
-        td = modified_recipe.gdb_cross.target_device
+        td = modified_recipe.debugger_cross.target_device
         ko_name = modified_recipe.bpn + '.ko'
         # rmmod / lsmod use the kernel module name (- replaced by _ per kernel convention)
         mod_name = modified_recipe.bpn.replace('-', '_')
@@ -664,36 +666,49 @@ class IdeVSCode(IdeBase):
                 }
             ]
         }
-        if modified_recipe.gdb_cross:
-            for gdb_cross_config in self.gdb_cross_configs:
-                if gdb_cross_config.modified_recipe is not modified_recipe:
+        if modified_recipe.debugger_cross:
+            for cross_debug_config in self.cross_debug_configs:
+                if cross_debug_config.modified_recipe is not modified_recipe:
                     continue
-                for gdbserver_mode in gdb_cross_config.gdbserver_modes():
-                    new_task = {
-                        "label": gdb_cross_config.id_pretty(gdbserver_mode),
-                        "type": "shell",
-                        "isBackground": True,
-                        "command": gdb_cross_config.gdb_cross.target_device.ssh_sshexec,
-                        "args": gdb_cross_config.target_ssh_gdbserver_start_args(gdbserver_mode),
-                        "problemMatcher": [
-                            {
-                                "pattern": [
-                                    {
-                                        "regexp": ".",
-                                        "file": 1,
-                                        "location": 2,
-                                        "message": 3
+                for server_mode in cross_debug_config.server_modes():
+                    if server_mode == DebuggerServerModes.MULTI:
+                        # MULTI mode: SSH command blocks until port is ready, treat as
+                        # a regular non-background task (same as vscode_tasks_cpp).
+                        new_task = {
+                            "label": cross_debug_config.id_pretty_mode(server_mode),
+                            "type": "shell",
+                            "command": cross_debug_config.debugger_cross.target_device.ssh_sshexec,
+                            "args": cross_debug_config.target_ssh_gdbserver_start_args(server_mode),
+                            "problemMatcher": []
+                        }
+                    else:
+                        # ONCE / ATTACH: server runs for the whole session, needs
+                        # isBackground so VSCode does not wait for the task to exit.
+                        new_task = {
+                            "label": cross_debug_config.id_pretty_mode(server_mode),
+                            "type": "shell",
+                            "isBackground": True,
+                            "command": cross_debug_config.debugger_cross.target_device.ssh_sshexec,
+                            "args": cross_debug_config.target_ssh_gdbserver_start_args(server_mode),
+                            "problemMatcher": [
+                                {
+                                    "pattern": [
+                                        {
+                                            "regexp": ".",
+                                            "file": 1,
+                                            "location": 2,
+                                            "message": 3
+                                        }
+                                    ],
+                                    "background": {
+                                        "activeOnStart": True,
+                                        "beginsPattern": ".",
+                                        "endsPattern": ".",
                                     }
-                                ],
-                                "background": {
-                                    "activeOnStart": True,
-                                    "beginsPattern": ".",
-                                    "endsPattern": ".",
                                 }
-                            }
-                        ]
-                    }
-                    if gdbserver_mode != GdbServerModes.ATTACH:
+                            ]
+                        }
+                    if server_mode != DebuggerServerModes.ATTACH:
                         new_task['dependsOn'] = [
                             dt_build_deploy_label
                         ]
@@ -703,7 +718,7 @@ class IdeVSCode(IdeBase):
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
 
     def vscode_tasks(self, args, modified_recipe):
-        if modified_recipe.build_tool.is_c_ccp:
+        if modified_recipe.build_tool.is_c_cpp:
             self.vscode_tasks_cpp(args, modified_recipe)
         elif modified_recipe.build_tool == BuildTool.KERNEL_MODULE:
             self.vscode_tasks_kernel_module(args, modified_recipe)
@@ -715,7 +730,7 @@ class IdeVSCode(IdeBase):
         self.vscode_extensions(modified_recipe)
         self.vscode_c_cpp_properties(modified_recipe)
         if args.target:
-            self.initialize_gdb_cross_configs(
+            self.initialize_cross_debug_configs(
                 image_recipe, modified_recipe, GdbCrossConfigVSCode)
             self.vscode_launch(args, modified_recipe)
             self.vscode_tasks(args, modified_recipe)
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index ed96afa33c..f390331776 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -9,38 +9,38 @@ import os
 import logging
 import stat
 from bb.utils import mkdirhier
-from devtool.ide_plugins import IdeBase, GdbCrossConfig, GdbServerModes
+from devtool.ide_plugins import IdeBase, GdbCrossConfig, DebuggerServerModes
 
 logger = logging.getLogger('devtool')
 
 
 class GdbCrossConfigNone(GdbCrossConfig):
     def __init__(self, image_recipe, modified_recipe, binary,
-                 gdbserver_default_mode=GdbServerModes.MULTI):
+                 default_mode=DebuggerServerModes.MULTI):
         super().__init__(image_recipe, modified_recipe, binary,
-                         gdbserver_default_mode)
+                         default_mode)
 
-    def _target_gdbserver_stop_cmd(self, gdbserver_mode):
+    def _target_gdbserver_stop_cmd(self, server_mode):
         """Kill a gdbserver process"""
         # This is the usual behavior: gdbserver is stopped on demand
-        if gdbserver_mode == GdbServerModes.MULTI:
+        if server_mode == DebuggerServerModes.MULTI:
             gdbserver_cmd_stop = "test -f %s && kill \\$(cat %s);" % (
-                self.gdbserver_pid_file(gdbserver_mode), self.gdbserver_pid_file(gdbserver_mode))
-            gdbserver_cmd_stop += " rm -rf %s" % self.gdbserver_tmp_dir(gdbserver_mode)
+                self._gdbserver_pid_file(server_mode), self._gdbserver_pid_file(server_mode))
+            gdbserver_cmd_stop += " rm -rf %s" % self._gdbserver_tmp_dir(server_mode)
         # This is unexpected since gdbserver should terminate after each debug session
         # Just kill all gdbserver instances to keep it simple
         else:
             gdbserver_cmd_stop = "killall gdbserver"
         return "\"/bin/sh -c '" + gdbserver_cmd_stop + "'\""
 
-    def _gen_gdbserver_start_script(self, gdbserver_mode=None):
+    def _gen_gdbserver_start_script(self, server_mode=None):
         """Generate a shell script starting the gdbserver on the remote device via ssh"""
-        if gdbserver_mode is None:
-            gdbserver_mode = self.gdbserver_default_mode
-        gdbserver_cmd_start = self._target_gdbserver_start_cmd(gdbserver_mode)
-        gdbserver_cmd_stop = self._target_gdbserver_stop_cmd(gdbserver_mode)
-        remote_ssh = "%s %s" % (self.gdb_cross.target_device.ssh_sshexec,
-                                " ".join(self._target_ssh_gdbserver_args()))
+        if server_mode is None:
+            server_mode = self.default_mode
+        gdbserver_cmd_start = self._target_start_cmd(server_mode)
+        gdbserver_cmd_stop = self._target_gdbserver_stop_cmd(server_mode)
+        remote_ssh = "%s %s" % (self.debugger_cross.target_device.ssh_sshexec,
+                                " ".join(self._target_ssh_args()))
         gdbserver_cmd = ['#!/bin/sh']
         gdbserver_cmd.append('if [ "$1" = "stop" ]; then')
         gdbserver_cmd.append('  shift')
@@ -48,26 +48,26 @@ class GdbCrossConfigNone(GdbCrossConfig):
         gdbserver_cmd.append('else')
         gdbserver_cmd.append("  %s %s" % (remote_ssh, gdbserver_cmd_start))
         gdbserver_cmd.append('fi')
-        GdbCrossConfigNone.write_file(self.gdbserver_script(gdbserver_mode), gdbserver_cmd, True)
+        GdbCrossConfigNone.write_file(self.server_script(server_mode), gdbserver_cmd, True)
 
-    def _gen_gdbinit_config(self, gdbserver_mode=None):
+    def _gen_gdbinit_config(self, server_mode=None):
         """Generate a gdbinit file for this binary and the corresponding gdbserver configuration"""
-        if gdbserver_mode is None:
-            gdbserver_mode = self.gdbserver_default_mode
+        if server_mode is None:
+            server_mode = self.default_mode
         gdbinit_lines = ['# This file is generated by devtool ide-sdk']
-        if gdbserver_mode == GdbServerModes.MULTI:
-            target_help = '#   gdbserver --multi :%d' % self.gdbserver_port
+        if server_mode == DebuggerServerModes.MULTI:
+            target_help = '#   gdbserver --multi :%d' % self.debug_server_port
             remote_cmd = 'target extended-remote'
         else:
             target_help = '#   gdbserver :%d %s' % (
-                self.gdbserver_port, self.binary)
+                self.debug_server_port, self.binary)
             remote_cmd = 'target remote'
         gdbinit_lines.append('# On the remote target:')
         gdbinit_lines.append(target_help)
         gdbinit_lines.append('# On the build machine:')
         gdbinit_lines.append('#   cd ' + self.modified_recipe.real_srctree)
         gdbinit_lines.append(
-            '#   ' + self.gdb_cross.gdb + ' -ix ' + self.gdbinit)
+            '#   ' + self.debugger_cross.gdb + ' -ix ' + self.gdbinit)
         gdbinit_lines.append('set sysroot ' + self.modified_recipe.d)
 
         if self.image_recipe.rootfs_dbg:
@@ -111,7 +111,7 @@ class GdbCrossConfigNone(GdbCrossConfig):
             gdbinit_lines.append("end" + os.linesep)
 
         gdbinit_lines.append(
-            '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.gdbserver_port))
+            '%s %s:%d' % (remote_cmd, self.debugger_cross.host, self.debug_server_port))
         gdbinit_lines.append('set remote exec-file ' + self.binary.binary_path)
         gdbinit_lines.append('run ' + self.binary.binary_path)
 
@@ -121,14 +121,14 @@ class GdbCrossConfigNone(GdbCrossConfig):
         """Generate a script starting GDB with the corresponding gdbinit configuration."""
         cmd_lines = ['#!/bin/sh']
         cmd_lines.append('cd ' + self.modified_recipe.real_srctree)
-        cmd_lines.append(self.gdb_cross.gdb + ' -ix ' +
+        cmd_lines.append(self.debugger_cross.gdb + ' -ix ' +
                          self.gdbinit + ' "$@"')
         GdbCrossConfigNone.write_file(self.gdb_script, cmd_lines, True)
 
     def initialize(self):
         self._gen_gdbserver_start_script()
-        if self.binary.runs_as_service and self.gdbserver_default_mode != GdbServerModes.ATTACH:
-            self._gen_gdbserver_start_script(GdbServerModes.ATTACH)
+        if self.binary.runs_as_service and self.default_mode != DebuggerServerModes.ATTACH:
+            self._gen_gdbserver_start_script(DebuggerServerModes.ATTACH)
         self._gen_gdbinit_config()
         self._gen_gdb_start_script()
 
@@ -177,7 +177,7 @@ class IdeNone(IdeBase):
         script_path = modified_recipe.gen_install_deploy_script(args)
         logger.info("Created: %s" % script_path)
 
-        self.initialize_gdb_cross_configs(
+        self.initialize_cross_debug_configs(
             image_recipe, modified_recipe, GdbCrossConfigNone)
 
         IdeBase.gen_oe_scripts_sym_link(modified_recipe)
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 69b002b635..13fab50f22 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -130,7 +130,7 @@ class RecipeGdbCross(RecipeNative):
         gdb_path = os.path.join(
             self.staging_bindir_native, self.target_sys, gdb_bin)
         self.gdb = gdb_path
-        self.gdbserver_path = self.__find_gdbserver(config, tinfoil)
+        self.debug_server_path = self.__find_gdbserver(config, tinfoil)
 
     @property
     def host(self):
@@ -385,7 +385,7 @@ class RecipeModified:
     def __init__(self, name):
         self.name = name
         self.bootstrap_tasks = [name + ':do_install']
-        self.gdb_cross = None
+        self.debugger_cross = None
         # workspace
         self.real_srctree = None
         self.srctree = None
@@ -1169,21 +1169,25 @@ def ide_setup(args, config, basepath, workspace):
         if args.mode == DevtoolIdeMode.modified:
             logger.info("Setting up workspaces for modified recipe: %s" %
                         str(recipes_modified_names))
-            gdbs_cross = {}
+            debuggers = {}
             for recipe_name in recipes_modified_names:
                 recipe_modified = RecipeModified(recipe_name)
                 recipe_modified.initialize(config, workspace, tinfoil)
                 bootstrap_tasks += recipe_modified.bootstrap_tasks
                 recipes_modified.append(recipe_modified)
 
-                if recipe_modified.target_arch not in gdbs_cross:
+                # Key by (arch, toolchain) so recipes with different toolchains
+                # targeting the same arch each get the right debugger.
+                debugger_key = (recipe_modified.target_arch,
+                                recipe_modified.toolchain or '')
+                if debugger_key not in debuggers:
                     target_device = TargetDevice(args)
-                    gdb_cross = RecipeGdbCross(
+                    debugger = RecipeGdbCross(
                         args, recipe_modified.target_arch, target_device)
-                    gdb_cross.initialize(config, workspace, tinfoil)
-                    bootstrap_tasks += gdb_cross.bootstrap_tasks
-                    gdbs_cross[recipe_modified.target_arch] = gdb_cross
-                recipe_modified.gdb_cross = gdbs_cross[recipe_modified.target_arch]
+                    debugger.initialize(config, workspace, tinfoil)
+                    bootstrap_tasks += debugger.bootstrap_tasks
+                    debuggers[debugger_key] = debugger
+                recipe_modified.debugger_cross = debuggers[debugger_key]
 
     finally:
         tinfoil.shutdown()
@@ -1201,7 +1205,8 @@ def ide_setup(args, config, basepath, workspace):
                 config.init_path, basepath, bb_cmd_late, watch=True)
 
     wants_gdbserver = any(
-        r.wants_gdbserver for r in recipes_modified)
+        r.wants_gdbserver and r.toolchain == 'gcc'
+        for r in recipes_modified)
     for recipe_image in recipes_images:
         if wants_gdbserver and recipe_image.gdbserver_missing:
             logger.warning(
-- 
2.55.0


