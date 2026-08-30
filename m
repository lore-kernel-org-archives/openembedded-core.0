Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72C9C624CF
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:55 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9433.1788100183423761221
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=HC5OxRa/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-202608301429414d03c4984c000207e0-rdlwmw@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608301429414d03c4984c000207e0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=p58kJqBHmnLDmZfr9d22ea23vPSxJFh6o15q2rGZ2oU=;
 b=HC5OxRa/fBQtL5lipHF42lL4P86bxRvAxhXhfREu9Kz3kK7p7EWO38l+E1C+0GQIveLuB3
 9Rm6IT2TnzwAqRy0BWdBl0q6kiJy8+mHORcF590Psz7dWpe7qVudQbvuXQg1hreZh5JS8OV1
 KtAbc4B6bQ+Buhr2rcvvBu8gI1p1hSpTrVjIJH8mSMEcVn5Nnwkco0XoVK8il/BPgdt38oW0
 KKiGEffbBWmtk2s1RWgYZkie36OBWxuFc1pJKQPTYFWUi5bHMBKrnSGAFyk6ia5f0+OHzQ/S
 CRcTu+8MTVVp3TTo0LzoCxxMxydsB4HJaGyBxIjvAgJZ2LF1C4GU8UMg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 13/24] devtool: ide-sdk: forward --package/--file-glob deploy filters
Date: Sun, 30 Aug 2026 16:28:40 +0200
Message-ID: <20260830142922.17241-14-adrian.freihofer@siemens.com>
In-Reply-To: <20260830142922.17241-1-adrian.freihofer@siemens.com>
References: <20260830142922.17241-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244662

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Wire deploy-target's --package and --file-glob filtering into
devtool ide-sdk so IDE-driven deploys can limit what is copied to the
target. This keeps ide-sdk's generated fast deploy script behavior
aligned with devtool deploy-target.

RecipeModified now snapshots PACKAGES and FILES:* during initialize(),
and the generated deploy script passes those mappings to deploy_no_d().
Requested packages are validated early so unknown package names fail
with a clear error. The generated script also accepts runtime
-g/--file-glob overrides, so users can refine filters from tasks.json
without regenerating the SDK.

Examples:
- devtool ide-sdk my-recipe --package my-recipe-doc
- devtool ide-sdk my-recipe --file-glob '/usr/bin/*'
- devtool ide-sdk my-recipe --package my-recipe:,-doc,-ptest \
    --file-glob 'my-recipe:/usr/lib/*.so*'

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  4 ++
 scripts/lib/devtool/ide_plugins/ide_code.py | 14 ++++++-
 scripts/lib/devtool/ide_sdk.py              | 41 ++++++++++++++++++++-
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index a5069cae85..0d0117344d 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -427,4 +427,8 @@ def get_devtool_deploy_opts(args):
         devtool_deploy_opts += ["-I", args.key]
     if args.strip is False:
         devtool_deploy_opts += ["--no-strip"]
+    for package in (args.package or []):
+        devtool_deploy_opts += ["--package", package]
+    for file_glob in (args.file_globs or []):
+        devtool_deploy_opts += ["--file-glob", file_glob]
     return devtool_deploy_opts
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 5abf0492e8..937c63a4a5 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -596,6 +596,11 @@ class IdeVSCode(IdeBase):
     def vscode_tasks_cpp(self, args, modified_recipe):
         run_install_deploy = modified_recipe.gen_install_deploy_script(args)
         install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
+        deploy_args = ["--target", args.target]
+        if args.port:
+            deploy_args += ["--port", args.port]
+        for package in args.package or []:
+            deploy_args += ["--package", package]
         tasks_dict = {
             "version": "2.0.0",
             "tasks": [
@@ -603,7 +608,7 @@ class IdeVSCode(IdeBase):
                     "label": install_task_name,
                     "type": "shell",
                     "command": run_install_deploy,
-                    "args": ["--target", args.target] + (["--port", args.port] if args.port else []),
+                    "args": deploy_args,
                     "problemMatcher": []
                 }
             ]
@@ -712,6 +717,11 @@ class IdeVSCode(IdeBase):
         reload_task_name = "reload module %s" % modified_recipe.recipe_id_pretty
         verify_task_name = "verify module %s" % modified_recipe.recipe_id_pretty
         run_install_deploy = modified_recipe.gen_install_deploy_script(args)
