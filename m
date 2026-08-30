Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7BDC624C6
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:26 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17140.1788126560347611149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Lbc1qiqo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20260830214917a7b0a54ceb0002076f-cjlqpz@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260830214917a7b0a54ceb0002076f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0bzlD3QpycxDG+Xrm3mTE+g+QZ6QQ4yxG6qumr+cxyA=;
 b=Lbc1qiqoox40ZytMSmOtYaBzFw4B00MrLNdylQRhOCoNV/eg1g8Q/EO6MyLXp2KhCN01g0
 6YQ38bgyZ79zDfKUtyhrNCvGqjrQwN3I7pW6IQ+fvDkVeonlPWJyAYWM2ddY8M7xggbhrFNP
 fQKsu9F19kHwhD68sSs/Js8ELW66dx/XfHBZWTqOElpicy/N1FfFOifRh10YghXDJR3V6jlB
 ObQTV0VA9Bzw8xTejE3mzoEgJ7MihgIkjjtj/WGrUWWdRnQhj45jABjbcIZPhSAoe7JHrlaK
 dqTD/giWTENavidOhwUy/XKmUd8AVEayv+Q3ZjSiNlE4DwDXINhidiPA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 08/25] devtool: ide-sdk: support runqemu slirp
Date: Sun, 30 Aug 2026 23:48:30 +0200
Message-ID: <20260830214912.1346063-9-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244711

From: Adrian Freihofer <adrian.freihofer@siemens.com>

ide-sdk needs to make sure the debugger server ports are reachable, so
when runqemu uses slirp networking, add the required port forwards to
QB_SLIRP_OPT in the image bbappend.

Example:
  devtool ide-sdk oe-selftest-image -t root@localhost -P 2222 -c
  runqemu slirp serialstdio snapshot

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  15 ++-
 scripts/lib/devtool/ide_plugins/ide_none.py |   6 +-
 scripts/lib/devtool/ide_sdk.py              | 133 +++++++++++++++-----
 3 files changed, 121 insertions(+), 33 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 136ddd8914..a5069cae85 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -65,6 +65,10 @@ class DebuggerCrossConfig:
             DebuggerCrossConfig._port_next += 1
         self.debug_server_port = self.debug_server_ports[self.default_mode]
         self.id_pretty = "%d_%s" % (self.debug_server_port, self.binary_pretty)
+        # Hook for subclasses needing additional fixed ports forwarded through
+        # slirp beyond the one-per-mode debug_server_ports (e.g. lldb-server's
+        # spawned gdbserver instances).
+        self.extra_ports = []
 
         if self.id_pretty in DebuggerCrossConfig._configs:
             raise DevtoolError(
@@ -269,6 +273,13 @@ class LldbServerConfig(DebuggerCrossConfig):
                  default_mode=DebuggerServerModes.MULTI):
         super().__init__(image_recipe, modified_recipe, binary,
                          default_mode)
+        # lldb-server platform spawns a separate gdb-remote-protocol
+        # "gdbserver" instance per debug session; without --gdbserver-port it
+        # picks a random port, which cannot be forwarded through slirp NAT.
+        # Pin it to a fixed, dedicated port that gets slirp-forwarded too.
+        self.gdbserver_port = DebuggerCrossConfig._port_next
+        DebuggerCrossConfig._port_next += 1
+        self.extra_ports.append(self.gdbserver_port)
 
     def _lldb_server_tmp_dir(self, mode):
         return os.path.join('/tmp', 'lldb_server_%s' % self.id_pretty_mode(mode))
@@ -294,8 +305,8 @@ class LldbServerConfig(DebuggerCrossConfig):
             cmd = self._target_tcp_port_check_cmd() + " && exit 0; "
             cmd += "mkdir -p %s; " % tmp_dir
             cmd += "cd %s; " % tmp_dir
