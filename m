Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766F4CA9EDB
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 20:00:00 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32878.1791748795283185554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=OQN0HG0z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202610111959528ef0daf9670002073c-skt_l0@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202610111959528ef0daf9670002073c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JHRW9ZrbXfzaP4wBrmNscPqF/Kd7PxyPgPoVn0aiReY=;
 b=OQN0HG0zL1JZkaigGLHYvZzZN92qzNTNi29G59y0YhszPVOKJrWrIznYixfoziZgQRpDQc
 dHjs6mCKs116MYhiZ+whzjDBNIICkPwJ3cYDJ7bpMdXO9G9ou1Vdo1pa27tCuEFbXDU6G8hF
 WH1UBPwxGxDqUG3UHXWO3bcBaTdO1QSIA4xXG4TCR+ueTmWzpp4sHhWMvBpMBmCU3dX6L169
 O8XMgHJfCZ02aJgs9pxSn7NEDTYGqCvbdb2TOPdQrs57EYMCudLO/RuXGC0gt6k0XMD3h/xL
 k57mOnS7td8BjK6maoVjDtXTUivc8miD7sfxxeKW0wI2C1KuYRNtE92g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 07/11] devtool: ide-sdk: use the effective slirp host ports in debugger configs
Date: Sun, 11 Oct 2026 21:59:12 +0200
Message-ID: <20261011195949.2118607-8-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 20:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247586

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The generated debugger configurations only support forwards where the
host port equals the target port. If the requested host port is in use,
runqemu forwards the target port from the next free host port instead,
e.g. target port 1234 from host port 1235, and the debugger connects to
the wrong port.

Look up the host port of each debug server's TCP target port in the
QB_SLIRP_OPT forwards, including those already in the bbappend, and
keep known mappings when adding missing forwards. To debug a QEMU whose
ports were moved, write its effective mappings back into the bbappend
and rerun devtool ide-sdk with --skip-bitbake. This mostly matters on
autobuilders running several QEMU instances at once.

For ide=none, the connect and run commands move from the gdbinit and
lldbinit files into the generated start scripts, which hold the
resolved port. The init files keep only symbol and source setup, and
their help comments point to the scripts.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 12 +++++
 scripts/lib/devtool/ide_plugins/ide_code.py |  4 +-
 scripts/lib/devtool/ide_plugins/ide_none.py | 43 ++++++++++--------
 scripts/lib/devtool/ide_sdk.py              | 49 ++++++++++++++++-----
 4 files changed, 78 insertions(+), 30 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 7841bc37b9..1e1e32b74b 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -163,6 +163,18 @@ class DebuggerCrossConfig:
         """Called after construction to generate any required config files."""
         pass
 
+    def resolve_host_port(self, mode=None):
+        """Return the host port this debug server's target port is reachable on."""
+        target_port = self.port(mode)
+        if not is_loopback_target(self.debugger_cross.target_device.target):
+            return target_port
+        return self.image_recipe.slirp_port_mappings.get(('tcp', target_port), target_port)
+
+    def _resolve_host_port_shell_lines(self, var_name, mode=None):
+        """Shell line assigning $<var_name> to resolve_host_port(), for use in
+        a generated ide=none wrapper script."""
+        return ['%s=%d' % (var_name, self.resolve_host_port(mode))]
+
     # Abstract — subclasses must implement
     def _target_start_cmd(self, mode):
         raise NotImplementedError
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 081dc08657..89013139ea 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -423,7 +423,7 @@ class IdeVSCode(IdeBase):
             "MIMode": "gdb",
             "preLaunchTask": cross_debug_config.id_pretty_mode(server_mode),
             "miDebuggerPath": modified_recipe.debugger_cross.gdb,
-            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.debugger_cross.host, cross_debug_config.port(server_mode))
+            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.debugger_cross.host, cross_debug_config.resolve_host_port(server_mode))
         }
 
         if is_attach:
