Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D893770A94
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 08 Aug 2014 14:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="573937748"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2014 15:06:46 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:46 -0500
Message-Id: <7c5b636db2cb1d11c5997a897b175e1940774502.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 21/35] wic: Clean up PartitionedMount
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:04 -0000

wic doesn't use a lot of ParitionedMount, so remove it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/partitionedfs.py | 355 +--------------------------------
 1 file changed, 2 insertions(+), 353 deletions(-)

diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 0c4c9ec..ef92125 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -33,18 +33,13 @@ MBR_OVERHEAD = 1
 SECTOR_SIZE = 512
 
 class PartitionedMount(Mount):
-    def __init__(self, mountdir, skipformat = False):
+    def __init__(self, mountdir):
         Mount.__init__(self, mountdir)
         self.disks = {}
         self.partitions = []
-        self.subvolumes = []
-        self.mapped = False
         self.mountOrder = []
         self.unmountOrder = []
         self.parted = find_binary_path("parted")
-        self.btrfscmd=None
-        self.skipformat = skipformat
-        self.snapshot_created = self.skipformat
         # Size of a sector used in calculations
         self.sector_size = SECTOR_SIZE
         self._partitions_layed_out = False
@@ -62,7 +57,6 @@ class PartitionedMount(Mount):
 
         self.disks[disk_name] = \
                 { 'disk': None,     # Disk object
-                  'mapped': False,  # True if kpartx mapping exists
                   'numpart': 0,     # Number of allocate partitions
                   'partitions': [], # Indexes to self.partitions
                   'offset': 0,      # Offset of next partition (in sectors)
@@ -98,40 +92,8 @@ class PartitionedMount(Mount):
         # Converting MB to sectors for parted
         size = size * 1024 * 1024 / self.sector_size
 
-        # We need to handle subvolumes for btrfs
-        if fstype == "btrfs" and fsopts and fsopts.find("subvol=") != -1:
-            self.btrfscmd=find_binary_path("btrfs")
-            subvol = None
-            opts = fsopts.split(",")
-            for opt in opts:
-                if opt.find("subvol=") != -1:
-                    subvol = opt.replace("subvol=", "").strip()
-                    break
-            if not subvol:
-                raise MountError("No subvolume: %s" % fsopts)
-            self.subvolumes.append({'size': size, # In sectors
-                                    'mountpoint': mountpoint, # Mount relative to chroot
-                                    'fstype': fstype, # Filesystem type
-                                    'fsopts': fsopts, # Filesystem mount options
-                                    'disk_name': disk_name, # physical disk name holding partition
-                                    'device': None, # kpartx device node for partition
-                                    'mount': None, # Mount object
-                                    'subvol': subvol, # Subvolume name
-                                    'boot': boot, # Bootable flag
-                                    'mounted': False # Mount flag
-                                   })
-
         # We still need partition for "/" or non-subvolume
-        if mountpoint == "/" or not fsopts or fsopts.find("subvol=") == -1:
-            # Don't need subvolume for "/" because it will be set as default subvolume
-            if fsopts and fsopts.find("subvol=") != -1:
-                opts = fsopts.split(",")
-                for opt in opts:
-                    if opt.strip().startswith("subvol="):
-                        opts.remove(opt)
-                        break
-                fsopts = ",".join(opts)
-
+        if mountpoint == "/" or not fsopts:
             part = { 'ks_pnum' : ks_pnum, # Partition number in the KS file
                      'size': size, # In sectors
                      'mountpoint': mountpoint, # Mount relative to chroot
@@ -283,10 +245,6 @@ class PartitionedMount(Mount):
     def __format_disks(self):
         self.layout_partitions()
 
-        if self.skipformat:
-            msger.debug("Skipping disk format, because skipformat flag is set.")
-            return
-
         for dev in self.disks.keys():
             d = self.disks[dev]
             msger.debug("Initializing partition table for %s" % \
@@ -346,103 +304,6 @@ class PartitionedMount(Mount):
                     self.__run_parted(["-s", d['disk'].device, "set",
                                        "%d" % p['num'], "lba", "off"])
 
-
-    def __map_partitions(self):
-        """Load it if dm_snapshot isn't loaded. """
-        load_module("dm_snapshot")
-
-        for dev in self.disks.keys():
-            d = self.disks[dev]
-            if d['mapped']:
-                continue
-
-            msger.debug("Running kpartx on %s" % d['disk'].device )
-            rc, kpartxOutput = runner.runtool([self.kpartx, "-l", "-v", d['disk'].device])
-            kpartxOutput = kpartxOutput.splitlines()
-
-            if rc != 0:
-                raise MountError("Failed to query partition mapping for '%s'" %
-                                 d['disk'].device)
-
-            # Strip trailing blank and mask verbose output
-            i = 0
-            while i < len(kpartxOutput) and kpartxOutput[i][0:4] != "loop":
-                i = i + 1
-            kpartxOutput = kpartxOutput[i:]
-
-            # Make sure kpartx reported the right count of partitions
-            if len(kpartxOutput) != d['numpart']:
-                # If this disk has more than 3 partitions, then in case of MBR
-                # paritions there is an extended parition. Different versions
-                # of kpartx behave differently WRT the extended partition -
-                # some map it, some ignore it. This is why we do the below hack
-                # - if kpartx reported one more partition and the partition
-                # table type is "msdos" and the amount of partitions is more
-                # than 3, we just assume kpartx mapped the extended parition
-                # and we remove it.
-                if len(kpartxOutput) == d['numpart'] + 1 \
-                   and d['ptable_format'] == 'msdos' and len(kpartxOutput) > 3:
-                    kpartxOutput.pop(3)
-                else:
-                    raise MountError("Unexpected number of partitions from " \
-                                     "kpartx: %d != %d" % \
-                                        (len(kpartxOutput), d['numpart']))
-
-            for i in range(len(kpartxOutput)):
-                line = kpartxOutput[i]
-                newdev = line.split()[0]
-                mapperdev = "/dev/mapper/" + newdev
-                loopdev = d['disk'].device + newdev[-1]
-
-                msger.debug("Dev %s: %s -> %s" % (newdev, loopdev, mapperdev))
-                pnum = d['partitions'][i]
-                self.partitions[pnum]['device'] = loopdev
-
-                # grub's install wants partitions to be named
-                # to match their parent device + partition num
-                # kpartx doesn't work like this, so we add compat
-                # symlinks to point to /dev/mapper
-                if os.path.lexists(loopdev):
-                    os.unlink(loopdev)
-                os.symlink(mapperdev, loopdev)
-
-            msger.debug("Adding partx mapping for %s" % d['disk'].device)
-            rc = runner.show([self.kpartx, "-v", "-a", d['disk'].device])
-
-            if rc != 0:
-                # Make sure that the device maps are also removed on error case.
-                # The d['mapped'] isn't set to True if the kpartx fails so
-                # failed mapping will not be cleaned on cleanup either.
-                runner.quiet([self.kpartx, "-d", d['disk'].device])
-                raise MountError("Failed to map partitions for '%s'" %
-                                 d['disk'].device)
-
-            # FIXME: there is a bit delay for multipath device setup,
-            # wait 10ms for the setup
-            import time
-            time.sleep(10)
-            d['mapped'] = True
-
-    def __unmap_partitions(self):
-        for dev in self.disks.keys():
-            d = self.disks[dev]
-            if not d['mapped']:
-                continue
-
-            msger.debug("Removing compat symlinks")
-            for pnum in d['partitions']:
-                if self.partitions[pnum]['device'] != None:
-                    os.unlink(self.partitions[pnum]['device'])
-                    self.partitions[pnum]['device'] = None
-
-            msger.debug("Unmapping %s" % d['disk'].device)
-            rc = runner.quiet([self.kpartx, "-d", d['disk'].device])
-            if rc != 0:
-                raise MountError("Failed to unmap partitions for '%s'" %
-                                 d['disk'].device)
-
-            d['mapped'] = False
-
     def __calculate_mountorder(self):
         msger.debug("Calculating mount order")
         for p in self.partitions:
@@ -457,7 +318,6 @@ class PartitionedMount(Mount):
     def cleanup(self):
         Mount.cleanup(self)
         if self.disks:
-            self.__unmap_partitions()
             for dev in self.disks.keys():
                 d = self.disks[dev]
                 try:
@@ -466,7 +326,6 @@ class PartitionedMount(Mount):
                     pass
 
     def unmount(self):
-        self.__unmount_subvolumes()
         for mp in self.unmountOrder:
             if mp == 'swap':
                 continue
@@ -478,217 +337,11 @@ class PartitionedMount(Mount):
 
             if p['mount'] != None:
                 try:
-                    # Create subvolume snapshot here
-                    if p['fstype'] == "btrfs" and p['mountpoint'] == "/" and not self.snapshot_created:
-                        self.__create_subvolume_snapshots(p, p["mount"])
                     p['mount'].cleanup()
                 except:
                     pass
                 p['mount'] = None
 
-    # Only for btrfs
-    def __get_subvolume_id(self, rootpath, subvol):
-        if not self.btrfscmd:
-            self.btrfscmd=find_binary_path("btrfs")
-        argv = [ self.btrfscmd, "subvolume", "list", rootpath ]
-
-        rc, out = runner.runtool(argv)
-        msger.debug(out)
-
-        if rc != 0:
-            raise MountError("Failed to get subvolume id from %s', return code: %d." % (rootpath, rc))
-
-        subvolid = -1
-        for line in out.splitlines():
-            if line.endswith(" path %s" % subvol):
-                subvolid = line.split()[1]
-                if not subvolid.isdigit():
-                    raise MountError("Invalid subvolume id: %s" % subvolid)
-                subvolid = int(subvolid)
-                break
-        return subvolid
-
-    def __create_subvolume_metadata(self, p, pdisk):
-        if len(self.subvolumes) == 0:
-            return
-
-        argv = [ self.btrfscmd, "subvolume", "list", pdisk.mountdir ]
-        rc, out = runner.runtool(argv)
-        msger.debug(out)
-
-        if rc != 0:
-            raise MountError("Failed to get subvolume id from %s', return code: %d." % (pdisk.mountdir, rc))
-
-        subvolid_items = out.splitlines()
-        subvolume_metadata = ""
-        for subvol in self.subvolumes:
-            for line in subvolid_items:
-                if line.endswith(" path %s" % subvol["subvol"]):
-                    subvolid = line.split()[1]
-                    if not subvolid.isdigit():
-                        raise MountError("Invalid subvolume id: %s" % subvolid)
-
-                    subvolid = int(subvolid)
-                    opts = subvol["fsopts"].split(",")
-                    for opt in opts:
-                        if opt.strip().startswith("subvol="):
-                            opts.remove(opt)
-                            break
-                    fsopts = ",".join(opts)
-                    subvolume_metadata += "%d\t%s\t%s\t%s\n" % (subvolid, subvol["subvol"], subvol['mountpoint'], fsopts)
-
-        if subvolume_metadata:
-            fd = open("%s/.subvolume_metadata" % pdisk.mountdir, "w")
-            fd.write(subvolume_metadata)
-            fd.close()
-
-    def __get_subvolume_metadata(self, p, pdisk):
-        subvolume_metadata_file = "%s/.subvolume_metadata" % pdisk.mountdir
-        if not os.path.exists(subvolume_metadata_file):
-            return
-
-        fd = open(subvolume_metadata_file, "r")
-        content = fd.read()
-        fd.close()
-
-        for line in content.splitlines():
-            items = line.split("\t")
-            if items and len(items) == 4:
-                self.subvolumes.append({'size': 0, # In sectors
-                                        'mountpoint': items[2], # Mount relative to chroot
-                                        'fstype': "btrfs", # Filesystem type
-                                        'fsopts': items[3] + ",subvol=%s" %  items[1], # Filesystem mount options
-                                        'disk_name': p['disk_name'], # physical disk name holding partition
-                                        'device': None, # kpartx device node for partition
-                                        'mount': None, # Mount object
-                                        'subvol': items[1], # Subvolume name
-                                        'boot': False, # Bootable flag
-                                        'mounted': False # Mount flag
-                                   })
-
-    def __create_subvolumes(self, p, pdisk):
-        """ Create all the subvolumes. """
-
-        for subvol in self.subvolumes:
-            argv = [ self.btrfscmd, "subvolume", "create", pdisk.mountdir + "/" + subvol["subvol"]]
-
-            rc = runner.show(argv)
-            if rc != 0:
-                raise MountError("Failed to create subvolume '%s', return code: %d." % (subvol["subvol"], rc))
-
-        # Set default subvolume, subvolume for "/" is default
-        subvol = None
-        for subvolume in self.subvolumes:
-            if subvolume["mountpoint"] == "/" and p['disk_name'] == subvolume['disk_name']:
-                subvol = subvolume
-                break
-
-        if subvol:
-            # Get default subvolume id
-            subvolid = self. __get_subvolume_id(pdisk.mountdir, subvol["subvol"])
-            # Set default subvolume
-            if subvolid != -1:
-                rc = runner.show([ self.btrfscmd, "subvolume", "set-default", "%d" % subvolid, pdisk.mountdir])
-                if rc != 0:
-                    raise MountError("Failed to set default subvolume id: %d', return code: %d." % (subvolid, rc))
-
-        self.__create_subvolume_metadata(p, pdisk)
-
-    def __mount_subvolumes(self, p, pdisk):
-        if self.skipformat:
-            # Get subvolume info
-            self.__get_subvolume_metadata(p, pdisk)
-            # Set default mount options
-            if len(self.subvolumes) != 0:
-                for subvol in self.subvolumes:
-                    if subvol["mountpoint"] == p["mountpoint"] == "/":
-                        opts = subvol["fsopts"].split(",")
-                        for opt in opts:
-                            if opt.strip().startswith("subvol="):
-                                opts.remove(opt)
-                                break
-                        pdisk.fsopts = ",".join(opts)
-                        break
-
-        if len(self.subvolumes) == 0:
-            # Return directly if no subvolumes
-            return
-
-        # Remount to make default subvolume mounted
-        rc = runner.show([self.umountcmd, pdisk.mountdir])
-        if rc != 0:
-            raise MountError("Failed to umount %s" % pdisk.mountdir)
-
-        rc = runner.show([self.mountcmd, "-o", pdisk.fsopts, pdisk.disk.device, pdisk.mountdir])
-        if rc != 0:
-            raise MountError("Failed to umount %s" % pdisk.mountdir)
-
-        for subvol in self.subvolumes:
-            if subvol["mountpoint"] == "/":
-                continue
-            subvolid = self. __get_subvolume_id(pdisk.mountdir, subvol["subvol"])
-            if subvolid == -1:
-                msger.debug("WARNING: invalid subvolume %s" % subvol["subvol"])
-                continue
-            # Replace subvolume name with subvolume ID
-            opts = subvol["fsopts"].split(",")
-            for opt in opts:
-                if opt.strip().startswith("subvol="):
-                    opts.remove(opt)
-                    break
-
-            opts.extend(["subvolrootid=0", "subvol=%s" % subvol["subvol"]])
-            fsopts = ",".join(opts)
-            subvol['fsopts'] = fsopts
-            mountpoint = self.mountdir + subvol['mountpoint']
-            makedirs(mountpoint)
-            rc = runner.show([self.mountcmd, "-o", fsopts, pdisk.disk.device, mountpoint])
-            if rc != 0:
-                raise MountError("Failed to mount subvolume %s to %s" % (subvol["subvol"], mountpoint))
-            subvol["mounted"] = True
-
-    def __unmount_subvolumes(self):
-        """ It may be called multiple times, so we need to chekc if it is still mounted. """
-        for subvol in self.subvolumes:
-            if subvol["mountpoint"] == "/":
-                continue
-            if not subvol["mounted"]:
-                continue
-            mountpoint = self.mountdir + subvol['mountpoint']
-            rc = runner.show([self.umountcmd, mountpoint])
-            if rc != 0:
-                raise MountError("Failed to unmount subvolume %s from %s" % (subvol["subvol"], mountpoint))
-            subvol["mounted"] = False
-
-    def __create_subvolume_snapshots(self, p, pdisk):
-        import time
-
-        if self.snapshot_created:
-            return
-
-        # Remount with subvolid=0
-        rc = runner.show([self.umountcmd, pdisk.mountdir])
-        if rc != 0:
-            raise MountError("Failed to umount %s" % pdisk.mountdir)
-        if pdisk.fsopts:
-            mountopts = pdisk.fsopts + ",subvolid=0"
-        else:
-            mountopts = "subvolid=0"
-        rc = runner.show([self.mountcmd, "-o", mountopts, pdisk.disk.device, pdisk.mountdir])
-        if rc != 0:
-            raise MountError("Failed to umount %s" % pdisk.mountdir)
-
-        # Create all the subvolume snapshots
-        snapshotts = time.strftime("%Y%m%d-%H%M")
-        for subvol in self.subvolumes:
-            subvolpath = pdisk.mountdir + "/" + subvol["subvol"]
-            snapshotpath = subvolpath + "_%s-1" % snapshotts
-            rc = runner.show([ self.btrfscmd, "subvolume", "snapshot", subvolpath, snapshotpath ])
-            if rc != 0:
-                raise MountError("Failed to create subvolume snapshot '%s' for '%s', return code: %d." % (snapshotpath, subvolpath, rc))
-
-        self.snapshot_created = True
-
     def __install_partition(self, num, source_file, start, size):
         """
         Install source_file contents into a partition.
@@ -734,7 +387,3 @@ class PartitionedMount(Mount):
         self.__calculate_mountorder()
 
         return
-
-    def resparse(self, size = None):
-        # Can't re-sparse a disk image - too hard
-        pass
-- 
1.8.3.1


