Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 960A16006E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 14:15:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 27 Sep 2016 07:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,405,1470726000"; d="scan'208";a="766438764"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.187.201])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Sep 2016 07:15:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 27 Sep 2016 07:15:36 -0700
Message-Id: <1474985736-17783-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH][Jethro] init-install.sh: fix disk_size
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
X-List-Received-Date: Tue, 27 Sep 2016 14:15:38 -0000

From: Robert Yang <liezhi.yang@windriver.com>

It mis-matched "SanDisk" or "Disk Flags" before, which caused unexpected
error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a68ac76c1b6ed4c1a2fbc944c5021c89fd26217f)
[YOCTO #10333]
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
This is fixed in both Master and Krogoth and just needs a backport to
Jethro to address an open bug.

 meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh | 2 +-
 meta/recipes-core/initrdscripts/files/init-install-efi.sh        | 2 +-
 meta/recipes-core/initrdscripts/files/init-install.sh            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index 7a0b4d4..b562109 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -69,7 +69,7 @@ umount /dev/${device}* 2> /dev/null || /bin/true
 mkdir -p /tmp
 cat /proc/mounts > /etc/mtab
 
-disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+disk_size=$(parted /dev/${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
 
 testfs_size=$((disk_size*testfs_ratio/100))
 rootfs_size=$((disk_size-boot_size-testfs_size))
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 0443a9d..3531158 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -120,7 +120,7 @@ if [ ! -e /etc/mtab ]; then
     cat /proc/mounts > /etc/mtab
 fi
 
-disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
 
 swap_size=$((disk_size*swap_ratio/100))
 rootfs_size=$((disk_size-boot_size-swap_size))
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index f9e9768..06f03ed 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -116,7 +116,7 @@ if [ ! -L /etc/mtab ]; then
     cat /proc/mounts > /etc/mtab
 fi
 
-disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
 
 grub_version=$(grub-install -v|sed 's/.* \([0-9]\).*/\1/')
 
-- 
2.7.4


