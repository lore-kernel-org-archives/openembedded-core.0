Return-Path: <prvs=128332a65=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1EA7C617
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1566334976; x=1597870976;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=MObvgGbS7W3DhrT1L3+sehn8PKBVX7qsIFFTGXffvnY=;
	b=igbkxDSkeWwxzVrsD1CVlhJ72U/ASRol49N2N/wM6cUcw/J753Lw2/kR
	o+wDAlai0PAatSGVR4wnHbM2c1J33vnD/rz6FKvdFiE2DtygHzQi1x2yV
	18hIqeem7QkWARxElXjxX8PMvc5TuJSvWPVHEb5p1ptX+SnpzdlrpEjrO
	j73pji3Oj/bmsjm46z87EscI5TGyKtr7xX3D0Ip3XMDoCsyJyxbLD0nve
	WL1IKfqbu/X1HeKWfxVrEXslMeKwc1zWVxMgv47T8o8RkO1+KrUVIHj7F
	Ksmf089VkWTFAQGlDDaauxrlnBdOFw95Xw9pByv1Lu8ns/RSBy89EGYZa g==;
IronPort-SDR: MgIVg5g0KHv0qB3OdqL2Ci6VcgPUkbZKgtur4JOh1bdKswrRsiGAzXllUtpqu8PsCv2lAovHsR
	RRQ2hwJWU6a+wOnovWa9d52WdWoN01KqGsHoGbJzHZY3azSyPkNaxhAVpuJqRLTVSWm5Y9TEtA
	mHgYXDeVKHeyn4StJKnpbKiKeMbLozigbiAS27jJ7JUonV6uOZXaxBliXdK7nW6KOVmG0I9Ymf
	p9n5eXbL+5W5HHYOWuIkhgBFx7diiz5IXDJx6b9igqCMJOhtX/nJlYx1uvF+M1comPHjO++N9d
	rZc=
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="120872827"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 05:02:55 +0800
IronPort-SDR: mXJIuqVcW1tEgXEyD9KY+o3DbL8y1meeMAWAOfoRK440M8SHAgzkY3ZQ18PWO3DzAaBnzuU15w
	DDosqw9pD57MmZCIRvG6oeoXyTEeqrPOVV33nKTt0o00J7HWDmYgoE7IosccIC7D+GNGp0/UqL
	+gGLYZx+kVfuVY1S1Q+72K9/uK03hHxMPSfln7+WTvlBAF8BCLjMvpBi7GJQlo5vjDzLzgqHiS
	adJhByqEyOA3zaGUqiXNKuWEQx2JHDgs0ZA9nVxANy0AzpDyt0LaOGpswzEjK6hG5HKXrq0foR
	H1VpFV1CGdbfuSi8QpZGNb5U
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	20 Aug 2019 14:00:16 -0700
IronPort-SDR: WUJeWZNs2A3ACSIlEVawPLFMEJj/zLSHZc8nZwygLHy9X4vP8fGi9/gQTZVn+xKP5o69vv7E0o
	LAlmk37dhSAS+8rVS9PYozl/uLTwP1i9OciMkO4PXPSETfBi3yWVBWHk3mBPFpati0jUMaHyvM
	YIGeGbbtjFVfKHiKEQeUykg3YIMMvtJn3j9xf431W1uRl+aMfZB0Ep6YnJtAP0Hg70QO3Fy1aW
	RzgPQKFVxaoJiBpkT5Y3o1efDlUyXedouShXyC1H3OBjREepJKzkD+S+ogCURcAuYf2EtX0+PQ
	DK0=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 20 Aug 2019 14:02:54 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 13:59:16 -0700
Message-Id: <20190820205917.21297-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820205917.21297-1-alistair.francis@wdc.com>
References: <20190820205917.21297-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/3] scripts/runqemu: Add support for the BIOS variable
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
X-List-Received-Date: Tue, 20 Aug 2019 21:02:53 -0000
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


