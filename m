Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA56C61DE1
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9428.1788100183422803269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=cOodslCw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2026083014294229b937ac9b000207b8-f8fevb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026083014294229b937ac9b000207b8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=B8M3e2ftQKbU/9etaO/tIPHceGHCINHXs6ltOBNq8IU=;
 b=cOodslCw3uu0bMPE6CIq6O3narqZjOcd2DQlL5hTONmAE1ei7e1iLWS9ZBTpCrV8aRxiP7
 5dQELPR1TMo0JnJOApGJHf87ltfM+Cvj6zCWcr5Md+o5OObTeJpmm21uBMjxa7YtG5eZkOYH
 2+nDqz58oFRQK7qkbUdUlzUtkD/ZVvim74J9mPXKTrfO1fPzl3bSgXVFh8kcDQelEQ4MVO6Z
 SWDJ2PivskY7jVElxMww+VK9Iud1r5l9CV0XbtRGzoHM5xuzwzwUpwTO74A2JtB9IUceqO16
 /m7tq/4XIC38t6E4ewygW62i8rofiHRPS+bDfSKxWtQDo0ObvCHQZrdw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 23/24] devtool: ide-sdk: support NFS rootfs
Date: Sun, 30 Aug 2026 16:28:50 +0200
Message-ID: <20260830142922.17241-24-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244683

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add --nfs=rootfs and --nfs=rootfs-dbg to build the matching tar image,
extract it below the workspace image directory, and use it as the
deploy-target/debug destination instead of ssh.

Configure remote debuggers to search the extracted workspace rootfs-dbg
when --nfs=rootfs-dbg is selected, matching the filesystem exported to
the target.

devtool deploy-target and the generated deploy_target/install_and_deploy
scripts learn to copy files directly into a local pseudo-managed rootfs
directory (deploy_no_d()/_deploy_local()) when the target is an absolute
path, instead of requiring ssh. The pseudo binary needed for this is
resolved from qemu-helper-native's STAGING_DIR_NATIVE at devtool ide-sdk
generation time, when the build environment is known to be sourced, and
baked into the generated script so it keeps working when later re-run
standalone, e.g. as a VS Code task, without oe-find-native-sysroot on
PATH.

