Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D025E6F564
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 09:44:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 03 Mar 2014 01:44:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,576,1389772800"; d="scan'208";a="484729176"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2014 01:43:34 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 11:43:30 +0200
Message-Id: <0d516ff4d652cf74a5a43106f46321ff52c97900.1393839480.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1393839480.git.laurentiu.palcu@intel.com>
References: <cover.1393839480.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1393839480.git.laurentiu.palcu@intel.com>
References: <cover.1393839480.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] Revert "lib/oe/package_manager.py: RpmPM: fix issue with multilib builds"
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
X-List-Received-Date: Mon, 03 Mar 2014 09:44:43 -0000

Converting a list to a set does not keep the order of the items, as they
were added, which might result in the wrong packages being installed in
the final image...

This reverts commit 12f47c23df8c109676f66d580d666a3147f3b046.

[YOCTO #5890]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index ff4f1de..6c133c3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -368,18 +368,19 @@ class RpmPM(PackageManager):
                                 self.ml_os_list['default'])
 
         # List must be prefered to least preferred order
-        default_platform_extra = set()
-        platform_extra = set()
+        default_platform_extra = list()
+        platform_extra = list()
         bbextendvariant = self.d.getVar('BBEXTENDVARIANT', True) or ""
         for mlib in self.ml_os_list:
             for arch in self.ml_prefix_list[mlib]:
                 plt = arch.replace('-', '_') + '-.*-' + self.ml_os_list[mlib]
                 if mlib == bbextendvariant:
-                        default_platform_extra.add(plt)
+                    if plt not in default_platform_extra:
+                        default_platform_extra.append(plt)
                 else:
-                        platform_extra.add(plt)
-
-        platform_extra = platform_extra.union(default_platform_extra)
+                    if plt not in platform_extra:
+                        platform_extra.append(plt)
+        platform_extra = default_platform_extra + platform_extra
 
         self._create_configs(platform, platform_extra)
 
-- 
1.7.9.5


