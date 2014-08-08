Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6792070A6E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 15:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="369966542"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2014 15:03:52 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:52 -0500
Message-Id: <3029b5a26c278d4fb13c9d0c7c98145a4a195c01.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 27/35] wic: Update/rename/delete mount-related code
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:00 -0000

The wic code inherited a basic image-creation flow based on mounting
loop devices, but wic doesn't actually mount anything, so rename parts
of the code dealing with mounting to something more appropriate, and
remove related unused code.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/baseimager.py            | 47 +++++--------------------
 scripts/lib/mic/imager/direct.py                | 42 ++++++----------------
 scripts/lib/mic/plugins/imager/direct_plugin.py |  2 +-
 scripts/lib/mic/utils/partitionedfs.py          | 37 ++-----------------
 4 files changed, 22 insertions(+), 106 deletions(-)

diff --git a/scripts/lib/mic/imager/baseimager.py b/scripts/lib/mic/imager/baseimager.py
index 0d591ea..7f32dd5 100644
--- a/scripts/lib/mic/imager/baseimager.py
+++ b/scripts/lib/mic/imager/baseimager.py
@@ -97,41 +97,15 @@ class BaseImageCreator(object):
 
 
     #
-    # Properties
-    #
-    def __get_instroot(self):
-        if self.__builddir is None:
-            raise CreatorError("_instroot is not valid before calling mount()")
-        return self.__builddir + "/install_root"
-    _instroot = property(__get_instroot)
-    """The location of the install root directory.
-
-    This is the directory into which the system is installed. Subclasses may
-    mount a filesystem image here or copy files to/from here.
-
-    Note, this directory does not exist before ImageCreator.mount() is called.
-
-    Note also, this is a read-only attribute.
-
-    """
-
-
-    #
     # Hooks for subclasses
     #
-    def _mount_instroot(self, base_on = None):
-        """Mount or prepare the install root directory.
+    def _create(self):
+        """Create partitions for the disk image(s)
 
-        This is the hook where subclasses may prepare the install root by e.g.
-        mounting creating and loopback mounting a filesystem image to
-        _instroot.
+        This is the hook where subclasses may create the partitions
+        that will be assembled into disk image(s).
 
         There is no default implementation.
-
-        base_on -- this is the value passed to mount() and can be interpreted
-                   as the subclass wishes; it might e.g. be the location of
-                   a previously created ISO containing a system image.
-
         """
         pass
 
@@ -176,19 +150,16 @@ class BaseImageCreator(object):
 
         runner.show('umount -l %s' % self.workdir)
 
-    def mount(self):
-        """Setup the target filesystem in preparation for an install.
+    def create(self):
+        """Create partitions for the disk image(s)
 
-        This function sets up the filesystem which the ImageCreator will
-        install into and configure. The ImageCreator class merely creates an
-        install root directory, bind mounts some system directories (e.g. /dev)
-        and writes out /etc/fstab. Other subclasses may also e.g. create a
-        sparse file, format it and loopback mount it to the install root.
+        Create the partitions that will be assembled into disk
+        image(s).
         """
         self.__setup_tmpdir()
         self.__ensure_builddir()
 
-        self._mount_instroot()
+        self._create()
 
     def unmount(self):
         """Unmounts the target filesystem.
diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 2e6914b..b96740d 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -79,9 +79,10 @@ class DirectImageCreator(BaseImageCreator):
         self.staging_data_dir = staging_data_dir
 
     def __write_fstab(self, image_rootfs):
-        """overriden to generate fstab (temporarily) in rootfs. This
-        is called from mount_instroot, make sure it doesn't get called
-        from BaseImage.mount()"""
+        """overriden to generate fstab (temporarily) in rootfs. This is called
+        from _create, make sure it doesn't get called from
+        BaseImage.create()
+        """
         if image_rootfs is None:
             return None
 
@@ -217,29 +218,15 @@ class DirectImageCreator(BaseImageCreator):
     #
     # Actual implemention
     #
-    def _mount_instroot(self):
+    def _create(self):
         """
-        For 'wic', we already have our build artifacts and don't want
-        to loop mount anything to install into, we just create
+        For 'wic', we already have our build artifacts - we just create
         filesystems from the artifacts directly and combine them into
         a partitioned image.
