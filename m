Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 171697646B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407666"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:55 +0300
Message-Id: <d5aebc938a52fee3ca99f2cb0061cbb40cef5200.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/26] distrodata.bbclass: drop the manual upstream version check logic
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:43 -0000

It's already taken care of in meta/lib/oe/recipeutils.py

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index d33187b..7cb7736 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -347,23 +347,6 @@ python do_checkpkg() {
             elif cmp == 0:
                 pstatus = "MATCH"
 
-        """Read from manual distro tracking fields as alternative"""
-        pmver = d.getVar("RECIPE_UPSTREAM_VERSION", True)
-        if not pmver:
-            pmver = "N/A"
-            pmstatus = "ErrNoRecipeData"
-        else:
-            mpv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pmver, uri_type)
-            upv, _, _ = oe.recipeutils.get_recipe_pv_without_srcpv(pupver, uri_type)
-
-            cmp = vercmp_string(mpv, upv)
-            if cmp == -1:
-                pmstatus = "UPDATE"
-            elif cmp == 0:
-                pmstatus = "MATCH"
-            else:
-                pmstatus = ""
-
         psrcuri = psrcuri.split()[0]
         pdepends = "".join(pdepends.split("\t"))
         pdesc = "".join(pdesc.split("\t"))
@@ -372,7 +355,7 @@ python do_checkpkg() {
         with open(logfile, "a") as f:
             writer = csv.writer(f, delimiter='\t')
             writer.writerow([pname, pversion, pupver, plicense, psection, phome, 
-                prelease, pdepends, pbugtracker, ppe, pdesc, pstatus, pmver, 
+                prelease, pdepends, pbugtracker, ppe, pdesc, pstatus, pupver,
                 psrcuri, maintainer, no_upgr_reason])
             f.close()
         bb.utils.unlockfile(lf)
-- 
2.1.4