-            cmd += "%s platform --server --listen *:%s > %s 2>&1 & _lldb_server_pid=\\$!; " % (
-                lldb_server, self.debug_server_port, log_file)
+            cmd += "%s platform --server --listen *:%s --gdbserver-port %s > %s 2>&1 & _lldb_server_pid=\\$!; " % (
+                lldb_server, self.debug_server_port, self.gdbserver_port, log_file)
             cmd += "echo \\$_lldb_server_pid > %s; " % pid_file
             cmd += self._target_wait_for_tcp_port_cmd(
                 "lldb_server_pid", log_file)
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index 959140cedb..e4b255f2fa 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -207,10 +207,12 @@ class LldbServerConfigNone(LldbServerConfig):
         lines = ['# This file is generated by devtool ide-sdk']
         if server_mode == DebuggerServerModes.MULTI:
             lines.append('# On the remote target:')
-            lines.append('#   lldb-server platform --server --listen *:%d' % self.debug_server_port)
+            lines.append('#   lldb-server platform --server --listen *:%d --gdbserver-port %d' % (
+                self.debug_server_port, self.gdbserver_port))
         else:
             lines.append('# On the remote target:')
-            lines.append('#   lldb-server platform --one-shot --server --listen *:%d' % self.debug_server_port)
+            lines.append('#   lldb-server platform --one-shot --server --listen *:%d --gdbserver-port %d' % (
+                self.debug_server_port, self.gdbserver_port))
         lines.append('# On the build machine:')
         lines.append('#   cd ' + self.modified_recipe.real_srctree)
         lines.append('#   ' + self.debugger_cross.lldb + ' -s ' + self.lldbinit)
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index b62a0f612e..719648a3eb 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -23,7 +23,7 @@ import scriptutils
 import bb
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError, parse_recipe
 from devtool.standard import get_real_srctree
-from devtool.ide_plugins import BuildTool
+from devtool.ide_plugins import BuildTool, DebuggerCrossConfig
 from oe.kernel_module import kernel_module_os_env
 
 
@@ -186,15 +186,17 @@ class RecipeImage:
     """
 
     MARKER = '# devtool ide-sdk: image debug settings'
+    QB_SLIRP_MARKER = '# devtool ide-sdk: QB_SLIRP_OPT'
 
     def __init__(self, name, orig_bbappend_content=None):
         self.name = name
         self.rootfs = None
         self.__rootfs_dbg = None
+        self.qb_slirp_opt = ''
         self.bootstrap_tasks = [self.name + ':do_build']
         # Debug settings already provided by the base configuration (e.g.
         # local.conf, MACHINE, DISTRO, the recipe itself) plus any bbappend
-        # content other than devtool ide-sdk's own section (see
+        # content other than devtool ide-sdk's own sections (see
         # strip_bbappend_sections()). Populated by initialize().
         self.base_image_gen_debugfs = False
         self.base_image_fstypes_debugfs = ''
@@ -204,11 +206,11 @@ class RecipeImage:
         # Content of the bbappend before strip_bbappend_sections() ran.
         self._orig_bbappend_content = orig_bbappend_content
 
-    @classmethod
-    def _strip_marker_section(cls, content):
-        """Remove devtool ide-sdk's own image debug settings section, if any"""
+    @staticmethod
+    def _strip_marker_section(content, marker):
+        """Remove one devtool ide-sdk marker section, if present"""
         return re.sub(
-            r'^' + re.escape(cls.MARKER) + r'\n(?:[^\n]+\n)*',
+            r'^' + re.escape(marker) + r'\n(?:[^\n]+\n)*',
             '', content, flags=re.MULTILINE)
 
     @classmethod
@@ -227,7 +229,8 @@ class RecipeImage:
             with open(bbappend, 'r') as f:
                 content = f.read()
             originals[name] = content
-            stripped = cls._strip_marker_section(content)
+            stripped = cls._strip_marker_section(content, cls.MARKER)
+            stripped = cls._strip_marker_section(stripped, cls.QB_SLIRP_MARKER)
             if stripped != content:
                 with open(bbappend, 'w') as f:
                     f.write(stripped)
@@ -259,6 +262,8 @@ class RecipeImage:
         self.rootfs = os.path.join(workdir, 'rootfs')
         self.__rootfs_dbg = os.path.join(workdir, 'rootfs-dbg')
 
