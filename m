Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 762BD6FECD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 15:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="573937450"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2014 15:06:02 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:26 -0500
Message-Id: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 01/35] wic: Make exec_cmd() error out instead of warn
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:06 -0000

The reason exec_cmd() warns but doesn't error out (broken parted)
doesn't really make sense, since the parted invocations don't even use
exec_cmd().  It really should just fail since by not doing so it's
actually enabling invalid images in some cases.

Also, since the return code is now always zero, there's no point in
having a return code, so remove it.  This represents a change in the
API, so we also need to update all callers.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../lib/mic/kickstart/custom_commands/partition.py | 44 +++++++++++-----------
 scripts/lib/mic/plugins/source/bootimg-efi.py      |  8 ++--
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   | 10 ++---
 scripts/lib/mic/utils/fs_related.py                |  2 +-
 scripts/lib/mic/utils/oe/misc.py                   | 33 +++++++++-------
 scripts/lib/mic/utils/partitionedfs.py             |  2 +-
 6 files changed, 53 insertions(+), 46 deletions(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 3b652b3..101b90e 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -161,7 +161,7 @@ class Wic_PartData(Mic_PartData):
         """
         rootfs = oe_builddir
         du_cmd = "du -Lbms %s" % rootfs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
         self.size = rootfs_size
@@ -209,7 +209,7 @@ class Wic_PartData(Mic_PartData):
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
         du_cmd = "du -ks %s" % image_rootfs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
 
         extra_blocks = self.get_extra_block_count(actual_rootfs_size)
@@ -224,18 +224,18 @@ class Wic_PartData(Mic_PartData):
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=0 bs=1k" % \
             (rootfs, rootfs_size)
-        rc, out = exec_cmd(dd_cmd)
+        exec_cmd(dd_cmd)
 
         extra_imagecmd = "-i 8192"
 
         mkfs_cmd = "mkfs.%s -F %s %s -d %s" % \
             (self.fstype, extra_imagecmd, rootfs, image_rootfs)
-        rc, out = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
         self.size = rootfs_size
@@ -254,7 +254,7 @@ class Wic_PartData(Mic_PartData):
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
         du_cmd = "du -ks %s" % image_rootfs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
 
         extra_blocks = self.get_extra_block_count(actual_rootfs_size)
@@ -269,15 +269,15 @@ class Wic_PartData(Mic_PartData):
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=0 bs=1k" % \
             (rootfs, rootfs_size)
-        rc, out = exec_cmd(dd_cmd)
+        exec_cmd(dd_cmd)
 
         mkfs_cmd = "mkfs.%s -b %d -r %s %s" % \
             (self.fstype, rootfs_size * 1024, image_rootfs, rootfs)
-        rc, out = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
+        exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
         self.size = rootfs_size
@@ -292,7 +292,7 @@ class Wic_PartData(Mic_PartData):
         rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
         du_cmd = "du -bks %s" % image_rootfs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
         extra_blocks = self.get_extra_block_count(blocks)
@@ -324,7 +324,7 @@ class Wic_PartData(Mic_PartData):
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
         self.set_size(rootfs_size)
@@ -340,11 +340,11 @@ class Wic_PartData(Mic_PartData):
 
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
                        (image_rootfs, rootfs)
-        rc, out = exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
+        exec_native_cmd(pseudo + squashfs_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         rootfs_size = out.split()[0]
 
         self.size = rootfs_size
@@ -378,12 +378,12 @@ class Wic_PartData(Mic_PartData):
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
             (fs, self.size)
-        rc, out = exec_cmd(dd_cmd)
+        exec_cmd(dd_cmd)
 
         extra_imagecmd = "-i 8192"
 
         mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
-        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+        exec_native_cmd(mkfs_cmd, native_sysroot)
 
         self.source_file = fs
 
@@ -398,13 +398,13 @@ class Wic_PartData(Mic_PartData):
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
             (fs, self.size)
-        rc, out = exec_cmd(dd_cmd)
+        exec_cmd(dd_cmd)
 
         mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size * 1024, rootfs)
-        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+        exec_native_cmd(mkfs_cmd, native_sysroot)
 
         mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
-        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+        exec_native_cmd(mkfs_cmd, native_sysroot)
 
         self.source_file = fs
 
@@ -445,13 +445,13 @@ class Wic_PartData(Mic_PartData):
 
         squashfs_cmd = "mksquashfs %s %s -noappend" % \
                        (tmpdir, fs)
-        rc, out = exec_native_cmd(squashfs_cmd, native_sysroot)
+        exec_native_cmd(squashfs_cmd, native_sysroot)
 
         os.rmdir(tmpdir)
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % fs
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         fs_size = out.split()[0]
 
         self.size = fs_size
@@ -467,14 +467,14 @@ class Wic_PartData(Mic_PartData):
 
         dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
             (fs, self.size)
-        rc, out = exec_cmd(dd_cmd)
+        exec_cmd(dd_cmd)
 
         import uuid
         label_str = ""
         if self.label:
             label_str = "-L %s" % self.label
         mkswap_cmd = "mkswap %s -U %s %s" % (label_str, str(uuid.uuid1()), fs)
-        rc, out = exec_native_cmd(mkswap_cmd, native_sysroot)
+        exec_native_cmd(mkswap_cmd, native_sysroot)
 
         self.source_file = fs
 
diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
index 0dd9152..aecda6b 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -53,7 +53,7 @@ class BootimgEFIPlugin(SourcePlugin):
         exec_cmd(rm_cmd)
 
         install_cmd = "install -d %s/EFI/BOOT" % hdddir
-        tmp = exec_cmd(install_cmd)
+        exec_cmd(install_cmd)
 
         splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
         if os.path.exists(splash):
@@ -116,7 +116,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
         install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
             (staging_kernel_dir, hdddir)
-        tmp = exec_cmd(install_cmd)
+        exec_cmd(install_cmd)
 
         shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
                         "%s/grub.cfg" % cr_workdir)
@@ -128,7 +128,7 @@ class BootimgEFIPlugin(SourcePlugin):
                     "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
 
         du_cmd = "du -bks %s" % hdddir
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
         extra_blocks = part.get_extra_block_count(blocks)
@@ -160,7 +160,7 @@ class BootimgEFIPlugin(SourcePlugin):
         exec_cmd(chmod_cmd)
 
         du_cmd = "du -Lbms %s" % bootimg
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
         part.set_size(bootimg_size)
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
index 1211e5c..6488ae9 100644
--- a/scripts/lib/mic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
@@ -78,7 +78,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         exec_cmd(rm_cmd)
 
         install_cmd = "install -d %s" % hdddir
-        tmp = exec_cmd(install_cmd)
+        exec_cmd(install_cmd)
 
         splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
         if os.path.exists(splash):
@@ -144,14 +144,14 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         install_cmd = "install -m 0644 %s/bzImage %s/vmlinuz" \
             % (staging_kernel_dir, hdddir)
-        tmp = exec_cmd(install_cmd)
+        exec_cmd(install_cmd)
 
         install_cmd = "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" \
             % (staging_data_dir, hdddir)
-        tmp = exec_cmd(install_cmd)
+        exec_cmd(install_cmd)
 
         du_cmd = "du -bks %s" % hdddir
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
         extra_blocks = part.get_extra_block_count(blocks)
@@ -186,7 +186,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         exec_cmd(chmod_cmd)
 
         du_cmd = "du -Lbms %s" % bootimg
-        rc, out = exec_cmd(du_cmd)
+        out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
         part.set_size(bootimg_size)
diff --git a/scripts/lib/mic/utils/fs_related.py b/scripts/lib/mic/utils/fs_related.py
index dd420e8..182171f 100644
--- a/scripts/lib/mic/utils/fs_related.py
+++ b/scripts/lib/mic/utils/fs_related.py
@@ -306,7 +306,7 @@ class DiskImage(Disk):
         # create disk image
         dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=1" % \
             (self.image_file, blocks)
-        rc, out = exec_cmd(dd_cmd)
+        exec_cmd(dd_cmd)
 
         self.device = self.image_file
 
diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
index 16c250a..bed2750 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -28,13 +28,13 @@
 from mic import msger
 from mic.utils import runner
 
-def exec_cmd(cmd_and_args, as_shell = False, catch = 3):
+def __exec_cmd(cmd_and_args, as_shell = False, catch = 3):
     """
     Execute command, catching stderr, stdout
 
     Need to execute as_shell if the command uses wildcards
     """
-    msger.debug("exec_cmd: %s" % cmd_and_args)
+    msger.debug("__exec_cmd: %s" % cmd_and_args)
     args = cmd_and_args.split()
     msger.debug(args)
 
@@ -43,24 +43,31 @@ def exec_cmd(cmd_and_args, as_shell = False, catch = 3):
     else:
         rc, out = runner.runtool(args, catch)
     out = out.strip()
-    msger.debug("exec_cmd: output for %s (rc = %d): %s" % \
-                    (cmd_and_args, rc, out))
+    msger.debug("__exec_cmd: output for %s (rc = %d): %s" % \
+                (cmd_and_args, rc, out))
+
+    return (rc, out)
+
+
+def exec_cmd(cmd_and_args, as_shell = False, catch = 3):
+    """
+    Execute command, catching stderr, stdout
+
+    Exits if rc non-zero
+    """
+    rc, out = __exec_cmd(cmd_and_args, as_shell, catch)
 
     if rc != 0:
-        # We don't throw exception when return code is not 0, because
-        # parted always fails to reload part table with loop devices. This
-        # prevents us from distinguishing real errors based on return
-        # code.
-        msger.warning("WARNING: %s returned '%s' instead of 0" % (cmd_and_args, rc))
+        msger.error("exec_cmd: %s returned '%s' instead of 0" % (cmd_and_args, rc))
 
-    return (rc, out)
+    return out
 
 
 def exec_cmd_quiet(cmd_and_args, as_shell = False):
     """
     Execute command, catching nothing in the output
 
-    Need to execute as_shell if the command uses wildcards
+    Exits if rc non-zero
     """
     return exec_cmd(cmd_and_args, as_shell, 0)
 
@@ -82,7 +89,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch = 3):
     args = cmd_and_args.split()
     msger.debug(args)
 
-    rc, out = exec_cmd(native_cmd_and_args, True, catch)
+    rc, out = __exec_cmd(native_cmd_and_args, True, catch)
 
     if rc == 127: # shell command-not-found
         msger.error("A native (host) program required to build the image "
@@ -135,7 +142,7 @@ def find_bitbake_env_lines(image_name):
         bitbake_env_cmd = "bitbake -e %s" % image_name
     else:
         bitbake_env_cmd = "bitbake -e"
-    rc, bitbake_env_lines = exec_cmd(bitbake_env_cmd)
+    rc, bitbake_env_lines = __exec_cmd(bitbake_env_cmd)
     if rc != 0:
         print "Couldn't get '%s' output." % bitbake_env_cmd
         return None
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 593cf1f..83ce869 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -744,7 +744,7 @@ class PartitionedMount(Mount):
 
         dd_cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
             (source_file, self.image_file, self.sector_size, start, size)
-        rc, out = exec_cmd(dd_cmd)
+        exec_cmd(dd_cmd)
 
 
     def install(self, image_file):
-- 
1.8.3.1


