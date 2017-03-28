Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CD8BD77A8D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490704999; x=1522240999;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4ROxNAJmWxrsu/nVZXquKYb79cJXRL9uljA1zuTZo+8=;
	b=YThJHy663FjLV/pBrb4zscaqfNK2gRzshMSfvYIi3Bcjs6vVKdfVttDQ
	+vBHMY4rs2R+u/bhKlAETiUdI8Kf8Q==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 05:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="241207869"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2017 05:43:18 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CF8786A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:43:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:41:00 +0300
Message-Id: <8ef7b285d76cec5dc9d364146858d45ff95c6619.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/9] filemap: remove FilemapSeek class
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:18 -0000

FIEMAP API was added to Linux kernel 2.6.28 back in 2008
SEEK_HOLE and SEEK_DATA API was added much letter.
As FIEMAP is used by filemap module as a default API it's
safe to remove FileMpSeek class as it's never used.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 309 +++++++--------------------------------------
 1 file changed, 49 insertions(+), 260 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 080668e..34523c0 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -54,24 +54,46 @@ class Error(Exception):
     """A class for all the other exceptions raised by this module."""
     pass
 
+# Below goes the FIEMAP ioctl implementation, which is not very readable
+# because it deals with the rather complex FIEMAP ioctl. To understand the
+# code, you need to know the FIEMAP interface, which is documented in the
+# "Documentation/filesystems/fiemap.txt" file in the Linux kernel sources.
+
+# Format string for 'struct fiemap'
+_FIEMAP_FORMAT = "=QQLLLL"
+# sizeof(struct fiemap)
+_FIEMAP_SIZE = struct.calcsize(_FIEMAP_FORMAT)
+# Format string for 'struct fiemap_extent'
+_FIEMAP_EXTENT_FORMAT = "=QQQQQLLLL"
+# sizeof(struct fiemap_extent)
+_FIEMAP_EXTENT_SIZE = struct.calcsize(_FIEMAP_EXTENT_FORMAT)
+# The FIEMAP ioctl number
+_FIEMAP_IOCTL = 0xC020660B
+# This FIEMAP ioctl flag which instructs the kernel to sync the file before
+# reading the block map
+_FIEMAP_FLAG_SYNC = 0x00000001
+# Size of the buffer for 'struct fiemap_extent' elements which will be used
+# when invoking the FIEMAP ioctl. The larger is the buffer, the less times the
+# FIEMAP ioctl will be invoked.
+_FIEMAP_BUFFER_SIZE = 256 * 1024
 
-class _FilemapBase(object):
+class FilemapFiemap:
     """
-    This is a base class for a couple of other classes in this module. This
-    class simply performs the common parts of the initialization process: opens
-    the image file, gets its size, etc. The 'log' parameter is the logger object
-    to use for printing messages.
+    This class provides API to the FIEMAP ioctl. Namely, it allows to iterate
+    over all mapped blocks and over all holes.
+
+    This class synchronizes the image file every time it invokes the FIEMAP
+    ioctl in order to work-around early FIEMAP implementation kernel bugs.
     """
 
-    def __init__(self, image, log=None):
+    def __init__(self, image):
         """
-        Initialize a class instance. The 'image' argument is full path to the
-        file or file object to operate on.
+        Initialize a class instance. The 'image' argument is full the file
+        object to operate on.
         """
+        self._log = logging.getLogger(__name__)
 
-        self._log = log
-        if self._log is None:
-            self._log = logging.getLogger(__name__)
+        self._log.debug("FilemapFiemap: initializing")
 
         self._f_image_needs_close = False
 
@@ -113,240 +135,6 @@ class _FilemapBase(object):
         self._log.debug("block size %d, blocks count %d, image size %d"
                         % (self.block_size, self.blocks_cnt, self.image_size))
 
