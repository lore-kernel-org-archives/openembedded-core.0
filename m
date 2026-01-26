Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC740C88E6F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 07:38:34 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14684.1769413110456146735
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 23:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=RM7bj40t;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202601260738288fbc3c27740002078b-mtybzv@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202601260738288fbc3c27740002078b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 Jan 2026 08:38:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4YkhFkhSFeT/siTvy3IM3+piO228DeZOkUt+Xd1BCIA=;
 b=RM7bj40tzmMfehx+CXP+tgGh4Aavf4JIIFe1exeo7iHuROjj46cj28pk2nXVca6tZyVgIR
 mbFy4Wc13L2YBlNEger8netDsu7KKU/GKz5bJOyl3qN1qZdE30th801ZYVsTepFu0P2ANfdL
 JWgFOsZR5WWuNoguvFCeA5stllwp4DTHCVcVvoPCd8COq2eYay+W0xqJaUlMlfUX33ykk8Jy
 6V9IQFTLOx/pUfufFAEP3HU/dXlX/u6epWa0K6T73Mf8LyMDWWAcV/CfeD/XTflvAiCjNbqK
 0PnmAfA0ZeVRrKCiNrmHhsQCN3aX4zn3lyoHC1Vv+l8WZfAR/g4lCJkg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 07/13] devtool: ide-sdk: move code to ide_none
Date: Mon, 26 Jan 2026 08:37:34 +0100
Message-ID: <20260126073809.468495-8-adrian.freihofer@siemens.com>
In-Reply-To: <20260126073809.468495-1-adrian.freihofer@siemens.com>
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 07:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229958

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Move code which is used by the ide_none plugin from the base class
to the ide_none plugin. This is just a refactoring, no functional
change.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 115 +-------------------
 scripts/lib/devtool/ide_plugins/ide_none.py | 112 +++++++++++++++++++
 2 files changed, 116 insertions(+), 111 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 70f47d6e68..80dfc1e235 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -9,10 +9,8 @@ import errno
 import json
 import logging
 import os
-import stat
 from enum import Enum, auto
 from devtool import DevtoolError
-from bb.utils import mkdirhier
 
 logger = logging.getLogger('devtool')
 
@@ -130,19 +128,6 @@ class GdbCrossConfig:
             raise DevtoolError("Unsupported gdbserver mode: %s" % gdbserver_mode)
         return "\"/bin/sh -c '" + gdbserver_cmd_start + "'\""
 
-    def _target_gdbserver_stop_cmd(self, gdbserver_mode):
-        """Kill a gdbserver process"""
-        # This is the usual behavior: gdbserver is stopped on demand
-        if gdbserver_mode == GdbServerModes.MULTI:
-            gdbserver_cmd_stop = "test -f %s && kill \\$(cat %s);" % (
-                self.gdbserver_pid_file(gdbserver_mode), self.gdbserver_pid_file(gdbserver_mode))
-            gdbserver_cmd_stop += " rm -rf %s" % self.gdbserver_tmp_dir(gdbserver_mode)
-        # This is unexpected since gdbserver should terminate after each debug session
-        # Just kill all gdbserver instances to keep it simple
-        else:
-            gdbserver_cmd_stop = "killall gdbserver"
-        return "\"/bin/sh -c '" + gdbserver_cmd_stop + "'\""
-
     def _target_gdbserver_kill_cmd(self):
         """Get the ssh command to kill gdbserver on the target device"""
         return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.gdbserver_port
@@ -157,91 +142,6 @@ class GdbCrossConfig:
             ssh_args.append(self.gdb_cross.target_device.target)
         return ssh_args
 
