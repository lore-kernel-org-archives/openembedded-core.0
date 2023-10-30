Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5078C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 21:32:15 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.171476.1698701534900977728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 14:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LwTyNnBb;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40839807e82so29619335e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 14:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698701533; x=1699306333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMOkJ4USCozMz4GgWrp5l2yO5esj7tOcKNzaOJUDY8Y=;
        b=LwTyNnBb89O97E6wu5mIE6l3YzIoZYKtIW3vBM/AmDiyEg6MmzSSbs9nAA1iPxB47S
         /oM5/zM8v+lxu5h2GqCey30FadPEPQ6oYX1kWiR2EdSB6jxeQafFhEmOdayOmFXvPE1N
         QrOatjpvxLZZk5YtuslprLMFPtbIMSfQOGnIP+kOWyR0DQ7925TtP8YWgX91ax4gC5yy
         FxInpgWKVHjP/lbD2j38VScYYBs3ggHRAKfSzaRnbzX3pzfEF0pF8X6J0HVc3YmoeVH2
         Sdm8GYmFktYwtr/NOIAxjVegqmBUwch1vNbf+bBtED5i6UZ39wzlnCfbWl86ihuy4toU
         +Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701533; x=1699306333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMOkJ4USCozMz4GgWrp5l2yO5esj7tOcKNzaOJUDY8Y=;
        b=ZG/qJ5D2DRqGVPZ8JiQijUhZYY/tplmdGmLZ2pXM2JTgBkdLOYKqN/4CrN+XZqLEKz
         a5rk8rP3k3zoj2saAQBHu+ZUNtyJoXtf0BqS0Xni5ZOIwJ7Xchi8SAsIlU2z29q0ykUh
         YCoIYwxkIV4tTYvUf5OUjcgP04Zu84DhqskpAJh3ICB/2QdrfXYbwVZkjOfx79JMyYG8
         j81SZzTl2ewZLeLoRC9wTY/MhZ2ahmqiDBT8p0dMrCkwzDTD8xxDMaBMjdUF260L0lRP
         qKRtMBC8cxKrQGWvb7TRnHPiEZIk4tMXeJxx3q7nF/PpbzJJilstd5NcLppx+Zu85gUJ
         CDuQ==
X-Gm-Message-State: AOJu0YxEDwwymWkgHIEvKJau/38U+r33KQ39IWBdMEh47ht+41qLhLC6
	GuS/QvtrJIQAp18LizxKXW//B33NvdA=
X-Google-Smtp-Source: AGHT+IG2GoVPQL4COdyphQHs2c6vWjOQjw5Q4zrPM+nIXHoQFGC9guSOaYwpoZT/OWcOyJZzfR9nAA==
X-Received: by 2002:a05:600c:4e05:b0:405:3be0:c78d with SMTP id b5-20020a05600c4e0500b004053be0c78dmr855956wmq.3.1698701533084;
        Mon, 30 Oct 2023 14:32:13 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003fc0505be19sm304811wmq.37.2023.10.30.14.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:32:12 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 5/8] devtool: refactor deploy-target
Date: Mon, 30 Oct 2023 22:32:02 +0100
Message-ID: <20231030213205.2824790-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
References: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189817

Make the deploy function independent from d. This allows to call the
function also from Python code not running in bitbake.
This is needed to for the devtool ide plugin which will call the
do_install task and the code from devtool deploy-target independently
from a bitbake server. This allows a much quicker workflow.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/__init__.py |   5 +-
 scripts/lib/devtool/deploy.py   | 230 +++++++++++++++++---------------
 2 files changed, 124 insertions(+), 111 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 702db669de3..7d64547616e 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -78,12 +78,15 @@ def exec_fakeroot(d, cmd, **kwargs):
     """Run a command under fakeroot (pseudo, in fact) so that it picks up the appropriate file permissions"""
     # Grab the command and check it actually exists
     fakerootcmd = d.getVar('FAKEROOTCMD')
