Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC687472A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 20:36:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2018 13:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="191351887"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 13 Apr 2018 13:36:44 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2018 13:36:40 -0700
Message-Id: <20180413203640.33220-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Cc: richard.purdie@intel.com
Subject: [PATCH resend] core-image-minimal-initramfs: use initramfs-framework for initialization
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
X-List-Received-Date: Fri, 13 Apr 2018 20:36:44 -0000

initramfs-framework is more modular and expandable. This change was
proposed in commit 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e
"core-image-minimal-initramfs: use initramfs-framework by default" but
reverted due to the selftests runqemu.RunqemuTests.test_boot_machine_iso
and runqemu.RunqemuTests.test_boot_deploy_hddimg failing. Since then,
the kinks have been worked out, and missing functionality that had been
missed (non-EFI installation module) has been added.

Since the PACKAGE_INSTALL variable was getting so long with all these
individual modules getting added, I also introduced a new
INITRAMFS_SCRIPTS variable to the core-image-minimal-initramfs recipe.
This variable makes the recipe look much cleaner, and also allows easier
replacement or additions to the scripts.

Fixes [YOCTO #10987].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
Dicussion archives:
* http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145808.html
* http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146244.html
* http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147077.html

 meta/recipes-core/images/core-image-minimal-initramfs.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 5794a25952a..a9ba91bd310 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -3,7 +3,15 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
 first 'init' program more efficiently."
 
-PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+INITRAMFS_SCRIPTS ?= "\
+                      initramfs-framework-base \
+                      initramfs-module-setup-live \
+                      initramfs-module-udev \
+                      initramfs-module-install \
+                      initramfs-module-install-efi \
+                     "
+
+PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-- 
2.14.3


