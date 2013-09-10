Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6145F6C000
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:10:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2013 08:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,878,1371106800"; d="scan'208";a="401243747"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2013 08:10:54 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 18:10:47 +0300
Message-Id: <675db5e338fc17a42d798a9445f5891404325b18.1378824959.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/5] packagegroup-cross-canadian: change package name to include MACHINE
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
X-List-Received-Date: Tue, 10 Sep 2013 15:10:53 -0000

Since meta-environment package name was changed to contain MACHINE,
change packagegroup-cross-canadian package name too, in order to be able
to select the proper environment files for a certain machine.

Also, remove the RPROVIDES since adt-installer doesn't really need it.

[YOCTO #4783]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../packagegroups/packagegroup-cross-canadian.bb   |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index a6c6c36..064edfb 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Host SDK package for cross canadian toolchain"
-PN = "packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+PN = "packagegroup-cross-canadian-${MACHINE}"
 PR = "r0"
 LICENSE = "MIT"
 
@@ -10,13 +10,10 @@ inherit cross-canadian packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-
 RDEPENDS_${PN} = "\
-    binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-    gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-    gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-    meta-environment-${TRANSLATED_TARGET_ARCH} \
+    binutils-cross-canadian-${@' binutils-cross-canadian-'.join(all_multilib_tune_values(d,'TRANSLATED_TARGET_ARCH').split())} \
+    gdb-cross-canadian-${@' gdb-cross-canadian-'.join(all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH').split())} \
+    gcc-cross-canadian-${@' gcc-cross-canadian-'.join(all_multilib_tune_values(d, 'TRANSLATED_TARGET_ARCH').split())} \
+    meta-environment-${MACHINE} \
     "
 
-- 
1.7.9.5


