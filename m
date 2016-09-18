Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 65B5B6FFED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:09:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565681"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:09:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:13 +1200
Message-Id: <18a6cbdd7dfdc478ad5199491c3a29033e6d99d6.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/10] devtool: add: drop superfluous validation for recipe name
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
X-List-Received-Date: Sun, 18 Sep 2016 20:09:08 -0000

Now that recipeutils.validate_pn() properly validates characters used in
the name, we can drop this bit checking for '/' since that's not
permitted by validate_pn(). (The FIXME comment here - that I myself
apparently wrote - is questionable since that function was clearly never
intended to allow '/', perhaps I was misled because it was broken and
did so).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index abbc0cb..8319145 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -85,10 +85,6 @@ def add(args, config, basepath, workspace):
         if reason:
             raise DevtoolError(reason)
 
-        # FIXME this ought to be in validate_pn but we're using that in other contexts
-        if '/' in args.recipename:
-            raise DevtoolError('"/" is not a valid character in recipe names')
-
     if args.srctree:
         srctree = os.path.abspath(args.srctree)
         srctreeparent = None
-- 
2.5.5


