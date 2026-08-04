Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C87C56203
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:53 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14710.1785844847550051698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=OkNo4V/L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260804120039af5eb545fe00020732-95r57y@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260804120039af5eb545fe00020732
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1VnbJhghmtfwZ9dwg3c5bmGFQFtVQb8br+AvoDpG4mw=;
 b=OkNo4V/LrqT99eJ3912snzXV5Z4DaixFSedglicNr/yJScCDkjaorCvBRGtfu8sR7Jv2Rj
 SAeh9cCSn4u9Q7Dpj690G9MmcjPI0uIOfVyjwY7B0Z+TfSBKDfT/u+DSebY0MvxNaHGKaGz0
 j6GhmICkcHGgBAb8sldAHcv80GOfR99220/8O0ouUfPbDfWo5bRssnB77K9ssGt6ajfFzq6Q
 yzwGMjaByE8ggJbw+6qFXzwfIu/fXqZXwxrED7XnRBFUgIU6pPGkpJbt3YbwYJY4uR0sm1aj
 KY1rVee0YlkTPcACnJ3szVopuw0l0mbc3sRll1X/H+H55eUnGptQ8M/g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 10/14] devtool: ide-sdk add LLDB support for clang toolchain
Date: Tue,  4 Aug 2026 13:59:34 +0200
Message-ID: <20260804120034.378787-11-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242729

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

Meson/ninja invoke the compiler with source paths relative to the build
directory B, rather than absolute paths. -fdebug-prefix-map and
-ffile-prefix-map only rewrite paths that literally start with the
mapped host prefix, so this relative DW_AT_name is never rewritten;
only the absolute DW_AT_comp_dir is. When resolving the compile unit
path, debuggers join comp_dir with the relative name, popping one
component per leading "..". In devtool workspaces the source directory
S is relocated far away from the build directory B (outside WORKDIR),
so DW_AT_name typically contains more ".." components than comp_dir
has path components. Once the join reaches "/", extra ".." are no-ops,
so the resolved path becomes "/" plus the leftover suffix of DW_AT_name
- a suffix of the real absolute source directory, not the
"/usr/src/debug/<pn>/<pv>" prefix that DEBUG_PREFIX_MAP and the
generated sourceMap assume.

Compute this "broken" resolved suffix for the recipe's own source
directory and use it instead of the original comp_dir-based mapping.
Keeping both mappings would point two different debug-info paths at
the same host path, which is ambiguous when CodeLLDB needs to reverse
the mapping (translating a locally opened file back into a debug-info
path to resolve a breakpoint): it picks the first-registered
("normal") mapping, which never matches any real compile unit here,
leaving breakpoints stuck pending with 0 locations.

