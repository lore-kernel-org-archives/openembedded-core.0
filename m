Return-Path: <o.mandel@menlosystems.com>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Feb 2019 13:18:01 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BD7607BE4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 13:18:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 444vwx2h5Sz1r0QY;
	Thu, 21 Feb 2019 14:10:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 444vwx2YwCz1r2J8;
	Thu, 21 Feb 2019 14:10:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id esdga8IN1fgG; Thu, 21 Feb 2019 14:10:56 +0100 (CET)
X-Auth-Info: MXXAtjq9hpcyK4OooTZSxumajplvE86IKJtZKDn9qCwolayonIvpyYyzTr1/AabL
Received: from menlobldserver.menlosystems.local
	(host-141-40-253-35.customer.izb-online.de [141.40.253.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 21 Feb 2019 14:10:56 +0100 (CET)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 13:10:45 +0000
Message-Id: <20190221131045.20591-1-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.11.0
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH] devtool: deploy-target: allow use of alternate ssh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2019 13:18:02 -0000

Allow the use of an alternate SSH executable for deploy-target and
undeploy-target. The command can be specified with -e / --ssh-exec.

Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
---
 scripts/lib/devtool/deploy.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 886004b5d0..f345f31b7b 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -211,6 +211,11 @@ def deploy(args, config, basepath, workspace):
         if not args.show_status:
             extraoptions += ' -q'
 
+        scp_sshexec = ''
+        ssh_sshexec = 'ssh'
+        if args.ssh_exec:
+            scp_sshexec = "-S %s" % args.ssh_exec
+            ssh_sshexec = args.ssh_exec
         scp_port = ''
         ssh_port = ''
         if args.port:
@@ -238,7 +243,7 @@ def deploy(args, config, basepath, workspace):
                 for fpath, fsize in filelist:
                     f.write('%s %d\n' % (fpath, fsize))
             # Copy them to the target
-            ret = subprocess.call("scp %s %s %s/* %s:%s" % (scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+            ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
             if ret != 0:
                 raise DevtoolError('Failed to copy script to %s - rerun with -s to '
                                 'get a complete error message' % args.target)
@@ -246,7 +251,7 @@ def deploy(args, config, basepath, workspace):
             shutil.rmtree(tmpdir)
 
         # Now run the script
-        ret = exec_fakeroot(rd, 'tar cf - . | ssh  %s %s %s \'sh %s %s %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+        ret = exec_fakeroot(rd, 'tar cf - . | %s  %s %s %s \'sh %s %s %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
         if ret != 0:
             raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                             'error message')
@@ -276,6 +281,11 @@ def undeploy(args, config, basepath, workspace):
     if not args.show_status:
         extraoptions += ' -q'
 
+    scp_sshexec = ''
+    ssh_sshexec = 'ssh'
+    if args.ssh_exec:
+        scp_sshexec = "-S %s" % args.ssh_exec
+        ssh_sshexec = args.ssh_exec
     scp_port = ''
     ssh_port = ''
     if args.port:
@@ -292,7 +302,7 @@ def undeploy(args, config, basepath, workspace):
         with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
             f.write(shellscript)
         # Copy it to the target
-        ret = subprocess.call("scp %s %s %s/* %s:%s" % (scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+        ret = subprocess.call("scp %s %s %s %s/* %s:%s" % (scp_sshexec, scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
         if ret != 0:
             raise DevtoolError('Failed to copy script to %s - rerun with -s to '
                                 'get a complete error message' % args.target)
@@ -300,7 +310,7 @@ def undeploy(args, config, basepath, workspace):
         shutil.rmtree(tmpdir)
 
     # Now run the script
-    ret = subprocess.call('ssh %s %s %s \'sh %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename), shell=True)
+    ret = subprocess.call('%s %s %s %s \'sh %s %s\'' % (ssh_sshexec, ssh_port, extraoptions, args.target, tmpscript, args.recipename), shell=True)
     if ret != 0:
         raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
                            'error message')
@@ -324,6 +334,7 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-n', '--dry-run', help='List files to be deployed only', action='store_true')
     parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
+    parser_deploy.add_argument('-e', '--ssh-exec', help='Executable to use in place of ssh')
     parser_deploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
 
     strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
@@ -346,5 +357,6 @@ def register_commands(subparsers, context):
     parser_undeploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
     parser_undeploy.add_argument('-a', '--all', help='Undeploy all recipes deployed on the target', action='store_true')
     parser_undeploy.add_argument('-n', '--dry-run', help='List files to be undeployed only', action='store_true')
+    parser_undeploy.add_argument('-e', '--ssh-exec', help='Executable to use in place of ssh')
     parser_undeploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
     parser_undeploy.set_defaults(func=undeploy)
-- 
2.11.0


