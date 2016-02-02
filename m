Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C6C88772BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:43:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2016 09:43:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="41160604"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2016 09:43:33 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 438216A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:31:26 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 17:32:49 +0200
Message-Id: <34ea5c3e1f5bb80d4fc47ef29d9e4803cf38a90e.1454426922.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 09/14] wic-image-minimal: update .wks to boot by qemu
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
X-List-Received-Date: Tue, 02 Feb 2016 17:43:33 -0000

With below list of changes wic-image-minimal can be boot by qemu:
    - Changed device name sda -> vda.
    - Added root=/dev/vda2 to the kernel command line.
    - Changed mount point for core partition to /mnt to have it
      mounted on boot time.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index 8f9be09..191244b 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -2,9 +2,9 @@
 # long-description: This image contains boot partition and 3 rootfs partitions
 # created from core-image-minimal and wic-image-minimal image recipes.
 
-part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
-part /core --source rootfs --rootfs-dir=core-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
-part /backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label backup --align 1024
+part /boot --source bootimg-pcbios --ondisk vda --label boot --active --align 1024
+part / --source rootfs --ondisk vda --fstype=ext4 --label platform --align 1024
+part /mnt --source rootfs --rootfs-dir=core-image-minimal --ondisk vda --fstype=ext4 --label core --align 1024
+part backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk vda --fstype=ext4 --label backup --align 1024
 
-bootloader  --timeout=0  --append="rootwait console=tty0"
+bootloader --timeout=0  --append="rootwait console=tty0 root=/dev/vda2"
-- 
2.1.4