Also set launch.json's relativePathBase to the build directory B, so
CodeLLDB resolves any source path that is still relative (i.e. not
covered by sourceMap/target.source-map) against B - the compiler's
working directory - instead of the default ${workspaceFolder}, which
does not necessarily match B in devtool workspaces.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  66 ++++++++
 scripts/lib/devtool/ide_plugins/ide_code.py | 150 +++++++++++++++++-
 scripts/lib/devtool/ide_sdk.py              | 161 +++++++++++++++++++-
 3 files changed, 368 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index cfb067548d..25575f18f4 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -187,6 +187,72 @@ class GdbCrossConfig(DebuggerCrossConfig):
         return "\"kill \\$(pgrep -o -f 'gdbserver --attach :%s') 2>/dev/null || true\"" % self.debug_server_port
 
 
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
+                 default_mode=DebuggerServerModes.MULTI):
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
+        lldb_server = self.debugger_cross.debug_server_path
+        # Use '*:<port>' so lldb-server binds on all interfaces (0.0.0.0), not
+        # just loopback.  The bare ':<port>' form only binds to 127.0.0.1 in
+        # lldb-server 21.x and the remote lldb client connects from the host.
+        # Start from /tmp because lldb-server creates temp files in its cwd and
+        # the SSH default cwd (/home/root) may not exist on a minimal image.
+        if mode == DebuggerServerModes.ONCE:
+            cmd = "cd /tmp && %s platform --one-shot --server --listen *:%s" % (
+                lldb_server, self.debug_server_port)
+        elif mode == DebuggerServerModes.MULTI:
+            hex_port = "%04X" % self.debug_server_port
+            pid_file = self._lldb_server_pid_file(mode)
+            tmp_dir = self._lldb_server_tmp_dir(mode)
+            log_file = self._lldb_server_log_file(mode)
+            cmd = "grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null && exit 0; " % hex_port
+            cmd += "mkdir -p %s; " % tmp_dir
+            cmd += "cd %s; " % tmp_dir
+            cmd += "%s platform --server --listen *:%s > %s 2>&1 & " % (
+                lldb_server, self.debug_server_port, log_file)
+            cmd += "echo \\$! > %s; " % pid_file
+            cmd += "_w=0; while ! grep -q :%s /proc/net/tcp /proc/net/tcp6 2>/dev/null; " % hex_port
+            cmd += "do _w=\\$((_w+1)); [ \\$_w -lt 100 ] || { echo lldb-server did not start on port %s >&2; exit 1; }; sleep 0.1; done;" % self.debug_server_port
+        else:
+            raise DevtoolError(
+                "lldb-server does not support mode %s "
+                "(ATTACH is handled client-side with 'process attach')" % mode)
+        return "\"/bin/sh -c '" + cmd + "'\""
+
+    def _target_kill_cmd(self):
+        """SSH command to stop a MULTI-mode lldb-server on the target."""
+        pid_file = self._lldb_server_pid_file(DebuggerServerModes.MULTI)
+        tmp_dir = self._lldb_server_tmp_dir(DebuggerServerModes.MULTI)
+        cmd = ("test -f %(pf)s && kill \\$(cat %(pf)s) 2>/dev/null; rm -rf %(td)s"
+               % {'pf': pid_file, 'td': tmp_dir})
+        return "\"/bin/sh -c '" + cmd + "'\""
+
+    def server_modes(self):
+        """ATTACH mode is not applicable for lldb-server platform."""
+        return [self.default_mode]
 
 class IdeBase:
     """Base class defining the interface for IDE plugins"""
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index d237ab8f66..9faba3f2d1 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -9,7 +9,7 @@ import json
 import logging
 import os
 import shutil
-from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, get_devtool_deploy_opts
+from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, LldbServerConfig, get_devtool_deploy_opts
 
 logger = logging.getLogger('devtool')
 
@@ -43,6 +43,28 @@ class GdbCrossConfigVSCode(GdbCrossConfig):
         ]
 
 
+class LldbServerConfigVSCode(LldbServerConfig):
+    """VSCode-specific lldb-server configuration for CodeLLDB remote debugging."""
+
+    def __init__(self, image_recipe, modified_recipe, binary,
+                 default_mode=DebuggerServerModes.MULTI):
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
 
@@ -284,6 +306,10 @@ class IdeVSCode(IdeBase):
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
@@ -327,7 +353,9 @@ class IdeVSCode(IdeBase):
             self.dot_code_dir(modified_recipe), prop_file, properties_dicts)
 
     def vscode_launch_bin_dbg(self, cross_debug_config, server_mode):
-        """Dispatch to the GDB launch config generator."""
+        """Dispatch to the GDB or LLDB launch config generator."""
+        if isinstance(cross_debug_config, LldbServerConfig):
+            return self._vscode_launch_bin_dbg_lldb(cross_debug_config, server_mode)
         return self._vscode_launch_bin_dbg_gdb(cross_debug_config, server_mode)
 
     def _vscode_launch_bin_dbg_gdb(self, cross_debug_config, server_mode):
@@ -414,6 +442,116 @@ class IdeVSCode(IdeBase):
 
         return launch_config
 
