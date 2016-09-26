Return-Path: <bounce+05c21e.62d95b-openembedded-core=lists.openembedded.org@nathanrossi.com>
Received: from rs224.mailgun.us (rs224.mailgun.us [209.61.151.224])
	by mail.openembedded.org (Postfix) with ESMTP id 697936060F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 15:34:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=nathanrossi.com;
	q=dns/txt; 
	s=pic; t=1474904055; h=Message-Id: Date: Subject: Cc: To: From: Sender; 
	bh=Df8eXtwnuQD3C6W3ecJea55VuqlLGkz99GUnnckJGxc=;
	b=BkDCT/6JLT2cWSxhkvQmKnGRVMicZd++NyLQg8JqV7wl+dpkrwiWo3fLENdMdJ1FarCo9h8h
	Q9or6H56R5NUpw20S8yJODnfXz7nhRx6NSwCLOOi70a3Q2Y9tsa5t4UgHwbmiVz1rhANWst/
	/FuzkyU7bGZpeG4dxiiX2aB1szo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nathanrossi.com; s=pic;
	q=dns; h=Sender: From: To: Cc: Subject: Date: Message-Id;
	b=cjoAyOec872OHYdp4yHFX1XS4OfNELjvyawE/6YeTbUsWF7iCy6grLGpD+LSDGELNCr7kv
	7UUvQ7I/mTO3ukBIohrIDwNHTgmNw2QA+FuMBhh2ByJbFYg1hJap7VJp7afzvwyf7IpLoyd7
	B++g/UU15O8Sy6jNKbtda5DvhXQAc=
Sender: nathan@nathanrossi.com
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyI4NjhkNiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjYyZDk1YiJd
Received: from nathanbox.home.rossihq.com
	(CPE-124-186-123-69.lns10.woo.bigpond.net.au [124.186.123.69])
	by mxa.mailgun.org with ESMTP id 57e93ff5.7f035c5139b0-in01;
	Mon, 26 Sep 2016 15:34:13 -0000 (UTC)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 01:33:57 +1000
Message-Id: <20160926153357.30247-1-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] machine/qemu*: Add comment regarding the reason for virtio-rng-pci
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
X-List-Received-Date: Mon, 26 Sep 2016 15:34:15 -0000

Bring across the comment that was in runqemu regarding why the
virtio-rng-pci device was needed. This comment is added to each location
where the virtio-rng-pci device is added.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
This patch is due to a review comment where Khem suggested on a previous
patch that the script comment should be carried with the moving of where
"-device virtio-rng-pci" was added. That patch
(e890c05e66a21702e9e8ccce794b74cb7f5518ed) appears to have already been
merged so instead of a v2 to that this is the follow up.
---
 meta/conf/machine/include/qemuboot-mips.inc | 1 +
 meta/conf/machine/include/qemuboot-x86.inc  | 1 +
 meta/conf/machine/qemuarm.conf              | 1 +
 meta/conf/machine/qemuarm64.conf            | 1 +
 meta/conf/machine/qemuppc.conf              | 1 +
 5 files changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 01f8f8bb3b..0c60cf297f 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -3,5 +3,6 @@ IMAGE_CLASSES += "qemuboot"
 QB_MEM = "-m 256"
 QB_MACHINE = "-machine malta"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
 QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 20e90716db..06ac983d4d 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -11,4 +11,5 @@ QB_CPU_KVM_x86-64 = "-cpu kvm64"
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index ff1ab7d48f..17402ef3b3 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -14,6 +14,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0 115200;ttyAMA1"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
 PREFERRED_VERSION_linux-yocto ??= "4.8%"
 QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index a0920fe0e4..d0750624a8 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -15,6 +15,7 @@ QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 3ae33088ea..8703c2086a 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -16,5 +16,6 @@ QB_SYSTEM_NAME = "qemu-system-ppc"
 QB_MACHINE = "-machine mac99"
 QB_CPU = "-cpu G4"
 QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-pci,netdev=net0,mac=@MAC@"
-- 
2.9.3

