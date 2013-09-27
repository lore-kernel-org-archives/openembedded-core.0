Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id BE1926CB8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 02:18:35 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Sep 2013 19:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,989,1371106800"; d="scan'208";a="299958529"
Received: from unknown (HELO localhost) ([10.255.15.160])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Sep 2013 19:17:57 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 21:17:53 -0500
Message-Id: <c96a30ebec3cdb0cb4fed26db5ae89b19f769721.1380234931.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
References: <8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1380234931.git.tom.zanussi@linux.intel.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/3] wic: Add OpenEmbedded-specific implementation
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
X-List-Received-Date: Fri, 27 Sep 2013 02:18:36 -0000

Reuses the mic/livecd infrastructure but heavily subclasses and
modifies it to adapt to the special needs of building images from
existing OpenEmbedded build artifacts.

In addition to the OE-specific mic objects and modifications to the
underlying infrastructure, this adds a mechanism to allow OE kickstart
files to be 'canned' and made available to users via the 'wic list
images' command.

Two initial OE kickstart files have been added as canned .wks files:
directdisk, which implements the same thing as the images created by
directdisk.bbclass, and mkefidisk, which can essentially be used as a
replacement for mkefidisk.sh.  Of course, since creation of these
images are now driven by .wks files rather than being hard-coded into
class files or scripts, they can be easily modified to generate
different variations on those images.  They also don't require root
priveleges, since they don't use mount to create the images.  They
don't however write to media like mkefidisk.sh does, but rather create
images that can be written onto media.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/canned-wks/directdisk.wks        |  10 +
 scripts/lib/image/canned-wks/mkefidisk.wks         |  11 +
 scripts/lib/image/config/wic.conf                  |   7 +
 scripts/lib/image/engine.py                        |  24 ++
 scripts/lib/mic/conf.py                            |  54 +--
 scripts/lib/mic/creator.py                         |   3 -
 scripts/lib/mic/imager/baseimager.py               |  82 +---
 scripts/lib/mic/imager/direct.py                   | 472 +++++++++++++++++++++
 scripts/lib/mic/kickstart/__init__.py              |   6 +-
 .../lib/mic/kickstart/custom_commands/__init__.py  |   7 +-
 .../mic/kickstart/custom_commands/micpartition.py  |  57 +++
 .../lib/mic/kickstart/custom_commands/partition.py | 389 +++++++++++++++--
 scripts/lib/mic/plugin.py                          |   6 +-
 scripts/lib/mic/plugins/imager/direct_plugin.py    |  92 ++++
 scripts/lib/mic/utils/fs_related.py                |  30 +-
 scripts/lib/mic/utils/misc.py                      |   4 +-
 scripts/lib/mic/utils/oe/__init__.py               |  22 +
 scripts/lib/mic/utils/oe/misc.py                   | 108 +++++
 scripts/lib/mic/utils/partitionedfs.py             |  94 ++--
 scripts/yocto-image.conf                           |  35 --
 20 files changed, 1253 insertions(+), 260 deletions(-)
 create mode 100644 scripts/lib/image/canned-wks/directdisk.wks
 create mode 100644 scripts/lib/image/canned-wks/mkefidisk.wks
 create mode 100644 scripts/lib/image/config/wic.conf
 create mode 100644 scripts/lib/mic/imager/direct.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/micpartition.py
 create mode 100644 scripts/lib/mic/plugins/imager/direct_plugin.py
 create mode 100644 scripts/lib/mic/utils/oe/__init__.py
 create mode 100644 scripts/lib/mic/utils/oe/misc.py
 delete mode 100644 scripts/yocto-image.conf

diff --git a/scripts/lib/image/canned-wks/directdisk.wks b/scripts/lib/image/canned-wks/directdisk.wks
new file mode 100644
index 0000000..d54b382
--- /dev/null
+++ b/scripts/lib/image/canned-wks/directdisk.wks
@@ -0,0 +1,10 @@
+# short-description: Create a 'pcbios' direct disk image
+# long-description: Creates a partitioned legacy BIOS disk image that the user
+# can directly dd to boot media.
+
+
+part /boot --source bootimg --ondisk sda --fstype=msdos --label boot --active --align 1024
+part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+
+bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
+
diff --git a/scripts/lib/image/canned-wks/mkefidisk.wks b/scripts/lib/image/canned-wks/mkefidisk.wks
new file mode 100644
index 0000000..8a3e1f6
--- /dev/null
+++ b/scripts/lib/image/canned-wks/mkefidisk.wks
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.
+
+part /boot --source bootimg --ondisk sda --fstype=efi --label msdos --active --align 1024
+
+part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+
+part swap --ondisk sda --size 44 --label swap1 --fstype=swap
+
+bootloader  --timeout=10  --append="rootwait rootfstype=ext3 console=ttyPCH0,115200 console=tty0 vmalloc=256MB snd-hda-intel.enable_msi=0"
diff --git a/scripts/lib/image/config/wic.conf b/scripts/lib/image/config/wic.conf
new file mode 100644
index 0000000..e96d6ae
--- /dev/null
+++ b/scripts/lib/image/config/wic.conf
@@ -0,0 +1,7 @@
+[common]
+; general settings
+distro_name = OpenEmbedded
+
+[create]
+; settings for create subcommand
+runtime=native
diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index a9b530c..be29222 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -37,6 +37,12 @@ import subprocess
 import shutil
 
 import os, sys, errno
+from mic import msger, creator
+from mic.utils import cmdln, misc, errors
+from mic.conf import configmgr
+from mic.plugin import pluginmgr
+from mic.__version__ import VERSION
+from mic.utils.oe.misc import *
 
 
 def verify_build_env():
@@ -216,6 +222,24 @@ def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
         print "BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)"
         sys.exit(1)
 
