Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 17D7B771DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 09:38:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2016 01:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="894517904"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2016 01:38:48 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 9E9036A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 02:26:40 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:28:05 +0200
Message-Id: <660aee82c8f1ca5ffb3c20fce50eedee2cb5f52e.1454397260.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454397260.git.ed.bartosh@linux.intel.com>
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1454397260.git.ed.bartosh@linux.intel.com>
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 13/15] wic-image-minimal: use uuid for root partition
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
X-List-Received-Date: Tue, 02 Feb 2016 09:38:47 -0000

Used --uuid option to generate PARTUUID for root partion and
gpt partition type. As this image is used in runtime testing
under qemu it makes sense to ensure that this way of specifying
root partition works.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.wks | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.wks b/meta-selftest/recipes-test/images/wic-image-minimal.wks
index 6501a82..0d6035e 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.wks
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.wks
@@ -3,8 +3,8 @@
 # created from core-image-minimal and wic-image-minimal image recipes.
 
 part /boot --source bootimg-pcbios --ondisk hda --label boot --active --align 1024
-part / --source rootfs --ondisk hda --fstype=ext4 --label platform --align 1024
+part / --source rootfs --ondisk hda --fstype=ext4 --label platform --align 1024 --use-uuid
 part /mnt --source rootfs --rootfs-dir=core-image-minimal --ondisk hda --fstype=ext4 --label core --align 1024
 part backup --source rootfs --rootfs-dir=wic-image-minimal --ondisk hda --fstype=ext4 --label backup --align 1024
 
-bootloader --timeout=0  --append="rootwait console=tty0 root=/dev/hda2"
+bootloader --ptable gpt --timeout=0 --append="rootwait console=tty0"
-- 
2.1.4


