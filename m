Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EB1326FE7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 08 Aug 2014 14:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="573937688"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2014 15:06:35 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:42 -0500
Message-Id: <373d8ffd118ae4482bf4e7ae71a8102e2ce74cf8.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 17/35] wic: Remove gpt_parser
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:35 -0000

wic doesn't currently use it, so remove.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/plugins/source/bootimg-efi.py    |   4 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py |   8 +-
 scripts/lib/mic/utils/gpt_parser.py              | 331 -----------------------
 scripts/lib/mic/utils/partitionedfs.py           |  58 +---
 4 files changed, 11 insertions(+), 390 deletions(-)
 delete mode 100644 scripts/lib/mic/utils/gpt_parser.py

diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
index 95e1c05..d4a7771 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -78,9 +78,7 @@ class BootimgEFIPlugin(SourcePlugin):
         if cr._ptable_format == 'msdos':
             rootstr = rootdev
         else:
-            if not root_part_uuid:
-                raise MountError("Cannot find the root GPT partition UUID")
-            rootstr = "PARTUUID=%s" % root_part_uuid
+            raise MountError("Unsupported partition table format found")
 
         grubefi_conf += "linux %s root=%s rootwait %s\n" \
             % (kernel, rootstr, options)
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
index 9959645..3434320 100644
--- a/scripts/lib/mic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
@@ -50,9 +50,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         disk image.  In this case, we install the MBR.
         """
         mbrfile = "%s/syslinux/" % bootimg_dir
-        if cr._ptable_format == 'gpt':
-            mbrfile += "gptmbr.bin"
-        else:
+        if cr._ptable_format == 'msdos':
             mbrfile += "mbr.bin"
 
         if not os.path.exists(mbrfile):
@@ -110,9 +108,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         if cr._ptable_format == 'msdos':
             rootstr = rootdev
         else:
-            if not root_part_uuid:
-                raise MountError("Cannot find the root GPT partition UUID")
-            rootstr = "PARTUUID=%s" % root_part_uuid
+            raise MountError("Unsupported partition table format found")
 
         syslinux_conf += "APPEND label=boot root=%s %s\n" % (rootstr, options)
 
diff --git a/scripts/lib/mic/utils/gpt_parser.py b/scripts/lib/mic/utils/gpt_parser.py
deleted file mode 100644
index 5d43b70..0000000
--- a/scripts/lib/mic/utils/gpt_parser.py
+++ /dev/null
@@ -1,331 +0,0 @@
-#!/usr/bin/python -tt
-#
-# Copyright (c) 2013 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-""" This module implements a simple GPT partitions parser which can read the
-GPT header and the GPT partition table. """
-
-import struct
-import uuid
-import binascii
-from mic.utils.errors import MountError
-
-_GPT_HEADER_FORMAT = "<8s4sIIIQQQQ16sQIII"
-_GPT_HEADER_SIZE = struct.calcsize(_GPT_HEADER_FORMAT)
-_GPT_ENTRY_FORMAT = "<16s16sQQQ72s"
-_GPT_ENTRY_SIZE = struct.calcsize(_GPT_ENTRY_FORMAT)
-_SUPPORTED_GPT_REVISION = '\x00\x00\x01\x00'
-
-def _stringify_uuid(binary_uuid):
-    """ A small helper function to transform a binary UUID into a string
-    format. """
-
-    uuid_str = str(uuid.UUID(bytes_le = binary_uuid))
-
-    return uuid_str.upper()
-
-def _calc_header_crc(raw_hdr):
-    """ Calculate GPT header CRC32 checksum. The 'raw_hdr' parameter has to
-    be a list or a tuple containing all the elements of the GPT header in a
-    "raw" form, meaning that it should simply contain "unpacked" disk data.
-    """
-
-    raw_hdr = list(raw_hdr)
-    raw_hdr[3] = 0
-    raw_hdr = struct.pack(_GPT_HEADER_FORMAT, *raw_hdr)
-
-    return binascii.crc32(raw_hdr) & 0xFFFFFFFF
-
-def _validate_header(raw_hdr):
-    """ Validate the GPT header. The 'raw_hdr' parameter has to be a list or a
-    tuple containing all the elements of the GPT header in a "raw" form,
-    meaning that it should simply contain "unpacked" disk data. """
-
-    # Validate the signature
-    if raw_hdr[0] != 'EFI PART':
-        raise MountError("GPT partition table not found")
-
-    # Validate the revision
-    if raw_hdr[1] != _SUPPORTED_GPT_REVISION:
-        raise MountError("Unsupported GPT revision '%s', supported revision " \
-                         "is '%s'" % \
-                          (binascii.hexlify(raw_hdr[1]),
-                           binascii.hexlify(_SUPPORTED_GPT_REVISION)))
-
-    # Validate header size
-    if raw_hdr[2] != _GPT_HEADER_SIZE:
-        raise MountError("Bad GPT header size: %d bytes, expected %d" % \
-                         (raw_hdr[2], _GPT_HEADER_SIZE))
-
-    crc = _calc_header_crc(raw_hdr)
-    if raw_hdr[3] != crc:
-        raise MountError("GPT header crc mismatch: %#x, should be %#x" % \
-                         (crc, raw_hdr[3]))
-
-class GptParser:
-    """ GPT partition table parser. Allows reading the GPT header and the
-    partition table, as well as modifying the partition table records. """
-
-    def __init__(self, disk_path, sector_size = 512):
-        """ The class constructor which accepts the following parameters:
-            * disk_path - full path to the disk image or device node
-            * sector_size - size of a disk sector in bytes """
-
-        self.sector_size = sector_size
-        self.disk_path = disk_path
-
-        try:
-            self._disk_obj = open(disk_path, 'r+b')
-        except IOError as err:
-            raise MountError("Cannot open file '%s' for reading GPT " \
-                             "partitions: %s" % (disk_path, err))
-
-    def __del__(self):
-        """ The class destructor. """
-
-        self._disk_obj.close()
-
-    def _read_disk(self, offset, size):
-        """ A helper function which reads 'size' bytes from offset 'offset' of
-        the disk and checks all the error conditions. """
-
-        self._disk_obj.seek(offset)
-        try:
-            data = self._disk_obj.read(size)
-        except IOError as err:
-            raise MountError("cannot read from '%s': %s" % \
-                             (self.disk_path, err))
-
-        if len(data) != size:
-            raise MountError("cannot read %d bytes from offset '%d' of '%s', " \
-                             "read only %d bytes" % \
-                             (size, offset, self.disk_path, len(data)))
-
-        return data
-
-    def _write_disk(self, offset, buf):
-        """ A helper function which writes buffer 'buf' to offset 'offset' of
-        the disk. This function takes care of unaligned writes and checks all
-        the error conditions. """
-
-        # Since we may be dealing with a block device, we only can write in
-        # 'self.sector_size' chunks. Find the aligned starting and ending
-        # disk offsets to read.
-        start =  (offset / self.sector_size) * self.sector_size
-        end = ((start + len(buf)) / self.sector_size + 1) * self.sector_size
-
-        data = self._read_disk(start, end - start)
-        off = offset - start
-        data = data[:off] + buf + data[off + len(buf):]
-
-        self._disk_obj.seek(start)
-        try:
-            self._disk_obj.write(data)
-        except IOError as err:
-            raise MountError("cannot write to '%s': %s" % (self.disk_path, err))
-
-    def read_header(self, primary = True):
-        """ Read and verify the GPT header and return a dictionary containing
-        the following elements:
-
-        'signature'   : header signature
-        'revision'    : header revision
-        'hdr_size'    : header size in bytes
-        'hdr_crc'     : header CRC32
-        'hdr_lba'     : LBA of this header
-        'hdr_offs'    : byte disk offset of this header
-        'backup_lba'  : backup header LBA
-        'backup_offs' : byte disk offset of backup header
-        'first_lba'   : first usable LBA for partitions
-        'first_offs'  : first usable byte disk offset for partitions
-        'last_lba'    : last usable LBA for partitions
-        'last_offs'   : last usable byte disk offset for partitions
-        'disk_uuid'   : UUID of the disk
-        'ptable_lba'  : starting LBA of array of partition entries
-        'ptable_offs' : disk byte offset of the start of the partition table
-        'ptable_size' : partition table size in bytes
-        'entries_cnt' : number of available partition table entries
-        'entry_size'  : size of a single partition entry
-        'ptable_crc'  : CRC32 of the partition table
-        'primary'     : a boolean, if 'True', this is the primary GPT header,
-                        if 'False' - the secondary
-        'primary_str' : contains string "primary" if this is the primary GPT
-                        header, and "backup" otherwise
-
-        This dictionary corresponds to the GPT header format. Please, see the
-        UEFI standard for the description of these fields.
-
-        If the 'primary' parameter is 'True', the primary GPT header is read,
-        otherwise the backup GPT header is read instead. """
-
-        # Read and validate the primary GPT header
-        raw_hdr = self._read_disk(self.sector_size, _GPT_HEADER_SIZE)
-        raw_hdr = struct.unpack(_GPT_HEADER_FORMAT, raw_hdr)
-        _validate_header(raw_hdr)
-        primary_str = "primary"
-
-        if not primary:
-            # Read and validate the backup GPT header
-            raw_hdr = self._read_disk(raw_hdr[6] * self.sector_size, _GPT_HEADER_SIZE)
-            raw_hdr = struct.unpack(_GPT_HEADER_FORMAT, raw_hdr)
-            _validate_header(raw_hdr)
-            primary_str = "backup"
-
-        return { 'signature'   : raw_hdr[0],
-                 'revision'    : raw_hdr[1],
-                 'hdr_size'    : raw_hdr[2],
-                 'hdr_crc'     : raw_hdr[3],
-                 'hdr_lba'     : raw_hdr[5],
-                 'hdr_offs'    : raw_hdr[5] * self.sector_size,
-                 'backup_lba'  : raw_hdr[6],
-                 'backup_offs' : raw_hdr[6] * self.sector_size,
-                 'first_lba'   : raw_hdr[7],
-                 'first_offs'  : raw_hdr[7] * self.sector_size,
-                 'last_lba'    : raw_hdr[8],
-                 'last_offs'   : raw_hdr[8] * self.sector_size,
-                 'disk_uuid'   :_stringify_uuid(raw_hdr[9]),
-                 'ptable_lba'  : raw_hdr[10],
-                 'ptable_offs' : raw_hdr[10] * self.sector_size,
-                 'ptable_size' : raw_hdr[11] * raw_hdr[12],
-                 'entries_cnt' : raw_hdr[11],
-                 'entry_size'  : raw_hdr[12],
-                 'ptable_crc'  : raw_hdr[13],
-                 'primary'     : primary,
-                 'primary_str' : primary_str }
-
-    def _read_raw_ptable(self, header):
-        """ Read and validate primary or backup partition table. The 'header'
-        argument is the GPT header. If it is the primary GPT header, then the
-        primary partition table is read and validated, otherwise - the backup
-        one. The 'header' argument is a dictionary which is returned by the
-        'read_header()' method. """
-
-        raw_ptable = self._read_disk(header['ptable_offs'],
-                                     header['ptable_size'])
-
-        crc = binascii.crc32(raw_ptable) & 0xFFFFFFFF
-        if crc != header['ptable_crc']:
-            raise MountError("Partition table at LBA %d (%s) is corrupted" % \
-                             (header['ptable_lba'], header['primary_str']))
-
-        return raw_ptable
-
-    def get_partitions(self, primary = True):
-        """ This is a generator which parses the GPT partition table and
-        generates the following dictionary for each partition:
-
-        'index'       : the index of the partition table endry
-        'offs'        : byte disk offset of the partition table entry
-        'type_uuid'   : partition type UUID
-        'part_uuid'   : partition UUID
-        'first_lba'   : the first LBA
-        'last_lba'    : the last LBA
-        'flags'       : attribute flags
-        'name'        : partition name
-        'primary'     : a boolean, if 'True', this is the primary partition
-                        table, if 'False' - the secondary
-        'primary_str' : contains string "primary" if this is the primary GPT
-                        header, and "backup" otherwise
-
-        This dictionary corresponds to the GPT header format. Please, see the
-        UEFI standard for the description of these fields.
-
-        If the 'primary' parameter is 'True', partitions from the primary GPT
-        partition table are generated, otherwise partitions from the backup GPT
-        partition table are generated. """
-
-        if primary:
-            primary_str = "primary"
-        else:
-            primary_str = "backup"
-
-        header = self.read_header(primary)
-        raw_ptable = self._read_raw_ptable(header)
-
-        for index in xrange(0, header['entries_cnt']):
-            start = header['entry_size'] * index
-            end = start + header['entry_size']
-            raw_entry = struct.unpack(_GPT_ENTRY_FORMAT, raw_ptable[start:end])
-
-            if raw_entry[2] == 0 or raw_entry[3] == 0:
-                continue
-
-            part_name = str(raw_entry[5].decode('UTF-16').split('\0', 1)[0])
-
-            yield { 'index'       : index,
-                    'offs'        : header['ptable_offs'] + start,
-                    'type_uuid'   : _stringify_uuid(raw_entry[0]),
-                    'part_uuid'   : _stringify_uuid(raw_entry[1]),
-                    'first_lba'   : raw_entry[2],
-                    'last_lba'    : raw_entry[3],
-                    'flags'       : raw_entry[4],
-                    'name'        : part_name,
-                    'primary'     : primary,
-                    'primary_str' : primary_str }
-
-    def _change_partition(self, header, entry):
-        """ A helper function for 'change_partitions()' which changes a
-        a paricular instance of the partition table (primary or backup). """
-
-        if entry['index'] >= header['entries_cnt']:
-            raise MountError("Partition table at LBA %d has only %d "   \
-                             "records cannot change record number %d" % \
-                             (header['entries_cnt'], entry['index']))
-        # Read raw GPT header
-        raw_hdr = self._read_disk(header['hdr_offs'], _GPT_HEADER_SIZE)
-        raw_hdr = list(struct.unpack(_GPT_HEADER_FORMAT, raw_hdr))
-        _validate_header(raw_hdr)
-
-        # Prepare the new partition table entry
-        raw_entry = struct.pack(_GPT_ENTRY_FORMAT,
-                                uuid.UUID(entry['type_uuid']).bytes_le,
-                                uuid.UUID(entry['part_uuid']).bytes_le,
-                                entry['first_lba'],
-                                entry['last_lba'],
-                                entry['flags'],
-                                entry['name'].encode('UTF-16'))
-
-        # Write the updated entry to the disk
-        entry_offs = header['ptable_offs'] + \
-                     header['entry_size'] * entry['index']
-        self._write_disk(entry_offs, raw_entry)
-
-        # Calculate and update partition table CRC32
-        raw_ptable = self._read_disk(header['ptable_offs'],
-                                     header['ptable_size'])
-        raw_hdr[13] = binascii.crc32(raw_ptable) & 0xFFFFFFFF
-
-        # Calculate and update the GPT header CRC
-        raw_hdr[3] = _calc_header_crc(raw_hdr)
-
-        # Write the updated header to the disk
-        raw_hdr = struct.pack(_GPT_HEADER_FORMAT, *raw_hdr)
-        self._write_disk(header['hdr_offs'], raw_hdr)
-
-    def change_partition(self, entry):
-        """ Change a GPT partition. The 'entry' argument has the same format as
-        'get_partitions()' returns. This function simply changes the partition
-        table record corresponding to 'entry' in both, the primary and the
-        backup GPT partition tables. The parition table CRC is re-calculated
-        and the GPT headers are modified accordingly. """
-
-        # Change the primary partition table
-        header = self.read_header(True)
-        self._change_partition(header, entry)
-
-        # Change the backup partition table
-        header = self.read_header(False)
-        self._change_partition(header, entry)
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 83ce869..0c4c9ec 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -24,13 +24,10 @@ from mic import msger
 from mic.utils import runner
 from mic.utils.errors import MountError
 from mic.utils.fs_related import *
-from mic.utils.gpt_parser import GptParser
 from mic.utils.oe.misc import *
 
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
-# Overhead of the GPT partitioning scheme
-GPT_OVERHEAD = 34
 
 # Size of a sector in bytes
 SECTOR_SIZE = 512
@@ -148,21 +145,20 @@ class PartitionedMount(Mount):
                      'num': None, # Partition number
                      'boot': boot, # Bootable flag
                      'align': align, # Partition alignment
-                     'part_type' : part_type, # Partition type
-                     'partuuid': None } # Partition UUID (GPT-only)
+                     'part_type' : part_type } # Partition type
 
             self.__add_partition(part)
 
     def layout_partitions(self, ptable_format = "msdos"):
         """ Layout the partitions, meaning calculate the position of every
         partition on the disk. The 'ptable_format' parameter defines the