-    def __del__(self):
-        """The class destructor which just closes the image file."""
-        if self._f_image_needs_close:
-            self._f_image.close()
-
-    def _open_image_file(self):
-        """Open the image file."""
-        try:
-            self._f_image = open(self._image_path, 'rb')
-        except IOError as err:
-            raise Error("cannot open image file '%s': %s"
-                        % (self._image_path, err))
-
-        self._f_image_needs_close = True
-
-    def block_is_mapped(self, block): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. It returns
-        'True' if block number 'block' of the image file is mapped and 'False'
-        otherwise.
-        """
-
-        raise Error("the method is not implemented")
-
-    def block_is_unmapped(self, block): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. It returns
-        'True' if block number 'block' of the image file is not mapped (hole)
-        and 'False' otherwise.
-        """
-
-        raise Error("the method is not implemented")
-
-    def get_mapped_ranges(self, start, count): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. This is a
-        generator which yields ranges of mapped blocks in the file. The ranges
-        are tuples of 2 elements: [first, last], where 'first' is the first
-        mapped block and 'last' is the last mapped block.
-
-        The ranges are yielded for the area of the file of size 'count' blocks,
-        starting from block 'start'.
-        """
-
-        raise Error("the method is not implemented")
-
-    def get_unmapped_ranges(self, start, count): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. Just like
-        'get_mapped_ranges()', but yields unmapped block ranges instead
-        (holes).
-        """
-
-        raise Error("the method is not implemented")
-
-
-# The 'SEEK_HOLE' and 'SEEK_DATA' options of the file seek system call
-_SEEK_DATA = 3
-_SEEK_HOLE = 4
-
-def _lseek(file_obj, offset, whence):
-    """This is a helper function which invokes 'os.lseek' for file object
-    'file_obj' and with specified 'offset' and 'whence'. The 'whence'
-    argument is supposed to be either '_SEEK_DATA' or '_SEEK_HOLE'. When
-    there is no more data or hole starting from 'offset', this function
-    returns '-1'.  Otherwise the data or hole position is returned."""
-
-    try:
-        return os.lseek(file_obj.fileno(), offset, whence)
-    except OSError as err:
-        # The 'lseek' system call returns the ENXIO if there is no data or
-        # hole starting from the specified offset.
-        if err.errno == os.errno.ENXIO:
-            return -1
-        elif err.errno == os.errno.EINVAL:
-            raise ErrorNotSupp("the kernel or file-system does not support "
-                               "\"SEEK_HOLE\" and \"SEEK_DATA\"")
-        else:
-            raise
-
-class FilemapSeek(_FilemapBase):
-    """
-    This class uses the 'SEEK_HOLE' and 'SEEK_DATA' to find file block mapping.
-    Unfortunately, the current implementation requires the caller to have write
-    access to the image file.
-    """
-
-    def __init__(self, image, log=None):
-        """Refer the '_FilemapBase' class for the documentation."""
-
-        # Call the base class constructor first
-        _FilemapBase.__init__(self, image, log)
-        self._log.debug("FilemapSeek: initializing")
-
-        self._probe_seek_hole()
-
-    def _probe_seek_hole(self):
-        """
-        Check whether the system implements 'SEEK_HOLE' and 'SEEK_DATA'.
-        Unfortunately, there seems to be no clean way for detecting this,
-        because often the system just fakes them by just assuming that all
-        files are fully mapped, so 'SEEK_HOLE' always returns EOF and
-        'SEEK_DATA' always returns the requested offset.
-
-        I could not invent a better way of detecting the fake 'SEEK_HOLE'
-        implementation than just to create a temporary file in the same
-        directory where the image file resides. It would be nice to change this
-        to something better.
-        """
-
-        directory = os.path.dirname(self._image_path)
-
-        try:
-            tmp_obj = tempfile.TemporaryFile("w+", dir=directory)
-        except IOError as err:
-            raise ErrorNotSupp("cannot create a temporary in \"%s\": %s"
-                              % (directory, err))
-
-        try:
-            os.ftruncate(tmp_obj.fileno(), self.block_size)
-        except OSError as err:
-            raise ErrorNotSupp("cannot truncate temporary file in \"%s\": %s"
-                               % (directory, err))
-
-        offs = _lseek(tmp_obj, 0, _SEEK_HOLE)
-        if offs != 0:
-            # We are dealing with the stub 'SEEK_HOLE' implementation which
-            # always returns EOF.
-            self._log.debug("lseek(0, SEEK_HOLE) returned %d" % offs)
-            raise ErrorNotSupp("the file-system does not support "
-                               "\"SEEK_HOLE\" and \"SEEK_DATA\" but only "
-                               "provides a stub implementation")
-
-        tmp_obj.close()
-
-    def block_is_mapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        offs = _lseek(self._f_image, block * self.block_size, _SEEK_DATA)
-        if offs == -1:
-            result = False
-        else:
-            result = (offs // self.block_size == block)
-
-        self._log.debug("FilemapSeek: block_is_mapped(%d) returns %s"
-                        % (block, result))
-        return result
-
-    def block_is_unmapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        return not self.block_is_mapped(block)
-
-    def _get_ranges(self, start, count, whence1, whence2):
-        """
-        This function implements 'get_mapped_ranges()' and
-        'get_unmapped_ranges()' depending on what is passed in the 'whence1'
-        and 'whence2' arguments.
-        """
-
-        assert whence1 != whence2
-        end = start * self.block_size
-        limit = end + count * self.block_size
-
-        while True:
-            start = _lseek(self._f_image, end, whence1)
-            if start == -1 or start >= limit or start == self.image_size:
-                break
-
-            end = _lseek(self._f_image, start, whence2)
-            if end == -1 or end == self.image_size:
-                end = self.blocks_cnt * self.block_size
-            if end > limit:
-                end = limit
-
-            start_blk = start // self.block_size
-            end_blk = end // self.block_size - 1
-            self._log.debug("FilemapSeek: yielding range (%d, %d)"
-                            % (start_blk, end_blk))
-            yield (start_blk, end_blk)
-
-    def get_mapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapSeek: get_mapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        return self._get_ranges(start, count, _SEEK_DATA, _SEEK_HOLE)
-
-    def get_unmapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapSeek: get_unmapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        return self._get_ranges(start, count, _SEEK_HOLE, _SEEK_DATA)
-
-
-# Below goes the FIEMAP ioctl implementation, which is not very readable
-# because it deals with the rather complex FIEMAP ioctl. To understand the
-# code, you need to know the FIEMAP interface, which is documented in the
-# "Documentation/filesystems/fiemap.txt" file in the Linux kernel sources.
-
-# Format string for 'struct fiemap'
-_FIEMAP_FORMAT = "=QQLLLL"
-# sizeof(struct fiemap)
-_FIEMAP_SIZE = struct.calcsize(_FIEMAP_FORMAT)
-# Format string for 'struct fiemap_extent'
-_FIEMAP_EXTENT_FORMAT = "=QQQQQLLLL"
-# sizeof(struct fiemap_extent)
-_FIEMAP_EXTENT_SIZE = struct.calcsize(_FIEMAP_EXTENT_FORMAT)
-# The FIEMAP ioctl number
-_FIEMAP_IOCTL = 0xC020660B
-# This FIEMAP ioctl flag which instructs the kernel to sync the file before
-# reading the block map
-_FIEMAP_FLAG_SYNC = 0x00000001
-# Size of the buffer for 'struct fiemap_extent' elements which will be used
-# when invoking the FIEMAP ioctl. The larger is the buffer, the less times the
-# FIEMAP ioctl will be invoked.
-_FIEMAP_BUFFER_SIZE = 256 * 1024
-
-class FilemapFiemap(_FilemapBase):
-    """
-    This class provides API to the FIEMAP ioctl. Namely, it allows to iterate
-    over all mapped blocks and over all holes.
-
-    This class synchronizes the image file every time it invokes the FIEMAP
-    ioctl in order to work-around early FIEMAP implementation kernel bugs.
-    """
-
-    def __init__(self, image, log=None):
-        """
-        Initialize a class instance. The 'image' argument is full the file
-        object to operate on.
-        """
-
-        # Call the base class constructor first
-        _FilemapBase.__init__(self, image, log)
-        self._log.debug("FilemapFiemap: initializing")
-
         self._buf_size = _FIEMAP_BUFFER_SIZE
 
         # Calculate how many 'struct fiemap_extent' elements fit the buffer
@@ -362,6 +150,21 @@ class FilemapFiemap(_FilemapBase):
         # Check if the FIEMAP ioctl is supported
         self.block_is_mapped(0)
 
+    def __del__(self):
+        """The class destructor which just closes the image file."""
+        if self._f_image_needs_close:
+            self._f_image.close()
+
+    def _open_image_file(self):
+        """Open the image file."""
+        try:
+            self._f_image = open(self._image_path, 'rb')
+        except IOError as err:
+            raise Error("cannot open image file '%s': %s"
+                        % (self._image_path, err))
+
+        self._f_image_needs_close = True
+
     def _invoke_fiemap(self, block, count):
         """
         Invoke the FIEMAP ioctl for 'count' blocks of the file starting from
@@ -515,24 +318,10 @@ class FilemapFiemap(_FilemapBase):
                             % (hole_first, start + count - 1))
             yield (hole_first, start + count - 1)
 
-def filemap(image, log=None):
-    """
-    Create and return an instance of a Filemap class - 'FilemapFiemap' or
-    'FilemapSeek', depending on what the system we run on supports. If the
-    FIEMAP ioctl is supported, an instance of the 'FilemapFiemap' class is
-    returned. Otherwise, if 'SEEK_HOLE' is supported an instance of the
-    'FilemapSeek' class is returned. If none of these are supported, the
-    function generates an 'Error' type exception.
-    """
-
-    try:
-        return FilemapFiemap(image, log)
-    except ErrorNotSupp:
-        return FilemapSeek(image, log)
 
 def sparse_copy(src_fname, dst_fname, offset=0, skip=0):
     """Efficiently copy sparse file to or into another file."""
-    fmap = filemap(src_fname)
+    fmap = FilemapFiemap(src_fname)
     try:
         dst_file = open(dst_fname, 'r+b')
     except IOError:
-- 
2.1.4


