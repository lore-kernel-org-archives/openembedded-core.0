Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AA2E177069
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 02 Sep 2015 04:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="760751775"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2015 04:00:34 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id C80CF6A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:42 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:16 +0300
Message-Id: <7d1f085f70cffab8ac812a65956bbe9c39566c5c.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 16/17] wic: fix short variable names
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:35 -0000

Made short variable names longer and more readable.

Fixed pylint warnings "Invalid variable name" and
"Invalid argument name".

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/conf.py                            |   4 +-
 scripts/lib/wic/engine.py                          |  62 ++++-----
 scripts/lib/wic/imager/direct.py                   |  70 +++++-----
 scripts/lib/wic/kickstart/__init__.py              |  66 ++++-----
 .../lib/wic/kickstart/custom_commands/partition.py |  72 +++++-----
 .../lib/wic/kickstart/custom_commands/wicboot.py   |  12 +-
 scripts/lib/wic/msger.py                           |  13 +-
 scripts/lib/wic/plugin.py                          |   4 +-
 scripts/lib/wic/pluginbase.py                      |  14 +-
 scripts/lib/wic/plugins/imager/direct_plugin.py    |   4 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  26 ++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  28 ++--
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  32 ++---
 scripts/lib/wic/utils/partitionedfs.py             | 154 ++++++++++-----------
 scripts/lib/wic/utils/runner.py                    |  16 +--
 scripts/wic                                        |   4 +-
 16 files changed, 289 insertions(+), 292 deletions(-)

diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index 942c0c1..1d4363a 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -87,9 +87,9 @@ class ConfigMgr(object):
         if not ksconf:
             return
 
-        ks = kickstart.read_kickstart(ksconf)
+        ksobj = kickstart.read_kickstart(ksconf)
 
