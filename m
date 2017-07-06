Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 69B1F71B27
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:55:00 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 01:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="105036390"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 06 Jul 2017 01:55:01 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 206F95801CF;
	Thu,  6 Jul 2017 01:55:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 11:43:00 +0300
Message-Id: <1499330580-27442-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] live-vm-common: add MKDOSFS_EXTRAOPTS variable
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
X-List-Received-Date: Thu, 06 Jul 2017 08:55:01 -0000

Sometimes it's needed to create FAT filesystem with specific
sector or cluster size, FAT size or to use one of other useful
mkdosfs options.

Introduced MKDOSFS_EXTRAOPTS variable to set options for mkdosfs.

[YOCTO #11709]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-live.bbclass     | 4 ++--
 meta/classes/image-vm.bbclass       | 2 +-
 meta/classes/live-vm-common.bbclass | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 3a6e5f0..c1862b1 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -217,10 +217,10 @@ build_fat_img() {
 	fi
 
 	if [ -z "${HDDIMG_ID}" ]; then
-		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
+		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} ${MKDOSFS_EXTRAOPTS} -C ${FATIMG} \
 			${BLOCKS}
 	else
-		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${FATIMG} \
+		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} ${MKDOSFS_EXTRAOPTS} -C ${FATIMG} \
 		${BLOCKS} -i ${HDDIMG_ID}
 	fi
 
diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 98bd920..b52df9f 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -68,7 +68,7 @@ build_boot_dd() {
 
 	# Remove it since mkdosfs would fail when it exists
 	rm -f $HDDIMG
-	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
+	mkdosfs -n ${BOOTDD_VOLUME_ID} ${MKDOSFS_EXTRAOPTS} -C $HDDIMG $BLOCKS
 	mcopy -i $HDDIMG -s $HDDDIR/* ::/
 
 	if [ "${PCBIOS}" = "1" ]; then
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index 27b137d..e1d8b18 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -15,6 +15,8 @@ EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
 EFI_PROVIDER ?= "grub-efi"
 EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 
+MKDOSFS_EXTRAOPTS ??= "-S 512"
+
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
 # specified, maintaining the original behavior.
-- 
2.1.4


