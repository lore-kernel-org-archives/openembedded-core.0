Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 42D246E989
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 01:17:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2014 17:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,776,1384329600"; d="scan'208";a="477522007"
Received: from unknown (HELO localhost) ([10.255.13.52])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2014 17:17:12 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 19:16:59 -0600
Message-Id: <fc0758d1c4d16df2a6a19de3af1117067b3368c6.1391476329.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
References: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1391476329.git.tom.zanussi@linux.intel.com>
References: <cover.1391476329.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 6/7] wic: Hook up BootimgEFIPlugin and BootimgPcbiosPlugin plugins
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
X-List-Received-Date: Tue, 04 Feb 2014 01:17:38 -0000

Remove all the Wic_PartData and DirectImageCreator code now
implemented by the BootimgEFIPlugin and BootimgPcbiosPlugin plugins,
as well as all the special-cased boot_type code, significantly
cleaning up the code.

Replace the calling code with general-purpose plugin invocations, in
essence calling the appropriate implementations at run-time based on
the --source value in effect.

Change the directdisk.wks and mkefidisk.wks scripts to make use of the
new plugins.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/canned-wks/directdisk.wks        |   2 +-
 scripts/lib/image/canned-wks/mkefidisk.wks         |   2 +-
 scripts/lib/mic/imager/direct.py                   | 194 +++++----------------
 .../lib/mic/kickstart/custom_commands/partition.py | 155 +++++-----------
 scripts/lib/mic/plugins/source/bootimg-efi.py      |   6 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   |   6 +-
 6 files changed, 86 insertions(+), 279 deletions(-)

diff --git a/scripts/lib/image/canned-wks/directdisk.wks b/scripts/lib/image/canned-wks/directdisk.wks
index d54b382..397a929 100644
--- a/scripts/lib/image/canned-wks/directdisk.wks
+++ b/scripts/lib/image/canned-wks/directdisk.wks
@@ -3,7 +3,7 @@
 # can directly dd to boot media.
 
 
-part /boot --source bootimg --ondisk sda --fstype=msdos --label boot --active --align 1024
+part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
 part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
 
 bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
diff --git a/scripts/lib/image/canned-wks/mkefidisk.wks b/scripts/lib/image/canned-wks/mkefidisk.wks
index 8a3e1f6..e976bc8 100644
--- a/scripts/lib/image/canned-wks/mkefidisk.wks
+++ b/scripts/lib/image/canned-wks/mkefidisk.wks
@@ -2,7 +2,7 @@
 # long-description: Creates a partitioned EFI disk image that the user
 # can directly dd to boot media.
 
-part /boot --source bootimg --ondisk sda --fstype=efi --label msdos --active --align 1024
+part /boot --source bootimg-efi --ondisk sda --fstype=msdos --label msdos --active --align 1024
 
 part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
 
diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 3827eb8..f8c300c 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -35,6 +35,11 @@ from mic.utils.partitionedfs import PartitionedMount
 from mic.utils.errors import CreatorError, MountError
 from mic.imager.baseimager import BaseImageCreator
 from mic.utils.oe.misc import *
+from mic.plugin import pluginmgr
+
+disk_methods = {
+    "do_install_disk":None,
+}
 
 class DirectImageCreator(BaseImageCreator):
     """
@@ -78,7 +83,6 @@ class DirectImageCreator(BaseImageCreator):
         self.native_sysroot = native_sysroot
         self.hdddir = hdddir
         self.staging_data_dir = staging_data_dir
-        self.boot_type = ""
 
     def __write_fstab(self):
         """overriden to generate fstab (temporarily) in rootfs. This
@@ -101,7 +105,7 @@ class DirectImageCreator(BaseImageCreator):
     def _update_fstab(self, fstab_lines, parts):
         """Assume partition order same as in wks"""
         for num, p in enumerate(parts, 1):
-            if p.mountpoint == "/" or p.mountpoint == "/boot":
+            if not p.mountpoint or p.mountpoint == "/" or p.mountpoint == "/boot":
                 continue
             if self._ptable_format == 'msdos' and num > 3:
                 device_name = "/dev/" + p.disk + str(num + 1)
@@ -132,6 +136,15 @@ class DirectImageCreator(BaseImageCreator):
 
         return fstab_contents
 
