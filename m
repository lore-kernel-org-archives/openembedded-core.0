Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7910F77011
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520281"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:21:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:26 +0100
Message-Id: <821e8ab357d1a7f4f39f230cbf3085ed2e1ae96f.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/27] devtool / lib/oe/recipeutils: ensure we can parse without bbappends
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:13 -0000

These functions ostensibly allowed parsing a recipe without bbappends
but this clearly hadn't been tested because a variable was unassigned in
both of them in that case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py      | 2 ++
 scripts/lib/devtool/__init__.py | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 190ac3a..35b88d3 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -72,6 +72,8 @@ def parse_recipe_simple(cooker, pn, d, appends=True):
             raise bb.providers.NoProvider('Unable to find any recipe file matching %s' % pn)
     if appends:
         appendfiles = cooker.collection.get_file_appends(recipefile)
+    else:
+        appendfiles = None
     return parse_recipe(recipefile, appendfiles, d)
 
 
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index fb699b5..3ea3802 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -134,6 +134,8 @@ def parse_recipe(config, tinfoil, pn, appends):
         # Filter out appends from the workspace
         append_files = [path for path in append_files if
                         not path.startswith(config.workspace_path)]
+    else:
+        append_files = None
     return oe.recipeutils.parse_recipe(recipefile, append_files,
                                        tinfoil.config_data)
 
-- 
2.1.0


