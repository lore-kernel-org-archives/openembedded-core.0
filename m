Return-Path: <jwessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF2367F2F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 20:24:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x78KNxfM001132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2019 13:24:15 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 8 Aug 2019 13:24:02 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 2E7EDAA4587;
	Thu,  8 Aug 2019 13:24:02 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 13:23:58 -0700
Message-ID: <20190808202400.60710-2-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808202400.60710-1-jason.wessel@windriver.com>
References: <20190808202400.60710-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/4] wic: Add partition type for msdos partition tables
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
X-List-Received-Date: Thu, 08 Aug 2019 20:24:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In order to create a msdos partition table disk image that can auto
expand after the image is copied to an SD card, wic needs the ability
to have a primary partition as the last entry.  The desired use case
is to be able to create an A/B update partition image scheme with a
/var volume that can be auto expanded to the remainder of the SD card
at run time.

The typical .wks file will look similar to the following:

bootloader --ptable msdos
part / --source rawcopy --sourceparams="file=u-boot.imx" \
   --ondisk mmcblk --no-table --align 1 --size 1
part /boot --source bootimg-partition \
   --ondisk mmcblk --fstype=vfat --label boot --active --align 4 --size 16
part / --source rawcopy --sourceparams="file=imx6_boot.otaimg" \
   --ondisk mmcblk --fstype=ext4 --label otaboot --align 4 --type logical
part / --source rawcopy --sourceparams="file=imx6.otaimg" \
   --ondisk mmcblk --fstype=ext4 --label otaroot --align 4 --type logical
part / --source rawcopy --sourceparams="file=imx6_boot.otaimg" \
   --ondisk mmcblk --fstype=ext4 --label otaboot_b --align 4 --type logical
part / --source rawcopy --sourceparams="file=imx6.otaimg" \
   --ondisk mmcblk --fstype=ext4 --label otaroot_b --align 4 --type logical
part /var --source rawcopy --sourceparams="file=imx6_var.otaimg" \
    --ondisk mmcblk --fstype=ext4 --label fluxdata --align 4

Without the patch applied, wic will generate an SD card image that looks like:

Disk boot.img: 890940s
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start    End      Size     Type      File system  Flags
 1      2056s    48001s   45946s   primary   fat16        lba
 2      48008s   132467s  84460s   primary   ext4
 3      132472s  454467s  321996s  primary   ext4
 4      454471s  890939s  436469s  extended               lba
 5      454472s  538931s  84460s   logical   ext4
 6      538936s  860931s  321996s  logical   ext4
 7      860936s  890939s  30004s   logical   ext4         boot

With the patch applied a primary partition can be created at the end
of the image which can be expanded to fill the free space on the media
where the image has been copied, which looks like:

Disk boot.img: 890940s
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start    End      Size     Type      File system  Flags
 1      2056s    48001s   45946s   primary   fat16        lba
 2      48007s   860931s  812925s  extended               lba
 5      48008s   132467s  84460s   logical   ext4
 6      132472s  454467s  321996s  logical   ext4
 7      454472s  538931s  84460s   logical   ext4
 8      538936s  860931s  321996s  logical   ext4
 3      860936s  890939s  30004s   primary   ext4         boot

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/lib/wic/ksparser.py              |  2 ++
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/imager/direct.py | 37 +++++++++++++++++-------
 3 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 3e670033ba..6a643ba3af 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -151,6 +151,8 @@ class KickStart():
         part.add_argument('--part-name')
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
+        part.add_argument('--type', default='primary',
+                choices = ('primary', 'logical'))
 
         # --size and --fixed-size cannot be specified together; options
         # ----extra-space and --overhead-factor should also raise a parser
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 01466b258d..f427c8101b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -50,6 +50,7 @@ class Partition():
         self.use_uuid = args.use_uuid
         self.uuid = args.uuid
         self.fsuuid = args.fsuuid
+        self.type = args.type
 
         self.lineno = lineno
         self.source_file = ""
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 91fc5e70f6..3ce6ad55b8 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -300,6 +300,10 @@ class PartitionedImage():
         self.path = path  # Path to the image file
         self.numpart = 0  # Number of allocated partitions
         self.realpart = 0 # Number of partitions in the partition table
+        self.primary_part_num = 0  # Number of primary partitions (msdos)
+        self.extendedpart = 0      # Create extended partition before this logical partition (msdos)
+        self.extended_size_sec = 0 # Size of exteded partition (msdos)
+        self.logical_part_cnt = 0  # Number of total logical paritions (msdos)
         self.offset = 0   # Offset of next partition (in sectors)
         self.min_size = 0 # Minimum required disk size to fit
                           # all partitions (in bytes)
@@ -391,12 +395,16 @@ class PartitionedImage():
                 # Skip one sector required for the partitioning scheme overhead
                 self.offset += overhead
 
-            if self.realpart > 3 and num_real_partitions > 4:
+            if self.ptable_format == "msdos":
+                if self.primary_part_num > 3 or \
+                   (self.extendedpart == 0 and self.primary_part_num >= 3 and num_real_partitions > 4):
+                    part.type = 'logical'
                 # Reserve a sector for EBR for every logical partition
                 # before alignment is performed.
-                if self.ptable_format == "msdos":
+                if part.type == 'logical':
                     self.offset += 1
 
+            align_sectors = 0
             if part.align:
                 # If not first partition and we do have alignment set we need
                 # to align the partition.
@@ -422,18 +430,25 @@ class PartitionedImage():
             part.start = self.offset
             self.offset += part.size_sec
 
-            part.type = 'primary'
             if not part.no_table:
                 part.num = self.realpart
             else:
                 part.num = 0
 
-            if self.ptable_format == "msdos":
-                # only count the partitions that are in partition table
-                if num_real_partitions > 4:
-                    if self.realpart > 3:
-                        part.type = 'logical'
-                        part.num = self.realpart + 1
+            if self.ptable_format == "msdos" and not part.no_table:
+                if part.type == 'logical':
+                    self.logical_part_cnt += 1
+                    part.num = self.logical_part_cnt + 4
+                    if self.extendedpart == 0:
+                        # Create extended partition as a primary partition
+                        self.primary_part_num += 1
+                        self.extendedpart = part.num
+                    else:
+                        self.extended_size_sec += align_sectors
+                    self.extended_size_sec += part.size_sec + 1
+                else:
+                    self.primary_part_num += 1
+                    part.num = self.primary_part_num
 
             logger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
                          "sectors (%d bytes).", part.mountpoint, part.disk,
@@ -483,7 +498,7 @@ class PartitionedImage():
             if part.num == 0:
                 continue
 
-            if self.ptable_format == "msdos" and part.num == 5:
+            if self.ptable_format == "msdos" and part.num == self.extendedpart:
                 # Create an extended partition (note: extended
                 # partition is described in MBR and contains all
                 # logical partitions). The logical partitions save a
@@ -497,7 +512,7 @@ class PartitionedImage():
                 # room for all logical partitions.
                 self._create_partition(self.path, "extended",
                                        None, part.start - 1,
-                                       self.offset - part.start + 1)
+                                       self.extended_size_sec)
 
             if part.fstype == "swap":
                 parted_fs_type = "linux-swap"
-- 
2.21.0


