Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0803AC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 11:40:27 +0000 (UTC)
Subject: [PATCH] [WIC] Configurable addressing of GTP main table
To: openembedded-core@lists.openembedded.org
From: davide.cardillo@seco.com
X-Originating-Location: Florence, Tuscany, IT (94.89.17.99)
X-Originating-Platform: Linux Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Jan 2024 00:23:46 -0800
Message-ID: <PFKW.1705652626289844798.6eW0@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="h5EEC8WXheWC5siKFw19"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194032

--h5EEC8WXheWC5siKFw19
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Issue:
the usage of a gpt table with i.MX processor is not compatible by default.
This is due to a memory conflict: the main partition table is placed into
the same memory space used to flash the header of the U-Boot. This last
can not be moved since the ROM code of the i.MX6 starts to read to that
fixed address (0x400).
This problem can be solved using a feature of the GTP partition table for
witch the main table can be moved to a desired memory area.
The WIC library present in poky manages the GTP table through some
standard Linux commands (gdisk and sgdisk) which ones have already the
opportunity to perform this task.
This patch introduces this feature with the addition of some wic's options,
used also in wks file.

New partition placement behavior:
Since now all partitions are placed after the gpt table presents into the
first 1KB of memory (including both the gpt header at the first byte of
memory and the main partition table staring at 0x400).
Now the main gpt table can be placed in other address spaces and a partitio=
n
can be placed also before the gpt table. Recap:
- by default, all partitions are placed sequentially, one after the other.
The first partition implicitly starts after the GPT partition table.
- adding a flag to the item of a partition into the wks file, the partition
can be placed, starting from a fixed memory offset (neglecting the memory
space occupied by the GTP table).
Combining the moving of the main partition table and the absolute (not yet
relative) positioning of a partition, now it is possible to place one or mo=
re
partitions before the GPT table.

New flags:
- main-ptable-offset (size in KB): to add as property of the bootloader ite=
m.
Specifies the main partition table location in KB.
- fixed-align (boolean): to add as property of a partition. Specifies that =
the
partition must to placed with absolute offset, used in conjunction with --a=
lign
property

Example:
setting used for a wic for an i.MX6 processor, where the main partition tab=
le is
placed with the absolute offset of 4MB

bootloader --ptable gpt --main-ptable-offset 4096K
part / --source rawcopy --sourceparams=3D"file=3Du-boot.imx" --ondisk mmcbl=
k --align 1 --size 1M --no-table --fixed-align