-
-        We still want to reuse as much of the basic mic machinery
-        though; despite the fact that we don't actually do loop or any
-        other kind of mounting we still want to do many of the same
-        things to prepare images, so we basically just adapt to the
-        basic framework and reinterpret what 'mounting' means in our
-        context.
-
-        _instroot would normally be something like
-        /var/tmp/wic/build/imgcreate-s_9AKQ/install_root, for
-        installing packages, etc.  We don't currently need to do that,
-        so we simplify life by just using /var/tmp/wic/build as our
-        workdir.
         """
         parts = self._get_parts()
 
-        self.__instimage = PartitionedMount(self._instroot)
+        self.__instimage = PartitionedMount()
 
         for p in parts:
             # as a convenience, set source to the boot partition source
@@ -250,20 +237,11 @@ class DirectImageCreator(BaseImageCreator):
         for p in parts:
             # need to create the filesystems in order to get their
             # sizes before we can add them and do the layout.
-            # PartitionedMount.mount() actually calls __format_disks()
+            # PartitionedMount.create() actually calls __format_disks()
             # to create the disk images and carve out the partitions,
             # then self.install() calls PartitionedMount.install()
             # which calls __install_partitition() for each partition
-            # to dd the fs into the partitions.  It would be nice to
-            # be able to use e.g. ExtDiskMount etc to create the
-            # filesystems, since that's where existing e.g. mkfs code
-            # is, but those are only created after __format_disks()
-            # which needs the partition sizes so needs them created
-            # before its called.  Well, the existing setup is geared
-            # to installing packages into mounted filesystems - maybe
-            # when/if we need to actually do package selection we
-            # should modify things to use those objects, but for now
-            # we can avoid that.
+            # to dd the fs into the partitions.
 
             fstab = self.__write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
@@ -294,7 +272,7 @@ class DirectImageCreator(BaseImageCreator):
             self.__disks[disk_name] = disk_obj
             self.__instimage.add_disk(disk_name, disk_obj)
 
-        self.__instimage.mount()
+        self.__instimage.create()
 
     def install(self):
         """
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
index 793a736..da18b65 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -91,7 +91,7 @@ class DirectPlugin(ImagerPlugin):
                                             creatoropts)
 
         try:
-            creator.mount()
+            creator.create()
             creator.install()
             creator.configure()
             creator.print_outimage_info()
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 50536b4..43a38a9 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -33,11 +33,9 @@ MBR_OVERHEAD = 1
 SECTOR_SIZE = 512
 
 class PartitionedMount:
-    def __init__(self, mountdir):
+    def __init__(self):
         self.disks = {}
         self.partitions = []
-        self.mountOrder = []
-        self.unmountOrder = []
         self.parted = find_binary_path("parted")
         # Size of a sector used in calculations
         self.sector_size = SECTOR_SIZE
@@ -102,7 +100,6 @@ class PartitionedMount:
                      'label': label, # Partition label
                      'disk_name': disk_name, # physical disk name holding partition
                      'device': None, # kpartx device node for partition
-                     'mount': None, # Mount object
                      'num': None, # Partition number
                      'boot': boot, # Bootable flag
                      'align': align, # Partition alignment
@@ -303,17 +300,6 @@ class PartitionedMount:
                     self.__run_parted(["-s", d['disk'].device, "set",
                                        "%d" % p['num'], "lba", "off"])
 
-    def __calculate_mountorder(self):
-        msger.debug("Calculating mount order")
-        for p in self.partitions:
-            if p['mountpoint']:
-                self.mountOrder.append(p['mountpoint'])
-                self.unmountOrder.append(p['mountpoint'])
-
-        self.mountOrder.sort()
-        self.unmountOrder.sort()
-        self.unmountOrder.reverse()
-
     def cleanup(self):
         if self.disks:
             for dev in self.disks.keys():
@@ -323,23 +309,6 @@ class PartitionedMount:
                 except:
                     pass
 
-    def unmount(self):
-        for mp in self.unmountOrder:
-            if mp == 'swap':
-                continue
-            p = None
-            for p1 in self.partitions:
-                if p1['mountpoint'] == mp:
-                    p = p1
-                    break
-
-            if p['mount'] != None:
-                try:
-                    p['mount'].cleanup()
-                except:
-                    pass
-                p['mount'] = None
-
     def __install_partition(self, num, source_file, start, size):
         """
         Install source_file contents into a partition.
@@ -375,13 +344,11 @@ class PartitionedMount:
             self.__install_partition(p['num'], p['source_file'],
                                      p['start'], p['size'])
 
-    def mount(self):
+    def create(self):
         for dev in self.disks.keys():
             d = self.disks[dev]
             d['disk'].create()
 
         self.__format_disks()
 
-        self.__calculate_mountorder()
-
         return
-- 
1.8.3.1


