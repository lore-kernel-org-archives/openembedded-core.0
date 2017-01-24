Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DB95977202
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:07:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2017 06:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="1117122639"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2017 06:07:26 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4E5896A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:06:29 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 15:43:50 +0200
Message-Id: <28314679913d8e3d0e02a2f7bfa8eb452aee514a.1485264964.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485264964.git.ed.bartosh@linux.intel.com>
References: <cover.1485264964.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/8] wic: get rid of baseimager inheritance
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
X-List-Received-Date: Tue, 24 Jan 2017 14:07:27 -0000

Simplified DirectImageCreator code by removing inheritance
from BaseImageCreator. This inheritance doesn't make much sense
as DirectImageCreator is the only class that was inherited from
BaseImageCreator.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/baseimager.py | 191 -----------------------------------
 scripts/lib/wic/imager/direct.py     |  19 ++--
 2 files changed, 13 insertions(+), 197 deletions(-)
 delete mode 100644 scripts/lib/wic/imager/baseimager.py

diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
deleted file mode 100644
index 1a52dd8..0000000
--- a/scripts/lib/wic/imager/baseimager.py
+++ /dev/null
@@ -1,191 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2007 Red Hat  Inc.
-# Copyright (c) 2009, 2010, 2011 Intel, Inc.
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
-import os
-import tempfile
-import shutil
-
-from wic import msger
-from wic.utils.errors import CreatorError
-from wic.utils import runner
-
-class BaseImageCreator():
-    """Base class for image creation.
-
-    BaseImageCreator is the simplest creator class available; it will
-    create a system image according to the supplied kickstart file.
-
-    e.g.
-
-      import wic.imgcreate as imgcreate
-      ks = imgcreate.read_kickstart("foo.ks")
-      imgcreate.ImageCreator(ks, "foo").create()
-    """
-
-    def __del__(self):
-        self.cleanup()
-
-    def __init__(self, createopts=None):
-        """Initialize an ImageCreator instance.
-
-        ks -- a pykickstart.KickstartParser instance; this instance will be
-              used to drive the install by e.g. providing the list of packages
-              to be installed, the system configuration and %post scripts
-
-        name -- a name for the image; used for e.g. image filenames or
-                filesystem labels
-        """
-
-        self.__builddir = None
-
-        self.ks = None
-        self.name = "target"
-        self.tmpdir = "/var/tmp/wic"
-        self.workdir = "/var/tmp/wic/build"
-
-        # setup tmpfs tmpdir when enabletmpfs is True
-        self.enabletmpfs = False
-
-        if createopts:
-            # Mapping table for variables that have different names.
-            optmap = {"outdir" : "destdir",
-                     }
-
-            # update setting from createopts
-            for key in createopts:
-                if key in optmap:
-                    option = optmap[key]
-                else:
-                    option = key
-                setattr(self, option, createopts[key])
-
-            self.destdir = os.path.abspath(os.path.expanduser(self.destdir))
-
-        self._dep_checks = ["ls", "bash", "cp", "echo"]
-
-        # Output image file names
-        self.outimage = []
-
-        # No ks provided when called by convertor, so skip the dependency check
-        if self.ks:
-            # If we have btrfs partition we need to check necessary tools
-            for part in self.ks.partitions:
-                if part.fstype and part.fstype == "btrfs":
-                    self._dep_checks.append("mkfs.btrfs")
-                    break
-
-        # make sure the specified tmpdir and cachedir exist
-        if not os.path.exists(self.tmpdir):
-            os.makedirs(self.tmpdir)
-
-
-    #
-    # Hooks for subclasses
-    #
-    def _create(self):
-        """Create partitions for the disk image(s)
-
-        This is the hook where subclasses may create the partitions
-        that will be assembled into disk image(s).
-
-        There is no default implementation.
-        """
-        pass
-
-    def _cleanup(self):
-        """Undo anything performed in _create().
-
-        This is the hook where subclasses must undo anything which was
-        done in _create().
-
-        There is no default implementation.
-
-        """
-        pass
-
-    #
-    # Actual implementation
-    #
-    def __ensure_builddir(self):
-        if not self.__builddir is None:
-            return
-
-        try:
-            self.workdir = os.path.join(self.tmpdir, "build")
-            if not os.path.exists(self.workdir):
-                os.makedirs(self.workdir)
-            self.__builddir = tempfile.mkdtemp(dir=self.workdir,
-                                               prefix="imgcreate-")
-        except OSError as err:
-            raise CreatorError("Failed create build directory in %s: %s" %
-                               (self.tmpdir, err))
-
-    def __setup_tmpdir(self):
-        if not self.enabletmpfs:
-            return
-
-        runner.show('mount -t tmpfs -o size=4G tmpfs %s' % self.workdir)
-
-    def __clean_tmpdir(self):
-        if not self.enabletmpfs:
-            return
-
-        runner.show('umount -l %s' % self.workdir)
-
-    def create(self):
-        """Create partitions for the disk image(s)
-
-        Create the partitions that will be assembled into disk
-        image(s).
-        """
-        self.__setup_tmpdir()
-        self.__ensure_builddir()
-
-        self._create()
-
-    def cleanup(self):
-        """Undo anything performed in create().
-
-        Note, make sure to call this method once finished with the creator
-        instance in order to ensure no stale files are left on the host e.g.:
-
-          creator = ImageCreator(ks, name)
-          try:
-              creator.create()
-          finally:
-              creator.cleanup()
-
-        """
-        if not self.__builddir:
-            return
-
-        self._cleanup()
-
-        shutil.rmtree(self.__builddir, ignore_errors=True)
-        self.__builddir = None
-
-        self.__clean_tmpdir()
-
-
-    def print_outimage_info(self):
-        msg = "The new image can be found here:\n"
-        self.outimage.sort()
-        for path in self.outimage:
-            msg += '  %s\n' % os.path.abspath(path)
-
-        msger.info(msg)
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 52828c1..825c9d7 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -32,7 +32,6 @@ from wic import msger
 from wic.utils.oe.misc import get_bitbake_var
 from wic.utils.partitionedfs import Image
 from wic.utils.errors import CreatorError, ImageError
-from wic.imager.baseimager import BaseImageCreator
 from wic.plugin import pluginmgr
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd
 
@@ -61,7 +60,7 @@ class DiskImage():
 
         self.created = True
 
-class DirectImageCreator(BaseImageCreator):
+class DirectImageCreator:
     """
     Installs a system into a file containing a partitioned disk image.
 
@@ -72,15 +71,23 @@ class DirectImageCreator(BaseImageCreator):
     media and used on actual hardware.
     """
 
-    def __init__(self, oe_builddir, image_output_dir, rootfs_dir, bootimg_dir,
-                 kernel_dir, native_sysroot, compressor, creatoropts=None,
-                 bmap=False):
+    def __init__(self, oe_builddir, image_output_dir, rootfs_dir,
+                 bootimg_dir, kernel_dir, native_sysroot, compressor,
+                 creatoropts, bmap=False):
         """
         Initialize a DirectImageCreator instance.
 
         This method takes the same arguments as ImageCreator.__init__()
         """
-        BaseImageCreator.__init__(self, creatoropts)
+
+        self.name = creatoropts['name']
+        self.ks = creatoropts['ks']
+
+        self.tmpdir = "/var/tmp/wic"
+        self.workdir = "/var/tmp/wic/build"
+
+        if not os.path.exists(self.tmpdir):
+            os.makedirs(self.tmpdir)
 
         self.__image = None
         self.__disks = {}
-- 
2.1.4


