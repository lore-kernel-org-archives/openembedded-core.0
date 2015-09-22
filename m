Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D333F77030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520467"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:34 +0100
Message-Id: <5a79c3463ff2072ba4755cc80f5a593409189e2a.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 20/27] devtool: add: move important "recipe created" message to the end
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:19 -0000

If we end up printing a message about the build directory being the same
as the source, we should print that first and then print the message
about the recipe file possibly needing to be edited to the end so that
it has slightly more impact.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4a05c1d..c254132 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -96,7 +96,6 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' -V %s' % args.version
     try:
         stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
-        logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
     except bb.process.ExecutionError as e:
         raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
@@ -128,6 +127,8 @@ def add(args, config, basepath, workspace):
 
     _add_md5(config, args.recipename, appendfile)
 
+    logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
+
     tinfoil.shutdown()
 
     return 0
-- 
2.1.0


