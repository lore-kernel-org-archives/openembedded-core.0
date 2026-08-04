Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BBAC56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:53 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14574.1785844843951690659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=CD8d21oU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202608041200398189e5b7ea00020741-5_mumx@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608041200398189e5b7ea00020741
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TUhh4S/xuQOOaG8108ECbDcAgmCZ9vMjvAZpHdb6q64=;
 b=CD8d21oUkBhx83BNiiSVoLm+vegLyAEPtRhezIAeF1lxjpJvcZYAhzcejKSZN5e5e7CRTJ
 hxEBTcIVKCvUO/4ZiySIg+ordi3tyl/UfwFNJ9t+hRnWQ2vzOqXV7CKBksNMK35gWuXLBmwq
 yaZR/4rGGkUC+xbLv6+fxpoKHkPrSoBB0zgDj/VR7Huasqe8np4qnPgOKrBM810Dp0oZCcDZ
 OJ38Ct/bYheGKlonL+Cia8voWvT7Vao7GDp3OZj10gn78s2fEmwTRhVwNpZA6w6v0xzZNtA9
 5Eu/j/F955/CXOF0qSpLgIsNoavBznBzcZsTMr3JNRuDNmG1GBaVGMKw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 11/14] devtool: ide-sdk: add LLDB support for ide=none (clang toolchain)
Date: Tue,  4 Aug 2026 13:59:35 +0200
Message-ID: <20260804120034.378787-12-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-1-adrian.freihofer@siemens.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242722

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Bring ide=none to feature parity with ide=code for clang recipes by
adding LldbServerConfigNone and dispatching on the toolchain in
IdeNone.setup_modified_recipe.

Three files are generated per binary when toolchain == 'clang':

  lldb_server_<port>_<binary>_<mode>
    Shell script with start/stop logic (same pattern as the existing
    gdbserver_* scripts).  Passes the lldb-server SSH command produced
    by LldbServerConfig._target_start_cmd, which already includes the
    /proc/net/tcp readiness poll for MULTI mode.

  lldbinit/lldbinit_<port>_<binary>
    Init file sourced by lldb via -s.  Sets up the remote platform
    connection, source maps, debug-file-search-paths and
    exec-search-paths, then creates the target with
    "target create --remote-file <target_path> <host_debug_binary>".

  lldb_<port>_<binary>
    Wrapper script: cd <srctree> && lldb -s <lldbinit> "$@"

Supporting changes:

  LldbServerConfig (ide_plugins/__init__.py): add server_script_file /
  server_script, which were left as NotImplementedError in the base
  class.  Required for LldbServerConfigNone to write its start scripts
  to the correct paths.

  RecipeLldbNative (ide_sdk.py): rename _lldb -> lldb (plain attribute),
  matching the RecipeGdbCross.gdb convention so that ide_none.py can
  access the host lldb binary path without going through a property.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |   6 +
 scripts/lib/devtool/ide_plugins/ide_none.py | 138 +++++++++++++++++++-
 scripts/lib/devtool/ide_sdk.py              |   4 +-
 3 files changed, 143 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 25575f18f4..d50ba7bc65 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -250,6 +250,12 @@ class LldbServerConfig(DebuggerCrossConfig):
                % {'pf': pid_file, 'td': tmp_dir})
         return "\"/bin/sh -c '" + cmd + "'\""
 
+    def server_script_file(self, mode):
+        return 'lldb_server_' + self.id_pretty_mode(mode)
+
+    def server_script(self, mode):
+        return os.path.join(self.script_dir, self.server_script_file(mode))
+
     def server_modes(self):
         """ATTACH mode is not applicable for lldb-server platform."""
         return [self.default_mode]
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index f390331776..a8ddc3f39f 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -9,7 +9,7 @@ import os
 import logging
 import stat
 from bb.utils import mkdirhier
-from devtool.ide_plugins import IdeBase, GdbCrossConfig, DebuggerServerModes
+from devtool.ide_plugins import IdeBase, GdbCrossConfig, LldbServerConfig, DebuggerServerModes
 
 logger = logging.getLogger('devtool')
 
