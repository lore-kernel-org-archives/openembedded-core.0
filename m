Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 795EC7EE97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:24:48 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f72so483567wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CqVpP1L9FTlHGn0AiKUg2UqJLC8ajCyhmCjkY7twi4c=;
	b=X3UBJQGTRCxXPcRTe2RIBCeFT1I00Dh44ILga++Hwc08+AivNogS2GJPcdJIxUJ6EO
	8ShKrnA7zuaz+x2+X4YeuHTjuqWcQGL8UMvAgOJqXZ8s98VppOG8g5Hxk7/rOjrEX8aV
	FVwV5+oAsCOppXi0cgdpji8guGPTI0P3GabW1uBOz1XWwvkfEjWCiXlrTdsYl3j2/hdX
	AKvEgCcEeiqcQAT2wfUZdI1fS1j/a3/PfgMH6pAl3Kls18kZLz7x+oQZNGxZIMTH6C3W
	lp6CXWgiLLbQTCA4vTnH1R5IyAS7psB8CjbJTKNE6TlkSPtXQqmYFUflPWaCDDcsCBm5
	4v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CqVpP1L9FTlHGn0AiKUg2UqJLC8ajCyhmCjkY7twi4c=;
	b=LLIm8LgDXzVm9UZduwPTGLSNEL+q9N/iCdt31UAFDp934HYLuxJzhSozftdCeLXfyP
	Y8RxaC7jTLR2eFgwx4hcvdpBTEBsa0YqehARCFF5i8RUMfBChXYo42Fu39El2UdXDqUp
	Uyz9Gk1s97o/UvErSGdZpOdsXhxwEG0N+4w5BYYA36Y9xpvOmGOLrUB2fqKhXJg5oddg
	UoPCHQLQE/Woh7I1DAvrp+cYv7ptaTV/F3aa7VVQDlpIbE5qi6QtHNaP6a9e7EwdGbYn
	Vh6X8hUVBnfkbpd1WT8qKibdzZ6UADBrmSeEMp56+1WepbuE7k90ZFSdixEmkF1iNuw7
	Q3Fg==
X-Gm-Message-State: APjAAAUzhr5re6GufJ87GOlopP0O7GGwJgo84dJdvSCcb8MOQPzo0ME5
	GeKHykTaXjIlVUK2QTmuCzmj9g4R
X-Google-Smtp-Source: APXvYqz2Bu00w58egkyEfC4MgtFls/Wzs3wGrhrBAyhnaUcaST2wjo6mnik93W0IGU2Ot3c7RdebFg==
X-Received: by 2002:a1c:f703:: with SMTP id v3mr5423876wmh.107.1567005888841; 
	Wed, 28 Aug 2019 08:24:48 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id w5sm2207074wmm.43.2019.08.28.08.24.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 08:24:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 17:24:39 +0200
Message-Id: <20190828152440.70861-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828152440.70861-1-alex.kanavin@gmail.com>
References: <20190828152440.70861-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/4] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Wed, 28 Aug 2019 15:24:48 -0000

This is the qemu default since qemu 2.2, is generally supported better,
and is recommended by upstream. It also has already been in use for arm/risc
and ovmf.

Additional information:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466
https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/

'-vga virtio' emulated hardware remains in use when virgl is enabled via a runqemu override.

Also, adjust the error whitelist, as there is a number of new messages
coming from the drivers that are not actual errors.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-mips.inc | 2 +-
 meta/conf/machine/include/qemuboot-x86.inc  | 2 +-
 meta/conf/machine/qemuarm.conf              | 2 +-
 meta/conf/machine/qemuarm64.conf            | 2 +-
 meta/conf/machine/qemux86-64.conf           | 1 +
 meta/conf/machine/qemux86.conf              | 1 +
 meta/lib/oeqa/runtime/cases/parselogs.py    | 6 +++++-
 scripts/runqemu                             | 6 ------
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 1c2b532b482..978820a2e0b 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -2,6 +2,6 @@
 IMAGE_CLASSES += "qemuboot"
 QB_MACHINE = "-machine malta"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
-QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
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
 
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 26f40b14194..49daa7c6ef6 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -16,7 +16,7 @@ QB_CPU = "-cpu cortex-a15"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
+QB_OPT_APPEND = "-show-cursor"
 QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Add the virtio RNG
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index ec2a887bddf..05f0ee5e66f 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -17,7 +17,7 @@ QB_CPU_KVM = "-cpu host"
 # Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
-QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
+QB_OPT_APPEND = "-show-cursor"
 QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
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
 
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 19c9c52a0a9..0002730d46f 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -55,7 +55,11 @@ common_errors = [
     "Failed to read /var/lib/nfs/statd/state: Success",
     "error retry time-out =",
     "logind: cannot setup systemd-logind helper (-61), using legacy fallback",
-    "Error changing net interface name 'eth0' to "
+    "Error changing net interface name 'eth0' to ",
+    "modeset(0): Failed to initialize the DRI2 extension",
+    "uvesafb: cannot reserve video memory at",
+    "uvesafb: probe of uvesafb.0 failed with error",
+    "glamor initialization failed"
     ]
 
 video_related = [
diff --git a/scripts/runqemu b/scripts/runqemu
index 7705b2b60e3..b5200106244 100755
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
@@ -1283,10 +1281,6 @@ class BaseConfig(object):
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


