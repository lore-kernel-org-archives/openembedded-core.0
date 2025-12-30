Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EF3E94134
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 08:47:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60919.1767084455887739947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 00:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=qM2CKDmJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20251230084733237baf5a2300020799-r3vjw_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20251230084733237baf5a2300020799
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 09:47:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zzJ1YZuJ4WR+Ji/MIksmU7AyD0pCIRUDVTP8mTVhK8w=;
 b=qM2CKDmJdZQZ+NvBZsXEo49SfBAukKQTd9wLV22t69Juw8Qe3dJSZ+x24NsQp4TVwnvhx8
 et0sp7NMSLGMOezLzzsmApzXdHwEhTII2+/HHS6Lo8q5pwqcgBIYMtuYaee0a4s9I5psrSIG
 J6Q7b2XGCLy2trMrMY1ORLSQdQOhWFIvRAq/5Xg1/RiF+tThhPdPhO6CaMTEBBmk4rSljyuP
 QLlccVMtMjXodAVZc3cVO+MsXFL/zUIV3ycrVb2ey7jn3RUeKkgAX9QX5e8OXvnzuQkvLzn/
 DX0cFWy8NdZZsfQVBhW9BV/1BuiZMmhItR4JOv7+B0eeVLHZzU3ffnsQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/14] devtool: ide-sdk: add gdbserver attach mode support
Date: Tue, 30 Dec 2025 09:46:45 +0100
Message-ID: <20251230084720.2371227-6-adrian.freihofer@siemens.com>
In-Reply-To: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
References: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 08:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228637

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Enhance remote debugging configuration to support multiple modes
per executable binary. This adds support for gdbserver's attach
mode as an additional debug configuration.

When the binary is detected to run as a systemd service or SysV
init script, an attach debug configuration is generated alongside
the regular configuration that starts the process via gdbserver.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py     |  16 +-
 scripts/lib/devtool/ide_plugins/__init__.py | 218 +++++++++++++-------
 scripts/lib/devtool/ide_plugins/ide_code.py |  99 ++++++---
 scripts/lib/devtool/ide_plugins/ide_none.py |  14 +-
 scripts/lib/devtool/ide_sdk.py              | 172 ++++++++++++++-
 5 files changed, 406 insertions(+), 113 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index e78e6ed226..b40323c109 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2660,7 +2660,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("PASS: cpp-example-lib", output)
 
         # Verify remote debugging works
-        self._gdb_cross_debugging(
+        self._gdb_cross_debugging_multi(
             qemu, recipe_name, example_exe, MAGIC_STRING_ORIG)
 
         # Replace the Magic String in the code, compile and deploy to Qemu
@@ -2685,7 +2685,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("PASS: cpp-example-lib", output)
 
         # Verify remote debugging works wit the modified magic string
-        self._gdb_cross_debugging(
+        self._gdb_cross_debugging_multi(
             qemu, recipe_name, example_exe, MAGIC_STRING_NEW)
 
     def _gdb_cross(self):
@@ -2701,7 +2701,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertEqual(r.status, 0)
         self.assertIn("GNU gdb", r.output)
 
-    def _gdb_cross_debugging(self, qemu, recipe_name, example_exe, magic_string):
+    def _gdb_cross_debugging_multi(self, qemu, recipe_name, example_exe, magic_string):
         """Verify gdb-cross is working
 
         Test remote debugging:
@@ -2720,7 +2720,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         """
         sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
         gdbserver_script = os.path.join(self._workspace_scripts_dir(
-            recipe_name), 'gdbserver_1234_usr-bin-' + example_exe + '_m')
+            recipe_name), 'gdbserver_1234_usr-bin-' + example_exe + '_multi')
         gdb_script = os.path.join(self._workspace_scripts_dir(
             recipe_name), 'gdb_1234_usr-bin-' + example_exe)
 
@@ -2734,11 +2734,13 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn("gdbserver ", r.output)
 
         # Check the pid file is correct
-        test_cmd = "cat /proc/$(cat /tmp/gdbserver_1234_usr-bin-" + \
-            example_exe + "/pid)/cmdline"
+        test_cmd = "'cat /proc/$(cat /tmp/gdbserver_1234_usr-bin-" + \
+            example_exe + "_multi/gdbserver.pid)/cmdline'"
         r = runCmd('ssh %s root@%s %s' % (sshargs, qemu.ip, test_cmd), output_log=self._cmd_logger)
         self.assertEqual(r.status, 0)
         self.assertIn("gdbserver", r.output)
+        self.assertIn("--multi", r.output)
+        self.assertIn("1234", r.output)
 
         # Test remote debugging works
         gdb_batch_cmd = " --batch -ex 'break main' -ex 'run'"
@@ -2747,6 +2749,8 @@ class DevtoolIdeSdkTests(DevtoolBase):
         gdb_batch_cmd += " -ex 'print CppExample::test_string.compare(\"cpp-example-lib %saaa\")'" % magic_string
         gdb_batch_cmd += " -ex 'list cpp-example-lib.hpp:14,14'"
         gdb_batch_cmd += " -ex 'continue'"
