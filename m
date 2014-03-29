Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7C66ADA2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:12:34 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id lf12so6498925vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 20:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=eNTSYTIRStPfY5G3SNm7+VvG78ZNt04u0SGvMGa+93Y=;
	b=AQRykY7uEsWpy2uEj9K5uzoYv6Cc0LlB84a0fexR40Z3StpOD3g/fbVDyzG1HvdUAC
	B36sBhgoHAItZEcJvDKrPIw4CVa/+9Kt9Oc3W1i7A0Thd+/jdfKR71tp9ND8A0ngaOIm
	iLNAdvwSxKRjLE3rUfGgxrZkij7E2nIQRTmuan/zmtGBiW5xb6d2Q9NpGgPEQU7fnptL
	m6Z3pnE8P8UsjwYO1qJ72CSneEMeoUCqDqXbMpsp7vVe4HKuXpn9Ug6eyYkH8YPgXCOY
	or+Nn6MS5jUZJcoxNk33XMoKaNELA12gCFj0SgDaH3B+tIeziNKgFv8LGs5RM60Nt/Uf
	pzvg==
X-Received: by 10.52.165.105 with SMTP id yx9mr8678699vdb.22.1396062756114;
	Fri, 28 Mar 2014 20:12:36 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id
	ha7sm12869708vdb.17.2014.03.28.20.12.34 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 20:12:35 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 00:12:08 -0300
Message-Id: <1396062728-9140-8-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396062728-9140-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1396062728-9140-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v4 7/7] wic: Extend --rootfs-dir to connect rootfs-dirs
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
X-List-Received-Date: Sat, 29 Mar 2014 03:12:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The wic command-line param --rootfs-dir gets generalized to support
multiple directories. Each '--rootfs-dir' could be connected using a
special string, that should be present in .wks. I.e:

wic create ... --rootfs-dir rootfs1=/some/rootfs/dir \
  --rootfs-dir rootfs2=/some/other/rootfs/dir

  part / --source rootfs --rootfs-dir="rootfs1" --ondisk sda --fstype=ext3 \
    --label primary --align 1024

  part /standby --source rootfs --rootfs-dir="rootfs2" \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

The user could use harded-code directory instead of connectors. Like this:

  wic create ... hard-coded-path.wks -r /some/rootfs/dir

  part / --source rootfs --ondisk sda --fstype=ext3 --label primary --align 1024

  part /standby --source rootfs --rootfs-dir=/some/rootfs/dir \
    --ondisk sda --fstype=ext3 --label secondary --align 1024

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/imager/direct.py                | 18 ++++++-----
 scripts/lib/mic/plugins/imager/direct_plugin.py | 17 ++++++++++-
 scripts/lib/mic/plugins/source/rootfs.py        | 20 ++++++++++---
 scripts/wic                                     | 40 +++++++++++++++++++++++--
 4 files changed, 80 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index ac63c38..2cf4c8d 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -84,17 +84,19 @@ class DirectImageCreator(BaseImageCreator):
         self.hdddir = hdddir
         self.staging_data_dir = staging_data_dir
 
-    def __write_fstab(self):
+    def __write_fstab(self, image_rootfs):
         """overriden to generate fstab (temporarily) in rootfs. This
         is called from mount_instroot, make sure it doesn't get called
         from BaseImage.mount()"""
+        if image_rootfs is None:
+            return None
 
-        image_rootfs = self.rootfs_dir
+        fstab = image_rootfs + "/etc/fstab"
+        if not os.path.isfile(fstab):
+            return None
 
         parts = self._get_parts()
 
-        fstab = image_rootfs + "/etc/fstab"
-
         self._save_fstab(fstab)
         fstab_lines = self._get_fstab(fstab, parts)
         self._update_fstab(fstab_lines, parts)
@@ -126,6 +128,8 @@ class DirectImageCreator(BaseImageCreator):
 
     def _restore_fstab(self, fstab):
         """Restore the saved fstab in rootfs"""
+        if fstab is None:
+            return
         shutil.move(fstab + ".orig", fstab)
 
     def _get_fstab(self, fstab, parts):
@@ -235,8 +239,6 @@ class DirectImageCreator(BaseImageCreator):
 
         self.__instimage = PartitionedMount(self._instroot)
 
-        fstab = self.__write_fstab()
-
         for p in parts:
             # as a convenience, set source to the boot partition source
             # instead of forcing it to be set via bootloader --source
@@ -263,6 +265,9 @@ class DirectImageCreator(BaseImageCreator):
             p.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
                       self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
+            fstab = self.__write_fstab(p.get_rootfs())
+            self._restore_fstab(fstab)
+
             self.__instimage.add_partition(int(p.size),
                                            p.disk,
                                            p.mountpoint,
@@ -273,7 +278,6 @@ class DirectImageCreator(BaseImageCreator):
                                            boot = p.active,
                                            align = p.align,
                                            part_type = p.part_type)
-        self._restore_fstab(fstab)
         self.__instimage.layout_partitions(self._ptable_format)
 
         self.__imgdir = self.workdir
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
index e015256..fc7c10c 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -43,6 +43,19 @@ class DirectPlugin(ImagerPlugin):
     name = 'direct'
 
     @classmethod
