Return-Path: <california.l.sullivan@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 20F0A783FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 21:33:27 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2017 14:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,379,1500966000"; d="scan'208";a="148011560"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 11 Sep 2017 14:33:28 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Sep 2017 14:33:26 -0700
Message-Id: <20170911213326.3480-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
Cc: otavio@ossystems.com.br
Subject: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 21:33:28 -0000

Bump initramfs-framework PR, as it was missed in the previous
initramfs-framework patch.

These modules are shell scripts so they can be allarch.

Fix the SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in layer.conf, as these
dependencies moved from the main recipe to these modules.

Finally, set the PR to 4 in the new module recipes to avoid breaking
package feeds.

Fixes [YOCTO #12024].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
Reading the commit message this maybe should be split into multiple
patches, but since they're issues caused by the taking the v1 version
of my previous patch, I'm not sure. Let me know if its the former.

 meta/conf/layer.conf                                              | 8 ++++----
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb        | 2 +-
 .../initrdscripts/initramfs-module-install-efi_1.0.bb             | 4 +++-
 .../recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb | 4 +++-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 04aa730..df457c2 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -50,12 +50,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   docbook-xsl-stylesheets->perl \
   ca-certificates->openssl \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
-  initramfs-framework->dosfstools \
-  initramfs-framework->e2fsprogs \
   initramfs-framework->eudev \
-  initramfs-framework->parted \
   initramfs-framework->systemd \
-  initramfs-framework->util-linux \
+  initramfs-module-install-efi->dosfstools \
+  initramfs-module-install-efi->e2fsprogs \
+  initramfs-module-install-efi->parted \
+  initramfs-module-install-efi->util-linux \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
   gnome-icon-theme->librsvg \
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index c07a5fc..2afc37e 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
-PR = "r3"
+PR = "r4"
 
 inherit allarch
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index 8143f31..2270441 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -3,7 +3,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
 
-PR = "r1"
+PR = "r4"
+
+inherit allarch
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/initramfs-framework:"
 SRC_URI = "file://install-efi.sh"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index 7627cdc..4d2fe9d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -3,7 +3,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} = "initramfs-framework-base udev-extraconf"
 
-PR = "r1"
+PR = "r4"
+
+inherit allarch
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/initramfs-framework:"
 SRC_URI = "file://setup-live"
-- 
2.9.5