-        self.create['ks'] = ks
+        self.create['ks'] = ksobj
         self.create['name'] = os.path.splitext(os.path.basename(ksconf))[0]
 
         self.create['name'] = misc.build_name(ksconf,
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index ce942ea..76b93e8 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -53,17 +53,17 @@ def verify_build_env():
 CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
 SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
 
-def build_canned_image_list(dl):
+def build_canned_image_list(path):
     layers_path = misc.get_bitbake_var("BBLAYERS")
     canned_wks_layer_dirs = []
 
     if layers_path is not None:
         for layer_path in layers_path.split():
-            path = os.path.join(layer_path, SCRIPTS_CANNED_IMAGE_DIR)
-            canned_wks_layer_dirs.append(path)
+            cpath = os.path.join(layer_path, SCRIPTS_CANNED_IMAGE_DIR)
+            canned_wks_layer_dirs.append(cpath)
 
-    path = os.path.join(dl, CANNED_IMAGE_DIR)
-    canned_wks_layer_dirs.append(path)
+    cpath = os.path.join(path, CANNED_IMAGE_DIR)
+    canned_wks_layer_dirs.append(cpath)
 
     return canned_wks_layer_dirs
 
@@ -99,14 +99,13 @@ def list_canned_images(scripts_path):
                     continue
                 if fname.endswith(".wks"):
                     fullpath = os.path.join(canned_wks_dir, fname)
-                    f = open(fullpath, "r")
-                    lines = f.readlines()
-                    for line in lines:
-                        desc = ""
-                        idx = line.find("short-description:")
-                        if idx != -1:
-                            desc = line[idx + len("short-description:"):].strip()
-                            break
+                    with open(fullpath) as wks:
+                        for line in wks:
+                            desc = ""
+                            idx = line.find("short-description:")
+                            if idx != -1:
+                                desc = line[idx + len("short-description:"):].strip()
+                                break
                     basename = os.path.splitext(fname)[0]
                     print "  %s\t\t%s" % (basename.ljust(30), desc)
 
@@ -115,24 +114,23 @@ def list_canned_image_help(scripts_path, fullpath):
     """
     List the help and params in the specified canned image.
     """
-    f = open(fullpath, "r")
-    lines = f.readlines()
     found = False
-    for line in lines:
-        if not found:
-            idx = line.find("long-description:")
+    with open(fullpath) as wks:
+        for line in wks:
+            if not found:
+                idx = line.find("long-description:")
+                if idx != -1:
+                    print
+                    print line[idx + len("long-description:"):].strip()
+                    found = True
+                continue
+            if not line.strip():
+                break
+            idx = line.find("#")
             if idx != -1:
-                print
-                print line[idx + len("long-description:"):].strip()
-                found = True
-            continue
-        if not line.strip():
-            break
-        idx = line.find("#")
-        if idx != -1:
-            print line[idx + len("#:"):].rstrip()
-        else:
-            break
+                print line[idx + len("#:"):].rstrip()
+            else:
+                break
 
 
 def list_source_plugins():
@@ -186,10 +184,10 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     if debug:
         msger.set_loglevel('debug')
 
-    cr = creator.Creator()
+    crobj = creator.Creator()
 
-    cr.main(["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
-             wks_file, image_output_dir, oe_builddir, compressor or ""])
+    crobj.main(["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
+                wks_file, image_output_dir, oe_builddir, compressor or ""])
 
     print "\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file
 
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 761e436..31c0edc 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -80,11 +80,11 @@ class DirectImageCreator(BaseImageCreator):
         in the partition table and logical partitions
         """
         realnum = 0
-        for n, p in enumerate(parts, 1):
-            if not p.no_table:
+        for pnum, part in enumerate(parts, 1):
+            if not part.no_table:
                 realnum += 1
-            if n == num:
-                if  p.no_table:
+            if pnum == num:
+                if  part.no_table:
                     return 0
                 if self.ptable_format == 'msdos' and realnum > 3:
                     # account for logical partition numbering, ex. sda5..
@@ -154,9 +154,9 @@ class DirectImageCreator(BaseImageCreator):
         if not self.ks.handler.partition.partitions:
             partstr = "part / --size 1900 --ondisk sda --fstype=ext3"
             args = partstr.split()
-            pd = self.ks.handler.partition.parse(args[1:])
-            if pd not in self.ks.handler.partition.partitions:
-                self.ks.handler.partition.partitions.append(pd)
+            part = self.ks.handler.partition.parse(args[1:])
+            if part not in self.ks.handler.partition.partitions:
+                self.ks.handler.partition.partitions.append(part)
 
         # partitions list from kickstart file
         return kickstart.get_partitions(self.ks)
@@ -221,19 +221,19 @@ class DirectImageCreator(BaseImageCreator):
 
         self.__image = Image(self.native_sysroot)
 
-        for p in parts:
+        for part in parts:
             # as a convenience, set source to the boot partition source
             # instead of forcing it to be set via bootloader --source
-            if not self.ks.handler.bootloader.source and p.mountpoint == "/boot":
-                self.ks.handler.bootloader.source = p.source
+            if not self.ks.handler.bootloader.source and part.mountpoint == "/boot":
+                self.ks.handler.bootloader.source = part.source
 
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
-        for p in parts:
+        for part in parts:
             # get rootfs size from bitbake variable if it's not set in .ks file
-            if not p.size:
+            if not part.size:
                 # and if rootfs name is specified for the partition
-                image_name = p.get_rootfs()
+                image_name = part.get_rootfs()
                 if image_name:
                     # Bitbake variable ROOTFS_SIZE is calculated in
                     # Image._get_rootfs_size method from meta/lib/oe/image.py
@@ -242,7 +242,7 @@ class DirectImageCreator(BaseImageCreator):
                     rsize_bb = get_bitbake_var('ROOTFS_SIZE', image_name)
                     if rsize_bb:
                         # convert from Kb to Mb
-                        p.size = int(rsize_bb) / 1024
+                        part.size = int(rsize_bb) / 1024
             # need to create the filesystems in order to get their
             # sizes before we can add them and do the layout.
             # Image.create() actually calls __format_disks() to create
@@ -250,22 +250,22 @@ class DirectImageCreator(BaseImageCreator):
             # self.assemble() calls Image.assemble() which calls
             # __write_partitition() for each partition to dd the fs
             # into the partitions.
-            p.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
-                      self.bootimg_dir, self.kernel_dir, self.native_sysroot)
-
-
-            self.__image.add_partition(int(p.size),
-                                       p.disk,
-                                       p.mountpoint,
-                                       p.source_file,
-                                       p.fstype,
-                                       p.label,
-                                       fsopts=p.fsopts,
-                                       boot=p.active,
-                                       align=p.align,
-                                       no_table=p.no_table,
-                                       part_type=p.part_type,
-                                       uuid=p.uuid)
+            part.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
+                         self.bootimg_dir, self.kernel_dir, self.native_sysroot)
+
+
+            self.__image.add_partition(int(part.size),
+                                       part.disk,
+                                       part.mountpoint,
+                                       part.source_file,
+                                       part.fstype,
+                                       part.label,
+                                       fsopts=part.fsopts,
+                                       boot=part.active,
+                                       align=part.align,
+                                       no_table=part.no_table,
+                                       part_type=part.part_type,
+                                       uuid=part.uuid)
 
         if fstab_path:
             shutil.move(fstab_path + ".orig", fstab_path)
@@ -336,14 +336,14 @@ class DirectImageCreator(BaseImageCreator):
             msg += '  %s\n\n' % full_path
 
         msg += 'The following build artifacts were used to create the image(s):\n'
-        for p in parts:
-            if p.get_rootfs() is None:
+        for part in parts:
+            if part.get_rootfs() is None:
                 continue
-            if p.mountpoint == '/':
+            if part.mountpoint == '/':
                 suffix = ':'
             else:
-                suffix = '["%s"]:' % (p.mountpoint or p.label)
-            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), p.get_rootfs())
+                suffix = '["%s"]:' % (part.mountpoint or part.label)
+            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), part.get_rootfs())
 
         msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
         msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
index 111723b..c9b0e51 100644
--- a/scripts/lib/wic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -58,65 +58,65 @@ def read_kickstart(path):
         def __init__(self):
             superclass.__init__(self, mapping=commandMap[using_version])
 
-    ks = ksparser.KickstartParser(KSHandlers(), errorsAreFatal=True)
+    kickstart = ksparser.KickstartParser(KSHandlers(), errorsAreFatal=True)
 
     try:
-        ks.readKickstart(path)
+        kickstart.readKickstart(path)
     except (kserrors.KickstartParseError, kserrors.KickstartError), err:
         msger.warning("Errors occurred when parsing kickstart file: %s\n" % path)
         msger.error("%s" % err)
 
-    return ks
+    return kickstart
 
-def get_image_size(ks, default=None):
+def get_image_size(kickstart, default=None):
     __size = 0
-    for p in ks.handler.partition.partitions:
-        if p.mountpoint == "/" and p.size:
-            __size = p.size
+    for part in kickstart.handler.partition.partitions:
+        if part.mountpoint == "/" and part.size:
+            __size = part.size
     if __size > 0:
         return int(__size) * 1024L
     else:
         return default
 
-def get_image_fstype(ks, default=None):
-    for p in ks.handler.partition.partitions:
-        if p.mountpoint == "/" and p.fstype:
-            return p.fstype
+def get_image_fstype(kickstart, default=None):
+    for part in kickstart.handler.partition.partitions:
+        if part.mountpoint == "/" and part.fstype:
+            return part.fstype
     return default
 
-def get_image_fsopts(ks, default=None):
-    for p in ks.handler.partition.partitions:
-        if p.mountpoint == "/" and p.fsopts:
-            return p.fsopts
+def get_image_fsopts(kickstart, default=None):
+    for part in kickstart.handler.partition.partitions:
+        if part.mountpoint == "/" and part.fsopts:
+            return part.fsopts
     return default
 
-def get_timeout(ks, default=None):
-    if not hasattr(ks.handler.bootloader, "timeout"):
+def get_timeout(kickstart, default=None):
+    if not hasattr(kickstart.handler.bootloader, "timeout"):
         return default
-    if ks.handler.bootloader.timeout is None:
+    if kickstart.handler.bootloader.timeout is None:
         return default
-    return int(ks.handler.bootloader.timeout)
+    return int(kickstart.handler.bootloader.timeout)
 
-def get_kernel_args(ks, default="ro rd.live.image"):
-    if not hasattr(ks.handler.bootloader, "appendLine"):
+def get_kernel_args(kickstart, default="ro rd.live.image"):
+    if not hasattr(kickstart.handler.bootloader, "appendLine"):
         return default
-    if ks.handler.bootloader.appendLine is None:
+    if kickstart.handler.bootloader.appendLine is None:
         return default
-    return "%s %s" %(default, ks.handler.bootloader.appendLine)
+    return "%s %s" %(default, kickstart.handler.bootloader.appendLine)
 
-def get_menu_args(ks, default=""):
-    if not hasattr(ks.handler.bootloader, "menus"):
+def get_menu_args(kickstart, default=""):
+    if not hasattr(kickstart.handler.bootloader, "menus"):
         return default
-    if ks.handler.bootloader.menus in (None, ""):
+    if kickstart.handler.bootloader.menus in (None, ""):
         return default
-    return "%s" % ks.handler.bootloader.menus
+    return "%s" % kickstart.handler.bootloader.menus
 
-def get_default_kernel(ks, default=None):
-    if not hasattr(ks.handler.bootloader, "default"):
+def get_default_kernel(kickstart, default=None):
+    if not hasattr(kickstart.handler.bootloader, "default"):
         return default
-    if not ks.handler.bootloader.default:
+    if not kickstart.handler.bootloader.default:
         return default
-    return ks.handler.bootloader.default
+    return kickstart.handler.bootloader.default
 
-def get_partitions(ks):
-    return ks.handler.partition.partitions
+def get_partitions(kickstart):
+    return kickstart.handler.partition.partitions
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index bac2067..eee25a4 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -154,7 +154,7 @@ class Wic_PartData(FC4_PartData):
         else:
             return 0
 
-    def prepare(self, cr, cr_workdir, oe_builddir, rootfs_dir, bootimg_dir,
+    def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir, bootimg_dir,
                 kernel_dir, native_sysroot):
         """
         Prepare content for individual partitions, depending on
@@ -199,18 +199,18 @@ class Wic_PartData(FC4_PartData):
         self._source_methods = pluginmgr.get_source_plugin_methods(\
                                    self.source, partition_methods)
         self._source_methods["do_configure_partition"](self, self.sourceparams_dict,
-                                                       cr, cr_workdir,
+                                                       creator, cr_workdir,
                                                        oe_builddir,
                                                        bootimg_dir,
                                                        kernel_dir,
                                                        native_sysroot)
         self._source_methods["do_stage_partition"](self, self.sourceparams_dict,
-                                                   cr, cr_workdir,
+                                                   creator, cr_workdir,
                                                    oe_builddir,
                                                    bootimg_dir, kernel_dir,
                                                    native_sysroot)
         self._source_methods["do_prepare_partition"](self, self.sourceparams_dict,
-                                                     cr, cr_workdir,
+                                                     creator, cr_workdir,
                                                      oe_builddir,
                                                      bootimg_dir, kernel_dir, rootfs_dir,
                                                      native_sysroot)
@@ -441,21 +441,21 @@ class Wic_PartData(FC4_PartData):
         msger.warning("Creating of an empty squashfs %s partition was attempted. " \
                       "Proceeding as requested." % self.mountpoint)
 
-        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
-        os.path.isfile(fs) and os.remove(fs)
+        path = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
+        os.path.isfile(path) and os.remove(path)
 
         # it is not possible to create a squashfs without source data,
         # thus prepare an empty temp dir that is used as source
         tmpdir = tempfile.mkdtemp()
 
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
-                       (tmpdir, fs)
+                       (tmpdir, path)
         exec_native_cmd(squashfs_cmd, native_sysroot)
 
         os.rmdir(tmpdir)
 
         # get the rootfs size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % fs
+        du_cmd = "du -Lbks %s" % path
         out = exec_cmd(du_cmd)
         fs_size = out.split()[0]
 
@@ -465,17 +465,17 @@ class Wic_PartData(FC4_PartData):
         """
         Prepare a swap partition.
         """
-        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
+        path = "%s/fs.%s" % (cr_workdir, self.fstype)
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1k seek=%d count=0" % \
-            (fs, self.size)
+            (path, self.size)
         exec_cmd(dd_cmd)
 
         import uuid
         label_str = ""
         if self.label:
             label_str = "-L %s" % self.label
-        mkswap_cmd = "mkswap %s -U %s %s" % (label_str, str(uuid.uuid1()), fs)
+        mkswap_cmd = "mkswap %s -U %s %s" % (label_str, str(uuid.uuid1()), path)
         exec_native_cmd(mkswap_cmd, native_sysroot)
 
 
@@ -490,37 +490,37 @@ class Wic_Partition(FC4_Partition):
                                        (option, value))
             setattr(parser.values, option.dest, value)
 
