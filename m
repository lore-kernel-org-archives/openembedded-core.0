Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22CCE60557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 23:13:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2015 16:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,442,1432623600"; d="scan'208";a="759418283"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.155])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2015 16:13:31 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 18:15:43 -0500
Message-Id: <1436483743-22604-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] oe/recipeutils.py: get_recipe_upstream_version returns 1.0 when not SRC_URI
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
X-List-Received-Date: Thu, 09 Jul 2015 23:13:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recipes that don't have SRC_URI means that don't use upstream sources
so returns 1.0.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index d8094c8..22ee54d 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -667,8 +667,17 @@ def get_recipe_upstream_version(rd):
     ru['type'] = 'U'
     ru['datetime'] = ''
 
+    # XXX: If don't have SRC_URI means that don't have upstream sources so
+    # returns 1.0.
+    src_uris = rd.getVar('SRC_URI', True)
+    if not src_uris:
+        ru['version'] = '1.0'
+        ru['type'] = 'M'
+        ru['datetime'] = datetime.now()
+        return ru
+
     # XXX: we suppose that the first entry points to the upstream sources
-    src_uri = rd.getVar('SRC_URI', True).split()[0] 
+    src_uri = src_uris.split()[0]
     uri_type, _, _, _, _, _ =  decodeurl(src_uri)
 
     pv = rd.getVar('PV', True)
-- 
1.9.1


