Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF00DFC72CA
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 15:13:42 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32150.1774192414254248939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 08:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=KF2sG30C;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202603221513316cfe6b130300020703-_t0ln7@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202603221513316cfe6b130300020703
        for <openembedded-core@lists.openembedded.org>;
        Sun, 22 Mar 2026 16:13:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cJUIl+9uKq8LAXHgVcuDzz4lfApu4SNO4YBk0RRSK1c=;
 b=KF2sG30CTFlJsm1Y8t/kNE8q0AL+pig4yO9wyPQc6N++5I0bM4S5FR3cnlLB55Hlsc/hkg
 lQVx2hgMp2vHVSbIhd8Y0bUEP22AP/HCXItDuhjamarJL/qc+5TWB+Yv7fqhz09zV/iJEQSk
 3Zl+/o6xr1G+U9CWvJC/151QarHP5sGidBMPRkzl2uSLBGRv678oXPtReunYWqb7d/531T7k
 OM44NaUEICItN7FWHCU/wPHOccQpwXxk2dclLuvWUPZYeZCGAcbk5dXVceU/pP9KSJUPfDmd
 rga+7mpgP6t8s/703LAep+JCLZup8KtgPNY4+DJnUL/FRuHmByMuXYlg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 6/9] devtool: ide-sdk debugger back-end abstraction
Date: Sun, 22 Mar 2026 16:12:57 +0100
Message-ID: <20260322151320.661246-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260322151320.661246-1-adrian.freihofer@siemens.com>
References: <20260322151320.661246-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 15:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233682

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a refactoring of the devtool ide-sdk support for remote
debugging with gdbserver. The main goal is to cleanly separate the
generation of the host-side debugger configuration (gdbinit, wrapper
scripts) from the IDE-specific launch/task config generation, and to
provide a common interface for supporting multiple debug server
back-ends (gdbserver, lldb-server) in the future.

Also fix a typo in the GDB configuration generator where the property
was named "is_c_ccp" instead of "is_c_cpp".

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 195 +++++++++++---------
 scripts/lib/devtool/ide_plugins/ide_code.py |  38 ++--
 scripts/lib/devtool/ide_plugins/ide_none.py |  26 +--
 scripts/lib/devtool/ide_sdk.py              |  21 ++-
 4 files changed, 154 insertions(+), 126 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index eaf88e78cd..8c41afc640 100644
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
@@ -31,7 +31,7 @@ class BuildTool(Enum):
 
     @property
     def is_c_cpp_kernel(self):
-        if self.is_c_ccp or self is BuildTool.KERNEL_MODULE:
+        if self.is_c_cpp or self is BuildTool.KERNEL_MODULE:
             return True
         return False
 
@@ -42,104 +42,48 @@ class GdbServerModes(Enum):
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
         self.gdb_cross = modified_recipe.gdb_cross
         self.binary = binary
-        self.gdbserver_default_mode = gdbserver_default_mode
+        self.default_mode = default_mode
         self.binary_pretty = self.binary.binary_path.replace(os.sep, '-').lstrip('-')
-        self.gdbserver_port = GdbCrossConfig._gdbserver_port_next
-        GdbCrossConfig._gdbserver_port_next += 1
-        self.id_pretty = "%d_%s" % (self.gdbserver_port, self.binary_pretty)
+        self.port = DebuggerCrossConfig._port_next
+        DebuggerCrossConfig._port_next += 1
+        self.id_pretty = "%d_%s" % (self.port, self.binary_pretty)
 
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
 
-    @property
-    def gdbinit_dir(self):
-        return os.path.join(self.script_dir, 'gdbinit')
+    def server_script_file(self, mode):
+        return 'gdbserver_' + self.id_pretty_mode(mode)
 
-    def gdbserver_script_file(self, gdbserver_mode):
-        return 'gdbserver_' + self.id_pretty_mode(gdbserver_mode)
+    def server_script(self, mode):
+        return os.path.join(self.script_dir, self.server_script_file(mode))
 
