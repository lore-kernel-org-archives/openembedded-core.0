Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8F878511
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171400995"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:05 +1300
Message-Id: <cbb9ebdac2b118685be4dd385453a4204e74493b.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/24] lib/oe/recipeutils: fix line splitting in patch_recipe_*
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:18 -0000

If a value was split over multiple lines (e.g. as SRC_URI usually is)
then we were inserting the value as one item in the lines list with
newlines between each line. There's nothing wrong with this if you're
writing the list out to a file, but if you want to generate a patch (as
patch_recipe_file() will do if the patch parameter is set to True) then
the diff output looks a bit odd. Split the value before adding it to the
lines list to resolve this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 2f818bc..cab8e40 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -188,6 +188,11 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
             for wrapline in wrapped[:-1]:
                 addlines.append('%s \\%s' % (wrapline, newline))
             addlines.append('%s%s' % (wrapped[-1], newline))
+
+        # Split on newlines - this isn't strictly necessary if you are only
+        # going to write the output to disk, but if you want to compare it
+        # (as patch_recipe_file() will do if patch=True) then it's important.
+        addlines = [line for l in addlines for line in l.splitlines(True)]
         if rewindcomments:
             # Ensure we insert the lines before any leading comments
             # (that we'd want to ensure remain leading the next value)
-- 
2.9.5


