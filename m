Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6802C60632
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so15817084wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pbLBSTpgYT4Fzn+S5LfBfH9rjxglF+LR+S36cqYcEF0=;
	b=Dndtg/JCZjGDXzSGXxZQNwVNGpuYmGe7hAvgZiMuMFtV7wXS6W5r30uHwDP0vhcjUL
	lsHgndhOstqgNuY0zH7O/xn2vGeDMiL2jIh1zW6Ld2b1pEWceFf2FDcouxXCNaFoemSi
	blfcf9rgtQiApiLYo8VvJuhTIWUtUCoTnupWkmwOm2PLYr+tZP0gS6cpVtWUXzSw1anH
	EZyI0vcyBq2cgACnBcRe6lUCDMUewKy64qCMWJ5zc3IrSwVhhkAURoeO9koCvJWr1Kdd
	GTXddviq3tH/0wmFJJs74NMJWWXhhKMXZg7/zo06GSn0s8GtUGqWtiAKFARdywxWzhFM
	8VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pbLBSTpgYT4Fzn+S5LfBfH9rjxglF+LR+S36cqYcEF0=;
	b=EeNUN5pNkn2gHHyUTM0N3BInNx2YaadXC7TOm793vgqGmvSbVvBEkfFpmhz+bX7cgl
	VCLGvgrvDYAHh6UvYCJEQoGCTjL/3ZFg2VYpPM2JtgvmW4HFnuRg5haQP8fqshYpL3nC
	4f4DW24A5TP6fcUc/Yqqys1zOj4QGC1yTWL4p9LswszQU9CRhmVxWXw/SbS1AX2iTr8N
	jizFZxEH4cyzBnZjg3iogLV0024+3BUgsGBIFiDpWr9vEscFSdaU0tgGXLduqo4eQiu8
	FdtH6JOyxO3mYl9oJZEECbRdfvr8Hqnr/2WzBoB4RSwSMIF9pW3kMyIcqUbBxRaq4F/v
	pI4g==
X-Gm-Message-State: APjAAAWcq8GLrGaHNoqLBAtpf4qhOj8ajcEp+o6vvttSY/oXvnwZW+hE
	Gj2pktUznmnc9QpSG55tR6Pd0c/g
X-Google-Smtp-Source: APXvYqwtOS1kE3weyiMFTOK/i4PCJfaYCPOZX06oqAQhmjb6lFes2EW6k7K/m0fp7FScWShg4Apyxw==
X-Received: by 2002:a1c:b486:: with SMTP id d128mr17046020wmf.69.1581868265520;
	Sun, 16 Feb 2020 07:51:05 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:08 +0100
Message-Id: <20200216155015.21738-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] qemux86: drop resolution setting via uvesafb
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:05 -0000
Content-Transfer-Encoding: 8bit

I am not sure if this has ever worked, but uvesafb is a really
outdated (VBE from the 1990s), awkward (needs v86d) and limited
(no support for high resolutions) way to do it.

The specific reason 640x480-32 was introduced (ages ago) was
to force 32 bit mode with vmware driver, as 16bit had rendering issues.

The modern, supported option is video=... kernel parameter documented here:
https://wiki.archlinux.org/index.php/kernel_mode_setting#Forcing_modes_and_EDID
https://github.com/torvalds/linux/blob/master/Documentation/fb/modedb.rst
which can be passed directly to runqemu and doesn't require special
kernel modules.

Sato under X will continue to use 640x480 as that is hardcoded into
xorg.conf under qemu.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc | 3 +--
 meta/conf/machine/qemux86-64.conf          | 4 ----
 meta/conf/machine/qemux86.conf             | 4 ----
 meta/lib/oeqa/runtime/cases/parselogs.py   | 4 ----
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 049681b27d..5dcc8b6f6b 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -8,9 +8,8 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
-QB_KERNEL_CMDLINE_APPEND = "uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
+QB_KERNEL_CMDLINE_APPEND = "oprofile.timer=1"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
-UVESA_MODE ?= "640x480-32"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 648cf2fe8f..db9004ee32 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -37,10 +37,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
 
-KERNEL_MODULE_AUTOLOAD += "uvesafb"
-KERNEL_MODULE_PROBECONF += "uvesafb"
-module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
-
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 8e0da82076..7e6723b880 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -34,10 +34,6 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
 
-KERNEL_MODULE_AUTOLOAD += "uvesafb"
-KERNEL_MODULE_PROBECONF += "uvesafb"
-module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
-
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
 
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 9dafb89b03..3cad0709a1 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -60,7 +60,6 @@ common_errors = [
     ]
 
 video_related = [
-    "uvesafb",
 ]
 
 x86_common = [
@@ -82,11 +81,8 @@ qemux86_common = [
     "fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.",
     "can't claim BAR ",
     'amd_nb: Cannot enumerate AMD northbridges',
-    'uvesafb: 5000 ms task timeout, infinitely waiting',
     'tsc: HPET/PMTIMER calibration failed',
     "modeset(0): Failed to initialize the DRI2 extension",
-    "uvesafb: cannot reserve video memory at",
-    "uvesafb: probe of uvesafb.0 failed with error",
     "glamor initialization failed",
 ] + common_errors
 
-- 
2.25.0