-    def gdbserver_script(self, gdbserver_mode):
-        return os.path.join(self.script_dir, self.gdbserver_script_file(gdbserver_mode))
-
-    @property
-    def gdbinit(self):
-        return os.path.join(
-            self.gdbinit_dir, 'gdbinit_' + self.id_pretty)
-
-    @property
-    def gdb_script(self):
-        return os.path.join(
-            self.script_dir, 'gdb_' + self.id_pretty)
-
-    # gdbserver files on the target
-    def gdbserver_tmp_dir(self, gdbserver_mode):
-        return os.path.join('/tmp', 'gdbserver_%s' % self.id_pretty_mode(gdbserver_mode))
-
-    def gdbserver_pid_file(self, gdbserver_mode):
-        return os.path.join(self.gdbserver_tmp_dir(gdbserver_mode), 'gdbserver.pid')
-
-    def gdbserver_log_file(self, gdbserver_mode):
-        return os.path.join(self.gdbserver_tmp_dir(gdbserver_mode), 'gdbserver.log')
-
-    def _target_gdbserver_start_cmd(self, gdbserver_mode):
-        """Get the ssh command to start gdbserver on the target device
-
-        returns something like:
-          "\"/bin/sh -c '/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example'\""
-        or for multi mode:
-          "\"/bin/sh -c 'if [ \"$1\" = \"stop\" ]; then ... else ... fi'\""
-        """
-        if gdbserver_mode == GdbServerModes.ONCE:
-            gdbserver_cmd_start = "%s --once :%s %s" % (
-                self.gdb_cross.gdbserver_path, self.gdbserver_port, self.binary.binary_path)
-        elif gdbserver_mode == GdbServerModes.ATTACH:
-            pid_command = self.binary.pid_command
-            if pid_command:
-                gdbserver_cmd_start = "%s --attach :%s \\$(%s)" % (
-                    self.gdb_cross.gdbserver_path,
-                    self.gdbserver_port,
-                    pid_command)
-            else:
-                raise DevtoolError("Cannot use gdbserver attach mode for binary %s. No PID found." % self.binary.binary_path)
-        elif gdbserver_mode == GdbServerModes.MULTI:
-            gdbserver_cmd_start = "test -f %s && exit 0; " % self.gdbserver_pid_file(gdbserver_mode)
-            gdbserver_cmd_start += "mkdir -p %s; " % self.gdbserver_tmp_dir(gdbserver_mode)
-            gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & " % (
-                self.gdb_cross.gdbserver_path, self.gdbserver_port, self.gdbserver_log_file(gdbserver_mode))
-            gdbserver_cmd_start += "echo \\$! > %s;" % self.gdbserver_pid_file(gdbserver_mode)
-        else:
-            raise DevtoolError("Unsupported gdbserver mode: %s" % gdbserver_mode)
-        return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
-
-    def _target_gdbserver_kill_cmd(self):
-        """Get the ssh command to kill gdbserver on the target device"""
-        return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.gdbserver_port
-
-    def _target_ssh_gdbserver_args(self):
+    # SSH argument helpers
+    def _target_ssh_args(self):
         ssh_args = []
         if self.gdb_cross.target_device.ssh_port:
             ssh_args += ["-p", self.gdb_cross.target_device.ssh_port]
@@ -149,17 +93,94 @@ class GdbCrossConfig:
             ssh_args.append(self.gdb_cross.target_device.target)
         return ssh_args
 
-    def gdbserver_modes(self):
-        """Get the list of gdbserver modes for which scripts are generated"""
-        modes = [self.gdbserver_default_mode]
-        if self.binary.runs_as_service and self.gdbserver_default_mode != GdbServerModes.ATTACH:
+    def server_modes(self):
+        """List of debug-server modes for which scripts are generated."""
+        modes = [self.default_mode]
+        if self.binary.runs_as_service and self.default_mode != GdbServerModes.ATTACH:
             modes.append(GdbServerModes.ATTACH)
         return modes
 
     def initialize(self):
