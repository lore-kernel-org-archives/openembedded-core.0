Return-Path: <amanda.r.brindle@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 26C48788E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 21:06:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 14:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,312,1517904000"; d="scan'208";a="42396708"
Received: from aurora.jf.intel.com ([10.7.198.68])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2018 14:06:46 -0700
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 14:06:38 -0700
Message-Id: <5080f08ec9b3ebae4d463a09846fa2376f181814.1521142023.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521142023.git.amanda.r.brindle@intel.com>
References: <cover.1521142023.git.amanda.r.brindle@intel.com>
Cc: Amanda Brindle <amanda.r.brindle@intel.com>, stephano.cetola@intel.com
Subject: [PATCH 1/1] buildhistory_analysis.py: Check if RPROVIDES changed order
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
X-List-Received-Date: Thu, 15 Mar 2018 21:06:50 -0000

Instead of assuming order has changed if no package has been added or
removed, loop through packages to check if order has changed. This will
prevent the script from falsely reporting "changed order" if a version
has increased.

Fixes [YOCTO #12334]

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index bf2a9d3..b0365ab 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -117,6 +117,7 @@ class ChangeRecord:
 
         if self.fieldname in list_fields or self.fieldname in list_order_fields:
             renamed_dirs = []
+            changed_order = False
             if self.fieldname in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                 (depvera, depverb) = compare_pkg_lists(self.oldvalue, self.newvalue)
                 aitems = pkglist_combine(depvera)
@@ -130,6 +131,14 @@ class ChangeRecord:
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
 
+            if not removed and not added:
+                depvera = bb.utils.explode_dep_versions2(self.oldvalue, sort=False)
+                depverb = bb.utils.explode_dep_versions2(self.newvalue, sort=False)
+                for i, j in zip(depvera.items(), depverb.items()):
+                    if i[0] != j[0]:
+                        changed_order = True
+                        break
+
             lines = []
             if renamed_dirs:
                 for dfrom, dto in renamed_dirs:
@@ -145,7 +154,10 @@ class ChangeRecord:
             else:
                 lines.append('changed order')
 
-            out = '%s: %s' % (self.fieldname, ', '.join(lines))
+            if not (removed or added or changed_order):
+                out = ''
+            else:
+                out = '%s: %s' % (self.fieldname, ', '.join(lines))
 
         elif self.fieldname in numeric_fields:
             aval = int(self.oldvalue or 0)
-- 
2.7.4