@@ -530,7 +530,7 @@ class IdeVSCode(IdeBase):
 
         init_commands = [
             "platform select remote-linux",
-            "platform connect connect://%s:%d" % (debugger_cross.host, lldb_config.port(server_mode)),
+            "platform connect connect://%s:%d" % (debugger_cross.host, lldb_config.resolve_host_port(server_mode)),
             # Clear the default step-avoid-regexp so std:: and other library
             # namespaces are not silently skipped on step-in. (default is "std::" in LLDB 15+)
             "settings set target.process.thread.step-avoid-regexp \"\"",
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index eba576bfdb..d5fed0809e 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -60,17 +60,14 @@ class GdbCrossConfigNone(GdbCrossConfig):
         gdbinit_lines = ['# This file is generated by devtool ide-sdk']
         if server_mode == DebuggerServerModes.MULTI:
             target_help = '#   gdbserver --multi :%d' % self.debug_server_port
-            remote_cmd = 'target extended-remote'
         else:
             target_help = '#   gdbserver :%d %s' % (
                 self.debug_server_port, self.binary)
-            remote_cmd = 'target remote'
         gdbinit_lines.append('# On the remote target:')
         gdbinit_lines.append(target_help)
         gdbinit_lines.append('# On the build machine:')
         gdbinit_lines.append('#   cd ' + self.modified_recipe.real_srctree)
-        gdbinit_lines.append(
-            '#   ' + self.debugger_cross.gdb + ' -ix ' + self.gdbinit)
+        gdbinit_lines.append('#   ' + self.gdb_script)
         gdbinit_lines.append('set sysroot ' + self.modified_recipe.d)
 
         if self.image_recipe.rootfs_dbg:
@@ -114,18 +111,25 @@ class GdbCrossConfigNone(GdbCrossConfig):
             gdbinit_lines.append("end" + os.linesep)
 
         gdbinit_lines.append(
-            '%s %s:%d' % (remote_cmd, self.debugger_cross.host, self.debug_server_port))
-        gdbinit_lines.append('set remote exec-file ' + self.binary.binary_path)
-        gdbinit_lines.append('run ' + self.binary.binary_path)
+            'set remote exec-file ' + self.binary.binary_path)
 
         GdbCrossConfigNone.write_file(self.gdbinit, gdbinit_lines)
 
-    def _gen_gdb_start_script(self):
+    def _gen_gdb_start_script(self, server_mode=None):
         """Generate a script starting GDB with the corresponding gdbinit configuration."""
+        if server_mode is None:
+            server_mode = self.default_mode
+        remote_cmd = ('target extended-remote'
+                      if server_mode == DebuggerServerModes.MULTI
+                      else 'target remote')
         cmd_lines = ['#!/bin/sh']
         cmd_lines.append('cd ' + self.modified_recipe.real_srctree)
-        cmd_lines.append(self.debugger_cross.gdb + ' -ix ' +
-                         self.gdbinit + ' "$@"')
+        cmd_lines += self._resolve_host_port_shell_lines('GDB_PORT', server_mode)
+        gdb_cmd = self.debugger_cross.gdb + ' -ix ' + self.gdbinit
+        gdb_cmd += " -ex '%s %s:'\"$GDB_PORT\"" % (remote_cmd, self.debugger_cross.host)
+        gdb_cmd += " -ex 'run %s'" % self.binary.binary_path
+        gdb_cmd += ' "$@"'
+        cmd_lines.append(gdb_cmd)
         GdbCrossConfigNone.write_file(self.gdb_script, cmd_lines, True)
 
     def initialize(self):
@@ -210,10 +214,8 @@ class LldbServerConfigNone(LldbServerConfig):
             self.port(server_mode), self.gdbserver_ports[server_mode]))
         lines.append('# On the build machine:')
         lines.append('#   cd ' + self.modified_recipe.real_srctree)
-        lines.append('#   ' + self.debugger_cross.lldb + ' -s ' + self.lldbinit)
+        lines.append('#   ' + self.lldb_script)
         lines.append('platform select remote-linux')
-        lines.append('platform connect connect://%s:%d' % (
-            self.debugger_cross.host, self.port(server_mode)))
         lines.append('settings set target.process.thread.step-avoid-regexp ""')
 
         if self.image_recipe.rootfs_dbg:
@@ -248,16 +250,21 @@ class LldbServerConfigNone(LldbServerConfig):
                 'Cannot setup debug symbols configuration for LLDB. '
                 'IMAGE_GEN_DEBUGFS is not enabled.')
 
-        lines.append('target create --remote-file %s %s' % (
-            self.binary.binary_path, self.binary.binary_host_path))
-
         LldbServerConfigNone.write_file(self.lldbinit, lines)
 
-    def _gen_lldb_start_script(self):
+    def _gen_lldb_start_script(self, server_mode=None):
         """Generate a script starting lldb with the lldbinit configuration."""
+        if server_mode is None:
+            server_mode = self.default_mode
         cmd_lines = ['#!/bin/sh']
         cmd_lines.append('cd ' + self.modified_recipe.real_srctree)
