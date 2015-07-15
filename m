Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AB99375EFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 00:33:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jul 2015 17:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,476,1432623600"; d="scan'208";a="764566114"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.5.54])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2015 17:33:13 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 19:33:10 -0500
Message-Id: <1436920390-32074-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436920390-32074-1-git-send-email-anibal.limon@linux.intel.com>
References: <1436920390-32074-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] recipeutils.py: get_recipe_pv_without_srcpv remove prefixes from pv
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
X-List-Received-Date: Wed, 15 Jul 2015 00:33:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some recipes uses v or r prefixes in versions that makes wrong
comparisions over recipes like lz4 r123 > 128.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index f3da864..90dfba2 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -644,6 +644,12 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
             pv = m.group('ver')
             pfx = m.group('pfx')
             sfx = m.group('sfx')
+    else:
+        regex = re.compile("(?P<pfx>(v|r|))(?P<ver>((\d+[\.\-_]*)+))")
+        m = regex.match(pv)
+        if m:
+            pv = m.group('ver')
+            pfx = m.group('pfx')
 
     return (pv, pfx, sfx)
 
-- 
1.9.1


