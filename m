Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 58C2E7EB92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:27 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id i63so3031987wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iwpH1YTc/HAALJX/08lVxk887J/4QtHM102Y9KcLI5c=;
	b=imxbBch1cC8vdSD4VxwVAm9A2Bc6PfKSKCiluzoncbzSo7I4Z+yV2sn/7nsktL5kxn
	IUfk//uyWI0oxqHy+XrEO9YUBMjovbvgLhMCyCLv4KP9jWKH0N5M8yT3dAe+/Uy2OClq
	VKMg0vWV/NCG9dUMiM6XueDDqgdJQCufCnVRikyPMrIF/Sz2vwvtUIDq7V7WuF7qzGju
	pXZGG0u1QEwhV5kHLsA9Mgimq5R2zJGonjNEXR3XzwHvEE2HcNzsbapeop6BffYevNp+
	Q22S5qfuu+7uIZNn4k/MkCDgX1InPmEvJrDNM0dGE34OmRkvkddIxhG3806Qy44Bq2cH
	mTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iwpH1YTc/HAALJX/08lVxk887J/4QtHM102Y9KcLI5c=;
	b=bjgDHNtXwvhXaGawyYuNi8mOS6gfk3/Xsq2tCvMd3GKDiA8dNNpzxqoZdDgSAEe74s
	aPLkP8GkUabzNALOXB5NIvHtZvoDKUChtygkpJS8UBCSuMJF3qlEg9qlfK9y6vz/7dBr
	7zC5lYv3FsHb7LPTKLC2K02g35Yg7OBxXvX09U2lACBkMvprDWmZLXgbXT1qRVunUQ0R
	Rt466xWvnfDhkjvEVmwWepay50271uNhNnHOt5txXlrLQTyfgsO6J6x5PRb3Eo6JWaIS
	pPffKqlSmmfKiAyY8FPQaXhcIuOfs/9rQOzy8aKqN3B4AV4kB63mMQ2PiRapSkErW4Qp
	pwqA==
X-Gm-Message-State: APjAAAV4/geYUSQptfb4QvMBeShxve2+bW/8R+T46LWxTCGiH2GaV7tw
	zNt03yq/Slqat8MbiSnjstE2UtV/bFk=
X-Google-Smtp-Source: APXvYqwQtcxQ/n+JK+3adZ/z4LQwxRoSbC1GJ71B5V+jIixbTfJ170T5IsP6Z5WJOXP/XJss9kocnQ==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr615087wml.77.1566315147739;
	Tue, 20 Aug 2019 08:32:27 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:09 +0200
Message-Id: <20190820153219.62435-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/12] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:27 -0000

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
 meta/conf/machine/qemux86-64.conf           | 1 +
 meta/conf/machine/qemux86.conf              | 1 +
 meta/lib/oeqa/runtime/cases/parselogs.py    | 5 ++++-
 scripts/runqemu                             | 6 ------
 6 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 75bb98861f8..a8f8a39bfec 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -3,7 +3,7 @@ IMAGE_CLASSES += "qemuboot"
 QB_MEM = "-m 256"
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
 
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 19c9c52a0a9..ec10393790b 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -55,7 +55,10 @@ common_errors = [
     "Failed to read /var/lib/nfs/statd/state: Success",
     "error retry time-out =",
     "logind: cannot setup systemd-logind helper (-61), using legacy fallback",
-    "Error changing net interface name 'eth0' to "
+    "Error changing net interface name 'eth0' to ",
+    "modeset(0): Failed to initialize the DRI2 extension",
+    "uvesafb: cannot reserve video memory at",
+    "uvesafb: probe of uvesafb.0 failed with error"
     ]
 
 video_related = [
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


