Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B93BCA0FFC
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.27276.1693933180230669180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iXnEGhvz;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31c8a710545so2592031f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933178; x=1694537978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy8i1/A44FHlgQLN08tx4d2NioWfPZimdixvZe0CbjI=;
        b=iXnEGhvzypJP5RvCBCHCL0SFC/mcDSafIlNtwMGhNHtCDaurcKNLtgk08aITPHdOqq
         IgYJz2NV9HsAQxh304G88FNkO8rDWYfCrvgSjX4Z8aWnRG/4hp7y/+ZNM9mjqJgIo2Oi
         0JlLTXpBJVNOSDatM/XbVDV0Ax6tON76wzVi11rOfDrIYygaeJpR7W98vTSz/fLLNKi1
         uI0veTqiUEmg6PfQ74MYdQdeiJm7ZOaqcEsaPSGbFVRFxJswDSVKHImVQaI6W7YPjKdF
         keU+cNvQbKhk0/nSb5/piqZBUPexJLVLES5PVMmokR3/JepGju2Go3pPFnstNPTVptbb
         5rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933178; x=1694537978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy8i1/A44FHlgQLN08tx4d2NioWfPZimdixvZe0CbjI=;
        b=CAVFuBbbCZG/12fc2JXiWWg/Zm7l7mp8ZOZOSqtPyTq99A7f7nzzw6ZAKve5aKgsmk
         ZkfxLWOtLePgfNMY5Dl+8rWJ8YL6gekHxw0azfbdxDeCr3AZT9phy+qhVpp2SUD2w4uj
         UnPya2eQuvlhtYPSZu6pPeEVjB8tf9/pxxZbOk+oUqAVSMmXgiPLqFDcWy2vBeJ/LNCn
         lzClsoCfV3+KDgjXmTXEcfaYzRy2RY/0DBBv7rzJayYWX2jUUGQnCgU7epcmHY/7PKwr
         RbiydSxZ64hIyL6xldvb07nt3PvBz1+r6AvGd8NEr5epaP630RG1Gdk2glvf2CRk9tXn
         jHNw==
X-Gm-Message-State: AOJu0YxIjHCrZ61TuVaJzoNwrtfhfjfMrlDbKbpMapYao6wznLxQ0uYI
	DahnChHHFfMhGd6wH6GK8IAUk8ChLCI=
X-Google-Smtp-Source: AGHT+IGnRaMq4C8iX2Zo+1vmuAVYu3Gfc+yGB+1EV/JRGQas1vOUPHyLkEuDJzjn3zDfoK+q1iEDRw==
X-Received: by 2002:adf:e407:0:b0:317:3e58:64cb with SMTP id g7-20020adfe407000000b003173e5864cbmr265686wrm.46.1693933178379;
        Tue, 05 Sep 2023 09:59:38 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:37 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 10/14] devtool: refactor deploy-target
Date: Tue,  5 Sep 2023 18:51:19 +0200
Message-ID: <20230905165913.2560907-11-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187242

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


