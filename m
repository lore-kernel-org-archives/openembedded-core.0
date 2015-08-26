Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 20A5376DC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:17:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="776041416"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 07:17:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:17:18 +0100
Message-Id: <09068165771ebdfde43d13b08e757e49c3e56750.1440598330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/8] classes/buildhistory: handle additional files at recipe level
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
X-List-Received-Date: Wed, 26 Aug 2015 14:17:46 -0000

Avoid an error when attempting to remove previous data if it's not a
subdirectory - we were assuming that anything that wasn't named "latest"
or "latest_srcrev" had to be a directory. This makes it possible to have
a buildhistory_emit_pkghistory_append which writes additional files at
the recipe level.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 190c38e..57dc1e9 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -172,10 +172,13 @@ python buildhistory_emit_pkghistory() {
         for item in os.listdir(pkghistdir):
             if item != "latest" and item != "latest_srcrev":
                 if item not in packagelist:
-                    subdir = os.path.join(pkghistdir, item)
-                    for subfile in os.listdir(subdir):
-                        os.unlink(os.path.join(subdir, subfile))
-                    os.rmdir(subdir)
+                    itempath = os.path.join(pkghistdir, item)
+                    if os.path.isdir(itempath):
+                        for subfile in os.listdir(itempath):
+                            os.unlink(os.path.join(itempath, subfile))
+                        os.rmdir(itempath)
+                    else:
+                        os.unlink(itempath)
 
     rcpinfo = RecipeInfo(pn)
     rcpinfo.pe = pe
-- 
2.1.0


