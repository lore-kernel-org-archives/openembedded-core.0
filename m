Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0388673922
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778233"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:56 +0000
Message-Id: <c3844f02747556447906ccedf27982035c01204d.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/16] devtool: deploy-target: add dry-run option
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:15 -0000

Add a dry-run option to the deploy-target and undeploy-target
subcommands so you can see the list of files to be deployed or
un-deployed before actually carrying out the operation.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index c152ac0..f016b23 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -49,6 +49,13 @@ def deploy(args, config, basepath, workspace):
         logger.error('No files to deploy - have you built the %s recipe? If so, the install step has not installed any files.' % args.recipename)
         return -1
 
+    if args.dry_run:
+        print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
+        for root, dirs, files in os.walk(recipe_outdir):
+            for fn in files:
+                print('  %s' % os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn))
+        return 0
+
     if os.path.exists(deploy_file):
         if undeploy(args, config, basepath, workspace):
             # Error already shown
@@ -87,6 +94,13 @@ def undeploy(args, config, basepath, workspace):
          logger.error('%s has not been deployed' % args.recipename)
          return -1
 
+    if args.dry_run:
+        print('Previously deployed files to be un-deployed for %s on target %s:' % (args.recipename, args.target))
+        with open(deploy_file, 'r') as f:
+            for line in f:
+                print('  %s' % line.rstrip())
+        return 0
+
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
@@ -114,6 +128,7 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
     parser_deploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_deploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
+    parser_deploy.add_argument('-n', '--dry-run', help='List files to be deployed only', action='store_true')
     parser_deploy.set_defaults(func=deploy)
 
     parser_undeploy = subparsers.add_parser('undeploy-target', help='Undeploy recipe output files in live target machine')
@@ -121,4 +136,5 @@ def register_commands(subparsers, context):
     parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
     parser_undeploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_undeploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
+    parser_undeploy.add_argument('-n', '--dry-run', help='List files to be undeployed only', action='store_true')
     parser_undeploy.set_defaults(func=undeploy)
-- 
1.9.3


