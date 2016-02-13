Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7DC76B7C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 13 Feb 2016 03:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="651707079"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Feb 2016 03:12:39 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id D73EC6A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:29 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:16 +0200
Message-Id: <3a5f8221becd093528acfd3a0ad41fc1e1391f4f.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 09/14] wic-image-minimal: update .wks to boot by qemu
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:38 -0000

With below list of changes wic-image-minimal can be boot by qemu:
    - Changed device name sda -> vda.
    - Added root=/dev/vda2 to the kernel command line.
    - Changed mount point for core partition to /mnt to have it
      mounted on boot time.

(From OE-Core rev: f085274711f561f97a2c89f40bb0e89094973054)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