+    direct_args = list()
+    direct_args.insert(0, oe_builddir)
+    direct_args.insert(0, image_output_dir)
+    direct_args.insert(0, wks_file)
+    direct_args.insert(0, rootfs_dir)
+    direct_args.insert(0, bootimg_dir)
+    direct_args.insert(0, kernel_dir)
+    direct_args.insert(0, native_sysroot)
+    direct_args.insert(0, hdddir)
+    direct_args.insert(0, staging_data_dir)
+    direct_args.insert(0, "direct")
+
+    cr = creator.Creator()
+
+    cr.main(direct_args)
+
+    print "\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file
+
 
 def wic_list(args, scripts_path, properties_file):
     """
diff --git a/scripts/lib/mic/conf.py b/scripts/lib/mic/conf.py
index e37334c..58fad51 100644
--- a/scripts/lib/mic/conf.py
+++ b/scripts/lib/mic/conf.py
@@ -23,29 +23,24 @@ from mic import kickstart
 from mic.utils import misc, runner, proxy, errors
 
 
-DEFAULT_GSITECONF = '/etc/mic/mic.conf'
-
-
 def get_siteconf():
     mic_path = os.path.dirname(__file__)
+    eos = mic_path.find('scripts') + len('scripts')
+    scripts_path = mic_path[:eos]
 
-    m = re.match(r"(?P<prefix>.*)\/lib(64)?\/.*", mic_path)
-    if m and m.group('prefix') != "/usr":
-        return os.path.join(m.group('prefix'), "etc/mic/mic.conf")
-
-    return DEFAULT_GSITECONF
+    return scripts_path + "/lib/image/config/wic.conf"
 
 class ConfigMgr(object):
     prefer_backends = ["zypp", "yum"]
 
     DEFAULTS = {'common': {
                     "distro_name": "Default Distribution",
-                    "plugin_dir": "/usr/lib/mic/plugins", # TODO use prefix also?
+                    "plugin_dir": "/usr/lib/wic/plugins", # TODO use prefix also?
                 },
                 'create': {
-                    "tmpdir": '/var/tmp/mic',
-                    "cachedir": '/var/tmp/mic/cache',
-                    "outdir": './mic-output',
+                    "tmpdir": '/var/tmp/wic',
+                    "cachedir": '/var/tmp/wic/cache',
+                    "outdir": './wic-output',
 
                     "arch": None, # None means auto-detect
                     "pkgmgr": "auto",
@@ -75,7 +70,7 @@ class ConfigMgr(object):
                     "shell": False,
                 },
                 'bootstrap': {
-                    "rootdir": '/var/tmp/mic-bootstrap',
+                    "rootdir": '/var/tmp/wic-bootstrap',
                     "packages": [],
                 },
                }
@@ -191,39 +186,6 @@ class ConfigMgr(object):
                                               self.create['name_prefix'],
                                               self.create['name_suffix'])
 
-        msger.info("Retrieving repo metadata:")
-        ksrepos = misc.get_repostrs_from_ks(ks)
-        if not ksrepos:
-            raise errors.KsError('no valid repos found in ks file')
-
-        for repo in ksrepos:
-            if 'baseurl' in repo and repo['baseurl'].startswith("file:"):
-                repourl = repo['baseurl'].replace('file:', '')
-                repourl = "/%s" % repourl.lstrip('/')
-                self.create['localrepos'].append(repourl)
-
-        self.create['repomd'] = misc.get_metadata_from_repos(
-                                                    ksrepos,
-                                                    self.create['cachedir'])
-        msger.raw(" DONE")
-
-        target_archlist, archlist = misc.get_arch(self.create['repomd'])
-        if self.create['arch']:
-            if self.create['arch'] not in archlist:
-                raise errors.ConfigError("Invalid arch %s for repository. "
-                                  "Valid arches: %s" \
-                                  % (self.create['arch'], ', '.join(archlist)))
-        else:
-            if len(target_archlist) == 1:
-                self.create['arch'] = str(target_archlist[0])
-                msger.info("\nUse detected arch %s." % target_archlist[0])
-            else:
-                raise errors.ConfigError("Please specify a valid arch, "
-                                         "the choice can be: %s" \
-                                         % ', '.join(archlist))
-
-        kickstart.resolve_groups(self.create, self.create['repomd'])
-
         # check selinux, it will block arm and btrfs image creation
         misc.selinux_check(self.create['arch'],
                            [p.fstype for p in ks.handler.partition.partitions])
diff --git a/scripts/lib/mic/creator.py b/scripts/lib/mic/creator.py
index af5fb82..f3d0de1 100644
--- a/scripts/lib/mic/creator.py
+++ b/scripts/lib/mic/creator.py
@@ -293,9 +293,6 @@ class Creator(cmdln.Cmdln):
         if len(argv) == 1:
             return ['help', argv[0]]
 
-        if os.geteuid() != 0:
-            raise msger.error("Root permission is required, abort")
-
         return argv
 
     def do_auto(self, subcmd, opts, *args):
diff --git a/scripts/lib/mic/imager/baseimager.py b/scripts/lib/mic/imager/baseimager.py
index 6efc6c1..4d6be29 100644
--- a/scripts/lib/mic/imager/baseimager.py
+++ b/scripts/lib/mic/imager/baseimager.py
@@ -1,4 +1,3 @@
-
 #!/usr/bin/python -tt
 #
 # Copyright (c) 2007 Red Hat  Inc.
@@ -69,9 +68,10 @@ class BaseImageCreator(object):
 
         self.ks = None
         self.name = "target"
-        self.tmpdir = "/var/tmp/mic"
-        self.cachedir = "/var/tmp/mic/cache"
-        self.workdir = "/var/tmp/mic/build"
+        self.tmpdir = "/var/tmp/wic"
+        self.cachedir = "/var/tmp/wic/cache"
+        self.workdir = "/var/tmp/wic/build"
+
         self.destdir = "."
         self.installerfw_prefix = "INSTALLERFW_"
         self.target_arch = "noarch"
@@ -463,7 +463,7 @@ class BaseImageCreator(object):
         env[self.installerfw_prefix + "DISTRO_NAME"] = self.distro_name
 
         # Name of the image creation tool
-        env[self.installerfw_prefix + "INSTALLER_NAME"] = "mic"
+        env[self.installerfw_prefix + "INSTALLER_NAME"] = "wic"
 
         # The real current location of the mounted file-systems
         if in_chroot:
@@ -668,7 +668,7 @@ class BaseImageCreator(object):
         if cachedir:
             self.cachedir = cachedir
         else:
-            self.cachedir = self.__builddir + "/mic-cache"
+            self.cachedir = self.__builddir + "/wic-cache"
         fs.makedirs(self.cachedir)
         return self.cachedir
 
@@ -751,52 +751,8 @@ class BaseImageCreator(object):
         self.__setup_tmpdir()
         self.__ensure_builddir()
 
-        # prevent popup dialog in Ubuntu(s)
-        misc.hide_loopdev_presentation()
-
-        fs.makedirs(self._instroot)
-        fs.makedirs(self._outdir)
-
         self._mount_instroot(base_on)
 
-        for d in ("/dev/pts",
-                  "/etc",
-                  "/boot",
-                  "/var/log",
-                  "/sys",
-                  "/proc",
-                  "/usr/bin"):
-            fs.makedirs(self._instroot + d)
-
-        if self.target_arch and self.target_arch.startswith("arm"):
-            self.qemu_emulator = misc.setup_qemu_emulator(self._instroot,
-                                                          self.target_arch)
-
-
-        self.get_cachedir(cachedir)
-
-        # bind mount system directories into _instroot
-        for (f, dest) in [("/sys", None),
-                          ("/proc", None),
-                          ("/proc/sys/fs/binfmt_misc", None),
-                          ("/dev/pts", None)]:
-            self.__bindmounts.append(
-                    fs.BindChrootMount(
-                        f, self._instroot, dest))
-
-        self._do_bindmounts()
-
-        self.__create_minimal_dev()
-
-        if os.path.exists(self._instroot + "/etc/mtab"):
-            os.unlink(self._instroot + "/etc/mtab")
-        os.symlink("../proc/mounts", self._instroot + "/etc/mtab")
-
-        self.__write_fstab()
-
-        # get size of available space in 'instroot' fs
-        self._root_fs_avail = misc.get_filesystem_avail(self._instroot)
-
     def unmount(self):
         """Unmounts the target filesystem.
 
@@ -805,34 +761,8 @@ class BaseImageCreator(object):
         from the install root.
 
         """
-        try:
-            mtab = self._instroot + "/etc/mtab"
-            if not os.path.islink(mtab):
-                os.unlink(self._instroot + "/etc/mtab")
-
-            if self.qemu_emulator:
-                os.unlink(self._instroot + self.qemu_emulator)
-        except OSError:
-            pass
-
-        self._undo_bindmounts()
-
-        """ Clean up yum garbage """
-        try:
-            instroot_pdir = os.path.dirname(self._instroot + self._instroot)
-            if os.path.exists(instroot_pdir):
-                shutil.rmtree(instroot_pdir, ignore_errors = True)
-            yumlibdir = self._instroot + "/var/lib/yum"
-            if os.path.exists(yumlibdir):
-                shutil.rmtree(yumlibdir, ignore_errors = True)
-        except OSError:
-            pass
-
         self._unmount_instroot()
 
-        # reset settings of popup dialog in Ubuntu(s)
-        misc.unhide_loopdev_presentation()
-
 
     def cleanup(self):
         """Unmounts the target filesystem and deletes temporary files.
diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
new file mode 100644
index 0000000..d24bc68
--- /dev/null
+++ b/scripts/lib/mic/imager/direct.py
@@ -0,0 +1,472 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'direct' image creator class for 'wic', based
+# loosely on the raw image creator from 'mic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import os
+import stat
+import shutil
+
+from mic import kickstart, msger
+from mic.utils import fs_related, runner, misc
+from mic.utils.partitionedfs import PartitionedMount
+from mic.utils.errors import CreatorError, MountError
+from mic.imager.baseimager import BaseImageCreator
+from mic.utils.oe.misc import *
+
+class DirectImageCreator(BaseImageCreator):
+    """
+    Installs a system into a file containing a partitioned disk image.
+
+    DirectImageCreator is an advanced ImageCreator subclass; an image
+    file is formatted with a partition table, each partition created
+    from a rootfs or other OpenEmbedded build artifact and dd'ed into
+    the virtual disk. The disk image can subsequently be dd'ed onto
+    media and used on actual hardware.
+    """
+
+    def __init__(self, oe_builddir, image_output_dir, rootfs_dir, bootimg_dir,
+                 kernel_dir, native_sysroot, hdddir, staging_data_dir,
+                 creatoropts=None, pkgmgr=None, compress_image=None,
+                 generate_bmap=None, fstab_entry="uuid"):
+        """
+        Initialize a DirectImageCreator instance.
+
+        This method takes the same arguments as ImageCreator.__init__()
+        """
+        BaseImageCreator.__init__(self, creatoropts, pkgmgr)
+
+        self.__instimage = None
+        self.__imgdir = None
+        self.__disks = {}
+        self.__disk_format = "direct"
+        self._disk_names = []
+        self._ptable_format = self.ks.handler.bootloader.ptable
+        self.use_uuid = fstab_entry == "uuid"
+        self.compress_image = compress_image
+        self.bmap_needed = generate_bmap
+
+        self.oe_builddir = oe_builddir
+        if image_output_dir:
+            self.tmpdir = image_output_dir
+            self.cachedir = "%s/cache" % image_output_dir
+        self.rootfs_dir = rootfs_dir
+        self.bootimg_dir = bootimg_dir
+        self.kernel_dir = kernel_dir
+        self.native_sysroot = native_sysroot
+        self.hdddir = hdddir
+        self.staging_data_dir = staging_data_dir
+        self.boot_type = ""
+
+    def __write_fstab(self):
+        """overriden to generate fstab (temporarily) in rootfs. This
+        is called from mount_instroot, make sure it doesn't get called
+        from BaseImage.mount()"""
+
+        image_rootfs = self.rootfs_dir
+
+        parts = self._get_parts()
+
+        fstab = image_rootfs + "/etc/fstab"
+
+        self._save_fstab(fstab)
+        fstab_lines = self._get_fstab(fstab, parts)
+        self._update_fstab(fstab_lines, parts)
+        self._write_fstab(fstab, fstab_lines)
+
+        return fstab
+
+    def _update_fstab(self, fstab_lines, parts):
+        """Assume partition order same as in wks"""
+        for num, p in enumerate(parts, 1):
+            if p.mountpoint == "/" or p.mountpoint == "/boot":
+                continue
+            if self._ptable_format == 'msdos' and num > 3:
+                device_name = "/dev/" + p.disk + str(num + 1)
+            else:
+                device_name = "/dev/" + p.disk + str(num)
+            fstab_entry = device_name + "\t" + p.mountpoint + "\t" + p.fstype + "\tdefaults\t0\t0\n"
+            fstab_lines.append(fstab_entry)
+
+    def _write_fstab(self, fstab, fstab_lines):
+        fstab = open(fstab, "w")
+        for line in fstab_lines:
+            fstab.write(line)
+        fstab.close()
+
+    def _save_fstab(self, fstab):
+        """Save the current fstab in rootfs"""
+        shutil.copyfile(fstab, fstab + ".orig")
+
+    def _restore_fstab(self, fstab):
+        """Restore the saved fstab in rootfs"""
+        shutil.move(fstab + ".orig", fstab)
+
+    def _get_fstab(self, fstab, parts):
+        """Return the desired contents of /etc/fstab."""
+        f = open(fstab, "r")
+        fstab_contents = f.readlines()
+        f.close()
+
+        return fstab_contents
+
+    def _get_parts(self):
+        if not self.ks:
+            raise CreatorError("Failed to get partition info, "
+                               "please check your kickstart setting.")
+
+        # Set a default partition if no partition is given out
+        if not self.ks.handler.partition.partitions:
+            partstr = "part / --size 1900 --ondisk sda --fstype=ext3"
+            args = partstr.split()
+            pd = self.ks.handler.partition.parse(args[1:])
+            if pd not in self.ks.handler.partition.partitions:
+                self.ks.handler.partition.partitions.append(pd)
+
+        # partitions list from kickstart file
+        return kickstart.get_partitions(self.ks)
+
+    def get_disk_names(self):
+        """ Returns a list of physical target disk names (e.g., 'sdb') which
+        will be created. """
+
+        if self._disk_names:
+            return self._disk_names
+
+        #get partition info from ks handler
+        parts = self._get_parts()
+
+        for i in range(len(parts)):
+            if parts[i].disk:
+                disk_name = parts[i].disk
+            else:
+                raise CreatorError("Failed to create disks, no --ondisk "
+                                   "specified in partition line of ks file")
+
+            if parts[i].mountpoint and not parts[i].fstype:
+                raise CreatorError("Failed to create disks, no --fstype "
+                                    "specified for partition with mountpoint "
+                                    "'%s' in the ks file")
+
+            self._disk_names.append(disk_name)
+
+        return self._disk_names
+
+    def _full_name(self, name, extention):
+        """ Construct full file name for a file we generate. """
+        return "%s-%s.%s" % (self.name, name, extention)
+
+    def _full_path(self, path, name, extention):
+        """ Construct full file path to a file we generate. """
+        return os.path.join(path, self._full_name(name, extention))
+
+    def get_boot_type(self):
+        """ Determine the boot type from fstype and mountpoint. """
+        parts = self._get_parts()
+
+        boot_type = ""
+
+        for p in parts:
+            if p.mountpoint == "/boot":
+                if p.fstype == "msdos":
+                    boot_type = "pcbios"
+                else:
+                    boot_type = p.fstype
+        return boot_type
+
+    #
+    # Actual implemention
+    #
+    def _mount_instroot(self, base_on = None):
+        """
+        For 'wic', we already have our build artifacts and don't want
+        to loop mount anything to install into, we just create
+        filesystems from the artifacts directly and combine them into
+        a partitioned image.
+
+        We still want to reuse as much of the basic mic machinery
+        though; despite the fact that we don't actually do loop or any
+        other kind of mounting we still want to do many of the same
+        things to prepare images, so we basically just adapt to the
+        basic framework and reinterpret what 'mounting' means in our
+        context.
+
+        _instroot would normally be something like
+        /var/tmp/wic/build/imgcreate-s_9AKQ/install_root, for
+        installing packages, etc.  We don't currently need to do that,
+        so we simplify life by just using /var/tmp/wic/build as our
+        workdir.
+        """
+        parts = self._get_parts()
+
+        self.__instimage = PartitionedMount(self._instroot)
+
+        fstab = self.__write_fstab()
+
+        self.boot_type = self.get_boot_type()
+
+        if not self.bootimg_dir:
+            if self.boot_type == "pcbios":
+                self.bootimg_dir = self.staging_data_dir
+            elif self.boot_type == "efi":
+                self.bootimg_dir = self.hdddir
+
+        if self.boot_type == "pcbios":
+            self._create_syslinux_config()
+        elif self.boot_type == "efi":
+            self._create_grubefi_config()
+        else:
+            raise CreatorError("Failed to detect boot type (no /boot partition?), "
+                               "please check your kickstart setting.")
+
+        for p in parts:
+            if p.fstype == "efi":
+                p.fstype = "msdos"
+            # need to create the filesystems in order to get their
+            # sizes before we can add them and do the layout.
+            # PartitionedMount.mount() actually calls __format_disks()
+            # to create the disk images and carve out the partitions,
+            # then self.install() calls PartitionedMount.install()
+            # which calls __install_partitition() for each partition
+            # to dd the fs into the partitions.  It would be nice to
+            # be able to use e.g. ExtDiskMount etc to create the
+            # filesystems, since that's where existing e.g. mkfs code
+            # is, but those are only created after __format_disks()
+            # which needs the partition sizes so needs them created
+            # before its called.  Well, the existing setup is geared
+            # to installing packages into mounted filesystems - maybe
+            # when/if we need to actually do package selection we
+            # should modify things to use those objects, but for now
+            # we can avoid that.
+            p.prepare(self.workdir, self.oe_builddir, self.boot_type,
+                      self.rootfs_dir, self.bootimg_dir, self.kernel_dir,
+                      self.native_sysroot)
+
+            self.__instimage.add_partition(int(p.size),
+                                           p.disk,
+                                           p.mountpoint,
+                                           p.source_file,
+                                           p.fstype,
+                                           p.label,
+                                           fsopts = p.fsopts,
+                                           boot = p.active,
+                                           align = p.align,
+                                           part_type = p.part_type)
+        self._restore_fstab(fstab)
+        self.__instimage.layout_partitions(self._ptable_format)
+
+        self.__imgdir = self.workdir
+        for disk_name, disk in self.__instimage.disks.items():
+            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+            msger.debug("Adding disk %s as %s with size %s bytes" \
+                        % (disk_name, full_path, disk['min_size']))
+            disk_obj = fs_related.DiskImage(full_path, disk['min_size'])
+            self.__disks[disk_name] = disk_obj
+            self.__instimage.add_disk(disk_name, disk_obj)
+
+        self.__instimage.mount()
+
+    def install(self, repo_urls=None):
+        """
+        Install fs images into partitions
+        """
+        for disk_name, disk in self.__instimage.disks.items():
+            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+            msger.debug("Installing disk %s as %s with size %s bytes" \
+                        % (disk_name, full_path, disk['min_size']))
+            self.__instimage.install(full_path)
+
+    def configure(self, repodata = None):
+        """
+        Configure the system image according to kickstart.
+
+        For now, it just prepares the image to be bootable by e.g.
+        creating and installing a bootloader configuration.
+        """
+        if self.boot_type == "pcbios":
+            self._install_syslinux()
+
+    def print_outimage_info(self):
+        """
+        Print the image(s) and artifacts used, for the user.
+        """
+        msg = "The new image(s) can be found here:\n"
+
+        for disk_name, disk in self.__instimage.disks.items():
+            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+            msg += '  %s\n\n' % full_path
+
+        msg += 'The following build artifacts were used to create the image(s):\n'
+        msg += '  ROOTFS_DIR:      %s\n' % self.rootfs_dir
+        msg += '  BOOTIMG_DIR:     %s\n' % self.bootimg_dir
+        msg += '  KERNEL_DIR:      %s\n' % self.kernel_dir
+        msg += '  NATIVE_SYSROOT:  %s\n' % self.native_sysroot
+
+        msger.info(msg)
+
+    def _get_boot_config(self):
+        """
+        Return the rootdev/root_part_uuid (if specified by
+        --part-type)
+
+        Assume partition order same as in wks
+        """
+        rootdev = None
+        root_part_uuid = None
+        parts = self._get_parts()
+        for num, p in enumerate(parts, 1):
+            if p.mountpoint == "/":
+                if self._ptable_format == 'msdos' and num > 3:
+                    rootdev = "/dev/%s%-d" % (p.disk, num + 1)
+                else:
+                    rootdev = "/dev/%s%-d" % (p.disk, num)
+                root_part_uuid = p.part_type
+
+        return (rootdev, root_part_uuid)
+
+    def _create_syslinux_config(self):
+        hdddir = "%s/hdd/boot" % self.workdir
+        rm_cmd = "rm -rf " + self.workdir
+        exec_cmd(rm_cmd)
+
+        install_cmd = "install -d %s" % hdddir
+        tmp = exec_cmd(install_cmd)
+
+        splash = os.path.join(self.workdir, "/hdd/boot/splash.jpg")
+        if os.path.exists(splash):
+            splashline = "menu background splash.jpg"
+        else:
+            splashline = ""
+
+        (rootdev, root_part_uuid) = self._get_boot_config()
+        options = self.ks.handler.bootloader.appendLine
+
+        syslinux_conf = ""
+        syslinux_conf += "PROMPT 0\n"
+        timeout = kickstart.get_timeout(self.ks)
+        if not timeout:
+            timeout = 0
+        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
+        syslinux_conf += "\n"
+        syslinux_conf += "ALLOWOPTIONS 1\n"
+        syslinux_conf += "SERIAL 0 115200\n"
+        syslinux_conf += "\n"
+        if splashline:
+            syslinux_conf += "%s\n" % splashline
+        syslinux_conf += "DEFAULT boot\n"
+        syslinux_conf += "LABEL boot\n"
+
+        kernel = "/vmlinuz"
+        syslinux_conf += "KERNEL " + kernel + "\n"
+
+        if self._ptable_format == 'msdos':
+            rootstr = rootdev
+        else:
+            if not root_part_uuid:
+                raise MountError("Cannot find the root GPT partition UUID")
+            rootstr = "PARTUUID=%s" % root_part_uuid
+
+        syslinux_conf += "APPEND label=boot root=%s %s\n" % (rootstr, options)
+
+        msger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg" \
+                    % self.workdir)
+        cfg = open("%s/hdd/boot/syslinux.cfg" % self.workdir, "w")
+        cfg.write(syslinux_conf)
+        cfg.close()
+
+    def _create_grubefi_config(self):
+        hdddir = "%s/hdd/boot" % self.workdir
+        rm_cmd = "rm -rf %s" % self.workdir
+        exec_cmd(rm_cmd)
+
+        install_cmd = "install -d %s/EFI/BOOT" % hdddir
+        tmp = exec_cmd(install_cmd)
+
+        splash = os.path.join(self.workdir, "/EFI/boot/splash.jpg")
+        if os.path.exists(splash):
+            splashline = "menu background splash.jpg"
+        else:
+            splashline = ""
+
+        (rootdev, root_part_uuid) = self._get_boot_config()
+        options = self.ks.handler.bootloader.appendLine
+
+        grubefi_conf = ""
+        grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
+        grubefi_conf += "default=boot\n"
+        timeout = kickstart.get_timeout(self.ks)
+        if not timeout:
+            timeout = 0
+        grubefi_conf += "timeout=%s\n" % timeout
+        grubefi_conf += "menuentry 'boot'{\n"
+
+        kernel = "/vmlinuz"
+
+        if self._ptable_format == 'msdos':
+            rootstr = rootdev
+        else:
+            if not root_part_uuid:
+                raise MountError("Cannot find the root GPT partition UUID")
+            rootstr = "PARTUUID=%s" % root_part_uuid
+
+        grubefi_conf += "linux %s root=%s rootwait %s\n" \
+            % (kernel, rootstr, options)
+        grubefi_conf += "}\n"
+        if splashline:
+            syslinux_conf += "%s\n" % splashline
+
+        msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
+                        % self.workdir)
+        cfg = open("%s/hdd/boot/EFI/BOOT/grub.cfg" % self.workdir, "w")
+        cfg.write(grubefi_conf)
+        cfg.close()
+
+    def _install_syslinux(self):
+        mbrfile = "%s/syslinux/" % self.bootimg_dir
+        if self._ptable_format == 'gpt':
+            mbrfile += "gptmbr.bin"
+        else:
+            mbrfile += "mbr.bin"
+
+        if not os.path.exists(mbrfile):
+            msger.error("Couldn't find %s.  If using the -e option, do you have the right MACHINE set in local.conf?  If not, is the bootimg_dir path correct?" % mbrfile)
+
+        for disk_name, disk in self.__instimage.disks.items():
+            full_path = self._full_path(self.__imgdir, disk_name, "direct")
+            msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
+                            % (disk_name, full_path, disk['min_size']))
+
+            rc = runner.show(['dd', 'if=%s' % mbrfile,
+                              'of=%s' % full_path, 'conv=notrunc'])
+            if rc != 0:
+                raise MountError("Unable to set MBR to %s" % full_path)
+
+    def _unmount_instroot(self):
+        if not self.__instimage is None:
+            try:
+                self.__instimage.cleanup()
+            except MountError, err:
+                msger.warning("%s" % err)
+
diff --git a/scripts/lib/mic/kickstart/__init__.py b/scripts/lib/mic/kickstart/__init__.py
index f9a5334..7e645ca 100644
--- a/scripts/lib/mic/kickstart/__init__.py
+++ b/scripts/lib/mic/kickstart/__init__.py
@@ -99,11 +99,11 @@ def read_kickstart(path):
     commandMap[using_version]["desktop"] = desktop.Mic_Desktop
     commandMap[using_version]["repo"] = micrepo.Mic_Repo
     commandMap[using_version]["bootloader"] = micboot.Mic_Bootloader
