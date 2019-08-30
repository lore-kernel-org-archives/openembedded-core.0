Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 838087F428
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b16so6830656wrq.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Qsc3nvlYBw+9HuhWaWb7xuj9BguUzg52rVHY5QBU3uk=;
	b=Gg/cUZ6/i2vFZYyOVeAb4yBsxQCv/Hcf5Do8qFWvI6RefGUP6ntsgemJLPq521dEF/
	uUtIWUPZZTWugSOh+2rrsKfLywigCbfi4OrBf3RZOq8jOJtUy85Lud68tHJ72nwcLgEg
	Rdob4fFqpVYtTdoI4MDm4/mEtbj5VyvHrz0JyXOY8VJfixnbray/QnMnBP0RQAVj/9Ql
	6BuhrnpF9+ombv90s19xh0Eb8kuggzKE8xA9FbXKCk4mx5Wx4FzcJgHklvfIQ7c87vIy
	Nj4DEswmk+YA+bMsGS2pQjkfY7e1YFNFtmExEhQFPo7RsH4b5oNIhS6hcjZcDFtNoedk
	gQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Qsc3nvlYBw+9HuhWaWb7xuj9BguUzg52rVHY5QBU3uk=;
	b=S3AupS/Ut/oRcxbL8RW8MoErMgay+9cLW9hTaDf+f8vuVWpUemIo6e6Sl+4WzsUk/W
	j0/4/O+NbWBSFyuvkJyY7x/3CWvm60YgiKw5MSNc/Cuoq2fg1/b5QAGRPVDk6126we69
	FDII6PmKtugkqYPad8mA9UssAoYlojFMdSp80te5s3rkzL0pXQp47bBQDRCQrbuKJB9L
	9dEqiVK8/8VT+g64jvIpmlH7hl7KKI6ckTJ3t3YMj/BLHtcbqqgHDH701j3JS2sc90Qc
	DBOKwm0cbqS7CSaLs3uLeBQ7UuzFcIlAd+jlEua07itfl9Povb7n/nIljckxbf+0Ulap
	o51Q==
X-Gm-Message-State: APjAAAXxt+qQZbzRvXvZMlpgzxSySPry/BD3YpLb80fzonH2AtrHRYP1
	40ml7PMMJYZP6N66ShJIfJeM2chp
X-Google-Smtp-Source: APXvYqy27ygaillMfsHJfbYheMLratpFEiso3WiKmk5OjuHx2Ci8lQTLC0NjrHVeXleKfX2NNG7RVA==
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr17853479wrv.108.1567169407923; 
	Fri, 30 Aug 2019 05:50:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:48 +0200
Message-Id: <874b5e653ac604a410f2290e0b97ad7acb4a0d39.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 03/13] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:07 -0000

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
 meta/lib/oeqa/runtime/cases/parselogs.py    | 4 ++++
 scripts/runqemu                             | 6 ------
 6 files changed, 8 insertions(+), 8 deletions(-)

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
index 19c9c52a0a9..15343d7abbe 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -83,6 +83,10 @@ qemux86_common = [
     'amd_nb: Cannot enumerate AMD northbridges',
     'uvesafb: 5000 ms task timeout, infinitely waiting',
     'tsc: HPET/PMTIMER calibration failed',
+    "modeset(0): Failed to initialize the DRI2 extension",
+    "uvesafb: cannot reserve video memory at",
+    "uvesafb: probe of uvesafb.0 failed with error",
+    "glamor initialization failed",
 ] + common_errors
 
 ignore_errors = {
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