@@ -145,6 +145,134 @@ class GdbCrossConfigNone(GdbCrossConfig):
         logger.info("Created: %s" % script_file)
 
 
+class LldbServerConfigNone(LldbServerConfig):
+    """Generate lldb helper scripts for ide=none when using the clang toolchain."""
+
+    def __init__(self, image_recipe, modified_recipe, binary,
+                 default_mode=DebuggerServerModes.MULTI):
+        super().__init__(image_recipe, modified_recipe, binary, default_mode)
+
+    @property
+    def lldbinit_dir(self):
+        return os.path.join(self.script_dir, 'lldbinit')
+
+    @property
+    def lldbinit(self):
+        return os.path.join(self.lldbinit_dir, 'lldbinit_' + self.id_pretty)
+
+    @property
+    def lldb_script(self):
+        return os.path.join(self.script_dir, 'lldb_' + self.id_pretty)
+
+    def _target_lldb_server_stop_cmd(self, server_mode):
+        """SSH command to stop lldb-server on the target."""
+        if server_mode == DebuggerServerModes.MULTI:
+            pid_file = self._lldb_server_pid_file(server_mode)
+            tmp_dir = self._lldb_server_tmp_dir(server_mode)
+            cmd = ("test -f %(pf)s && kill \\$(cat %(pf)s) 2>/dev/null; rm -rf %(td)s"
+                   % {'pf': pid_file, 'td': tmp_dir})
+        else:
+            cmd = "killall lldb-server 2>/dev/null || true"
+        return "\"/bin/sh -c '" + cmd + "'\""
+
+    def _gen_lldb_server_start_script(self, server_mode=None):
+        """Generate a shell script starting lldb-server on the remote device via ssh."""
+        if server_mode is None:
+            server_mode = self.default_mode
+        server_cmd_start = self._target_start_cmd(server_mode)
+        server_cmd_stop = self._target_lldb_server_stop_cmd(server_mode)
+        remote_ssh = "%s %s" % (self.debugger_cross.target_device.ssh_sshexec,
+                                " ".join(self._target_ssh_args()))
+        script_lines = ['#!/bin/sh']
+        script_lines.append('if [ "$1" = "stop" ]; then')
+        script_lines.append('  shift')
+        script_lines.append("  %s %s" % (remote_ssh, server_cmd_stop))
+        script_lines.append('else')
+        script_lines.append("  %s %s" % (remote_ssh, server_cmd_start))
+        script_lines.append('fi')
+        LldbServerConfigNone.write_file(self.server_script(server_mode), script_lines, True)
+
+    def _gen_lldbinit_config(self, server_mode=None):
+        """Generate an lldbinit file for connecting to lldb-server on the target."""
+        if server_mode is None:
+            server_mode = self.default_mode
+        lines = ['# This file is generated by devtool ide-sdk']
+        if server_mode == DebuggerServerModes.MULTI:
+            lines.append('# On the remote target:')
+            lines.append('#   lldb-server platform --server --listen *:%d' % self.debug_server_port)
+        else:
+            lines.append('# On the remote target:')
+            lines.append('#   lldb-server platform --one-shot --server --listen *:%d' % self.debug_server_port)
+        lines.append('# On the build machine:')
+        lines.append('#   cd ' + self.modified_recipe.real_srctree)
+        lines.append('#   ' + self.debugger_cross.lldb + ' -s ' + self.lldbinit)
+        lines.append('platform select remote-linux')
+        lines.append('platform connect connect://%s:%d' % (
+            self.debugger_cross.host, self.debug_server_port))
+        lines.append('settings set target.process.thread.step-avoid-regexp ""')
+
+        if self.image_recipe.rootfs_dbg:
+            src_file_map = dict(self.modified_recipe.reverse_debug_prefix_map)
+            if '/usr/src/debug' in src_file_map:
+                logger.error(
+                    'Key "/usr/src/debug" already exists in source map. '
+                    'Something with DEBUG_PREFIX_MAP looks unexpected and finding '
+                    'sources in the rootfs-dbg will not work as expected.')
+            else:
+                src_file_map['/usr/src/debug'] = os.path.join(
+                    self.image_recipe.rootfs_dbg, 'usr', 'src', 'debug')
+            if src_file_map:
+                # Pass all pairs as a single settings set call
+                map_args = []
+                for target_path, host_path in src_file_map.items():
+                    map_args += ['"' + target_path + '"', '"' + host_path + '"']
+                lines.append('settings set target.source-map %s' % ' '.join(map_args))
+
+            debug_search_paths = ' '.join(
+                self.modified_recipe.solib_search_path(self.image_recipe))
+            lines.append('settings set target.debug-file-search-paths %s' % debug_search_paths)
+
+            exec_paths = list(dict.fromkeys([
+                os.path.join(self.modified_recipe.d, self.modified_recipe.libdir.lstrip('/')),
+                os.path.join(self.modified_recipe.d, self.modified_recipe.base_libdir.lstrip('/')),
+                os.path.join(self.modified_recipe.d, self.modified_recipe.bindir.lstrip('/')),
+            ]))
+            lines.append('settings set target.exec-search-paths %s' % ' '.join(exec_paths))
+        else:
+            logger.warning(
+                'Cannot setup debug symbols configuration for LLDB. '
+                'IMAGE_GEN_DEBUGFS is not enabled.')
+
+        lines.append('target create --remote-file %s %s' % (
+            self.binary.binary_path, self.binary.binary_host_path))
+
+        LldbServerConfigNone.write_file(self.lldbinit, lines)
+
+    def _gen_lldb_start_script(self):
+        """Generate a script starting lldb with the lldbinit configuration."""
+        cmd_lines = ['#!/bin/sh']
+        cmd_lines.append('cd ' + self.modified_recipe.real_srctree)
+        cmd_lines.append(self.debugger_cross.lldb + ' -s ' + self.lldbinit + ' "$@"')
+        LldbServerConfigNone.write_file(self.lldb_script, cmd_lines, True)
+
+    def initialize(self):
+        self._gen_lldb_server_start_script()
+        self._gen_lldbinit_config()
+        self._gen_lldb_start_script()
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
+
 class IdeNone(IdeBase):
     """Generate some generic helpers for other IDEs
 
@@ -177,8 +305,12 @@ class IdeNone(IdeBase):
         script_path = modified_recipe.gen_install_deploy_script(args)
         logger.info("Created: %s" % script_path)
 
-        self.initialize_cross_debug_configs(
-            image_recipe, modified_recipe, GdbCrossConfigNone)
+        if modified_recipe.toolchain == 'clang':
+            self.initialize_cross_debug_configs(
+                image_recipe, modified_recipe, LldbServerConfigNone)
+        else:
+            self.initialize_cross_debug_configs(
+                image_recipe, modified_recipe, GdbCrossConfigNone)
 
         IdeBase.gen_oe_scripts_sym_link(modified_recipe)
 
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index b56a0925cb..42b6e381c5 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -151,7 +151,7 @@ class RecipeLldbNative(RecipeNative):
     def __init__(self, args, target_device):
         super().__init__('lldb-native')
         self.target_device = target_device
-        self._lldb = None
+        self.lldb = None
         self._lldb_server_path = None
 
     def __find_lldb_server(self, config, tinfoil):
@@ -164,7 +164,7 @@ class RecipeLldbNative(RecipeNative):
 
     def initialize(self, config, workspace, tinfoil):
         super()._initialize(config, workspace, tinfoil)
-        self._lldb = os.path.join(self.staging_bindir_native, 'lldb')
+        self.lldb = os.path.join(self.staging_bindir_native, 'lldb')
         self._lldb_server_path = self.__find_lldb_server(config, tinfoil)
 
     @property
-- 
2.55.0


