Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBE471C0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:07:56 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id l66so2577175ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1dI4+vfg4dw7auIOqSa+Z+kgHuA+mSH7p9GmMKizjbU=;
	b=stEuKbRELm7KhZUlqYVXyKr3ZK16hn1Cwb3q1sqaJzRrQcVRs0zg896Kr8a5qwHhFI
	/bmkCV1Sh5GRA+Kx3SI2Y9Fg5D7I6+sCJkG8iLYGlvfFKhwo9Bdu3+J0to3MUA/Ey4wr
	n58fzlYUzAKcaKBdIhUtmQjaJlTsaMS2MZMOJtEEh+2HmjDBcou/EWzVQ7G6hiH2qh+2
	BX+ou1kAwHPhE7WVnXZ+XJftJnluR+q0+sBkK+Qd+XhNxu2q+QPwqkbmzYkjclAOPbwB
	eQ7wG2pU7auSEBmDqxeJmtj+ArUVdpfj46nyrXW0lXAUNLnTAF4QX45x2cfE8acBsXxi
	bNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1dI4+vfg4dw7auIOqSa+Z+kgHuA+mSH7p9GmMKizjbU=;
	b=bfKCCL9/UG6CnS2EURObJUCBpqs4SkxvcW1Qq3e3WyZDVooqouuwQECcaK5Kl+oRFO
	0SGDCxq6tnlydrheqW20OdWofRCsjy2QSi2SGTJGIQVqkDePES3AAl8T6mhmQsuZhBo3
	omJWtoFiuv+GMM5SZrIAUJ+JlU8+K7E72Qh9eVp54yuWX4EW3QGZn+r2P0O1yCdYUSnZ
	urN9zFKIK+AaEhho2Zl/oBDSBlkdmt/1aq0W6Ip2D4PuxBQXqibvsDjFdublxu9MWEee
	N7X0Ba0wZBHhC36zZRpPi9PTPvOX+JUMbzqigEH3einday0EME+ts1HkwhL0BXoBN4kg
	RJ0w==
X-Gm-Message-State: AIkVDXIIdtlGASr5O4e1VWfP8k5XYQ+DCSRkG7/aPldKsGTla5Ib1SYLSCjshZVT8jpEPhoo
X-Received: by 10.107.178.151 with SMTP id b145mr3929780iof.69.1484064476901; 
	Tue, 10 Jan 2017 08:07:56 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56084.dip0.t-ipconnect.de.
	[87.165.96.132]) by smtp.gmail.com with ESMTPSA id
	m196sm1391971iom.14.2017.01.10.08.07.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:07:55 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:07:25 +0100
Message-Id: <cb54fa727d09a3ae86d5205ed3b784cd69726ef3.1484063948.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484063948.git.patrick.ohly@intel.com>
References: <cover.1484063948.git.patrick.ohly@intel.com>
Subject: [PATCH v2 09/11] runqemu: support UEFI with OVMF firmware
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
X-List-Received-Date: Tue, 10 Jan 2017 16:07:57 -0000

In the simplest case, "runqemu qemux86 <some-image> qcow2 ovmf" for an
EFI-enabled image in the qcow2 format will locate the ovmf.qcow2
firmware file deployed by the ovmf recipe in the image deploy
directory, override the graphics hardware with "-vga std" because that
is all that OVMF supports, and boot with UEFI enabled.

ovmf is not built by default. Either do it explicitly ("bitbake ovmf")
or make it a part of the normal build
("MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = ' ovmf'").