tasks.json generation (vscode_tasks_cpp/vscode_tasks_kernel_module) now
resolves the effective deploy target via resolve_deploy_target(), so the
--nfs local directory is used consistently instead of the ssh target
when both apply.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py               |  22 ++-
 scripts/lib/devtool/ide_plugins/__init__.py |  22 ++-
 scripts/lib/devtool/ide_plugins/ide_code.py |  39 +++--
 scripts/lib/devtool/ide_plugins/ide_none.py |   2 +-
 scripts/lib/devtool/ide_sdk.py              | 153 ++++++++++++++++++--
 5 files changed, 203 insertions(+), 35 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 88c6e383a0..020174502a 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -256,7 +256,7 @@ def deploy(args, config, basepath, workspace):
     return deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=args.file_globs, packages_files=packages_files)
 
 def _deploy_local(args, target_dir, filelist, ftotalsize, tar_relpaths, allowed_files,
-                fakerootcmd, fakerootenv, path, recipe_outdir):
+                fakerootcmd, fakerootenv, path, recipe_outdir, qemu_helper_native_sysroot=None):
     """Copy files directly into target_dir instead of over ssh/scp.
 
     target_dir is expected to be a pseudo-managed rootfs previously extracted
@@ -271,10 +271,17 @@ def _deploy_local(args, target_dir, filelist, ftotalsize, tar_relpaths, allowed_
             '%s does not exist - %s does not look like a pseudo-managed rootfs '
             '(e.g. one extracted by devtool ide-sdk --nfs).' % (state_dir, target_dir))
 
-    environment = native_environment()
-    pseudo = environment.get('PSEUDO')
-    native_sysroot = environment.get('OECORE_NATIVE_SYSROOT')
-    if not pseudo or not native_sysroot:
+    if qemu_helper_native_sysroot:
+        # Already resolved at script-generation time (when the build
+        # environment was sourced), so this can run standalone, e.g. from a
+        # devtool ide-sdk generated script/VS Code task.
+        native_sysroot = qemu_helper_native_sysroot
+        pseudo = os.path.join(native_sysroot, 'usr', 'bin', 'pseudo')
+    else:
+        environment = native_environment()
+        pseudo = environment.get('PSEUDO')
+        native_sysroot = environment.get('OECORE_NATIVE_SYSROOT')
+    if not pseudo or not native_sysroot or not os.path.exists(pseudo):
         raise DevtoolError('qemu-helper-native did not provide pseudo')
 
     if not args.no_check_space:
@@ -419,7 +426,7 @@ def _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files
 
     return 0
 
-def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=None, packages_files=None):
+def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=None, packages_files=None, qemu_helper_native_sysroot=None):
     import math
 
     if os.path.isabs(args.target):
@@ -524,7 +531,8 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         # A local directory (e.g. an NFS-exported rootfs) rather than a
         # user@host ssh target: copy the files in directly, no network needed.
         return _deploy_local(args, os.path.realpath(args.target), filelist, ftotalsize, tar_relpaths,
-                            allowed_files, fakerootcmd, fakerootenv, path, recipe_outdir)
+                            allowed_files, fakerootcmd, fakerootenv, path, recipe_outdir,
+                            qemu_helper_native_sysroot=qemu_helper_native_sysroot)
 
     return _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths,
                         allowed_files, fakerootcmd, fakerootenv, path, recipe_outdir)
diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 0d0117344d..fd66060682 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -406,11 +406,27 @@ class IdeBase:
                 raise err
 
 
-def get_devtool_deploy_opts(args):
+def resolve_deploy_target(args, target_override=None):
+    """Resolve the effective devtool deploy-target destination.
+
+    target_override, e.g. the local NFS rootfs directory when --nfs was used
+    (see devtool.deploy for how a directory target is handled without ssh),
+    always takes precedence over the ssh target from -t/--target. Returns
+    None if neither is set.
+    """
+    if target_override:
+        return target_override
+    if args.target:
+        return args.target
+    return None
+
+
+def get_devtool_deploy_opts(args, target_override=None):
     """Filter args for devtool deploy-target args"""
-    if not args.target:
+    target = resolve_deploy_target(args, target_override)
+    if not target:
         return None
-    devtool_deploy_opts = [args.target]
+    devtool_deploy_opts = [target]
     if args.no_host_check:
         devtool_deploy_opts += ["-c"]
     if args.show_status:
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 937c63a4a5..88aa3ff805 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -9,7 +9,8 @@ import json
 import logging
 import os
 import shutil
-from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, LldbServerConfig, get_devtool_deploy_opts
+from devtool import DevtoolError
+from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, LldbServerConfig, get_devtool_deploy_opts, resolve_deploy_target
 
 logger = logging.getLogger('devtool')
 
@@ -593,10 +594,15 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), launch_file, launch_dict)
 
-    def vscode_tasks_cpp(self, args, modified_recipe):
-        run_install_deploy = modified_recipe.gen_install_deploy_script(args)
+    def vscode_tasks_cpp(self, args, image_recipe, modified_recipe):
+        run_install_deploy = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
-        deploy_args = ["--target", args.target]
+        deploy_target = resolve_deploy_target(args, image_recipe.nfs_deploy_dir)
+        if not deploy_target:
+            raise DevtoolError('No deploy target available for %s' % modified_recipe.recipe_id_pretty)
+        # Same target the script already has baked in as its default, so this
+        # is a harmless no-op override, but keeps the task self-contained.
+        deploy_args = ["--target", deploy_target]
         if args.port:
             deploy_args += ["--port", args.port]
         for package in args.package or []:
@@ -693,7 +699,7 @@ class IdeVSCode(IdeBase):
         args += [target_device.target, remote_cmd]
         return args
 
-    def vscode_tasks_kernel_module(self, args, modified_recipe):
+    def vscode_tasks_kernel_module(self, args, image_recipe, modified_recipe):
         """Generate tasks.json for kernel module recipes.
 
         Three tasks are generated and chained in sequence:
