Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 111647EC92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:26:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z23so4836147wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uH/bSzxQ1kq8N8IFhyoB5+EQcXMZtZDlDI/oEglGD2Q=;
	b=uMaoCcf4wJAHQ0uuDQr+1XMNbcXVAd+jRchqsMSE0/cYyeKVUkgHyiqLzyxdhrGg6/
	2a6yaaU2YtCc7aAhDeVywyJrKwYNSXo+2m+qSJcz7EghdZLUNyq6Eqr/FaQkt5MBK0Cd
	K5muilDiGAiENVtbMZAwIoFFzqUpD121L7LJZBai+abXJ8UAkGCD8arhFXvLQaRZJoTk
	Z+xkisQgfLqn53Z6Yna/ucFjaE+ZfX/wpRbbPQkRaEVxXCI/FNFgIb8lG37sQwDWQGSd
	RGvdSSG4tACGER30HwlqfBw/j6NpfJI+0sl1C1EP1NBOCNXb24dQwAfPWR8OBkgMAK/g
	Y1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uH/bSzxQ1kq8N8IFhyoB5+EQcXMZtZDlDI/oEglGD2Q=;
	b=FDURPi3JYgxTmv70qVd1r+w01/O+6EWTmu5u7nA8nmLyLkNoihqam93Z2MkXV+Mu2g
	oEst8mgesybhS18FRLlQ0wTsoDTx2wdzXxIpEWW34JT/zRC/MtD367n0ohrh1cD6zdKc
	ZqoD/k4ruPKB+/l8xc7Gt2zkKeVA24zooN58x1LseqqE0J+CArNGyG2hmAIOP9M25pDg
	lW9+UzkAIDHvoY8q71b/RgMTn3Rvq0BpSmlRFwVpbAch+YpJ7o+Et0Xx55klsg2F4H7I
	D01kxvet8TeKYg8Fd5ezy3IcXI95TE/cgsoYsNcgWp5fg96mS2rBesCpH+aKPJDWjChj
	hw3A==
X-Gm-Message-State: APjAAAWsIkLteWt4d0kSJ2d1NTZut4aU2mI7eeh1dkUxtmCg12XdVh1R
	9cjDNxpgLnecjt6aZVeJ5wZZzz5ixQk=
X-Google-Smtp-Source: APXvYqwMoAExh+INmxIWYxQbszPmbmcZ0fmIX0R7H6ZjL2jG3+Vha/WGVlYQc1Rmo+G/iQTU+s8mIQ==
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr9261400wmf.176.1565796380547; 
	Wed, 14 Aug 2019 08:26:20 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v12sm66620wrr.87.2019.08.14.08.26.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:26:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 17:26:13 +0200
Message-Id: <20190814152613.46996-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814152613.46996-1-alex.kanavin@gmail.com>
References: <20190814152613.46996-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Wed, 14 Aug 2019 15:26:20 -0000

This is the qemu default since qemu 2.2, is generally supported better,
and is recommended by upstream. It also has already been in use for arm/risc
and ovmf.

Additional information:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466
https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/

'-vga virtio' emulated hardware remains in use when virgl is enabled via a runqemu override.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-mips.inc | 2 +-
 meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
 meta/conf/machine/qemux86-64.conf           | 1 +
 meta/conf/machine/qemux86.conf              | 1 +
 scripts/runqemu                             | 6 ------
 5 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 3a4c8f96f1e..18221dc0a76 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -2,7 +2,7 @@
 IMAGE_CLASSES += "qemuboot"
 QB_MACHINE = "-machine malta"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
-QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 3931b0f0fb3..495418fa04b 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -9,7 +9,7 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
-QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 4b50e664e42..7c70dbddf52 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -24,6 +24,7 @@ XSERVER = "xserver-xorg \
            xf86-video-fbdev \
            xf86-video-vmware \
            xf86-video-modesetting \
+           xf86-video-vesa \
            xserver-xorg-module-libint10 \
            "
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 3832302f07b..8e0da820761 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -24,6 +24,7 @@ XSERVER = "xserver-xorg \
            xf86-video-fbdev \
            xf86-video-vmware \
            xf86-video-modesetting \
+           xf86-video-vesa \
            xserver-xorg-module-libint10 \
            "
 
diff --git a/scripts/runqemu b/scripts/runqemu
index df3c8aad084..8f9a0d7dbb4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -145,8 +145,6 @@ class BaseConfig(object):
         # to be added with -drive if=pflash.
         # Found in the same places as the rootfs, with or without one of
         # these suffices: qcow2, bin.
-        # Setting one also adds "-vga std" because that is all that
-        # OVMF supports.
         self.ovmf_bios = []
         # When enrolling default Secure Boot keys, the hypervisor
         # must provide the Platform Key and the first Key Exchange Key
@@ -1280,10 +1278,6 @@ class BaseConfig(object):
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
             self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
-        if self.ovmf_bios:
-            # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
-            # that gets added for example for normal qemux86.
-            self.qemu_opt += ' -vga std'
 
         self.qemu_opt += ' ' + self.qemu_opt_script
 
-- 
2.17.1


