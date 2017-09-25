Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 19ACB782B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 23:35:54 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 25 Sep 2017 16:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,438,1500966000"; d="scan'208";a="132261691"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 25 Sep 2017 16:35:56 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2017 16:36:08 -0700
Message-Id: <1506382568-50909-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] grub_2.02.bb: improve reproducibility
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
X-List-Received-Date: Mon, 25 Sep 2017 23:35:55 -0000

Remove several build host references from modinfo.sh files.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-bsp/grub/grub_2.02.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub_2.02.bb b/meta/recipes-bsp/grub/grub_2.02.bb
index 57c6559..b8055e7 100644
--- a/meta/recipes-bsp/grub/grub_2.02.bb
+++ b/meta/recipes-bsp/grub/grub_2.02.bb
@@ -8,6 +8,13 @@ FILES_grub-editenv = "${bindir}/grub-editenv"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
+    # Remove build host references...
+    find "${D}" -name modinfo.sh -type f -exec \
+        sed -i \
+        -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+        -e 's|${DEBUG_PREFIX_MAP}||g' \
+        -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+        {} +
 }
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.7.4


