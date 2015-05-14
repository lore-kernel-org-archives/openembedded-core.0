Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 259C76013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963905"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:45:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:06 +0100
Message-Id: <03dadb132ba4918d89ecc2e5cede18d833afb75a.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/9] devtool: rename unused variables
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
X-List-Received-Date: Thu, 14 May 2015 17:45:53 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/deploy.py   | 4 ++--
 scripts/lib/devtool/standard.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index e46ee05..4f968c6 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -42,7 +42,7 @@ def deploy(args, config, basepath, workspace):
     deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
     deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
 
-    stdout, stderr = exec_build_env_command(config.init_path, basepath, 'bitbake -e %s' % args.recipename, shell=True)
+    stdout, _ = exec_build_env_command(config.init_path, basepath, 'bitbake -e %s' % args.recipename, shell=True)
     recipe_outdir = re.search(r'^D="(.*)"', stdout, re.MULTILINE).group(1)
     if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
         logger.error('No files to deploy - have you built the %s recipe? If so, the install step has not installed any files.' % args.recipename)
@@ -50,7 +50,7 @@ def deploy(args, config, basepath, workspace):
 
     if args.dry_run:
         print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
-        for root, dirs, files in os.walk(recipe_outdir):
+        for root, _, files in os.walk(recipe_outdir):
             for fn in files:
                 print('  %s' % os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn))
         return 0
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 3e7b54e..a9dd3b2 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -94,7 +94,7 @@ def add(args, config, basepath, workspace):
         source = srctree
     if args.version:
         extracmdopts += ' -V %s' % args.version
-    stdout, stderr = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
+    stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
     logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
 
     _add_md5(config, args.recipename, recipefile)
-- 
2.1.0


