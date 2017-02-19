Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE4971974
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2017 08:03:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2017 00:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,178,1484035200"; d="scan'208";a="49801592"
Received: from timo-fedora.jf.intel.com ([10.7.159.57])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2017 00:03:47 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Feb 2017 00:08:18 -0800
Message-Id: <1487491698-8333-1-git-send-email-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] scripts/lib/devtool/deploy.py: add --port/-P argument for target connection
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
X-List-Received-Date: Sun, 19 Feb 2017 08:03:53 -0000

Enable using, e.g. host port 2222 for connection to qemu target.
Defaults to 22 for standard ssh/scp port.

[YOCTO #11079]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---

Changes since v1:
  * revert unintended change in 'if ret!=0:'
  * -P before --port consistent with other args

 scripts/lib/devtool/deploy.py | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 9ec04e3..b3730ae 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -192,6 +192,14 @@ def deploy(args, config, basepath, workspace):
         if not args.show_status:
             extraoptions += ' -q'
 
+        scp_port = ''
+        ssh_port = ''
+        if not args.port:
+            raise DevtoolError("If you specify -P/--port then you must provide the port to be used to connect to the target")
+        else:
+            scp_port = "-P %s" % args.port
+            ssh_port = "-p %s" % args.port
+
         # In order to delete previously deployed files and have the manifest file on
         # the target, we write out a shell script and then copy it to the target
         # so we can then run it (piping tar output to it).
@@ -213,7 +221,7 @@ def deploy(args, config, basepath, workspace):
                 for fpath, fsize in filelist:
                     f.write('%s %d\n' % (fpath, fsize))
             # Copy them to the target
-            ret = subprocess.call("scp %s %s/* %s:%s" % (extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+            ret = subprocess.call("scp %s %s %s/* %s:%s" % (scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
             if ret != 0:
                 raise DevtoolError('Failed to copy script to %s - rerun with -s to '
                                 'get a complete error message' % args.target)
@@ -221,7 +229,7 @@ def deploy(args, config, basepath, workspace):
             shutil.rmtree(tmpdir)
 
         # Now run the script
-        ret = exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'sh %s %s %s %s\'' % (extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+        ret = exec_fakeroot(rd, 'tar cf - . | ssh  %s %s %s \'sh %s %s %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
         if ret != 0:
             raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                             'error message')
@@ -251,6 +259,14 @@ def undeploy(args, config, basepath, workspace):
     if not args.show_status:
         extraoptions += ' -q'
 
+    scp_port = ''
+    ssh_port = ''
+    if not args.port:
+        raise DevtoolError("If you specify -P/--port then you must provide the port to be used to connect to the target")
+    else:
+        scp_port = "-P %s" % args.port
+        ssh_port = "-p %s" % args.port
+
     args.target = args.target.split(':')[0]
 
     tmpdir = tempfile.mkdtemp(prefix='devtool')
@@ -261,7 +277,7 @@ def undeploy(args, config, basepath, workspace):
         with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
             f.write(shellscript)
         # Copy it to the target
-        ret = subprocess.call("scp %s %s/* %s:%s" % (extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+        ret = subprocess.call("scp %s %s %s/* %s:%s" % (scp_port, extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
         if ret != 0:
             raise DevtoolError('Failed to copy script to %s - rerun with -s to '
                                 'get a complete error message' % args.target)
@@ -269,7 +285,7 @@ def undeploy(args, config, basepath, workspace):
         shutil.rmtree(tmpdir)
 
     # Now run the script
-    ret = subprocess.call('ssh %s %s \'sh %s %s\'' % (extraoptions, args.target, tmpscript, args.recipename), shell=True)
+    ret = subprocess.call('ssh %s %s %s \'sh %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename), shell=True)
     if ret != 0:
         raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
                            'error message')
@@ -292,6 +308,7 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-n', '--dry-run', help='List files to be deployed only', action='store_true')
     parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
+    parser_deploy.add_argument('-P', '--port', default='22', help='Port to use for connection to the target')
     parser_deploy.set_defaults(func=deploy)
 
     parser_undeploy = subparsers.add_parser('undeploy-target',
@@ -304,4 +321,5 @@ def register_commands(subparsers, context):
     parser_undeploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
     parser_undeploy.add_argument('-a', '--all', help='Undeploy all recipes deployed on the target', action='store_true')
     parser_undeploy.add_argument('-n', '--dry-run', help='List files to be undeployed only', action='store_true')
+    parser_undeploy.add_argument('-P', '--port', default='22', help='Port to use for connection to the target')
     parser_undeploy.set_defaults(func=undeploy)
-- 
2.7.4


