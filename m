Return-Path: <prvs=1236ab962=alistair.francis@wdc.com>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Aug 2019 21:45:15 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4AB7F2DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565905517; x=1597441517;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=MObvgGbS7W3DhrT1L3+sehn8PKBVX7qsIFFTGXffvnY=;
	b=pr2bl1L344mt1v0b3KXV1StRVFWdHVXCnm+CUC+Yz2gClv0X4vxLANgR
	KViyZGKTIG4skZ7WgfQWj5g3ncnLS8xfNFW5ujqzc5Y2BoGuUxSzZvh3z
	vppQAKu7Rnrv9b2QN61Bj7BCboRzOdwSgyaWdVuS5+I6BXI2MAGoGiaJc
	9Ktjlh+JiPBBQi5e4Jg87bTZ0zav/79Z7qe8vYh8fidtIzhV+lNM7U9H8
	QWwO7JbJhHRYp8tyB0/EYlaQx6hCt92wJCL5eMmBJTB/q7NS2GPdvf7zV
	zWAoxkaiJIg90uwHvwpc7Xz59l6dvI99/QYaVATR83w93AixIxC/vE2T2 g==;
IronPort-SDR: KuEZQWm9L/fGRBvEwV3IIBrqxCQ9WKq3Z3YXJz3jQOky/PRlvPv8mHzd+6HxrAu0AnB3BBf3zp
	VDkyjYjIq2pZpGWSNX5WBpugwrlGe5i++KLm/yQksqGGGnNgpuZZhYTp2yTr1y3nr2gxDheYsi
	7POWnHZI5w+Mvrbp/O2u3ufnzcgXRDdWmlYgSt5fDZ7TkQf7ZmEEIupAcWftLks6ogzMapII4Z
	DAKxmClez//El/8Vwf8mEdV+OvpTpKcaRHJaDTQ/v+La1M6bxad6ahVMO324rvwbbgmw4d9Mdd
	s+U=
X-IronPort-AV: E=Sophos;i="5.64,389,1559491200"; d="scan'208";a="216305643"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 16 Aug 2019 05:35:50 +0800
IronPort-SDR: R/8M/nozCUPa9uD5sozF7NogMElQ1Vr91K9jPma2im/NVAq+VmHP4mLSLg/YPyklMYtNpDsIwT
	Uz+ZEZWIlwzfCMaM0xFykMmnyEZjWXV3ZQYOaGu50VDMdaNKvZQZcWu0XomQX6SOG7KithGMZg
	s3mg5PYlryNyOYX+eyMspP07JKEwqecGPyxrTZfdSp86jfTDHsUszoTGhE8cDXnWL0xsOUjbsI
	YXsUTOuALaJorT+HylPuQkDj/kYs5FMiQ9IfSnLhDRNI3AXWOsEa2AGSm1qyjnXwsZ1SZ4uD8T
	mB9rjZGpubTCamsL3+zDIEpI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Aug 2019 14:32:46 -0700
IronPort-SDR: N35+ufUubFcQlQjFhJEknM8HWAtjeun6Cu++yWX8hro9s90Vi4IzKBcSydao8nULO8kSx+gO5T
	eIaswx1jydEtnEC/j5sJkEpS2IPEbGXyNpQ2wnFoBq4ee/LJ6gkh4oXfdVgRfBHLkz+dzvCkNW
	pPqPfDlpyiATMr0nhmrGByqKWoDB/iVnfBmK7beN5OcmT+QDu/8ZTv/wKMCEXW36qnn0mZDqOP
	hkJQKsh8fsz7MpnQVZUZlhisGMvReTiQhXLC0b3ZXxV7wuAuxrSQWsCH503Nukzbh4eSAD+TIv
	rGU=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 15 Aug 2019 14:35:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2019 14:31:44 -0700
Message-Id: <20190815213145.8986-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815213145.8986-1-alistair.francis@wdc.com>
References: <20190815213145.8986-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] scripts/runqemu: Add support for the BIOS variable
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
X-List-Received-Date: Thu, 15 Aug 2019 21:45:15 -0000
Content-Transfer-Encoding: 8bit

Add support for specifying a BIOS the same way that the KERNEL variable
is specified. This includes specifying a QB_DEFAULT_BIOS variable.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 scripts/runqemu | 53 +++++++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index df3c8aad08..e9b83737cb 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -59,6 +59,7 @@ def print_usage():
 Usage: you can run this script with any valid combination
 of the following environment variables (in any order):
   KERNEL - the kernel image file to use
