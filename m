Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 42BF3773F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:11:55 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id x2so51089727itf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EVizroGq0kjGVrNUIVJij71NFAFevlslM7mh2oTQ+r4=;
	b=btN/NdCwDMxFMYrqia43i5of2T/wO70qhgGWP4zJNVGD+a9HtIim/Yxs12BkT78sxf
	D1GJ04xZuSF7H3TRl/f7zbiBV43jc5EUU257FKreoD58LeQoBiqk0W5XVsh+apobdBko
	oKsPiXICh9PeYbgp4r0nfshmqgeXTtcK2riEe7bOgzaGmwtO/hbmOkQJr/MGnwU3FH3H
	tIZ9t4Tx+p3y0VTvyQrEununJ4cXHQxJlHLQk+aLkQaH/9q0Qodz86K5YoMn8dH8DXEN
	zC49DZ4sVwGpPAN4w6ODktw/IzSWBDhaKMai1UOF+rvwkjHW29LKYDhBJ+iegnYGFFmx
	eIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EVizroGq0kjGVrNUIVJij71NFAFevlslM7mh2oTQ+r4=;
	b=mczyhJ0KvrxRBPtFwDwpXmpVPLoYnMfjL7UNlTnZ6F+ES98iV5VJBHAO+mjtdtrwTZ
	C1v2VlMZGlk4uGDnL9nR5uihFNwI7w57Dqx96+tI5DTXeqgDzlh87f+Sdak5ujJ6ijLR
	MucDsGN4ywB77O0hZPnlL1mymSvV1wg1+Ptikzs2IZO9rhqlImO2QnXfqdYLEdiPQP6z
	NDm1Wfm6+k7UZvNelN0x8EW8WJAjbzcg7Rq/bXEi0HosDZUSkN5V4Z7tsytUUG11yUaq
	9v17eTv296hNiu+YTyiiw2C1tjnwy5/LdmivZIi+WFRi1XVOnpyA3wDottBwgOYfC418
	lLCw==
X-Gm-Message-State: AIkVDXLEsb4w2u/z595sxllhBGgg8qHulTEViQ4Jv/TQBgJL2nK34n9PuUbVV4/ZofWKEHnV
X-Received: by 10.36.210.11 with SMTP id z11mr7913011itf.84.1482325917232;
	Wed, 21 Dec 2016 05:11:57 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F3CB.dip0.t-ipconnect.de.
	[93.232.243.203]) by smtp.gmail.com with ESMTPSA id
	o65sm12103726ioe.15.2016.12.21.05.11.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 05:11:56 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	ricardo.neri@intel.com
Date: Wed, 21 Dec 2016 14:11:29 +0100
Message-Id: <66377b2510edebf997b04812ff93c9ef0bb3c47f.1482324587.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
Subject: [PATCH 8/9] runqemu: support UEFI with OVMF firmware
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
X-List-Received-Date: Wed, 21 Dec 2016 13:11:56 -0000

In the simplest case, "runqemu qemux86 <some-image> qcow2 ovmf" for an
EFI-enabled image in the qcow2 format will locate the OVMF firmware file,
override the graphics hardware with "-vga std" because that is all
that OVMF supports, and boot with UEFI enabled. This depends on
"bitbake ovmf" deploying a "ovmf.qcow2" firmware file in the image deploy
directory.

The firmware file is activated as a flash drive instead of using the
qemu BIOS parameters, because that is the recommended method
(https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=764918#47) as it
allows storing UEFI variables in the file.

Instead of just "ovmf", a full path to an existing file can also be
used, just as with the rootfs. That may be useful when making a
permanent copy of the virtual machine data files.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/runqemu | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 203992a..257dcec 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,7 @@ of the following environment variables (in any order):
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
     publicvnc - enable a VNC server open to all hosts
     audio - enable audio
+    [*/]ovmf* - OVMF BIOS file or base name for booting with UEFI
   tcpserial=<port> - specify tcp serial port number
   biosdir=<dir> - specify custom bios dir
   biosfilename=<filename> - specify bios filename
@@ -162,6 +163,12 @@ class BaseConfig(object):
         self.clean_nfs_dir = False
         self.nfs_server = ''
         self.rootfs = ''
+        # File name of a OVMF BIOS file, to be added with -drive if=pflash.
+        # Found in the same places as the rootfs, with or without one of
+        # these suffices: qcow2, bin.
+        # Setting one also adds "-vga std" because that is all that
+        # OVMF supports.
+        self.ovmf_bios = ''
         self.qemuboot = ''
         self.qbconfload = False
         self.kernel = ''
@@ -369,6 +376,8 @@ class BaseConfig(object):
                 self.qemu_opt_script += ' %s' % arg[len('qemuparams='):]
             elif arg.startswith('bootparams='):
                 self.kernel_cmdline_script += ' %s' % arg[len('bootparams='):]
+            elif os.path.basename(arg).startswith('ovmf'):
+                self.ovmf_bios = arg
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
                 self.check_arg_path(os.path.abspath(arg))
             elif re.search('-image-', arg):
@@ -472,6 +481,20 @@ class BaseConfig(object):
         if not os.path.exists(self.rootfs):
             raise Exception("Can't find rootfs: %s" % self.rootfs)
 
+    def check_ovmf(self):
+        """Check and set full path for OVMF BIOS file."""
+
+        if self.ovmf_bios is None or os.path.exists(self.ovmf_bios):
+            return
+
+        for suffix in ('qcow2', 'bin'):
+            ovmf_bios = '%s/%s.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.ovmf_bios, suffix)
+            if os.path.exists(ovmf_bios):
+                self.ovmf_bios = ovmf_bios
+                return
+
+        raise Exception("Can't find OVMF BIOS: %s" % self.ovmf_bios)
+
     def check_kernel(self):
         """Check and set kernel, dtb"""
         # The vm image doesn't need a kernel
@@ -562,6 +585,7 @@ class BaseConfig(object):
         self.check_kvm()
         self.check_fstype()
         self.check_rootfs()
+        self.check_ovmf()
         self.check_kernel()
         self.check_biosdir()
         self.check_mem()
@@ -670,6 +694,8 @@ class BaseConfig(object):
             print('NFS_DIR: [%s]' % self.nfs_dir)
         else:
             print('ROOTFS: [%s]' % self.rootfs)
+        if self.ovmf_bios:
+            print('OVMF: [%s]' % self.ovmf_bios)
         print('CONFFILE: [%s]' % self.qemuboot)
         print('')
 
@@ -926,7 +952,16 @@ class BaseConfig(object):
 
         check_libgl(qemu_bin)
 
-        self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'), self.qemu_opt_script)
+        self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
+
+        if self.ovmf_bios:
+            format = self.ovmf_bios.rsplit('.', 1)[-1]
+            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, self.ovmf_bios)
+            # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
+            # that gets added for example for normal qemux86.
+            self.qemu_opt += ' -vga std'
+
+        self.qemu_opt += ' ' + self.qemu_opt_script
 
         if self.snapshot:
             self.qemu_opt += " -snapshot"
-- 
2.1.4


