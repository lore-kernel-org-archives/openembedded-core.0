Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 98167785AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 00:56:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 16:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,434,1508828400"; 
   d="scan'208";a="4472575"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 20 Dec 2017 16:56:42 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 16:56:35 -0800
Message-Id: <20171221005637.34163-5-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171221005637.34163-1-california.l.sullivan@intel.com>
References: <20171221005637.34163-1-california.l.sullivan@intel.com>
Cc: akuster@mvista.com
Subject: [rocko][PATCH 4/6] initramfs-module-install: Remove allarch and FILESEXTRAPATHS
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
X-List-Received-Date: Thu, 21 Dec 2017 00:56:40 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* files is already included in default FILESPATH
* it cannot inherit allarch as it RDEPENDS on bunch of TUNE_PKGARCH packages
* use the same COMPATIBLE_HOST restrictions as grub has to prevent ERRORs in
  bitbake world
  ERROR: Nothing RPROVIDES 'grub' (but oe-core/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb RDEPENDS on or otherwise requires it)
  grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
  grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)
  NOTE: Runtime target 'grub' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['grub']
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit ecad98a0ffe41d8cc8890d16be09e4b604a1e192)
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 .../initrdscripts/initramfs-module-install-efi_1.0.bb             | 3 ---
 meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb   | 8 +++++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index 24b53a8498..1e7f76fd56 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -5,9 +5,6 @@ RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools ut
 
 PR = "r4"
 
-inherit allarch
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI = "file://init-install-efi.sh"
 
 S = "${WORKDIR}"
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index ce7f165bfe..02b69f37a4 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -3,11 +3,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid"
 
-PR = "r1"
+# The same restriction as grub
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST_armv7a = 'null'
+COMPATIBLE_HOST_armv7ve = 'null'
 
-inherit allarch
+PR = "r1"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI = "file://init-install.sh"
 
 S = "${WORKDIR}"
-- 
2.14.3