+        self.qb_slirp_opt = image_d.getVar('QB_SLIRP_OPT') or ''
+
     @property
     def debug_support(self):
         return bool(self.rootfs_dbg)
@@ -279,9 +284,10 @@ class RecipeImage:
 
         initialize() already stripped this section from the bbappend on
         disk before parsing, so it only needs to be added back here, if
-        still needed. Returns True if the resulting bbappend content
-        actually differs from what was on disk when initialize() ran, False
-        if it is left exactly as it was.
+        still needed. Also updates QB_SLIRP_OPT with the debugger server
+        port forwards (see update_qb_slirp_opt()). Returns True if the
+        resulting bbappend content actually differs from what was on disk
+        when initialize() ran, False if it is left exactly as it was.
         """
         wants_gdbserver = any(
             r.wants_gdbserver and r.toolchain != 'clang'
@@ -319,24 +325,90 @@ class RecipeImage:
             parsed_content = ''
 
         if not lines:
-            # The base configuration already provides everything needed.
-            if parsed_content != original_content:
+            if self.MARKER in original_content:
                 logger.info(
                     "Removed image debug settings from %s: already provided by the base configuration", self._bbappend)
+            image_changed = False
+        else:
+            new_section = self.MARKER + '\n' + '\n'.join(lines) + '\n'
+            new_content = parsed_content
+            if new_content and not new_content.endswith('\n'):
+                new_content += '\n'
+            new_content += new_section
+
+            appends_dir = os.path.dirname(self._bbappend)
+            os.makedirs(appends_dir, exist_ok=True)
+            with open(self._bbappend, 'w') as f:
+                f.write(new_content)
+            logger.info("Updated image bbappend %s", self._bbappend)
+            image_changed = True
+
+        slirp_changed = self.update_qb_slirp_opt()
+        return image_changed or slirp_changed
+
+    def update_qb_slirp_opt(self):
+        """Update QB_SLIRP_OPT in the image bbappend
+
+        Support connecting to a debugger server running on the target device via
+        runqemu's slirp network:
+        - If the base value is non-empty (recipe/machine sets QB_SLIRP_OPT):
+          only missing port forwards are appended via QB_SLIRP_OPT:append.
+        - If the base value is empty (runqemu would use its own built-in default
+          of SSH 2222, telnet 2323, tftp): a full QB_SLIRP_OPT assignment is
+          written that mirrors that default plus the debugger ports, so that
+          runqemu reads the complete set from the .qemuboot.conf.
+
+        Returns True if the bbappend content actually changed, False otherwise.
+        """
+        ports = sorted({port for cfg in DebuggerCrossConfig._configs.values()
+                        for port in list(cfg.debug_server_ports.values()) + cfg.extra_ports})
+        if not ports:
             return False
 
-        new_section = self.MARKER + '\n' + '\n'.join(lines) + '\n'
-        new_content = parsed_content
+        # Determine which ports are already in the base value
+        already = {int(m.group(1))
+                   for m in re.finditer(r':(\d+)-:\d+', self.qb_slirp_opt)}
+        missing_ports = [p for p in ports if p not in already]
+        if not missing_ports:
+            logger.info("QB_SLIRP_OPT already contains all needed port forwards")
+            return False
+
+        if self.qb_slirp_opt:
+            # Base value exists: :append only the missing port forwards
+            extra = ''.join(
+                ',hostfwd=tcp:127.0.0.1:%d-:%d' % (p, p) for p in missing_ports)
+            new_line = 'QB_SLIRP_OPT:append = "%s"' % extra
+        else:
+            # No base value: mirror runqemu's built-in default (SSH 2222, telnet
+            # 2323, tftp) and add the debugger ports.
+            all_hostfwds = (
+                'hostfwd=tcp:127.0.0.1:2222-:22,'
+                'hostfwd=tcp:127.0.0.1:2323-:23'
+            )
+            all_hostfwds += ''.join(
+                ',hostfwd=tcp:127.0.0.1:%d-:%d' % (p, p) for p in missing_ports)
+            new_line = 'QB_SLIRP_OPT = "-netdev user,id=net0,%s,tftp=${DEPLOY_DIR_IMAGE}"' % all_hostfwds
+
+        if os.path.exists(self._bbappend):
+            with open(self._bbappend, 'r') as f:
+                content = f.read()
+        else:
+            content = ''
+        stripped_content = self._strip_marker_section(content, self.QB_SLIRP_MARKER)
+        new_content = stripped_content
         if new_content and not new_content.endswith('\n'):
             new_content += '\n'
-        new_content += new_section
+        new_content += self.QB_SLIRP_MARKER + '\n' + new_line + '\n'
+
+        if new_content == content:
+            logger.debug("QB_SLIRP_OPT in %s is already up to date", self._bbappend)
+            return False
 
         appends_dir = os.path.dirname(self._bbappend)
         os.makedirs(appends_dir, exist_ok=True)
         with open(self._bbappend, 'w') as f:
             f.write(new_content)
-
-        logger.info("Updated image bbappend %s", self._bbappend)
+        logger.info("Updated QB_SLIRP_OPT in %s: %s", self._bbappend, new_line)
         return True
 
 
@@ -1359,9 +1431,9 @@ def ide_setup(args, config, basepath, workspace):
     # Collect information about tasks which need to be bitbaked.
     # In modified mode the image build is held back until after
     # setup_modified_recipe() has assigned the debugger port numbers and
-    # update_image_bbappend() has written the complete bbappend. That way
-    # the image is built with a single, stable recipe hash so that no
-    # basehash-changed warnings are emitted.
+    # update_image_bbappend() has written the complete bbappend (including
+    # QB_SLIRP_OPT). That way the image is built with a single, stable
+    # recipe hash so that no basehash-changed warnings are emitted.
     bootstrap_tasks = []
     bootstrap_tasks_late = []
     image_bootstrap_tasks = []
@@ -1442,8 +1514,8 @@ def ide_setup(args, config, basepath, workspace):
             recipe_image.initialize(config, tinfoil)
             if args.mode == DevtoolIdeMode.modified:
                 # Keep the image build separate so that the complete bbappend
-                # can be written in one step before the image is built,
-                # avoiding sstate hash mismatches.
+                # (IMAGE_ vars + QB_SLIRP_OPT) can be written in one step
+                # before the image is built, avoiding sstate hash mismatches.
                 image_bootstrap_tasks += recipe_image.bootstrap_tasks
             else:
                 bootstrap_tasks += recipe_image.bootstrap_tasks
@@ -1536,12 +1608,13 @@ def ide_setup(args, config, basepath, workspace):
                     'Note that devtool modify --debug-build can do this automatically.',
                     recipe_modified.name, recipe_modified.bbappend)
 
-        # Ports are now assigned. Write the complete image bbappend in a
-        # single step so that the image is built with exactly one recipe
-        # hash. This avoids the sstate basehash-changed warnings that
-        # arise when the bbappend is modified after the image has
-        # already been built. This also runs with --skip-bitbake, otherwise
-        # the section removed by strip_bbappend_sections() would be lost.
+        # Ports are now assigned. Write the complete image bbappend --
+        # IMAGE_ debug settings and QB_SLIRP_OPT -- in a single step so
+        # that the image is built with exactly one recipe hash. This
+        # avoids the sstate basehash-changed warnings that arise when
+        # the bbappend is modified after the image has already been
+        # built. This also runs with --skip-bitbake, otherwise the sections
+        # removed by strip_bbappend_sections() would be lost.
         bbappend_changed = False
         for ri in recipes_images:
             if ri.update_image_bbappend(recipes_modified):
@@ -1564,7 +1637,9 @@ def ide_setup(args, config, basepath, workspace):
                     finally:
                         reparse_tinfoil.shutdown()
 
-                # Phase 2: build the image
+                # Phase 2: build the image. do_image -> do_write_qemuboot_conf
+                # picks up QB_SLIRP_OPT from the bbappend written above, so no
+                # separate write_qemuboot_conf step is needed.
                 exec_build_env_command(
                     config.init_path, basepath,
                     bb_cmd + ' '.join(image_bootstrap_tasks), watch=True)
-- 
2.55.0


