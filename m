Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7729A72912
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244407"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:56 +0000
Message-Id: <19678636987fdbed3b16eea35652f00a12c19ac0.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/15] scripts/devtool: Support deploy/undeploy function
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
X-List-Received-Date: Fri, 19 Dec 2014 11:42:19 -0000

From: Junchun Guan <junchunx.guan@intel.com>

Deploy recipe output files to live target machine using scp
Store the files list and target machine info in localhost if deployment
is done
Undeploy recipe output files in target machine using the previous
deployment info

[YOCTO #6654]

Signed-off-by: Junchun Guan <junchunx.guan@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 100 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 scripts/lib/devtool/deploy.py

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
new file mode 100644
index 0000000..bd23e95
--- /dev/null
+++ b/scripts/lib/devtool/deploy.py
@@ -0,0 +1,100 @@
+# Development tool - deploy/undeploy command plugin
+#
+# Copyright (C) 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import os
+import subprocess
+import logging
+from devtool import exec_build_env_command
+
+logger = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    pass
+
+
+def deploy(args, config, basepath, workspace):
+    import re
+    from devtool import exec_build_env_command
+
+    if not args.recipename in workspace:
+        logger.error("no recipe named %s in your workspace" % args.recipename)
+        return -1
+    try:
+        host, destdir = args.target.split(':')
+    except ValueError:
+        destdir = '/'
+    else:
+        args.target = host
+
+    deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
+    deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
+
+    if os.path.exists(deploy_file):
+        undeploy(args)
+
+    stdout, stderr = exec_build_env_command(config.init_path, basepath, 'bitbake -e %s' % args.recipename, shell=True)
+    recipe_outdir = re.search(r'^D="(.*)"', stdout, re.MULTILINE).group(1)
+    ret = subprocess.call('scp -qr %s/* %s:%s' % (recipe_outdir, args.target, destdir), shell=True)
+    if ret != 0:
+        return ret
+
+    logger.info('Successfully deployed %s' % recipe_outdir)
+
+    if not os.path.exists(deploy_dir):
+        os.makedirs(deploy_dir)
+
+    files_list = []
+    for root, _, files in os.walk(recipe_outdir):
+        for filename in files:
+            filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
+            files_list.append(os.path.join(destdir, filename))
+
+    with open(deploy_file, 'w') as fobj:
+        fobj.write('\n'.join(files_list))
+
+    return 0
+
+def undeploy(args, config, basepath, workspace):
+
+    deploy_file = os.path.join(basepath, 'target_deploy', args.target, args.recipename + '.list')
+    if not os.path.exists(deploy_file):
+         logger.error('%s has not been deployed' % args.recipename)
+         return -1
+
+    ret = subprocess.call("scp -q %s %s:/tmp" % (deploy_file, args.target), shell=True)
+    if ret != 0:
+        logger.error('Failed to copy %s to %s' % (deploy, args.target))
+        return -1
+
+    ret = subprocess.call("ssh %s 'xargs -n1 rm -f </tmp/%s'" % (args.target, os.path.basename(deploy_file)), shell=True)
+    if ret == 0:
+        logger.info('Successfully undeployed %s' % args.recipename)
+        os.remove(deploy_file)
+
+    return ret
+
+
+def register_commands(subparsers, context):
+    parser_deploy = subparsers.add_parser('deploy-target', help='Deploy recipe output files to live target machine')
+    parser_deploy.add_argument('recipename', help='Recipe to deploy')
+    parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
+    parser_deploy.set_defaults(func=deploy)
+
+    parser_undeploy = subparsers.add_parser('undeploy-target', help='Undeploy recipe output files in live target machine')
+    parser_undeploy.add_argument('recipename', help='Recipe to undeploy')
+    parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
+    parser_undeploy.set_defaults(func=undeploy)
-- 
1.9.3