-        op = FC4_Partition._getParser(self)
+        parser = FC4_Partition._getParser(self)
 
         # The alignment value is given in kBytes. e.g., value 8 means that
         # the partition is aligned to start from 8096 byte boundary.
-        op.add_option("--align", type="int", action="store", dest="align",
-                      default=None)
-        op.add_option("--extoptions", type="string", action="store", dest="extopts",
-                      default=None)
-        op.add_option("--part-type", type="string", action="store", dest="part_type",
-                      default=None)
+        parser.add_option("--align", type="int", action="store", dest="align",
+                          default=None)
+        parser.add_option("--extoptions", type="string", action="store", dest="extopts",
+                          default=None)
+        parser.add_option("--part-type", type="string", action="store", dest="part_type",
+                          default=None)
         # use specified source file to fill the partition
         # and calculate partition size
-        op.add_option("--source", type="string", action="store",
-                      dest="source", default=None)
+        parser.add_option("--source", type="string", action="store",
+                          dest="source", default=None)
         # comma-separated list of param=value pairs
-        op.add_option("--sourceparams", type="string", action="store",
-                      dest="sourceparams", default=None)
+        parser.add_option("--sourceparams", type="string", action="store",
+                          dest="sourceparams", default=None)
         # use specified rootfs path to fill the partition
