Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE0DE77BD3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 06:41:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v366firr005398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 23:41:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Apr 2017 23:41:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Apr 2017 23:41:38 -0700
Message-ID: <4e9e31c78a0a7e2d21f9e783edfb98afbbac6faf.1491460816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491460816.git.liezhi.yang@windriver.com>
References: <cover.1491460816.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] runqemu: do not rely on grepping images
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
X-List-Received-Date: Thu, 06 Apr 2017 06:41:43 -0000
Content-Type: text/plain

Fixed when the image is large and not enough memory:
  grep: memory exhausted
  Aborted

[YOCTO #11073]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/qemuboot.bbclass |  3 +++
 scripts/runqemu               | 19 +++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 3ca97cad4c..2870388dfb 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -64,6 +64,9 @@ QB_DEFAULT_FSTYPE ?= "ext4"
 QB_OPT_APPEND ?= "-show-cursor"
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 
+# This should be kept align with ROOT_VM
+QB_DRIVE_TYPE ?= "/dev/sd"
+
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
 IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
diff --git a/scripts/runqemu b/scripts/runqemu
index b9646223c4..b5fc22af18 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -978,23 +978,26 @@ class BaseConfig(object):
             self.kernel_cmdline = 'root=/dev/ram0 rw debugshell'
             self.rootfs_options = '-initrd %s' % self.rootfs
         else:
+            vm_drive = ''
             if self.fstype in self.vmtypes:
                 if self.fstype == 'iso':
                     vm_drive = '-cdrom %s' % self.rootfs
-                else:
-                    cmd1 = "grep -q 'root=/dev/sd' %s" % self.rootfs
-                    cmd2 = "grep -q 'root=/dev/hd' %s" % self.rootfs
-                    if subprocess.call(cmd1, shell=True) == 0:
+                elif self.get('QB_DRIVE_TYPE'):
+                    drive_type = self.get('QB_DRIVE_TYPE')
+                    if drive_type.startswith("/dev/sd"):
                         logger.info('Using scsi drive')
                         vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' \
                                        % (self.rootfs, rootfs_format)
-                    elif subprocess.call(cmd2, shell=True) == 0:
+                    elif drive_type.startswith("/dev/hd"):
                         logger.info('Using ide drive')
                         vm_drive = "%s,format=%s" % (self.rootfs, rootfs_format)
                     else:
-                        logger.warn("Can't detect drive type %s" % self.rootfs)
-                        logger.warn('Trying to use virtio block drive')
-                        vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
+                        logger.warn("Unknown QB_DRIVE_TYPE: %s" % drive_type)
+
+                if not vm_drive:
+                    logger.warn("Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE")
+                    logger.warn('Trying to use virtio block drive')
+                    vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
                 self.rootfs_options = '%s -no-reboot' % vm_drive
             self.kernel_cmdline = 'root=%s rw highres=off' % (self.get('QB_KERNEL_ROOT'))
 
-- 
2.11.0.rc2.dirty


