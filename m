Return-Path: <Adrian.Calianu@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 57DBA65D70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 08:44:49 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 12 Jun 2014 10:44:49 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4191)	id A24BF28BCE9;
	Thu, 12 Jun 2014 10:44:49 +0200 (CEST)
From: <y@enea.se>
To: <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jun 2014 10:43:59 +0200
Message-ID: <1402562639-60930-2-git-send-email-y>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402562639-60930-1-git-send-email-y>
References: <5399151E.3050306@linux.intel.com>
	<1402562639-60930-1-git-send-email-y>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: y@enea.se does not designate
	permitted sender hosts)
Subject: [PATCHv2 1/2] Add wic support to generate rootfs image for uboot
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
X-List-Received-Date: Thu, 12 Jun 2014 08:44:51 -0000
Content-Type: text/plain

From: Adrian Calianu <adrian.calianu@enea.com>

Add support in wic to build ramdisk uboot images from list of packages or
from an existing rootfs folder.

Providing the list of packages starting with XXX-core-boot package(into wks file)
will generate an rootfs image for uboot out of bitbake.
There is also possible to combine an existing/application rootfs with a list
of packages that can be installed but the user must take care to provide
a basic core boot rootfs or XXX-core-boot package and reporul(wic.conf).

Some prerequisites are required for this new build setup:
../poky/scripts/lib/image/config/wic.conf
[create]
arch=target_arch (example: powerpc, arm, x86)
pkgmgr=opkg
repourl=http://example.distro/p2020rdb/ipk/all http://example.distro/p2020rdb/ipk/p2020rdb http://example.distro/p2020rdb/ipk/ppce500v2

    1) Build an rootfs image from an existing bitbake build:
       wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -e core-image-minimal -o .../output

    2) Build an rootfs image from an existing rootfs and native_sysroot:
       wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -r .../path_to_rootfs -n .../path_to_native_sysroot -o .../output

    3) Build an rootfs image only from a package list (on wks file):

       Add the package list to be installed as rootfs on ../poky/scripts/lib/image/canned-wks/uboot.wks:
       %packages
       packagegroup-core-boot
       pramfs-init
       run-postinsts
       packagegroup-core-ssh-dropbear
       %end

       Generate rootfs image:
       wic create ../poky/scripts/lib/image/canned-wks/uboot.wks  -n .../path_to_native_sysroot -o .../output

Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
---
 scripts/lib/image/canned-wks/uboot.wks             |   17 +
 scripts/lib/image/config/wic.conf                  |    4 +
 scripts/lib/mic/imager/direct.py                   |    4 +
 .../lib/mic/kickstart/custom_commands/partition.py |  128 ++++
 scripts/lib/mic/pluginbase.py                      |    9 +
 scripts/lib/mic/plugins/source/uboot.py            |  173 +++++
 scripts/lib/mic/utils/oe/package_manager.py        |  810 ++++++++++++++++++++
 scripts/wic                                        |   88 ++-
 10 files changed, 1219 insertions(+), 32 deletions(-)
 create mode 100644 scripts/lib/image/canned-wks/uboot.wks
 create mode 100644 scripts/lib/mic/plugins/source/uboot.py
 create mode 100644 scripts/lib/mic/utils/oe/package_manager.py

diff --git a/scripts/lib/image/canned-wks/uboot.wks b/scripts/lib/image/canned-wks/uboot.wks
new file mode 100644
index 0000000..7de0572
--- /dev/null
+++ b/scripts/lib/image/canned-wks/uboot.wks
@@ -0,0 +1,17 @@
+# short-description: .       Create a ramdisk image for U-Boot
+# long-description: Creates a ramdisk image for U-Boot that user
+# can directly load it into ram through tftp
+#
+# part - is a wic command that drive the process of generating a valid file system
+#      - --source=uboot : wic plugin that generates a ramdisk image for U-Boot
+#      - --fstype=ext2  : file system type( ext2 / ext3 / ext 4)
+#
+# %packages %end - option to provide a list of packages that will be installed
+#                  into rootfs. All packages dependencies will be installed by
+#                  package manager(default opkg).
+
+
+part / --source=uboot --fstype=ext2 --label imageName  --align 1024
+
+%packages
+%end
diff --git a/scripts/lib/image/config/wic.conf b/scripts/lib/image/config/wic.conf
index e96d6ae..2a2750b 100644
--- a/scripts/lib/image/config/wic.conf
+++ b/scripts/lib/image/config/wic.conf
@@ -4,4 +4,8 @@ distro_name = OpenEmbedded
 
 [create]
 ; settings for create subcommand
+; repourl=http://linux.com/ipk/all http://linux.com/ipk/target http://linux.com/ipk/arch
+arch=powerpc
+pkgmgr=opkg
 runtime=native
+install_pkgs=source
diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 2cf4c8d..fef9d0e 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -262,6 +262,10 @@ class DirectImageCreator(BaseImageCreator):
             # when/if we need to actually do package selection we
             # should modify things to use those objects, but for now
             # we can avoid that.
+
+            p.install_pkgs(self, self.workdir, self.oe_builddir, self.rootfs_dir,
+                           self.bootimg_dir, self.kernel_dir, self.native_sysroot)
+
             p.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
                       self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 6b575c0..450d2d4 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -31,7 +31,11 @@ from mic.utils.oe.misc import *
 from mic.kickstart.custom_commands import *
 from mic.plugin import pluginmgr
 
