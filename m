Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1996AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778190"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:54 +0000
Message-Id: <ca8f66a5fda96a3da5c55ee15493b0a1fead19f6.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/16] devtool: deploy-target: add an option to disable quiet mode
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:13 -0000

The -q option to scp does stop the progress being shown, which is mostly
superfluous, however it also stops errors from ssh being shown - if
there's a problem, you'll just get "lost connection" which really isn't
that helpful. As a compromise, add a -s/--show-status option and
advertise this when the command fails.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 68edb98..c152ac0 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -57,8 +57,11 @@ def deploy(args, config, basepath, workspace):
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-    ret = subprocess.call('scp -qr %s %s/* %s:%s' % (extraoptions, recipe_outdir, args.target, destdir), shell=True)
+    if not args.show_status:
+        extraoptions += ' -q'
+    ret = subprocess.call('scp -r %s %s/* %s:%s' % (extraoptions, recipe_outdir, args.target, destdir), shell=True)
     if ret != 0:
+        logger.error('Deploy failed - rerun with -s to get a complete error message')
         return ret
 
     logger.info('Successfully deployed %s' % recipe_outdir)
@@ -87,16 +90,20 @@ def undeploy(args, config, basepath, workspace):
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+    if not args.show_status:
+        extraoptions += ' -q'
 
-    ret = subprocess.call("scp -q %s %s %s:/tmp" % (extraoptions, deploy_file, args.target), shell=True)
+    ret = subprocess.call("scp %s %s %s:/tmp" % (extraoptions, deploy_file, args.target), shell=True)
     if ret != 0:
-        logger.error('Failed to copy %s to %s' % (deploy, args.target))
+        logger.error('Failed to copy file list to %s - rerun with -s to get a complete error message' % args.target)
         return -1
 
     ret = subprocess.call("ssh %s %s 'xargs -n1 rm -f </tmp/%s'" % (extraoptions, args.target, os.path.basename(deploy_file)), shell=True)
     if ret == 0:
         logger.info('Successfully undeployed %s' % args.recipename)
         os.remove(deploy_file)
+    else:
+        logger.error('Undeploy failed - rerun with -s to get a complete error message')
 
     return ret
 
@@ -106,10 +113,12 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
     parser_deploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
+    parser_deploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
     parser_deploy.set_defaults(func=deploy)
 
     parser_undeploy = subparsers.add_parser('undeploy-target', help='Undeploy recipe output files in live target machine')
     parser_undeploy.add_argument('recipename', help='Recipe to undeploy')
     parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
     parser_undeploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
+    parser_undeploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
     parser_undeploy.set_defaults(func=undeploy)
-- 
1.9.3


