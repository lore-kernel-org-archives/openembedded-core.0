Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35CA3787E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 19:49:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 11:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,405,1505804400"; 
   d="scan'208";a="3105425"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2017 11:49:03 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 11:48:48 -0800
Message-Id: <1510861730-82471-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
References: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/4] grub-efi_2.02.bb: improve reproducibility
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
X-List-Received-Date: Thu, 16 Nov 2017 19:49:04 -0000

Remove several build host references from modinfo.sh files.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index b949beb..44e32a8 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -41,6 +41,16 @@ do_install_class-native() {
 	install -m 755 grub-mkimage ${D}${bindir}
 }
 
+do_install_append_class-target() {
+    # Remove build host references...
+    find "${D}" -name modinfo.sh -type f -exec \
+        sed -i \
+        -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+        -e 's|${DEBUG_PREFIX_MAP}||g' \
+        -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+        {} +
+}
+
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search"
 
 do_deploy() {
-- 
2.7.4