-        op.add_option("--rootfs-dir", type="string", action="store",
-                      dest="rootfs", default=None)
+        parser.add_option("--rootfs-dir", type="string", action="store",
+                          dest="rootfs", default=None)
         # wether to add the partition in the partition table
-        op.add_option("--no-table", dest="no_table", action="store_true",
-                      default=False)
+        parser.add_option("--no-table", dest="no_table", action="store_true",
+                          default=False)
         # extra space beyond the partition size
-        op.add_option("--extra-space", dest="extra_space", action="store",
-                      type="size", nargs=1, default="10M")
-        op.add_option("--overhead-factor", dest="overhead_factor",
-                      action="callback", callback=overhead_cb, type="float",
-                      nargs=1, default=1.3)
-        op.add_option("--use-uuid", dest="use_uuid", action="store_true",
-                      default=False)
-        op.add_option("--uuid")
-
-        return op
+        parser.add_option("--extra-space", dest="extra_space", action="store",
+                          type="size", nargs=1, default="10M")
+        parser.add_option("--overhead-factor", dest="overhead_factor",
+                          action="callback", callback=overhead_cb, type="float",
+                          nargs=1, default=1.3)
+        parser.add_option("--use-uuid", dest="use_uuid", action="store_true",
+                          default=False)
+        parser.add_option("--uuid")
+
+        return parser
diff --git a/scripts/lib/wic/kickstart/custom_commands/wicboot.py b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
index 0230df2..a3e1852 100644
--- a/scripts/lib/wic/kickstart/custom_commands/wicboot.py
+++ b/scripts/lib/wic/kickstart/custom_commands/wicboot.py
@@ -49,12 +49,12 @@ class Wic_Bootloader(F8_Bootloader):
         return retval
 
     def _getParser(self):
-        op = F8_Bootloader._getParser(self)
-        op.add_option("--menus", dest="menus")
-        op.add_option("--ptable", dest="ptable", choices=("msdos", "gpt"),
-                      default="msdos")
+        parser = F8_Bootloader._getParser(self)
+        parser.add_option("--menus", dest="menus")
+        parser.add_option("--ptable", dest="ptable", choices=("msdos", "gpt"),
+                          default="msdos")
         # use specified source plugin to implement bootloader-specific methods
-        op.add_option("--source", type="string", action="store",
+        parser.add_option("--source", type="string", action="store",
                       dest="source", default=None)
-        return op
+        return parser
 
diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
index 1b60980..b737554 100644
--- a/scripts/lib/wic/msger.py
+++ b/scripts/lib/wic/msger.py
@@ -151,10 +151,10 @@ def _split_msg(head, msg):
         msg = msg.lstrip()
         head = '\r' + head
 
-    m = PREFIX_RE.match(msg)
-    if m:
-        head += ' <%s>' % m.group(1)
-        msg = m.group(2)
+    match = PREFIX_RE.match(msg)
+    if match:
+        head += ' <%s>' % match.group(1)
+        msg = match.group(2)
 
     return head, msg
 
@@ -271,9 +271,8 @@ def set_logfile(fpath):
 
     def _savelogf():
         if LOG_FILE_FP:
-            fp = open(LOG_FILE_FP, 'w')
-            fp.write(LOG_CONTENT)
-            fp.close()
+            with open(LOG_FILE_FP, 'w') as log:
+                log.write(LOG_CONTENT)
 
     if LOG_FILE_FP is not None:
         warning('duplicate log file configuration')
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 7244989..ccfdfcb 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -48,7 +48,7 @@ class PluginMgr(object):
         self.plugin_dir = scripts_path + PLUGIN_DIR
         self.layers_path = None
 
-    def _build_plugin_dir_list(self, dl, ptype):
+    def _build_plugin_dir_list(self, plugin_dir, ptype):
         if self.layers_path is None:
             self.layers_path = get_bitbake_var("BBLAYERS")
         layer_dirs = []
@@ -58,7 +58,7 @@ class PluginMgr(object):
                 path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR, ptype)
                 layer_dirs.append(path)
 
-        path = os.path.join(dl, ptype)
+        path = os.path.join(plugin_dir, ptype)
         layer_dirs.append(path)
 
         return layer_dirs
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 6d96de2..ee8fe95 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -51,7 +51,7 @@ class SourcePlugin(_Plugin):
     """
 
     @classmethod
-    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
@@ -61,7 +61,7 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_install_disk: disk: %s" % disk_name)
 
     @classmethod
-    def do_stage_partition(cls, part, source_params, cr, cr_workdir,
+    def do_stage_partition(cls, part, source_params, creator, cr_workdir,
                            oe_builddir, bootimg_dir, kernel_dir,
                            native_sysroot):
         """
@@ -78,7 +78,7 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_stage_partition: part: %s" % part)
 
     @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -89,7 +89,7 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_configure_partition: part: %s" % part)
 
     @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir, rootfs_dir,
                              native_sysroot):
         """
@@ -99,9 +99,9 @@ class SourcePlugin(_Plugin):
         msger.debug("SourcePlugin: do_prepare_partition: part: %s" % part)
 
 def get_plugins(typen):
-    ps = ImagerPlugin.get_plugins()
-    if typen in ps:
-        return ps[typen]
+    plugins = ImagerPlugin.get_plugins()
+    if typen in plugins:
+        return plugins[typen]
     else:
         return None
 
diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index e9672fe..6d3f46c 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -50,8 +50,8 @@ class DirectPlugin(ImagerPlugin):
         """
         krootfs_dir = {}
         for rootfs_dir in rootfs_dirs.split(' '):
-            k, v = rootfs_dir.split('=')
-            krootfs_dir[k] = v
+            key, val = rootfs_dir.split('=')
+            krootfs_dir[key] = val
 
         return krootfs_dir
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index b48cc83..fa63c6a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -41,16 +41,16 @@ class BootimgEFIPlugin(SourcePlugin):
     name = 'bootimg-efi'
 
     @classmethod
