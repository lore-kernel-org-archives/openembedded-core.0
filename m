Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 66CD577241
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 09:38:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2016 01:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="645724421"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 01:38:43 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 56F0E6A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 02:26:36 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:28:02 +0200
Message-Id: <70205d91abcc8a8892da744afe03562d7e39c4ca.1454397260.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454397260.git.ed.bartosh@linux.intel.com>
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1454397260.git.ed.bartosh@linux.intel.com>
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 10/15] wic-image-minimal: updated .wks to boot by qemu
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
X-List-Received-Date: Tue, 02 Feb 2016 09:38:43 -0000

With below list of changes wic-image-minimal can be boot by qemu:
    - Changed device name sda -> hda.
    - Added root=/dev/hda2 to the kernel command line.
    - Changed mount point for core partition to /mnt to have it
      mounted on boot time.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index 8f9be09..6501a82 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -2,9 +2,9 @@
 # long-description: This image contains boot partition and 3 rootfs partitions
 # created from core-image-minimal and wic-image-minimal image recipes.
 
-part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024
-part /core --source rootfs --rootfs-dir=core-image-minimal --ondisk sda --fstype=ext4 --label core --align 1024
-part /backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk sda --fstype=ext4 --label backup --align 1024
+part /boot --source bootimg-pcbios --ondisk hda --label boot --active --align 1024
+part / --source rootfs --ondisk hda --fstype=ext4 --label platform --align 1024
+part /mnt --source rootfs --rootfs-dir=core-image-minimal --ondisk hda --fstype=ext4 --label core --align 1024
+part backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk hda --fstype=ext4 --label backup --align 1024
 
-bootloader  --timeout=0  --append="rootwait console=tty0"
+bootloader --timeout=0  --append="rootwait console=tty0 root=/dev/hda2"
-- 
2.1.4


