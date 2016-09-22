Return-Path: <bounce+05c21e.62d95b-openembedded-core=lists.openembedded.org@nathanrossi.com>
Received: from rs224.mailgun.us (rs224.mailgun.us [209.61.151.224])
	by mail.openembedded.org (Postfix) with ESMTP id E562071979
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 13:58:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=nathanrossi.com;
	q=dns/txt; 
	s=pic; t=1474552707; h=Message-Id: Date: Subject: Cc: To: From: Sender; 
	bh=n0VUa/27lCEsdKCg2qTLSGpaIQq97DeXxnQ3N8m991Y=;
	b=lkV9zSey6N59jAG3aoZzAZeuleM5Otwv+m6PlAn/8isUYNXQliVDM3uqm/zb4Qm3W57qFHOh
	0s/2yC1uKmNvDfNT5/lnagskSzfx+5SpuZDL3fjx9N6zokpV/76kkbkiq1M0AEOQ77VBde3T
	DuilY9mZ3mC8kXnDNtZ4ygydvow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nathanrossi.com; s=pic;
	q=dns; h=Sender: From: To: Cc: Subject: Date: Message-Id;
	b=BCVyWIAQidx9ATF0f+eJp42QkUF6uMZiHiY65tGCSO/vS0am1+08SvVgpiBNTctSGT48c/
	K3WGejGg418svOSNmRfXhu3FIse7jZ+Yi9URAoitTATeIKrDPydk0I03WVIqQaCG15ngZarH
	4URLNivq9YBaApTlvHBhUnp+JbqWA=
Sender: nathan@nathanrossi.com
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyI4NjhkNiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjYyZDk1YiJd
Received: from nathanbox.home.rossihq.com
	(CPE-124-186-123-69.lns10.woo.bigpond.net.au [124.186.123.69])
	by mxa.mailgun.org with ESMTP id 57e3e252.7f2be46fd670-in2;
	Thu, 22 Sep 2016 13:53:22 -0000 (UTC)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2016 23:53:00 +1000
Message-Id: <20160922135301.21195-1-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 1/2] runqemu: Move virtio RNG to machine configuration
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
X-List-Received-Date: Thu, 22 Sep 2016 13:58:30 -0000

Not all QEMU machines (outside of those available in OE-Core) are
capable of using the virtio-rng-pci device due to various machine models
not having a pci/virtio bus. This makes it such that the use of the
'-device virtio-rng-pci' flag to QEMU is machine specific.

This patch removes the general addition of the flag to all runqemu
targets and adds the flag into the QB_OPT_APPEND for all the qemu*
machines in OE-Core that support its use (which is all of them).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/machine/include/qemuboot-mips.inc | 2 +-
 meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
 meta/conf/machine/qemuarm.conf              | 2 +-
 meta/conf/machine/qemuarm64.conf            | 2 +-
 meta/conf/machine/qemuppc.conf              | 2 +-
 scripts/runqemu                             | 3 ---
 6 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 0f04b81443..01f8f8bb3b 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -3,5 +3,5 @@ IMAGE_CLASSES += "qemuboot"
 QB_MEM = "-m 256"
 QB_MACHINE = "-machine malta"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
-QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet"
+QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
 QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 221cc95052..20e90716db 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -11,4 +11,4 @@ QB_CPU_KVM_x86-64 = "-cpu kvm64"
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
-QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet"
+QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 4c5891ab7c..ff1ab7d48f 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -14,6 +14,6 @@ SERIAL_CONSOLES = "115200;ttyAMA0 115200;ttyAMA1"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
-QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
+QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
 PREFERRED_VERSION_linux-yocto ??= "4.8%"
 QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index da59c338e4..a0920fe0e4 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -15,7 +15,7 @@ QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
-QB_OPT_APPEND = "-show-cursor"
+QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index e54c3dd18f..3ae33088ea 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -16,5 +16,5 @@ QB_SYSTEM_NAME = "qemu-system-ppc"
 QB_MACHINE = "-machine mac99"
 QB_CPU = "-cpu G4"
 QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
-QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
+QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-pci,netdev=net0,mac=@MAC@"
diff --git a/scripts/runqemu b/scripts/runqemu
index 658f7c8abd..2ed6f9a26e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -900,9 +900,6 @@ class BaseConfig(object):
 
         self.qemu_opt = "%s %s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.qemu_opt_script, self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
-        # Enable virtio RNG else we can run out of entropy in guests
-        self.qemu_opt += " -device virtio-rng-pci"
-
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
-- 
2.9.3