-    def do_configure_grubefi(cls, hdddir, cr, cr_workdir):
+    def do_configure_grubefi(cls, hdddir, creator, cr_workdir):
         """
         Create loader-specific (grub-efi) config
         """
-        options = cr.ks.handler.bootloader.appendLine
+        options = creator.ks.handler.bootloader.appendLine
 
         grubefi_conf = ""
         grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
         grubefi_conf += "default=boot\n"
-        timeout = kickstart.get_timeout(cr.ks)
+        timeout = kickstart.get_timeout(creator.ks)
         if not timeout:
             timeout = 0
         grubefi_conf += "timeout=%s\n" % timeout
@@ -59,7 +59,7 @@ class BootimgEFIPlugin(SourcePlugin):
         kernel = "/bzImage"
 
         grubefi_conf += "linux %s root=%s rootwait %s\n" \
-            % (kernel, cr.rootdev, options)
+            % (kernel, creator.rootdev, options)
         grubefi_conf += "}\n"
 
         msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
@@ -69,7 +69,7 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def do_configure_gummiboot(cls, hdddir, cr, cr_workdir):
+    def do_configure_gummiboot(cls, hdddir, creator, cr_workdir):
         """
         Create loader-specific (gummiboot) config
         """
@@ -79,9 +79,9 @@ class BootimgEFIPlugin(SourcePlugin):
         install_cmd = "install -d %s/loader/entries" % hdddir
         exec_cmd(install_cmd)
 
-        options = cr.ks.handler.bootloader.appendLine
+        options = creator.ks.handler.bootloader.appendLine
 
-        timeout = kickstart.get_timeout(cr.ks)
+        timeout = kickstart.get_timeout(creator.ks)
         if not timeout:
             timeout = 0
 
@@ -100,7 +100,7 @@ class BootimgEFIPlugin(SourcePlugin):
         boot_conf = ""
         boot_conf += "title boot\n"
         boot_conf += "linux %s\n" % kernel
-        boot_conf += "options LABEL=Boot root=%s %s\n" % (cr.rootdev, options)
+        boot_conf += "options LABEL=Boot root=%s %s\n" % (creator.rootdev, options)
 
         msger.debug("Writing gummiboot config %s/hdd/boot/loader/entries/boot.conf" \
                         % cr_workdir)
@@ -110,7 +110,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
 
     @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -125,9 +125,9 @@ class BootimgEFIPlugin(SourcePlugin):
 
         try:
             if source_params['loader'] == 'grub-efi':
-                cls.do_configure_grubefi(hdddir, cr, cr_workdir)
+                cls.do_configure_grubefi(hdddir, creator, cr_workdir)
             elif source_params['loader'] == 'gummiboot':
-                cls.do_configure_gummiboot(hdddir, cr, cr_workdir)
+                cls.do_configure_gummiboot(hdddir, creator, cr_workdir)
             else:
                 msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
@@ -135,7 +135,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
 
     @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
         """
@@ -148,7 +148,7 @@ class BootimgEFIPlugin(SourcePlugin):
             if not bootimg_dir:
                 msger.error("Couldn't find HDDDIR, exiting\n")
             # just so the result notes display it
-            cr.set_bootimg_dir(bootimg_dir)
+            creator.set_bootimg_dir(bootimg_dir)
 
         staging_kernel_dir = kernel_dir
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 3c2dbc9..96ed54d 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -41,36 +41,36 @@ class BootimgPcbiosPlugin(SourcePlugin):
     name = 'bootimg-pcbios'
 
     @classmethod
-    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
         disk image.  In this case, we install the MBR.
         """
         mbrfile = "%s/syslinux/" % bootimg_dir
-        if cr.ptable_format == 'msdos':
+        if creator.ptable_format == 'msdos':
             mbrfile += "mbr.bin"
-        elif cr.ptable_format == 'gpt':
+        elif creator.ptable_format == 'gpt':
             mbrfile += "gptmbr.bin"
         else:
-            msger.error("Unsupported partition table: %s" % cr.ptable_format)
+            msger.error("Unsupported partition table: %s" % creator.ptable_format)
 
         if not os.path.exists(mbrfile):
             msger.error("Couldn't find %s.  If using the -e option, do you "
                         "have the right MACHINE set in local.conf?  If not, "
                         "is the bootimg_dir path correct?" % mbrfile)
 
-        full_path = cr._full_path(workdir, disk_name, "direct")
+        full_path = creator._full_path(workdir, disk_name, "direct")
         msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
                     % (disk_name, full_path, disk['min_size']))
 
-        rc = runner.show(['dd', 'if=%s' % mbrfile,
-                          'of=%s' % full_path, 'conv=notrunc'])
-        if rc != 0:
+        rcode = runner.show(['dd', 'if=%s' % mbrfile,
+                             'of=%s' % full_path, 'conv=notrunc'])
+        if rcode != 0:
             raise ImageError("Unable to set MBR to %s" % full_path)
 
     @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -89,11 +89,11 @@ class BootimgPcbiosPlugin(SourcePlugin):
         else:
             splashline = ""
 
-        options = cr.ks.handler.bootloader.appendLine
+        options = creator.ks.handler.bootloader.appendLine
 
         syslinux_conf = ""
         syslinux_conf += "PROMPT 0\n"
-        timeout = kickstart.get_timeout(cr.ks)
+        timeout = kickstart.get_timeout(creator.ks)
         if not timeout:
             timeout = 0
         syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
@@ -110,7 +110,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         syslinux_conf += "KERNEL " + kernel + "\n"
 
         syslinux_conf += "APPEND label=boot root=%s %s\n" % \
-                             (cr.rootdev, options)
+                             (creator.rootdev, options)
 
         msger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg" \
                     % cr_workdir)