+        deploy_args = ["--target", args.target]
+        if args.port:
+            deploy_args += ["--port", args.port]
+        for package in args.package or []:
+            deploy_args += ["--package", package]
         tasks_dict = {
             "version": "2.0.0",
             "tasks": [
@@ -719,7 +729,7 @@ class IdeVSCode(IdeBase):
                     "label": install_task_name,
                     "type": "shell",
                     "command": run_install_deploy,
-                    "args": ["--target", args.target] + (["--port", args.port] if args.port else []),
+                    "args": deploy_args,
                     "problemMatcher": []
                 },
                 {
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index e45752aff1..ac4930af50 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -23,6 +23,7 @@ import scriptutils
 import bb
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError, parse_recipe
 from devtool.standard import get_real_srctree
+from devtool.deploy import parse_packages_arg
 from devtool.ide_plugins import BuildTool, DebuggerCrossConfig
 from oe.kernel_module import kernel_module_os_env
 
@@ -671,6 +672,8 @@ class RecipeModified:
         self.toolchain = None
         self.topdir = None
         self.workdir = None
+        # Maps each package name (from PACKAGES) to the glob patterns from its FILES variable
+        self.packages_files = {}
         # Service management
         self.systemd_services = {}
         self.init_scripts = {}
@@ -745,6 +748,8 @@ class RecipeModified:
         self.package_arch = recipe_d.getVar('PACKAGE_ARCH')
         self.package_debug_split_style = recipe_d.getVar(
             'PACKAGE_DEBUG_SPLIT_STYLE')
+        for package in (recipe_d.getVar('PACKAGES') or '').split():
+            self.packages_files[package] = recipe_d.getVar('FILES:' + package) or ''
         self.path = recipe_d.getVar('PATH')
         self.pn = recipe_d.getVar('PN')
         self.recipe_sysroot = os.path.realpath(
@@ -1326,6 +1331,17 @@ class RecipeModified:
         self._installed_binaries = dict(sorted(binaries.items()))
         return self._installed_binaries
 
+    def _validate_requested_packages(self, args):
+        """Raise if --package (once scoped to this recipe and expanded via
+        parse_packages_arg) references a package this recipe doesn't produce.
+        """
+        packages = parse_packages_arg(getattr(args, 'package', None), self.bpn)
+        for package in packages:
+            if package not in self.packages_files:
+                raise DevtoolError('Package "%s" is not one of the packages produced '
+                                'by the %s recipe (PACKAGES: %s)' %
+                                (package, self.pn, ' '.join(self.packages_files.keys())))
+
     def gen_deploy_target_script(self, args):
         """Generate a script which does what devtool deploy-target does
 
@@ -1333,6 +1349,7 @@ class RecipeModified:
         does not need to start a bitbake server. All information from tinfoil
         is hard-coded in the generated script.
         """
+        self._validate_requested_packages(args)
         cmd_lines = ['#!%s' % str(sys.executable)]
         cmd_lines.append('import sys')
         cmd_lines.append('devtool_sys_path = %s' % str(sys.path))
@@ -1353,6 +1370,8 @@ class RecipeModified:
         cmd_lines.append('        for key in my_dict:')
         cmd_lines.append('            setattr(self, key, my_dict[key])')
         cmd_lines.append('filtered_args = Dict2Class(filtered_args_dict)')
+        cmd_lines.append('packages_files = %s' % repr(list(self.packages_files.items())))
+        cmd_lines.append('file_globs = %s' % repr(list(getattr(args, 'file_globs', None) or []) or None))
         cmd_lines.append('i = 1')
         cmd_lines.append('while i < len(sys.argv) - 1:')
         cmd_lines.append('    if sys.argv[i] in ("-t", "--target"):')
@@ -1361,6 +1380,13 @@ class RecipeModified:
         cmd_lines.append('    elif sys.argv[i] in ("-P", "--port"):')
         cmd_lines.append('        setattr(filtered_args, "port", sys.argv[i + 1])')
         cmd_lines.append('        i += 2')
+        cmd_lines.append('    elif sys.argv[i] in ("-g", "--file-glob"):')
+        cmd_lines.append('        file_globs = (file_globs or []) + [sys.argv[i + 1]]')
+        cmd_lines.append('        i += 2')
+        cmd_lines.append('    elif sys.argv[i] in ("-p", "--package"):')
+        cmd_lines.append('        packages = getattr(filtered_args, "package", None) or []')
+        cmd_lines.append('        setattr(filtered_args, "package", packages + [sys.argv[i + 1]])')
+        cmd_lines.append('        i += 2')
         cmd_lines.append('    else:')
         cmd_lines.append('        i += 1')
         cmd_lines.append(
@@ -1368,7 +1394,7 @@ class RecipeModified:
         cmd_lines.append('    filtered_args.no_host_check = True')
         cmd_lines.append(
             'setattr(filtered_args, "recipename", "%s")' % self.bpn)
-        cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args)' %
+        cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args, file_globs=file_globs, packages_files=packages_files)' %
                          (self.d, self.workdir, self.path, self.strip_cmd,
                           self.libdir, self.base_libdir, self.max_process,
                           self.fakerootcmd, self.fakerootenv))
@@ -1758,4 +1784,17 @@ def register_commands(subparsers, context):
         '-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_ide_sdk.add_argument(
         '--no-check-space', help='Do not check for available space before deploying', action='store_true')
+    parser_ide_sdk.add_argument(
+        '--package', action='append', metavar='PACKAGE',
+        help='Only deploy files belonging to PACKAGE, as defined by that package\'s '
+        'FILES variable in the recipe metadata. May be a comma-separated list '
+        'and/or specified multiple times. May be prefixed with "RECIPE:" to target '
+        'one of several recipes at once, e.g. "RECIPE:,-doc,-ptest" is short for '
+        '"RECIPE,RECIPE-doc,RECIPE-ptest".')
+    parser_ide_sdk.add_argument(
+        '--file-glob', action='append', dest='file_globs', metavar='GLOB',
+        help='Only deploy files whose installed path matches this glob pattern '
+        '(e.g. "/usr/bin/*"). May be specified multiple times. Combined with '
+        '--package if both are given. May be prefixed with "RECIPE:" to scope '
+        'the entry to one of the recipes being processed e.g. "RECIPE:/usr/bin/*".')
     parser_ide_sdk.set_defaults(func=ide_setup)
-- 
2.55.0