-        """Interface function to initialize the gdb config generation"""
+        """Called after construction to generate any required config files."""
         pass
 
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
+                 default_mode=GdbServerModes.MULTI):
+        super().__init__(image_recipe, modified_recipe, binary,
+                         default_mode)
+
+    # GDB-specific host paths
+    @property
+    def gdbinit_dir(self):
+        return os.path.join(self.script_dir, 'gdbinit')
+
+    @property
+    def gdbinit(self):
+        return os.path.join(self.gdbinit_dir, 'gdbinit_' + self.id_pretty)
+
+    @property
+    def gdb_script(self):
+        return os.path.join(self.script_dir, 'gdb_' + self.id_pretty)
+
+    # gdbserver files on the target
+    def _gdbserver_tmp_dir(self, mode):
+        return os.path.join('/tmp', 'gdbserver_%s' % self.id_pretty_mode(mode))
+
+    def _gdbserver_pid_file(self, mode):
+        return os.path.join(self._gdbserver_tmp_dir(mode), 'gdbserver.pid')
+
+    def _gdbserver_log_file(self, mode):
+        return os.path.join(self._gdbserver_tmp_dir(mode), 'gdbserver.log')
+
+    def _target_start_cmd(self, gdbserver_mode):
+        """SSH command to start gdbserver on the target device.
+
+        Returns something like:
+          "\"/bin/sh -c '/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example'\""
+        """
+        if gdbserver_mode == GdbServerModes.ONCE:
+            gdbserver_cmd_start = "%s --once :%s %s" % (
+                self.gdb_cross.gdbserver_path, self.port, self.binary.binary_path)
+        elif gdbserver_mode == GdbServerModes.ATTACH:
+            pid_command = self.binary.pid_command
+            if pid_command:
+                gdbserver_cmd_start = "%s --attach :%s \\$(%s)" % (
+                    self.gdb_cross.gdbserver_path,
+                    self.port,
+                    pid_command)
+            else:
+                raise DevtoolError("Cannot use gdbserver attach mode for binary %s. No PID found." % self.binary.binary_path)
+        elif gdbserver_mode == GdbServerModes.MULTI:
+            gdbserver_cmd_start = "test -f %s && exit 0; " % self._gdbserver_pid_file(gdbserver_mode)
+            gdbserver_cmd_start += "mkdir -p %s; " % self._gdbserver_tmp_dir(gdbserver_mode)
+            gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & " % (
+                self.gdb_cross.gdbserver_path, self.port, self._gdbserver_log_file(gdbserver_mode))
+            gdbserver_cmd_start += "echo \\$! > %s;" % self._gdbserver_pid_file(gdbserver_mode)
+        else:
+            raise DevtoolError("Unsupported gdbserver mode: %s" % gdbserver_mode)
+        return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
+
+    def _target_kill_cmd(self):
+        """SSH command to kill gdbserver on the target device."""
+        return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.port
+
+
 
 
 class IdeBase:
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 603d3cecf3..7fe5a40eb1 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -9,27 +9,27 @@ import json
 import logging
 import os
 import shutil
-from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, GdbServerModes, get_devtool_deploy_opts
+from devtool.ide_plugins import BuildTool, IdeBase, DebuggerCrossConfig, GdbCrossConfig, GdbServerModes, get_devtool_deploy_opts
 
 logger = logging.getLogger('devtool')
 
 
 class GdbCrossConfigVSCode(GdbCrossConfig):
     def __init__(self, image_recipe, modified_recipe, binary,
-                 gdbserver_default_mode=GdbServerModes.ONCE):
+                 default_mode=GdbServerModes.ONCE):
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
@@ -289,6 +286,11 @@ class IdeVSCode(IdeBase):
             self.dot_code_dir(modified_recipe), prop_file, properties_dicts)
 
     def vscode_launch_bin_dbg(self, gdb_cross_config, gdbserver_mode):
