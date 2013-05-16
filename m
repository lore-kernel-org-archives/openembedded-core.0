Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ud2oM-0000so-1e
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 20:22:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2013 11:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,685,1363158000"; d="scan'208";a="242589274"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.48])
	by AZSMGA002.ch.intel.com with ESMTP; 16 May 2013 11:03:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 21:03:06 +0300
Message-Id: <e2fdb0ddaf77f2801326bb896ed5470e29cd1d16.1368727195.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1368727195.git.sgw@linux.intel.com>
References: <cover.1368727195.git.sgw@linux.intel.com>
In-Reply-To: <cover.1368727195.git.sgw@linux.intel.com>
References: <cover.1368727195.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] Revert "initramfs-live-install*: fix the "install" boot option"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 18:22:16 -0000

This was not the correct fix for this issues, it turns out that
base-files package was getting installed un-intentionally when
rpm-postinsts was split out. The base-files recipe lays down the
link that caused the cat failure.

[YOCTO #4504]

This reverts commit 45e460d0846f0f660128dc06064b597ce40282b3.
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh         | 1 +
 meta/recipes-core/initrdscripts/files/init-install.sh             | 1 +
 meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb | 2 +-
 meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb     | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 9f7a9e7..23228c9 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -66,6 +66,7 @@ rm -f /etc/udev/scripts/mount*
 umount /dev/${device}* 2> /dev/null || /bin/true
 
 mkdir -p /tmp
+cat /proc/mounts > /etc/mtab
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 2ecd333..d2a0db3 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -78,6 +78,7 @@ if [ ! -b /dev/loop0 ] ; then
 fi
 
 mkdir -p /tmp
+cat /proc/mounts > /etc/mtab
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index 264931f..8ad47d4 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install-efi.sh"
 
-PR = "r1"
+PR = "r0"
 
 RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 3a8836d..0f80f0e 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
 
-PR = "r9"
+PR = "r8"
 
 RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
 
-- 
1.8.0.2



