Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44FB078616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 10:14:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IAEZ1D005254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 03:14:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 Aug 2017 03:14:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Aug 2017 18:19:14 +0800
Message-ID: <5ccfcc19142f794ca7ef7eafd221390d9a54fe69.1503049300.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1503049300.git.Qi.Chen@windriver.com>
References: <cover.1503049300.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qemu conf: replace deprecated option with new option
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
X-List-Received-Date: Fri, 18 Aug 2017 10:14:34 -0000
Content-Type: text/plain

Replace the deprecated '-usbdevice' option with '-device usb-xx' option.
This would fix runqemu boot error like below.

  '-usbdevice' is deprecated, please use '-device usb-...' instead

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/machine/include/qemuboot-mips.inc | 2 +-
 meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
 meta/conf/machine/qemuarm.conf              | 2 +-
 meta/conf/machine/qemuppc.conf              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 0c60cf2..7d9fa52 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -4,5 +4,5 @@ QB_MEM = "-m 256"
 QB_MACHINE = "-machine malta"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
+QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet -device virtio-rng-pci"
 QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index acf9d55..0596e2e 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -12,7 +12,7 @@ QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
+QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet -device virtio-rng-pci"
 
 KERNEL_MODULE_AUTOLOAD += "uvesafb"
 KERNEL_MODULE_PROBECONF += "uvesafb"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 6b875e4..1f0a65f 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -15,6 +15,6 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet -device virtio-rng-pci"
 PREFERRED_VERSION_linux-yocto ??= "4.10%"
 QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index a9ef64b..537b2f6 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -17,5 +17,5 @@ QB_MACHINE = "-machine mac99"
 QB_CPU = "-cpu G4"
 QB_KERNEL_CMDLINE_APPEND = "console=tty console=ttyS0"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet -device virtio-rng-pci"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
-- 
1.9.1