+import os
+from mic.utils.oe.package_manager import *
+
 partition_methods = {
+    "do_install_pkgs":None,
     "do_stage_partition":None,
     "do_prepare_partition":None,
     "do_configure_partition":None,
@@ -115,6 +119,102 @@ class Wic_PartData(Mic_PartData):
         else:
             return 0
 
+    def install_pkgs(self, creator, cr_workdir, oe_builddir, rootfs_dir,
+                     bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Prepare content for individual partitions, installing packages.
+        """
+
+        if not self.source:
+            return
+
+        self._source_methods = pluginmgr.get_source_plugin_methods(self.source, partition_methods)
+        self._source_methods["do_install_pkgs"](self, creator,
+                                                      cr_workdir,
+                                                      oe_builddir,
+                                                      rootfs_dir,
+                                                      bootimg_dir,
+                                                      kernel_dir,
+                                                      native_sysroot)
+
+    def install_pkgs_ipk(self, cr_workdir, oe_builddir, rootfs_dir,
+                             native_sysroot, packages, repourl):
+        """
+        Install packages specified into wks file using opkg package manager.
+        This method is dependend on bb module.
+        """
+
+        gVar = {}
+        gVar["DEPLOY_DIR_IPK"] = os.path.join(oe_builddir, "tmp/deploy/ipk")
+
+        # Run postinstall scripts even in offline mode
+        # Use the arch priority package rather than higher version one if more than one candidate is found.
+        #d.setVar("OPKG_ARGS", "--force_postinstall --prefer-arch-to-version")
+        gVar["OPKG_ARGS"] = "--force_postinstall"
+
+        # OPKG path relative to /output_path
+        gVar["OPKGLIBDIR"] = "var/lib"
+
+        source_url = repourl.split()
+
+        # Generate feed uri's names, it doesn't seem to matter what name they have
+        feed_uris = ""
+        cnt = 0
+        archs = ""
+        for url in source_url:
+            feed_uris += "cl_def_feed%d##%s\n" % (cnt, url)
+            cnt += 1
+            head, tail = os.path.split(url)
+            archs += " " + tail
+
+        # IPK_FEED_URIS with special formating defines the URI's used as source for packages
+        gVar['IPK_FEED_URIS'] = feed_uris
+
+        gVar['BUILD_IMAGES_FROM_FEEDS'] = "1"
+
+        # We need to provide sysroot for utilities
+        gVar['STAGING_DIR_NATIVE'] = native_sysroot
+
+        # Set WORKDIR for output
+        gVar['WORKDIR'] = cr_workdir
+
+        # Set TMPDIR for output
+        gVar['TMPDIR'] = os.path.join(cr_workdir, "tmp")
+
+        if 'ROOTFS_DIR' in rootfs_dir:
+            target_dir = rootfs_dir['ROOTFS_DIR']
+        elif os.path.isdir(rootfs_dir):
+            target_dir = rootfs_dir
+        else:
+            msg = "Couldn't find --rootfs-dir=%s connection"
+            msg += " or it is not a valid path, exiting"
+            msger.error(msg % rootfs_dir)
+
+        # Need native sysroot /usr/bin/ for opkg-cl
+        # chnage PATH var to avoid issues with host tools
+        defpath = os.environ['PATH']
+        os.environ['PATH'] = native_sysroot + "/usr/bin/" + ":/bin:/usr/bin:"
+
+        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
+        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % target_dir
+        pseudo += "export PSEUDO_PASSWD=%s;" % target_dir
+        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+        pseudo += "%s/usr/bin/pseudo " % native_sysroot
+
+        pm = WicOpkgPM(gVar,
+                    target_dir,
+                    'opkg.conf',
+                    archs,
+                    pseudo,
+                    native_sysroot)
+
+        pm.update()
+
+        pm.install(packages)
+
+        os.environ['PATH'] += defpath + ":" + native_sysroot + "/usr/bin/"
+
+
     def prepare(self, cr, cr_workdir, oe_builddir, rootfs_dir, bootimg_dir,
                 kernel_dir, native_sysroot):
         """
@@ -225,6 +325,34 @@ class Wic_PartData(Mic_PartData):
 
         return 0
 
+    def prepare_for_uboot(self, arch, cr_workdir, oe_builddir, rootfs_dir,
+                             native_sysroot):
+        """
+        Generates u-boot image from source_file( ext2/3/4 )
+
+        """
+        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
+        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
+        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
+        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+        pseudo += "%s/usr/bin/pseudo " % native_sysroot
+
+        # 1) compress image
+        rootfs = self.source_file
+        rootfs_gzip = "%s.gz" % rootfs
+        gzip_cmd = "gzip -f -9 -c %s > %s" % (rootfs, rootfs_gzip)
+        rc, out = exec_native_cmd(pseudo + gzip_cmd, native_sysroot)
+
+        # 2) image for U-Boot
+        rootfs_uboot = "%s.u-boot" % rootfs_gzip
+        mkimage_cmd = "mkimage -A %s -O linux -T ramdisk -C gzip -n %s -d %s %s" % \
+               (arch, self.label, rootfs_gzip, rootfs_uboot)
+        rc, out = exec_native_cmd(pseudo + mkimage_cmd, native_sysroot)
+
+        msger.info("\n\n\tThe new U-Boot ramdisk image can be found here:\n\t\t%s\n\n"  % rootfs_uboot)
+
+        return 0
+
     def prepare_rootfs_btrfs(self, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/mic/pluginbase.py
index 9cf4c62..881d996 100644
--- a/scripts/lib/mic/pluginbase.py
+++ b/scripts/lib/mic/pluginbase.py
@@ -89,6 +89,15 @@ class SourcePlugin(_Plugin):
     """
 
     @classmethod
+    def do_install_pkgs(self, part, creator, cr_workdir, oe_builddir, rootfs_dir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called before partitions have been prepared and assembled into a
+        disk image. Install packages into rootfs
+        """
+        msger.debug("SourcePlugin: do_install_pkgs: part %s" % part)
+
+    @classmethod
     def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
         """
diff --git a/scripts/lib/mic/plugins/source/uboot.py b/scripts/lib/mic/plugins/source/uboot.py
new file mode 100644
index 0000000..57cb3cf
--- /dev/null
+++ b/scripts/lib/mic/plugins/source/uboot.py
@@ -0,0 +1,173 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Enea AB.
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
+# This implements the 'uboot' source plugin class for 'wic'
+#
+# AUTHORS
+# Adrian Calianu <adrian.calianu (at] enea.com>
+#
+
+import os
+import shutil
+import re
+import tempfile
+
+from mic import kickstart, chroot, msger
+from mic.utils import misc, fs_related, errors, runner, cmdln
+from mic.conf import configmgr
+from mic.plugin import pluginmgr
+from mic.utils.partitionedfs import PartitionedMount
+import mic.imager.direct as direct
+from mic.pluginbase import SourcePlugin
+from mic.utils.oe.misc import *
+from mic.imager.direct import DirectImageCreator
+
+def create_local_rootfs(part, creator, cr_workdir, krootfs_dir, native_sysroot):
+    # In order to have a full control over rootfs we will make a local copy under workdir
+    # and change rootfs_dir to new location.
+    # In this way we can install more than one ROOTFS_DIRs and/or use
+    # an empty rootfs to install packages, so a rootfs could be generated only from pkgs
+    # TBD: create workdir/rootfs ; copy rootfs-> workdir/rootfs; set rootfs=workdir/rootfs
+
+    cr_workdir = os.path.abspath(cr_workdir)
+    new_rootfs_dir = "%s/rootfs_%s" % (cr_workdir, creator.name)
+
+    rootfs_exists = 1
+    if part.rootfs is None:
+        if not 'ROOTFS_DIR' in krootfs_dir:
+            msg = "Couldn't find --rootfs-dir, exiting, "
+            msger.info(msg)
+            rootfs_exists = 0
+        rootfs_dir = krootfs_dir['ROOTFS_DIR']
+        creator.rootfs_dir['ROOTFS_DIR'] = new_rootfs_dir
+    else:
+        if part.rootfs in krootfs_dir:
+            rootfs_dir = krootfs_dir[part.rootfs]
+            creator.rootfs_dir[part.rootfs] = new_rootfs_dir
+        elif os.path.isdir(part.rootfs):
+            rootfs_dir = part.rootfs
+            part.rootfs = new_rootfs_dir
+        else:
+            msg = "Couldn't find --rootfs-dir=%s connection"
+            msg += " or it is not a valid path, exiting"
+            msger.info(msg % part.rootfs)
+            rootfs_exists = 0
+            creator.rootfs_dir['ROOTFS_DIR'] = new_rootfs_dir
+
+    pseudox = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
+    pseudox += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % new_rootfs_dir
+    pseudox += "export PSEUDO_PASSWD=%s;" % new_rootfs_dir
+    pseudox += "export PSEUDO_NOSYMLINKEXP=1;"
+    pseudox += "%s/usr/bin/pseudo " % native_sysroot
+
+    mkdir_cmd = "mkdir %s" % (new_rootfs_dir)
+    # rc, out = exec_native_cmd(pseudox + mkdir_cmd, native_sysroot)
+    rc, out = exec_cmd(mkdir_cmd, True)
+
+    if rootfs_exists == 1 and os.path.isdir(rootfs_dir):
+        defpath = os.environ['PATH']
+        os.environ['PATH'] = native_sysroot + "/usr/bin/" + ":/bin:/usr/bin:"
+
+        rootfs_dir = os.path.abspath(rootfs_dir)
+
+        pseudoc = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
+        pseudoc += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
+        pseudoc += "export PSEUDO_PASSWD=%s;" % rootfs_dir
+        pseudoc += "export PSEUDO_NOSYMLINKEXP=1;"
+        pseudoc += "%s/usr/bin/pseudo " % native_sysroot
+
+        tarc_cmd = "tar cvpf %s/rootfs.tar -C %s ." % (cr_workdir, rootfs_dir)
+        rc, out = exec_native_cmd(pseudoc + tarc_cmd, native_sysroot)
+
+        tarx_cmd = "tar xpvf %s/rootfs.tar -C %s" % (cr_workdir, new_rootfs_dir)
+        rc, out = exec_native_cmd(pseudox + tarx_cmd, native_sysroot)
+
+        rm_cmd = "rm %s/rootfs.tar" % cr_workdir
+        rc, out = exec_cmd(rm_cmd, True)
+
+        os.environ['PATH'] += defpath + ":" + native_sysroot + "/usr/bin/"
+
+    return new_rootfs_dir
+
+class UBootPlugin(SourcePlugin):
+    name = 'uboot'
+
+    @classmethod
+    def do_install_pkgs(self, part, creator, cr_workdir, oe_builddir, krootfs_dir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called before all partitions have been prepared and assembled into a
+        disk image. Intall packages based on wic configuration.
+        """
+
+        # set new rootfs_dir
+        rootfs_dir = create_local_rootfs(part, creator, cr_workdir, krootfs_dir, native_sysroot)
+
+        # wks file parsing
+        packages = kickstart.get_packages(creator.ks)
+
+        # wic.conf file parsing = found under 'creator'
+        local_pkgs_path = creator._local_pkgs_path
+        repourl = creator.repourl
+        pkgmgr = creator.pkgmgr_name
+
+        # install packages
+        if packages and pkgmgr in ["opkg"]:
+            if len(repourl) > 0 :
+                part.install_pkgs_ipk(cr_workdir, oe_builddir, rootfs_dir, native_sysroot,
+                                  packages, repourl)
+            else:
+                msger.error("No packages repository provided in wic.conf")
+
+    @classmethod
+    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
+                             kernel_dir, krootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for legacy bios boot partition.
+        """
+        if part.rootfs is None:
+            if not 'ROOTFS_DIR' in krootfs_dir:
+                msg = "Couldn't find --rootfs-dir, exiting"
+                msger.error(msg)
+            rootfs_dir = krootfs_dir['ROOTFS_DIR']
+        else:
+            if part.rootfs in krootfs_dir:
+                rootfs_dir = krootfs_dir[part.rootfs]
+            elif os.path.isdir(part.rootfs):
+                rootfs_dir = part.rootfs
+            else:
+                msg = "Couldn't find --rootfs-dir=%s connection"
+                msg += " or it is not a valid path, exiting"
+                msger.error(msg % part.rootfs)
+
+        part.set_rootfs(rootfs_dir)
+
+        # change partition label wich will reflect into the final rootfs image name
+        part.label = "%s_%s" % (part.label, cr.name)
+
+        defpath = os.environ['PATH']
+        os.environ['PATH'] = native_sysroot + "/usr/bin/" + ":/bin:/usr/bin:"
+
+        part.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir, native_sysroot)
+        part.prepare_for_uboot(cr.target_arch,cr_workdir, oe_builddir, rootfs_dir, native_sysroot)
+
+        os.environ['PATH'] += defpath + ":" + native_sysroot + "/usr/bin/"
diff --git a/scripts/lib/mic/utils/oe/package_manager.py b/scripts/lib/mic/utils/oe/package_manager.py
new file mode 100644
index 0000000..92ce98e
--- /dev/null
+++ b/scripts/lib/mic/utils/oe/package_manager.py
@@ -0,0 +1,810 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Enea AB.
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
+# This implements the opkg package manager wrapper as a combination of
+# meta/lib/oe/package_manager.py and bitbake/lib/bb/utils.py files and
+# adaptation of those files to 'wic'.
+#
+# AUTHORS
+# Adrian Calianu <adrian.calianu (at] enea.com>
+#
+# This file incorporates work covered by the following copyright and
+# permission notice:
+#
+#     meta/COPYING.GPLv2 (GPLv2)
+#     meta/COPYING.MIT (MIT)
+#
+#     Copyright (C) 2004 Michael Lauer
+#
+#     Permission to use, copy, modify, and/or distribute this software
+#     for any purpose with or without fee is hereby granted, provided
+#     that the above copyright notice and this permission notice appear
+#     in all copies.
+#
+#     THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
+#     WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
+#     WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
+#     AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
+#     CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
+#     OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
+#     NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
+#     CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+
+
+from abc import ABCMeta, abstractmethod
+import os
+import glob
+import subprocess
+import shutil
+import multiprocessing
+import re
+import errno
+import fcntl
+
+from mic.utils.oe.misc import *
+from mic import msger
+
+def mkdirhier(directory):
+    """Create a directory like 'mkdir -p', but does not complain if
+    directory already exists like os.makedirs
+    """
+
+    try:
+        os.makedirs(directory)
+    except OSError as e:
+        if e.errno != errno.EEXIST:
+            raise e
+
+def remove(path, recurse=False):
+    """Equivalent to rm -f or rm -rf"""
+    if not path:
+        return
+    if recurse:
+        # shutil.rmtree(name) would be ideal but its too slow
+        subprocess.call(['rm', '-rf'] + glob.glob(path))
+        return
+    for name in glob.glob(path):
+        try:
+            os.unlink(name)
+        except OSError as exc:
+            if exc.errno != errno.ENOENT:
+                raise
+
+def lockfile(name, shared=False, retry=True):
+    """
+    Use the file fn as a lock file, return when the lock has been acquired.
+    Returns a variable to pass to unlockfile().
+    """
+    dirname = os.path.dirname(name)
+    mkdirhier(dirname)
+
+    if not os.access(dirname, os.W_OK):
+        logger.error("Unable to acquire lock '%s', directory is not writable",
+                     name)
+        sys.exit(1)
+
+    op = fcntl.LOCK_EX
+    if shared:
+        op = fcntl.LOCK_SH
+    if not retry:
+        op = op | fcntl.LOCK_NB
+
+    while True:
+        # If we leave the lockfiles lying around there is no problem
+        # but we should clean up after ourselves. This gives potential
+        # for races though. To work around this, when we acquire the lock
+        # we check the file we locked was still the lock file on disk.
+        # by comparing inode numbers. If they don't match or the lockfile
+        # no longer exists, we start again.
+
+        # This implementation is unfair since the last person to request the
+        # lock is the most likely to win it.
+
+        try:
+            lf = open(name, 'a+')
+            fileno = lf.fileno()
+            fcntl.flock(fileno, op)
+            statinfo = os.fstat(fileno)
+            if os.path.exists(lf.name):
+                statinfo2 = os.stat(lf.name)
+                if statinfo.st_ino == statinfo2.st_ino:
+                    return lf
+            lf.close()
+        except Exception:
+            try:
+                lf.close()
+            except Exception:
+                pass
+            pass
+        if not retry:
+            return None
+
+def unlockfile(lf):
+    """
+    Unlock a file locked using lockfile()
+    """
+    try:
+        # If we had a shared lock, we need to promote to exclusive before
+        # removing the lockfile. Attempt this, ignore failures.
+        fcntl.flock(lf.fileno(), fcntl.LOCK_EX|fcntl.LOCK_NB)
+        os.unlink(lf.name)
+    except (IOError, OSError):
+        pass
+    fcntl.flock(lf.fileno(), fcntl.LOCK_UN)
+    lf.close()
+
+def which(path, item, direction = 0, history = False):
+    """
+    Locate a file in a PATH
+    """
+
+    hist = []
+    paths = (path or "").split(':')
+    if direction != 0:
+        paths.reverse()
+
+    for p in paths:
+        next = os.path.join(p, item)
+        hist.append(next)
+        if os.path.exists(next):
+            if not os.path.isabs(next):
+                next = os.path.abspath(next)
+            if history:
+                return next, hist
+            return next
+
+    if history:
+        return "", hist
+    return ""
+
+
+
+# this can be used by all PM backends to create the index files in parallel
+def wic_create_index(arg):
+    index_cmd = arg
+
+    try:
+        msger.info("Executing '%s' ..." % index_cmd)
+        subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True)
+    except subprocess.CalledProcessError as e:
+        return("Index creation command '%s' failed with return code %d:\n%s" %
+               (e.cmd, e.returncode, e.output))
+
+    return None
+
+
+class WicIndexer(object):
+    __metaclass__ = ABCMeta
+
+    def __init__(self, d, deploy_dir):
+        self.d = d
+        self.deploy_dir = deploy_dir
+
+    @abstractmethod
+    def write_index(self):
+        pass
+
+class WicOpkgIndexer(WicIndexer):
+    def write_index(self):
+        arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
+                     "SDK_PACKAGE_ARCHS",
+                     "MULTILIB_ARCHS"]
+
+        opkg_index_cmd = which(os.getenv('PATH'), "opkg-make-index")
+
+        if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
+            open(os.path.join(self.deploy_dir, "Packages"), "w").close()
+
+        index_cmds = []
+        for arch_var in arch_vars:
+            if self.d.has_key(arch_var):
+                archs = self.d[arch_var]
+            else:
+                archs = None
+
+            if archs is None:
+                continue
+
+            for arch in archs.split():
+                pkgs_dir = os.path.join(self.deploy_dir, arch)
+                pkgs_file = os.path.join(pkgs_dir, "Packages")
+
+                if not os.path.isdir(pkgs_dir):
+                    continue
+
+                if not os.path.exists(pkgs_file):
+                    open(pkgs_file, "w").close()
+
+                index_cmds.append('%s -r %s -p %s -m %s' %
+                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
+
+        if len(index_cmds) == 0:
+            msger.info("There are no packages in %s!" % self.deploy_dir)
+            return
+
+        nproc = multiprocessing.cpu_count()
+        pool = multiprocessing.Pool(nproc)
+        results = list(pool.imap(wic_create_index, index_cmds))
+        pool.close()
+        pool.join()
+
+        for result in results:
+            if result is not None:
+                return(result)
+
+class WicPkgsList(object):
+    __metaclass__ = ABCMeta
+
+    def __init__(self, d, rootfs_dir):
+        self.d = d
+        self.rootfs_dir = rootfs_dir
+
+    @abstractmethod
+    def list(self, format=None):
+        pass
+
+
+class WicOpkgPkgsList(WicPkgsList):
+    def __init__(self, d, rootfs_dir, config_file):
+        super(WicOpkgPkgsList, self).__init__(d, rootfs_dir)
+
+        self.opkg_cmd = which(os.getenv('PATH'), "opkg-cl")
+        self.opkg_args = "-f %s -o %s " % (config_file, rootfs_dir)
+        if self.d.has_key("OPKG_ARGS"):
+            self.opkg_args += self.d["OPKG_ARGS"]
+
+    def list(self, format=None):
+        opkg_query_cmd = which(os.getenv('PATH'), "opkg-query-helper.py")
+
+        if format == "arch":
+            cmd = "%s %s status | %s -a" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        elif format == "file":
+            cmd = "%s %s status | %s -f" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        elif format == "ver":
+            cmd = "%s %s status | %s -v" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        elif format == "deps":
+            cmd = "%s %s status | %s" % \
+                (self.opkg_cmd, self.opkg_args, opkg_query_cmd)
+        else:
+            cmd = "%s %s list_installed | cut -d' ' -f1" % \
+                (self.opkg_cmd, self.opkg_args)
+
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).strip()
+        except subprocess.CalledProcessError as e:
+            msger.error("Cannot get the installed packages list. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        if output and format == "file":
+            tmp_output = ""
+            for line in output.split('\n'):
+                pkg, pkg_file, pkg_arch = line.split()
+                full_path = os.path.join(self.rootfs_dir, pkg_arch, pkg_file)
+                if os.path.exists(full_path):
+                    tmp_output += "%s %s %s\n" % (pkg, full_path, pkg_arch)
+                else:
+                    tmp_output += "%s %s %s\n" % (pkg, pkg_file, pkg_arch)
+
+            output = tmp_output
+
+        return output
+
+
+class WicPackageManager(object):
+    """
+    This is an abstract class. Do not instantiate this directly.
+    """
+    __metaclass__ = ABCMeta
+
+    def __init__(self, d, pseudo, native_sysroot):
+        self.d = d
+        self.deploy_dir = None
+        self.deploy_lock = None
+        if self.d.has_key('PACKAGE_FEED_URIS'):
+            self.feed_uris = self.d['PACKAGE_FEED_URIS']
+        else:
+            self.feed_uris = ""
+        self.pseudo = pseudo
+        self.native_sysroot = native_sysroot
+
+    """
+    Update the package manager package database.
+    """
+    @abstractmethod
+    def update(self):
+        pass
+
+    """
+    Install a list of packages. 'pkgs' is a list object. If 'attempt_only' is
+    True, installation failures are ignored.
+    """
+    @abstractmethod
+    def install(self, pkgs, attempt_only=False):
+        pass
+
+    """
+    Remove a list of packages. 'pkgs' is a list object. If 'with_dependencies'
+    is False, the any dependencies are left in place.
+    """
+    @abstractmethod
+    def remove(self, pkgs, with_dependencies=True):
+        pass
+
+    """
+    This function creates the index files
+    """
+    @abstractmethod
+    def write_index(self):
+        pass
+
+    @abstractmethod
+    def remove_packaging_data(self):
+        pass
+
+    @abstractmethod
+    def list_installed(self, format=None):
+        pass
+
+    @abstractmethod
+    def insert_feeds_uris(self):
+        pass
+
+    """
+    Install complementary packages based upon the list of currently installed
+    packages e.g. locales, *-dev, *-dbg, etc. This will only attempt to install
+    these packages, if they don't exist then no error will occur.  Note: every
+    backend needs to call this function explicitly after the normal package
+    installation
+    """
+    def install_complementary(self, globs=None):
+        # we need to write the list of installed packages to a file because the
+        # oe-pkgdata-util reads it from a file
+        if self.d.has_key('WORKDIR'):
+            installed_pkgs_file = os.path.join(self.d['WORKDIR'],
+                                           "installed_pkgs.txt")
+        else:
+            msger.error("No WORKDIR provided!")
+
+        with open(installed_pkgs_file, "w+") as installed_pkgs:
+            installed_pkgs.write(self.list_installed("arch"))
+
+        if globs is None:
+            if self.d.has_key('IMAGE_INSTALL_COMPLEMENTARY'):
+                globs = self.d['IMAGE_INSTALL_COMPLEMENTARY']
+            split_linguas = set()
+
+            if self.d.has_key('IMAGE_LINGUAS'):
+                for translation in self.d['IMAGE_LINGUAS'].split():
+                    split_linguas.add(translation)
+                    split_linguas.add(translation.split('-')[0])
+
+            split_linguas = sorted(split_linguas)
+
+            for lang in split_linguas:
+                globs += " *-locale-%s" % lang
+
+        if globs is None:
+            return
+
+        if not self.d.has_key('PKGDATA_DIR'):
+            msger.error("No PKGDATA_DIR provided!")
+
+        cmd = [which(os.getenv('PATH'), "oe-pkgdata-util"),
+               "glob", self.d['PKGDATA_DIR'], installed_pkgs_file,
+               globs]
+
+        rc, out = exec_native_cmd(self.pseudo + cmd, self.native_sysroot)
+        if rc != 0:
+            msger.error("Could not compute complementary packages list. Command "
+                     "'%s' returned %d" %
+                     (' '.join(cmd), rc))
+
+        self.install(out.split(), attempt_only=True)
+
+
+    def deploy_dir_lock(self):
+        if self.deploy_dir is None:
+            raise RuntimeError("deploy_dir is not set!")
+
+        lock_file_name = os.path.join(self.deploy_dir, "deploy.lock")
+
+        self.deploy_lock = lockfile(lock_file_name)
+
+    def deploy_dir_unlock(self):
+        if self.deploy_lock is None:
+            return
+
+        unlockfile(self.deploy_lock)
+
+        self.deploy_lock = None
+
+
+class WicOpkgPM(WicPackageManager):
+    def __init__(self, d, target_rootfs, config_file, archs, pseudo, native_sysroot, task_name='target'):
+        super(WicOpkgPM, self).__init__(d, pseudo, native_sysroot)
+
+        self.target_rootfs = target_rootfs
+        self.config_file = config_file
+        self.pkg_archs = archs
+        self.task_name = task_name
+
+        if self.d.has_key("DEPLOY_DIR_IPK"):
+            self.deploy_dir = self.d["DEPLOY_DIR_IPK"]
+
+        self.deploy_lock_file = os.path.join(self.deploy_dir, "deploy.lock")
+        self.opkg_cmd = which(os.getenv('PATH'), "opkg-cl")
+        self.opkg_args = "-f %s -o %s " % (self.config_file, target_rootfs)
+        if self.d.has_key("OPKG_ARGS"):
+            self.opkg_args += self.d["OPKG_ARGS"]
+
+        if self.d.has_key('OPKGLIBDIR'):
+            opkg_lib_dir = self.d['OPKGLIBDIR']
+        else:
+            opkg_lib_dir = ""
+
+        if opkg_lib_dir[0] == "/":
+            opkg_lib_dir = opkg_lib_dir[1:]
+
+        self.opkg_dir = os.path.join(target_rootfs, opkg_lib_dir, "opkg")
+
+        mkdirhier(self.opkg_dir)
+
+        if self.d.has_key("TMPDIR"):
+            tmp_dir = self.d["TMPDIR"]
+        else:
+            tmp_dir = ""
+
+        self.saved_opkg_dir = '%s/saved/%s' % (tmp_dir, self.task_name)
+        if not os.path.exists('%s/saved' % tmp_dir):
+            mkdirhier('%s/saved' % tmp_dir)
+
+        if self.d.has_key('BUILD_IMAGES_FROM_FEEDS') and self.d['BUILD_IMAGES_FROM_FEEDS'] != "1":
+            self._create_config()
+        else:
+            self._create_custom_config()
+
+        self.indexer = WicOpkgIndexer(self.d, self.deploy_dir)
+
+    """
+    This function will change a package's status in /var/lib/opkg/status file.
+    If 'packages' is None then the new_status will be applied to all
+    packages
+    """
+    def mark_packages(self, status_tag, packages=None):
+        status_file = os.path.join(self.opkg_dir, "status")
+
+        with open(status_file, "r") as sf:
+            with open(status_file + ".tmp", "w+") as tmp_sf:
+                if packages is None:
+                    tmp_sf.write(re.sub(r"Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
+                                        r"Package: \1\n\2Status: \3%s" % status_tag,
+                                        sf.read()))
+                else:
+                    if type(packages).__name__ != "list":
+                        raise TypeError("'packages' should be a list object")
+
+                    status = sf.read()
+                    for pkg in packages:
+                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
+                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
+                                        status)
+
+                    tmp_sf.write(status)
+
+        os.rename(status_file + ".tmp", status_file)
+
+    def _create_custom_config(self):
+        msger.info("Building from feeds activated!")
+
+        with open(self.config_file, "w+") as config_file:
+            priority = 1
+            for arch in self.pkg_archs.split():
+                config_file.write("arch %s %d\n" % (arch, priority))
+                priority += 5
+
+            if self.d.has_key('IPK_FEED_URIS'):
+                ipk_feed_uris = self.d['IPK_FEED_URIS']
+            else:
+                ipk_feed_uris = ""
+
+            for line in ipk_feed_uris.split():
+                feed_match = re.match("^[ \t]*(.*)##([^ \t]*)[ \t]*$", line)
+
+                if feed_match is not None:
+                    feed_name = feed_match.group(1)
+                    feed_uri = feed_match.group(2)
+
+                    msger.info("Add %s feed with URL %s" % (feed_name, feed_uri))
+
+                    config_file.write("src/gz %s %s\n" % (feed_name, feed_uri))
+
+            """
+            Allow to use package deploy directory contents as quick devel-testing
+            feed. This creates individual feed configs for each arch subdir of those
+            specified as compatible for the current machine.
+            NOTE: Development-helper feature, NOT a full-fledged feed.
+            """
+            if self.d.has_key('FEED_DEPLOYDIR_BASE_URI'):
+                feed_deploydir_base_dir = self.d['FEED_DEPLOYDIR_BASE_URI']
+            else:
+                feed_deploydir_base_dir = ""
+
+            if feed_deploydir_base_dir != "":
+                for arch in self.pkg_archs.split():
+                    if self.d.has_key("sysconfdir"):
+                        sysconfdir = self.d["sysconfdir"]
+                    else:
+                        sysconfdir = None
+
+                    cfg_file_name = os.path.join(self.target_rootfs,
+                                                 sysconfdir,
+                                                 "opkg",
+                                                 "local-%s-feed.conf" % arch)
+
+                    with open(cfg_file_name, "w+") as cfg_file:
+                        cfg_file.write("src/gz local-%s %s/%s" %
+                                       arch,
+                                       feed_deploydir_base_dir,
+                                       arch)
+
+    def _create_config(self):
+        with open(self.config_file, "w+") as config_file:
+            priority = 1
+            for arch in self.pkg_archs.split():
+                config_file.write("arch %s %d\n" % (arch, priority))
+                priority += 5
+
+            config_file.write("src oe file:%s\n" % self.deploy_dir)
+
+            for arch in self.pkg_archs.split():
+                pkgs_dir = os.path.join(self.deploy_dir, arch)
+                if os.path.isdir(pkgs_dir):
+                    config_file.write("src oe-%s file:%s\n" %
+                                      (arch, pkgs_dir))
+
+    def insert_feeds_uris(self):
+        if self.feed_uris == "":
+            return
+
+        rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
+                                  % self.target_rootfs)
+
+        with open(rootfs_config, "w+") as config_file:
+            uri_iterator = 0
+            for uri in self.feed_uris.split():
+                config_file.write("src/gz url-%d %s/ipk\n" %
+                                  (uri_iterator, uri))
+
+                for arch in self.pkg_archs.split():
+                    if not os.path.exists(os.path.join(self.deploy_dir, arch)):
+                        continue
+                    msger.info('Note: adding opkg channel url-%s-%d (%s)' %
+                        (arch, uri_iterator, uri))
+
+                    config_file.write("src/gz uri-%s-%d %s/ipk/%s\n" %
+                                      (arch, uri_iterator, uri, arch))
+                uri_iterator += 1
+
+    def update(self):
+        self.deploy_dir_lock()
+
+        cmd = "%s %s update" % (self.opkg_cmd, self.opkg_args)
+
+        rc, out = exec_native_cmd(self.pseudo + cmd, self.native_sysroot)
+        if rc != 0:
+            self.deploy_dir_unlock()
+            msger.error("Unable to update the package index files. Command '%s' "
+                     "returned %d" % (cmd, rc))
+
+        self.deploy_dir_unlock()
+
+    def install(self, pkgs, attempt_only=False):
+        if attempt_only and len(pkgs) == 0:
+            return
+
+        cmd = "%s %s install %s" % (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+
+        os.environ['D'] = self.target_rootfs
+        os.environ['OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
+        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
+        if self.d.has_key('WORKDIR'):
+            os.environ['INTERCEPT_DIR'] = os.path.join(self.d['WORKDIR'],
+                                                   "intercept_scripts")
+        else:
+            os.environ['INTERCEPT_DIR'] = "."
+            msger.warning("No WORKDIR provided!")
+
+        if self.d.has_key('STAGING_DIR_NATIVE'):
+            os.environ['NATIVE_ROOT'] = self.d['STAGING_DIR_NATIVE']
+        else:
+            msger.error("No STAGING_DIR_NATIVE provided!")
+
+        rc, out = exec_native_cmd(self.pseudo + cmd, self.native_sysroot)
+        if rc != 0:
+            msger.error("Unable to install packages. "
+                        "Command '%s' returned %d" % (cmd, rc))
+
+
+    def remove(self, pkgs, with_dependencies=True):
+        if with_dependencies:
+            cmd = "%s %s --force-depends --force-remove --force-removal-of-dependent-packages remove %s" % \
+                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+        else:
+            cmd = "%s %s --force-depends remove %s" % \
+                (self.opkg_cmd, self.opkg_args, ' '.join(pkgs))
+
+        rc, out = exec_native_cmd(self.pseudo + cmd, self.native_sysroot)
+        if rc != 0:
+            msger.error("Unable to remove packages. Command '%s' "
+                     "returned %d" % (cmd, rc))
+
+
+    def write_index(self):
+        self.deploy_dir_lock()
+
+        result = self.indexer.write_index()
+
+        self.deploy_dir_unlock()
+
+        if result is not None:
+            msger.error(result)
+
+    def remove_packaging_data(self):
+        remove(self.opkg_dir, True)
+        # create the directory back, it's needed by PM lock
+        mkdirhier(self.opkg_dir)
+
+    def list_installed(self, format=None):
+        return WicOpkgPkgsList(self.d, self.target_rootfs, self.config_file).list(format)
+
+    def handle_bad_recommendations(self):
+        if self.d.has_key("BAD_RECOMMENDATIONS"):
+            bad_recommendations = self.d["BAD_RECOMMENDATIONS"]
+        else:
+            bad_recommendations = ""
+
+        if bad_recommendations.strip() == "":
+            return
+
+        status_file = os.path.join(self.opkg_dir, "status")
+
+        # If status file existed, it means the bad recommendations has already
+        # been handled
+        if os.path.exists(status_file):
+            return
+
+        cmd = "%s %s info " % (self.opkg_cmd, self.opkg_args)
+
+        with open(status_file, "w+") as status:
+            for pkg in bad_recommendations.split():
+                pkg_info = cmd + pkg
+
+                try:
+                    output = subprocess.check_output(pkg_info.split(), stderr=subprocess.STDOUT).strip()
+                except subprocess.CalledProcessError as e:
+                    msger.error("Cannot get package info. Command '%s' "
+                             "returned %d:\n%s" % (pkg_info, e.returncode, e.output))
+
+                if output == "":
+                    msger.info("Ignored bad recommendation: '%s' is "
+                            "not a package" % pkg)
+                    continue
+
+                for line in output.split('\n'):
+                    if line.startswith("Status:"):
+                        status.write("Status: deinstall hold not-installed\n")
+                    else:
+                        status.write(line + "\n")
+
+    '''
+    The following function dummy installs pkgs and returns the log of output.
+    '''
+    def dummy_install(self, pkgs):
+        if len(pkgs) == 0:
+            return
+
+        # Create an temp dir as opkg root for dummy installation
+        if self.d.has_key("TMPDIR"):
+            tmp_dir = self.d["TMPDIR"]
+        else:
+            tmp_dir = "."
+            msger.warning("No TMPDIR provided!")
+
+        temp_rootfs = '%s/opkg' % tmp_dir
+        temp_opkg_dir = os.path.join(temp_rootfs, 'var/lib/opkg')
+        mkdirhier(temp_opkg_dir)
+
+        opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
+        if self.d.has_key("OPKG_ARGS"):
+            opkg_args += self.d["OPKG_ARGS"]
+
+        cmd = "%s %s update" % (self.opkg_cmd, opkg_args)
+        try:
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            msger.error("Unable to update. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        # Dummy installation
+        cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
+                                                opkg_args,
+                                                ' '.join(pkgs))
+        try:
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+        except subprocess.CalledProcessError as e:
+            msger.error("Unable to dummy install packages. Command '%s' "
+                     "returned %d:\n%s" % (cmd, e.returncode, e.output))
+
+        remove(temp_rootfs, True)
+
+        return output
+
+    def backup_packaging_data(self):
+        # Save the opkglib for increment ipk image generation
+        if os.path.exists(self.saved_opkg_dir):
+            remove(self.saved_opkg_dir, True)
+        shutil.copytree(self.opkg_dir,
+                        self.saved_opkg_dir,
+                        symlinks=True)
+
+    def recover_packaging_data(self):
+        # Move the opkglib back
+        if os.path.exists(self.saved_opkg_dir):
+            if os.path.exists(self.opkg_dir):
+                remove(self.opkg_dir, True)
+
+            msger.info('Recover packaging data')
+            shutil.copytree(self.saved_opkg_dir,
+                            self.opkg_dir,
+                            symlinks=True)
+
+
+def wic_generate_index_files(d):
+    if d.has_key('PACKAGE_CLASSES'):
+        classes = d['PACKAGE_CLASSES'].replace("package_", "").split()
+    else:
+        classes = ""
+        msger.warning("No PACKAGE_CLASSES provided!")
+
+    if d.has_key('DEPLOY_DIR_IPK'):
+        deploy_dir_ipk = d['DEPLOY_DIR_IPK']
+    else:
+        deploy_dir_ipk = None
+        msger.warning("No DEPLOY_DIR_IPK provided!")
+
+    indexer_map = {
+        "ipk": (WicOpkgIndexer, deploy_dir_ipk)
+    }
+
+    result = None
+
+    for pkg_class in classes:
+        if not pkg_class in indexer_map:
+            continue
+
+        if os.path.exists(indexer_map[pkg_class][1]):
+            result = indexer_map[pkg_class][0](d, indexer_map[pkg_class][1]).write_index()
+
+            if result is not None:
+                msger.error(result)
diff --git a/scripts/wic b/scripts/wic
index 2d3fd09..b9c8756 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -99,6 +99,10 @@ def wic_create_subcommand(args, usage_str):
 
     (options, args) = parser.parse_args(args)
 
+    if options.debug:
+        loglevel = logging.DEBUG
+        start_logging(loglevel)
+
     if len(args) != 1:
         logging.error("Wrong number of arguments, exiting\n")
         parser.print_help()
@@ -107,9 +111,11 @@ def wic_create_subcommand(args, usage_str):
     if not options.image_name and not (options.rootfs_dir and
                                        options.bootimg_dir and
                                        options.kernel_dir and
+                                       options.native_sysroot or
                                        options.native_sysroot):
         print "Build artifacts not completely specified, exiting."
-        print "  (Use 'wic -e' or 'wic -r -b -k -n' to specify artifacts)"
+        print "  (Use 'wic -e' or 'wic -r -b -k -n' or 'wic -r -n' to specify artifacts)"
+        print options
         sys.exit(1)
 
     if not options.image_name:
@@ -125,13 +131,16 @@ def wic_create_subcommand(args, usage_str):
 
     print "Creating image(s)...\n"
 
-    bitbake_env_lines = find_bitbake_env_lines(options.image_name)
-    if not bitbake_env_lines:
-        print "Couldn't get bitbake environment, exiting."
-        sys.exit(1)
-    set_bitbake_env_lines(bitbake_env_lines)
+    # If '-e' option is used the values are extracted from bitbake env.
+    if options.image_name:
+        bitbake_env_lines = find_bitbake_env_lines(options.image_name)
+        if not bitbake_env_lines:
+            print "Couldn't get bitbake environment, exiting."
+            sys.exit(1)
+        set_bitbake_env_lines(bitbake_env_lines)
 
     bootimg_dir = staging_data_dir = hdddir = ""
+    rootfs_dir = native_sysroot = kernel_dir = image_output_dir = ""
 
     if options.image_name:
         (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot) = \
@@ -140,34 +149,65 @@ def wic_create_subcommand(args, usage_str):
     wks_file = args[0]
 
     if not wks_file.endswith(".wks"):
+        # Return full path of the .wks file
         wks_file = find_canned_image(scripts_path, wks_file)
         if not wks_file:
-            print "No image named %s found, exiting.  (Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n" % wks_file
+            print "No image named %s found, exiting.\n" % wks_file
+            print "(Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n"
             sys.exit(1)
 
-    image_output_dir = ""
     if options.outdir:
         image_output_dir = options.outdir
 
-    if not options.image_name:
-        rootfs_dir = ''
-        if 'ROOTFS_DIR' in options.rootfs_dir:
-            rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
-        bootimg_dir = options.bootimg_dir
-        kernel_dir = options.kernel_dir
+    if options.native_sysroot:
         native_sysroot = options.native_sysroot
-        if rootfs_dir and not os.path.isdir(rootfs_dir):
-            print "--roofs-dir (-r) not found, exiting\n"
-            sys.exit(1)
-        if not os.path.isdir(bootimg_dir):
-            print "--bootimg-dir (-b) not found, exiting\n"
-            sys.exit(1)
-        if not os.path.isdir(kernel_dir):
-            print "--kernel-dir (-k) not found, exiting\n"
-            sys.exit(1)
+        print "Using native_sysroot from user command: %s" % native_sysroot
+
         if not os.path.isdir(native_sysroot):
-            print "--native-sysroot (-n) not found, exiting\n"
+            print "--native-sysroot (-n) not found, exiting"
             sys.exit(1)
+
+        native_sysroot = os.path.abspath(native_sysroot)
+
+    if not options.image_name:
+        if (options.bootimg_dir and options.kernel_dir and
+             options.rootfs_dir and options.native_sysroot):
+            rootfs_dir = ''
+            if 'ROOTFS_DIR' in options.rootfs_dir:
+                rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
+            bootimg_dir = options.bootimg_dir
+            kernel_dir = options.kernel_dir
+            native_sysroot = options.native_sysroot
+
+            if rootfs_dir and not os.path.isdir(rootfs_dir):
+                print "--roofs-dir (-r) not found, exiting\n"
+                sys.exit(1)
+            if not os.path.isdir(bootimg_dir):
+                print "--bootimg-dir (-b) not found, exiting\n"
+                sys.exit(1)
+            if not os.path.isdir(kernel_dir):
+                print "--kernel-dir (-k) not found, exiting\n"
+                sys.exit(1)
+            if not os.path.isdir(native_sysroot):
+                print "--native-sysroot (-n) not found, exiting\n"
+                sys.exit(1)
+        else:
+            print 'Build image from rootfs and a package list using native rootfs\n'
+            if options.rootfs_dir and 'ROOTFS_DIR' in options.rootfs_dir:
+                rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
+            elif options.rootfs_dir:
+                rootfs_dir = options.rootfs_dir
+            else:
+                rootfs_dir = ""
+
+            native_sysroot = options.native_sysroot
+
+            if rootfs_dir and not os.path.isdir(rootfs_dir):
+                print "--roofs-dir (-r) not found, exiting\n"
+                sys.exit(1)
+            if not os.path.isdir(native_sysroot):
+                print "--native-sysroot (-n) not found, exiting\n"
+                sys.exit(1)
     else:
         not_found = not_found_dir = ""
         if not os.path.isdir(rootfs_dir):
-- 
1.7.10.4


