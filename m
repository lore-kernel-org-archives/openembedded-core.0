Return-Path: <adrian.freihofer@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5586BCA4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 08:00:10 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5880AmU018084
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Jun 2019 10:00:10 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.37.201])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x58808gJ015866;
	Sat, 8 Jun 2019 10:00:08 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 06C062273142;
	Sat,  8 Jun 2019 10:00:08 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jun 2019 09:59:47 +0200
Message-Id: <20190608075948.30537-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190608075948.30537-1-adrian.freihofer@siemens.com>
References: <20190608075948.30537-1-adrian.freihofer@siemens.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH v3 3/4] runqemu: support non-bootable wic images
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
X-List-Received-Date: Sat, 08 Jun 2019 08:00:11 -0000

wic images are handled as vmtype images. Starting qemu with "-kernel"
parameter and an image of type wic is not supported. Especially for
"-machine virt" the combination of wic with -kernel parameter would
be beneficial.

This patch changes the runqemu script to support this. If QB_MACHINE
contains "-machine virt" and the image is of type wic a -kernel
parameter is expected. Otherwise wic images are handled as before.

Example:
QB_DEFAULT_FSTYPE = "wic"
QB_KERNEL_ROOT = "/dev/vda1"
QB_SYSTEM_NAME = "qemu-system-aarch64"
QB_MACHINE = "-machine virt"
...

[YOCTO #13336]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index af90c010da..71894c9ca8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -185,10 +185,11 @@ class BaseConfig(object):
         self.lock_descriptor = None
         self.bitbake_e = ''
         self.snapshot = False
+        self.wic_fs = None
+        self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
                         'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
-        self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'wic.vmdk',
-                        'wic.qcow2', 'wic.vdi', 'iso')
+        self.vmtypes = ('hddimg', 'hdddirect', 'iso')
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
@@ -300,7 +301,7 @@ class BaseConfig(object):
             # Check filename against self.fstypes can hanlde <file>.cpio.gz,
             # otherwise, its type would be "gz", which is incorrect.
             fst = ""
-            for t in self.fstypes:
+            for t in self.fstypes + self.wictypes:
                 if p.endswith(t):
                     fst = t
                     break
@@ -390,7 +391,7 @@ class BaseConfig(object):
 
         unknown_arg = ""
         for arg in sys.argv[1:]:
-            if arg in self.fstypes + self.vmtypes:
+            if arg in self.fstypes + self.vmtypes + self.wictypes:
                 self.check_arg_fstype(arg)
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
@@ -695,6 +696,21 @@ class BaseConfig(object):
 
     def check_and_set(self):
         """Check configs sanity and set when needed"""
+
+        # Decide how wic images are handled: as vm or with -kernel parameter
+        if self.wic_fs is None:
+            self.wic_fs = False
+            try:
+                qbm = self.get('QB_MACHINE')
+                if re.search('\s+virt(?![^ ])', qbm):
+                    self.wic_fs = True
+            except AttributeError:
+                pass
+        if self.wic_fs is True:
+            self.fstypes = self.fstypes + self.wictypes
+        else:
+            self.vmtypes = self.vmtypes + self.wictypes
+
         self.validate_paths()
         if not self.slirp_enabled:
             check_tun()
@@ -832,7 +848,13 @@ class BaseConfig(object):
             if self.dtb:
                 print('DTB: [%s]' % self.dtb)
         print('MACHINE: [%s]' % self.get('MACHINE'))
-        print('FSTYPE: [%s]' % self.fstype)
+        wic_mode = ''
+        if self.fstype == 'wic':
+            if self.wic_fs:
+                wic_mode = ' (fs)'
+            else:
+                wic_mode = ' (vm)'
+        print('FSTYPE: [%s%s]' % (self.fstype, wic_mode))
         if self.fstype  == 'nfs':
             print('NFS_DIR: [%s]' % self.rootfs)
         else:
-- 
2.11.0