@@ -119,7 +119,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
         """
@@ -141,7 +141,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             if not _has_syslinux(bootimg_dir):
                 msger.error("Please build syslinux first\n")
             # just so the result notes display it
-            cr.set_bootimg_dir(bootimg_dir)
+            creator.set_bootimg_dir(bootimg_dir)
 
         staging_kernel_dir = kernel_dir
 
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 1cee906..9472d8a 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -54,7 +54,7 @@ class IsoImagePlugin(SourcePlugin):
     name = 'isoimage-isohybrid'
 
     @classmethod
-    def do_configure_syslinux(cls, cr, cr_workdir):
+    def do_configure_syslinux(cls, creator, cr_workdir):
         """
         Create loader-specific (syslinux) config
         """
@@ -64,9 +64,9 @@ class IsoImagePlugin(SourcePlugin):
         else:
             splashline = ""
 
-        options = cr.ks.handler.bootloader.appendLine
+        options = creator.ks.handler.bootloader.appendLine
 
-        timeout = kickstart.get_timeout(cr.ks, 10)
+        timeout = kickstart.get_timeout(creator.ks, 10)
 
         syslinux_conf = ""
         syslinux_conf += "PROMPT 0\n"
@@ -90,7 +90,7 @@ class IsoImagePlugin(SourcePlugin):
             cfg.write(syslinux_conf)
 
     @classmethod
-    def do_configure_grubefi(cls, part, cr, cr_workdir):
+    def do_configure_grubefi(cls, part, creator, cr_workdir):
         """
         Create loader-specific (grub-efi) config
         """
@@ -100,13 +100,13 @@ class IsoImagePlugin(SourcePlugin):
         else:
             splashline = ""
 
-        options = cr.ks.handler.bootloader.appendLine
+        options = creator.ks.handler.bootloader.appendLine
 
         grubefi_conf = ""
         grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
         grubefi_conf += "--parity=no --stop=1\n"
         grubefi_conf += "default=boot\n"
-        timeout = kickstart.get_timeout(cr.ks, 10)
+        timeout = kickstart.get_timeout(creator.ks, 10)
         grubefi_conf += "timeout=%s\n" % timeout
         grubefi_conf += "\n"
         grubefi_conf += "search --set=root --label %s " % part.label
@@ -185,7 +185,7 @@ class IsoImagePlugin(SourcePlugin):
         return initrd
 
     @classmethod
-    def do_stage_partition(cls, part, source_params, cr, cr_workdir,
+    def do_stage_partition(cls, part, source_params, creator, cr_workdir,
                            oe_builddir, bootimg_dir, kernel_dir,
                            native_sysroot):
         """
@@ -231,7 +231,7 @@ class IsoImagePlugin(SourcePlugin):
             exec_cmd("bitbake mtools-native")
 
     @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
         """
@@ -249,11 +249,11 @@ class IsoImagePlugin(SourcePlugin):
         msger.debug("%s" % source_params)
         if 'image_name' in source_params and \
                     source_params['image_name'].strip():
-            cr.name = source_params['image_name'].strip()
-            msger.debug("The name of the image is: %s" % cr.name)
+            creator.name = source_params['image_name'].strip()
+            msger.debug("The name of the image is: %s" % creator.name)
 
     @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
         """
@@ -353,7 +353,7 @@ class IsoImagePlugin(SourcePlugin):
                     exec_cmd(install_cmd)
 
                 if not os.path.isfile("%s/EFI/BOOT/boot.cfg" % bootimg_dir):
-                    cls.do_configure_grubefi(part, cr, bootimg_dir)
+                    cls.do_configure_grubefi(part, creator, bootimg_dir)
 
                 # Builds bootx64.efi/bootia32.efi if ISODIR didn't exist or
                 # didn't contains it
@@ -463,7 +463,7 @@ class IsoImagePlugin(SourcePlugin):
         install_cmd = "install -d %s/isolinux" % isodir
         exec_cmd(install_cmd)
 
-        cls.do_configure_syslinux(cr, cr_workdir)
+        cls.do_configure_syslinux(creator, cr_workdir)
 
         install_cmd = "install -m 444 %s/syslinux/ldlinux.sys " % syslinux_dir
         install_cmd += "%s/isolinux/ldlinux.sys" % isodir
@@ -508,7 +508,7 @@ class IsoImagePlugin(SourcePlugin):
         part.set_source_file(iso_img)
 
     @classmethod