-        partition table format, and may be either "msdos" or "gpt". """
+        partition table format and may be "msdos". """
 
         msger.debug("Assigning %s partitions to disks" % ptable_format)
 
-        if ptable_format not in ('msdos', 'gpt'):
+        if ptable_format not in ('msdos'):
             raise MountError("Unknown partition table format '%s', supported " \
-                             "formats are: 'msdos' and 'gpt'" % ptable_format)
+                             "formats are: 'msdos'" % ptable_format)
 
         if self._partitions_layed_out:
             return
@@ -177,12 +173,12 @@ class PartitionedMount(Mount):
                 raise MountError("No disk %s for partition %s" \
                                  % (p['disk_name'], p['mountpoint']))
 
-            if p['part_type'] and ptable_format != 'gpt':
+            if p['part_type']:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
                 # filed at offset 3 of the partition entry.
-                raise MountError("setting custom partition type is only " \
-                                 "imlemented for GPT partitions")
+                raise MountError("setting custom partition type is not " \
+                                 "implemented for msdos partitions")
 
             # Get the disk where the partition is located
             d = self.disks[p['disk_name']]
@@ -192,8 +188,6 @@ class PartitionedMount(Mount):
             if d['numpart'] == 1:
                 if ptable_format == "msdos":
                     overhead = MBR_OVERHEAD
