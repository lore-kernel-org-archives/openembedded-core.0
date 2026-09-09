Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CCCC88E46
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79.1788990824462444181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=QjgiDtsu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-202609092153427eb73e0b2d00020794-rsroi2@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202609092153427eb73e0b2d00020794
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WJ5LeN9mGHrprBWr2oUhdqLWd+UKKBc7g9uZhOMMg1M=;
 b=QjgiDtsuGuwYoHK3A2ulBF8G42yFD93pnv2g6xe0+kH0lHdBRD+Tc2c2mM9uWA7QmnSev7
 EB5QioTBO3MVmY4YYEmLPHPq6WfHoidZDkJQQXOXtRVEPaprvE2vDjkF8QFC4k/0I9aS5MzS
 /AhzjyF/rRN93cQDufxqj7CEWAGlKy3e0MH8QB9OINFhNao1eRNHbq3kEakatawi6NgVN1ok
 BpO4Dhav7Tx5MXmRz0HP2puDp/KuDSQIqp5pUBd+YWLzNZm8GFfPveCj/oN9H/NJ+yBwCr5l
 W1GtvADiPGWFM8PUbSjrJ5GgB/FQpsNYfrGTh3FTbTzSvBIwVm2dTveQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 04/15] devtool: ide-sdk: support NFS rootfs
Date: Wed,  9 Sep 2026 23:53:04 +0200
Message-ID: <20260909215337.89106-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245505

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a new command line option --nfs to devtool ide-sdk. This allows
running the full ide-sdk workflow against a target device booted with
an NFS rootfs, instead of deploying over ssh.

devtool ide-sdk extracts the image's tar archive, a bootable rootfs,
below <workspace>/nfs-exports/<image-PN>/ (optionally relocatable via
--nfs-extract-dir), and generates a small helper script next to it that
starts QEMU booting from that rootfs, which in turn serves it via NFS
using runqemu-export-rootfs.
Deploying the modified recipe writes directly into this directory
instead of ssh, using devtool deploy-target's local rootfs support.

--nfs=rootfs boots the plain rootfs, same as a non-NFS ssh setup, so
debugging still relies on the locally built rootfs-dbg/D debug symbols.
--nfs=rootfs-dbg instead extracts and boots the combined debug rootfs.
The generated debugging configurations still read those debug symbols
on the host side, but from the extracted directory, not as usual from
the image's WORKDIR. Since the target also boots that same directory
over NFS, the symbols are available target-side too, e.g. for perf or
gcov.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  19 +-
 scripts/lib/devtool/ide_plugins/ide_code.py |  29 +--
 scripts/lib/devtool/ide_plugins/ide_none.py |   2 +-
 scripts/lib/devtool/ide_sdk.py              | 217 +++++++++++++++++++-
 4 files changed, 240 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 91063c8d12..bb9f100652 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -411,11 +411,22 @@ class IdeBase:
                 raise err
 
 
-def get_devtool_deploy_opts(args):
+def resolve_deploy_target(args, target_override=None):
+    """Resolve the effective devtool deploy-target destination.
+
+    target_override, e.g. the local NFS rootfs directory when --nfs was used
+    (see devtool.deploy for how a directory target is handled without ssh),
+    always takes precedence over the ssh target from -t/--target.
+    """
+    target = target_override or args.target
+    if not target:
+        raise DevtoolError('No deploy target, pass -t/--target or --nfs')
+    return target
+
+
+def get_devtool_deploy_opts(args, target_override=None):
     """Filter args for devtool deploy-target args"""
-    if not args.target:
-        return None
-    devtool_deploy_opts = [args.target]
+    devtool_deploy_opts = [resolve_deploy_target(args, target_override)]
     if args.no_host_check:
         devtool_deploy_opts += ["-c"]
     if args.show_status:
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 6effbac654..7c700f258e 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -9,7 +9,7 @@ import json
 import logging
 import os
 import shutil