-    def do_install_disk(cls, disk, disk_name, cr, workdir, oe_builddir,
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
@@ -516,9 +516,9 @@ class IsoImagePlugin(SourcePlugin):
         utility for booting via BIOS from disk storage devices.
         """
 
-        full_path = cr._full_path(workdir, disk_name, "direct")
+        full_path = creator._full_path(workdir, disk_name, "direct")
         iso_img = "%s.p1" % full_path
-        full_path_iso = cr._full_path(workdir, disk_name, "iso")
+        full_path_iso = creator._full_path(workdir, disk_name, "iso")
 
         isohybrid_cmd = "isohybrid -u %s" % iso_img
         msger.debug("running command: %s" % \
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 2f884a3..5a103bb 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -129,14 +129,14 @@ class Image(object):
         self._partitions_layed_out = True
 
         # Go through partitions in the order they are added in .ks file
-        for n in range(len(self.partitions)):
-            p = self.partitions[n]
+        for num in range(len(self.partitions)):
+            part = self.partitions[num]
 
-            if not self.disks.has_key(p['disk_name']):
+            if not self.disks.has_key(part['disk_name']):
                 raise ImageError("No disk %s for partition %s" \
-                                 % (p['disk_name'], p['mountpoint']))
+                                 % (part['disk_name'], part['mountpoint']))
 
-            if ptable_format == 'msdos' and p['part_type']:
+            if ptable_format == 'msdos' and part['part_type']:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
                 # filed at offset 3 of the partition entry.
@@ -144,79 +144,79 @@ class Image(object):
                                  "implemented for msdos partitions")
 
             # Get the disk where the partition is located
-            d = self.disks[p['disk_name']]
-            d['numpart'] += 1
-            if not p['no_table']:
-                d['realpart'] += 1
-            d['ptable_format'] = ptable_format
+            disk = self.disks[part['disk_name']]
+            disk['numpart'] += 1
+            if not part['no_table']:
+                disk['realpart'] += 1
+            disk['ptable_format'] = ptable_format
 
-            if d['numpart'] == 1:
+            if disk['numpart'] == 1:
                 if ptable_format == "msdos":
                     overhead = MBR_OVERHEAD
                 elif ptable_format == "gpt":
                     overhead = GPT_OVERHEAD
 
                 # Skip one sector required for the partitioning scheme overhead
-                d['offset'] += overhead
+                disk['offset'] += overhead
 
-            if d['realpart'] > 3:
+            if disk['realpart'] > 3:
                 # Reserve a sector for EBR for every logical partition
                 # before alignment is performed.
                 if ptable_format == "msdos":
-                    d['offset'] += 1
+                    disk['offset'] += 1
 
 
-            if p['align']:
+            if part['align']:
                 # If not first partition and we do have alignment set we need
                 # to align the partition.
                 # FIXME: This leaves a empty spaces to the disk. To fill the
                 # gaps we could enlargea the previous partition?
 
                 # Calc how much the alignment is off.
-                align_sectors = d['offset'] % (p['align'] * 1024 / self.sector_size)
+                align_sectors = disk['offset'] % (part['align'] * 1024 / self.sector_size)
 
                 if align_sectors:
                     # If partition is not aligned as required, we need
                     # to move forward to the next alignment point
-                    align_sectors = (p['align'] * 1024 / self.sector_size) - align_sectors
+                    align_sectors = (part['align'] * 1024 / self.sector_size) - align_sectors
 
                     msger.debug("Realignment for %s%s with %s sectors, original"
                                 " offset %s, target alignment is %sK." %
-                                (p['disk_name'], d['numpart'], align_sectors,
-                                 d['offset'], p['align']))
+                                (part['disk_name'], disk['numpart'], align_sectors,
+                                 disk['offset'], part['align']))
 
                     # increase the offset so we actually start the partition on right alignment
-                    d['offset'] += align_sectors
+                    disk['offset'] += align_sectors
 
-            p['start'] = d['offset']
-            d['offset'] += p['size']
+            part['start'] = disk['offset']
+            disk['offset'] += part['size']
 
-            p['type'] = 'primary'
-            if not p['no_table']:
-                p['num'] = d['realpart']
+            part['type'] = 'primary'
+            if not part['no_table']:
+                part['num'] = disk['realpart']
             else:
-                p['num'] = 0
+                part['num'] = 0
 
-            if d['ptable_format'] == "msdos":
-                if d['realpart'] > 3:
-                    p['type'] = 'logical'
-                    p['num'] = d['realpart'] + 1
+            if disk['ptable_format'] == "msdos":
+                if disk['realpart'] > 3:
+                    part['type'] = 'logical'
+                    part['num'] = disk['realpart'] + 1
 
-            d['partitions'].append(n)
+            disk['partitions'].append(num)
             msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
                         "sectors (%d bytes)." \
-                            % (p['mountpoint'], p['disk_name'], p['num'],
-                               p['start'], p['start'] + p['size'] - 1,
-                               p['size'], p['size'] * self.sector_size))
+                            % (part['mountpoint'], part['disk_name'], part['num'],
+                               part['start'], part['start'] + part['size'] - 1,
+                               part['size'], part['size'] * self.sector_size))
 
         # Once all the partitions have been layed out, we can calculate the
         # minumim disk sizes.
-        for d in self.disks.values():
-            d['min_size'] = d['offset']
-            if d['ptable_format'] == "gpt":
-                d['min_size'] += GPT_OVERHEAD
+        for disk in self.disks.values():
+            disk['min_size'] = disk['offset']
+            if disk['ptable_format'] == "gpt":
+                disk['min_size'] += GPT_OVERHEAD
 
-            d['min_size'] *= self.sector_size
+            disk['min_size'] *= self.sector_size
 
     def __create_partition(self, device, parttype, fstype, start, size):
         """ Create a partition on an image described by the 'device' object. """
@@ -237,21 +237,21 @@ class Image(object):
         self.layout_partitions()
 
         for dev in self.disks.keys():
-            d = self.disks[dev]
+            disk = self.disks[dev]
             msger.debug("Initializing partition table for %s" % \
-                        (d['disk'].device))
+                        (disk['disk'].device))
             exec_native_cmd("parted -s %s mklabel %s" % \
-                            (d['disk'].device, d['ptable_format']),
+                            (disk['disk'].device, disk['ptable_format']),
                             self.native_sysroot)
 
         msger.debug("Creating partitions")
 
-        for p in self.partitions:
-            if p['num'] == 0:
+        for part in self.partitions:
+            if part['num'] == 0:
                 continue
 
-            d = self.disks[p['disk_name']]
-            if d['ptable_format'] == "msdos" and p['num'] == 5:
+            disk = self.disks[part['disk_name']]
+            if disk['ptable_format'] == "msdos" and part['num'] == 5:
                 # Create an extended partition (note: extended
                 # partition is described in MBR and contains all
                 # logical partitions). The logical partitions save a
@@ -263,17 +263,17 @@ class Image(object):
                 # starts a sector before the first logical partition,
                 # add a sector at the back, so that there is enough
                 # room for all logical partitions.
-                self.__create_partition(d['disk'].device, "extended",
-                                        None, p['start'] - 1,
-                                        d['offset'] - p['start'] + 1)
+                self.__create_partition(disk['disk'].device, "extended",
+                                        None, part['start'] - 1,
+                                        disk['offset'] - part['start'] + 1)
 
-            if p['fstype'] == "swap":
+            if part['fstype'] == "swap":
                 parted_fs_type = "linux-swap"
-            elif p['fstype'] == "vfat":
+            elif part['fstype'] == "vfat":
                 parted_fs_type = "fat32"
-            elif p['fstype'] == "msdos":
+            elif part['fstype'] == "msdos":
                 parted_fs_type = "fat16"
-            elif p['fstype'] == "ontrackdm6aux3":
+            elif part['fstype'] == "ontrackdm6aux3":
                 parted_fs_type = "ontrackdm6aux3"
             else:
                 # Type for ext2/ext3/ext4/btrfs
@@ -281,55 +281,55 @@ class Image(object):
 
             # Boot ROM of OMAP boards require vfat boot partition to have an
             # even number of sectors.
-            if p['mountpoint'] == "/boot" and p['fstype'] in ["vfat", "msdos"] \
-               and p['size'] % 2:
+            if part['mountpoint'] == "/boot" and part['fstype'] in ["vfat", "msdos"] \
+               and part['size'] % 2:
                 msger.debug("Substracting one sector from '%s' partition to " \
                             "get even number of sectors for the partition" % \
-                            p['mountpoint'])
-                p['size'] -= 1
+                            part['mountpoint'])
+                part['size'] -= 1
 
-            self.__create_partition(d['disk'].device, p['type'],
-                                    parted_fs_type, p['start'], p['size'])
+            self.__create_partition(disk['disk'].device, part['type'],
+                                    parted_fs_type, part['start'], part['size'])
 
-            if p['part_type']:
+            if part['part_type']:
                 msger.debug("partition %d: set type UID to %s" % \
-                            (p['num'], p['part_type']))
+                            (part['num'], part['part_type']))
                 exec_native_cmd("sgdisk --typecode=%d:%s %s" % \
-                                         (p['num'], p['part_type'],
-                                          d['disk'].device), self.native_sysroot)
+                                         (part['num'], part['part_type'],
+                                          disk['disk'].device), self.native_sysroot)
 
-            if p['uuid']:
+            if part['uuid']:
                 msger.debug("partition %d: set UUID to %s" % \
-                            (p['num'], p['uuid']))
+                            (part['num'], part['uuid']))
                 exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
-                                (p['num'], p['uuid'], d['disk'].device),
+                                (part['num'], part['uuid'], disk['disk'].device),
                                 self.native_sysroot)
 
-            if p['boot']:
-                flag_name = "legacy_boot" if d['ptable_format'] == 'gpt' else "boot"
+            if part['boot']:
+                flag_name = "legacy_boot" if disk['ptable_format'] == 'gpt' else "boot"
                 msger.debug("Set '%s' flag for partition '%s' on disk '%s'" % \
-                            (flag_name, p['num'], d['disk'].device))
+                            (flag_name, part['num'], disk['disk'].device))
                 exec_native_cmd("parted -s %s set %d %s on" % \
-                                (d['disk'].device, p['num'], flag_name),
+                                (disk['disk'].device, part['num'], flag_name),
                                 self.native_sysroot)
 
             # Parted defaults to enabling the lba flag for fat16 partitions,
             # which causes compatibility issues with some firmware (and really
             # isn't necessary).
             if parted_fs_type == "fat16":
-                if d['ptable_format'] == 'msdos':
+                if disk['ptable_format'] == 'msdos':
                     msger.debug("Disable 'lba' flag for partition '%s' on disk '%s'" % \
-                                (p['num'], d['disk'].device))
+                                (part['num'], disk['disk'].device))
                     exec_native_cmd("parted -s %s set %d lba off" % \
-                                    (d['disk'].device, p['num']),
+                                    (disk['disk'].device, part['num']),
                                     self.native_sysroot)
 
     def cleanup(self):
         if self.disks:
             for dev in self.disks:
-                d = self.disks[dev]
+                disk = self.disks[dev]
                 try:
-                    d['disk'].cleanup()
+                    disk['disk'].cleanup()
                 except:
                     pass
 
@@ -354,8 +354,8 @@ class Image(object):
 
     def create(self):
         for dev in self.disks.keys():
-            d = self.disks[dev]
-            d['disk'].create()
+            disk = self.disks[dev]
+            disk['disk'].create()
 
         self.__format_disks()
 
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index f6a1d08..7431917 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -62,13 +62,13 @@ def runtool(cmdln_or_args, catch=1):
         serr = subprocess.STDOUT
 
     try:
-        p = subprocess.Popen(cmdln_or_args, stdout=sout,
-                             stderr=serr, shell=shell)
-        (sout, serr) = p.communicate()
+        process = subprocess.Popen(cmdln_or_args, stdout=sout,
+                                   stderr=serr, shell=shell)
+        (sout, serr) = process.communicate()
         # combine stdout and stderr, filter None out
         out = ''.join(filter(None, [sout, serr]))
-    except OSError, e:
-        if e.errno == 2:
+    except OSError, err:
+        if err.errno == 2:
             # [Errno 2] No such file or directory
             msger.error('Cannot run command: %s, lost dependency?' % cmd)
         else:
@@ -77,12 +77,12 @@ def runtool(cmdln_or_args, catch=1):
         if catch != 3:
             os.close(dev_null)
 
-    return (p.returncode, out)
+    return (process.returncode, out)
 
 def show(cmdln_or_args):
     # show all the message using msger.verbose
 
-    rc, out = runtool(cmdln_or_args, catch=3)
+    rcode, out = runtool(cmdln_or_args, catch=3)
 
     if isinstance(cmdln_or_args, list):
         cmd = ' '.join(cmdln_or_args)
@@ -100,7 +100,7 @@ def show(cmdln_or_args):
         msg += '\n  +----------------'
 
     msger.verbose(msg)
-    return rc
+    return rcode
 
 def outs(cmdln_or_args, catch=1):
     # get the outputs of tools
diff --git a/scripts/wic b/scripts/wic
index eb252a2..7ad2b19 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -62,9 +62,9 @@ def rootfs_dir_to_args(krootfs_dir):
     Get a rootfs_dir dict and serialize to string
     """
     rootfs_dir = ''
-    for k, v in krootfs_dir.items():
+    for key, val in krootfs_dir.items():
         rootfs_dir += ' '
-        rootfs_dir += '='.join([k, v])
+        rootfs_dir += '='.join([key, val])
     return rootfs_dir.strip()
 
 def callback_rootfs_dir(option, opt, value, parser):
-- 
2.1.4


