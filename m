Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 254767FC9A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 11:06:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 02:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="210078931"
Received: from ntruong2-mobl.ccr.corp.intel.com (HELO shodan.fritz.box)
	([10.255.170.244])
	by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 02:59:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 23:59:08 +1300
Message-Id: <4675d65dbb2c7e16283e3045c7ca90cec41ed0af.1575888923.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575888923.git.paul.eggleton@linux.intel.com>
References: <cover.1575888923.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] runqemu: log parameters correctly within testimage
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
X-List-Received-Date: Mon, 09 Dec 2019 11:06:32 -0000
Content-Transfer-Encoding: 8bit

It is not a good idea to mix logging and calls to print() - if the
output is being captured the result can be that the two types of output
are not recorded contiguously; this could be observed if an error
occurred running runqemu from inside testimage:

---------- snip ----------
ERROR: core-image-minimal-1.0-r0 do_testimage: Output from runqemu:
runqemu - INFO - Continuing with the following parameters:

runqemu - INFO - Setting up tap interface under sudo
sudo: a terminal is required to read the password; either use the -S option to read from standard input or configure an askpass helper
runqemu - ERROR - Setting up tap device failed:
Command '('sudo', '/home/paul/poky/poky/scripts/runqemu-ifup', '1000', '1000', '/home/paul/poky/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin')' returned non-zero exit status 1.
Run runqemu-gen-tapdevs to manually create one.
runqemu - INFO - Cleaning up
KERNEL: [/home/paul/poky/poky/build/tmp/deploy/images/qemux86-64/bzImage--5.2.20+git0+bd0762cd13_dd25a04fc5-r0-qemux86-64-20191205213021.bin]
MACHINE: [qemux86-64]
FSTYPE: [ext4]
ROOTFS: [/home/paul/poky/poky/build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4]
CONFFILE: [/home/paul/poky/poky/build/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.qemuboot.conf]
---------- snip ----------

What we should see here is the KERNEL, MACHINE, etc. lines appearing
immediately after the "Continuing with the following parameters:" line
as they do when you run runqemu directly. If we put all of the lines
through the logger instead then it works properly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/runqemu | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5c56c3fe6c1..f061917c4b3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -933,29 +933,30 @@ class BaseConfig(object):
                     self.set('STAGING_BINDIR_NATIVE', '%s/usr/bin' % self.get('STAGING_DIR_NATIVE'))
 
     def print_config(self):
-        logger.info('Continuing with the following parameters:\n')
+        logoutput = ['Continuing with the following parameters:']
         if not self.fstype in self.vmtypes:
-            print('KERNEL: [%s]' % self.kernel)
+            logoutput.append('KERNEL: [%s]' % self.kernel)
             if self.bios:
-                print('BIOS: [%s]' % self.bios)
+                logoutput.append('BIOS: [%s]' % self.bios)
             if self.dtb:
-                print('DTB: [%s]' % self.dtb)
-        print('MACHINE: [%s]' % self.get('MACHINE'))
+                logoutput.append('DTB: [%s]' % self.dtb)
+        logoutput.append('MACHINE: [%s]' % self.get('MACHINE'))
         try:
             fstype_flags = ' (' + ', '.join(self.fsinfo[self.fstype]) + ')'
         except KeyError:
             fstype_flags = ''
-        print('FSTYPE: [%s%s]' % (self.fstype, fstype_flags))
+        logoutput.append('FSTYPE: [%s%s]' % (self.fstype, fstype_flags))
         if self.fstype  == 'nfs':
-            print('NFS_DIR: [%s]' % self.rootfs)
+            logoutput.append('NFS_DIR: [%s]' % self.rootfs)
         else:
-            print('ROOTFS: [%s]' % self.rootfs)
+            logoutput.append('ROOTFS: [%s]' % self.rootfs)
         if self.ovmf_bios:
-            print('OVMF: %s' % self.ovmf_bios)
+            logoutput.append('OVMF: %s' % self.ovmf_bios)
         if (self.ovmf_secboot_pkkek1):
-            print('SECBOOT PKKEK1: [%s...]' % self.ovmf_secboot_pkkek1[0:100])
-        print('CONFFILE: [%s]' % self.qemuboot)
-        print('')
+            logoutput.append('SECBOOT PKKEK1: [%s...]' % self.ovmf_secboot_pkkek1[0:100])
+        logoutput.append('CONFFILE: [%s]' % self.qemuboot)
+        logoutput.append('')
+        logger.info('\n'.join(logoutput))
 
     def setup_nfs(self):
         if not self.nfs_server:
-- 
2.20.1