+    fakerootenv = d.getVar('FAKEROOTENV')
+    exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, kwargs)
+
+def exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, **kwargs):
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
     # Set up the appropriate environment
     newenv = dict(os.environ)
-    fakerootenv = d.getVar('FAKEROOTENV')
     for varvalue in fakerootenv.split():
         if '=' in varvalue:
             splitval = varvalue.split('=', 1)
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index e14a5874177..ea7e2cb1ae8 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -16,7 +16,7 @@ import bb.utils
 import argparse_oe
 import oe.types
 
-from devtool import exec_fakeroot, setup_tinfoil, check_workspace_recipe, DevtoolError
+from devtool import exec_fakeroot_no_d, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -133,16 +133,11 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
 
     return '\n'.join(lines)
 
-
-
-def deploy(args, config, basepath, workspace):
-    """Entry point for the devtool 'deploy' subcommand"""
+def deploy_cached(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args):
     import math
     import oe.recipeutils
     import oe.package
 
-    check_workspace_recipe(workspace, args.recipename, checksrc=False)
-
     try:
         host, destdir = args.target.split(':')
     except ValueError:
@@ -152,116 +147,131 @@ def deploy(args, config, basepath, workspace):
     if not destdir.endswith('/'):
         destdir += '/'
 
+    recipe_outdir = srcdir
+    if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
+        raise DevtoolError('No files to deploy - have you built the %s '
+                        'recipe? If so, the install step has not installed '
+                        'any files.' % args.recipename)
+
+    if args.strip and not args.dry_run:
+        # Fakeroot copy to new destination
+        srcdir = recipe_outdir
+        recipe_outdir = os.path.join(workdir, 'devtool-deploy-target-stripped')
+        if os.path.isdir(recipe_outdir):
+            exec_fakeroot_no_d(fakerootcmd, fakerootenv, "rm -rf %s" % recipe_outdir, shell=True)
+        exec_fakeroot_no_d(fakerootcmd, fakerootenv, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
+        os.environ['PATH'] = ':'.join([os.environ['PATH'], path or ''])
+        oe.package.strip_execs(args.recipename, recipe_outdir, strip_cmd, libdir, base_libdir, max_process)
+
+    filelist = []
+    inodes = set({})
+    ftotalsize = 0
+    for root, _, files in os.walk(recipe_outdir):
+        for fn in files:
+            fstat = os.lstat(os.path.join(root, fn))
+            # Get the size in kiB (since we'll be comparing it to the output of du -k)
+            # MUST use lstat() here not stat() or getfilesize() since we don't want to
+            # dereference symlinks
+            if fstat.st_ino in inodes:
+                fsize = 0
+            else:
+                fsize = int(math.ceil(float(fstat.st_size)/1024))
+            inodes.add(fstat.st_ino)
+            ftotalsize += fsize
+            # The path as it would appear on the target
+            fpath = os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn)
+            filelist.append((fpath, fsize))
+
+    if args.dry_run:
+        print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
+        for item, _ in filelist:
+            print('  %s' % item)
+        return 0
+
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
+    # Now run the script
+    ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
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
+def deploy(args, config, basepath, workspace):
+    """Entry point for the devtool 'deploy' subcommand"""
+    check_workspace_recipe(workspace, args.recipename, checksrc=False)
+
     tinfoil = setup_tinfoil(basepath=basepath)
     try:
         try:
             rd = tinfoil.parse_recipe(args.recipename)