Test environment:
This patch is a part of Edgehog OS (https://git.seco.com/edgehog) a
custom Yocto distribution by SECO SpA (www.seco.com), used on multiple
architectures (both ARM and x86).
This solution is widely used by all SECO customers who use hardware
solution based on NXP i.MX6 processors.

Signed-off-by: Davide Cardillo <davide.cardillo@seco.com>
Reviewed-by: Tobias Poganiuch <tobias.poganiuch@seco.com>
Tested-by: Andrea Da Col <andrea.dacol@seco.com>
Tested-by: Daniel Rinaldi <daniel.rinaldi@seco.com>
---
scripts/lib/wic/ksparser.py =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A02 +
scripts/lib/wic/partition.py =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A01 +
scripts/lib/wic/plugins/imager/direct.py | 102 +++++++++++++++++++++--
scripts/wic =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A02 +-
4 files changed, 98 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 0df9eb0d05..45db2eaa5d 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -148,6 +148,7 @@ class KickStart():
part =3D subparsers.add_parser('part')
part.add_argument('mountpoint', nargs=3D'?')
part.add_argument('--active', action=3D'store_true')
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0part.add_argument('--fixed-alig=
n', action=3D'store_true')
part.add_argument('--align', type=3Dint)
part.add_argument('--offset', type=3Dsizetype("K", True))
part.add_argument('--exclude-path', nargs=3D'+')
@@ -194,6 +195,7 @@ class KickStart():
default=3D'msdos')
bootloader.add_argument('--timeout', type=3Dint)
bootloader.add_argument('--source')
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bootloader.add_argument('--main=
-ptable-offset', type=3Dsizetype("K"), default=3D0)

include =3D subparsers.add_parser('include')
include.add_argument('path', type=3Dcannedpathtype)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 5275da6ed3..1bd2b457cd 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -26,6 +26,7 @@ class Partition():
self.args =3D args
self.active =3D args.active
self.align =3D args.align
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.fixed_align =3D args.fixed=
_align
self.disk =3D args.disk
self.device =3D None
self.extra_space =3D args.extra_space
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index 165fc2979f..efa4d7804e 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -16,6 +16,7 @@ import random
import shutil
import tempfile
import uuid
+import operator

from time import strftime

@@ -66,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
self.workdir =3D self.setup_workdir(options.workdir)
self._image =3D None
self.ptable_format =3D self.ks.bootloader.ptable
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.main_ptable_offset =3D sel=
f.ks.bootloader.main_ptable_offset
self.parts =3D self.ks.partitions

# as a convenience, set source to the boot partition source
@@ -77,6 +79,7 @@ class DirectPlugin(ImagerPlugin):

image_path =3D self._full_path(self.workdir, self.parts[0].disk, "direct")
self._image =3D PartitionedImage(image_path, self.ptable_format,
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0self.main_ptable_offset,
self.parts, self.native_sysroot,
options.extra_space)

@@ -294,15 +297,27 @@ GPT_OVERHEAD =3D 34
# Size of a sector in bytes
SECTOR_SIZE =3D 512

+class memoryRegion():
+ =C2=A0=C2=A0=C2=A0def __init__(self):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.start_sector =3D 1
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.end_sector =3D 1
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.part_num =3D 0
+
+ =C2=A0=C2=A0=C2=A0def __init__(self, part_num, start_sec, end_sec):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.part_num =3D part_num
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.start_sector =3D start_sec
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.end_sector =3D end_sec
+
class PartitionedImage():
"""
Partitioned image in a file.
"""

- =C2=A0=C2=A0=C2=A0def __init__(self, path, ptable_format, partitions, nat=
ive_sysroot=3DNone, extra_space=3D0):
+ =C2=A0=C2=A0=C2=A0def __init__(self, path, ptable_format, main_ptable_off=
set, partitions, native_sysroot=3DNone, extra_space=3D0):
self.path =3D path =C2=A0# Path to the image file
self.numpart =3D 0 =C2=A0# Number of allocated partitions
self.realpart =3D 0 # Number of partitions in the partition table
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.fixedalign_part =3D 0 # Nu=
mber of partitions with absolute alignment
self.primary_part_num =3D 0 =C2=A0# Number of primary partitions (msdos)
self.extendedpart =3D 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# Create extended par=
tition before this logical partition (msdos)
self.extended_size_sec =3D 0 # Size of exteded partition (msdos)
@@ -311,11 +326,13 @@ class PartitionedImage():
self.min_size =3D 0 # Minimum required disk size to fit
# all partitions (in bytes)
self.ptable_format =3D ptable_format =C2=A0# Partition table format
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.main_ptable_offset =3D mai=
n_ptable_offset # for GPT table, offset
# Disk system identifier
self.identifier =3D random.SystemRandom().randint(1, 0xffffffff)

self.partitions =3D partitions
self.partimages =3D []
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.used_memory_region =3D []
# Size of a sector used in calculations
self.sector_size =3D SECTOR_SIZE
self.native_sysroot =3D native_sysroot
@@ -368,6 +385,30 @@ class PartitionedImage():
# Converting kB to sectors for parted
part.size_sec =3D part.disk_size * 1024 // self.sector_size

+ =C2=A0=C2=A0=C2=A0def _add_busy_region(self, part_num, start_sec, end_sec=
):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.used_memory_region.append(=
memoryRegion(part_num, start_sec, end_sec))
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.used_memory_region =3D sor=
ted(self.used_memory_region, key=3Doperator.attrgetter('start_sector'))
+
+ =C2=A0=C2=A0=C2=A0def _print_busy_region_list(self):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list =3D "Busy memory region (i=
n sector)\n"
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list +=3D "\tpart#\tstart\tEnd\=
n"
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for num in range(len(self.used_=
memory_region)):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list +=
=3D"\t%s\t%s\t%s\n" % (self.used_memory_region[num].part_num, \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0self.used_memory_region[num].start_sector, self.used_memo=
ry_region[num].end_sector)
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0logger.debug(list)
+
+ =C2=A0=C2=A0=C2=A0def _check_memory_region(self, start_sec, end_sec ):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0""" Check if the specified regi=
on is already flagges as used. Returns
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0zero if not used, 1 otherwise""=
"
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for num in range(len(self.used_=
memory_region)):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0region =
=3D self.used_memory_region[num]
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ( ( =
region.start_sector < start_sec and start_sec < region.end_sector) or \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0( region.start_sector < end_sec a=
nd end_sec < region.end_sector) ):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return 1
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ( st=
art_sec < region.start_sector and end_sec > region.end_sector ):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return 1
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0
+
def layout_partitions(self):
""" Layout the partitions, meaning calculate the position of every
partition on the disk. The 'ptable_format' parameter defines the
@@ -379,6 +420,35 @@ class PartitionedImage():
# partitions not listed in the table are not included.
num_real_partitions =3D len([p for p in self.partitions if not p.no_table])

+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# The partitions flagged as fix=
ed alignment partition are placed into image
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# before the others. Instead, r=
elative-aligned partitions are placed in a
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# serialized fashion, with cont=
rol of the intersection of memory areas.
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# The base address of the relat=
ive-aligned partitions is, as before,
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# the maximum address accupied =
by the partition table
+
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# Flag as used the momoery requ=
ired for partition table
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._add_busy_region(-1, 0, MB=
R_OVERHEAD)
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if self.ptable_format =3D=3D "g=
pt":
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0offset =
=3D self.main_ptable_offset * 1024 // self.sector_size
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._a=
dd_busy_region(-1, offset, offset + GPT_OVERHEAD)
+
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# Search all partition with fix=
ed position into the image
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for num in range(len(self.parti=
tions)):
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0part =
=3D self.partitions[num]
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if not =
part.fixed_align:
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0continue
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if not =
part.no_table:
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0raise WicError("A partition with fixed alignment must hav=
e no_table flag set")
+
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0start_s=
ector =3D (part.align * 1024 // self.sector_size)
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0end_sec=
tor =3D start_sector + part.size_sec - 1
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if self=
._check_memory_region(start_sector, end_sector) =3D=3D 1:
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0self._print_busy_region_list()
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0raise WicError("A partition wants to use an already used =
memory region (sectors %d - %d)" \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0% (start_=
sector, end_sector))
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._a=
dd_busy_region(num, start_sector, end_sector)
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0part.st=
art =3D start_sector
+
# Go through partitions in the order they are added in .ks file
for num in range(len(self.partitions)):
part =3D self.partitions[num]
@@ -403,7 +473,7 @@ class PartitionedImage():
if self.ptable_format =3D=3D "msdos":
overhead =3D MBR_OVERHEAD
elif self.ptable_format =3D=3D "gpt":
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0overhead =3D GPT_OVERHEAD
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0overhead =3D (self.main_ptable_of=
fset * 1024 // self.sector_size) + GPT_OVERHEAD

# Skip one sector required for the partitioning scheme overhead
self.offset +=3D overhead
@@ -418,7 +488,7 @@ class PartitionedImage():
self.offset +=3D 2

align_sectors =3D 0
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if part=
.align:
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if not =
part.fixed_align and part.align:
# If not first partition and we do have alignment set we need
# to align the partition.
# FIXME: This leaves a empty spaces to the disk. To fill the
@@ -440,7 +510,7 @@ class PartitionedImage():
# increase the offset so we actually start the partition on right alignment
self.offset +=3D align_sectors

- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if part=
.offset is not None:
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if not =
part.fixed_align and part.offset is not None:
offset =3D part.offset // self.sector_size

if offset * self.sector_size !=3D part.offset:
@@ -455,14 +525,20 @@ class PartitionedImage():

self.offset =3D offset

- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0part.st=
art =3D self.offset
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.of=
fset +=3D part.size_sec
-
if not part.no_table:
part.num =3D self.realpart
else:
part.num =3D 0

+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if not =
part.fixed_align:
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0part.start =3D self.offset
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0self.offset +=3D part.size_sec
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if self._check_memory_region(part.start, self.offset) =3D=
=3D 1:
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._print_busy_region_list()
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0raise WicError("A partition wants=
 to use an already used memory region (sectors %d - %d)" \
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0% (part.s=
tart, self.offset))
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0self._add_busy_region(part.num, part.start, self.offset)
+
if self.ptable_format =3D=3D "msdos" and not part.no_table:
if part.type =3D=3D 'logical':
self.logical_part_cnt +=3D 1
@@ -482,12 +558,14 @@ class PartitionedImage():
"sectors (%d bytes).", part.mountpoint, part.disk,
part.num, part.start, self.offset - 1, part.size_sec,
part.size_sec * self.sector_size)
+
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._print_busy_region_list()

# Once all the partitions have been layed out, we can calculate the
# minumim disk size
self.min_size =3D self.offset
if self.ptable_format =3D=3D "gpt":
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.mi=
n_size +=3D GPT_OVERHEAD
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.mi=
n_size +=3D (self.main_ptable_offset * 1024 // self.sector_size) + GPT_OVER=
HEAD

self.min_size *=3D self.sector_size
self.min_size +=3D self.extra_space
@@ -606,6 +684,14 @@ class PartitionedImage():
exec_native_cmd("sfdisk --part-type %s %s %s" % \
(self.path, part.num, part.system_id),
self.native_sysroot)
+
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if self.ptable_format =3D=3D "g=
pt" and self.main_ptable_offset > 0:
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0main_pt=
able_sectors =3D self.main_ptable_offset * 1024 // self.sector_size
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0logger.=
debug("Move the main GPT partition table forward by %s sector(s)", main_pta=
ble_sectors)
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cmd =3D=
 "sgdisk -j %d %s" % (main_ptable_sectors, self.path)
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#cmd =
=3D "(echo -e 'x'; echo -e 'j' ; echo -e '%d'; echo -e 'w'; echo -e 'Y') | =
gdisk %s" % (main_ptable_sectors, self.path)
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0exec_na=
tive_cmd(cmd, self.native_sysroot)
+

def cleanup(self):
pass
diff --git a/scripts/wic b/scripts/wic
index 06e0b48db0..0c59a550ef 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -59,7 +59,7 @@ from wic import help as hlp

def wic_logger():
- =C2=A0=C2=A0=C2=A0"""Create and convfigure wic logger."""
+ =C2=A0=C2=A0=C2=A0"""Create and configure wic logger."""
logger =3D logging.getLogger('wic')
logger.setLevel(logging.INFO)

--
2.39.2

--h5EEC8WXheWC5siKFw19
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"font-family: monospace;"><br />Issue: <br />the usage of a g=
pt table with i.MX processor is not compatible by default. <br />This is du=
e to a memory conflict: the main partition table is placed into <br />the s=
ame memory space used to flash the header of the U-Boot. This last <br />ca=
n not be moved since the ROM code of the i.MX6 starts to read to that <br /=
>fixed address (0x400). <br />This problem can be solved using a feature of=
 the GTP partition table for <br />witch the main table can be moved to a d=
esired memory area. <br />The WIC library present in poky manages the GTP t=
able through some <br />standard Linux commands (gdisk and sgdisk) which on=
es have already the <br />opportunity to perform this task. <br />This patc=
h introduces this feature with the addition of some wic's options, <br />us=
ed also in wks file. <br /><br />New partition placement behavior: <br />Si=
nce now all partitions are placed after the gpt table presents into the <br=
 />first 1KB of memory (including both the gpt header at the first byte of =
<br />memory and the main partition table staring at 0x400). <br />Now the =
main gpt table can be placed in other address spaces and a partition <br />=
can be placed also before the gpt table. Recap: <br />- by default, all par=
titions are placed sequentially, one after the other. <br />The first parti=
tion implicitly starts after the GPT partition table. <br />- adding a flag=
 to the item of a partition into the wks file, the partition <br />can be p=
laced, starting from a fixed memory offset (neglecting the memory <br />spa=
ce occupied by the GTP table). <br />Combining the moving of the main parti=
tion table and the absolute (not yet <br />relative) positioning of a parti=
tion, now it is possible to place one or more <br />&nbsp;&nbsp;&nbsp;parti=
tions before the GPT table. <br /><br />New flags: <br />- main-ptable-offs=
et (size in KB): to add as property of the bootloader item. <br />Specifies=
 the main partition table location in KB. <br />- fixed-align (boolean): to=
 add as property of a partition. Specifies that the <br />partition must to=
 placed with absolute offset, used in conjunction with --align <br />proper=
ty <br /><br />Example: <br />setting used for a wic for an i.MX6 processor=
, where the main partition table is <br />placed with the absolute offset o=
f 4MB <br /><br />bootloader --ptable gpt --main-ptable-offset 4096K <br />=
part / --source rawcopy --sourceparams=3D"file=3Du-boot.imx" --ondisk mmcbl=
k --align 1 --size 1M --no-table --fixed-align <br /><br />Test environment=
: <br />This patch is a part of Edgehog OS (https://git.seco.com/edgehog) a=
 <br />custom Yocto distribution by SECO SpA (www.seco.com), used on multip=
le <br />architectures (both ARM and x86). <br />This solution is widely us=
ed by all SECO customers who use hardware <br />solution based on NXP i.MX6=
 processors. <br /><br />Signed-off-by: Davide Cardillo &lt;davide.cardillo=
@seco.com&gt; <br />Reviewed-by: Tobias Poganiuch &lt;tobias.poganiuch@seco=
.com&gt; <br />Tested-by: Andrea Da Col &lt;andrea.dacol@seco.com&gt; <br /=
>Tested-by: Daniel Rinaldi &lt;daniel.rinaldi@seco.com&gt; <br />--- <br />=
scripts/lib/wic/ksparser.py &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;2 + <br />scripts/lib/wic/part=
ition.py &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;| &nbsp;&nbsp;1 + <br />scripts/lib/wic/plugins/imager/direct.py | 10=
2 +++++++++++++++++++++-- <br />scripts/wic &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp=
;&nbsp;2 +- <br />4 files changed, 98 insertions(+), 9 deletions(-) <br /><=
br />diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py=
 <br />index 0df9eb0d05..45db2eaa5d 100644 <br />--- a/scripts/lib/wic/kspa=
rser.py <br />+++ b/scripts/lib/wic/ksparser.py <br />@@ -148,6 +148,7 @@ c=
lass KickStart(): <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;par=
t =3D subparsers.add_parser('part') <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;part.add_argument('mountpoint', nargs=3D'?') <br />&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part.add_argument('--active', action=
=3D'store_true') <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part.add=
_argument('--fixed-align', action=3D'store_true') <br />&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part.add_argument('--align', type=3Dint) <br /=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part.add_argument('--offse=
t', type=3Dsizetype("K", True)) <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;part.add_argument('--exclude-path', nargs=3D'+') <br />@@ -194,6=
 +195,7 @@ class KickStart(): <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;default=3D'msdos') <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;bootloader.add_argument('--timeout', type=3Dint) <br />&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bootloader.add_argument('--source') <br />+ &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bootloader.add_argument('--main-pta=
ble-offset', type=3Dsizetype("K"), default=3D0) <br />&nbsp;<br />&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;include =3D subparsers.add_parser('i=
nclude') <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;include.add_=
argument('path', type=3Dcannedpathtype) <br />diff --git a/scripts/lib/wic/=
partition.py b/scripts/lib/wic/partition.py <br />index 5275da6ed3..1bd2b45=
7cd 100644 <br />--- a/scripts/lib/wic/partition.py <br />+++ b/scripts/lib=
/wic/partition.py <br />@@ -26,6 +26,7 @@ class Partition(): <br />&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.args =3D args <br />&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.active =3D args.active <br />&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.align =3D args.align <br =
/>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.fixed_align =3D args.fix=
ed_align <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.disk =
=3D args.disk <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.de=
vice =3D None <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.ex=
tra_space =3D args.extra_space <br />diff --git a/scripts/lib/wic/plugins/i=
mager/direct.py b/scripts/lib/wic/plugins/imager/direct.py <br />index 165f=
c2979f..efa4d7804e 100644 <br />--- a/scripts/lib/wic/plugins/imager/direct=
.py <br />+++ b/scripts/lib/wic/plugins/imager/direct.py <br />@@ -16,6 +16=
,7 @@ import random <br />import shutil <br />import tempfile <br />import =
uuid <br />+import operator <br />&nbsp;<br />from time import strftime <br=
 />&nbsp;<br />@@ -66,6 +67,7 @@ class DirectPlugin(ImagerPlugin): <br />&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.workdir =3D self.setup_w=
orkdir(options.workdir) <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;self._image =3D None <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;self.ptable_format =3D self.ks.bootloader.ptable <br />+ &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;self.main_ptable_offset =3D self.ks.bootloader.m=
ain_ptable_offset <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sel=
f.parts =3D self.ks.partitions <br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;# as a convenience, set source to the boot partition =
source <br />@@ -77,6 +79,7 @@ class DirectPlugin(ImagerPlugin): <br />&nbs=
p;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;image_path =3D self=
._full_path(self.workdir, self.parts[0].disk, "direct") <br />&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self._image =3D PartitionedImage(image_p=
ath, self.ptable_format, <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.main_ptable_offset, <br />&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;self.parts, self.native_sysroot, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;options.extra_space) <br /=
>&nbsp;<br />@@ -294,15 +297,27 @@ GPT_OVERHEAD =3D 34 <br /># Size of a se=
ctor in bytes <br />SECTOR_SIZE =3D 512 <br />&nbsp;<br />+class memoryRegi=
on(): <br />+ &nbsp;&nbsp;&nbsp;def __init__(self): <br />+ &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;self.start_sector =3D 1 <br />+ &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;self.end_sector =3D 1 <br />+ &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;self.part_num =3D 0 <br />+ <br />+ &nbsp;&nbsp;&nbs=
p;def __init__(self, part_num, start_sec, end_sec): <br />+ &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;self.part_num =3D part_num <br />+ &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.start_sector =3D start_sec <br />+ &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.end_sector =3D end_sec <br />+ <br=
 />class PartitionedImage(): <br />&nbsp;&nbsp;&nbsp;&nbsp;""" <br />&nbsp;=
&nbsp;&nbsp;&nbsp;Partitioned image in a file. <br />&nbsp;&nbsp;&nbsp;&nbs=
p;""" <br />&nbsp;<br />- &nbsp;&nbsp;&nbsp;def __init__(self, path, ptable=
_format, partitions, native_sysroot=3DNone, extra_space=3D0): <br />+ &nbsp=
;&nbsp;&nbsp;def __init__(self, path, ptable_format, main_ptable_offset, pa=
rtitions, native_sysroot=3DNone, extra_space=3D0): <br />&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.path =3D path &nbsp;# Path to the image =
file <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.numpart =3D=
 0 &nbsp;# Number of allocated partitions <br />&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;self.realpart =3D 0 # Number of partitions in the part=
ition table <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.fixedali=
gn_part =3D 0 # Number of partitions with absolute alignment <br />&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.primary_part_num =3D 0 &nbsp;#=
 Number of primary partitions (msdos) <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;self.extendedpart =3D 0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Cr=
eate extended partition before this logical partition (msdos) <br />&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.extended_size_sec =3D 0 # Siz=
e of exteded partition (msdos) <br />@@ -311,11 +326,13 @@ class Partitione=
dImage(): <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.min_si=
ze =3D 0 # Minimum required disk size to fit <br />&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# all partitions (=
in bytes) <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.ptable=
_format =3D ptable_format &nbsp;# Partition table format <br />+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.main_ptable_offset =3D main_ptable_off=
set # for GPT table, offset <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;# Disk system identifier <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;self.identifier =3D random.SystemRandom().randint(1, 0xffffffff)=
 <br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.par=
titions =3D partitions <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;self.partimages =3D [] <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
self.used_memory_region =3D [] <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;# Size of a sector used in calculations <br />&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.sector_size =3D SECTOR_SIZE <br />&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.native_sysroot =3D native_sys=
root <br />@@ -368,6 +385,30 @@ class PartitionedImage(): <br />&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Converting k=
B to sectors for parted <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;part.size_sec =3D part.disk_size * 1024 // self.=
sector_size <br />&nbsp;<br />+ &nbsp;&nbsp;&nbsp;def _add_busy_region(self=
, part_num, start_sec, end_sec): <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;self.used_memory_region.append(memoryRegion(part_num, start_sec, en=
d_sec)) <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.used_memory_=
region =3D sorted(self.used_memory_region, key=3Doperator.attrgetter('start=
_sector')) <br />+ <br />+ &nbsp;&nbsp;&nbsp;def _print_busy_region_list(se=
lf): <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;list =3D "Busy memor=
y region (in sector)\n" <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;l=
ist +=3D "\tpart#\tstart\tEnd\n" <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;for num in range(len(self.used_memory_region)): <br />+ &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;list +=3D"\t%s\t%s\t=
%s\n" % (self.used_memory_region[num].part_num, \ <br />+ &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;se=
lf.used_memory_region[num].start_sector, self.used_memory_region[num].end_s=
ector) <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;logger.debug(list)=
 <br />+ <br />+ &nbsp;&nbsp;&nbsp;def _check_memory_region(self, start_sec=
, end_sec ): <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;""" Check if=
 the specified region is already flagges as used. Returns <br />+ &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;zero if not used, 1 otherwise""" <br />+ &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for num in range(len(self.used_mem=
ory_region)): <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;region =3D self.used_memory_region[num] <br />+ &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( ( region.start_sec=
tor &lt; start_sec and start_sec &lt; region.end_sector) or \ <br />+ &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;( region.start_sector &lt; end_sec and en=
d_sec &lt; region.end_sector) ): <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 1 <br />+ &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if ( start_=
sec &lt; region.start_sector and end_sec &gt; region.end_sector ): <br />+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;return 1 <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r=
eturn 0 <br />+ <br />&nbsp;&nbsp;&nbsp;&nbsp;def layout_partitions(self): =
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;""" Layout the partit=
ions, meaning calculate the position of every <br />&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;partition on the disk. The 'ptable_format' paramet=
er defines the <br />@@ -379,6 +420,35 @@ class PartitionedImage(): <br />&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# partitions not listed in t=
he table are not included. <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;num_real_partitions =3D len([p for p in self.partitions if not p.no_t=
able]) <br />&nbsp;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# The =
partitions flagged as fixed alignment partition are placed into image <br /=
>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# before the others. Instead, =
relative-aligned partitions are placed in a <br />+ &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;# serialized fashion, with control of the intersection o=
f memory areas. <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# The bas=
e address of the relative-aligned partitions is, as before, <br />+ &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# the maximum address accupied by the pa=
rtition table <br />+ <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# F=
lag as used the momoery required for partition table <br />+ &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;self._add_busy_region(-1, 0, MBR_OVERHEAD) <br =
/>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if self.ptable_format =3D=3D =
"gpt": <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;offset =3D self.main_ptable_offset * 1024 // self.sector_size <br />+=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self._ad=
d_busy_region(-1, offset, offset + GPT_OVERHEAD) <br />+ <br />+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Search all partition with fixed position =
into the image <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for num in=
 range(len(self.partitions)): <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part =3D self.partitions[num] <br />+ &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if not part.fixed=
_align: <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;continue <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if not part.no_table: <br />+ &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;raise WicError("A partition with fixed alignment must have no_tabl=
e flag set") <br />+ <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;start_sector =3D (part.align * 1024 // self.sector_size=
) <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;end_sector =3D start_sector + part.size_sec - 1 <br />+ &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if self._check_memory_regio=
n(start_sector, end_sector) =3D=3D 1: <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self._print_bu=
sy_region_list() <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;raise WicError("A partition wants t=
o use an already used memory region (sectors %d - %d)" \ <br />+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% (start_sector, end_s=
ector)) <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;self._add_busy_region(num, start_sector, end_sector) <br />+ &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part.start =3D s=
tart_sector <br />+ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#=
 Go through partitions in the order they are added in .ks file <br />&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for num in range(len(self.partiti=
ons)): <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;part =3D self.partitions[num] <br />@@ -403,7 +473,7 @@ class Par=
titionedImage(): <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if self.ptable_format =3D=3D "m=
sdos": <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;overhead =3D MBR_=
OVERHEAD <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;elif self.ptable_format =3D=3D "gpt": <=
br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;overhead =3D GPT_OVERHEAD <br=
 />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;overhead =3D (self.main_ptable_=
offset * 1024 // self.sector_size) + GPT_OVERHEAD <br />&nbsp;<br />&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;# Skip one sector required for the partitioning scheme overhe=
ad <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.offset +=3D overhead <br />@@ -418,7 +48=
8,7 @@ class PartitionedImage(): <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;self.offset +=3D 2 <br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;align_sectors =3D 0 <br />- &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if part.align=
: <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;if not part.fixed_align and part.align: <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# If no=
t first partition and we do have alignment set we need <br />&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;# to align the partition. <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# FIXME: This l=
eaves a empty spaces to the disk. To fill the <br />@@ -440,7 +510,7 @@ cla=
ss PartitionedImage(): <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#=
 increase the offset so we actually start the partition on right alignment =
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.offset +=3D align_s=
ectors <br />&nbsp;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;if part.offset is not None: <br />+ &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if not part.fixed_align and pa=
rt.offset is not None: <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;offset =3D part.offset //=
 self.sector_size <br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if offset * self.s=
ector_size !=3D part.offset: <br />@@ -455,14 +525,20 @@ class PartitionedI=
mage(): <br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.offset =3D offset <br /=
>&nbsp;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;part.start =3D self.offset <br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.offset +=3D part.size_sec <br />- <br =
/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i=
f not part.no_table: <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part.num =3D self.realpart =
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;else: <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part.num =3D 0 <br />&nbsp;<br />+ &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if not part.f=
ixed_align: <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;part.start =3D self.offset <br />+ &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;self.offset +=3D part.size_sec <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if self._ch=
eck_memory_region(part.start, self.offset) =3D=3D 1: <br />+ &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;self._print_busy_region_list() <br />+ &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;raise WicError("A partition wants to use an alr=
eady used memory region (sectors %d - %d)" \ <br />+ &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% (part.start, self.offset)) <br /=
>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;self._add_busy_region(part.num, part.start, self.offset) =
<br />+ <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;if self.ptable_format =3D=3D "msdos" and not part.no_table: <br =
/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;if part.type =3D=3D 'logical': <br />&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.logical_part_cnt +=3D 1 <br />@@ -482,12=
 +558,14 @@ class PartitionedImage(): <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"sectors (%d bytes).", part.mou=
ntpoint, part.disk, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;part.num, part.start, self.offset - 1, part.size_=
sec, <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;part.size_sec * self.sector_size) <br />+ &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />+ &nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;self._print_busy_region_list() <br />&nbsp;<br />&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Once all the partitions ha=
ve been layed out, we can calculate the <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;# minumim disk size <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;self.min_size =3D self.offset <br />&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;if self.ptable_format =3D=3D "gpt": <br />- &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.min_size=
 +=3D GPT_OVERHEAD <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;self.min_size +=3D (self.main_ptable_offset * 1024 // sel=
f.sector_size) + GPT_OVERHEAD <br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;self.min_size *=3D self.sector_size <br />&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.min_size +=3D self.extra_space <br=
 />@@ -606,6 +684,14 @@ class PartitionedImage(): <br />&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;exec_native_cmd("sfdisk --part-type %s %s %s" % \ <br />&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;(self.path, part.num, part.system_id), <br />&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self.native_sysroot) <br />+ &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;<br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if self.ptabl=
e_format =3D=3D "gpt" and self.main_ptable_offset &gt; 0: <br />+ &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;main_ptable_sector=
s =3D self.main_ptable_offset * 1024 // self.sector_size <br />+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;logger.debug("Move =
the main GPT partition table forward by %s sector(s)", main_ptable_sectors)=
 <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
cmd =3D "sgdisk -j %d %s" % (main_ptable_sectors, self.path) <br />+ &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#cmd =3D "(echo=
 -e 'x'; echo -e 'j' ; echo -e '%d'; echo -e 'w'; echo -e 'Y') | gdisk %s" =
% (main_ptable_sectors, self.path) <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exec_native_cmd(cmd, self.native_sysroot)=
 <br />+ <br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;def cleanup(self): <br /=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pass <br />diff --git a/sc=
ripts/wic b/scripts/wic <br />index 06e0b48db0..0c59a550ef 100755 <br />---=
 a/scripts/wic <br />+++ b/scripts/wic <br />@@ -59,7 +59,7 @@ from wic imp=
ort help as hlp <br />&nbsp;<br />&nbsp;<br />def wic_logger(): <br />- &nb=
sp;&nbsp;&nbsp;"""Create and convfigure wic logger.""" <br />+ &nbsp;&nbsp;=
&nbsp;"""Create and configure wic logger.""" <br />&nbsp;&nbsp;&nbsp;&nbsp;=
logger =3D logging.getLogger('wic') <br />&nbsp;&nbsp;&nbsp;&nbsp;logger.se=
tLevel(logging.INFO) <br />&nbsp;<br />-- &nbsp;<br />2.39.2<br /></span>

--h5EEC8WXheWC5siKFw19--

