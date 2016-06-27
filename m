Return-Path: <william.c.randle@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE50606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 15:56:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jun 2016 08:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,537,1459839600"; d="scan'208";a="836022613"
Received: from wcrandle-mobl1.amr.corp.intel.com (HELO
	wcrandle-mobl1.jf.intel.com) ([10.7.199.59])
	by orsmga003.jf.intel.com with ESMTP; 27 Jun 2016 08:56:09 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jun 2016 08:56:06 -0700
Message-Id: <1467042966-4127-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] keep platform_extra and default_platform_extra lists ordered
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
X-List-Received-Date: Mon, 27 Jun 2016 15:56:10 -0000

In RpmPM:insert_feeds_uris, the paths are kept in sets, which are unordered,
but they are later used to set the priority for the Smart channels, so
unexpected results could occur. Change the sets to lists and use the same
code as in create_configs() to add items to the list, reather than the set
operators.

[YOCTO #9717]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/lib/oe/package_manager.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 717246d..2004a42 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -700,18 +700,19 @@ class RpmPM(PackageManager):
             arch_list = self.feed_archs.split()
         else:
             # List must be prefered to least preferred order
-            default_platform_extra = set()
-            platform_extra = set()
+            default_platform_extra = list()
+            platform_extra = list()
             bbextendvariant = self.d.getVar('BBEXTENDVARIANT', True) or ""
             for mlib in self.ml_os_list:
                 for arch in self.ml_prefix_list[mlib]:
                     plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
                     if mlib == bbextendvariant:
-                            default_platform_extra.add(plt)
+                        if plt not in default_platform_extra:
+                            default_platform_extra.append(plt)
                     else:
-                            platform_extra.add(plt)
-
-            platform_extra = platform_extra.union(default_platform_extra)
+                        if plt not in platform_extra:
+                            platform_extra.append(plt)
+            platform_extra = default_platform_extra + platform_extra
 
             for canonical_arch in platform_extra:
                 arch = canonical_arch.split('-')[0]
-- 
2.5.5