-        cmd_lines.append(self.debugger_cross.lldb + ' -s ' + self.lldbinit + ' "$@"')
+        cmd_lines += self._resolve_host_port_shell_lines('LLDB_PORT', server_mode)
+        lldb_cmd = self.debugger_cross.lldb + ' -s ' + self.lldbinit
+        lldb_cmd += " -o 'platform connect connect://%s:'\"$LLDB_PORT\"" % self.debugger_cross.host
+        lldb_cmd += " -o 'target create --remote-file %s %s'" % (
+            self.binary.binary_path, self.binary.binary_host_path)
+        lldb_cmd += ' "$@"'
+        cmd_lines.append(lldb_cmd)
         LldbServerConfigNone.write_file(self.lldb_script, cmd_lines, True)
 
     def initialize(self):
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 9faf041957..65f6e02675 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -306,6 +306,24 @@ class RecipeImage:
     def debug_support(self):
         return bool(self.rootfs_dbg)
 
+    @property
+    def slirp_port_mappings(self):
+        """QB_SLIRP_OPT's hostfwd rules as {(protocol, target_port): host_port}.
+
+        QB_SLIRP_OPT is only a wishlist: runqemu moves a forward to another
+        host port whenever qemu cannot bind the wished-for one, so host
+        port == target port cannot be assumed. A caller that knows the
+        effective mapping of a running qemu (see QemuRunner.slirp_port_mappings)
+        can write it back into the bbappend and re-run devtool ide-sdk
+        --skip-bitbake to have the debugger configs regenerated against the
+        ports that really work.
+        """
+        mappings = {}
+        for content in (self.qb_slirp_opt, self._orig_bbappend_content or ''):
+            for m in re.finditer(r'hostfwd=([a-z]+):[^:]*:(\d+)-[^:,]*:(\d+)', content):
+                mappings[(m.group(1), int(m.group(3)))] = int(m.group(2))
+        return mappings
+
     @property
     def rootfs(self):
         """Prefer the live NFS-exported rootfs (if --nfs=rootfs is used) over the
@@ -548,28 +566,39 @@ class RecipeImage:
         if not ports:
             return False
 
-        # Determine which ports are already in the base value
-        already = {int(m.group(1))
-                   for m in re.finditer(r':(\d+)-:\d+', self.qb_slirp_opt)}
-        missing_ports = [p for p in ports if p not in already]
+        # Determine which ports are already in the base value. Match the
+        # target port, not the host port: once the effective mapping is
+        # written back the two differ, and a forward already exists for a
+        # target port regardless of which host port it ended up on.
+        already = {(m.group(1), int(m.group(2)))
+               for m in re.finditer(r'hostfwd=([a-z]+):[^:]*:\d+-[^:,]*:(\d+)', self.qb_slirp_opt)}
+        missing_ports = [p for p in ports if ('tcp', p) not in already]
         if not missing_ports:
             logger.info("QB_SLIRP_OPT already contains all needed port forwards")
             return False
 
+        # Keep any already known effective mapping instead of wishing for
+        # host port == target port again, so re-running does not discard a
+        # mapping written back from a running qemu (see slirp_port_mappings).
+        mappings = self.slirp_port_mappings
+
+        def hostfwd(target_port):
+            return ',hostfwd=tcp:127.0.0.1:%d-:%d' % (
+                mappings.get(('tcp', target_port), target_port), target_port)
+
         if self.qb_slirp_opt:
             # Base value exists: :append only the missing port forwards
-            extra = ''.join(
-                ',hostfwd=tcp:127.0.0.1:%d-:%d' % (p, p) for p in missing_ports)
+            extra = ''.join(hostfwd(p) for p in missing_ports)
             new_line = 'QB_SLIRP_OPT:append = "%s"' % extra
         else:
             # No base value: mirror runqemu's built-in default (SSH 2222, telnet
             # 2323, tftp) and add the debugger ports.
             all_hostfwds = (
-                'hostfwd=tcp:127.0.0.1:2222-:22,'
-                'hostfwd=tcp:127.0.0.1:2323-:23'
+                'hostfwd=tcp:127.0.0.1:%d-:22,'
+                'hostfwd=tcp:127.0.0.1:%d-:23'
+                % (mappings.get(('tcp', 22), 2222), mappings.get(('tcp', 23), 2323))
             )
-            all_hostfwds += ''.join(
-                ',hostfwd=tcp:127.0.0.1:%d-:%d' % (p, p) for p in missing_ports)
+            all_hostfwds += ''.join(hostfwd(p) for p in missing_ports)
             new_line = 'QB_SLIRP_OPT = "-netdev user,id=net0,%s,tftp=${DEPLOY_DIR_IMAGE}"' % all_hostfwds
 
         if os.path.exists(self._bbappend):
-- 
2.56.0


