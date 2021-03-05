Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VevexyI/fK0PrP9mYYJMBnUqZb5Pj25ww1FqGg6jXlQGg2eAdDgnohRld5uJ5n5ui6N9KtJSEN
 51D1lbBfYRqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671157"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671157"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:49 -0800
IronPort-SDR: 8C4zgeOfuA2lDPWLCCeyDXC1tFaisPSDGTDwdMjes8DSDyAuwhR9AliqqZGF9Z7avSrOZElKiq
 D6nDCHn4UG+Q==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129066"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:48 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 38/52] wic: Warn if an ext filesystem affected by the Y2038 problem is used
Date: Fri,  5 Mar 2021 12:21:14 +0800
Message-Id: <2250430d555fcae3df71d1dff079e52c093d000c.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Bezdeka <florian.bezdeka@siemens.com>

We are getting closer and closer to the year 2038 where the 32 bit
time_t overflow will happen. While products (= embedded systems) with an
expected life time of 15 years are still save the situation may change
if your system has to survive the next 20 years.

ext2 and ext3 filesystems are always affected by the time overflow, so
let's warn the user if these filesystems are still being used.

If ext4 is affected depends on the inode size chosen during filesystem
creation. At least 256 bytes are necessary to be safe. As ext4 is
used very often (and partitions may be created small first and extended
later) this might be an issue for many users.

Some filesystems created during CI runs were already affected by the Y2038
problem. By using `--mkfs-extraopts "-T default"` we tell mke2fs not to
auto-detect the usage type based on the filesystem size. mke2fs will use
the default values for tuning parameters instead. The inode size is one
of these parameters.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eecbe625558406680121d2a7e84917fea45ea9dc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/canned-wks/common.wks.inc     |  2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks |  2 +-
 scripts/lib/wic/canned-wks/mkefidisk.wks      |  2 +-
 scripts/lib/wic/misc.py                       |  1 +
 scripts/lib/wic/partition.py                  | 38 +++++++++++++++++++
 5 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/canned-wks/common.wks.inc b/scripts/lib/wic/canned-wks/common.wks.inc
index 89880b417b..4fd29fa8c1 100644
--- a/scripts/lib/wic/canned-wks/common.wks.inc
+++ b/scripts/lib/wic/canned-wks/common.wks.inc
@@ -1,3 +1,3 @@
 # This file is included into 3 canned wks files from this directory
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --use-uuid --fstype=ext4 --label platform --align 1024
+part / --source rootfs --use-uuid --fstype=ext4 --mkfs-extraopts "-T default" --label platform --align 1024
diff --git a/scripts/lib/wic/canned-wks/directdisk-gpt.wks b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
index 8d7d8de6ea..cf16c0c30b 100644
--- a/scripts/lib/wic/canned-wks/directdisk-gpt.wks
+++ b/scripts/lib/wic/canned-wks/directdisk-gpt.wks
@@ -4,7 +4,7 @@
 
 
 part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --mkfs-extraopts "-T default" --label platform --align 1024 --use-uuid
 
 bootloader  --ptable gpt --timeout=0  --append="rootwait rootfstype=ext4 video=vesafb vga=0x318 console=tty0 console=ttyS0,115200n8"
 
diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/canned-wks/mkefidisk.wks
index 9f534fe184..d1878e23e5 100644
--- a/scripts/lib/wic/canned-wks/mkefidisk.wks
+++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
@@ -4,7 +4,7 @@
 
 part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
 
-part / --source rootfs --ondisk sda --fstype=ext4 --label platform --align 1024 --use-uuid
+part / --source rootfs --ondisk sda --fstype=ext4 --mkfs-extraopts "-T default"  --label platform --align 1024 --use-uuid
 
 part swap --ondisk sda --size 44 --label swap1 --fstype=swap
 
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 75b219cd3f..57c042c503 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -26,6 +26,7 @@ logger = logging.getLogger('wic')
 
 # executable -> recipe pairs for exec_native_cmd
 NATIVE_RECIPES = {"bmaptool": "bmap-tools",
+                  "dumpe2fs": "e2fsprogs",
                   "grub-mkimage": "grub-efi",
                   "isohybrid": "syslinux",
                   "mcopy": "mtools",
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e574f40c47..85f9847047 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -298,6 +298,8 @@ class Partition():
         mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
+        self.check_for_Y2038_problem(rootfs, native_sysroot)
+
     def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
@@ -388,6 +390,8 @@ class Partition():
             (self.fstype, extraopts, label_str, self.fsuuid, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot)
 
+        self.check_for_Y2038_problem(rootfs, native_sysroot)
+
     def prepare_empty_partition_btrfs(self, rootfs, oe_builddir,
                                       native_sysroot):
         """
@@ -449,3 +453,37 @@ class Partition():
 
         mkswap_cmd = "mkswap %s -U %s %s" % (label_str, self.fsuuid, path)
         exec_native_cmd(mkswap_cmd, native_sysroot)
+
+    def check_for_Y2038_problem(self, rootfs, native_sysroot):
+        """
+        Check if the filesystem is affected by the Y2038 problem
+        (Y2038 problem = 32 bit time_t overflow in January 2038)
+        """
+        def get_err_str(part):
+            err = "The {} filesystem {} has no Y2038 support."
+            if part.mountpoint:
+                args = [part.fstype, "mounted at %s" % part.mountpoint]
+            elif part.label:
+                args = [part.fstype, "labeled '%s'" % part.label]
+            elif part.part_name:
+                args = [part.fstype, "in partition '%s'" % part.part_name]
+            else:
+                args = [part.fstype, "in partition %s" % part.num]
+            return err.format(*args)
+
+        # ext2 and ext3 are always affected by the Y2038 problem
+        if self.fstype in ["ext2", "ext3"]:
+            logger.warn(get_err_str(self))
+            return
+
+        ret, out = exec_native_cmd("dumpe2fs %s" % rootfs, native_sysroot)
+
+        # if ext4 is affected by the Y2038 problem depends on the inode size
+        for line in out.splitlines():
+            if line.startswith("Inode size:"):
+                size = int(line.split(":")[1].strip())
+                if size < 256:
+                    logger.warn("%s Inodes (of size %d) are too small." %
+                                (get_err_str(self), size))
+                break
+
-- 
2.29.2