+    def __rootfs_dir_to_dict(self, rootfs_dirs):
+        """
+        Gets a string that contain 'connection=dir' splitted by
+        space and return a dict
+        """
+        krootfs_dir = {}
+        for rootfs_dir in rootfs_dirs.split(' '):
+            k, v = rootfs_dir.split('=')
+            krootfs_dir[k] = v
+
+        return krootfs_dir
+
+    @classmethod
     def do_create(self, subcmd, opts, *args):
         """
         Create direct image, called from creator as 'direct' cmd
@@ -63,11 +76,13 @@ class DirectPlugin(ImagerPlugin):
         image_output_dir = args[7]
         oe_builddir = args[8]
 
+        krootfs_dir = self.__rootfs_dir_to_dict(rootfs_dir)
+
         configmgr._ksconf = ksconf
 
         creator = direct.DirectImageCreator(oe_builddir,
                                             image_output_dir,
-                                            rootfs_dir,
+                                            krootfs_dir,
                                             bootimg_dir,
                                             kernel_dir,
                                             native_sysroot,
diff --git a/scripts/lib/mic/plugins/source/rootfs.py b/scripts/lib/mic/plugins/source/rootfs.py
index 83aec45..75999e0 100644
--- a/scripts/lib/mic/plugins/source/rootfs.py
+++ b/scripts/lib/mic/plugins/source/rootfs.py
@@ -45,15 +45,27 @@ class RootfsPlugin(SourcePlugin):
 
     @classmethod
     def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, rootfs_dir, native_sysroot):
+                             kernel_dir, krootfs_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for legacy bios boot partition.
         """
-        if part.rootfs:
-            rootfs_dir = part.rootfs 
-        
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
         part.set_rootfs(rootfs_dir)
         part.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir, native_sysroot)
 
diff --git a/scripts/wic b/scripts/wic
index 824acae..4423340 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -45,6 +45,30 @@ sys.path = sys.path + [lib_path]
 from image.help import *
 from image.engine import *
 
+def rootfs_dir_to_args(krootfs_dir):
+    """
+    Get a rootfs_dir dict and serialize to string
+    """
+    rootfs_dir = ''
+    for k, v in krootfs_dir.items():
+        rootfs_dir += ' '
+        rootfs_dir += '='.join([k, v])
+    return rootfs_dir.strip()
+
+def callback_rootfs_dir(option, opt, value, parser):
+    """
+    Build a dict using --rootfs_dir connection=dir
+    """
+    if not type(parser.values.rootfs_dir) is dict:
+        parser.values.rootfs_dir = dict()
+
+    if '=' in value:
+        (key, rootfs_dir) = value.split('=')
+    else:
+       key = 'ROOTFS_DIR'
+       rootfs_dir = value
+
+    parser.values.rootfs_dir[key] = rootfs_dir
 
 def wic_create_subcommand(args, usage_str):
     """
@@ -60,7 +84,8 @@ def wic_create_subcommand(args, usage_str):
     parser.add_option("-e", "--image-name", dest = "image_name",
                       action = "store", help = "name of the image to use the artifacts from e.g. core-image-sato")
     parser.add_option("-r", "--rootfs-dir", dest = "rootfs_dir",
-                      action = "store", help = "path to the /rootfs dir to use as the .wks rootfs source")
+                      action = "callback", callback = callback_rootfs_dir, type = "string",
+                      help = "path to the /rootfs dir to use as the .wks rootfs source")
     parser.add_option("-b", "--bootimg-dir", dest = "bootimg_dir",
                       action = "store", help = "path to the dir containing the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the .wks bootimg source")
     parser.add_option("-k", "--kernel-dir", dest = "kernel_dir",
@@ -125,11 +150,13 @@ def wic_create_subcommand(args, usage_str):
         image_output_dir = options.outdir
 
     if not options.image_name:
-        rootfs_dir = options.rootfs_dir
+        rootfs_dir = ''
+        if 'ROOTFS_DIR' in options.rootfs_dir:
+            rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
         bootimg_dir = options.bootimg_dir
         kernel_dir = options.kernel_dir
         native_sysroot = options.native_sysroot
-        if not os.path.isdir(rootfs_dir):
+        if rootfs_dir and not os.path.isdir(rootfs_dir):
             print "--roofs-dir (-r) not found, exiting\n"
             sys.exit(1)
         if not os.path.isdir(bootimg_dir):
@@ -162,6 +189,13 @@ def wic_create_subcommand(args, usage_str):
                 (not_found, not_found_dir)
             sys.exit(1)
 
+    krootfs_dir = options.rootfs_dir
+    if krootfs_dir is None:
+         krootfs_dir = {}
+         krootfs_dir['ROOTFS_DIR'] = rootfs_dir
+
+    rootfs_dir = rootfs_dir_to_args(krootfs_dir)
+
     wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                native_sysroot, hdddir, staging_data_dir, scripts_path,
                image_output_dir, options.debug, options.properties_file)
-- 
1.8.3.2