The firmware file is activated as a flash drive instead of using the
qemu BIOS parameters, because that is the recommended method
(https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=764918#47) as it
allows storing UEFI variables in the file.

Instead of just "ovmf", a full path to an existing file can also be
used, just as with the rootfs. That may be useful when making a
permanent copy of the virtual machine data files.

It is possible to specify "ovmf*" parameters more than once, then
each parameter creates a separate flash drive. This way it is possible
to use separate flash drives for firmware code and variables:
$ runqemu qemux86 <some-image> qcow2 ovmf.code ovmf.vars"

Note that rebuilding ovmf will overwrite the ovmf.vars.qcow2 file in
the image deploy directory. So when the goal is to update the firmware
while keeping variables, make a copy of the variable file and use
that:
$ mkdir my-machine
$ cp tmp/deploy/images/qemux86/ovmf.vars.qcow2 my-machine/
$ runqemu qemux86 <some-image> qcow2 ovmf.code my-machine/ovmf.vars.qcow2

When Secure Boot was enabled in ovmf, one can pick that instead of
the non-Secure-Boot enabled ovmf.code:
$ runqemu qemux86 <some-image> qcow2 ovmf.secboot.code my-machine/ovmf.vars.qcow2

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9a5bca9..e14f25e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,7 @@ of the following environment variables (in any order):
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
     publicvnc - enable a VNC server open to all hosts
     audio - enable audio
+    [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
   tcpserial=<port> - specify tcp serial port number
   biosdir=<dir> - specify custom bios dir
   biosfilename=<filename> - specify bios filename
@@ -162,6 +163,13 @@ class BaseConfig(object):
         self.clean_nfs_dir = False
         self.nfs_server = ''
         self.rootfs = ''
+        # File name(s) of a OVMF firmware file or variable store,
+        # to be added with -drive if=pflash.
+        # Found in the same places as the rootfs, with or without one of
+        # these suffices: qcow2, bin.
+        # Setting one also adds "-vga std" because that is all that
+        # OVMF supports.
+        self.ovmf_bios = []
         self.qemuboot = ''
         self.qbconfload = False
         self.kernel = ''
@@ -259,6 +267,7 @@ class BaseConfig(object):
         - Check whether is a kernel file
         - Check whether is a image file
         - Check whether it is a nfs dir
+        - Check whether it is a OVMF flash file
         """
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
@@ -289,6 +298,8 @@ class BaseConfig(object):
             else:
                 logger.info("Assuming %s is an nfs rootfs" % p)
                 self.check_arg_nfs(p)
+        elif os.path.basename(p).startswith('ovmf'):
+            self.ovmf_bios.append(p)
         else:
             raise Exception("Unknown path arg %s" % p)
 
@@ -374,6 +385,8 @@ class BaseConfig(object):
             elif re.search(r'-image-|-image$', arg):
                 # Lazy rootfs
                 self.rootfs = arg
+            elif arg.startswith('ovmf'):
+                self.ovmf_bios.append(arg)
             else:
                 # At last, assume is it the MACHINE
                 if (not unknown_arg) or unknown_arg == arg:
@@ -472,6 +485,20 @@ class BaseConfig(object):
         if not os.path.exists(self.rootfs):
             raise Exception("Can't find rootfs: %s" % self.rootfs)
 
+    def check_ovmf(self):
+        """Check and set full path for OVMF firmware and variable file(s)."""
+
+        for index, ovmf in enumerate(self.ovmf_bios):
+            if os.path.exists(ovmf):
+                continue
+            for suffix in ('qcow2', 'bin'):
+                path = '%s/%s.%s' % (self.get('DEPLOY_DIR_IMAGE'), ovmf, suffix)
+                if os.path.exists(path):
+                    self.ovmf_bios[index] = path
+                    break
+            else:
+                raise Exception("Can't find OVMF firmware: %s" % ovmf)
+
     def check_kernel(self):
         """Check and set kernel, dtb"""
         # The vm image doesn't need a kernel
@@ -562,6 +589,7 @@ class BaseConfig(object):
         self.check_kvm()
         self.check_fstype()
         self.check_rootfs()
+        self.check_ovmf()
         self.check_kernel()
         self.check_biosdir()
         self.check_mem()
@@ -670,6 +698,8 @@ class BaseConfig(object):
             print('NFS_DIR: [%s]' % self.nfs_dir)
         else:
             print('ROOTFS: [%s]' % self.rootfs)
+        if self.ovmf_bios:
+            print('OVMF: %s' % self.ovmf_bios)
         print('CONFFILE: [%s]' % self.qemuboot)
         print('')
 
@@ -926,7 +956,17 @@ class BaseConfig(object):
 
         check_libgl(qemu_bin)
 
-        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'), self.qemu_opt_script)
+        self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
+
+        for ovmf in self.ovmf_bios:
+            format = ovmf.rsplit('.', 1)[-1]
+            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
+        if self.ovmf_bios:
+            # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
+            # that gets added for example for normal qemux86.
+            self.qemu_opt += ' -vga std'
+
+        self.qemu_opt += ' ' + self.qemu_opt_script
 
         if self.snapshot:
             self.qemu_opt += " -snapshot"
-- 
2.1.4


