Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C26B96FECD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2014 15:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="369966118"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2014 15:03:16 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:33 -0500
Message-Id: <c96208baeb9e8c182238851300c9fc14159ecc47.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 08/35] wic: Remove bmap support
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:22 -0000

wic doesn't use it, so remove it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/BmapCreate.py | 298 ------------------------------------
 1 file changed, 298 deletions(-)
 delete mode 100644 scripts/lib/mic/utils/BmapCreate.py

diff --git a/scripts/lib/mic/utils/BmapCreate.py b/scripts/lib/mic/utils/BmapCreate.py
deleted file mode 100644
index 65b19a5..0000000
--- a/scripts/lib/mic/utils/BmapCreate.py
+++ /dev/null
@@ -1,298 +0,0 @@
-""" This module implements the block map (bmap) creation functionality and
-provides the corresponding API in form of the 'BmapCreate' class.
-
-The idea is that while images files may generally be very large (e.g., 4GiB),
-they may nevertheless contain only little real data, e.g., 512MiB. This data
-are files, directories, file-system meta-data, partition table, etc. When
-copying the image to the target device, you do not have to copy all the 4GiB of
-data, you can copy only 512MiB of it, which is 4 times less, so copying should
-presumably be 4 times faster.
-
-The block map file is an XML file which contains a list of blocks which have to
-be copied to the target device. The other blocks are not used and there is no
-need to copy them. The XML file also contains some additional information like
-block size, image size, count of mapped blocks, etc. There are also many
-commentaries, so it is human-readable.
-
-The image has to be a sparse file. Generally, this means that when you generate
-this image file, you should start with a huge sparse file which contains a
-single hole spanning the entire file. Then you should partition it, write all
-the data (probably by means of loop-back mounting the image or parts of it),
-etc. The end result should be a sparse file where mapped areas represent useful
-parts of the image and holes represent useless parts of the image, which do not
-have to be copied when copying the image to the target device.
-
-This module uses the FIBMAP ioctl to detect holes. """
-
-# Disable the following pylint recommendations:
-#   *  Too many instance attributes - R0902
-#   *  Too few public methods - R0903
-# pylint: disable=R0902,R0903
-
-import hashlib
-from mic.utils.misc import human_size
-from mic.utils import Fiemap
-
-# The bmap format version we generate
-SUPPORTED_BMAP_VERSION = "1.3"
-
-_BMAP_START_TEMPLATE = \
-"""<?xml version="1.0" ?>
-<!-- This file contains the block map for an image file, which is basically
-     a list of useful (mapped) block numbers in the image file. In other words,
-     it lists only those blocks which contain data (boot sector, partition
-     table, file-system metadata, files, directories, extents, etc). These
-     blocks have to be copied to the target device. The other blocks do not
-     contain any useful data and do not have to be copied to the target
-     device.
-
-     The block map an optimization which allows to copy or flash the image to
-     the image quicker than copying of flashing the entire image. This is
-     because with bmap less data is copied: <MappedBlocksCount> blocks instead
-     of <BlocksCount> blocks.
-
-     Besides the machine-readable data, this file contains useful commentaries
-     which contain human-readable information like image size, percentage of
-     mapped data, etc.
-
-     The 'version' attribute is the block map file format version in the
-     'major.minor' format. The version major number is increased whenever an
-     incompatible block map format change is made. The minor number changes
-     in case of minor backward-compatible changes. -->
-
-<bmap version="%s">
-    <!-- Image size in bytes: %s -->
-    <ImageSize> %u </ImageSize>
-
-    <!-- Size of a block in bytes -->
-    <BlockSize> %u </BlockSize>
-
-    <!-- Count of blocks in the image file -->
-    <BlocksCount> %u </BlocksCount>
-
-"""
-
-class Error(Exception):
-    """ A class for exceptions generated by this module. We currently support
-    only one type of exceptions, and we basically throw human-readable problem
-    description in case of errors. """
-    pass
-
-class BmapCreate:
-    """ This class implements the bmap creation functionality. To generate a
-    bmap for an image (which is supposedly a sparse file), you should first
-    create an instance of 'BmapCreate' and provide:
-
-    * full path or a file-like object of the image to create bmap for
-    * full path or a file object to use for writing the results to
-
-    Then you should invoke the 'generate()' method of this class. It will use
-    the FIEMAP ioctl to generate the bmap. """
-
-    def _open_image_file(self):
-        """ Open the image file. """
-
-        try:
-            self._f_image = open(self._image_path, 'rb')
-        except IOError as err:
-            raise Error("cannot open image file '%s': %s" \
-                        % (self._image_path, err))
-
-        self._f_image_needs_close = True
-
-    def _open_bmap_file(self):
-        """ Open the bmap file. """
-
-        try:
-            self._f_bmap = open(self._bmap_path, 'w+')
-        except IOError as err:
-            raise Error("cannot open bmap file '%s': %s" \
-                        % (self._bmap_path, err))
-
-        self._f_bmap_needs_close = True
-
-    def __init__(self, image, bmap):
-        """ Initialize a class instance:
-        * image - full path or a file-like object of the image to create bmap
-                  for
-        * bmap  - full path or a file object to use for writing the resulting
-                  bmap to """
-
-        self.image_size = None
-        self.image_size_human = None
-        self.block_size = None
-        self.blocks_cnt = None
-        self.mapped_cnt = None
-        self.mapped_size = None
-        self.mapped_size_human = None
-        self.mapped_percent = None
-
-        self._mapped_count_pos1 = None
-        self._mapped_count_pos2 = None
-        self._sha1_pos = None
-
-        self._f_image_needs_close = False
-        self._f_bmap_needs_close = False
-
-        if hasattr(image, "read"):
-            self._f_image = image
-            self._image_path = image.name
-        else:
-            self._image_path = image
-            self._open_image_file()
-
-        if hasattr(bmap, "read"):
-            self._f_bmap = bmap
-            self._bmap_path = bmap.name
-        else:
-            self._bmap_path = bmap
-            self._open_bmap_file()
-
-        self.fiemap = Fiemap.Fiemap(self._f_image)
-
-        self.image_size = self.fiemap.image_size
-        self.image_size_human = human_size(self.image_size)
-        if self.image_size == 0:
-            raise Error("cannot generate bmap for zero-sized image file '%s'" \
-                        % self._image_path)
-
-        self.block_size = self.fiemap.block_size
-        self.blocks_cnt = self.fiemap.blocks_cnt
-
-    def _bmap_file_start(self):
-        """ A helper function which generates the starting contents of the
-        block map file: the header comment, image size, block size, etc. """
-
-        # We do not know the amount of mapped blocks at the moment, so just put
-        # whitespaces instead of real numbers. Assume the longest possible
-        # numbers.
-        mapped_count = ' ' * len(str(self.image_size))
-        mapped_size_human = ' ' * len(self.image_size_human)
-
-        xml = _BMAP_START_TEMPLATE \
-               % (SUPPORTED_BMAP_VERSION, self.image_size_human,
-                  self.image_size, self.block_size, self.blocks_cnt)
-        xml += "    <!-- Count of mapped blocks: "
-
-        self._f_bmap.write(xml)
-        self._mapped_count_pos1 = self._f_bmap.tell()
-
-        # Just put white-spaces instead of real information about mapped blocks
-        xml  = "%s or %.1f    -->\n" % (mapped_size_human, 100.0)
-        xml += "    <MappedBlocksCount> "
-
-        self._f_bmap.write(xml)
-        self._mapped_count_pos2 = self._f_bmap.tell()
-
-        xml  = "%s </MappedBlocksCount>\n\n" % mapped_count
-
-        # pylint: disable=C0301
-        xml += "    <!-- The checksum of this bmap file. When it is calculated, the value of\n"
-        xml += "         the SHA1 checksum has be zeoro (40 ASCII \"0\" symbols). -->\n"
-        xml += "    <BmapFileSHA1> "
-
-        self._f_bmap.write(xml)
-        self._sha1_pos = self._f_bmap.tell()
-
-        xml = "0" * 40 + " </BmapFileSHA1>\n\n"
-        xml += "    <!-- The block map which consists of elements which may either be a\n"
-        xml += "         range of blocks or a single block. The 'sha1' attribute (if present)\n"
-        xml += "         is the SHA1 checksum of this blocks range. -->\n"
-        xml += "    <BlockMap>\n"
-        # pylint: enable=C0301
-
-        self._f_bmap.write(xml)
-
-    def _bmap_file_end(self):
-        """ A helper function which generates the final parts of the block map
-        file: the ending tags and the information about the amount of mapped
-        blocks. """
-
-        xml =  "    </BlockMap>\n"
-        xml += "</bmap>\n"
-
-        self._f_bmap.write(xml)
-
-        self._f_bmap.seek(self._mapped_count_pos1)
-        self._f_bmap.write("%s or %.1f%%" % \
-                           (self.mapped_size_human, self.mapped_percent))
-
-        self._f_bmap.seek(self._mapped_count_pos2)
-        self._f_bmap.write("%u" % self.mapped_cnt)
-
-        self._f_bmap.seek(0)
-        sha1 = hashlib.sha1(self._f_bmap.read()).hexdigest()
-        self._f_bmap.seek(self._sha1_pos)
-        self._f_bmap.write("%s" % sha1)
-
-    def _calculate_sha1(self, first, last):
-        """ A helper function which calculates SHA1 checksum for the range of
-        blocks of the image file: from block 'first' to block 'last'. """
-
-        start = first * self.block_size
-        end = (last + 1) * self.block_size
-
-        self._f_image.seek(start)
-        hash_obj = hashlib.new("sha1")
-
-        chunk_size = 1024*1024
-        to_read = end - start
-        read = 0
-
-        while read < to_read:
-            if read + chunk_size > to_read:
-                chunk_size = to_read - read
-            chunk = self._f_image.read(chunk_size)
-            hash_obj.update(chunk)
-            read += chunk_size
-
-        return hash_obj.hexdigest()
-
-    def generate(self, include_checksums = True):
-        """ Generate bmap for the image file. If 'include_checksums' is 'True',
-        also generate SHA1 checksums for block ranges. """
-
-        # Save image file position in order to restore it at the end
-        image_pos = self._f_image.tell()
-
-        self._bmap_file_start()
-
-        # Generate the block map and write it to the XML block map
-        # file as we go.
-        self.mapped_cnt = 0
-        for first, last in self.fiemap.get_mapped_ranges(0, self.blocks_cnt):
-            self.mapped_cnt += last - first + 1
-            if include_checksums:
-                sha1 = self._calculate_sha1(first, last)
-                sha1 = " sha1=\"%s\"" % sha1
-            else:
-                sha1 = ""
-
-            if first != last:
-                self._f_bmap.write("        <Range%s> %s-%s </Range>\n" \
-                                   % (sha1, first, last))
-            else:
-                self._f_bmap.write("        <Range%s> %s </Range>\n" \
-                                   % (sha1, first))
-
-        self.mapped_size = self.mapped_cnt * self.block_size
-        self.mapped_size_human = human_size(self.mapped_size)
-        self.mapped_percent = (self.mapped_cnt * 100.0) /  self.blocks_cnt
-
-        self._bmap_file_end()
-
-        try:
-            self._f_bmap.flush()
-        except IOError as err:
-            raise Error("cannot flush the bmap file '%s': %s" \
-                        % (self._bmap_path, err))
-
-        self._f_image.seek(image_pos)
-
-    def __del__(self):
-        """ The class destructor which closes the opened files. """
-
-        if self._f_image_needs_close:
-            self._f_image.close()
-        if self._f_bmap_needs_close:
-            self._f_bmap.close()
-- 
1.8.3.1