+        """Dispatch to the GDB launch config generator."""
+        return self._vscode_launch_bin_dbg_gdb(gdb_cross_config, gdbserver_mode)
+
+    def _vscode_launch_bin_dbg_gdb(self, gdb_cross_config, gdbserver_mode):
+        """Generate a cppdbg (GDB) launch configuration entry for launch.json."""
         modified_recipe = gdb_cross_config.modified_recipe
 
         launch_config = {
@@ -303,7 +305,7 @@ class IdeVSCode(IdeBase):
             "MIMode": "gdb",
             "preLaunchTask": gdb_cross_config.id_pretty_mode(gdbserver_mode),
             "miDebuggerPath": modified_recipe.gdb_cross.gdb,
-            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.gdb_cross.host, gdb_cross_config.gdbserver_port)
+            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.gdb_cross.host, gdb_cross_config.port)
         }
 
         # Search for header files in recipe-sysroot.
@@ -384,7 +386,7 @@ class IdeVSCode(IdeBase):
         configurations = []
         for gdb_cross_config in self.gdb_cross_configs:
             if gdb_cross_config.modified_recipe is modified_recipe:
-                for gdbserver_mode in gdb_cross_config.gdbserver_modes():
+                for gdbserver_mode in gdb_cross_config.server_modes():
                     configurations.append(self.vscode_launch_bin_dbg(gdb_cross_config, gdbserver_mode))
         launch_dict = {
             "version": "0.2.0",
@@ -415,7 +417,7 @@ class IdeVSCode(IdeBase):
         for gdb_cross_config in self.gdb_cross_configs:
             if gdb_cross_config.modified_recipe is not modified_recipe:
                 continue
-            for gdbserver_mode in gdb_cross_config.gdbserver_modes():
+            for gdbserver_mode in gdb_cross_config.server_modes():
                 new_task = {
                     "label": gdb_cross_config.id_pretty_mode(gdbserver_mode),
                     "type": "shell",
@@ -633,7 +635,7 @@ class IdeVSCode(IdeBase):
             for gdb_cross_config in self.gdb_cross_configs:
                 if gdb_cross_config.modified_recipe is not modified_recipe:
                     continue
-                for gdbserver_mode in gdb_cross_config.gdbserver_modes():
+                for gdbserver_mode in gdb_cross_config.server_modes():
                     new_task = {
                         "label": gdb_cross_config.id_pretty(gdbserver_mode),
                         "type": "shell",
@@ -668,7 +670,7 @@ class IdeVSCode(IdeBase):
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
 
     def vscode_tasks(self, args, modified_recipe):
-        if modified_recipe.build_tool.is_c_ccp:
+        if modified_recipe.build_tool.is_c_cpp:
             self.vscode_tasks_cpp(args, modified_recipe)
         elif modified_recipe.build_tool == BuildTool.KERNEL_MODULE:
             self.vscode_tasks_kernel_module(args, modified_recipe)
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index ed96afa33c..781e832ee8 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -16,17 +16,17 @@ logger = logging.getLogger('devtool')
 
 class GdbCrossConfigNone(GdbCrossConfig):
     def __init__(self, image_recipe, modified_recipe, binary,
-                 gdbserver_default_mode=GdbServerModes.MULTI):
+                 default_mode=GdbServerModes.MULTI):
         super().__init__(image_recipe, modified_recipe, binary,
-                         gdbserver_default_mode)
+                         default_mode)
 
     def _target_gdbserver_stop_cmd(self, gdbserver_mode):
         """Kill a gdbserver process"""
         # This is the usual behavior: gdbserver is stopped on demand
         if gdbserver_mode == GdbServerModes.MULTI:
             gdbserver_cmd_stop = "test -f %s && kill \\$(cat %s);" % (
-                self.gdbserver_pid_file(gdbserver_mode), self.gdbserver_pid_file(gdbserver_mode))
-            gdbserver_cmd_stop += " rm -rf %s" % self.gdbserver_tmp_dir(gdbserver_mode)
+                self._gdbserver_pid_file(gdbserver_mode), self._gdbserver_pid_file(gdbserver_mode))
+            gdbserver_cmd_stop += " rm -rf %s" % self._gdbserver_tmp_dir(gdbserver_mode)
         # This is unexpected since gdbserver should terminate after each debug session
         # Just kill all gdbserver instances to keep it simple
         else:
