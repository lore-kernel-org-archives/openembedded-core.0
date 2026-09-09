Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7B1C88E51
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:53 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78.1788990824405656244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=SrgsV1Sd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202609092153416949377d8000020721-ciia4o@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202609092153416949377d8000020721
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=jCVXzLMjKJd8BHi/VGM577Uy2/hebzjy4CNHyxBgO6s=;
 b=SrgsV1Sd+AkbCZEAD2bFRpIK3Ehj/xDti/lu130b5TPzl2fReuP3d/kx4WzX7wK2aXAYo5
 f/LQzENl0kwhiv/cQReYOvp6YLzSK3m5MRgN5k4IhtYsA5OKHaonMEEwX4briddxjrVRt+bO
 GgXttXLf+a13s8S/CK2/rHCqXLGvmJDzK6f7E4i9P6upzVNVKC+WbjRnCWNwQ01indBYa1nt
 dm68d8GaL7PZU3stMlL2/bIdm7Ru1zoobjyo/DL4dGJWg/wSeSVV8rxcurBgYWg4oXxcInNK
 nSSAnxL7LvTX8D7x9KsAGhhdBZf1DoskV9CIw+iSzT259v+zr5xcDLzQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 02/15] devtool: deploy: allow deploying directly into a local rootfs directory
Date: Wed,  9 Sep 2026 23:53:02 +0200
Message-ID: <20260909215337.89106-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260909215337.89106-1-adrian.freihofer@siemens.com>
References: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245503

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add support for deploy-target/undeploy-target to write into a local
pseudo-managed rootfs directory (e.g. one extracted by
runqemu-extract-sdk for NFS booting) instead of requiring an ssh
connection to a live target.

