Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14F676196C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:24 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272147"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:23 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:41 +0800
Message-Id: <3e65ad67995874c363863280e40457acc3f479e9.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 17/22] qemu: Fix CVE-2020-1711
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:23 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

see https://git.qemu.org/?p=qemu.git;a=commit;h=693fd2acdf14dd86c0bf852610f1c2cca80a74dc

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  3 +-
 .../recipes-devtools/qemu/qemu/CVE-2020-1711.patch | 64 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bb444b6..d394db8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,7 +29,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://CVE-2019-15890.patch \
            file://CVE-2019-12068.patch \
-           "
+           file://CVE-2020-1711.patch \
+	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "cdf2b5ca52b9abac9bacb5842fa420f8"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
new file mode 100644
index 0000000..aa7bc82
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
@@ -0,0 +1,64 @@
+From 693fd2acdf14dd86c0bf852610f1c2cca80a74dc Mon Sep 17 00:00:00 2001
+From: Felipe Franciosi <felipe@nutanix.com>
+Date: Thu, 23 Jan 2020 12:44:59 +0000
+Subject: [PATCH] iscsi: Cap block count from GET LBA STATUS (CVE-2020-1711)
+
+When querying an iSCSI server for the provisioning status of blocks (via
+GET LBA STATUS), Qemu only validates that the response descriptor zero's
+LBA matches the one requested. Given the SCSI spec allows servers to
+respond with the status of blocks beyond the end of the LUN, Qemu may
+have its heap corrupted by clearing/setting too many bits at the end of
+its allocmap for the LUN.
+
+A malicious guest in control of the iSCSI server could carefully program
+Qemu's heap (by selectively setting the bitmap) and then smash it.
+
+This limits the number of bits that iscsi_co_block_status() will try to
+update in the allocmap so it can't overflow the bitmap.
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=patch;h=693fd2acdf14dd86c0bf852610f1c2cca80a74dc]
+CVE: CVE-2020-1711
+
+Fixes: CVE-2020-1711
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
+Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
+Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ block/iscsi.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/block/iscsi.c b/block/iscsi.c
+index 2aea7e3..cbd5729 100644
+--- a/block/iscsi.c
++++ b/block/iscsi.c
+@@ -701,7 +701,7 @@ static int coroutine_fn iscsi_co_block_status(BlockDriverState *bs,
+     struct scsi_get_lba_status *lbas = NULL;
+     struct scsi_lba_status_descriptor *lbasd = NULL;
+     struct IscsiTask iTask;
+-    uint64_t lba;
++    uint64_t lba, max_bytes;
+     int ret;
+ 
+     iscsi_co_init_iscsitask(iscsilun, &iTask);
+@@ -721,6 +721,7 @@ static int coroutine_fn iscsi_co_block_status(BlockDriverState *bs,
+     }
+ 
+     lba = offset / iscsilun->block_size;
++    max_bytes = (iscsilun->num_blocks - lba) * iscsilun->block_size;
+ 
+     qemu_mutex_lock(&iscsilun->mutex);
+ retry:
+@@ -764,7 +765,7 @@ retry:
+         goto out_unlock;
+     }
+ 
+-    *pnum = (int64_t) lbasd->num_blocks * iscsilun->block_size;
++    *pnum = MIN((int64_t) lbasd->num_blocks * iscsilun->block_size, max_bytes);
+ 
+     if (lbasd->provisioning == SCSI_PROVISIONING_TYPE_DEALLOCATED ||
+         lbasd->provisioning == SCSI_PROVISIONING_TYPE_ANCHORED) {
+-- 
+1.8.3.1
-- 
2.7.4


