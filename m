Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58F2660124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 17:02:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2015 09:02:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844321668"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 09:02:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 17:01:42 +0000
Message-Id: <ed263aa890ef831e0dcac7668c8988f91577ee4f.1446829227.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446829227.git.paul.eggleton@linux.intel.com>
References: <cover.1446829227.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446829227.git.paul.eggleton@linux.intel.com>
References: <cover.1446829227.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] verify-homepage: fix recipe file selection
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
X-List-Received-Date: Fri, 06 Nov 2015 17:02:00 -0000

* We need to check all recipe files, not just the preferred ones
  (i.e. we have multiple recipes for different versions of the same
  piece of software). Print the recipe file name (without path) so we
  can tell the difference between them.
* We can skip BBCLASSEXTENDed variants of recipes

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/verify-homepage.py | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 522824b..265ff65 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -36,15 +36,21 @@ def verifyHomepage(bbhandler):
     pkg_pn = bbhandler.cooker.recipecache.pkg_pn
     pnlist = sorted(pkg_pn)
     count = 0
+    checked = []
     for pn in pnlist:
-        fn = pkg_pn[pn].pop()
-        data = bb.cache.Cache.loadDataFull(fn, bbhandler.cooker.collection.get_file_appends(fn), bbhandler.config_data)
-        homepage = data.getVar("HOMEPAGE", True)
-        if homepage:
-            try:
-                urllib2.urlopen(homepage, timeout=5)
-            except Exception:
-                count = count + wgetHomepage(pn, homepage)
+        for fn in pkg_pn[pn]:
+            # There's no point checking multiple BBCLASSEXTENDed variants of the same recipe
+            realfn, _ = bb.cache.Cache.virtualfn2realfn(fn)
+            if realfn in checked:
+                continue
+            data = bb.cache.Cache.loadDataFull(realfn, bbhandler.cooker.collection.get_file_appends(realfn), bbhandler.config_data)
+            homepage = data.getVar("HOMEPAGE", True)
+            if homepage:
+                try:
+                    urllib2.urlopen(homepage, timeout=5)
+                except Exception:
+                    count = count + wgetHomepage(os.path.basename(realfn), homepage)
+            checked.append(realfn)
     return count
 
 if __name__=='__main__':
-- 
2.1.0


