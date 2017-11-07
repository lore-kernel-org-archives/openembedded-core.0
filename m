Return-Path: <artur@madrzak.eu>
Received: from s20.linuxpl.com (s20.linuxpl.com [78.46.68.78])
	by mail.openembedded.org (Postfix) with ESMTP id AADF6605BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 20:07:09 +0000 (UTC)
Received: from 87-207-217-222.dynamic.chello.pl ([87.207.217.222]:46902
	helo=mobilek) by s20.linuxpl.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.88)
	(envelope-from <artur@madrzak.eu>)
	id 1eCA9N-0002Dz-IU; Tue, 07 Nov 2017 21:07:09 +0100
Date: Tue, 7 Nov 2017 21:07:08 +0100
From: Artur =?utf-8?Q?M=C4=85drzak?= <artur@madrzak.eu>
To: openembedded-core@lists.openembedded.org
Message-ID: <20171107200707.GA9864@mobilek>
MIME-Version: 1.0
User-Agent: Mutt/1.9.1 (2017-09-22)
Subject: [morty][PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Tue, 07 Nov 2017 20:07:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The WIC's 'part' can now give a name for GPT partition in WKS file.
It's similar to '--label', but is naming partintions instead file systems.
It's required by some bootloaders to partitions have specified names.

Backport from master to be able generate SD card image for Dragonboard410c.

Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
---
 scripts/lib/wic/help.py                |  2 ++
 scripts/lib/wic/imager/direct.py       |  1 +
 scripts/lib/wic/ksparser.py            |  1 +
 scripts/lib/wic/partition.py           |  1 +
 scripts/lib/wic/utils/partitionedfs.py | 15 ++++++++++++++-
 5 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index e5347ec4b7..324499e438 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -727,6 +727,8 @@ DESCRIPTION
                             equal to 1.
                             The default value is 1.3.
 
+         --part-name: This option is specific to wic. It specifies name for GPT partitions.
+
          --part-type: This option is specific to wic. It specifies partition
                       type GUID for GPT partitions.
                       List of partition type GUIDS can be found here:
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 4c547e04a6..6cb209aa88 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -299,6 +299,7 @@ class DirectImageCreator(BaseImageCreator):
                                        boot=part.active,
                                        align=part.align,
                                        no_table=part.no_table,
+                                       part_name=part.part_name,
                                        part_type=part.part_type,
                                        uuid=part.uuid,
                                        system_id=part.system_id)
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 0894e2b199..3c99136144 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -134,6 +134,7 @@ class KickStart():
         part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk')
         part.add_argument("--overhead-factor", type=overheadtype, default=1.3)
+        part.add_argument('--part-name')
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
         part.add_argument('--size', type=sizetype, default=0)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ec3aa6622c..2ffe7e3350 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -51,6 +51,7 @@ class Partition():
         self.mountpoint = args.mountpoint
         self.no_table = args.no_table
         self.overhead_factor = args.overhead_factor
+        self.part_name = args.part_name
         self.part_type = args.part_type
         self.rootfs_dir = args.rootfs_dir
         self.size = args.size
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 9ea4a30cbb..d18fa1d489 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -91,7 +91,7 @@ class Image():
 
     def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
                       label=None, fsopts=None, boot=False, align=None, no_table=False,
-                      part_type=None, uuid=None, system_id=None):
+                      part_name=None, part_type=None, uuid=None, system_id=None):
         """ Add the next partition. Partitions have to be added in the
         first-to-last order. """
 
@@ -113,6 +113,7 @@ class Image():
                 'boot': boot, # Bootable flag
                 'align': align, # Partition alignment
                 'no_table' : no_table, # Partition does not appear in partition table
+                'part_name' : part_name, # Partition name
                 'part_type' : part_type, # Partition type
                 'uuid': uuid, # Partition UUID
                 'system_id': system_id} # Partition system id
@@ -146,6 +147,11 @@ class Image():
                 raise ImageError("setting custom partition type is not " \
                                  "implemented for msdos partitions")
 
+            if ptable_format == 'msdos' and part['part_name']:
+                raise ImageError("setting custom partition name is not " \
+                                 "implemented for msdos partitions")
+
+
             # Get the disk where the partition is located
             disk = self.disks[part['disk_name']]
             disk['numpart'] += 1
@@ -301,6 +307,13 @@ class Image():
             self.__create_partition(disk['disk'].device, part['type'],
                                     parted_fs_type, part['start'], part['size'])
 
+            if part['part_name']:
+                msger.debug("partition %d: set  name to %s" % \
+                            (part['num'], part['part_name']))
+                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
+                                         (part['num'], part['part_name'],
+                                          disk['disk'].device), self.native_sysroot)
+
             if part['part_type']:
                 msger.debug("partition %d: set type UID to %s" % \
                             (part['num'], part['part_type']))
-- 
2.13.6


