Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A874C61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:29:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9427.1788100183422661276
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=efLB+vi5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202608301429426e79cd1381000207f9-svua4o@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608301429426e79cd1381000207f9
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 16:29:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cjV+f23McuxXialyiT814EX6HwKpUdJOhcJDq1JQiv4=;
 b=efLB+vi5wFXy+9niHrvXXfqxK6Ju0Jw7AIVn7ObwuAsaMCJUr0tgVBj7fZRfD7eR9BVvfg
 WfoxfoEYTpAVczvZQQRwpIeYz+ZK7oNoBoQ2VnznSg3HccsPUQOl+4vUZAk1T7es2RhOoy7L
 c+Jr7SRDJNvfI1OG5vLJmo9oecNLy9v7Gi0Vj5BxBFrx1oIgr2RiKTECm34s7cX4ukXB6ppC
 VQn9WJYu31rEPKpyAqjoDsMnvrGIjKX8njkvozwVTLWaM/LbOU7OxO2iMgj34v5t/j/pkazI
 DfnscT7bRuNA1VqRMBw3+9JWFFanVLF+/ylM/jtMDNXSMB81E+c/Yi7w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 18/24] devtool: deploy-target: allow deploying directly into a local rootfs
Date: Sun, 30 Aug 2026 16:28:45 +0200
Message-ID: <20260830142922.17241-19-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244682

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Accept an absolute path as the deploy-target "target" argument to copy
files directly into a local pseudo-managed rootfs directory (e.g. one
extracted by 'devtool ide-sdk --nfs' for NFS booting), instead of
always requiring an ssh connection.

Deploying over ssh to the target would also work for an NFS-mounted
rootfs, but that means dealing with the target's IP address and sshd
port, which is way more cumbersome than just passing a local path.
Copying the files in directly is also faster, since it avoids the
network/ssh round trip entirely.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 113 +++++++++++++++++++++++++++++++---
 1 file changed, 106 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index a4fd83d305..88c6e383a0 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -20,6 +20,7 @@ import oe.types
 import oe.package
 
 from devtool import exec_fakeroot_no_d, setup_tinfoil, check_workspace_recipe, DevtoolError
+from runqemu_utils import native_environment, pseudo_state_dir
 
 logger = logging.getLogger('devtool')
 
@@ -254,6 +255,85 @@ def deploy(args, config, basepath, workspace):
 
     return deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=args.file_globs, packages_files=packages_files)
 
+def _deploy_local(args, target_dir, filelist, ftotalsize, tar_relpaths, allowed_files,
+                fakerootcmd, fakerootenv, path, recipe_outdir):
+    """Copy files directly into target_dir instead of over ssh/scp.
+
+    target_dir is expected to be a pseudo-managed rootfs previously extracted
+    on the host, e.g. by runqemu-extract-sdk or 'devtool ide-sdk --nfs' for a
+    target device or QEMU instance that NFS-mounts it.
+    """
+    if not os.path.isdir(target_dir):
+        raise DevtoolError('Target directory %s does not exist' % target_dir)
+    state_dir = pseudo_state_dir(target_dir)
+    if not os.path.isdir(state_dir):
+        raise DevtoolError(
+            '%s does not exist - %s does not look like a pseudo-managed rootfs '
+            '(e.g. one extracted by devtool ide-sdk --nfs).' % (state_dir, target_dir))
+
+    environment = native_environment()
+    pseudo = environment.get('PSEUDO')
+    native_sysroot = environment.get('OECORE_NATIVE_SYSROOT')
+    if not pseudo or not native_sysroot:
+        raise DevtoolError('qemu-helper-native did not provide pseudo')
+
+    if not args.no_check_space:
+        freespace = shutil.disk_usage(target_dir).free // 1024
+        if ftotalsize > freespace:
+            raise DevtoolError('Deploy failed - insufficient space on target '
+                            '(available %d, needed %d)' % (freespace, ftotalsize))
+
+    # destdir is target_dir itself: the script writes directly into the
+    # local pseudo-managed rootfs directory, not into the real filesystem root.
+    destdir = target_dir
+    shellscript = _prepare_remote_script(deploy=True,
+                                        destdir=destdir,
+                                        verbose=args.show_status,
+                                        nopreserve=args.no_preserve,
+                                        nocheckspace=True)
+
+    tmpdir = tempfile.mkdtemp(prefix='devtool')
+    tar_filelist_path = None
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
+        if allowed_files is not None:
+            tar_fd, tar_filelist_path = tempfile.mkstemp(prefix='devtool-deploy-filelist-')
+            with os.fdopen(tar_fd, 'w') as f:
+                for relpath in tar_relpaths:
+                    f.write('./' + relpath + '\n')
+            tar_cmd = 'tar cf - -T %s' % shlex.quote(tar_filelist_path)
+        else:
+            tar_cmd = 'tar cf - .'
+
+        # The extraction side needs its own pseudo session (with different database) than the recipe's own.
+        extract_cmd = 'PSEUDO_LOCALSTATEDIR=%s PSEUDO_INCLUDE_PATHS=%s %s -P %s sh %s %s %s %s' % (
+            shlex.quote(state_dir), shlex.quote(destdir), shlex.quote(pseudo),
+            shlex.quote(os.path.join(native_sysroot, 'usr')),
+            shlex.quote(script_path), shlex.quote(args.recipename),
+            shlex.quote(destdir), shlex.quote(filelist_path))
+        ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path,
+                                '%s | %s' % (tar_cmd, extract_cmd),
+                                cwd=recipe_outdir, shell=True)
+    finally:
+        if tar_filelist_path:
+            os.remove(tar_filelist_path)
+        shutil.rmtree(tmpdir)
+
+    if ret != 0:
+        raise DevtoolError('Deploy failed - rerun with -s to get a complete '
+                        'error message')
+
+    logger.info('Successfully deployed %s to %s' % (recipe_outdir, target_dir))
+    return 0
+
 def _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files,
                 fakerootcmd, fakerootenv, path, recipe_outdir):
     """Copy files to target_dir over ssh/scp (user@hostname[:destdir])."""
@@ -342,12 +422,16 @@ def _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files
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
+        try:
+            host, destdir = args.target.split(':')
+        except ValueError:
+            destdir = '/'
+        else:
+            args.target = host
     if not destdir.endswith('/'):
         destdir += '/'
 
@@ -436,6 +520,12 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
             print('  %s' % item)
         return 0
 
+    if os.path.isabs(args.target):
+        # A local directory (e.g. an NFS-exported rootfs) rather than a
+        # user@host ssh target: copy the files in directly, no network needed.
+        return _deploy_local(args, os.path.realpath(args.target), filelist, ftotalsize, tar_relpaths,
+                            allowed_files, fakerootcmd, fakerootenv, path, recipe_outdir)
+
     return _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths,
                         allowed_files, fakerootcmd, fakerootenv, path, recipe_outdir)
 
@@ -503,10 +593,19 @@ def register_commands(subparsers, context):
 
     parser_deploy = subparsers.add_parser('deploy-target',
                                           help='Deploy recipe output files to live target machine',
-                                          description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand. Use --package/--file-glob to deploy only a subset of the recipe\'s installed files.',
+                                          description='Deploys a recipe\'s build output (i.e. the output of '
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
+    parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]. '
+                               'Alternatively, an absolute path to a local pseudo-managed rootfs directory '
+                               '(e.g. one extracted by devtool ide-sdk --nfs) to copy the files into directly, without ssh.')
     parser_deploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_deploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
     parser_deploy.add_argument('-n', '--dry-run', help='List files to be deployed only', action='store_true')
-- 
2.55.0


