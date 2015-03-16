Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0C57391C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778173"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:52 +0000
Message-Id: <0224699d7acbb55bfc2163c359aa60750b66a190.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/16] devtool: deploy-target: allow disabling host key checking
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:12 -0000

If you're testing with multiple images/devices that have the same IP
address / hostname then it can be annoying to deal with host key
mismatches all of the time. As a MITM attack is unlikely in the local
test environment, provide a command line option to pass the appropriate
options to scp/ssh to disable the host key checking.

Note: if you wish to apply this permanently, the best way is to do it
through your ssh configuration e.g. by adding the following to your
~/.ssh/config:

Host 192.168.7.2
   UserKnownHostsFile=/dev/null
   StrictHostKeyChecking no

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 896b618..d232d31 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -1,6 +1,6 @@
 # Development tool - deploy/undeploy command plugin
 #
-# Copyright (C) 2014 Intel Corporation
+# Copyright (C) 2014-2015 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -50,7 +50,10 @@ def deploy(args, config, basepath, workspace):
 
     stdout, stderr = exec_build_env_command(config.init_path, basepath, 'bitbake -e %s' % args.recipename, shell=True)
     recipe_outdir = re.search(r'^D="(.*)"', stdout, re.MULTILINE).group(1)
-    ret = subprocess.call('scp -qr %s/* %s:%s' % (recipe_outdir, args.target, destdir), shell=True)
+    extraoptions = ''
+    if args.no_host_check:
+        extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+    ret = subprocess.call('scp -qr %s %s/* %s:%s' % (extraoptions, recipe_outdir, args.target, destdir), shell=True)
     if ret != 0:
         return ret
 
@@ -77,12 +80,16 @@ def undeploy(args, config, basepath, workspace):
          logger.error('%s has not been deployed' % args.recipename)
          return -1
 
-    ret = subprocess.call("scp -q %s %s:/tmp" % (deploy_file, args.target), shell=True)
+    extraoptions = ''
+    if args.no_host_check:
+        extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+
+    ret = subprocess.call("scp -q %s %s %s:/tmp" % (extraoptions, deploy_file, args.target), shell=True)
     if ret != 0:
         logger.error('Failed to copy %s to %s' % (deploy, args.target))
         return -1
 
-    ret = subprocess.call("ssh %s 'xargs -n1 rm -f </tmp/%s'" % (args.target, os.path.basename(deploy_file)), shell=True)
+    ret = subprocess.call("ssh %s %s 'xargs -n1 rm -f </tmp/%s'" % (extraoptions, args.target, os.path.basename(deploy_file)), shell=True)
     if ret == 0:
         logger.info('Successfully undeployed %s' % args.recipename)
         os.remove(deploy_file)
@@ -94,9 +101,11 @@ def register_commands(subparsers, context):
     parser_deploy = subparsers.add_parser('deploy-target', help='Deploy recipe output files to live target machine')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
+    parser_deploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_deploy.set_defaults(func=deploy)
 
     parser_undeploy = subparsers.add_parser('undeploy-target', help='Undeploy recipe output files in live target machine')
     parser_undeploy.add_argument('recipename', help='Recipe to undeploy')
     parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
+    parser_undeploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_undeploy.set_defaults(func=undeploy)
-- 
1.9.3


