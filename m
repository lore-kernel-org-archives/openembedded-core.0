Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 586706007A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 09:27:07 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 28 Sep 2016 02:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,409,1470726000"; d="scan'208";a="14062346"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2016 02:27:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id C7DA16A4006;
	Wed, 28 Sep 2016 02:26:40 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2016 12:16:14 +0300
Message-Id: <1475054174-10516-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] runqemu: explicitly set image format
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
X-List-Received-Date: Wed, 28 Sep 2016 09:27:08 -0000

QEMU produces a warning if drive format is not specified:
  WARNING: Image format was not specified for
  'tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic'
   and probing guessed raw.
   Automatically detecting the format is dangerous for raw images,
   write operations on block 0 will be restricted.
   Specify the 'raw' format explicitly to remove the restrictions.

Set image format to 'vmdk', 'qcow2' or 'vdi' for correspondent image
types. Set it to 'raw' for the rest of image types.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 45bcad7..09b231b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -817,11 +817,13 @@ class BaseConfig(object):
         else:
             self.setup_tap()
 
+        rootfs_format = self.fstype if self.fstype in ('vmdk', 'qcow2', 'vdi') else 'raw'
+
         qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
         if qb_rootfs_opt:
             self.rootfs_options = qb_rootfs_opt.replace('@ROOTFS@', self.rootfs)
         else:
-            self.rootfs_options = '-drive file=%s,if=virtio,format=raw' % self.rootfs
+            self.rootfs_options = '-drive file=%s,if=virtio,format=%s' % (self.rootfs, rootfs_format)
 
         if self.fstype in ('cpio.gz', 'cpio'):
             self.kernel_cmdline = 'root=/dev/ram0 rw debugshell'
@@ -835,14 +837,15 @@ class BaseConfig(object):
                     cmd2 = "grep -q 'root=/dev/hd' %s" % self.rootfs
                     if subprocess.call(cmd1, shell=True) == 0:
                         logger.info('Using scsi drive')
-                        vm_drive = '-drive if=none,id=hd,file=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' % self.rootfs
+                        vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' \
+                                       % (self.rootfs, rootfs_format)
                     elif subprocess.call(cmd2, shell=True) == 0:
                         logger.info('Using scsi drive')
-                        vm_drive = self.rootfs
+                        vm_drive = "%s,format=%s" % (self.rootfs, rootfs_format)
                     else:
                         logger.warn("Can't detect drive type %s" % self.rootfs)
                         logger.warn('Tring to use virtio block drive')
-                        vm_drive = '-drive if=virtio,file=%s' % self.rootfs
+                        vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
                 self.rootfs_options = '%s -no-reboot' % vm_drive
             self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('QB_KERNEL_ROOT'))
 
-- 
2.1.4


