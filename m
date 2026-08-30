Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEC9C61DFD
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:26 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17277.1788126560451107145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ljy2403i;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260830214918c962e91e5d000207e9-d4vwup@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260830214918c962e91e5d000207e9
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FmSY+YnqdxzfEktRpsLE1R4aTpIMrysmYm588zu68O4=;
 b=ljy2403i8aS2vVCL6OoVdKXCuLBxAjE9FZA0Xc0Easn2NTKL5IyKUreuRvNCirHcsRbmYR
 67gC/12kiGGIa/qDzlpSIkudcThTLExR0ZL+QHxxHm+I3rPcuqm9+pFsas1725PW5ub2ZRwK
 TLACxzQTCsBkPMQ1r1SobI9RnCDriiCVI7VPiApMbT9LyQkerV2ysU5Ycg5Kh8/0iIggcq9s
 Hu/V1QLpnnknSGGm5qPnz9Fr8hLzocsyoq0fSh6jK7CA+HEvb4coJYRPfHKsPNwCyiKisyg/
 aHWc2w5p/SVv0+h121noObUqvS8CHqUp2tegxJk20w/YrogZ3G+PPo7w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 17/25] devtool: deploy: split ssh deployment into a separate function
Date: Sun, 30 Aug 2026 23:48:39 +0200
Message-ID: <20260830214912.1346063-18-adrian.freihofer@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244720

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a refactoring preparation for adding a new local deployment
method that will be used for NFS rootfs deployments.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 174 ++++++++++++++++++----------------
 1 file changed, 90 insertions(+), 84 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index d11b04aea2..d413fa7b91 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -254,6 +254,94 @@ def deploy(args, config, basepath, workspace):
 
     return deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=args.file_globs, packages_files=packages_files)
 
+def _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths, allowed_files,
+                fakerootcmd, fakerootenv, path, recipe_outdir):
+    """Copy files to target_dir over ssh/scp (user@hostname[:destdir])."""
+    extraoptions = ''
+    if args.no_host_check:
+        extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+    if not args.show_status:
+        extraoptions += ' -q'
+
+    scp_sshexec = ''
+    ssh_sshexec = 'ssh'
+    if args.ssh_exec:
+        scp_sshexec = "-S %s" % args.ssh_exec
+        ssh_sshexec = args.ssh_exec
+    scp_port = ''
+    ssh_port = ''
+    if args.port:
+        scp_port = "-P %s" % args.port
+        ssh_port = "-p %s" % args.port
+
+    if args.key:
+        extraoptions += ' -i %s' % args.key
+
+    # In order to delete previously deployed files and have the manifest file on
+    # the target, we write out a shell script and then copy it to the target
+    # so we can then run it (piping tar output to it).
+    # (We cannot use scp here, because it doesn't preserve symlinks.)
+    tmpdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        tmpscript = '/tmp/devtool_deploy.sh'
+        tmpfilelist = os.path.join(os.path.dirname(tmpscript), 'devtool_deploy.list')
+        shellscript = _prepare_remote_script(deploy=True,
+                                            destdir=destdir,
+                                            verbose=args.show_status,
+                                            nopreserve=args.no_preserve,
+                                            nocheckspace=args.no_check_space)
+        # Write out the script to a file
+        with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
+            f.write(shellscript)
+        # Write out the file list
+        with open(os.path.join(tmpdir, os.path.basename(tmpfilelist)), 'w') as f:
+            f.write('%d\n' % ftotalsize)
+            for fpath, fsize in filelist:
+                f.write('%s %d\n' % (fpath, fsize))
+        # Copy them to the target
+        ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+        if ret != 0:
+            raise DevtoolError('Failed to copy script to %s - rerun with -s to '
+                            'get a complete error message' % args.target)
+    finally:
+        shutil.rmtree(tmpdir)
+
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
+    if ret != 0:
+        raise DevtoolError('Deploy failed - rerun with -s to get a complete '
+                        'error message')
+
+    logger.info('Successfully deployed %s' % recipe_outdir)
+
+    files_list = []
+    for root, _, files in os.walk(recipe_outdir):
+        for filename in files:
+            filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
+            files_list.append(os.path.join(destdir, filename))
+
+    return 0
+
 def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args, file_globs=None, packages_files=None):
     import math
 
