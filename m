Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 19E0476BD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537269"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:13 +0100
Message-Id: <d1d9c23dcdf4156c538bf028321f6c616ae20bed.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/9] devtool: update-recipe: add a warning when recipe is inside the workspace
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:43 -0000

If a recipe has been added to the workspace via "devtool add"
or "devtool upgrade" then the recipe file itself will be in the
workspace layer; if you run "devtool update-recipe" particularly in the
upgrade case you might think it would apply the upgrade to the original
recipe, but it will not - in order to remain consistent it has to update
the recipe that's in use which is the one in the workspace. Warn the
user in this situation so that they know what they need to do when they
are finished.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c398e4c..4ae41cf 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -815,6 +815,10 @@ def update_recipe(args, config, basepath, workspace):
     else:
         raise DevtoolError('update_recipe: invalid mode %s' % mode)
 
+    rf = rd.getVar('FILE', True)
+    if rf.startswith(config.workspace_path):
+        logger.warn('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
+
     return 0
 
 
-- 
2.1.0