-    commandMap[using_version]["part"] = partition.Mic_Partition
-    commandMap[using_version]["partition"] = partition.Mic_Partition
+    commandMap[using_version]["part"] = partition.Wic_Partition
+    commandMap[using_version]["partition"] = partition.Wic_Partition
     commandMap[using_version]["installerfw"] = installerfw.Mic_installerfw
     dataMap[using_version]["RepoData"] = micrepo.Mic_RepoData
-    dataMap[using_version]["PartData"] = partition.Mic_PartData
+    dataMap[using_version]["PartData"] = partition.Wic_PartData
     superclass = ksversion.returnClassForVersion(version=using_version)
 
     class KSHandlers(superclass):
diff --git a/scripts/lib/mic/kickstart/custom_commands/__init__.py b/scripts/lib/mic/kickstart/custom_commands/__init__.py
index 5f4c440..6aed0ff 100644
--- a/scripts/lib/mic/kickstart/custom_commands/__init__.py
+++ b/scripts/lib/mic/kickstart/custom_commands/__init__.py
@@ -1,12 +1,17 @@
 from desktop import Mic_Desktop
 from micrepo import Mic_Repo, Mic_RepoData
-from partition import Mic_Partition
+from micpartition import Mic_Partition
+from micpartition import Mic_PartData
 from installerfw import Mic_installerfw
