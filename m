Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 15F7171985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:09:57 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885742"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:09:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:33 +1300
Message-Id: <615762b598698eb60b6ab47cd9b5928b1ccd92b7.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/14] lib/oe/recipeutils: use cooker function instead of bb.providers
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
X-List-Received-Date: Tue, 13 Dec 2016 07:09:57 -0000

We now have a function in cooker itself that can do this lookup;
additionally, the rewritten tinfoil's cooker adapter has its own
implementation that can work remotely, so if we use it then this
function can work in that scenario as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 1589feb..ae83aab 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -29,18 +29,9 @@ meta_vars = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION']
 
 def pn_to_recipe(cooker, pn, mc=''):
     """Convert a recipe name (PN) to the path to the recipe file"""
-    import bb.providers
 
-    if pn in cooker.recipecaches[mc].pkg_pn:
-        best = bb.providers.findBestProvider(pn, cooker.data, cooker.recipecaches[mc], cooker.recipecaches[mc].pkg_pn)
-        return best[3]
-    elif pn in cooker.recipecaches[mc].providers:
-        filenames = cooker.recipecaches[mc].providers[pn]
-        eligible, foundUnique = bb.providers.filterProviders(filenames, pn, cooker.expanded_data, cooker.recipecaches[mc])
-        filename = eligible[0]
-        return filename
-    else:
-        return None
+    best = cooker.findBestProvider(pn, mc)
+    return best[3]
 
 
 def get_unavailable_reasons(cooker, pn):
-- 
2.5.5