-from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, LldbServerConfig, get_devtool_deploy_opts
+from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, DebuggerServerModes, LldbServerConfig, get_devtool_deploy_opts, resolve_deploy_target
 
 logger = logging.getLogger('devtool')
 
@@ -594,10 +594,10 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), launch_file, launch_dict)
 
-    def vscode_tasks_cpp(self, args, modified_recipe):
-        run_install_deploy = modified_recipe.gen_install_deploy_script(args)
+    def vscode_tasks_cpp(self, args, image_recipe, modified_recipe):
+        run_install_deploy = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
-        deploy_args = ["--target", args.target]
+        deploy_args = ["--target", resolve_deploy_target(args, image_recipe.nfs_deploy_dir)]
         if args.port:
             deploy_args += ["--port", args.port]
         for package in args.package or []:
@@ -694,7 +694,7 @@ class IdeVSCode(IdeBase):
         args += [target_device.target, remote_cmd]
         return args
 
-    def vscode_tasks_kernel_module(self, args, modified_recipe):
+    def vscode_tasks_kernel_module(self, args, image_recipe, modified_recipe):
         """Generate tasks.json for kernel module recipes.
 
         Three tasks are generated and chained in sequence:
@@ -717,8 +717,9 @@ class IdeVSCode(IdeBase):
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
         reload_task_name = "reload module %s" % modified_recipe.recipe_id_pretty
         verify_task_name = "verify module %s" % modified_recipe.recipe_id_pretty
-        run_install_deploy = modified_recipe.gen_install_deploy_script(args)
-        deploy_args = ["--target", args.target]
+        run_install_deploy = modified_recipe.gen_install_deploy_script(args, image_recipe.nfs_deploy_dir)
+        # Redundant with the default baked into the script, but keeps the task self-contained.
+        deploy_args = ["--target", resolve_deploy_target(args, image_recipe.nfs_deploy_dir)]
         if args.port:
             deploy_args += ["--port", args.port]
         for package in args.package or []:
@@ -760,7 +761,7 @@ class IdeVSCode(IdeBase):
         IdeBase.update_json_file(
             self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
 
-    def vscode_tasks_fallback(self, args, modified_recipe):
+    def vscode_tasks_fallback(self, args, image_recipe, modified_recipe):
         oe_init_dir = modified_recipe.oe_init_dir
         oe_init = ". %s %s > /dev/null && " % (modified_recipe.oe_init_build_env, modified_recipe.topdir)
         dt_build = "devtool build "
@@ -773,7 +774,7 @@ class IdeVSCode(IdeBase):
         dt_deploy_label = dt_deploy + modified_recipe.recipe_id_pretty
         dt_deploy_cmd = dt_deploy + modified_recipe.bpn
         dt_build_deploy_label = "devtool build & deploy-target %s" % modified_recipe.recipe_id_pretty
-        deploy_opts = ' '.join(get_devtool_deploy_opts(args))
+        deploy_opts = ' '.join(get_devtool_deploy_opts(args, image_recipe.nfs_deploy_dir))
         tasks_dict = {
             "version": "2.0.0",
             "tasks": [
@@ -893,13 +894,13 @@ class IdeVSCode(IdeBase):
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
@@ -913,7 +914,7 @@ class IdeVSCode(IdeBase):
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
index 0b76aa448b..2e37f20894 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -18,6 +18,7 @@ import shlex
 import glob
 from argparse import RawTextHelpFormatter
 from enum import Enum
+from pathlib import Path
 
 import scriptutils
 import bb
@@ -212,15 +213,24 @@ class RecipeImage:
 
     def __init__(self, name, orig_bbappend_content=None):
         self.name = name
-        self.rootfs = None
+        self.pn = None
+        self.__rootfs = None
         self.__rootfs_dbg = None
+        self.__nfs_rootfs = None
+        self.__nfs_rootfs_dbg = None
+        self.nfs_deploy_dir = None
+        self.deploy_dir_image = None
+        self.image_link_name = None
         self.qb_slirp_opt = ''
+        self.fakerootcmd = None
+        self.fakerootenv = None
         self.bootstrap_tasks = [self.name + ':do_build']
         # Debug settings already provided by the base configuration (e.g.
         # local.conf, MACHINE, DISTRO, the recipe itself) plus any bbappend
         # content other than devtool ide-sdk's own sections (see
         # strip_bbappend_sections()). Populated by initialize().
         self.base_image_gen_debugfs = False
+        self.base_image_fstypes = set()
         self.base_image_fstypes_debugfs = ''
         self.base_has_combined_dbg = False
         self.base_image_install = set()
@@ -271,8 +281,11 @@ class RecipeImage:
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
@@ -281,22 +294,72 @@ class RecipeImage:
             (image_d.getVar('IMAGE_INSTALL') or '').split())
 
         workdir = image_d.getVar('WORKDIR')
-        self.rootfs = os.path.join(workdir, 'rootfs')
+        self.__rootfs = os.path.join(workdir, 'rootfs')
         self.__rootfs_dbg = os.path.join(workdir, 'rootfs-dbg')
 
+        self.deploy_dir_image = image_d.getVar('DEPLOY_DIR_IMAGE')
+        self.image_link_name = image_d.getVar('IMAGE_LINK_NAME')
         self.qb_slirp_opt = image_d.getVar('QB_SLIRP_OPT') or ''
+        self.fakerootcmd = image_d.getVar('FAKEROOTCMD')
+        self.fakerootenv = image_d.getVar('FAKEROOTENV')
 
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
+    def set_nfs_rootfs(self, nfs_export_base_dir, nfs):
+        """Select the NFS rootfs for generated debugger paths and deploys."""
+        if not nfs:
+            return
+        self.nfs_deploy_dir = self.nfs_rootfs_dir(nfs_export_base_dir, nfs)
+        if nfs == 'rootfs-dbg':
+            self.__nfs_rootfs_dbg = self.nfs_deploy_dir
+        elif nfs == 'rootfs':
+            self.__nfs_rootfs = self.nfs_deploy_dir
+
+    def nfs_rootfs_dir(self, nfs_export_base_dir, nfs):
+        """Return the directory for the selected NFS rootfs, below nfs_export_base_dir."""
+        return os.path.join(nfs_export_base_dir, self.pn, nfs)
+
+    def nfs_runqemu_helper(self, nfs_export_base_dir, nfs):
+        """Create a helper that boots the selected rootfs through runqemu."""
+        export_dir = os.path.join(nfs_export_base_dir, self.pn)
+        rootfs_dir = self.nfs_rootfs_dir(nfs_export_base_dir, nfs)
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
@@ -323,7 +386,17 @@ class RecipeImage:
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
@@ -368,6 +441,98 @@ class RecipeImage:
         slirp_changed = self.update_qb_slirp_opt()
         return image_changed or slirp_changed
 
+    @staticmethod
+    def _tar_options(rootfs_tarball):
+        tar_extract_options = {
+            '.tar.xz': '-xJf',
+            '.tar.bz2': '-xjf',
+            '.tar.gz': '-xzf',
+            '.tar.zst': '--zstd -xf',
+            '.tar': '-xf',
+        }
+        for extension, option in tar_extract_options.items():
+            if rootfs_tarball.endswith(extension):
+                return ['--numeric-owner', *option.split()]
+        raise DevtoolError(
+            'Unable to determine sdk tarball format\n'
+            'Accepted types: .tar / .tar.gz / .tar.bz2 / .tar.xz / .tar.zst')
+
+    @staticmethod
+    def pseudo_state_dir(rootfs_dir):
+        """Return the pseudo database location associated with an extracted rootfs."""
+        return os.path.realpath(rootfs_dir) + '.pseudo_state'
+
+    def extract_sdk_rootfs(self, rootfs_tarball, rootfs_dir):
+        """Extract a rootfs tarball under pseudo and return its absolute directory."""
+        if not os.path.exists(rootfs_tarball):
+            raise DevtoolError("sdk tarball '%s' does not exist" % rootfs_tarball)
+        if not os.path.exists(self.fakerootcmd):
+            raise DevtoolError('%s does not exist' % self.fakerootcmd)
+
+        rootfs_tarball = os.path.realpath(rootfs_tarball)
+        rootfs_dir = os.path.realpath(rootfs_dir)
+        tar_options = self._tar_options(rootfs_tarball)
+        state_dir = self.pseudo_state_dir(rootfs_dir)
+
+        os.makedirs(rootfs_dir, exist_ok=True)
+        os.makedirs(state_dir, exist_ok=True)
+        Path(state_dir, 'pseudo.pid').touch()
+
+        environment = dict(os.environ)
+        for varvalue in (self.fakerootenv or '').split():
+            if '=' in varvalue:
+                key, value = varvalue.split('=', 1)
+                environment[key] = value
+        command = [self.fakerootcmd, 'tar', '-C', rootfs_dir]
+
+        environment['PSEUDO_LOCALSTATEDIR'] = state_dir
+        environment['PSEUDO_INCLUDE_PATHS'] = rootfs_dir
+        command.extend(tar_options)
+        command.append(rootfs_tarball)
+        logger.info('Extracting rootfs tarball using pseudo: %s', ' '.join(command))
+        try:
+            subprocess.run(command, env=environment, check=True)
+        except subprocess.CalledProcessError as exc:
+            raise DevtoolError('Failed to extract %s' % rootfs_tarball) from exc
+
+        if len(os.listdir(rootfs_dir)) < 4:
+            logger.warning(
+                "Only few files in %s, please double-check the extraction "
+                "worked as intended", rootfs_dir)
+        return rootfs_dir
+
+    def extract_nfs_rootfs(self, nfs_export_base_dir, nfs, target):
+        """Refresh the selected rootfs below nfs_export_base_dir."""
+        if not self.image_link_name:
+            raise DevtoolError(
+                'IMAGE_LINK_NAME is empty for %s, --nfs cannot locate the '
+                'rootfs tarball without it.' % self.name)
+        suffix = '-dbg' if nfs == 'rootfs-dbg' else ''
+        rootfs_tarball = os.path.join(
+            self.deploy_dir_image, self.image_link_name + suffix + '.tar')
+        rootfs_dir = self.nfs_rootfs_dir(nfs_export_base_dir, nfs)
+        state_dir = self.pseudo_state_dir(rootfs_dir)
+
+        if os.path.exists(rootfs_dir):
+            logger.warning(
+                'Re-extracting %s: files deployed into it are lost and a '
+                'target currently booted from it will break.', rootfs_dir)
+        for stale_dir in (rootfs_dir, state_dir):
+            if os.path.exists(stale_dir):
+                shutil.rmtree(stale_dir)
+
+        self.extract_sdk_rootfs(rootfs_tarball, rootfs_dir)
+
+        logger.info('NFS rootfs extracted to %s', rootfs_dir)
+        helper = self.nfs_runqemu_helper(nfs_export_base_dir, nfs)
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
 
@@ -1363,12 +1528,17 @@ class RecipeModified:
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
@@ -1383,6 +1553,8 @@ class RecipeModified:
                        'no_preserve', 'port', 'show_status', 'ssh_exec', 'strip', 'target']
         filtered_args_dict = {key: value for key, value in vars(
             args).items() if key in args_filter}
+        if deploy_target:
+            filtered_args_dict['target'] = deploy_target
         if is_loopback_target(filtered_args_dict['target']):
             filtered_args_dict['no_host_check'] = True
         cmd_lines.append('filtered_args_dict = %s' % str(filtered_args_dict))
@@ -1442,11 +1614,11 @@ class RecipeModified:
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
 
@@ -1549,6 +1721,12 @@ def ide_setup(args, config, basepath, workspace):
                 logger.error("In shared sysroots mode modified recipes %s cannot be handled." % str(
                     recipes_modified_names))
                 invalid_params = True
+            if args.nfs:
+                logger.error("--nfs is only supported in modified mode.")
+                invalid_params = True
+        if args.nfs_extract_dir and not args.nfs:
+            logger.error("--nfs-extract-dir requires --nfs.")
+            invalid_params = True
         if args.mode == DevtoolIdeMode.modified:
             if not recipes_modified_names:
                 appends_dir = os.path.join(config.workspace_path, 'appends')
@@ -1584,6 +1762,8 @@ def ide_setup(args, config, basepath, workspace):
 
         # For the shared sysroots mode, add all dependencies of all the images to the sysroots
         # For the modified mode provide one rootfs and the corresponding debug symbols via rootfs-dbg
+        nfs_export_base_dir = args.nfs_extract_dir or os.path.join(
+            config.workspace_path, 'nfs-exports')
         recipes_images = []
         for recipes_image_name in recipes_image_names:
             logger.info("Using image: %s" % recipes_image_name)
@@ -1591,6 +1771,13 @@ def ide_setup(args, config, basepath, workspace):
                 recipes_image_name,
                 orig_bbappend_contents.get(recipes_image_name))
             recipe_image.initialize(config, tinfoil)
+            recipe_image.set_nfs_rootfs(nfs_export_base_dir, args.nfs)
+            # With --skip-bitbake nothing is extracted, so the generated IDE
+            # configuration would point at a directory that never appears.
+            if args.nfs and args.skip_bitbake and not os.path.isdir(recipe_image.nfs_deploy_dir):
+                raise DevtoolError(
+                    "%s does not exist. Run devtool ide-sdk --nfs=%s without "
+                    "--skip-bitbake first." % (recipe_image.nfs_deploy_dir, args.nfs))
             if args.mode == DevtoolIdeMode.modified:
                 # Keep the image build separate so that the complete bbappend
                 # (IMAGE_ vars + QB_SLIRP_OPT) can be written in one step
@@ -1696,7 +1883,7 @@ def ide_setup(args, config, basepath, workspace):
         # removed by strip_bbappend_sections() would be lost.
         bbappend_changed = False
         for ri in recipes_images:
-            if ri.update_image_bbappend(recipes_modified):
+            if ri.update_image_bbappend(recipes_modified, args.nfs):
                 bbappend_changed = True
 
         if not args.skip_bitbake:
@@ -1722,6 +1909,10 @@ def ide_setup(args, config, basepath, workspace):
                 exec_build_env_command(
                     config.init_path, basepath,
                     bb_cmd + ' '.join(image_bootstrap_tasks), watch=True)
+
+        if args.nfs and not args.skip_bitbake:
+            for ri in recipes_images:
+                ri.extract_nfs_rootfs(nfs_export_base_dir, args.nfs, args.target)
     else:
         raise DevtoolError("Must not end up here.")
 
@@ -1796,6 +1987,16 @@ def register_commands(subparsers, context):
         '-P', '--port', help='Specify ssh port to use for connection to the target')
     parser_ide_sdk.add_argument(
         '-I', '--key', help='Specify ssh private key for connection to the target')
+    parser_ide_sdk.add_argument(
+        '--nfs', choices=('rootfs', 'rootfs-dbg'),
+        help='Build and extract the selected image rootfs below '
+        '<workspace>/nfs-exports/<image-PN>/ '
+        'for NFS booting.')
+    parser_ide_sdk.add_argument(
+        '--nfs-extract-dir', metavar='DIR',
+        help='Extract the --nfs rootfs below DIR/<image-PN>/ instead of the default '
+        '<workspace>/nfs-exports/<image-PN>/, regardless of whether --nfs=rootfs '
+        'or --nfs=rootfs-dbg is selected. Requires --nfs.')
     parser_ide_sdk.add_argument(
         '--skip-bitbake', help='Skip the bitbake builds which update the SDK. The recipes are still parsed, '
         'the IDE configuration is generated from their metadata', action='store_true')
-- 
2.55.0


