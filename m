Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7013C7680E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:41:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 25 Sep 2015 04:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,586,1437462000"; d="scan'208";a="812767155"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2015 04:41:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 14:41:36 +0300
Message-Id: <1443181297-22690-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] distrodata: handle recipes with empty or absent SRC_URI in checkpkg()
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
X-List-Received-Date: Fri, 25 Sep 2015 11:41:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 4168e43..e6eb3f3 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -272,9 +272,10 @@ python do_checkpkg() {
 
         """first check whether a uri is provided"""
         src_uri = d.getVar('SRC_URI', True)
-        if not src_uri:
-                return
-        uri_type, _, _, _, _, _ = decodeurl(src_uri)
+        if src_uri:
+            uri_type, _, _, _, _, _ = decodeurl(src_uri)
+        else:
+            uri_type = "none"
 
         """initialize log files."""
         logpath = d.getVar('LOG_DIR', True)
@@ -354,7 +355,10 @@ python do_checkpkg() {
             elif cmp == 0:
                 pstatus = "MATCH"
 
-        psrcuri = psrcuri.split()[0]
+        if psrcuri:
+            psrcuri = psrcuri.split()[0]
+        else:
+            psrcuri = "none"
         pdepends = "".join(pdepends.split("\t"))
         pdesc = "".join(pdesc.split("\t"))
         no_upgr_reason = d.getVar('RECIPE_NO_UPDATE_REASON', True)
-- 
2.1.4


