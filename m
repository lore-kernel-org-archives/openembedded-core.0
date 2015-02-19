Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE42735BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425657"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:40:01 +0000
Message-Id: <c9a2c2d7395362fa3c813b4930829cf8eb4322e5.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/15] devtool: prevent extract/modify use with image recipes
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:33 -0000

There wouldn't be any point to using these with an image recipe, so
disallow it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 3a8c66c..9ab3aa6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -141,6 +141,10 @@ def _extract_source(srctree, keep_temp, devbranch, d):
         logger.error("The %s recipe uses a shared workdir which this tool does not currently support" % pn)
         return None
 
+    if bb.data.inherits_class('image', d):
+        logger.error("The %s recipe is an image, and therefore is not supported by this tool" % pn)
+        return None
+
     if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC', True):
         logger.error("externalsrc is currently enabled for the %s recipe. This prevents the normal do_patch task from working. You will need to disable this first." % pn)
         return None
@@ -290,6 +294,10 @@ def modify(args, config, basepath, workspace):
         return -1
     rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
 
+    if bb.data.inherits_class('image', rd):
+        logger.error("The %s recipe is an image, and therefore is not supported by this tool" % args.recipename)
+        return None
+
     initial_rev = None
     commits = []
     srctree = os.path.abspath(args.srctree)
-- 
1.9.3


