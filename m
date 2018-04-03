Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5AB74852
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 01:40:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2018 18:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,398,1517904000"; d="scan'208";a="47451332"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga002.jf.intel.com with ESMTP; 02 Apr 2018 18:40:10 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2018 18:40:04 -0700
Message-Id: <20180403014004.4151-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH v2] initrdscripts: init-install(-efi).sh: don't assume 20M boot partition
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
X-List-Received-Date: Tue, 03 Apr 2018 01:40:10 -0000

With multi kernel support in the installer we can exceed this limit.
Calculate a sane size by checking the size of the original boot
partition minus some objects we know won't be installed, plus some extra
space for users.

In addition, in the common case where only one small kernel is present
to be installed, we actually get a smaller boot partition with less
wasted space.

Also add VIRTUAL-RUNTIME_base-utils to RDEPENDS where these scripts are
used, as they're needed for the du command.

[YOCTO #12583].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
* v2: add VIRTUAL-RUNTIME_base-utils to RDEPENDS

 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 15 +++++++++++++--
 meta/recipes-core/initrdscripts/files/init-install.sh     | 15 +++++++++++++--
 .../initrdscripts/initramfs-live-install-efi_1.0.bb       |  2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb           |  2 +-
 .../initrdscripts/initramfs-module-install-efi_1.0.bb     |  2 +-
 .../initrdscripts/initramfs-module-install_1.0.bb         |  2 +-
 6 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 43b75b01751..82b0aa819e3 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -8,8 +8,19 @@
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
-# We need 20 Mb for the boot partition
-boot_size=20
+# figure out how big of a boot partition we need
+boot_size=$(du -ms /run/media/$1/ | awk '{print $1}')
+# remove rootfs.img ($2) from the size if it exists, as its not installed to /boot
+if [ -e /run/media/$1/$2 ]; then
+    boot_size=$(( boot_size - $( du -ms /run/media/$1/$2 | awk '{print $1}') ))
+fi
+# remove initrd from size since its not currently installed
+if [ -e /run/media/$1/initrd ]; then
+    boot_size=$(( boot_size - $( du -ms /run/media/$1/initrd | awk '{print $1}') ))
+fi
+# add 10M to provide some extra space for users and account
+# for rounding in the above subtractions
+boot_size=$(( boot_size + 10 ))
 
 # 5% for swap
 swap_ratio=5
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index aa9476660ba..28e8f09d19d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -7,8 +7,19 @@
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
-# We need 20 Mb for the boot partition
-boot_size=20
+# figure out how big of a boot partition we need
+boot_size=$(du -ms /run/media/$1/ | awk '{print $1}')
+# remove rootfs.img ($2) from the size if it exists, as its not installed to /boot
+if [ -e /run/media/$1/$2 ]; then
+    boot_size=$(( boot_size - $( du -ms /run/media/$1/$2 | awk '{print $1}') ))
+fi
+# remove initrd from size since its not currently installed
+if [ -e /run/media/$1/initrd ]; then
+    boot_size=$(( boot_size - $( du -ms /run/media/$1/initrd | awk '{print $1}') ))
+fi
+# add 10M to provide some extra space for users and account
+# for rounding in the above subtractions
+boot_size=$(( boot_size + 10 ))
 
 # 5% for the swap
 swap_ratio=5
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index 2a7f84ddc8f..f588a1077bf 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -5,7 +5,7 @@ SRC_URI = "file://init-install-efi.sh"
 
 PR = "r1"
 
-RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
+RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index a553a0d8ba5..9222d57c1ae 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -7,7 +7,7 @@ PR = "r9"
 
 S = "${WORKDIR}"
 
-RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid"
+RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-install.sh ${D}/install.sh
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
index 1e7f76fd565..78a61cde25f 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "initramfs-framework module for EFI installation option"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
+RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 
 PR = "r4"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
index 02b69f37a4d..04e90cd302c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "initramfs-framework module for installation option"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid"
+RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-linux-blkid ${VIRTUAL-RUNTIME_base-utils}"
 
 # The same restriction as grub
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
-- 
2.14.3


