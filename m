Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 92B676E667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:47:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jul 2016 01:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,418,1464678000"; d="scan'208";a="739333518"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.139.129])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2016 01:47:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2016 20:47:17 +1200
Message-Id: <6e980bf908d294687167afc3e0b3cbf44255dbfb.1469436396.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469436396.git.paul.eggleton@linux.intel.com>
References: <cover.1469436396.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469436396.git.paul.eggleton@linux.intel.com>
References: <cover.1469436396.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] lib/oe/recipeutils: fix patch_recipe*() with empty input
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
X-List-Received-Date: Mon, 25 Jul 2016 08:47:32 -0000

If you supplied an empty file to patch_recipe() (or an empty list to
patch_recipe_lines()) then the result was IndexError because the code
checking to see if it needed to add an extra line of padding didn't
check to see if there were in fact any lines before trying to access the
last line.

Fixes [YOCTO #9972].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 0e7abf8..c77664f 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -259,7 +259,7 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
     changed, tolines = bb.utils.edit_metadata(fromlines, varlist, patch_recipe_varfunc, match_overrides=True)
 
     if remainingnames:
-        if tolines[-1].strip() != '':
+        if tolines and tolines[-1].strip() != '':
             tolines.append('\n')
         for k in remainingnames.keys():
             outputvalue(k, tolines)
-- 
2.5.5