@@ -351,90 +439,8 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
             print('  %s' % item)
         return 0
 
-    extraoptions = ''
-    if args.no_host_check:
-        extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-    if not args.show_status:
-        extraoptions += ' -q'
-
-    scp_sshexec = ''
-    ssh_sshexec = 'ssh'
-    if args.ssh_exec:
-        scp_sshexec = "-S %s" % args.ssh_exec
-        ssh_sshexec = args.ssh_exec
-    scp_port = ''
-    ssh_port = ''
-    if args.port:
-        scp_port = "-P %s" % args.port
-        ssh_port = "-p %s" % args.port
-
-    if args.key:
-        extraoptions += ' -i %s' % args.key
-
-    # In order to delete previously deployed files and have the manifest file on
-    # the target, we write out a shell script and then copy it to the target
-    # so we can then run it (piping tar output to it).
-    # (We cannot use scp here, because it doesn't preserve symlinks.)
-    tmpdir = tempfile.mkdtemp(prefix='devtool')
-    try:
-        tmpscript = '/tmp/devtool_deploy.sh'
-        tmpfilelist = os.path.join(os.path.dirname(tmpscript), 'devtool_deploy.list')
-        shellscript = _prepare_remote_script(deploy=True,
-                                            destdir=destdir,
-                                            verbose=args.show_status,
-                                            nopreserve=args.no_preserve,
-                                            nocheckspace=args.no_check_space)
-        # Write out the script to a file
-        with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
-            f.write(shellscript)
-        # Write out the file list
-        with open(os.path.join(tmpdir, os.path.basename(tmpfilelist)), 'w') as f:
-            f.write('%d\n' % ftotalsize)
-            for fpath, fsize in filelist:
-                f.write('%s %d\n' % (fpath, fsize))
-        # Copy them to the target
-        ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
-        if ret != 0:
-            raise DevtoolError('Failed to copy script to %s - rerun with -s to '
-                            'get a complete error message' % args.target)
-    finally:
-        shutil.rmtree(tmpdir)
-
-    # Now run the script. When a package/glob filter narrowed down filelist,
-    # tar is given an explicit list of relative paths (-T) instead of packing
-    # the whole recipe_outdir tree.
-    tar_filelist_path = None
-    try:
-        if allowed_files is not None:
-            tar_fd, tar_filelist_path = tempfile.mkstemp(prefix='devtool-deploy-filelist-')
-            with os.fdopen(tar_fd, 'w') as f:
-                for relpath in tar_relpaths:
-                    # './' prefix matches what 'tar cf - .' itself would produce, which
-                    # the remote script's manifest handling (sed "s!^./!$2!") relies on.
-                    f.write('./' + relpath + '\n')
-            tar_cmd = 'tar cf - -T %s' % shlex.quote(tar_filelist_path)
-        else:
-            tar_cmd = 'tar cf - .'
-        remote_cmd = '%s | %s  %s %s %s \'sh %s %s %s %s\'' % (
-            tar_cmd, ssh_sshexec, ssh_port, extraoptions, args.target,
-            tmpscript, args.recipename, destdir, tmpfilelist)
-        ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, remote_cmd, cwd=recipe_outdir, shell=True)
-    finally:
-        if tar_filelist_path:
-            os.remove(tar_filelist_path)
-    if ret != 0:
-        raise DevtoolError('Deploy failed - rerun with -s to get a complete '
-                        'error message')
-
-    logger.info('Successfully deployed %s' % recipe_outdir)
-
-    files_list = []
-    for root, _, files in os.walk(recipe_outdir):
-        for filename in files:
-            filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
-            files_list.append(os.path.join(destdir, filename))
-
-    return 0
+    return _deploy_ssh(args, destdir, filelist, ftotalsize, tar_relpaths,
+                        allowed_files, fakerootcmd, fakerootenv, path, recipe_outdir)
 
 def undeploy(args, config, basepath, workspace):
     """Entry point for the devtool 'undeploy' subcommand"""
-- 
2.55.0