@@ -716,8 +722,13 @@ class IdeVSCode(IdeBase):
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
         reload_task_name = "reload module %s" % modified_recipe.recipe_id_pretty
         verify_task_name = "verify module %s" % modified_recipe.recipe_id_pretty
-        run_install_deploy = modified_recipe.gen_install_deploy_script(args)
-        deploy_args = ["--target", args.target]
+        run_install_deploy = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
+        deploy_target = resolve_deploy_target(args, image_recipe.nfs_deploy_dir)
+        if not deploy_target:
+            raise DevtoolError('No deploy target available for %s' % modified_recipe.recipe_id_pretty)
+        # Same target the script already has baked in as its default, so this
+        # is a harmless no-op override, but keeps the task self-contained.
+        deploy_args = ["--target", deploy_target]
         if args.port:
             deploy_args += ["--port", args.port]
         for package in args.package or []:
@@ -759,7 +770,7 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
 
-    def vscode_tasks_fallback(self, args, modified_recipe):
+    def vscode_tasks_fallback(self, args, image_recipe, modified_recipe):
         oe_init_dir = modified_recipe.oe_init_dir
         oe_init = ". %s %s > /dev/null && " % (modified_recipe.oe_init_build_env, modified_recipe.topdir)
         dt_build = "devtool build "
@@ -772,7 +783,7 @@ class IdeVSCode(IdeBase):
         dt_deploy_label = dt_deploy + modified_recipe.recipe_id_pretty
         dt_deploy_cmd = dt_deploy + modified_recipe.bpn
         dt_build_deploy_label = "devtool build & deploy-target %s" % modified_recipe.recipe_id_pretty