+from partition import Wic_Partition
 
 __all__ = (
     "Mic_Desktop",
     "Mic_Repo",
     "Mic_RepoData",
     "Mic_Partition",
+    "Mic_PartData",
     "Mic_installerfw",
+    "Wic_Partition",
+    "Wic_PartData",
 )
diff --git a/scripts/lib/mic/kickstart/custom_commands/micpartition.py b/scripts/lib/mic/kickstart/custom_commands/micpartition.py
new file mode 100644
index 0000000..59a87fb
--- /dev/null
+++ b/scripts/lib/mic/kickstart/custom_commands/micpartition.py
@@ -0,0 +1,57 @@
+#!/usr/bin/python -tt
+#
+# Marko Saukko <marko.saukko@cybercom.com>
+#
+# Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
+#
+# This copyrighted material is made available to anyone wishing to use, modify,
+# copy, or redistribute it subject to the terms and conditions of the GNU
+# General Public License v.2. This program is distributed in the hope that it
+# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
+# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+# See the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along with
+# this program; if not, write to the Free Software Foundation, Inc., 51
+# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+
+from pykickstart.commands.partition import *
+
+class Mic_PartData(FC4_PartData):
+    removedKeywords = FC4_PartData.removedKeywords
+    removedAttrs = FC4_PartData.removedAttrs
+
+    def __init__(self, *args, **kwargs):
+        FC4_PartData.__init__(self, *args, **kwargs)
+        self.deleteRemovedAttrs()
+        self.align = kwargs.get("align", None)
+        self.extopts = kwargs.get("extopts", None)
+        self.part_type = kwargs.get("part_type", None)
+
+    def _getArgsAsStr(self):
+        retval = FC4_PartData._getArgsAsStr(self)
+
+        if self.align:
+            retval += " --align"
+        if self.extopts:
+            retval += " --extoptions=%s" % self.extopts
+        if self.part_type:
+            retval += " --part-type=%s" % self.part_type
+
+        return retval
+
+class Mic_Partition(FC4_Partition):
+    removedKeywords = FC4_Partition.removedKeywords
+    removedAttrs = FC4_Partition.removedAttrs
+
+    def _getParser(self):
+        op = FC4_Partition._getParser(self)
+        # The alignment value is given in kBytes. e.g., value 8 means that
+        # the partition is aligned to start from 8096 byte boundary.
+        op.add_option("--align", type="int", action="store", dest="align",
+                      default=None)
+        op.add_option("--extoptions", type="string", action="store", dest="extopts",
+                      default=None)
+        op.add_option("--part-type", type="string", action="store", dest="part_type",
+                      default=None)
+        return op
diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 59a87fb..302cace 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -1,57 +1,370 @@
-#!/usr/bin/python -tt
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-# Marko Saukko <marko.saukko@cybercom.com>
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
 #
-# Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
 #
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2. This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This module provides the OpenEmbedded partition object definitions.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+
+import shutil
 
 from pykickstart.commands.partition import *
+from mic.utils.oe.misc import *
+
+from mic.kickstart.custom_commands import *
 
-class Mic_PartData(FC4_PartData):
-    removedKeywords = FC4_PartData.removedKeywords
-    removedAttrs = FC4_PartData.removedAttrs
+BOOTDD_EXTRA_SPACE = 16384
+
+class Wic_PartData(Mic_PartData):
+    removedKeywords = Mic_PartData.removedKeywords
+    removedAttrs = Mic_PartData.removedAttrs
 
     def __init__(self, *args, **kwargs):
-        FC4_PartData.__init__(self, *args, **kwargs)
+        Mic_PartData.__init__(self, *args, **kwargs)
         self.deleteRemovedAttrs()
-        self.align = kwargs.get("align", None)
-        self.extopts = kwargs.get("extopts", None)
-        self.part_type = kwargs.get("part_type", None)
+        self.source = kwargs.get("source", None)
+        self.source_file = ""
+        self.size = 0
 
     def _getArgsAsStr(self):
-        retval = FC4_PartData._getArgsAsStr(self)
+        retval = Mic_PartData._getArgsAsStr(self)
 
-        if self.align:
-            retval += " --align"
-        if self.extopts:
-            retval += " --extoptions=%s" % self.extopts
-        if self.part_type:
-            retval += " --part-type=%s" % self.part_type
+        if self.source:
+            retval += " --source=%s" % self.source
 
         return retval
 
