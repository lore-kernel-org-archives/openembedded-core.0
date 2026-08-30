Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACF6C624C8
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:26 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17272.1788126560348529425
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=TFaXRv3x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-20260830214918c08e2d5981000207fa-agxiz8@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260830214918c08e2d5981000207fa
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sJL9z5lLHIaYHjR3mz6+bPb/FbjdXIuxt7Wy0AVgJkA=;
 b=TFaXRv3xNb4IYfIhL0R7zH0niCnokfIZ5gyfqQlp21QIjLgbDJr5WgJRBXQU4zxd+g71E3
 zD44OL+9TCtFDvC/mE6HFOWA6nBH+vgm0j1VY5S51eag8xoE9MPLg+r8hmZlX6nG14xZyljw
 L6Npb5fJ9cqEbNFyW6eTZ89DmybL/PiZ74Hgb3CiqZ7WY0IL0B7Gn2SraEtqS6Lx7VR7X3od
 YBv4yOUsVqu0AGG4ihK9UwYlXxrRkm4EPZ4xaGLUKEw47sppIXK+WZ6/KaKsfOenCx5YBzlG
 R2vDFBUO021JInZS2Y7OFXXcByqeR59/eoo1aYDZ6BCtGpc1OAL08wpw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 11/25] devtool: deploy-target: add --package/--file-glob filters
Date: Sun, 30 Aug 2026 23:48:33 +0200
Message-ID: <20260830214912.1346063-12-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244712

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Allow deploying only a subset of a recipe's installed files instead of
always sending the whole do_install output. This can be crucial when a
recipe's PACKAGES include additional content (e.g. -doc, -staticdev, or
optional extras) that does not even fit into the target device's
storage/memory; it also speeds up deployment significantly by avoiding
the transfer of files that are not actually needed for testing on the
target.

- --package PACKAGE filters the deployed files down to those listed in
  that package's FILES variable.
- --file-glob GLOB filters by an arbitrary glob pattern on the installed
  path. --package and --file-glob combine as a union when both are given.

Examples:
  devtool deploy-target mdadm root@target
      deploy everything (minus -dbg/-src/-staticdev, see above)
  devtool deploy-target mdadm root@target --package mdadm-doc
      deploy only the mdadm-doc package's files
  devtool deploy-target mdadm root@target --package mdadm,mdadm-doc
      deploy the main and -doc packages together
  devtool deploy-target mdadm root@target --file-glob '/usr/bin/*'
      deploy only files under /usr/bin
  devtool ide-sdk mdadm cmake-example core-image-minimal \
      --package "mdadm:,-doc" --package "cmake-example:,-doc"
      scope each --package entry to its own recipe when several
      modified recipes are targeted at once

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 161 ++++++++++++++++++++++++++++++++--
 1 file changed, 155 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 35ec0b1b4d..267d124415 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -17,6 +17,7 @@ import tempfile
 import bb.utils
 import argparse_oe
 import oe.types
+import oe.package
 
 from devtool import exec_fakeroot_no_d, setup_tinfoil, check_workspace_recipe, DevtoolError
 
