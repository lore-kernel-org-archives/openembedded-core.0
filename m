Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832A0C48277
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:31 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.74262.1705931968604177761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aVtO5Q58;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2cea0563cbso476982966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931967; x=1706536767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia6d/hhX/iexjlFxgXuruNl1zuEtuCTVFnk98oKC1o4=;
        b=aVtO5Q58gPZH26owTp8SlLTxL6QKz+lkuqL66Jltk59qRwhnBxhKSsUWkI/aUI8fQP
         sJ8A/B2VtpNO9CYdhj/2q6gXksvjx8kWkaDFUcYmmNCqaXUFEYNxoW/Nv49RMxdQ2BMp
         J3FK2MazY+4ExfZXSx9O8amctMdc7BXcnxEAS2rqETXSSyrcQqwPTXAl7QU5/WuR1i+C
         48Xa8vnz1eMP4xier1ZB9qejR1Ok6IR9VPBSkH2SiHnOgmwhznobxSYl5cUwX1IcG90Q
         NABKAYBjhRXUEY24T+ImCV6kTUqZ1l2aR3VYiHYde1aazn0DeupfWXBWekqPZ0GI928m
         fL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931967; x=1706536767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia6d/hhX/iexjlFxgXuruNl1zuEtuCTVFnk98oKC1o4=;
        b=h/kA0F6nYQiMrOdm7Ne8n5jeEzWNYdjE/QtocmmX7/eRt02/aQehtbDxIxJd3V7J5L
         ZAUVXTk+8tUOlWeTplA5A3Q5GtmYgsLVf+DB/Fwk6wWP6gpsB0ZAh9KzZ4anhKRqS8hB
         1iYjE9l8T5KVa1nvlPoAJSU1Gxo6w1eVocn60YuqZdOsuLdnUPe9i28f5dVcW3EZBvXt
         04rZKlx5FYoAavIBww4EpiCsIE6FkPXizhGc3jzcVKNjWhfsiUMc5PHcBsuPxRzRXJpb
         T7EM2KgN+4HI/cxQeSbf4jOd/59zVDOoooXZAx5TvZRODSPbOIoZADNH210Cv7qdKfEE
         zjIA==
X-Gm-Message-State: AOJu0Yzp3LFClI3IY/FHaoKfQVjUClj6yPZnADRKzYzrbToSEy852jow
	JaDsqy0CvfUljQNPY43BnuIi7TS8DJxQMV2G4kYyGTfTTA25V07kpz7SjeWq
X-Google-Smtp-Source: AGHT+IHModj4cx40ma8VpjRGL8eHwlynswaLcQQo7Xpnm4cCzLFhfUEOkcz8zcvQed+/We5CIkpqeg==
X-Received: by 2002:a17:907:d409:b0:a2f:ca46:fc8d with SMTP id vi9-20020a170907d40900b00a2fca46fc8dmr1916614ejc.17.1705931966666;
        Mon, 22 Jan 2024 05:59:26 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:26 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 7/9] devtool: refactor deploy-target
Date: Mon, 22 Jan 2024 14:58:25 +0100
Message-ID: <20240122135901.171596-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122135901.171596-1-adrian.freihofer@siemens.com>
References: <20240122135901.171596-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194156

Make the deploy function independent from d. This allows to call the
function also from Python code not running in bitbake.
This is needed to for the devtool ide plugin which will call the
do_install task and the code from devtool deploy-target independently
from a bitbake server. This allows a much quicker workflow.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 236 ++++++++++++++++++----------------
 1 file changed, 122 insertions(+), 114 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index b71d55e2312..b5ca8f2c2f1 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -133,17 +133,38 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
 
     return '\n'.join(lines)
 
-
-
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
-    import math
-    import oe.recipeutils
-    import oe.package
     import oe.utils
 
     check_workspace_recipe(workspace, args.recipename, checksrc=False)
 
+    tinfoil = setup_tinfoil(basepath=basepath)
+    try:
+        try:
+            rd = tinfoil.parse_recipe(args.recipename)
+        except Exception as e:
+            raise DevtoolError('Exception parsing recipe %s: %s' %
+                            (args.recipename, e))
+        
+        srcdir = rd.getVar('D')
+        workdir = rd.getVar('WORKDIR')
+        path = rd.getVar('PATH')
+        strip_cmd = rd.getVar('STRIP')
+        libdir = rd.getVar('libdir')
+        base_libdir = rd.getVar('base_libdir')
+        max_process = oe.utils.get_bb_number_threads(rd)
+        fakerootcmd = rd.getVar('FAKEROOTCMD')
+        fakerootenv = rd.getVar('FAKEROOTENV')
+    finally:
+        tinfoil.shutdown()
+
+    return deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args)
+
+def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_process, fakerootcmd, fakerootenv, args):
+    import math
+    import oe.package
+
     try:
         host, destdir = args.target.split(':')
     except ValueError:
@@ -153,121 +174,108 @@ def deploy(args, config, basepath, workspace):
     if not destdir.endswith('/'):
         destdir += '/'
 
-    tinfoil = setup_tinfoil(basepath=basepath)
-    try:
-        try:
-            rd = tinfoil.parse_recipe(args.recipename)
-        except Exception as e:
-            raise DevtoolError('Exception parsing recipe %s: %s' %
-                            (args.recipename, e))
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
 
-        recipe_outdir = rd.getVar('D')
-        if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
-            raise DevtoolError('No files to deploy - have you built the %s '
-                            'recipe? If so, the install step has not installed '
-                            'any files.' % args.recipename)
+    extraoptions = ''
+    if args.no_host_check:
+        extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+    if not args.show_status:
+        extraoptions += ' -q'
 
-        fakerootcmd = rd.getVar('FAKEROOTCMD')
-        fakerootenv = rd.getVar('FAKEROOTENV')
-        if args.strip and not args.dry_run:
-            # Fakeroot copy to new destination
-            srcdir = recipe_outdir
-            recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'devtool-deploy-target-stripped')
-            if os.path.isdir(recipe_outdir):
-                exec_fakeroot_no_d(fakerootcmd, fakerootenv, "rm -rf %s" % recipe_outdir, shell=True)
-            exec_fakeroot_no_d(fakerootcmd, fakerootenv, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
-            os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
-            oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
-                        rd.getVar('base_libdir'), oe.utils.get_bb_number_threads(rd), rd)
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
 
-        # Now run the script
-        ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
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
         if ret != 0:
-            raise DevtoolError('Deploy failed - rerun with -s to get a complete '
-                            'error message')
+            raise DevtoolError('Failed to copy script to %s - rerun with -s to '
+                            'get a complete error message' % args.target)
+    finally:
+        shutil.rmtree(tmpdir)
 
-        logger.info('Successfully deployed %s' % recipe_outdir)
+    # Now run the script
+    ret = exec_fakeroot_no_d(fakerootcmd, fakerootenv, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+    if ret != 0:
+        raise DevtoolError('Deploy failed - rerun with -s to get a complete '
+                        'error message')
 
-        files_list = []
-        for root, _, files in os.walk(recipe_outdir):
-            for filename in files:
-                filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
-                files_list.append(os.path.join(destdir, filename))
-    finally:
-        tinfoil.shutdown()
+    logger.info('Successfully deployed %s' % recipe_outdir)
+
+    files_list = []
+    for root, _, files in os.walk(recipe_outdir):
+        for filename in files:
+            filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
+            files_list.append(os.path.join(destdir, filename))
 
     return 0
 
-- 
2.43.0