+        return gdb_batch_cmd
+
         r = runCmd(gdb_script + gdb_batch_cmd, output_log=self._cmd_logger)
         self.logger.debug("%s %s returned: %s", gdb_script,
                           gdb_batch_cmd, r.output)
diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 19c2f61c5f..70f47d6e68 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -31,88 +31,155 @@ class BuildTool(Enum):
         return False
 
 
+class GdbServerModes(Enum):
+    ONCE = auto()
+    ATTACH = auto()
+    MULTI = auto()
+
+
 class GdbCrossConfig:
     """Base class defining the GDB configuration generator interface
 
     Generate a GDB configuration for a binary on the target device.
-    Only one instance per binary is allowed. This allows to assign unique port
-    numbers for all gdbserver instances.
     """
     _gdbserver_port_next = 1234
-    _binaries = []
+    _gdb_cross_configs = {}
 
-    def __init__(self, image_recipe, modified_recipe, binary, gdbserver_multi=True):
+    def __init__(self, image_recipe, modified_recipe, binary, gdbserver_default_mode):
         self.image_recipe = image_recipe
         self.modified_recipe = modified_recipe
         self.gdb_cross = modified_recipe.gdb_cross
         self.binary = binary
-        if binary in GdbCrossConfig._binaries:
-            raise DevtoolError(
-                "gdbserver config for binary %s is already generated" % binary)
-        GdbCrossConfig._binaries.append(binary)
-        self.script_dir = modified_recipe.ide_sdk_scripts_dir
-        self.gdbinit_dir = os.path.join(self.script_dir, 'gdbinit')
-        self.gdbserver_multi = gdbserver_multi
-        self.binary_pretty = self.binary.replace(os.sep, '-').lstrip('-')
+        self.gdbserver_default_mode = gdbserver_default_mode
+        self.binary_pretty = self.binary.binary_path.replace(os.sep, '-').lstrip('-')
         self.gdbserver_port = GdbCrossConfig._gdbserver_port_next
         GdbCrossConfig._gdbserver_port_next += 1
         self.id_pretty = "%d_%s" % (self.gdbserver_port, self.binary_pretty)