If the 'target' argument is an absolute path, _deploy_local and
_undeploy_local run the same tar/manifest based copy/removal as the ssh
path, but locally: the file transfer is piped between two pseudo
instances (one scoped to the recipe's own PSEUDO_INCLUDE_PATHS, one
scoped to the target rootfs's own PSEUDO_LOCALSTATEDIR/PSEUDO_INCLUDE_PATHS)
instead of over ssh/scp.

exec_fakeroot_no_d()'s environment-building code is factored out into
build_fakeroot_env_no_d() so _deploy_local can assemble its own pseudo
environment without exec_fakeroot_no_d's implicit single-command
prefixing, which doesn't compose with the dual-pseudo pipeline.

This is a prerequisite for adding NFS export support to devtool
ide-sdk.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/__init__.py |  22 ++--
 scripts/lib/devtool/deploy.py   | 210 ++++++++++++++++++++++++++++----
 2 files changed, 201 insertions(+), 31 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 32a7bc0098..9d227e2032 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -77,6 +77,18 @@ def exec_watch(cmd, **options):
 
     return buf, None
 
+def build_fakeroot_env_no_d(fakerootenv, path, env_overrides=None):
+    """Build the environment for running a command under pseudo (see exec_fakeroot_no_d)."""
+    newenv = dict(os.environ)
+    newenv['PATH'] = path
+    for varvalue in fakerootenv.split():
+        if '=' in varvalue:
+            splitval = varvalue.split('=', 1)
+            newenv[splitval[0]] = splitval[1]
+    if env_overrides:
+        newenv.update(env_overrides)
+    return newenv
+
 def exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, cmd, env_overrides=None, **kwargs):
     """Run cmd under pseudo using a recipe's own FAKEROOTCMD/FAKEROOTENV.
 
@@ -88,15 +100,7 @@ def exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, cmd, env_overrides=None,
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
-    # Set up the appropriate environment
-    newenv = dict(os.environ)
-    newenv['PATH'] = path
-    for varvalue in fakerootenv.split():
-        if '=' in varvalue:
-            splitval = varvalue.split('=', 1)
-            newenv[splitval[0]] = splitval[1]
-    if env_overrides:
-        newenv.update(env_overrides)
+    newenv = build_fakeroot_env_no_d(fakerootenv, path, env_overrides)
     return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv, **kwargs)
 
 def setup_tinfoil(config_only=False, basepath=None, tracking=False):
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index ffca1269ef..e3890a0113 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -19,7 +19,7 @@ import argparse_oe
 import oe.types
 import oe.package
 
-from devtool import exec_fakeroot_no_d, setup_tinfoil, check_workspace_recipe, DevtoolError
+from devtool import exec_fakeroot_no_d, build_fakeroot_env_no_d, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -257,14 +257,18 @@ def deploy(args, config, basepath, workspace):
 def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=None, packages_files=None):
     import math
 
-    try:
-        host, destdir = args.target.split(':')
-    except ValueError:
-        destdir = '/'
+    if os.path.isabs(args.target):
+        # A local pseudo-managed rootfs directory (e.g. NFS-exported)
+        destdir = os.path.realpath(args.target)
     else:
-        args.target = host
-    if not destdir.endswith('/'):
-        destdir += '/'
+        try:
+            host, destdir = args.target.split(':')
+        except ValueError:
+            destdir = '/'
+        else:
+            args.target = host
+    # Canonical form used throughout: no trailing slash (except root itself).
+    destdir = destdir.rstrip('/') or '/'
 
     recipe_outdir = srcdir
     if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
@@ -353,9 +357,107 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
             print('  %s' % item)
         return 0
 
+    if os.path.isabs(args.target):
+        # A local directory (e.g. an NFS-exported rootfs) rather than a
+        # user@host ssh target: copy the files in directly, no network needed.
+        return _deploy_local(args, destdir, filelist, ftotalsize, tar_relpaths,
+                            allowed_files, fakerootcmd, fakerootenv, path, recipe_outdir)
+
     return _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files,
                        fakerootcmd, fakerootenv, path, recipe_outdir)
 
+def _deploy_local(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files,
+                fakerootcmd, fakerootenv, path, recipe_outdir):
+    """Copy files directly into destdir instead of over ssh/scp.
+
+    destdir is the local pseudo-managed rootfs directory itself (no trailing
+    slash), not the real filesystem root.
+    """
+    if not os.path.isdir(destdir):
+        raise DevtoolError('Target directory %s does not exist' % destdir)
+    state_dir = destdir + '.pseudo_state'
+    if not os.path.isdir(state_dir):
+        raise DevtoolError(
+            '%s does not exist - %s does not look like a pseudo-managed rootfs '
+            '(e.g. one extracted by runqemu-extract-sdk).' % (state_dir, destdir))
+
+    if not args.no_check_space:
+        freespace = shutil.disk_usage(destdir).free // 1024
+        if ftotalsize > freespace:
+            raise DevtoolError('Deploy failed - insufficient space on target '
+                            '(available %d, needed %d)' % (freespace, ftotalsize))
+
+    shellscript = _prepare_remote_script(deploy=True,
+                                        destdir=destdir,
+                                        verbose=args.show_status,
+                                        nopreserve=args.no_preserve,
+                                        nocheckspace=True)
+
+    tmpdir = tempfile.mkdtemp(prefix='devtool')
+    tar_send_filelist_path = None
+    try:
+        script_path = os.path.join(tmpdir, 'devtool_deploy.sh')
+        with open(script_path, 'w') as f:
+            f.write(shellscript)
+        filelist_path = os.path.join(tmpdir, 'devtool_deploy.list')
+        with open(filelist_path, 'w') as f:
+            f.write('%d\n' % ftotalsize)
+            for fpath, fsize in filelist:
+                f.write('%s %d\n' % (fpath, fsize))
+
+        # tar_send_* builds up the sending side of the pipe: the plain tar
+        # invocation, then wrapped to capture its own exit status (only the
+        # last stage of a shell pipeline is visible to subprocess), then
+        # wrapped again to run under its own pseudo instance.
+        if allowed_files is not None:
+            tar_send_fd, tar_send_filelist_path = tempfile.mkstemp(prefix='devtool-deploy-filelist-')
+            with os.fdopen(tar_send_fd, 'w') as f:
+                for relpath in tar_relpaths:
+                    f.write('./' + relpath + '\n')
+            tar_send_argv = 'tar cf - -T %s' % shlex.quote(tar_send_filelist_path)
+        else:
+            tar_send_argv = 'tar cf - .'
+
+        tar_send_status_path = os.path.join(tmpdir, 'devtool_deploy.tar_status')
+        tar_send_script = 'sh -c %s' % shlex.quote(
+            '%s; echo $? > %s' % (tar_send_argv, shlex.quote(tar_send_status_path)))
+        tar_send_cmd = 'PSEUDO_INCLUDE_PATHS=%s %s %s' % (
+            shlex.quote(recipe_outdir), shlex.quote(fakerootcmd), tar_send_script)
+
+        # tar_receive_cmd is the other side of the pipe: extracts into destdir
+        # under the target rootfs's own pseudo database (state_dir/destdir,
+        # not the recipe's).
+        # $2 needs a trailing slash: the script's manifest substitution
+        # (sed 's!^./!$2!') turns tar's './relative' entries into absolute paths.
+        tar_receive_cmd = 'PSEUDO_LOCALSTATEDIR=%s PSEUDO_INCLUDE_PATHS=%s %s sh %s %s %s %s' % (
+            shlex.quote(state_dir), shlex.quote(destdir), shlex.quote(fakerootcmd),
+            shlex.quote(script_path), shlex.quote(args.recipename),
+            shlex.quote(destdir.rstrip('/') + '/'), shlex.quote(filelist_path))
+
+        if not os.path.exists(fakerootcmd):
+            logger.error('pseudo executable %s could not be found - have you run a build '
+                        'yet? pseudo-native should install this and if you have run any '
+                        'build then that should have been built' % fakerootcmd)
+            ret = 2
+        else:
+            shell_env = build_fakeroot_env_no_d(fakerootenv, path)
+            ret = subprocess.call('%s | %s' % (tar_send_cmd, tar_receive_cmd), env=shell_env,
+                                cwd=recipe_outdir, shell=True)
+            if ret == 0 and os.path.exists(tar_send_status_path):
+                with open(tar_send_status_path) as f:
+                    ret = int(f.read().strip() or 0)
+    finally:
+        if tar_send_filelist_path:
+            os.remove(tar_send_filelist_path)
+        shutil.rmtree(tmpdir)
+
+    if ret != 0:
+        raise DevtoolError('Deploy failed - rerun with -s to get a complete '
+                        'error message')
+
+    logger.info('Successfully deployed %s to %s' % (recipe_outdir, destdir))
+    return 0
+
 def _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files,
                 fakerootcmd, fakerootenv, path, recipe_outdir):
     """Copy files to target_dir over ssh/scp (user@hostname[:destdir])."""
@@ -423,9 +525,11 @@ def _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files
             tar_cmd = 'tar cf - -T %s' % shlex.quote(tar_filelist_path)
         else:
             tar_cmd = 'tar cf - .'
+        # $2 needs a trailing slash: the script's manifest substitution
+        # (sed 's!^./!$2!') turns tar's './relative' entries into absolute paths.
         remote_cmd = '%s | %s  %s %s %s \'sh %s %s %s %s\'' % (
             tar_cmd, ssh_sshexec, ssh_port, extraoptions, args.target,
-            tmpscript, args.recipename, destdir, tmpfilelist)
+            tmpscript, args.recipename, destdir.rstrip('/') + '/', tmpfilelist)
         ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, remote_cmd, cwd=recipe_outdir,
                                 env_overrides={'PSEUDO_INCLUDE_PATHS': recipe_outdir}, shell=True)
     finally:
@@ -446,8 +550,64 @@ def undeploy(args, config, basepath, workspace):
     elif not args.recipename and not args.all:
         raise argparse_oe.ArgumentUsageError('If you don\'t specify a recipe, you must specify -a/--all', 'undeploy-target')
 
+    if os.path.isabs(args.target):
+        # A local directory (e.g. an NFS-exported rootfs) rather than a
+        # user@host ssh target: remove the files in directly, no network needed.
+        tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+        try:
+            fakerootcmd = tinfoil.config_data.getVar('FAKEROOTCMD')
+            fakerootenv = tinfoil.config_data.getVar('FAKEROOTENV')
+            path = tinfoil.config_data.getVar('PATH')
+        finally:
+            tinfoil.shutdown()
+        return _undeploy_local(args, os.path.realpath(args.target), fakerootcmd, fakerootenv, path)
+
     return _undeploy_ssh(args)
 
+def _undeploy_local(args, target_dir, fakerootcmd, fakerootenv, path):
+    """Remove files directly from target_dir instead of over ssh."""
+    if not os.path.isdir(target_dir):
+        raise DevtoolError('Target directory %s does not exist' % target_dir)
+    state_dir = target_dir + '.pseudo_state'
+    if not os.path.isdir(state_dir):
+        raise DevtoolError(
+            '%s does not exist - %s does not look like a pseudo-managed rootfs '
+            '(e.g. one extracted by runqemu-extract-sdk).' % (state_dir, target_dir))
+
+    # deploy=False here: the generated script never touches $2, so target_dir
+    # doesn't need the trailing slash _with_trailing_slash() adds for deploy.
+    shellscript = _prepare_remote_script(deploy=False, destdir=target_dir, dryrun=args.dry_run, undeployall=args.all)
+
+    tmpdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        script_path = os.path.join(tmpdir, 'devtool_undeploy.sh')
+        with open(script_path, 'w') as f:
+            f.write(shellscript)
+
+        environment = dict(os.environ)
+        environment['PATH'] = path
+        for varvalue in (fakerootenv or '').split():
+            if '=' in varvalue:
+                key, value = varvalue.split('=', 1)
+                environment[key] = value
+        # Use target_dir's own pseudo database, not the ambient one from FAKEROOTENV,
+        # so file removals stay consistent with what was recorded on deploy/extract.
+        environment['PSEUDO_LOCALSTATEDIR'] = state_dir
+        environment['PSEUDO_INCLUDE_PATHS'] = target_dir
+        command = [fakerootcmd, 'sh', script_path, args.recipename or '']
+        ret = subprocess.call(command, env=environment)
+    finally:
+        shutil.rmtree(tmpdir)
+
+    if ret != 0:
+        # Unlike the ssh case there is nothing -s could add here, the script
+        # runs locally and its output is already on the console.
+        raise DevtoolError('Undeploy failed - see the output above for details')
+
+    if not args.all and not args.dry_run:
+        logger.info('Successfully undeployed %s' % args.recipename)
+    return 0
+
 def _undeploy_ssh(args):
     """Run the undeploy script on the target over ssh/scp (user@hostname[:destdir])."""
     extraoptions = ''
@@ -473,8 +633,6 @@ def _undeploy_ssh(args):
         destdir = '/'
     else:
         args.target = host
-    if not destdir.endswith('/'):
-        destdir += '/'
 
     tmpdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -508,17 +666,20 @@ def register_commands(subparsers, context):
     parser_deploy = subparsers.add_parser('deploy-target',
                                           help='Deploy recipe output files to live target machine',
                                           description='Deploys a recipe\'s build output (i.e. the output of '
-                                                       'the do_install task) to a live target machine over ssh. '
-                                                       'By default, any existing files will be preserved instead '
-                                                       'of being overwritten and will be restored if you run '
-                                                       'devtool undeploy-target. Note: this only deploys the '
-                                                       'recipe itself and not any runtime dependencies, so it is '
-                                                       'assumed that those have been installed on the target '
-                                                       'beforehand. Use --package/--file-glob to deploy only a '
-                                                       'subset of the recipe\'s installed files.',
+                                                      'the do_install task) to a live target machine over ssh, '
+                                                      'or directly into a local pseudo-managed rootfs directory '
+                                                      '(e.g. one extracted for NFS booting). Existing files are '
+                                                      'preserved by default and restored by devtool '
+                                                      'undeploy-target. Only the recipe itself is deployed, not '
+                                                      'its runtime dependencies. Use --package/--file-glob to '
+                                                      'deploy only a subset of the recipe\'s installed files.',
                                           group='testbuild')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
-    parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
+    parser_deploy.add_argument('target',
+                               help='Either a live target machine running an ssh server: '
+                               'user@hostname[:destdir]; or an absolute path to a local '
+                               'pseudo-managed rootfs directory (e.g. one extracted by '
+                               'runqemu-extract-sdk) to copy the files into directly, without ssh.')
     parser_deploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_deploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
     parser_deploy.add_argument('-n', '--dry-run', help='List files to be deployed only', action='store_true')
@@ -552,10 +713,15 @@ def register_commands(subparsers, context):
 
     parser_undeploy = subparsers.add_parser('undeploy-target',
                                             help='Undeploy recipe output files in live target machine',
-                                            description='Un-deploys recipe output files previously deployed to a live target machine by devtool deploy-target.',
+                                            description='Un-deploys recipe output files previously deployed to a live target machine or local '
+                                                        'pseudo-managed rootfs directory by devtool deploy-target.',
                                             group='testbuild')
     parser_undeploy.add_argument('recipename', help='Recipe to undeploy (if not using -a/--all)', nargs='?')
-    parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
+    parser_undeploy.add_argument('target',
+                               help='Either a live target machine running an ssh server: '
+                               'user@hostname; or an absolute path to the local pseudo-managed '
+                               'rootfs directory previously used with deploy-target, to remove '
+                               'the files directly, without ssh.')
     parser_undeploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_undeploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
     parser_undeploy.add_argument('-a', '--all', help='Undeploy all recipes deployed on the target', action='store_true')
-- 
2.55.0


