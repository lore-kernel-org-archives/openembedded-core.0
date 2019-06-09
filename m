Return-Path: <adrian.freihofer@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 6F42D6011C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 12:04:21 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x59C4LH7020267
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Jun 2019 14:04:21 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.33.94])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x59C4JT7009433;
	Sun, 9 Jun 2019 14:04:19 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id EE95E2325006;
	Sun,  9 Jun 2019 14:04:18 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 14:03:42 +0200
Message-Id: <20190609120342.5475-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609120342.5475-1-adrian.freihofer@siemens.com>
References: <20190609120342.5475-1-adrian.freihofer@siemens.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH v4 3/3] runqemu: QB_FSINFO to support fstype wic images
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
X-List-Received-Date: Sun, 09 Jun 2019 12:04:21 -0000

wic images are handled as vmtype images. Starting qemu with "-kernel"
parameter and an image of type wic is not supported. Especially for
"-machine virt" the combination of wic with -kernel parameter would
be beneficial.

The new parameter QB_FSINFO allows to pass image type specific flags to
runqemu. QB_FSINFO is a space separated list of parameters. Parameters are
structured according to the following pattern: image-type:flag.

For now two parameters are supported:
- wic:no-kernel-in-fs
  The wic image is treated as rootfs only image. A -kernel option is
  passed to qemu.
- wic:kernel-in-fs
  The wic image is treated as VM image including a bootloader and a
  kernel. This is still the default behavior.

Example:
QB_DEFAULT_FSTYPE = "wic"
QB_FSINFO = "wic:no-kernel-in-fs"
QB_KERNEL_ROOT = "/dev/vda1"
QB_SYSTEM_NAME = "qemu-system-aarch64"
QB_MACHINE = "-machine virt"
...

[YOCTO #13336]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 49 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index af90c010da..4079f2b17d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -185,10 +185,11 @@ class BaseConfig(object):
         self.lock_descriptor = None
         self.bitbake_e = ''
         self.snapshot = False
+        self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
                         'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
-        self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'wic.vmdk',
-                        'wic.qcow2', 'wic.vdi', 'iso')
+        self.vmtypes = ('hddimg', 'hdddirect', 'iso')
+        self.fsinfo = {}
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
         # Use different mac section for tap and slirp to avoid
         # conflicts, e.g., when one is running with tap, the other is
@@ -253,7 +254,7 @@ class BaseConfig(object):
 
     def check_arg_fstype(self, fst):
         """Check and set FSTYPE"""
-        if fst not in self.fstypes + self.vmtypes:
+        if fst not in self.fstypes + self.vmtypes + self.wictypes:
             logger.warning("Maybe unsupported FSTYPE: %s" % fst)
         if not self.fstype or self.fstype == fst:
             if fst == 'ramfs':
@@ -390,7 +391,7 @@ class BaseConfig(object):
 
         unknown_arg = ""
         for arg in sys.argv[1:]:
-            if arg in self.fstypes + self.vmtypes:
+            if arg in self.fstypes + self.vmtypes + self.wictypes:
                 self.check_arg_fstype(arg)
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
@@ -536,6 +537,40 @@ class BaseConfig(object):
             else:
                 raise RunQemuError("FSTYPE is NULL!")
 
+        # parse QB_FSINFO into dict, e.g. { 'wic': ['no-kernel-in-fs', 'a-flag'], 'ext4': ['another-flag']}
+        wic_fs = False
+        qb_fsinfo = self.get('QB_FSINFO')
+        if qb_fsinfo:
+            qb_fsinfo = qb_fsinfo.split()
+            for fsinfo in qb_fsinfo:
+                try:
+                    fstype, fsflag = fsinfo.split(':')
+
+                    if fstype == 'wic':
+                        if fsflag == 'no-kernel-in-fs':
+                            wic_fs = True
+                        elif fsflag == 'kernel-in-fs':
+                            wic_fs = False
+                        else:
+                            logger.warn('Unknown flag "%s:%s" in QB_FSINFO', fstype, fsflag)
+                            continue
+                    else:
+                        logger.warn('QB_FSINFO is not supported for image type "%s"', fstype)
+                        continue
+
+                    if fstype in self.fsinfo:
+                        self.fsinfo[fstype].append(fsflag)
+                    else:
+                        self.fsinfo[fstype] = [fsflag]
+                except Exception:
+                    logger.error('Invalid parameter "%s" in QB_FSINFO', fsinfo)
+
+        # treat wic images as vmimages (with kernel) or as fsimages (rootfs only)
+        if wic_fs:
+            self.fstypes = self.fstypes + self.wictypes
+        else:
+            self.vmtypes = self.vmtypes + self.wictypes
+
     def check_rootfs(self):
         """Check and set rootfs"""
 
@@ -832,7 +867,11 @@ class BaseConfig(object):
             if self.dtb:
                 print('DTB: [%s]' % self.dtb)
         print('MACHINE: [%s]' % self.get('MACHINE'))
-        print('FSTYPE: [%s]' % self.fstype)
+        try:
+            fstype_flags = ' (' + ', '.join(self.fsinfo[self.fstype]) + ')'
+        except KeyError:
+            fstype_flags = ''
+        print('FSTYPE: [%s%s]' % (self.fstype, fstype_flags))
         if self.fstype  == 'nfs':
             print('NFS_DIR: [%s]' % self.rootfs)
         else:
-- 
2.11.0