+
+            srcdir = rd.getVar('D')
+            workdir = rd.getVar('WORKDIR')
+            path = rd.getVar('PATH')
+            strip_cmd = rd.getVar('STRIP')
+            libdir = rd.getVar('libdir'),
+            base_libdir = rd.getVar('base_libdir')
+            max_process = int(rd.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
+            fakerootcmd = rd.getVar('FAKEROOTCMD')
+            fakerootenv = rd.getVar('FAKEROOTENV')
+            deploy_cached(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args)
         except Exception as e:
             raise DevtoolError('Exception parsing recipe %s: %s' %
                             (args.recipename, e))
-        recipe_outdir = rd.getVar('D')
-        if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
-            raise DevtoolError('No files to deploy - have you built the %s '
-                            'recipe? If so, the install step has not installed '
-                            'any files.' % args.recipename)
-
-        if args.strip and not args.dry_run:
-            # Fakeroot copy to new destination
-            srcdir = recipe_outdir
-            recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'devtool-deploy-target-stripped')
-            if os.path.isdir(recipe_outdir):
-                exec_fakeroot(rd, "rm -rf %s" % recipe_outdir, shell=True)
-            exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
-            os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
-            oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
-                        rd.getVar('base_libdir'), rd)
-
-        filelist = []
-        inodes = set({})
-        ftotalsize = 0
-        for root, _, files in os.walk(recipe_outdir):
-            for fn in files:
-                fstat = os.lstat(os.path.join(root, fn))
-                # Get the size in kiB (since we'll be comparing it to the output of du -k)
-                # MUST use lstat() here not stat() or getfilesize() since we don't want to
-                # dereference symlinks
-                if fstat.st_ino in inodes:
-                    fsize = 0
-                else:
-                    fsize = int(math.ceil(float(fstat.st_size)/1024))
-                inodes.add(fstat.st_ino)
-                ftotalsize += fsize
-                # The path as it would appear on the target
-                fpath = os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn)
-                filelist.append((fpath, fsize))
-
-        if args.dry_run:
-            print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
-            for item, _ in filelist:
-                print('  %s' % item)
-            return 0
-
-        extraoptions = ''
-        if args.no_host_check:
-            extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-        if not args.show_status:
-            extraoptions += ' -q'
-
-        scp_sshexec = ''
-        ssh_sshexec = 'ssh'
-        if args.ssh_exec:
-            scp_sshexec = "-S %s" % args.ssh_exec
-            ssh_sshexec = args.ssh_exec
-        scp_port = ''
-        ssh_port = ''
-        if args.port:
-            scp_port = "-P %s" % args.port
-            ssh_port = "-p %s" % args.port
-
-        if args.key:
-            extraoptions += ' -i %s' % args.key
-
-        # In order to delete previously deployed files and have the manifest file on
-        # the target, we write out a shell script and then copy it to the target
-        # so we can then run it (piping tar output to it).
-        # (We cannot use scp here, because it doesn't preserve symlinks.)
-        tmpdir = tempfile.mkdtemp(prefix='devtool')
-        try:
-            tmpscript = '/tmp/devtool_deploy.sh'
-            tmpfilelist = os.path.join(os.path.dirname(tmpscript), 'devtool_deploy.list')
-            shellscript = _prepare_remote_script(deploy=True,
-                                                verbose=args.show_status,
-                                                nopreserve=args.no_preserve,
-                                                nocheckspace=args.no_check_space)
-            # Write out the script to a file
-            with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
-                f.write(shellscript)
-            # Write out the file list
-            with open(os.path.join(tmpdir, os.path.basename(tmpfilelist)), 'w') as f:
-                f.write('%d\n' % ftotalsize)
-                for fpath, fsize in filelist:
-                    f.write('%s %d\n' % (fpath, fsize))
-            # Copy them to the target
-            ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
-            if ret != 0:
-                raise DevtoolError('Failed to copy script to %s - rerun with -s to '
-                                'get a complete error message' % args.target)
-        finally:
-            shutil.rmtree(tmpdir)
-
-        # Now run the script
-        ret = exec_fakeroot(rd, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
-        if ret != 0:
-            raise DevtoolError('Deploy failed - rerun with -s to get a complete '
-                            'error message')
-
-        logger.info('Successfully deployed %s' % recipe_outdir)
-
-        files_list = []
-        for root, _, files in os.walk(recipe_outdir):
-            for filename in files:
-                filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
-                files_list.append(os.path.join(destdir, filename))
     finally:
         tinfoil.shutdown()
 
-- 
2.41.0