@@ -137,6 +138,92 @@ def _prepare_remote_script(deploy, destdir='/', verbose=False, dryrun=False, und
 
     return '\n'.join(lines)
 
+def parse_file_globs_arg(entries, recipename=None):
+    """Flatten --file-glob entries ("[RECIPE:]GLOB") into glob patterns for recipename.
+
+    E.g. ["other:/usr/bin/*", "/etc/*"] with recipename="myrecipe" -> ["/etc/*"].
+    """
+    globs = []
+    for entry in entries or []:
+        recipe, spec = entry.split(':', 1) if ':' in entry else (None, entry)
+        if recipe is not None and recipename is not None and recipe != recipename:
+            continue
+        if spec:
+            globs.append(spec)
+    return globs
+
+def _match_deploy_files(recipe_outdir, file_globs, recipename=None):
+    """Match file_globs (FILES-variable-style patterns) against recipe_outdir.
+
+    Returns the matched files (relative to recipe_outdir), or None if no glob
+    applies to recipename.
+    """
+    file_globs = parse_file_globs_arg(file_globs, recipename)
+    if not file_globs:
+        return None
+    cwd = os.getcwd()
+    os.chdir(recipe_outdir)
+    try:
+        matched, _ = oe.package.files_from_filevars(file_globs)
+    finally:
+        os.chdir(cwd)
+    return {os.path.normpath(f) for f in matched}
+
+def parse_packages_arg(entries, recipename=None):
+    """Flatten --package entries ("[RECIPE:]PKG[,PKG...]") into package names.
+
+    E.g. with recipename="myrecipe": "myrecipe:,-doc,-ptest" ->
+    ["myrecipe", "myrecipe-doc", "myrecipe-ptest"]; "other:foo" -> [].
+    """
+    packages = []
+    for entry in entries or []:
+        recipe, spec = entry.split(':', 1) if ':' in entry else (None, entry)
+        if recipe is not None and recipename is not None and recipe != recipename:
+            continue
+        for item in spec.split(','):
+            if not item:
+                if recipe is not None:
+                    packages.append(recipe)
+            elif item.startswith('-'):
+                if recipe is None:
+                    raise DevtoolError('Package suffix "%s" requires a "RECIPE:" prefix, '
+                                    'e.g. "RECIPE:%s"' % (item, item))
+                packages.append(recipe + item)
+            else:
+                packages.append(item)
+    return packages
+
+def is_default_excluded_package(pkg):
+    """True for packages left out of a deploy"""
+    return pkg.endswith(('-dbg', '-src', '-staticdev'))
+
+def _match_package_files(recipe_outdir, packages_files, packages, recipename=None):
+    """Resolve packages (see parse_packages_arg) into their files under recipe_outdir."""
+    packages = parse_packages_arg(packages, recipename)
+    all_package_names = [pkg for pkg, _ in packages_files]
+    for pkg in packages:
+        if pkg not in all_package_names:
+            raise DevtoolError('Package "%s" is not one of the packages produced '
+                            'by this recipe (PACKAGES: %s)' % (pkg, ' '.join(all_package_names)))
+    cwd = os.getcwd()
+    os.chdir(recipe_outdir)
+    try:
+        seen = set()
+        result = set() if packages else None
+        default_excluded = set()
+        for pkg, files_var in packages_files:
+            matched, _ = oe.package.files_from_filevars((files_var or '').split())
+            matched = {os.path.normpath(f) for f in matched} - seen
+            seen |= matched
+            if pkg in packages:
+                if result is not None:
+                    result |= matched
+            elif is_default_excluded_package(pkg):
+                default_excluded |= matched
+    finally:
+        os.chdir(cwd)
+    return result, default_excluded
+
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
     import oe.utils
@@ -160,14 +247,15 @@ def deploy(args, config, basepath, workspace):
         max_process = oe.utils.get_bb_number_threads(rd)
         fakerootcmd = rd.getVar('FAKEROOTCMD')
         fakerootenv = rd.getVar('FAKEROOTENV')
+        packages_files = [(pkg, rd.getVar('FILES:' + pkg) or '')
+                        for pkg in (rd.getVar('PACKAGES') or '').split()]
     finally:
         tinfoil.shutdown()
 
-    return deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args)
+    return deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=args.file_globs, packages_files=packages_files)
 
-def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args):
+def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=None, packages_files=None):
     import math
-    import oe.package
 
     try:
         host, destdir = args.target.split(':')
@@ -208,11 +296,35 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         if ret != 0:
             raise DevtoolError('Failed to strip files for deployment')
 
+    allowed_files = None
+    default_excluded_files = set()
+    file_sets = []
+    if file_globs:
+        deploy_files = _match_deploy_files(recipe_outdir, file_globs, getattr(args, 'recipename', None))
+        if deploy_files is not None:
+            file_sets.append(deploy_files)
+    if packages_files:
+        package_files, default_excluded_files = _match_package_files(recipe_outdir, packages_files, getattr(args, 'package', None),
+                                            getattr(args, 'recipename', None))
+        if package_files is not None:
+            file_sets.append(package_files)
+    if file_sets:
+        allowed_files = set().union(*file_sets)
+
     filelist = []
