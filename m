Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 103907C07B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m22so9212546wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8JrBR7YGASC4vqLl+AVmLnMGR9nxcttZGJK5QdHEB3I=;
	b=Nh4FsDU6PsNFr4OJ6m/XurxG5KuYyrq9uaMo4yf6TRkgJYiX3rJ+bf2IbeoThFq8q6
	08g5J5bceaL3EfyKMyCl9fNMDVCw8OcPduewzNQdd/cPKMfjgXlEq3PiilTsHuKK3xZO
	56g7WCx2dx3Vjn20o3WxrPHCo2poy8X0kYrAzrkdhKKdO8Av5SS80BD/F6zfoFaUIVip
	C6hBGxcK1CJQI1er4r+x8sQKz94qerWGUwflC+f2FCeKj/NXulZfC5GAmp4EsIibxfg1
	WDhRyJDprJGmbYlmvi9sBf9TPfEpSBmyhhMw5HhJdOaopETz+NI8vWXu2ai42NHMLq/Y
	VAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8JrBR7YGASC4vqLl+AVmLnMGR9nxcttZGJK5QdHEB3I=;
	b=UuArMPu841JFOFs42ON0XB9ErKySzx4dCcRUJQu0F8HSWeFuUivBMxfAvpJUetIAe1
	Z9LxpVCcVgklgTuxgkRo50KdPmZribOcxjkoZotgxthRQ1zeA6tMDpn9iyjg6JzPCMCK
	ek+OjUZJLoBHkyPQG7nIDe9g3B+OwgxwC/YFxxbNdILtApK3ghGUxzaeXcbmMTin6OMY
	Bmef6xMcn3phEdcerPEylhpqDKfBao7tusfWk3fxtBYgReSn4cc67+Rcz7jatYa/Whm2
	mEPkpuq74xdG81z6bYdWNH1TAYf86F0H6tnueP54s+o9hdrc2JtkFZWLe6j6kHVpvts4
	hn+A==
X-Gm-Message-State: AJcUukdW3kiT6V3fn5a6vqshGEQCvQ1hMnmGXzXZTcHiQG9LIX1pa57l
	e0X5UZUs/YjPDXIfYLKpEcOpAg4G
X-Google-Smtp-Source: ALg8bN76ZDpiMMVlnewpDVQU95m9O+geHcgljIwT1JURXrmE1bMRLAwAfsR9St4Tgklx4s86dQgILg==
X-Received: by 2002:a1c:8acd:: with SMTP id
	m196mr12293170wmd.120.1547478223665; 
	Mon, 14 Jan 2019 07:03:43 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:16 +0100
Message-Id: <b592c36a7bc200f1058adc383f9ee3338a569a98.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 20/23] runqemu: add support for virgl GL acceleration
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:43 -0000

Also, do not hardcode -vga option to qemu, set it according to command line parameters.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc |  2 +-
 scripts/runqemu                            | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 5fdbe4df50e..574b7bbfc7d 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -11,7 +11,7 @@ QB_CPU_KVM_x86-64 = "-cpu core2duo"
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=${UVESA_MODE} oprofile.timer=1 uvesafb.task_timeout=-1"
-QB_OPT_APPEND = "-vga vmware -show-cursor -usb -device usb-tablet"
+QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 
diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca811d9..fa88dc4583c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,8 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    gl - enable virgl-based GL acceleration
+    gl-es - enable virgl-based GL acceleration, using OpenGL ES
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
@@ -427,12 +429,21 @@ class BaseConfig(object):
                 sys.argv.remove(quiet)
 
         unknown_arg = ""
+        if 'gl' not in sys.argv[1:] and 'gl-es' not in sys.argv[1:]:
+            self.qemu_opt_script += ' -vga vmware'
         for arg in sys.argv[1:]:
             if arg in self.fstypes + self.vmtypes:
                 self.check_arg_fstype(arg)
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
+            elif arg == 'gl':
+                self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
+            elif arg == 'gl-es':
+                self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
+            elif arg == 'nographic':
+                self.qemu_opt_script += ' -nographic'
+                self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
-- 
2.17.1