-        # gdbserver start script
-        gdbserver_script_file = 'gdbserver_' + self.id_pretty
-        if self.gdbserver_multi:
-            gdbserver_script_file += "_m"
-        self.gdbserver_script = os.path.join(
-            self.script_dir, gdbserver_script_file)
-        # gdbinit file
-        self.gdbinit = os.path.join(
+
+        # Track all generated gdbserver configs to avoid duplicates
+        if self.id_pretty in GdbCrossConfig._gdb_cross_configs:
+            raise DevtoolError(
+                "gdbserver config for binary %s is already generated" % binary)
+        GdbCrossConfig._gdb_cross_configs[self.id_pretty] = self
+
+    def id_pretty_mode(self, gdbserver_mode):
+        return "%s_%s" % (self.id_pretty, gdbserver_mode.name.lower())
+
+    # GDB and gdbserver script on the host
+    @property
+    def script_dir(self):
+        return self.modified_recipe.ide_sdk_scripts_dir
+
+    @property
+    def gdbinit_dir(self):
+        return os.path.join(self.script_dir, 'gdbinit')
+
+    def gdbserver_script_file(self, gdbserver_mode):
+        return 'gdbserver_' + self.id_pretty_mode(gdbserver_mode)
+
+    def gdbserver_script(self, gdbserver_mode):
+        return os.path.join(self.script_dir, self.gdbserver_script_file(gdbserver_mode))
+
+    @property
+    def gdbinit(self):
+        return os.path.join(
             self.gdbinit_dir, 'gdbinit_' + self.id_pretty)
-        # gdb start script
-        self.gdb_script = os.path.join(
+
+    @property
+    def gdb_script(self):
+        return os.path.join(
             self.script_dir, 'gdb_' + self.id_pretty)
 
-    def _gen_gdbserver_start_script(self):
-        """Generate a shell command starting the gdbserver on the remote device via ssh
+    # gdbserver files on the target
+    def gdbserver_tmp_dir(self, gdbserver_mode):
+        return os.path.join('/tmp', 'gdbserver_%s' % self.id_pretty_mode(gdbserver_mode))
 
-        GDB supports two modes:
-        multi: gdbserver remains running over several debug sessions
-        once: gdbserver terminates after the debugged process terminates
+    def gdbserver_pid_file(self, gdbserver_mode):
+        return os.path.join(self.gdbserver_tmp_dir(gdbserver_mode), 'gdbserver.pid')
+
+    def gdbserver_log_file(self, gdbserver_mode):
+        return os.path.join(self.gdbserver_tmp_dir(gdbserver_mode), 'gdbserver.log')
+
+    def _target_gdbserver_start_cmd(self, gdbserver_mode):
+        """Get the ssh command to start gdbserver on the target device
+
+        returns something like:
+          "\"/bin/sh -c '/usr/bin/gdbserver --once :1234 /usr/bin/cmake-example'\""
+        or for multi mode:
+          "\"/bin/sh -c 'if [ \"$1\" = \"stop\" ]; then ... else ... fi'\""
         """
-        cmd_lines = ['#!/bin/sh']
-        if self.gdbserver_multi:
-            temp_dir = "TEMP_DIR=/tmp/gdbserver_%s; " % self.id_pretty
-            gdbserver_cmd_start = temp_dir
-            gdbserver_cmd_start += "test -f \\$TEMP_DIR/pid && exit 0; "
-            gdbserver_cmd_start += "mkdir -p \\$TEMP_DIR; "
-            gdbserver_cmd_start += "%s --multi :%s > \\$TEMP_DIR/log 2>&1 & " % (
-                self.gdb_cross.gdbserver_path, self.gdbserver_port)
-            gdbserver_cmd_start += "echo \\$! > \\$TEMP_DIR/pid;"
-
-            gdbserver_cmd_stop = temp_dir
-            gdbserver_cmd_stop += "test -f \\$TEMP_DIR/pid && kill \\$(cat \\$TEMP_DIR/pid); "
-            gdbserver_cmd_stop += "rm -rf \\$TEMP_DIR; "
-
-            gdbserver_cmd_l = []
-            gdbserver_cmd_l.append('if [ "$1" = "stop" ]; then')
-            gdbserver_cmd_l.append('  shift')
-            gdbserver_cmd_l.append("  %s %s %s %s 'sh -c \"%s\"'" % (
-                self.gdb_cross.target_device.ssh_sshexec, self.gdb_cross.target_device.ssh_port, self.gdb_cross.target_device.extraoptions, self.gdb_cross.target_device.target, gdbserver_cmd_stop))
-            gdbserver_cmd_l.append('else')
-            gdbserver_cmd_l.append("  %s %s %s %s 'sh -c \"%s\"'" % (
-                self.gdb_cross.target_device.ssh_sshexec, self.gdb_cross.target_device.ssh_port, self.gdb_cross.target_device.extraoptions, self.gdb_cross.target_device.target, gdbserver_cmd_start))
-            gdbserver_cmd_l.append('fi')
-            gdbserver_cmd = os.linesep.join(gdbserver_cmd_l)
-        else:
+        if gdbserver_mode == GdbServerModes.ONCE:
             gdbserver_cmd_start = "%s --once :%s %s" % (
-                self.gdb_cross.gdbserver_path, self.gdbserver_port, self.binary)
-            gdbserver_cmd = "%s %s %s %s 'sh -c \"%s\"'" % (
-                self.gdb_cross.target_device.ssh_sshexec, self.gdb_cross.target_device.ssh_port, self.gdb_cross.target_device.extraoptions, self.gdb_cross.target_device.target, gdbserver_cmd_start)
-        cmd_lines.append(gdbserver_cmd)
-        GdbCrossConfig.write_file(self.gdbserver_script, cmd_lines, True)
+                self.gdb_cross.gdbserver_path, self.gdbserver_port, self.binary.binary_path)
+        elif gdbserver_mode == GdbServerModes.ATTACH:
+            pid_command = self.binary.pid_command
+            if pid_command:
+                gdbserver_cmd_start = "%s --attach :%s \\$(%s)" % (
+                    self.gdb_cross.gdbserver_path,
+                    self.gdbserver_port,
+                    pid_command)
+            else:
+                raise DevtoolError("Cannot use gdbserver attach mode for binary %s. No PID found." % self.binary.binary_path)
+        elif gdbserver_mode == GdbServerModes.MULTI:
+            gdbserver_cmd_start = "test -f %s && exit 0; " % self.gdbserver_pid_file(gdbserver_mode)
+            gdbserver_cmd_start += "mkdir -p %s; " % self.gdbserver_tmp_dir(gdbserver_mode)
+            gdbserver_cmd_start += "%s --multi :%s > %s 2>&1 & " % (
+                self.gdb_cross.gdbserver_path, self.gdbserver_port, self.gdbserver_log_file(gdbserver_mode))
+            gdbserver_cmd_start += "echo \\$! > %s;" % self.gdbserver_pid_file(gdbserver_mode)
+        else:
+            raise DevtoolError("Unsupported gdbserver mode: %s" % gdbserver_mode)
+        return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
 
-    def _gen_gdbinit_config(self):
+    def _target_gdbserver_stop_cmd(self, gdbserver_mode):
+        """Kill a gdbserver process"""
+        # This is the usual behavior: gdbserver is stopped on demand
+        if gdbserver_mode == GdbServerModes.MULTI:
+            gdbserver_cmd_stop = "test -f %s && kill \\$(cat %s);" % (
+                self.gdbserver_pid_file(gdbserver_mode), self.gdbserver_pid_file(gdbserver_mode))
+            gdbserver_cmd_stop += " rm -rf %s" % self.gdbserver_tmp_dir(gdbserver_mode)
+        # This is unexpected since gdbserver should terminate after each debug session
+        # Just kill all gdbserver instances to keep it simple
+        else:
+            gdbserver_cmd_stop = "killall gdbserver"
+        return "\"/bin/sh -c '" + gdbserver_cmd_stop + "'\""
+
+    def _target_gdbserver_kill_cmd(self):
+        """Get the ssh command to kill gdbserver on the target device"""
+        return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.gdbserver_port
+
+    def _target_ssh_gdbserver_args(self):
+        ssh_args = []
+        if self.gdb_cross.target_device.ssh_port:
+            ssh_args += ["-p", self.gdb_cross.target_device.ssh_port]
+        if self.gdb_cross.target_device.extraoptions:
+            ssh_args.extend(self.gdb_cross.target_device.extraoptions)
+        if self.gdb_cross.target_device.target:
+            ssh_args.append(self.gdb_cross.target_device.target)
+        return ssh_args
+
+    def _gen_gdbserver_start_script(self, gdbserver_mode=None):
+        """Generate a shell script starting the gdbserver on the remote device via ssh"""
+        if gdbserver_mode is None:
+            gdbserver_mode = self.gdbserver_default_mode
+        gdbserver_cmd_start = self._target_gdbserver_start_cmd(gdbserver_mode)
+        gdbserver_cmd_stop = self._target_gdbserver_stop_cmd(gdbserver_mode)
+        remote_ssh = "%s %s" % (self.gdb_cross.target_device.ssh_sshexec,
+                                " ".join(self._target_ssh_gdbserver_args()))
+        gdbserver_cmd = ['#!/bin/sh']
+        gdbserver_cmd.append('if [ "$1" = "stop" ]; then')
+        gdbserver_cmd.append('  shift')
+        gdbserver_cmd.append("  %s %s" % (remote_ssh, gdbserver_cmd_stop))
+        gdbserver_cmd.append('else')
+        gdbserver_cmd.append("  %s %s" % (remote_ssh, gdbserver_cmd_start))
+        gdbserver_cmd.append('fi')
+        GdbCrossConfig.write_file(self.gdbserver_script(gdbserver_mode), gdbserver_cmd, True)
+
+    def _gen_gdbinit_config(self, gdbserver_mode=None):
         """Generate a gdbinit file for this binary and the corresponding gdbserver configuration"""
+        if gdbserver_mode is None:
+            gdbserver_mode = self.gdbserver_default_mode
         gdbinit_lines = ['# This file is generated by devtool ide-sdk']
-        if self.gdbserver_multi:
+        if gdbserver_mode == GdbServerModes.MULTI:
             target_help = '#   gdbserver --multi :%d' % self.gdbserver_port
             remote_cmd = 'target extended-remote'
         else:
@@ -125,15 +192,15 @@ class GdbCrossConfig:
         gdbinit_lines.append('#   cd ' + self.modified_recipe.real_srctree)
         gdbinit_lines.append(
             '#   ' + self.gdb_cross.gdb + ' -ix ' + self.gdbinit)
-
         gdbinit_lines.append('set sysroot ' + self.modified_recipe.d)
-        gdbinit_lines.append('set substitute-path "/usr/include" "' +
-                             os.path.join(self.modified_recipe.recipe_sysroot, 'usr', 'include') + '"')
-        # Disable debuginfod for now, the IDE configuration uses rootfs-dbg from the image workdir.
-        gdbinit_lines.append('set debuginfod enabled off')
+
         if self.image_recipe.rootfs_dbg:
             gdbinit_lines.append(
                 'set solib-search-path "' + self.modified_recipe.solib_search_path_str(self.image_recipe) + '"')
+
+        gdbinit_lines.append('set substitute-path "/usr/include" "' +
+                             os.path.join(self.modified_recipe.recipe_sysroot, 'usr', 'include') + '"')
+        if self.image_recipe.rootfs_dbg:
             # First: Search for sources of this recipe in the workspace folder
             if self.modified_recipe.pn in self.modified_recipe.target_dbgsrc_dir:
                 gdbinit_lines.append('set substitute-path "%s" "%s"' %
@@ -151,11 +218,12 @@ class GdbCrossConfig:
         else:
             logger.warning(
                 "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
+        # Disable debuginfod for now, the IDE configuration uses rootfs-dbg from the image workdir.
+        gdbinit_lines.append('set debuginfod enabled off')
         gdbinit_lines.append(
             '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.gdbserver_port))
-        gdbinit_lines.append('set remote exec-file ' + self.binary)
-        gdbinit_lines.append(
-            'run ' + os.path.join(self.modified_recipe.d, self.binary))
+        gdbinit_lines.append('set remote exec-file ' + self.binary.binary_path)
+        gdbinit_lines.append('run ' + self.binary.binary_path)
 
         GdbCrossConfig.write_file(self.gdbinit, gdbinit_lines)
 
@@ -169,9 +237,18 @@ class GdbCrossConfig:
 
     def initialize(self):
         self._gen_gdbserver_start_script()
+        if self.binary.runs_as_service and self.gdbserver_default_mode != GdbServerModes.ATTACH:
+            self._gen_gdbserver_start_script(GdbServerModes.ATTACH)
         self._gen_gdbinit_config()
         self._gen_gdb_start_script()
 
+    def gdbserver_modes(self):
+        """Get the list of gdbserver modes for which scripts are generated"""
+        modes = [self.gdbserver_default_mode]
+        if self.binary.runs_as_service and self.gdbserver_default_mode != GdbServerModes.ATTACH:
+            modes.append(GdbServerModes.ATTACH)
+        return modes
+
     @staticmethod
     def write_file(script_file, cmd_lines, executable=False):
         script_dir = os.path.dirname(script_file)
@@ -206,15 +283,14 @@ class IdeBase:
                     self.ide_name)
 
     def initialize_gdb_cross_configs(self, image_recipe, modified_recipe, gdb_cross_config_class=GdbCrossConfig):
-        binaries = modified_recipe.find_installed_binaries()
-        for binary in binaries:
+        for _, exec_bin in modified_recipe.installed_binaries.items():
             gdb_cross_config = gdb_cross_config_class(
-                image_recipe, modified_recipe, binary)
+                image_recipe, modified_recipe, exec_bin)
             gdb_cross_config.initialize()
             self.gdb_cross_configs.append(gdb_cross_config)
 
     @staticmethod
-    def gen_oe_scrtips_sym_link(modified_recipe):
+    def gen_oe_scripts_sym_link(modified_recipe):
         # create a sym-link from sources to the scripts directory
         if os.path.isdir(modified_recipe.ide_sdk_scripts_dir):
             IdeBase.symlink_force(modified_recipe.ide_sdk_scripts_dir,
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index ee5bb57265..67bd341347 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -9,14 +9,26 @@ import json
 import logging
 import os
 import shutil
-from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, get_devtool_deploy_opts
+from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, GdbServerModes, get_devtool_deploy_opts
 
 logger = logging.getLogger('devtool')
 
 
 class GdbCrossConfigVSCode(GdbCrossConfig):
-    def __init__(self, image_recipe, modified_recipe, binary):
-        super().__init__(image_recipe, modified_recipe, binary, False)
+    def __init__(self, image_recipe, modified_recipe, binary,
+                 gdbserver_default_mode=GdbServerModes.ONCE):
+        super().__init__(image_recipe, modified_recipe, binary,
+                         gdbserver_default_mode)
+
+    def target_ssh_gdbserver_kill_args(self):
+        """Get the ssh command arguments to kill gdbserver on the target device
+
+        returns something like:
+          ['-p', '2222', 'root@target', '"kill $(pgrep -o -f \'gdbserver --attach :1234\') 2>/dev/null || true"']
+        """
+        return self._target_ssh_gdbserver_args() + [
+            self._target_gdbserver_kill_cmd()
+        ]
 
     def initialize(self):
         self._gen_gdbserver_start_script()
@@ -207,20 +219,20 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), prop_file, properties_dicts)
 
-    def vscode_launch_bin_dbg(self, gdb_cross_config):
+    def vscode_launch_bin_dbg(self, gdb_cross_config, gdbserver_mode):
         modified_recipe = gdb_cross_config.modified_recipe
 
         launch_config = {
-            "name": gdb_cross_config.id_pretty,
+            "name": gdb_cross_config.id_pretty_mode(gdbserver_mode),
             "type": "cppdbg",
             "request": "launch",
-            "program": os.path.join(modified_recipe.d, gdb_cross_config.binary.lstrip('/')),
+            "program": gdb_cross_config.binary.binary_host_path,
             "stopAtEntry": True,
             "cwd": "${workspaceFolder}",
             "environment": [],
             "externalConsole": False,
             "MIMode": "gdb",
-            "preLaunchTask": gdb_cross_config.id_pretty,
+            "preLaunchTask": gdb_cross_config.id_pretty_mode(gdbserver_mode),
             "miDebuggerPath": modified_recipe.gdb_cross.gdb,
             "miDebuggerServerAddress": "%s:%d" % (modified_recipe.gdb_cross.host, gdb_cross_config.gdbserver_port)
         }
@@ -260,6 +272,12 @@ class IdeVSCode(IdeBase):
 
         launch_config['sourceFileMap'] = src_file_map
         launch_config['setupCommands'] = setup_commands
+
+        # Add postDebugTask for attach mode to clean up gdbserver
+        if gdbserver_mode == GdbServerModes.ATTACH:
+            kill_task_label = "kill_gdbserver_" + gdb_cross_config.id_pretty_mode(gdbserver_mode)
+            launch_config["postDebugTask"] = kill_task_label
+
         return launch_config
 
     def vscode_launch(self, modified_recipe):
@@ -268,7 +286,8 @@ class IdeVSCode(IdeBase):
         configurations = []
         for gdb_cross_config in self.gdb_cross_configs:
             if gdb_cross_config.modified_recipe is modified_recipe:
-                configurations.append(self.vscode_launch_bin_dbg(gdb_cross_config))
+                for gdbserver_mode in gdb_cross_config.gdbserver_modes():
+                    configurations.append(self.vscode_launch_bin_dbg(gdb_cross_config, gdbserver_mode))
         launch_dict = {
             "version": "0.2.0",
             "configurations": configurations
@@ -294,15 +313,12 @@ class IdeVSCode(IdeBase):
         for gdb_cross_config in self.gdb_cross_configs:
             if gdb_cross_config.modified_recipe is not modified_recipe:
                 continue
-            tasks_dict['tasks'].append(
-                {
-                    "label": gdb_cross_config.id_pretty,
+            for gdbserver_mode in gdb_cross_config.gdbserver_modes():
+                new_task = {
+                    "label": gdb_cross_config.id_pretty_mode(gdbserver_mode),
                     "type": "shell",
                     "isBackground": True,
-                    "dependsOn": [
-                        install_task_name
-                    ],
-                    "command": gdb_cross_config.gdbserver_script,
+                    "command": gdb_cross_config.gdbserver_script(gdbserver_mode),
                     "problemMatcher": [
                         {
                             "pattern": [
@@ -320,7 +336,38 @@ class IdeVSCode(IdeBase):
                             }
                         }
                     ]
-                })
+                }
+                # Deploy the artifacts to the target before starting gdbserver if not already running
+                if gdbserver_mode != GdbServerModes.ATTACH:
+                    new_task['dependsOn'] = [
+                        install_task_name
+                    ]
+
+                tasks_dict['tasks'].append(new_task)
+
+                # For attach mode, add a kill task to stop a previously running gdbserver
+                # This is a known issue with gdbserver --attach that it does not terminate
+                # after detaching. With this helper task, it is possible to:
+                # 1. Start debugging in attach mode
+                # 2. Add breakpoints, step, continue, etc.
+                # 3. Press the Continue button
+                # 4. Press the Stop button which detaches gdbserver from the debugged process
+                # 5. Start debugging again in attach mode
+                # Without this kill task, step 5 would fail because gdbserver is still running
+                if gdbserver_mode == GdbServerModes.ATTACH:
+                    new_task_kill_label = "kill_gdbserver_"+ gdb_cross_config.id_pretty_mode(gdbserver_mode)
+                    new_task_kill = {
+                        "label": new_task_kill_label,
+                        "type": "shell",
+                        "command": gdb_cross_config.gdb_cross.target_device.ssh_sshexec,
+                        "args": gdb_cross_config.target_ssh_gdbserver_kill_args(),
+                        "presentation": {
+                            "close": True
+                        },
+                        "problemMatcher": []
+                    }
+                    tasks_dict['tasks'].append(new_task_kill)
+
         tasks_file = 'tasks.json'
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
@@ -410,15 +457,12 @@ class IdeVSCode(IdeBase):
             for gdb_cross_config in self.gdb_cross_configs:
                 if gdb_cross_config.modified_recipe is not modified_recipe:
                     continue
-                tasks_dict['tasks'].append(
-                    {
-                        "label": gdb_cross_config.id_pretty,
+                for gdbserver_mode in gdb_cross_config.gdbserver_modes():
+                    new_task = {
+                        "label": gdb_cross_config.id_pretty(gdbserver_mode),
                         "type": "shell",
                         "isBackground": True,
-                        "dependsOn": [
-                            dt_build_deploy_label
-                        ],
-                        "command": gdb_cross_config.gdbserver_script,
+                        "command": gdb_cross_config.gdbserver_script(gdbserver_mode),
                         "problemMatcher": [
                             {
                                 "pattern": [
@@ -436,7 +480,12 @@ class IdeVSCode(IdeBase):
                                 }
                             }
                         ]
-                    })
+                    }
+                    if gdbserver_mode != GdbServerModes.ATTACH:
+                        new_task['dependsOn'] = [
+                            dt_build_deploy_label
+                        ]
+                    tasks_dict['tasks'].append(new_task)
         tasks_file = 'tasks.json'
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
@@ -453,7 +502,7 @@ class IdeVSCode(IdeBase):
         self.vscode_c_cpp_properties(modified_recipe)
         if args.target:
             self.initialize_gdb_cross_configs(
-                image_recipe, modified_recipe, gdb_cross_config_class=GdbCrossConfigVSCode)
+                image_recipe, modified_recipe, GdbCrossConfigVSCode)
             self.vscode_launch(modified_recipe)
             self.vscode_tasks(args, modified_recipe)
 
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index f106c5a026..04677aba9d 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -7,11 +7,18 @@
 
 import os
 import logging
-from devtool.ide_plugins import IdeBase, GdbCrossConfig
+from devtool.ide_plugins import IdeBase, GdbCrossConfig, GdbServerModes
 
 logger = logging.getLogger('devtool')
 
 
+class GdbCrossConfigNone(GdbCrossConfig):
+    def __init__(self, image_recipe, modified_recipe, binary,
+                 gdbserver_default_mode=GdbServerModes.MULTI):
+        super().__init__(image_recipe, modified_recipe, binary,
+                         gdbserver_default_mode)
+
+
 class IdeNone(IdeBase):
     """Generate some generic helpers for other IDEs
 
@@ -44,9 +51,10 @@ class IdeNone(IdeBase):
         script_path = modified_recipe.gen_install_deploy_script(args)
         logger.info("Created: %s" % script_path)
 
-        self.initialize_gdb_cross_configs(image_recipe, modified_recipe)
+        self.initialize_gdb_cross_configs(
+            image_recipe, modified_recipe, GdbCrossConfigNone)
 
-        IdeBase.gen_oe_scrtips_sym_link(modified_recipe)
+        IdeBase.gen_oe_scripts_sym_link(modified_recipe)
 
 
 def register_ide_plugin(ide_plugins):
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 9df88454c7..2af4dca256 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -46,17 +46,17 @@ class TargetDevice:
     """SSH remote login parameters"""
 
     def __init__(self, args):
-        self.extraoptions = ''
+        self.extraoptions = []
         if args.no_host_check:
-            self.extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+            self.extraoptions += ['-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no']
         self.ssh_sshexec = 'ssh'
         if args.ssh_exec:
             self.ssh_sshexec = args.ssh_exec
         self.ssh_port = ''
         if args.port:
-            self.ssh_port = "-p %s" % args.port
+            self.ssh_port = ['-p', args.port]
         if args.key:
-            self.extraoptions += ' -i %s' % args.key
+            self.extraoptions += ['-i', args.key]
 
         self.target = args.target
         target_sp = args.target.split('@')
@@ -265,6 +265,112 @@ class RecipeNotModified:
         self.name = name
         self.bootstrap_tasks = [name + ':do_populate_sysroot']
 
+class ExecutableBinary:
+    """Represent an installed executable binary of a modified recipe"""
+
+    def __init__(self, image_dir_d, binary_path,
+                 systemd_services, init_scripts):
+        self.image_dir_d = image_dir_d
+        self.binary_path = binary_path
+        self.init_script = None
+        self.systemd_service = None
+
+        self._init_service_for_binary(systemd_services)
+        self._init_init_script_for_binary(init_scripts)
+
+    def _init_service_for_binary(self, systemd_services):
+        """Find systemd service file that handles this binary"""
+        service_dirs = [
+            'etc/systemd/system',
+            'lib/systemd/system',
+            'usr/lib/systemd/system'
+        ]
+        for _, services in systemd_services.items():
+            for service in services:
+                for service_dir in service_dirs:
+                    service_path = os.path.join(self.image_dir_d, service_dir, service)
+                    if os.path.exists(service_path):
+                        try:
+                            with open(service_path, 'r') as f:
+                                for line in f:
+                                    if line.strip().startswith('ExecStart='):
+                                        exec_start = line.strip()[10:].strip()  # Remove 'ExecStart='
+                                        # Remove any leading modifiers like '-' or '@'
+                                        exec_start = exec_start.lstrip('-@')
+                                        # Get the first word (the executable path)
+                                        exec_binary = exec_start.split()[0] if exec_start.split() else ''
+                                        if exec_binary == self.binary_path or exec_binary.endswith('/' + self.binary_path.lstrip('/')):
+                                            logger.debug("Found systemd service for binary %s: %s" % (self.binary_path, service))
+                                            self.systemd_service = service
+                        except (IOError, OSError):
+                            continue
+
+    def _init_init_script_for_binary(self, init_scripts):
+        """Find SysV init script that handles this binary"""
+        init_dirs = [
+            'etc/init.d',
+            'etc/rc.d/init.d'
+        ]
+        for _, init_scripts in init_scripts.items():
+            for init_script in init_scripts:
+                for init_dir in init_dirs:
+                    init_path = os.path.join(self.image_dir_d, init_dir, init_script)
+                    if os.path.exists(init_path):
+                        init_script_path = os.path.join("/", init_dir, init_script)
+                        binary_name = os.path.basename(self.binary_path)
+                        # if the init script file name is equal to the binary file name, return it directly
+                        if os.path.basename(init_script) == binary_name:
+                            logger.debug("Found SysV init script for binary %s: %s" % (self.binary_path, init_script_path))
+                            self.init_script = init_script_path
+                        # Otherwise check if the script containes a reference to the binary
+                        try:
+                            with open(init_path, 'r') as f:
+                                content = f.read()
+                                pattern = r'\b' + re.escape(binary_name) + r'\b'
+                                if re.search(pattern, content):
+                                    logger.debug("Found SysV init script for binary %s: %s" % (self.binary_path, init_script_path))
+                                    self.init_script = init_script_path
+                                    return
+                        except (IOError, OSError):
+                            continue
+
+    @property
+    def binary_host_path(self):
+        """Get the absolute path of this binary on the host"""
+        return os.path.join(self.image_dir_d, self.binary_path.lstrip('/'))
+
+    @property
+    def runs_as_service(self):
+        """Check if this binary is run by a service or init script"""
+        return self.systemd_service is not None or self.init_script is not None
+
+    @property
+    def start_command(self):
+        """Get the command to start this binary"""
+        if self.systemd_service:
+            return "systemctl start %s" % self.systemd_service
+        if self.init_script:
+            return "%s start" % self.init_script
+        return None
+
+    @property
+    def stop_command(self):
+        """Get the command to stop this binary"""
+        if self.systemd_service:
+            return "systemctl stop %s" % self.systemd_service
+        if self.init_script:
+            return "%s stop" % self.init_script
+        return None
+
+    @property
+    def pid_command(self):
+        """Get the command to get the PID of this binary"""
+        if self.systemd_service:
+            return "systemctl show --property MainPID --value %s" % self.systemd_service
+        if self.init_script:
+            return "pidof %s" % os.path.basename(self.binary_path)
+        return None
+
 
 class RecipeModified:
     """Handling of recipes in the workspace created by devtool modify"""
@@ -308,6 +414,9 @@ class RecipeModified:
         self.target_dbgsrc_dir = None
         self.topdir = None
         self.workdir = None
+        # Service management
+        self.systemd_services = {}
+        self.init_scripts = {}
         # replicate bitbake build environment
         self.exported_vars = None
         self.cmd_compile = None
@@ -324,6 +433,9 @@ class RecipeModified:
         self.extra_oemeson = None
         self.meson_cross_file = None
 
+        # Populated after bitbake built all the recipes
+        self._installed_binaries = None
+
     def initialize(self, config, workspace, tinfoil):
         recipe_d = parse_recipe(
             config, tinfoil, self.name, appends=True, filter_workspace=False)
@@ -378,6 +490,8 @@ class RecipeModified:
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
         self.__init_exported_variables(recipe_d)
+        self.__init_systemd_services(recipe_d)
+        self.__init_init_scripts(recipe_d)
 
         if bb.data.inherits_class('cmake', recipe_d):
             self.oecmake_generator = recipe_d.getVar('OECMAKE_GENERATOR')
@@ -498,6 +612,41 @@ class RecipeModified:
 
         self.exported_vars = exported_vars
 
+    def __init_systemd_services(self, d):
+        """Find all systemd service files for the recipe."""
+        services = {}
+        if bb.data.inherits_class('systemd', d):
+            systemd_packages = d.getVar('SYSTEMD_PACKAGES')
+            if systemd_packages:
+                for package in systemd_packages.split():
+                    services[package] = d.getVar('SYSTEMD_SERVICE:' + package).split()
+        self.systemd_services = services
+
+    def __init_init_scripts(self, d):
+        """Find all SysV init scripts for the recipe."""
+        init_scripts = {}
+        if bb.data.inherits_class('update-rc.d', d):
+            script_packages = d.getVar('INITSCRIPT_PACKAGES')
+            if script_packages:
+                for package in script_packages.split():
+                    initscript_name = d.getVar('INITSCRIPT_NAME:' + package)
+                    if initscript_name:
+                        # Handle both single script and multiple scripts
+                        scripts = initscript_name.split()
+                        if scripts:
+                            init_scripts[package] = scripts
+            else:
+                # If INITSCRIPT_PACKAGES is not set, check for default INITSCRIPT_NAME
+                initscript_name = d.getVar('INITSCRIPT_NAME')
+                if initscript_name:
+                    scripts = initscript_name.split()
+                    if scripts:
+                        # Use PN as the default package name when INITSCRIPT_PACKAGES is not set
+                        pn = d.getVar('PN')
+                        if pn:
+                            init_scripts[pn] = scripts
+        self.init_scripts = init_scripts
+
     def __init_cmake_preset_cache(self, d):
         """Get the arguments passed to cmake
 
@@ -662,9 +811,12 @@ class RecipeModified:
             return True
         return False
 
-    def find_installed_binaries(self):
+    @property
+    def installed_binaries(self):
         """find all executable elf files in the image directory"""
-        binaries = []
+        if self._installed_binaries:
+            return self._installed_binaries
+        binaries = {}
         d_len = len(self.d)
         re_so = re.compile(r'.*\.so[.0-9]*$')
         for root, _, files in os.walk(self.d, followlinks=False):
@@ -675,8 +827,12 @@ class RecipeModified:
                     continue
                 abs_name = os.path.join(root, file)
                 if os.access(abs_name, os.X_OK) and RecipeModified.is_elf_file(abs_name):
-                    binaries.append(abs_name[d_len:])
-        return sorted(binaries)
+                    binary_path = abs_name[d_len:]
+                    binary = ExecutableBinary(self.d, binary_path,
+                                              self.systemd_services, self.init_scripts)
+                    binaries[binary_path] = binary
+        self._installed_binaries = dict(sorted(binaries.items()))
+        return self._installed_binaries
 
     def gen_deploy_target_script(self, args):
         """Generate a script which does what devtool deploy-target does
-- 
2.52.0