+    tar_relpaths = []
     inodes = set({})
     ftotalsize = 0
     for root, _, files in os.walk(recipe_outdir):
         for fn in files:
+            relpath = os.path.normpath(os.path.join(os.path.relpath(root, recipe_outdir), fn))
+            if allowed_files is not None:
+                if relpath not in allowed_files:
+                    continue
+            elif relpath in default_excluded_files:
+                # No explicit --package/--file-glob filter was given: still leave
+                # out packages like -staticdev that aren't needed on a live target.
+                continue
             fstat = os.lstat(os.path.join(root, fn))
             # Get the size in kiB (since we'll be comparing it to the output of du -k)
             # MUST use lstat() here not stat() or getfilesize() since we don't want to
@@ -226,6 +338,12 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
             # The path as it would appear on the target
             fpath = os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn)
             filelist.append((fpath, fsize))
+            tar_relpaths.append(relpath)
+
+    if allowed_files is not None and not filelist:
+        raise DevtoolError('No files to deploy for %s - the --package/--file-glob '
+                        'filter(s) did not match any of the files installed by this '
+                        'recipe.' % args.recipename)
 
     if args.dry_run:
         print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
@@ -282,8 +400,28 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
     finally:
         shutil.rmtree(tmpdir)
 
-    # Now run the script
-    ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+    # Now run the script. When a package/glob filter narrowed down filelist,
+    # tar is given an explicit list of relative paths (-T) instead of packing
+    # the whole recipe_outdir tree.
+    tar_filelist_path = None
+    try:
+        if allowed_files is not None:
+            tar_fd, tar_filelist_path = tempfile.mkstemp(prefix='devtool-deploy-filelist-')
+            with os.fdopen(tar_fd, 'w') as f:
+                for relpath in tar_relpaths:
+                    # './' prefix matches what 'tar cf - .' itself would produce, which
+                    # the remote script's manifest handling (sed "s!^./!$2!") relies on.
+                    f.write('./' + relpath + '\n')
+            tar_cmd = 'tar cf - -T %s' % shlex.quote(tar_filelist_path)
+        else:
+            tar_cmd = 'tar cf - .'
+        remote_cmd = '%s | %s  %s %s %s \'sh %s %s %s %s\'' % (
+            tar_cmd, ssh_sshexec, ssh_port, extraoptions, args.target,
+            tmpscript, args.recipename, destdir, tmpfilelist)
+        ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, remote_cmd, cwd=recipe_outdir, shell=True)
+    finally:
+        if tar_filelist_path:
+            os.remove(tar_filelist_path)
     if ret != 0:
         raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                         'error message')
@@ -362,7 +500,7 @@ def register_commands(subparsers, context):
 
     parser_deploy = subparsers.add_parser('deploy-target',
                                           help='Deploy recipe output files to live target machine',
-                                          description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand.',
+                                          description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand. Use --package/--file-glob to deploy only a subset of the recipe\'s installed files.',
                                           group='testbuild')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
@@ -375,6 +513,17 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
     parser_deploy.add_argument('-I', '--key',
                                help='Specify ssh private key for connection to the target')
+    parser_deploy.add_argument('--package', action='append', metavar='PACKAGE',
+                               help='Only deploy files belonging to PACKAGE, as defined by that '
+                                    'package\'s FILES variable in the recipe metadata. May be a '
+                                    'comma-separated list and/or specified multiple times to '
+                                    'include several packages. May be prefixed with "RECIPE:" (must '
+                                    'match RECIPENAME), e.g. "RECIPE:,-doc,-ptest" is short for '
+                                    '"RECIPE,RECIPE-doc,RECIPE-ptest".')
+    parser_deploy.add_argument('--file-glob', action='append', dest='file_globs', metavar='GLOB',
+                               help='Only deploy files whose installed path matches this glob '
+                                    'pattern (e.g. "/usr/bin/*" or "${bindir}/myprog"). May be '
+                                    'specified multiple times. Combined with --package if both are given.')
 
     strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
     strip_opts.add_argument('-S', '--strip',
-- 
2.55.0