+    def set_bootimg_dir(self, bootimg_dir):
+        """
+        Accessor for bootimg_dir, the actual location used for the source
+        of the bootimg.  Should be set by source plugins (only if they
+        change the default bootimg source) so the correct info gets
+        displayed for print_outimage_info().
+        """
+        self.bootimg_dir = bootimg_dir
+
     def _get_parts(self):
         if not self.ks:
             raise CreatorError("Failed to get partition info, "
@@ -182,19 +195,18 @@ class DirectImageCreator(BaseImageCreator):
         """ Construct full file path to a file we generate. """
         return os.path.join(path, self._full_name(name, extention))
 
-    def get_boot_type(self):
-        """ Determine the boot type from fstype and mountpoint. """
-        parts = self._get_parts()
-
-        boot_type = ""
-
-        for p in parts:
-            if p.mountpoint == "/boot":
-                if p.fstype == "msdos":
-                    boot_type = "pcbios"
-                else:
-                    boot_type = p.fstype
-        return boot_type
+    def get_default_source_plugin(self):
+        """
+        The default source plugin i.e. the plugin that's consulted for
+        overall image generation tasks outside of any particular
+        partition.  For convenience, we just hang it off the
+        bootloader handler since it's the one non-partition object in
+        any setup.  By default the default plugin is set to the same
+        plugin as the /boot partition; since we hang it off the
+        bootloader object, the default can be explicitly set using the
+        --source bootloader param.
+        """
+        return self.ks.handler.bootloader.source
 
     #
     # Actual implemention
@@ -231,25 +243,7 @@ class DirectImageCreator(BaseImageCreator):
             if not self.ks.handler.bootloader.source and p.mountpoint == "/boot":
                 self.ks.handler.bootloader.source = p.source
 
-        self.boot_type = self.get_boot_type()
-
-        if not self.bootimg_dir:
-            if self.boot_type == "pcbios":
-                self.bootimg_dir = self.staging_data_dir
-            elif self.boot_type == "efi":
-                self.bootimg_dir = self.hdddir
-
-        if self.boot_type == "pcbios":
-            self._create_syslinux_config()
-        elif self.boot_type == "efi":
-            self._create_grubefi_config()
-        else:
-            raise CreatorError("Failed to detect boot type (no /boot partition?), "
-                               "please check your kickstart setting.")
-
         for p in parts:
-            if p.fstype == "efi":
-                p.fstype = "msdos"
             # need to create the filesystems in order to get their
             # sizes before we can add them and do the layout.
             # PartitionedMount.mount() actually calls __format_disks()
@@ -266,9 +260,8 @@ class DirectImageCreator(BaseImageCreator):
             # when/if we need to actually do package selection we
             # should modify things to use those objects, but for now
             # we can avoid that.
-            p.prepare(self.workdir, self.oe_builddir, self.boot_type,
-                      self.rootfs_dir, self.bootimg_dir, self.kernel_dir,
-                      self.native_sysroot)
+            p.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
+                      self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
             self.__instimage.add_partition(int(p.size),
                                            p.disk,
@@ -311,8 +304,16 @@ class DirectImageCreator(BaseImageCreator):
         For now, it just prepares the image to be bootable by e.g.
         creating and installing a bootloader configuration.
         """
-        if self.boot_type == "pcbios":
-            self._install_syslinux()
+        source_plugin = self.get_default_source_plugin()
+        if source_plugin:
+            self._source_methods = pluginmgr.get_source_plugin_methods(source_plugin, disk_methods)
+            for disk_name, disk in self.__instimage.disks.items():
+                self._source_methods["do_install_disk"](disk, disk_name, self,
+                                                        self.workdir,
+                                                        self.oe_builddir,
+                                                        self.bootimg_dir,
+                                                        self.kernel_dir,
+                                                        self.native_sysroot)
 
     def print_outimage_info(self):
         """
@@ -352,123 +353,6 @@ class DirectImageCreator(BaseImageCreator):
 
         return (rootdev, root_part_uuid)
 
-    def _create_syslinux_config(self):
-        hdddir = "%s/hdd/boot" % self.workdir
-        rm_cmd = "rm -rf " + self.workdir
-        exec_cmd(rm_cmd)
-
-        install_cmd = "install -d %s" % hdddir
-        tmp = exec_cmd(install_cmd)
-
-        splash = os.path.join(self.workdir, "/hdd/boot/splash.jpg")
-        if os.path.exists(splash):
-            splashline = "menu background splash.jpg"
-        else:
-            splashline = ""
-
-        (rootdev, root_part_uuid) = self._get_boot_config()
-        options = self.ks.handler.bootloader.appendLine
-
-        syslinux_conf = ""
-        syslinux_conf += "PROMPT 0\n"
-        timeout = kickstart.get_timeout(self.ks)
-        if not timeout:
-            timeout = 0
-        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
-        syslinux_conf += "\n"
-        syslinux_conf += "ALLOWOPTIONS 1\n"
-        syslinux_conf += "SERIAL 0 115200\n"
-        syslinux_conf += "\n"
-        if splashline:
-            syslinux_conf += "%s\n" % splashline
-        syslinux_conf += "DEFAULT boot\n"
-        syslinux_conf += "LABEL boot\n"
-
-        kernel = "/vmlinuz"
-        syslinux_conf += "KERNEL " + kernel + "\n"
-
-        if self._ptable_format == 'msdos':
-            rootstr = rootdev
-        else:
-            if not root_part_uuid:
-                raise MountError("Cannot find the root GPT partition UUID")
-            rootstr = "PARTUUID=%s" % root_part_uuid
-
-        syslinux_conf += "APPEND label=boot root=%s %s\n" % (rootstr, options)
-
-        msger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg" \
-                    % self.workdir)
-        cfg = open("%s/hdd/boot/syslinux.cfg" % self.workdir, "w")
-        cfg.write(syslinux_conf)
-        cfg.close()
-
-    def _create_grubefi_config(self):
-        hdddir = "%s/hdd/boot" % self.workdir
-        rm_cmd = "rm -rf %s" % self.workdir
-        exec_cmd(rm_cmd)
-
-        install_cmd = "install -d %s/EFI/BOOT" % hdddir
-        tmp = exec_cmd(install_cmd)
-
-        splash = os.path.join(self.workdir, "/EFI/boot/splash.jpg")
-        if os.path.exists(splash):
-            splashline = "menu background splash.jpg"
-        else:
-            splashline = ""
-
-        (rootdev, root_part_uuid) = self._get_boot_config()
-        options = self.ks.handler.bootloader.appendLine
-
-        grubefi_conf = ""
-        grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
-        grubefi_conf += "default=boot\n"
-        timeout = kickstart.get_timeout(self.ks)
-        if not timeout:
-            timeout = 0
-        grubefi_conf += "timeout=%s\n" % timeout
-        grubefi_conf += "menuentry 'boot'{\n"
-
-        kernel = "/vmlinuz"
-
-        if self._ptable_format == 'msdos':
-            rootstr = rootdev
-        else:
-            if not root_part_uuid:
-                raise MountError("Cannot find the root GPT partition UUID")
-            rootstr = "PARTUUID=%s" % root_part_uuid
-
-        grubefi_conf += "linux %s root=%s rootwait %s\n" \
-            % (kernel, rootstr, options)
-        grubefi_conf += "}\n"
-        if splashline:
-            syslinux_conf += "%s\n" % splashline
-
-        msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
-                        % self.workdir)
-        cfg = open("%s/hdd/boot/EFI/BOOT/grub.cfg" % self.workdir, "w")
-        cfg.write(grubefi_conf)
-        cfg.close()
-
-    def _install_syslinux(self):
-        mbrfile = "%s/syslinux/" % self.bootimg_dir
-        if self._ptable_format == 'gpt':
-            mbrfile += "gptmbr.bin"
-        else:
-            mbrfile += "mbr.bin"
-
-        if not os.path.exists(mbrfile):
-            msger.error("Couldn't find %s.  If using the -e option, do you have the right MACHINE set in local.conf?  If not, is the bootimg_dir path correct?" % mbrfile)
-
-        for disk_name, disk in self.__instimage.disks.items():
-            full_path = self._full_path(self.__imgdir, disk_name, "direct")
-            msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
-                            % (disk_name, full_path, disk['min_size']))
-
-            rc = runner.show(['dd', 'if=%s' % mbrfile,
-                              'of=%s' % full_path, 'conv=notrunc'])
-            if rc != 0:
-                raise MountError("Unable to set MBR to %s" % full_path)
-
     def _unmount_instroot(self):
         if not self.__instimage is None:
             try:
diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index fe8e55a..4974a87 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -28,8 +28,14 @@ import shutil
 
 from pykickstart.commands.partition import *
 from mic.utils.oe.misc import *
-
 from mic.kickstart.custom_commands import *
+from mic.plugin import pluginmgr
+
+partition_methods = {
+    "do_stage_partition":None,
+    "do_prepare_partition":None,
+    "do_configure_partition":None,
+}
 
 class Wic_PartData(Mic_PartData):
     removedKeywords = Mic_PartData.removedKeywords
@@ -50,8 +56,22 @@ class Wic_PartData(Mic_PartData):
 
         return retval
 
-    def prepare(self, cr_workdir, oe_builddir, boot_type, rootfs_dir,
-                bootimg_dir, kernel_dir, native_sysroot):
+    def set_size(self, size):
+        """
+        Accessor for actual partition size, which must be set by source
+        plugins.
+        """
+        self.size = size
+
+    def set_source_file(self, source_file):
+        """
+        Accessor for source_file, the location of the generated partition
+        image, which must be set by source plugins.
+        """
+        self.source_file = source_file
+
+    def prepare(self, cr, cr_workdir, oe_builddir, rootfs_dir, bootimg_dir,
+                kernel_dir, native_sysroot):
         """
         Prepare content for individual partitions, depending on
         partition command parameters.
@@ -65,121 +85,24 @@ class Wic_PartData(Mic_PartData):
                                              native_sysroot)
             return
 
-        if self.source == "bootimg" and boot_type == "pcbios":
-            self.prepare_bootimg_pcbios(cr_workdir, oe_builddir, bootimg_dir,
-                                        kernel_dir, native_sysroot)
-        elif self.source == "bootimg" and boot_type == "efi":
-            self.prepare_bootimg_efi(cr_workdir, oe_builddir, bootimg_dir,
-                                     kernel_dir, native_sysroot)
-        elif self.source.startswith("rootfs"):
+        if self.source.startswith("rootfs"):
             self.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir,
                                 native_sysroot)
-
-    def prepare_bootimg_pcbios(self, cr_workdir, oe_builddir, bootimg_dir,
-                               kernel_dir, native_sysroot):
-        """
-        Prepare content for a legacy bios boot partition.
-        """
-        staging_kernel_dir = kernel_dir
-        staging_data_dir = bootimg_dir
-
-        hdddir = "%s/hdd/boot" % cr_workdir
-
-        install_cmd = "install -m 0644 %s/bzImage %s/vmlinuz" \
-            % (staging_kernel_dir, hdddir)
-        tmp = exec_cmd(install_cmd)
-
-        install_cmd = "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" \
-            % (staging_data_dir, hdddir)
-        tmp = exec_cmd(install_cmd)
-
-        du_cmd = "du -bks %s" % hdddir
-        rc, out = exec_cmd(du_cmd)
-        blocks = int(out.split()[0])
-
-        blocks += BOOTDD_EXTRA_SPACE
-
-        # Ensure total sectors is an integral number of sectors per
-        # track or mcopy will complain. Sectors are 512 bytes, and we
-        # generate images with 32 sectors per track. This calculation is
-        # done in blocks, thus the mod by 16 instead of 32.
-        blocks += (16 - (blocks % 16))
-
-        # dosfs image, created by mkdosfs
-        bootimg = "%s/boot.img" % cr_workdir
-
-        dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (bootimg, blocks)
-        exec_native_cmd(dosfs_cmd, native_sysroot)
-
-        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-        exec_native_cmd(mcopy_cmd, native_sysroot)
-
-        syslinux_cmd = "syslinux %s" % bootimg
-        exec_native_cmd(syslinux_cmd, native_sysroot)
-
-        chmod_cmd = "chmod 644 %s" % bootimg
-        exec_cmd(chmod_cmd)
-
-        du_cmd = "du -Lbms %s" % bootimg
-        rc, out = exec_cmd(du_cmd)
-        bootimg_size = out.split()[0]
-
-        self.size = bootimg_size
-        self.source_file = bootimg
-
-    def prepare_bootimg_efi(self, cr_workdir, oe_builddir, bootimg_dir,
-                            kernel_dir, native_sysroot):
-        """
-        Prepare content for an EFI (grub) boot partition.
-        """
-        staging_kernel_dir = kernel_dir
-        staging_data_dir = bootimg_dir
-
-        hdddir = "%s/hdd/boot" % cr_workdir
-
-        install_cmd = "install -m 0644 %s/bzImage %s/vmlinuz" % \
-            (staging_kernel_dir, hdddir)
-        tmp = exec_cmd(install_cmd)
-
-        shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
-                        "%s/grub.cfg" % cr_workdir)
-
-        cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (staging_data_dir, hdddir)
-        exec_cmd(cp_cmd, True)
-
-        shutil.move("%s/grub.cfg" % cr_workdir,
-                    "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
-
-        du_cmd = "du -bks %s" % hdddir
-        rc, out = exec_cmd(du_cmd)
-        blocks = int(out.split()[0])
-
-        blocks += BOOTDD_EXTRA_SPACE
-
-        # Ensure total sectors is an integral number of sectors per
-        # track or mcopy will complain. Sectors are 512 bytes, and we
-        # generate images with 32 sectors per track. This calculation is
-        # done in blocks, thus the mod by 16 instead of 32.
-        blocks += (16 - (blocks % 16))
-
-        # dosfs image, created by mkdosfs
-        bootimg = "%s/boot.img" % cr_workdir
-
-        dosfs_cmd = "mkdosfs -n efi -C %s %d" % (bootimg, blocks)
-        exec_native_cmd(dosfs_cmd, native_sysroot)
-
-        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-        exec_native_cmd(mcopy_cmd, native_sysroot)
-
-        chmod_cmd = "chmod 644 %s" % bootimg
-        exec_cmd(chmod_cmd)
-
-        du_cmd = "du -Lbms %s" % bootimg
-        rc, out = exec_cmd(du_cmd)
-        bootimg_size = out.split()[0]
-
-        self.size = bootimg_size
-        self.source_file = bootimg
+        else:
+            self._source_methods = pluginmgr.get_source_plugin_methods(self.source, partition_methods)
+            self._source_methods["do_configure_partition"](self, cr, cr_workdir,
+                                                           oe_builddir,
+                                                           bootimg_dir,
+                                                           kernel_dir,
+                                                           native_sysroot)
+            self._source_methods["do_stage_partition"](self, cr, cr_workdir,
+                                                       oe_builddir,
+                                                       bootimg_dir, kernel_dir,
+                                                       native_sysroot)
+            self._source_methods["do_prepare_partition"](self, cr, cr_workdir,
+                                                         oe_builddir,
+                                                         bootimg_dir, kernel_dir,
+                                                         native_sysroot)
 
     def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
                                      rootfs_dir):
diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
index f2bd071..3e0997b 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -107,7 +107,7 @@ class BootimgEFIPlugin(SourcePlugin):
             if not bootimg_dir:
                 msger.error("Couldn't find HDDDIR, exiting\n")
             # just so the result notes display it
-            cr.bootimg_dir = bootimg_dir
+            cr.set_bootimg_dir(bootimg_dir)
 
         staging_kernel_dir = kernel_dir
         staging_data_dir = bootimg_dir
@@ -155,7 +155,7 @@ class BootimgEFIPlugin(SourcePlugin):
         rc, out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
-        part.size = bootimg_size
-        part.source_file = bootimg
+        part.set_size(bootimg_size)
+        part.set_source_file(bootimg)
 
 
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
index 1da2a41..3cd446f 100644
--- a/scripts/lib/mic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
@@ -135,7 +135,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
             if not bootimg_dir:
                 msger.error("Couldn't find STAGING_DATADIR, exiting\n")
             # just so the result notes display it
-            cr.bootimg_dir = bootimg_dir
+            cr.set_bootimg_dir(bootimg_dir)
 
         staging_kernel_dir = kernel_dir
         staging_data_dir = bootimg_dir
@@ -181,7 +181,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         rc, out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
-        part.size = bootimg_size
-        part.source_file = bootimg
+        part.set_size(bootimg_size)
+        part.set_source_file(bootimg)
 
 
-- 
1.8.3.1


