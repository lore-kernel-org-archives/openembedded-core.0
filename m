Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D5E8773163
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:08:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565596"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:08:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:07 +1200
Message-Id: <48874d7612b3b85ab8794541e60d621d52bc53e0.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/10] recipetool: create: fix error with git tree and no network
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
X-List-Received-Date: Sun, 18 Sep 2016 20:08:55 -0000

When creating a recipe for an existing local git clone, we attempt to
use the fetcher to determine if it supports the SRCREV variable.
Unfortunately running this code does a network check to get the latest
revision as a direct result of us using '${AUTOREV}' as a default value.
If you don't have a network connection this will of course fail. Rather
than have this block creating the recipe, catch the exception and just
guess from the URL.

Ultimately this should probably be fixed in the fetcher but for now this
will at least resolve the issue on this end.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f7b0676..f8701d4 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -336,10 +336,16 @@ def supports_srcrev(uri):
     # odd interactions with the urldata cache which lead to errors
     localdata.setVar('SRCREV', '${AUTOREV}')
     bb.data.update_data(localdata)
-    fetcher = bb.fetch2.Fetch([uri], localdata)
-    urldata = fetcher.ud
-    for u in urldata:
-        if urldata[u].method.supports_srcrev():
+    try:
+        fetcher = bb.fetch2.Fetch([uri], localdata)
+        urldata = fetcher.ud
+        for u in urldata:
+            if urldata[u].method.supports_srcrev():
+                return True
+    except bb.fetch2.FetchError as e:
+        logger.debug('FetchError in supports_srcrev: %s' % str(e))
+        # Fall back to basic check
+        if uri.startswith(('git://', 'gitsm://')):
             return True
     return False
 
-- 
2.5.5