-        deploy_opts = ' '.join(get_devtool_deploy_opts(args))
+        deploy_opts = ' '.join(get_devtool_deploy_opts(args, image_recipe.nfs_deploy_dir))
         tasks_dict = {
             "version": "2.0.0",
             "tasks": [
@@ -892,13 +903,13 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
 
-    def vscode_tasks(self, args, modified_recipe):
+    def vscode_tasks(self, args, image_recipe, modified_recipe):
         if modified_recipe.build_tool.is_c_cpp:
-            self.vscode_tasks_cpp(args, modified_recipe)
+            self.vscode_tasks_cpp(args, image_recipe, modified_recipe)
         elif modified_recipe.build_tool == BuildTool.KERNEL_MODULE:
-            self.vscode_tasks_kernel_module(args, modified_recipe)
+            self.vscode_tasks_kernel_module(args, image_recipe, modified_recipe)
         else:
-            self.vscode_tasks_fallback(args, modified_recipe)
+            self.vscode_tasks_fallback(args, image_recipe, modified_recipe)
 
     def setup_modified_recipe(self, args, image_recipe, modified_recipe):
         self.vscode_settings(modified_recipe, image_recipe)
@@ -912,7 +923,7 @@ class IdeVSCode(IdeBase):
                 self.initialize_cross_debug_configs(
                     image_recipe, modified_recipe, GdbCrossConfigVSCode)
             self.vscode_launch(args, modified_recipe)
-            self.vscode_tasks(args, modified_recipe)
+            self.vscode_tasks(args, image_recipe, modified_recipe)
 
 
 def register_ide_plugin(ide_plugins):
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
index e4b255f2fa..559940fda2 100644
--- a/scripts/lib/devtool/ide_plugins/ide_none.py
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -312,7 +312,7 @@ class IdeNone(IdeBase):
         - Generate a gdbinit file per executable
         - Generate the oe-scripts sym-link
         """
-        script_path = modified_recipe.gen_install_deploy_script(args)
+        script_path = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
         logger.info("Created: %s" % script_path)
 
         if modified_recipe.toolchain == 'clang':
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index ee3c50460a..8090117959 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -26,6 +26,7 @@ from devtool.standard import get_real_srctree
 from devtool.deploy import parse_packages_arg
 from devtool.ide_plugins import BuildTool, DebuggerCrossConfig
 from oe.kernel_module import kernel_module_os_env
+from runqemu_utils import RunQemuRootfsError, extract_sdk_rootfs, pseudo_state_dir
 
 
 logger = logging.getLogger('devtool')
@@ -212,8 +213,14 @@ class RecipeImage:
 
     def __init__(self, name, orig_bbappend_content=None):
         self.name = name
-        self.rootfs = None
+        self.pn = None
+        self.__rootfs = None
         self.__rootfs_dbg = None
+        self.__nfs_rootfs = None
+        self.__nfs_rootfs_dbg = None
+        self.__nfs_deploy_dir = None
+        self.deploy_dir_image = None
+        self.image_link_name = None
         self.qb_slirp_opt = ''
         self.bootstrap_tasks = [self.name + ':do_build']
         # Debug settings already provided by the base configuration (e.g.
@@ -221,6 +228,7 @@ class RecipeImage:
         # content other than devtool ide-sdk's own sections (see
         # strip_bbappend_sections()). Populated by initialize().
         self.base_image_gen_debugfs = False
+        self.base_image_fstypes = set()
         self.base_image_fstypes_debugfs = ''
         self.base_has_combined_dbg = False
         self.base_image_install = set()
@@ -271,8 +279,11 @@ class RecipeImage:
             raise DevtoolError(
                 "Parsing image recipe %s failed" % self.name)
 
+        self.pn = image_d.getVar('PN')
         self.base_image_gen_debugfs = image_d.getVar(
             'IMAGE_GEN_DEBUGFS') == '1'
+        self.base_image_fstypes = set(
+            (image_d.getVar('IMAGE_FSTYPES') or '').split())
         self.base_image_fstypes_debugfs = image_d.getVar(
             'IMAGE_FSTYPES_DEBUGFS') or ''
         self.base_has_combined_dbg = bb.data.inherits_class(
@@ -281,22 +292,75 @@ class RecipeImage:
             (image_d.getVar('IMAGE_INSTALL') or '').split())
 
         workdir = image_d.getVar('WORKDIR')
-        self.rootfs = os.path.join(workdir, 'rootfs')
+        self.__rootfs = os.path.join(workdir, 'rootfs')
         self.__rootfs_dbg = os.path.join(workdir, 'rootfs-dbg')
 
+        self.deploy_dir_image = image_d.getVar('DEPLOY_DIR_IMAGE')
+        self.image_link_name = image_d.getVar('IMAGE_LINK_NAME')
         self.qb_slirp_opt = image_d.getVar('QB_SLIRP_OPT') or ''
 
     @property
     def debug_support(self):
         return bool(self.rootfs_dbg)
 
+    @property
+    def rootfs(self):
+        """Prefer the live NFS-exported rootfs (if --nfs=rootfs is used) over the
+        static WORKDIR/rootfs left over from the image build, so solib_search_path()
+        finds files as devtool deploy-target actually updates them."""
+        if self.__nfs_rootfs:
+            return self.__nfs_rootfs
+        return self.__rootfs
+
     @property
     def rootfs_dbg(self):
+        if self.__nfs_rootfs_dbg:
+            return self.__nfs_rootfs_dbg
         if self.__rootfs_dbg and os.path.isdir(self.__rootfs_dbg):
             return self.__rootfs_dbg
         return None
 
-    def update_image_bbappend(self, recipes_modified):
+    def set_nfs_rootfs(self, workspace_path, nfs):
+        """Select the workspace NFS rootfs for generated debugger paths and deploys."""
+        if not nfs:
+            return
+        self.__nfs_deploy_dir = self.nfs_rootfs_dir(workspace_path, nfs)
+        if nfs == 'rootfs-dbg':
+            self.__nfs_rootfs_dbg = self.__nfs_deploy_dir
+        elif nfs == 'rootfs':
+            self.__nfs_rootfs = self.__nfs_deploy_dir
+
+    @property
+    def nfs_deploy_dir(self):
+        """Directory to deploy modified-recipe files into instead of over ssh, if --nfs was used."""
+        return self.__nfs_deploy_dir
+
+    def nfs_rootfs_dir(self, workspace_path, nfs):
+        """Return the workspace directory for the selected NFS rootfs."""
+        return os.path.join(workspace_path, 'nfs-exports', self.pn, nfs)
+
+    def nfs_runqemu_helper(self, workspace_path, nfs):
+        """Create a helper that boots the selected rootfs through runqemu."""
+        export_dir = os.path.join(workspace_path, 'nfs-exports', self.pn)
+        rootfs_dir = self.nfs_rootfs_dir(workspace_path, nfs)
+        qemuboot = os.path.join(
+            self.deploy_dir_image, self.image_link_name + '.qemuboot.conf')
+        if not os.path.exists(qemuboot):
+            logger.info(
+                'No qemuboot configuration was generated for %s; '
+                'not creating a runqemu helper.', self.name)
+            return None
+
+        helper = os.path.join(export_dir, 'runqemu-' + nfs)
+        with open(helper, 'w') as helper_file:
+            helper_file.write('#!/bin/sh\n')
+            helper_file.write(
+                'exec runqemu %s %s "$@"\n' % (
+                    shlex.quote(qemuboot), shlex.quote(rootfs_dir)))
+        os.chmod(helper, os.stat(helper).st_mode | stat.S_IEXEC)
+        return helper
+
+    def update_image_bbappend(self, recipes_modified, nfs=None):
         """Write debug settings for modified-mode recipes into the image bbappend.
 
         Writes IMAGE_GEN_DEBUGFS, IMAGE_FSTYPES_DEBUGFS, IMAGE_CLASSES for
@@ -323,7 +387,17 @@ class RecipeImage:
         lines = []
         if not self.base_image_gen_debugfs:
             lines.append('IMAGE_GEN_DEBUGFS = "1"')
-        if self.base_image_fstypes_debugfs != '':
+        if nfs == 'rootfs':
+            if 'tar' not in self.base_image_fstypes:
+                lines.append('IMAGE_FSTYPES:append = " tar"')
+        elif nfs == 'rootfs-dbg':
+            if self.base_image_fstypes_debugfs:
+                if 'tar' not in self.base_image_fstypes_debugfs.split():
+                    lines.append('IMAGE_FSTYPES_DEBUGFS:append = " tar"')
+            else:
+                lines.append('IMAGE_FSTYPES_DEBUGFS = "tar"')
+        elif self.base_image_fstypes_debugfs != '':
+            # Without --nfs no debug filesystem image is needed at all.
             lines.append('IMAGE_FSTYPES_DEBUGFS = ""')
         if not self.base_has_combined_dbg:
             lines.append('IMAGE_CLASSES += "image-combined-dbg"')
@@ -368,6 +442,33 @@ class RecipeImage:
         slirp_changed = self.update_qb_slirp_opt()
         return image_changed or slirp_changed
 
+    def extract_nfs_rootfs(self, workspace_path, nfs, target):
+        """Refresh the selected rootfs under the devtool workspace."""
+        suffix = '-dbg' if nfs == 'rootfs-dbg' else ''
+        rootfs_tarball = os.path.join(
+            self.deploy_dir_image, self.image_link_name + suffix + '.tar')
+        rootfs_dir = self.nfs_rootfs_dir(workspace_path, nfs)
+        state_dir = pseudo_state_dir(rootfs_dir)
+
+        for stale_dir in (rootfs_dir, state_dir):
+            if os.path.exists(stale_dir):
+                shutil.rmtree(stale_dir)
+
+        try:
+            extract_sdk_rootfs(rootfs_tarball, rootfs_dir)
+        except RunQemuRootfsError as exc:
+            raise DevtoolError('Unable to prepare NFS rootfs: %s' % exc) from exc
+
+        logger.info('NFS rootfs extracted to %s', rootfs_dir)
+        helper = self.nfs_runqemu_helper(workspace_path, nfs)
+        if helper:
+            opts = 'slirp' if is_loopback_target(target) else ''
+            logger.info(
+                'With the build environment sourced, start QEMU with NFS rootfs:\n'
+                '  %s %s\n'
+                'Pass any additional runqemu options to this helper.',
+                helper, opts)
+
     def update_qb_slirp_opt(self):
         """Update QB_SLIRP_OPT in the image bbappend
 
@@ -655,6 +756,11 @@ class RecipeModified:
         self.reverse_debug_prefix_map = {}
         self.fakerootcmd = None
         self.fakerootenv = None
+        # STAGING_DIR_NATIVE of qemu-helper-native, needed by deploy_no_d() to
+        # locate the pseudo binary for a local (e.g. NFS-exported) deploy
+        # target without depending on oe-find-native-sysroot / a sourced
+        # build environment at script run time.
+        self.qemu_helper_native_sysroot = None
         self.libdir = None
         self.max_process = None
         self.package_arch = None
@@ -742,6 +848,12 @@ class RecipeModified:
         self.debug_build = recipe_d.getVar('DEBUG_BUILD')
         self.fakerootcmd = recipe_d.getVar('FAKEROOTCMD')
         self.fakerootenv = recipe_d.getVar('FAKEROOTENV')
+        qemu_helper_native_d = parse_recipe(
+            config, tinfoil, 'qemu-helper-native', appends=True, filter_workspace=False)
+        if not qemu_helper_native_d:
+            raise DevtoolError("Parsing qemu-helper-native recipe failed")
+        self.qemu_helper_native_sysroot = os.path.realpath(
+            qemu_helper_native_d.getVar('STAGING_DIR_NATIVE'))
         self.libdir = recipe_d.getVar('libdir')
         self.max_process = int(recipe_d.getVar(
             "BB_NUMBER_THREADS") or os.cpu_count() or 1)
@@ -1342,12 +1454,17 @@ class RecipeModified:
                                 'by the %s recipe (PACKAGES: %s)' %
                                 (package, self.pn, ' '.join(self.packages_files.keys())))
 
-    def gen_deploy_target_script(self, args):
+    def gen_deploy_target_script(self, args, deploy_target=None):
         """Generate a script which does what devtool deploy-target does
 
         This script is much quicker than devtool target-deploy. Because it
         does not need to start a bitbake server. All information from tinfoil
         is hard-coded in the generated script.
+
+        deploy_target overrides args.target as the baked-in default, e.g. with
+        the local NFS rootfs directory when --nfs was used (see devtool.deploy
+        for how a directory target is handled without ssh). A runtime -t/--target
+        can still override this default, same as without --nfs.
         """
         self._validate_requested_packages(args)
         cmd_lines = ['#!%s' % str(sys.executable)]
@@ -1362,6 +1479,8 @@ class RecipeModified:
                        'no_preserve', 'port', 'show_status', 'ssh_exec', 'strip', 'target']
         filtered_args_dict = {key: value for key, value in vars(
             args).items() if key in args_filter}
+        if deploy_target:
+            filtered_args_dict['target'] = deploy_target
         if is_loopback_target(filtered_args_dict['target']):
             filtered_args_dict['no_host_check'] = True
         cmd_lines.append('filtered_args_dict = %s' % str(filtered_args_dict))
@@ -1394,10 +1513,11 @@ class RecipeModified:
         cmd_lines.append('    filtered_args.no_host_check = True')
         cmd_lines.append(
             'setattr(filtered_args, "recipename", "%s")' % self.bpn)
-        cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args, file_globs=file_globs, packages_files=packages_files)' %
+        cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args, file_globs=file_globs, packages_files=packages_files, qemu_helper_native_sysroot="%s")' %
                          (self.d, self.workdir, self.path, self.strip_cmd,
                           self.libdir, self.base_libdir, self.max_process,
-                          self.fakerootcmd, self.fakerootenv))
+                          self.fakerootcmd, self.fakerootenv,
+                          self.qemu_helper_native_sysroot))
         return self.write_script(cmd_lines, 'deploy_target')
 
     def gen_install_task_script(self):
@@ -1421,11 +1541,11 @@ class RecipeModified:
                       '    tinfoil.shutdown()']
         return self.write_script(cmd_lines, 'bb_run_do_install')
 
-    def gen_install_deploy_script(self, args):
+    def gen_install_deploy_script(self, args, deploy_target=None):
         """Generate a script which does install and deploy"""
         cmd_lines = ['#!/bin/sh -e']
         cmd_lines.append(self.gen_install_task_script())
-        cmd_lines.append(self.gen_deploy_target_script(args) + ' "$@"')
+        cmd_lines.append(self.gen_deploy_target_script(args, deploy_target) + ' "$@"')
 
         return self.write_script(cmd_lines, 'install_and_deploy')
 
@@ -1528,6 +1648,9 @@ def ide_setup(args, config, basepath, workspace):
                 logger.error("In shared sysroots mode modified recipes %s cannot be handled." % str(
                     recipes_modified_names))
                 invalid_params = True
+            if args.nfs:
+                logger.error("--nfs is only supported in modified mode.")
+                invalid_params = True
         if args.mode == DevtoolIdeMode.modified:
             if not recipes_modified_names:
                 appends_dir = os.path.join(config.workspace_path, 'appends')
@@ -1570,6 +1693,7 @@ def ide_setup(args, config, basepath, workspace):
                 recipes_image_name,
                 orig_bbappend_contents.get(recipes_image_name))
             recipe_image.initialize(config, tinfoil)
+            recipe_image.set_nfs_rootfs(config.workspace_path, args.nfs)
             if args.mode == DevtoolIdeMode.modified:
                 # Keep the image build separate so that the complete bbappend
                 # (IMAGE_ vars + QB_SLIRP_OPT) can be written in one step
@@ -1675,7 +1799,7 @@ def ide_setup(args, config, basepath, workspace):
         # removed by strip_bbappend_sections() would be lost.
         bbappend_changed = False
         for ri in recipes_images:
-            if ri.update_image_bbappend(recipes_modified):
+            if ri.update_image_bbappend(recipes_modified, args.nfs):
                 bbappend_changed = True
 
         if not args.skip_bitbake:
@@ -1701,6 +1825,10 @@ def ide_setup(args, config, basepath, workspace):
                 exec_build_env_command(
                     config.init_path, basepath,
                     bb_cmd + ' '.join(image_bootstrap_tasks), watch=True)
+
+        if args.nfs and not args.skip_bitbake:
+            for ri in recipes_images:
+                ri.extract_nfs_rootfs(config.workspace_path, args.nfs, args.target)
     else:
         raise DevtoolError("Must not end up here.")
 
@@ -1775,6 +1903,11 @@ def register_commands(subparsers, context):
         '-P', '--port', help='Specify ssh port to use for connection to the target')
     parser_ide_sdk.add_argument(
         '-I', '--key', help='Specify ssh private key for connection to the target')
+    parser_ide_sdk.add_argument(
+        '--nfs', choices=('rootfs', 'rootfs-dbg'),
+        help='Build and extract the selected image rootfs below '
+        '<workspace>/nfs-exports/<image-PN>/ '
+        'for NFS booting.')
     parser_ide_sdk.add_argument(
         '--skip-bitbake', help='Skip the bitbake builds which update the SDK. The recipes are still parsed, '
         'the IDE configuration is generated from their metadata', action='store_true')
-- 
2.55.0


