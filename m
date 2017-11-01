Return-Path: <artur@madrzak.eu>
Received: from s20.linuxpl.com (s20.linuxpl.com [78.46.68.78])
	by mail.openembedded.org (Postfix) with ESMTP id 841DD6011A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 08:38:24 +0000 (UTC)
Received: from 87-207-217-222.dynamic.chello.pl ([87.207.217.222]:50834
	helo=[192.168.0.106]) by s20.linuxpl.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.88)
	(envelope-from <artur@madrzak.eu>) id 1e9oXa-00024n-0g
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Nov 2017 09:38:26 +0100
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?Q?Artur_M=c4=85drzak?= <artur@madrzak.eu>
Message-ID: <c0403a3c-81c8-a22b-a90e-023a5d4c4436@madrzak.eu>
Date: Wed, 1 Nov 2017 09:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
Subject: [PATCH v2] wic: add 'part-name' argument for naming GPT
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
X-List-Received-Date: Wed, 01 Nov 2017 08:38:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

The WIC's 'part' can now give a name for GPT partition in WKS file.
It's similar to '--label', but is naming partintions instead file systems.
It's required by some bootloaders to partitions have specified names.

Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
---
  scripts/lib/wic/help.py                  |  2 ++
  scripts/lib/wic/ksparser.py              |  1 +
  scripts/lib/wic/partition.py             |  1 +
  scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
  4 files changed, 15 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index bd9c62e2e8..2ac45e052e 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -970,6 +970,8 @@ DESCRIPTION
                              This option cannot be used with --fixed-size
                              option.

+         --part-name: This option is specific to wic. It specifies name 
for GPT partitions.
+
           --part-type: This option is specific to wic. It specifies 
partition
                        type GUID for GPT partitions.
                        List of partition type GUIDS can be found here:
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 99b66eebc5..7850e81d2f 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -144,6 +144,7 @@ class KickStart():
          part.add_argument('--no-table', action='store_true')
          part.add_argument('--ondisk', '--ondrive', dest='disk', 
default='sda')
          part.add_argument("--overhead-factor", type=overheadtype)
+        part.add_argument('--part-name')
          part.add_argument('--part-type')
          part.add_argument('--rootfs-dir')

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b623bb9e6d..66e61ba70c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -51,6 +51,7 @@ class Partition():
          self.no_table = args.no_table
          self.num = None
          self.overhead_factor = args.overhead_factor
+        self.part_name = args.part_name
          self.part_type = args.part_type
          self.rootfs_dir = args.rootfs_dir
          self.size = args.size
diff --git a/scripts/lib/wic/plugins/imager/direct.py 
b/scripts/lib/wic/plugins/imager/direct.py
index 60317eed22..bdb8385620 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -366,6 +366,10 @@ class PartitionedImage():
          for num in range(len(self.partitions)):
              part = self.partitions[num]

+            if self.ptable_format == 'msdos' and part.part_name:
+                raise WicError("setting custom partition name is not " \
+                               "implemented for msdos partitions")
+
              if self.ptable_format == 'msdos' and part.part_type:
                  # The --part-type can also be implemented for MBR 
partitions,
                  # in which case it would map to the 1-byte "partition 
type"
@@ -519,6 +523,13 @@ class PartitionedImage():
              self._create_partition(self.path, part.type,
                                     parted_fs_type, part.start, 
part.size_sec)

+            if part.part_name:
+                logger.debug("partition %d: set name to %s",
+                             part.num, part.part_name)
+                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
+                                         (part.num, part.part_name,
+                                          self.path), self.native_sysroot)
+
              if part.part_type:
                  logger.debug("partition %d: set type UID to %s",
                               part.num, part.part_type)
-- 
2.13.6