@@ -36,11 +36,11 @@ class GdbCrossConfigNone(GdbCrossConfig):
     def _gen_gdbserver_start_script(self, gdbserver_mode=None):
         """Generate a shell script starting the gdbserver on the remote device via ssh"""
         if gdbserver_mode is None:
-            gdbserver_mode = self.gdbserver_default_mode
-        gdbserver_cmd_start = self._target_gdbserver_start_cmd(gdbserver_mode)
+            gdbserver_mode = self.default_mode
+        gdbserver_cmd_start = self._target_start_cmd(gdbserver_mode)
         gdbserver_cmd_stop = self._target_gdbserver_stop_cmd(gdbserver_mode)
         remote_ssh = "%s %s" % (self.gdb_cross.target_device.ssh_sshexec,
-                                " ".join(self._target_ssh_gdbserver_args()))
+                                " ".join(self._target_ssh_args()))
         gdbserver_cmd = ['#!/bin/sh']
         gdbserver_cmd.append('if [ "$1" = "stop" ]; then')
         gdbserver_cmd.append('  shift')
@@ -48,19 +48,19 @@ class GdbCrossConfigNone(GdbCrossConfig):
         gdbserver_cmd.append('else')
         gdbserver_cmd.append("  %s %s" % (remote_ssh, gdbserver_cmd_start))
         gdbserver_cmd.append('fi')
-        GdbCrossConfigNone.write_file(self.gdbserver_script(gdbserver_mode), gdbserver_cmd, True)
+        GdbCrossConfigNone.write_file(self.server_script(gdbserver_mode), gdbserver_cmd, True)
 
     def _gen_gdbinit_config(self, gdbserver_mode=None):
         """Generate a gdbinit file for this binary and the corresponding gdbserver configuration"""
         if gdbserver_mode is None:
-            gdbserver_mode = self.gdbserver_default_mode
+            gdbserver_mode = self.default_mode
         gdbinit_lines = ['# This file is generated by devtool ide-sdk']
         if gdbserver_mode == GdbServerModes.MULTI:
-            target_help = '#   gdbserver --multi :%d' % self.gdbserver_port
+            target_help = '#   gdbserver --multi :%d' % self.port
             remote_cmd = 'target extended-remote'
         else:
             target_help = '#   gdbserver :%d %s' % (
-                self.gdbserver_port, self.binary)
+                self.port, self.binary)
             remote_cmd = 'target remote'
         gdbinit_lines.append('# On the remote target:')
         gdbinit_lines.append(target_help)
@@ -111,7 +111,7 @@ class GdbCrossConfigNone(GdbCrossConfig):
             gdbinit_lines.append("end" + os.linesep)
 
         gdbinit_lines.append(
-            '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.gdbserver_port))
+            '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.port))
         gdbinit_lines.append('set remote exec-file ' + self.binary.binary_path)
         gdbinit_lines.append('run ' + self.binary.binary_path)
 
@@ -127,7 +127,7 @@ class GdbCrossConfigNone(GdbCrossConfig):
 
     def initialize(self):
         self._gen_gdbserver_start_script()
-        if self.binary.runs_as_service and self.gdbserver_default_mode != GdbServerModes.ATTACH:
+        if self.binary.runs_as_service and self.default_mode != GdbServerModes.ATTACH:
             self._gen_gdbserver_start_script(GdbServerModes.ATTACH)
         self._gen_gdbinit_config()
         self._gen_gdb_start_script()
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 07f5552758..76cbccf618 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1159,21 +1159,25 @@ def ide_setup(args, config, basepath, workspace):
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
+                recipe_modified.gdb_cross = debuggers[debugger_key]
 
     finally:
         tinfoil.shutdown()
@@ -1191,7 +1195,8 @@ def ide_setup(args, config, basepath, workspace):
                 config.init_path, basepath, bb_cmd_late, watch=True)
 
     wants_gdbserver = any(
-        r.wants_gdbserver for r in recipes_modified)
+        r.wants_gdbserver and r.toolchain == 'gcc'
+        for r in recipes_modified)
     for recipe_image in recipes_images:
         if wants_gdbserver and recipe_image.gdbserver_missing:
             logger.warning(
-- 
2.53.0