-    def _gen_gdbserver_start_script(self, gdbserver_mode=None):
-        """Generate a shell script starting the gdbserver on the remote device via ssh"""
-        if gdbserver_mode is None:
-            gdbserver_mode = self.gdbserver_default_mode
-        gdbserver_cmd_start = self._target_gdbserver_start_cmd(gdbserver_mode)
-        gdbserver_cmd_stop = self._target_gdbserver_stop_cmd(gdbserver_mode)
-        remote_ssh = "%s %s" % (self.gdb_cross.target_device.ssh_sshexec,
-                                " ".join(self._target_ssh_gdbserver_args()))
-        gdbserver_cmd = ['#!/bin/sh']
-        gdbserver_cmd.append('if [ "$1" = "stop" ]; then')
-        gdbserver_cmd.append('  shift')
-        gdbserver_cmd.append("  %s %s" % (remote_ssh, gdbserver_cmd_stop))
-        gdbserver_cmd.append('else')
-        gdbserver_cmd.append("  %s %s" % (remote_ssh, gdbserver_cmd_start))
-        gdbserver_cmd.append('fi')
-        GdbCrossConfig.write_file(self.gdbserver_script(gdbserver_mode), gdbserver_cmd, True)
-
-    def _gen_gdbinit_config(self, gdbserver_mode=None):
-        """Generate a gdbinit file for this binary and the corresponding gdbserver configuration"""
-        if gdbserver_mode is None:
-            gdbserver_mode = self.gdbserver_default_mode
-        gdbinit_lines = ['# This file is generated by devtool ide-sdk']
-        if gdbserver_mode == GdbServerModes.MULTI:
-            target_help = '#   gdbserver --multi :%d' % self.gdbserver_port
-            remote_cmd = 'target extended-remote'
-        else:
-            target_help = '#   gdbserver :%d %s' % (
-                self.gdbserver_port, self.binary)
-            remote_cmd = 'target remote'
-        gdbinit_lines.append('# On the remote target:')
-        gdbinit_lines.append(target_help)
-        gdbinit_lines.append('# On the build machine:')
-        gdbinit_lines.append('#   cd ' + self.modified_recipe.real_srctree)
-        gdbinit_lines.append(
-            '#   ' + self.gdb_cross.gdb + ' -ix ' + self.gdbinit)
-        gdbinit_lines.append('set sysroot ' + self.modified_recipe.d)
-
-        if self.image_recipe.rootfs_dbg:
-            gdbinit_lines.append(
-                'set solib-search-path "' + self.modified_recipe.solib_search_path_str(self.image_recipe) + '"')
-
-        gdbinit_lines.append('set substitute-path "/usr/include" "' +
-                             os.path.join(self.modified_recipe.recipe_sysroot, 'usr', 'include') + '"')
-        if self.image_recipe.rootfs_dbg:
-            # First: Search for sources of this recipe in the workspace folder
-            if self.modified_recipe.pn in self.modified_recipe.target_dbgsrc_dir:
-                gdbinit_lines.append('set substitute-path "%s" "%s"' %
-                                     (self.modified_recipe.target_dbgsrc_dir, self.modified_recipe.real_srctree))
-            else:
-                logger.error(
-                    "TARGET_DBGSRC_DIR must contain the recipe name PN.")
-            # Second: Search for sources of other recipes in the rootfs-dbg
-            if self.modified_recipe.target_dbgsrc_dir.startswith("/usr/src/debug"):
-                gdbinit_lines.append('set substitute-path "/usr/src/debug" "%s"' % os.path.join(
-                    self.image_recipe.rootfs_dbg, "usr", "src", "debug"))
-            else:
-                logger.error(
-                    "TARGET_DBGSRC_DIR must start with /usr/src/debug.")
-        else:
-            logger.warning(
-                "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
-        # Disable debuginfod for now, the IDE configuration uses rootfs-dbg from the image workdir.
-        gdbinit_lines.append('set debuginfod enabled off')
-        gdbinit_lines.append(
-            '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.gdbserver_port))
-        gdbinit_lines.append('set remote exec-file ' + self.binary.binary_path)
-        gdbinit_lines.append('run ' + self.binary.binary_path)
-
-        GdbCrossConfig.write_file(self.gdbinit, gdbinit_lines)
-
-    def _gen_gdb_start_script(self):
-        """Generate a script starting GDB with the corresponding gdbinit configuration."""
-        cmd_lines = ['#!/bin/sh']
-        cmd_lines.append('cd ' + self.modified_recipe.real_srctree)
-        cmd_lines.append(self.gdb_cross.gdb + ' -ix ' +
-                         self.gdbinit + ' "$@"')
-        GdbCrossConfig.write_file(self.gdb_script, cmd_lines, True)
-
-    def initialize(self):
-        self._gen_gdbserver_start_script()
-        if self.binary.runs_as_service and self.gdbserver_default_mode != GdbServerModes.ATTACH:
-            self._gen_gdbserver_start_script(GdbServerModes.ATTACH)
-        self._gen_gdbinit_config()
-        self._gen_gdb_start_script()
-
     def gdbserver_modes(self):
         """Get the list of gdbserver modes for which scripts are generated"""
         modes = [self.gdbserver_default_mode]
@@ -249,17 +149,10 @@ class GdbCrossConfig:
             modes.append(GdbServerModes.ATTACH)
         return modes
 
-    @staticmethod
-    def write_file(script_file, cmd_lines, executable=False):
-        script_dir = os.path.dirname(script_file)
-        mkdirhier(script_dir)
-        with open(script_file, 'w') as script_f:
-            script_f.write(os.linesep.join(cmd_lines))
-            script_f.write(os.linesep)
-        if executable:
-            st = os.stat(script_file)
-            os.chmod(script_file, st.st_mode | stat.S_IEXEC)
-        logger.info("Created: %s" % script_file)
+    def initialize(self):
+        """Interface function to initialize the gdb config generation"""
+        pass
+
 
 
 class IdeBase:
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index 04677aba9d..8284c4e0a5 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -7,6 +7,8 @@
 
 import os
 import logging
+import stat
+from bb.utils import mkdirhier
 from devtool.ide_plugins import IdeBase, GdbCrossConfig, GdbServerModes
 
 logger = logging.getLogger('devtool')
@@ -18,6 +20,116 @@ class GdbCrossConfigNone(GdbCrossConfig):
         super().__init__(image_recipe, modified_recipe, binary,
                          gdbserver_default_mode)
 
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
+        GdbCrossConfigNone.write_file(self.gdbserver_script(gdbserver_mode), gdbserver_cmd, True)
+
+    def _gen_gdbinit_config(self, gdbserver_mode=None):
+        """Generate a gdbinit file for this binary and the corresponding gdbserver configuration"""
+        if gdbserver_mode is None:
+            gdbserver_mode = self.gdbserver_default_mode
+        gdbinit_lines = ['# This file is generated by devtool ide-sdk']
+        if gdbserver_mode == GdbServerModes.MULTI:
+            target_help = '#   gdbserver --multi :%d' % self.gdbserver_port
+            remote_cmd = 'target extended-remote'
+        else:
+            target_help = '#   gdbserver :%d %s' % (
+                self.gdbserver_port, self.binary)
+            remote_cmd = 'target remote'
+        gdbinit_lines.append('# On the remote target:')
+        gdbinit_lines.append(target_help)
+        gdbinit_lines.append('# On the build machine:')
+        gdbinit_lines.append('#   cd ' + self.modified_recipe.real_srctree)
+        gdbinit_lines.append(
+            '#   ' + self.gdb_cross.gdb + ' -ix ' + self.gdbinit)
+        gdbinit_lines.append('set sysroot ' + self.modified_recipe.d)
+
+        if self.image_recipe.rootfs_dbg:
+            gdbinit_lines.append(
+                'set solib-search-path "' + self.modified_recipe.solib_search_path_str(self.image_recipe) + '"')
+
+        gdbinit_lines.append('set substitute-path "/usr/include" "' +
+                             os.path.join(self.modified_recipe.recipe_sysroot, 'usr', 'include') + '"')
+        if self.image_recipe.rootfs_dbg:
+            # First: Search for sources of this recipe in the workspace folder
+            if self.modified_recipe.pn in self.modified_recipe.target_dbgsrc_dir:
+                gdbinit_lines.append('set substitute-path "%s" "%s"' %
+                                     (self.modified_recipe.target_dbgsrc_dir, self.modified_recipe.real_srctree))
+            else:
+                logger.error(
+                    "TARGET_DBGSRC_DIR must contain the recipe name PN.")
+            # Second: Search for sources of other recipes in the rootfs-dbg
+            if self.modified_recipe.target_dbgsrc_dir.startswith("/usr/src/debug"):
+                gdbinit_lines.append('set substitute-path "/usr/src/debug" "%s"' % os.path.join(
+                    self.image_recipe.rootfs_dbg, "usr", "src", "debug"))
+            else:
+                logger.error(
+                    "TARGET_DBGSRC_DIR must start with /usr/src/debug.")
+        else:
+            logger.warning(
+                "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
+        # Disable debuginfod for now, the IDE configuration uses rootfs-dbg from the image workdir.
+        gdbinit_lines.append('set debuginfod enabled off')
+        gdbinit_lines.append(
+            '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.gdbserver_port))
+        gdbinit_lines.append('set remote exec-file ' + self.binary.binary_path)
+        gdbinit_lines.append('run ' + self.binary.binary_path)
+
+        GdbCrossConfigNone.write_file(self.gdbinit, gdbinit_lines)
+
+    def _gen_gdb_start_script(self):
+        """Generate a script starting GDB with the corresponding gdbinit configuration."""
+        cmd_lines = ['#!/bin/sh']
+        cmd_lines.append('cd ' + self.modified_recipe.real_srctree)
+        cmd_lines.append(self.gdb_cross.gdb + ' -ix ' +
+                         self.gdbinit + ' "$@"')
+        GdbCrossConfigNone.write_file(self.gdb_script, cmd_lines, True)
+
+    def initialize(self):
+        self._gen_gdbserver_start_script()
+        if self.binary.runs_as_service and self.gdbserver_default_mode != GdbServerModes.ATTACH:
+            self._gen_gdbserver_start_script(GdbServerModes.ATTACH)
+        self._gen_gdbinit_config()
+        self._gen_gdb_start_script()
+
+    @staticmethod
+    def write_file(script_file, cmd_lines, executable=False):
+        script_dir = os.path.dirname(script_file)
+        mkdirhier(script_dir)
+        with open(script_file, 'w') as script_f:
+            script_f.write(os.linesep.join(cmd_lines))
+            script_f.write(os.linesep)
+        if executable:
+            st = os.stat(script_file)
+            os.chmod(script_file, st.st_mode | stat.S_IEXEC)
+        logger.info("Created: %s" % script_file)
+
 
 class IdeNone(IdeBase):
     """Generate some generic helpers for other IDEs
-- 
2.52.0