+    def _vscode_launch_bin_dbg_lldb(self, lldb_config, server_mode):
+        """Generate a CodeLLDB (type: lldb) launch configuration entry for launch.json.
+
+        CodeLLDB connects to lldb-server via the LLDB platform protocol.  The
+        initCommands select the remote platform and open the connection before
+        the process is launched, so CodeLLDB can inspect and control it.
+
+        Using targetCreateCommands instead of "program" so we can pass both the
+        local host binary (for debug symbols) and the remote target path (where
+        devtool deploy-target has already installed the binary) to
+        "target create --remote-file".  This prevents LLDB from uploading the
+        binary from its module cache to a temporary directory and ensures the
+        process starts from its installed location where the dynamic linker can
+        find shared libraries via the standard search paths.
+        """
+        modified_recipe = lldb_config.modified_recipe
+        debugger_cross = modified_recipe.debugger_cross
+
+        init_commands = [
+            "platform select remote-linux",
+            "platform connect connect://%s:%d" % (debugger_cross.host, lldb_config.debug_server_port),
+            # Clear the default step-avoid-regexp so std:: and other library
+            # namespaces are not silently skipped on step-in. (default is "std::" in LLDB 15+)
+            "settings set target.process.thread.step-avoid-regexp \"\"",
+        ]
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
+
+            # Point LLDB at the unstripped binaries and shared libraries in ${D}
+            # so it can load debug symbols for the recipe's own shared libraries.
+            # These are the files deployed by devtool deploy-target.
+            exec_search_paths = " ".join([
+                os.path.join(modified_recipe.d, modified_recipe.libdir.lstrip('/')),
+                os.path.join(modified_recipe.d, modified_recipe.base_libdir.lstrip('/')),
+                os.path.join(modified_recipe.d, modified_recipe.bindir.lstrip('/')),
+            ])
+            # Deduplicate in case base_libdir == libdir or paths coincide
+            exec_search_paths = " ".join(dict.fromkeys(exec_search_paths.split()))
+            init_commands.append(
+                "settings set target.exec-search-paths %s" % exec_search_paths)
+        else:
+            logger.warning(
+                "Cannot setup debug symbols configuration for LLDB. "
+                "IMAGE_GEN_DEBUGFS is not enabled.")
+
+        # "target create --remote-file <target_path> <host_debug_binary>":
+        # --remote-file tells LLDB which path to execute on the target.
+        # The positional argument is the local host binary, loaded for symbols.
+        # This keeps devtool deploy-target as the sole deployment mechanism and
+        # avoids LLDB uploading the binary to a temporary directory via its
+        # module cache.  Running from the installed path ensures the dynamic
+        # linker on the target can find shared libraries at their standard
+        # locations.
+        target_create_cmd = "target create --remote-file %s %s" % (
+            lldb_config.binary.binary_path,
+            lldb_config.binary.binary_host_path)
+
+        launch_config = {
+            "name": lldb_config.id_pretty_mode(server_mode),
+            "type": "lldb",
+            "request": "launch",
+            # Use targetCreateCommands instead of "program" to control both
+            # the local binary (for debug symbols) and the remote path.
+            "targetCreateCommands": [target_create_cmd],
+            "stopOnEntry": False,
+            "cwd": "/tmp",
+            "preLaunchTask": lldb_config.id_pretty_mode(server_mode),
+            "initCommands": init_commands,
+        }
+        if source_map:
+            launch_config["sourceMap"] = source_map
+        if modified_recipe.b:
+            # CodeLLDB resolves any source path that is still relative (as
+            # opposed to being rewritten to an absolute path by sourceMap /
+            # target.source-map) against "relativePathBase", defaulting to
+            # ${workspaceFolder}. Compilers are invoked with the build
+            # directory B as their working directory, so relative DW_AT_name
+            # entries (e.g. from meson/ninja) are relative to B. Pointing
+            # relativePathBase at B lets CodeLLDB resolve these directly,
+            # which matters in particular for devtool workspaces where S
+            # (and thus ${workspaceFolder}) is relocated outside of WORKDIR.
+            launch_config["relativePathBase"] = modified_recipe.b
+
+        return launch_config
+
     def vscode_launch(self, args, modified_recipe):
         """GDB launch configurations for user-space binaries.
 
@@ -745,8 +883,12 @@ class IdeVSCode(IdeBase):
         self.vscode_extensions(modified_recipe)
         self.vscode_c_cpp_properties(modified_recipe)
         if args.target:
-            self.initialize_cross_debug_configs(
-                image_recipe, modified_recipe, GdbCrossConfigVSCode)
+            if modified_recipe.toolchain == 'clang':
+                self.initialize_cross_debug_configs(
+                    image_recipe, modified_recipe, LldbServerConfigVSCode)
+            else:
+                self.initialize_cross_debug_configs(
+                    image_recipe, modified_recipe, GdbCrossConfigVSCode)
             self.vscode_launch(args, modified_recipe)
             self.vscode_tasks(args, modified_recipe)
 
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 13fab50f22..b56a0925cb 100755
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
+    def debug_server_path(self):
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
@@ -396,6 +436,7 @@ class RecipeModified:
         self.b = None
         self.base_libdir = None
         self.bblayers = None
+        self.bindir = None
         self.bitbakepath = None
         self.bpn = None
         self.d = None
@@ -476,6 +517,7 @@ class RecipeModified:
         self.b = recipe_d.getVar('B')
         self.base_libdir = recipe_d.getVar('base_libdir')
         self.bblayers = recipe_d.getVar('BBLAYERS').split()
+        self.bindir = recipe_d.getVar('bindir')
         self.bitbakepath = recipe_d.getVar('BITBAKEPATH')
         self.bpn = recipe_d.getVar('BPN')
         self.cc = recipe_d.getVar('CC')
@@ -669,8 +711,106 @@ class RecipeModified:
         if unused_host_paths:
             logger.info("Some source directories mapped by -fdebug-prefix-map are not included in the debugger search paths. Ignored host paths: %s", unused_host_paths)
 
+        self._add_broken_srctree_prefix_map(mappings)
+
         return mappings
 
+    def _add_broken_srctree_prefix_map(self, mappings):
+        """Work around a -f*-prefix-map / DWARF path resolution issue affecting
+        out-of-tree devtool workspaces (e.g. meson recipes built via 'devtool modify'
+        with the clang toolchain).
+
+        meson/ninja may invoke the compiler with a *relative* source file path
+        when the build directory B (under WORKDIR) and the source directory S
+        (relocated outside WORKDIR by 'devtool modify') only share a distant
+        common ancestor. -fdebug-prefix-map/-ffile-prefix-map only rewrite
+        paths that literally start with the mapped host prefix, so a relative
+        path argument is never rewritten: only DW_AT_comp_dir (which is
+        absolute) gets rewritten, DW_AT_name stays relative and unrewritten.
+
+        This has only been observed to actually happen with the clang
+        toolchain: clang's meson/ninja invocation embeds a relative DW_AT_name
+        for out-of-tree sources, while gcc, even via meson/ninja, embeds an
+        absolute (and correctly -fdebug-prefix-map-rewritten) DW_AT_name, so
+        no underflow can happen there - confirmed empirically:
+        oe-selftest's test_devtool_ide_sdk_none_qemu (gcc toolchain, covering
+        both cmake-example and meson-example) fails when this workaround is
+        applied unconditionally to meson, while the dedicated clang tests
+        (test_devtool_ide_sdk_{code,none}_meson_clang) require it. cmake
+        (with the Ninja or Makefiles generators used here) always passes
+        absolute source paths to the compiler regardless of toolchain, so it
+        never needs this workaround either. Applying this workaround outside
+        of the meson+clang combination would incorrectly discard the correct
+        (and, for gcc/cmake, already working) comp_dir-based mapping - see the
+        'del mappings[target_path]' below - falling back to the generic
+        '/usr/src/debug' mapping to the image's (stale, whole-image-build-time)
+        rootfs-dbg instead of the live source tree.
+
+        Debuggers resolve the compile unit path by joining DW_AT_comp_dir with
+        the relative DW_AT_name, popping one path component per leading "..".
+        If DW_AT_name contains more ".." components than DW_AT_comp_dir has
+        path components, the extra ".." are no-ops once the root is reached
+        (they can't go above "/"), so the final resolved path becomes "/"
+        followed by the leftover (non-"..") components of DW_AT_name - i.e. a
+        suffix of the real, absolute source directory rather than the
+        "/usr/src/debug/<pn>/<pv>" prefix that DEBUG_PREFIX_MAP and the
+        generated sourceMap/sourceFileMap assume.
+
+        This computes that resolved suffix for the recipe's own source
+        directory (S) and replaces the (now dead, since every file under S is
+        affected the same way) comp_dir-based mapping with it, so debuggers
+        relying on prefix matching (e.g. CodeLLDB, GDB) can still locate the
+        sources.
+
+        Note: the original comp_dir-based target_path is removed rather than
+        kept alongside the new one. Keeping both would mean two different
+        target paths map to the same host path (S), which is ambiguous when a
+        debugger needs to go the other way round: translating a local file
+        (opened from the host/workspace) back into a debug-info path in order
+        to resolve a source breakpoint. CodeLLDB in particular appears to
+        pick the first-registered ("normal", comp_dir-based) mapping in that
+        case, which never matches any real compile unit here, leaving the
+        breakpoint pending with 0 locations.
+        """
+        if self.build_tool is not BuildTool.MESON or self.toolchain != "clang":
+            return
+        if not self.real_srctree or not self.b:
+            return
+
+        b_real = os.path.realpath(self.b)
+        srctree_real = os.path.realpath(self.real_srctree)
+        common = os.path.commonpath([b_real, srctree_real])
+        if common in (b_real, srctree_real):
+            # B is srctree (or a parent of it), or B is nested inside srctree:
+            # either way the compiler is never invoked with a source path that
+            # climbs above the common ancestor, so no underflow can happen.
+            return
+
+        # Number of ".." path components needed to get from the compiler's
+        # working directory (the build directory B) up to the common ancestor
+        # with the source tree. This is how many leading ".." components
+        # DW_AT_name would contain for sources directly under S.
+        overshoot_components = len(os.path.relpath(b_real, common).split(os.sep))
+
+        for target_path, host_path in list(mappings.items()):
+            if host_path != srctree_real:
+                # Only the recipe's own source directory (S) is relocated by
+                # devtool modify, other mapped directories are unaffected.
+                continue
+            comp_dir_components = len([c for c in target_path.split('/') if c])
+            if overshoot_components <= comp_dir_components:
+                # The rewritten DW_AT_comp_dir has enough components to
+                # absorb all the ".." in DW_AT_name, no underflow happens.
+                continue
+            broken_target = '/' + os.path.relpath(srctree_real, common)
+            if broken_target not in mappings:
+                mappings[broken_target] = host_path
+            # The comp_dir-based target_path never actually occurs in the
+            # debug info for files under S (all of them hit the same
+            # overshoot), so keeping it around only creates an ambiguous
+            # reverse mapping (see docstring above). Drop it.
+            del mappings[target_path]
+
     @property
     def gdb_pretty_print_scripts(self):
         if self._gdb_pretty_print_scripts is None:
@@ -1182,8 +1322,11 @@ def ide_setup(args, config, basepath, workspace):
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
@@ -1207,12 +1350,20 @@ def ide_setup(args, config, basepath, workspace):
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
2.55.0


