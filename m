Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B4F4B71C00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:24 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885905"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:42 +1300
Message-Id: <6ec1ec6a4284820f7d7086a9b801d73dc370075d.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/14] lib/oe/recipeutils: drop parse_recipe_simple()
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:24 -0000

This was intended to be used with tinfoil, but tinfoil now has its own
parse_recipe() method to do this which works properly in the memres
case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 92fa431..26c926f 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -52,28 +52,6 @@ def parse_recipe(cooker, fn, appendfiles):
     return envdata
 
 
-def parse_recipe_simple(cooker, pn, d, appends=True):
-    """
-    Parse a recipe and optionally all bbappends that apply to it
-    in the current configuration.
-    """
-    import bb.providers
-
-    recipefile = pn_to_recipe(cooker, pn)
-    if not recipefile:
-        skipreasons = get_unavailable_reasons(cooker, pn)
-        # We may as well re-use bb.providers.NoProvider here
-        if skipreasons:
-            raise bb.providers.NoProvider(skipreasons)
-        else:
-            raise bb.providers.NoProvider('Unable to find any recipe file matching %s' % pn)
-    if appends:
-        appendfiles = cooker.collection.get_file_appends(recipefile)
-    else:
-        appendfiles = None
-    return parse_recipe(cooker, recipefile, appendfiles)
-
-
 def get_var_files(fn, varlist, d):
     """Find the file in which each of a list of variables is set.
     Note: requires variable history to be enabled when parsing.
-- 
2.5.5


