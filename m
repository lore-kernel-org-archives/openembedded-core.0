Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2531B605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213396"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:27 +1300
Message-Id: <ab97c8ac06fb2702c37c5a950665817ebbc49627.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/18] devtool: package: use DEPLOY_DIR_<pkgtype> to get deploy directory
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:08 -0000

Rather than reconstructing the output path for packages, use the proper
variable.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/package.py | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index b8d8423..53d3dc7 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -32,14 +32,17 @@ def package(args, config, basepath, workspace):
     """Entry point for the devtool 'package' subcommand"""
     check_workspace_recipe(workspace, args.recipename)
 
-    image_pkgtype = config.get('Package', 'image_pkgtype', '')
-    if not image_pkgtype:
-        tinfoil = setup_tinfoil(basepath=basepath)
-        try:
-            tinfoil.prepare(config_only=True)
+    tinfoil = setup_tinfoil(basepath=basepath)
+    try:
+        tinfoil.prepare(config_only=True)
+
+        image_pkgtype = config.get('Package', 'image_pkgtype', '')
+        if not image_pkgtype:
             image_pkgtype = tinfoil.config_data.getVar('IMAGE_PKGTYPE', True)
-        finally:
-            tinfoil.shutdown()
+
+        deploy_dir_pkg = tinfoil.config_data.getVar('DEPLOY_DIR_%s' % image_pkgtype.upper(), True)
+    finally:
+        tinfoil.shutdown()
 
     package_task = config.get('Package', 'package_task', 'package_write_%s' % image_pkgtype)
     try:
@@ -47,7 +50,8 @@ def package(args, config, basepath, workspace):
     except bb.process.ExecutionError as e:
         # We've already seen the output since watch=True, so just ensure we return something to the user
         return e.exitcode
-    logger.info('Your packages are in %s/tmp/deploy/%s' % (basepath, image_pkgtype))
+
+    logger.info('Your packages are in %s' % deploy_dir_pkg)
 
     return 0
 
-- 
2.1.0