-class Mic_Partition(FC4_Partition):
-    removedKeywords = FC4_Partition.removedKeywords
-    removedAttrs = FC4_Partition.removedAttrs
+    def prepare(self, cr_workdir, oe_builddir, boot_type, rootfs_dir,
+                bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Prepare content for individual partitions, depending on
+        partition command parameters.
+        """
+        if not self.source:
+            if self.fstype and self.fstype == "swap":
+                self.prepare_swap_partition(cr_workdir, oe_builddir,
+                                            native_sysroot)
+            elif self.fstype:
+                self.prepare_empty_partition(cr_workdir, oe_builddir,
+                                             native_sysroot)
+            return
+
+        if self.source == "bootimg" and boot_type == "pcbios":
+            self.prepare_bootimg_pcbios(cr_workdir, oe_builddir, bootimg_dir,
+                                        kernel_dir, native_sysroot)
+        elif self.source == "bootimg" and boot_type == "efi":
+            self.prepare_bootimg_efi(cr_workdir, oe_builddir, bootimg_dir,
+                                     kernel_dir, native_sysroot)
+        elif self.source.startswith("rootfs"):
+            self.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir,
+                                native_sysroot)
+
+    def prepare_bootimg_pcbios(self, cr_workdir, oe_builddir, bootimg_dir,
+                               kernel_dir, native_sysroot):
+        """
+        Prepare content for a legacy bios boot partition.
+        """
+        staging_kernel_dir = kernel_dir
+        staging_data_dir = bootimg_dir
+
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        install_cmd = "install -m 0644 %s/bzImage %s/vmlinuz" \
+            % (staging_kernel_dir, hdddir)
+        tmp = exec_cmd(install_cmd)
+
+        install_cmd = "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" \
+            % (staging_data_dir, hdddir)
+        tmp = exec_cmd(install_cmd)
+
+        du_cmd = "du -bks %s" % hdddir
+        rc, out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        blocks += BOOTDD_EXTRA_SPACE
+
+        # Ensure total sectors is an integral number of sectors per
+        # track or mcopy will complain. Sectors are 512 bytes, and we
+        # generate images with 32 sectors per track. This calculation is
+        # done in blocks, thus the mod by 16 instead of 32.
+        blocks += (16 - (blocks % 16))
+
+        # dosfs image, created by mkdosfs
+        bootimg = "%s/boot.img" % cr_workdir
+
+        dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (bootimg, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
+        syslinux_cmd = "syslinux %s" % bootimg
+        exec_native_cmd(syslinux_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % bootimg
+        exec_cmd(chmod_cmd)
+
+        du_cmd = "du -Lbms %s" % bootimg
+        rc, out = exec_cmd(du_cmd)
+        bootimg_size = out.split()[0]
+
+        self.size = bootimg_size
+        self.source_file = bootimg
+
+    def prepare_bootimg_efi(self, cr_workdir, oe_builddir, bootimg_dir,
+                            kernel_dir, native_sysroot):
+        """
+        Prepare content for an EFI (grub) boot partition.
+        """
+        staging_kernel_dir = kernel_dir
+        staging_data_dir = bootimg_dir
+
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        install_cmd = "install -m 0644 %s/bzImage %s/vmlinuz" % \
+            (staging_kernel_dir, hdddir)
+        tmp = exec_cmd(install_cmd)
+
+        shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
+                        "%s/grub.cfg" % cr_workdir)
+
+        cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (staging_data_dir, hdddir)
+        exec_cmd(cp_cmd, True)
+
+        shutil.move("%s/grub.cfg" % cr_workdir,
+                    "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
+
+        du_cmd = "du -bks %s" % hdddir
+        rc, out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        blocks += BOOTDD_EXTRA_SPACE
+
+        # Ensure total sectors is an integral number of sectors per
+        # track or mcopy will complain. Sectors are 512 bytes, and we
+        # generate images with 32 sectors per track. This calculation is
+        # done in blocks, thus the mod by 16 instead of 32.
+        blocks += (16 - (blocks % 16))
+
+        # dosfs image, created by mkdosfs
+        bootimg = "%s/boot.img" % cr_workdir
+
+        dosfs_cmd = "mkdosfs -n efi -C %s %d" % (bootimg, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % bootimg
+        exec_cmd(chmod_cmd)
+
+        du_cmd = "du -Lbms %s" % bootimg
+        rc, out = exec_cmd(du_cmd)
+        bootimg_size = out.split()[0]
+
+        self.size = bootimg_size
+        self.source_file = bootimg
+
+    def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
+                                     rootfs_dir):
+        """
+        Handle an already-created partition e.g. xxx.ext3
+        """
+        rootfs = oe_builddir
+        du_cmd = "du -Lbms %s" % rootfs
+        rc, out = exec_cmd(du_cmd)
+        rootfs_size = out.split()[0]
+
+        self.size = rootfs_size
+        self.source_file = rootfs
+
+    def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
+                       native_sysroot):
+        """
+        Prepare content for a rootfs partition i.e. create a partition
+        and fill it from a /rootfs dir.
+
+        Currently handles ext2/3/4 and btrfs.
+        """
+        if self.fstype.startswith("ext"):
+            return self.prepare_rootfs_ext(cr_workdir, oe_builddir,
+                                           rootfs_dir, native_sysroot)
+        elif self.fstype.startswith("btrfs"):
+            return self.prepare_rootfs_btrfs(cr_workdir, oe_builddir,
+                                             rootfs_dir, native_sysroot)
+
+    def prepare_rootfs_ext(self, cr_workdir, oe_builddir, rootfs_dir,
+                           native_sysroot):
+        """
+        Prepare content for an ext2/3/4 rootfs partition.
+        """
+        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
+        image_extra_space = 10240
+
+        image_rootfs = rootfs_dir
+        rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
+
+        du_cmd = "du -ks %s" % image_rootfs
+        rc, out = exec_cmd(du_cmd)
+        actual_rootfs_size = out.split()[0]
+
+        rootfs_size = int(actual_rootfs_size) + image_extra_space
+
+        dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=0 bs=1k" % \
+            (rootfs, rootfs_size)
+        rc, out = exec_cmd(dd_cmd)
+
+        extra_imagecmd = "-i 8192"
+
+        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, rootfs)
+        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+
+        populate_cmd = populate_script + " " + image_rootfs + " " + rootfs
+        rc, out = exec_native_cmd(populate_cmd, native_sysroot)
+
+        # get the rootfs size in the right units for kickstart (Mb)
+        du_cmd = "du -Lbms %s" % rootfs
+        rc, out = exec_cmd(du_cmd)
+        rootfs_size = out.split()[0]
+
+        self.size = rootfs_size
+        self.source_file = rootfs
+
+        return 0
+
+    def prepare_rootfs_btrfs(self, cr_workdir, oe_builddir, rootfs_dir,
+                             native_sysroot):
+        """
+        Prepare content for a btrfs rootfs partition.
+
+        Currently handles ext2/3/4 and btrfs.
+        """
+        image_extra_space = 10240
+
+        image_rootfs = rootfs_dir
+        rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
+
+        du_cmd = "du -ks %s" % image_rootfs
+        rc, out = exec_cmd(du_cmd)
+        actual_rootfs_size = out.split()[0]
+
+        rootfs_size = int(actual_rootfs_size) + image_extra_space
+
+        dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=0 bs=1k" % \
+            (rootfs, rootfs_size)
+        rc, out = exec_cmd(dd_cmd)
+
+        mkfs_cmd = "mkfs.%s -b %d -r %s %s" % \
+            (self.fstype, rootfs_size * 1024, image_rootfs, rootfs)
+        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+
+        # get the rootfs size in the right units for kickstart (Mb)
+        du_cmd = "du -Lbms %s" % rootfs
+        rc, out = exec_cmd(du_cmd)
+        rootfs_size = out.split()[0]
+
+        self.size = rootfs_size
+        self.source_file = rootfs
+
+    def prepare_empty_partition(self, cr_workdir, oe_builddir, native_sysroot):
+        """
+        Prepare an empty partition.
+        """
+        if self.fstype.startswith("ext"):
+            return self.prepare_empty_partition_ext(cr_workdir, oe_builddir,
+                                                    native_sysroot)
+        elif self.fstype.startswith("btrfs"):
+            return self.prepare_empty_partition_btrfs(cr_workdir, oe_builddir,
+                                                      native_sysroot)
+
+    def prepare_empty_partition_ext(self, cr_workdir, oe_builddir,
+                                    native_sysroot):
+        """
+        Prepare an empty ext2/3/4 partition.
+        """
+        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
+
+        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
+            (fs, self.size)
+        rc, out = exec_cmd(dd_cmd)
+
+        extra_imagecmd = "-i 8192"
+
+        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
+        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+
+        self.source_file = fs
+
+        return 0
+
+    def prepare_empty_partition_btrfs(self, cr_workdir, oe_builddir,
+                                      native_sysroot):
+        """
+        Prepare an empty btrfs partition.
+        """
+        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
+
+        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
+            (fs, self.size)
+        rc, out = exec_cmd(dd_cmd)
+
+        mkfs_cmd = "mkfs.%s -b %d %s" % (self.fstype, self.size * 1024, rootfs)
+        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+
+        mkfs_cmd = "mkfs.%s -F %s %s" % (self.fstype, extra_imagecmd, fs)
+        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+
+        self.source_file = fs
+
+        return 0
+
+    def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
+        """
+        Prepare a swap partition.
+        """
+        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
+
+        dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
+            (fs, self.size)
+        rc, out = exec_cmd(dd_cmd)
+
+        import uuid
+        label_str = ""
+        if self.label:
+            label_str = "-L %s" % self.label
+        mkswap_cmd = "mkswap %s -U %s %s" % (label_str, str(uuid.uuid1()), fs)
+        rc, out = exec_native_cmd(mkswap_cmd, native_sysroot)
+
+        self.source_file = fs
+
+        return 0
+
+class Wic_Partition(Mic_Partition):
+    removedKeywords = Mic_Partition.removedKeywords
+    removedAttrs = Mic_Partition.removedAttrs
 
     def _getParser(self):
-        op = FC4_Partition._getParser(self)
-        # The alignment value is given in kBytes. e.g., value 8 means that
-        # the partition is aligned to start from 8096 byte boundary.
-        op.add_option("--align", type="int", action="store", dest="align",
-                      default=None)
-        op.add_option("--extoptions", type="string", action="store", dest="extopts",
-                      default=None)
-        op.add_option("--part-type", type="string", action="store", dest="part_type",
-                      default=None)
+        op = Mic_Partition._getParser(self)
+        # use specified source file to fill the partition
+        # and calculate partition size
+        op.add_option("--source", type="string", action="store",
+                      dest="source", default=None)
         return op
diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/mic/plugin.py
index 18c93ad..7c296e9 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/mic/plugin.py
@@ -40,7 +40,11 @@ class PluginMgr(object):
         return cls._instance
 
     def __init__(self):
-        self.plugin_dir = configmgr.common['plugin_dir']
+        mic_path = os.path.dirname(__file__)
+        eos = mic_path.find('scripts') + len('scripts')
+        scripts_path = mic_path[:eos]
+
+        self.plugin_dir = scripts_path + "/lib/mic/plugins"
 
     def append_dirs(self, dirs):
         for path in dirs:
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
new file mode 100644
index 0000000..53381e5
--- /dev/null
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -0,0 +1,92 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'direct' imager plugin class for 'wic', based
+# loosely on the raw imager plugin from 'mic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import os
+import shutil
+import re
+import tempfile
+
+from mic import chroot, msger, rt_util
+from mic.utils import misc, fs_related, errors, runner, cmdln
+from mic.conf import configmgr
+from mic.plugin import pluginmgr
+from mic.utils.partitionedfs import PartitionedMount
+
+import mic.imager.direct as direct
+from mic.pluginbase import ImagerPlugin
+
+class DirectPlugin(ImagerPlugin):
+    name = 'direct'
+
+    @classmethod
+    def do_create(self, subcmd, opts, *args):
+        """
+        Create direct image, called from creator as 'direct' cmd
+        """
+        if len(args) != 9:
+            raise errors.Usage("Extra arguments given")
+
+        staging_data_dir = args[0]
+        hdddir = args[1]
+        native_sysroot = args[2]
+        kernel_dir = args[3]
+        bootimg_dir = args[4]
+        rootfs_dir = args[5]
+
+        creatoropts = configmgr.create
+        ksconf = args[6]
+
+        image_output_dir = args[7]
+        oe_builddir = args[8]
+
+        configmgr._ksconf = ksconf
+
+        creator = direct.DirectImageCreator(oe_builddir,
+                                            image_output_dir,
+                                            rootfs_dir,
+                                            bootimg_dir,
+                                            kernel_dir,
+                                            native_sysroot,
+                                            hdddir,
+                                            staging_data_dir,
+                                            creatoropts,
+                                            None,
+                                            None,
+                                            None)
+
+        try:
+            creator.mount(None, creatoropts["cachedir"])
+            creator.install()
+            creator.configure(creatoropts["repomd"])
+            creator.print_outimage_info()
+
+        except errors.CreatorError:
+            raise
+        finally:
+            creator.cleanup()
+
+        return 0
diff --git a/scripts/lib/mic/utils/fs_related.py b/scripts/lib/mic/utils/fs_related.py
index b9b9a97..6161735 100644
--- a/scripts/lib/mic/utils/fs_related.py
+++ b/scripts/lib/mic/utils/fs_related.py
@@ -29,7 +29,7 @@ import uuid
 from mic import msger
 from mic.utils import runner
 from mic.utils.errors import *
-
+from mic.utils.oe.misc import *
 
 def find_binary_inchroot(binary, chroot):
     paths = ["/usr/sbin",
@@ -280,6 +280,34 @@ class RawDisk(Disk):
     def exists(self):
         return True
 
+
+class DiskImage(Disk):
+    """
+    A Disk backed by a file.
+    """
+    def __init__(self, image_file, size):
+        Disk.__init__(self, size)
+        self.image_file = image_file
+
+    def exists(self):
+        return os.path.exists(self.image_file)
+
+    def create(self):
+        if self.device is not None:
+            return
+
+        blocks = self.size / 1024
+        if self.size - blocks * 1024:
+            blocks += 1
+
+        # create disk image
+        dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=1" % \
+            (self.image_file, blocks)
+        rc, out = exec_cmd(dd_cmd)
+
+        self.device = self.image_file
+
+
 class LoopbackDisk(Disk):
     """A Disk backed by a file via the loop module."""
     def __init__(self, lofile, size):
diff --git a/scripts/lib/mic/utils/misc.py b/scripts/lib/mic/utils/misc.py
index 6302434..67ddef2 100644
--- a/scripts/lib/mic/utils/misc.py
+++ b/scripts/lib/mic/utils/misc.py
@@ -512,8 +512,8 @@ def uncompress_squashfs(squashfsimg, outdir):
     if (rc != 0):
         raise SquashfsError("Failed to uncompress %s." % squashfsimg)
 
-def mkdtemp(dir = "/var/tmp", prefix = "mic-tmp-"):
-    """ FIXME: use the dir in mic.conf instead """
+def mkdtemp(dir = "/var/tmp", prefix = "wic-tmp-"):
+    """ FIXME: use the dir in wic.conf instead """
 
     makedirs(dir)
     return tempfile.mkdtemp(dir = dir, prefix = prefix)
diff --git a/scripts/lib/mic/utils/oe/__init__.py b/scripts/lib/mic/utils/oe/__init__.py
new file mode 100644
index 0000000..d10e802
--- /dev/null
+++ b/scripts/lib/mic/utils/oe/__init__.py
@@ -0,0 +1,22 @@
+#
+# OpenEmbedded mic utils library
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
new file mode 100644
index 0000000..9edaa23
--- /dev/null
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -0,0 +1,108 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This module provides a place to collect various mic-related utils
+# for the OpenEmbedded Image Tools.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+from mic import msger
+from mic.utils import runner
+
+def exec_cmd(cmd_and_args, as_shell = False, catch = 3):
+    """
+    Execute command, catching stderr, stdout
+
+    Need to execute as_shell if the command uses wildcards
+    """
+    msger.debug("exec_cmd: %s" % cmd_and_args)
+    args = cmd_and_args.split()
+    msger.debug(args)
+
+    if (as_shell):
+        rc, out = runner.runtool(cmd_and_args, catch)
+    else:
+        rc, out = runner.runtool(args, catch)
+    out = out.strip()
+    msger.debug("exec_cmd: output for %s (rc = %d): %s" % \
+                    (cmd_and_args, rc, out))
+
+    if rc != 0:
+        # We don't throw exception when return code is not 0, because
+        # parted always fails to reload part table with loop devices. This
+        # prevents us from distinguishing real errors based on return
+        # code.
+        msger.debug("WARNING: %s returned '%s' instead of 0" % (args[0], rc))
+
+    return (rc, out)
+
+
+def exec_cmd_quiet(cmd_and_args, as_shell = False):
+    """
+    Execute command, catching nothing in the output
+
+    Need to execute as_shell if the command uses wildcards
+    """
+    return exec_cmd(cmd_and_args, as_shell, 0)
+
+
+def exec_native_cmd(cmd_and_args, native_sysroot, catch = 3):
+    """
+    Execute native command, catching stderr, stdout
+
+    Need to execute as_shell if the command uses wildcards
+
+    Always need to execute native commands as_shell
+    """
+    native_paths = \
+        "export PATH=%s/sbin:PATH=%s/usr/sbin:PATH=%s/usr/bin:$PATH" % \
+        (native_sysroot, native_sysroot, native_sysroot)
+    native_cmd_and_args = "%s;%s" % (native_paths, cmd_and_args)
+    msger.debug("exec_native_cmd: %s" % cmd_and_args)
+
+    args = cmd_and_args.split()
+    msger.debug(args)
+
+    return exec_cmd(native_cmd_and_args, True, catch)
+
+
+def exec_native_cmd_quiet(cmd_and_args, native_sysroot):
+    """
+    Execute native command, catching nothing in the output
+
+    Need to execute as_shell if the command uses wildcards
+
+    Always need to execute native commands as_shell
+    """
+    return exec_native_cmd(cmd_and_args, native_sysroot, 0)
+
+
+# kickstart doesn't support variable substution in commands, so this
+# is our current simplistic scheme for supporting that
+
+wks_vars = dict()
+
+def get_wks_var(key):
+    return wks_vars[key]
+
+def add_wks_var(key, val):
+    wks_vars[key] = val
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 0475844..e8cded2 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -25,6 +25,7 @@ from mic.utils import runner
 from mic.utils.errors import MountError
 from mic.utils.fs_related import *
 from mic.utils.gpt_parser import GptParser
+from mic.utils.oe.misc import *
 
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
@@ -93,7 +94,7 @@ class PartitionedMount(Mount):
         self.partitions.append(part)
         self.__add_disk(part['disk_name'])
 
-    def add_partition(self, size, disk_name, mountpoint, fstype = None,
+    def add_partition(self, size, disk_name, mountpoint, source_file = None, fstype = None,
                       label=None, fsopts = None, boot = False, align = None,
                       part_type = None):
         """ Add the next partition. Prtitions have to be added in the
@@ -141,6 +142,7 @@ class PartitionedMount(Mount):
             part = { 'ks_pnum' : ks_pnum, # Partition number in the KS file
                      'size': size, # In sectors
                      'mountpoint': mountpoint, # Mount relative to chroot
+                     'source_file': source_file, # partition contents
                      'fstype': fstype, # Filesystem type
                      'fsopts': fsopts, # Filesystem mount options
                      'label': label, # Partition label
@@ -723,67 +725,51 @@ class PartitionedMount(Mount):
 
         self.snapshot_created = True
 
+    def __install_partition(self, num, source_file, start, size):
+        """
+        Install source_file contents into a partition.
+        """
+        if not source_file: # nothing to install
+            return
+
+        # Start is included in the size so need to substract one from the end.
+        end = start + size - 1
+        msger.debug("Installed %s in partition %d, sectors %d-%d, size %d sectors" % (source_file, num, start, end, size))
+
+        dd_cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
+            (source_file, self.image_file, self.sector_size, start, size)
+        rc, out = exec_cmd(dd_cmd)
+
+
+    def install(self, image_file):
+        msger.debug("Installing partitions")
+
+        self.image_file = image_file
+
+        for p in self.partitions:
+            d = self.disks[p['disk_name']]
+            if d['ptable_format'] == "msdos" and p['num'] == 5:
+                # The last sector of the 3rd partition was reserved for the EBR
+                # of the first _logical_ partition. This is why the extended
+                # partition should start one sector before the first logical
+                # partition.
+                self.__install_partition(p['num'], p['source_file'],
+                                         p['start'] - 1,
+                                         d['offset'] - p['start'])
+
+            self.__install_partition(p['num'], p['source_file'],
+                                     p['start'], p['size'])
+
     def mount(self):
         for dev in self.disks.keys():
             d = self.disks[dev]
             d['disk'].create()
 
         self.__format_disks()
-        self.__map_partitions()
-        self.__calculate_mountorder()
 
-        for mp in self.mountOrder:
-            p = None
-            for p1 in self.partitions:
-                if p1['mountpoint'] == mp:
-                    p = p1
-                    break
-
-            if not p['label']:
-                if p['mountpoint'] == "/":
-                    p['label'] = 'platform'
-                else:
-                    p['label'] = mp.split('/')[-1]
-
-            if mp == 'swap':
-                import uuid
-                p['uuid'] = str(uuid.uuid1())
-                runner.show([self.mkswap,
-                             '-L', p['label'],
-                             '-U', p['uuid'],
-                             p['device']])
-                continue
+        self.__calculate_mountorder()
 
-            rmmountdir = False
-            if p['mountpoint'] == "/":
-                rmmountdir = True
-            if p['fstype'] == "vfat" or p['fstype'] == "msdos":
-                myDiskMount = VfatDiskMount
-            elif p['fstype'] in ("ext2", "ext3", "ext4"):
-                myDiskMount = ExtDiskMount
-            elif p['fstype'] == "btrfs":
-                myDiskMount = BtrfsDiskMount
-            else:
-                raise MountError("Fail to support file system " + p['fstype'])
-
-            if p['fstype'] == "btrfs" and not p['fsopts']:
-                p['fsopts'] = "subvolid=0"
-
-            pdisk = myDiskMount(RawDisk(p['size'] * self.sector_size, p['device']),
-                                 self.mountdir + p['mountpoint'],
-                                 p['fstype'],
-                                 4096,
-                                 p['label'],
-                                 rmmountdir,
-                                 self.skipformat,
-                                 fsopts = p['fsopts'])
-            pdisk.mount(pdisk.fsopts)
-            if p['fstype'] == "btrfs" and p['mountpoint'] == "/":
-                if not self.skipformat:
-                    self.__create_subvolumes(p, pdisk)
-                self.__mount_subvolumes(p, pdisk)
-            p['mount'] = pdisk
-            p['uuid'] = pdisk.uuid
+        return
 
     def resparse(self, size = None):
         # Can't re-sparse a disk image - too hard
diff --git a/scripts/yocto-image.conf b/scripts/yocto-image.conf
deleted file mode 100644
index 3d41eff..0000000
--- a/scripts/yocto-image.conf
+++ /dev/null
@@ -1,35 +0,0 @@
-[common]
-; general settings
-distro_name = Tizen
-
-plugin_dir = @PREFIX@/lib/mic/plugins
-
-[create]
-; settings for create subcommand
-tmpdir= /var/tmp/mic
-cachedir= /var/tmp/mic/cache
-outdir= ./mic-output
-runtime=bootstrap
-
-pkgmgr = auto
-
-# to set global proxy for repos
-#proxy = http://proxy.yourcompany.com:8080/
-#no_proxy = localhost,127.0.0.0/8,.yourcompany.com
-
-# prefix will be added in front of generated files
-#name_prefix = output
-
-# to skip all ssl verification for repos
-#ssl_verify = no
-
-[convert]
-; settings for convert subcommand
-
-[chroot]
-; settings for chroot subcommand
-
-[bootstrap]
-rootdir=/var/tmp/mic-bootstrap
-packages=mic-bootstrap-x86-arm
-
-- 
1.7.11.4


