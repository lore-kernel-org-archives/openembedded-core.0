Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 31D67736E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 15:16:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2015 07:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,645,1418112000"; d="scan'208";a="683260405"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2015 07:15:54 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 17:15:46 +0200
Message-Id: <84f2bc2ad049dd54b4bc62f8810de014ff223f6b.1424877305.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424877305.git.cristian.iorga@intel.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424877305.git.cristian.iorga@intel.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] meta/lib/oe/utils.py: properly implement both_contain()
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
X-List-Received-Date: Wed, 25 Feb 2015 15:16:18 -0000

oe.utils.both_contain() just does a find() on the value
rather than splitting the value and then looking in the
list of split items. The result is that if you add a
feature to MACHINE_FEATURES that itself has a substring
that matches one of the values looked for when building
COMBINED_FEATURES, you end up with an incomprehensible
error (here with "ext2i" in MACHINE_FEATURES):

ERROR: Nothing RPROVIDES 'packagegroup-base-ext2'
(but /home/balister/src/oe-core/oe-core/meta/recipes-core/
/packagegroups/packagegroup-base.bb RDEPENDS on or otherwise requires it)

Fix [YOCTO #6888].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/lib/oe/utils.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 1f84ba4..bedade2 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -42,7 +42,15 @@ def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
         return falsevalue
 
 def both_contain(variable1, variable2, checkvalue, d):
-    if d.getVar(variable1,1).find(checkvalue) != -1 and d.getVar(variable2,1).find(checkvalue) != -1:
+    val1 = d.getVar(variable1, True)
+    val2 = d.getVar(variable2, True)
+    val1 = set(val1.split())
+    val2 = set(val2.split())
+    if isinstance(checkvalue, basestring):
+        checkvalue = set(checkvalue.split())
+    else:
+        checkvalue = set(checkvalue)
+    if checkvalue.issubset(val1) and checkvalue.issubset(val2):
         return checkvalue
     else:
         return ""
-- 
2.1.0


