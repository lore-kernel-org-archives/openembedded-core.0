Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 29695773F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:49:37 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 02 Jun 2016 03:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114740372"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 03:49:37 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:49:33 +0300
Message-Id: <977abd7c66bc1d2a920c3fe91942404c6e04cb4b.1464863090.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0948a4990dbf84db3529b68398e6d77297e035ae.1464863090.git.jussi.kukkonen@intel.com>
References: <0948a4990dbf84db3529b68398e6d77297e035ae.1464863090.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464863090.git.jussi.kukkonen@intel.com>
References: <cover.1464863090.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] image-live, image-vm, wic: Remove fs size workaround
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
X-List-Received-Date: Thu, 02 Jun 2016 10:49:38 -0000

Since mtools has been patched to live with filesystems with sizes
not divisible by sectors-per-track, we no longer need to try to
set the size based on our guess of the sectors-per-track dosfstools is
going to use.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/image-live.bbclass                      | 6 ------
 meta/classes/image-vm.bbclass                        | 6 ------
 scripts/lib/wic/partition.py                         | 8 --------
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 6 ------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     | 6 ------
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 6 ------
 6 files changed, 38 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index ea6ced2..f0e6647 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -202,12 +202,6 @@ build_fat_img() {
 	# Determine the final size in blocks accounting for some padding
 	BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
 
-	# Ensure total sectors is an integral number of sectors per
-	# track or mcopy will complain. Sectors are 512 bytes, and we
-	# generate images with 32 sectors per track. This calculation is
-	# done in blocks, thus the mod by 16 instead of 32.
-	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
-
 	# mkdosfs will sometimes use FAT16 when it is not appropriate,
 	# resulting in a boot failure from SYSLINUX. Use FAT32 for
 	# images larger than 512MB, otherwise let mkdosfs decide.
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 2bbd9d3..72f7b4b 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -66,12 +66,6 @@ build_boot_dd() {
 	BLOCKS=`du -bks $HDDDIR | cut -f 1`
 	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
 
-	# Ensure total sectors is an integral number of sectors per
-	# track or mcopy will complain. Sectors are 512 bytes, and we
-	# generate images with 32 sectors per track. This calculation is
-	# done in blocks, thus the mod by 16 instead of 32.
-	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
-
 	# Remove it since mkdosfs would fail when it exists
 	rm -f $HDDIMG
 	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 34fd7d6..30cd320 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -281,14 +281,6 @@ class Partition():
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, self.mountpoint, blocks))
 
-        # Ensure total sectors is an integral number of sectors per
-        # track or mcopy will complain. Sectors are 512 bytes, and we
-        # generate images with 32 sectors per track. This calculation
-        # is done in blocks, thus the mod by 16 instead of 32. Apply
-        # sector count fix only when needed.
-        if blocks % 16 != 0:
-            blocks += (16 - (blocks % 16))
-
         label_str = "-n boot"
         if self.label:
             label_str = "-n %s" % self.label
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index ec13f6d..3a16861 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -216,12 +216,6 @@ class BootimgEFIPlugin(SourcePlugin):
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, part.mountpoint, blocks))
 
-        # Ensure total sectors is an integral number of sectors per
-        # track or mcopy will complain. Sectors are 512 bytes, and we
-        # generate images with 32 sectors per track. This calculation is
-        # done in blocks, thus the mod by 16 instead of 32.
-        blocks += (16 - (blocks % 16))
-
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 5b719bf..f204daa 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -179,12 +179,6 @@ class BootimgPcbiosPlugin(SourcePlugin):
         msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
                     (extra_blocks, part.mountpoint, blocks))
 
-        # Ensure total sectors is an integral number of sectors per
-        # track or mcopy will complain. Sectors are 512 bytes, and we
-        # generate images with 32 sectors per track. This calculation is
-        # done in blocks, thus the mod by 16 instead of 32.
-        blocks += (16 - (blocks % 16))
-
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
 
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index ed59d85..3858fd4 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -441,12 +441,6 @@ class IsoImagePlugin(SourcePlugin):
                     % (part.mountpoint, blocks)
             msger.debug(msg)
 
-            # Ensure total sectors is an integral number of sectors per
-            # track or mcopy will complain. Sectors are 512 bytes, and we
-            # generate images with 32 sectors per track. This calculation is
-            # done in blocks, thus the mod by 16 instead of 32.
-            blocks += (16 - (blocks % 16))
-
             # dosfs image for EFI boot
             bootimg = "%s/efi.img" % isodir
 
-- 
2.1.4


