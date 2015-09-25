Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 791177703B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:41:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 25 Sep 2015 04:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,586,1437462000"; d="scan'208";a="812767174"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2015 04:41:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 14:41:37 +0300
Message-Id: <1443181297-22690-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443181297-22690-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1443181297-22690-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] recipeutils.py: don't hardcode the upstream version as 1.0 when SRC_URI is empty or absent
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
X-List-Received-Date: Fri, 25 Sep 2015 11:41:31 -0000

Instead, simply return the version of the recipe, so that the upstream
version checker will declare that they match.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 35b88d3..5fd5dcb 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -732,11 +732,14 @@ def get_recipe_upstream_version(rd):
     ru['type'] = 'U'
     ru['datetime'] = ''
 
+    pv = rd.getVar('PV', True)
+
     # XXX: If don't have SRC_URI means that don't have upstream sources so
-    # returns 1.0.
+    # returns the current recipe version, so that upstream version check
+    # declares a match.
     src_uris = rd.getVar('SRC_URI', True)
     if not src_uris:
-        ru['version'] = '1.0'
+        ru['version'] = pv
         ru['type'] = 'M'
         ru['datetime'] = datetime.now()
         return ru
@@ -745,8 +748,6 @@ def get_recipe_upstream_version(rd):
     src_uri = src_uris.split()[0]
     uri_type, _, _, _, _, _ =  decodeurl(src_uri)
 
-    pv = rd.getVar('PV', True)
-
     manual_upstream_version = rd.getVar("RECIPE_UPSTREAM_VERSION", True)
     if manual_upstream_version:
         # manual tracking of upstream version.
-- 
2.1.4