+  BIOS - the bios image file to use
   ROOTFS - the rootfs image file or nfsroot directory to use
   DEVICE_TREE - the device tree blob to use
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
@@ -77,8 +78,6 @@ of the following environment variables (in any order):
     audio - enable audio
     [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
   tcpserial=<port> - specify tcp serial port number
-  biosdir=<dir> - specify custom bios dir
-  biosfilename=<filename> - specify bios filename
   qemuparams=<xyz> - specify custom parameters to QEMU
   bootparams=<xyz> - specify custom kernel parameters during boot
   help, -h, --help: print this text
@@ -129,6 +128,7 @@ class BaseConfig(object):
         self.env_vars = ('MACHINE',
                         'ROOTFS',
                         'KERNEL',
+                        'BIOS',
                         'DEVICE_TREE',
                         'DEPLOY_DIR_IMAGE',
                         'OE_TMPDIR',
@@ -155,6 +155,7 @@ class BaseConfig(object):
         self.qemuboot = ''
         self.qbconfload = False
         self.kernel = ''
+        self.bios = ''
         self.kernel_cmdline = ''
         self.kernel_cmdline_script = ''
         self.bootparams = ''
@@ -171,7 +172,6 @@ class BaseConfig(object):
         self.saved_stty = ''
         self.audio_enabled = False
         self.tcpserial_portnum = ''
-        self.custombiosdir = ''
         self.taplock = ''
         self.taplock_descriptor = None
         self.portlocks = {}
@@ -480,10 +480,6 @@ class BaseConfig(object):
                 self.qemu_opt_script += ' -vnc :0'
             elif arg.startswith('tcpserial='):
                 self.tcpserial_portnum = '%s' % arg[len('tcpserial='):]
-            elif arg.startswith('biosdir='):
-                self.custombiosdir = arg[len('biosdir='):]
-            elif arg.startswith('biosfilename='):
-                self.qemu_opt_script += ' -bios %s' % arg[len('biosfilename='):]
             elif arg.startswith('qemuparams='):
                 self.qemuparams = ' %s' % arg[len('qemuparams='):]
             elif arg.startswith('bootparams='):
@@ -725,25 +721,30 @@ class BaseConfig(object):
             if not os.path.exists(self.dtb):
                 raise RunQemuError('DTB not found: %s, %s or %s' % cmds)
 
-    def check_biosdir(self):
-        """Check custombiosdir"""
-        if not self.custombiosdir:
+    def check_bios(self):
+        """Check and set bios"""
+
+        # See if the user supplied a BIOS option
+        if self.get('BIOS'):
+            self.bios = self.get('BIOS')
+
+        # QB_DEFAULT_BIOS is always a full file path
+        bios_name = os.path.basename(self.get('QB_DEFAULT_BIOS'))
+
+        # The user didn't want a bios to be loaded
+        if (bios_name == "" or bios_name == "none") and not self.bios:
             return
 
-        biosdir = ""
-        biosdir_native = "%s/%s" % (self.get('STAGING_DIR_NATIVE'), self.custombiosdir)
-        biosdir_host = "%s/%s" % (self.get('STAGING_DIR_HOST'), self.custombiosdir)
-        for i in (self.custombiosdir, biosdir_native, biosdir_host):
-            if os.path.isdir(i):
-                biosdir = i
-                break
+        if not self.bios:
+            deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
+            self.bios = "%s/%s" % (deploy_dir_image, bios_name)
+
+            if not self.bios:
+                raise RunQemuError('BIOS not found: %s' % bios_match_name)
+
+        if not os.path.exists(self.bios):
+            raise RunQemuError("KERNEL %s not found" % self.bios)
 
-        if biosdir:
-            logger.debug("Assuming biosdir is: %s" % biosdir)
-            self.qemu_opt_script += ' -L %s' % biosdir
-        else:
-            logger.error("Custom BIOS directory not found. Tried: %s, %s, and %s" % (self.custombiosdir, biosdir_native, biosdir_host))
-            raise RunQemuError("Invalid custombiosdir: %s" % self.custombiosdir)
 
     def check_mem(self):
         """
@@ -811,7 +812,7 @@ class BaseConfig(object):
         self.check_ovmf()
         self.check_kernel()
         self.check_dtb()
-        self.check_biosdir()
+        self.check_bios()
         self.check_mem()
         self.check_tcpserial()
 
@@ -923,6 +924,8 @@ class BaseConfig(object):
         logger.info('Continuing with the following parameters:\n')
         if not self.fstype in self.vmtypes:
             print('KERNEL: [%s]' % self.kernel)
+            if self.bios:
+                print('BIOS: [%s]' % self.bios)
             if self.dtb:
                 print('DTB: [%s]' % self.dtb)
         print('MACHINE: [%s]' % self.get('MACHINE'))
@@ -1339,6 +1342,8 @@ class BaseConfig(object):
             kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
                                                                 self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
                                                                 self.bootparams)
+            if self.bios:
+                kernel_opts += " -bios %s" % self.bios
             if self.dtb:
                 kernel_opts += " -dtb %s" % self.dtb
         else:
-- 
2.22.0