-                else:
-                    overhead = GPT_OVERHEAD
 
                 # Skip one sector required for the partitioning scheme overhead
                 d['offset'] += overhead
@@ -250,9 +244,6 @@ class PartitionedMount(Mount):
         # minumim disk sizes.
         for disk_name, d in self.disks.items():
             d['min_size'] = d['offset']
-            if d['ptable_format'] == 'gpt':
-                # Account for the backup partition table at the end of the disk
-                d['min_size'] += GPT_OVERHEAD
 
             d['min_size'] *= self.sector_size
 
@@ -339,10 +330,7 @@ class PartitionedMount(Mount):
                                     parted_fs_type, p['start'], p['size'])
 
             if p['boot']:
-                if d['ptable_format'] == 'gpt':
-                    flag_name = "legacy_boot"
-                else:
-                    flag_name = "boot"
+                flag_name = "boot"
                 msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
                             (flag_name, p['num'], d['disk'].device))
                 self.__run_parted(["-s", d['disk'].device, "set",
@@ -358,36 +346,6 @@ class PartitionedMount(Mount):
                     self.__run_parted(["-s", d['disk'].device, "set",
                                        "%d" % p['num'], "lba", "off"])
 
-        # If the partition table format is "gpt", find out PARTUUIDs for all
-        # the partitions. And if users specified custom parition type UUIDs,
-        # set them.
-        for disk_name, disk in self.disks.items():
-            if disk['ptable_format'] != 'gpt':
-                continue
-
-            pnum = 0
-            gpt_parser = GptParser(d['disk'].device, SECTOR_SIZE)
-            # Iterate over all GPT partitions on this disk
-            for entry in gpt_parser.get_partitions():
-                pnum += 1
-                # Find the matching partition in the 'self.partitions' list
-                for n in d['partitions']:
-                    p = self.partitions[n]
-                    if p['num'] == pnum:
-                        # Found, fetch PARTUUID (partition's unique ID)
-                        p['partuuid'] = entry['part_uuid']
-                        msger.debug("PARTUUID for partition %d on disk '%s' " \
-                                    "(mount point '%s') is '%s'" % (pnum, \
-                                    disk_name, p['mountpoint'], p['partuuid']))
-                        if p['part_type']:
-                            entry['type_uuid'] = p['part_type']
-                            msger.debug("Change type of partition %d on disk " \
-                                        "'%s' (mount point '%s') to '%s'" % \
-                                        (pnum, disk_name, p['mountpoint'],
-                                         p['part_type']))
-                            gpt_parser.change_partition(entry)
-
-            del gpt_parser
 
     def __map_partitions(self):
         """Load it if dm_snapshot isn't loaded. """
-- 
1.8.3.1


