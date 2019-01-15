Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 30C5D7C128
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:22 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u4so3732156wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=M7V2u9qoKEV3NIKTGzfKR2XA6zUwiubdwrEhgSIE4mc=;
	b=NVZBTQZJBemCDVNk6Lj0P2yHJiYLwayt+yBiHL9tVPoXlpO1M4v+neF6vVphtqpdOv
	yMD2wmcJIaBe9mLvZBTiJqeb3eTBI8nq7Egisvy7Kr/mEHPGHPQRrAdybC0Qwn7WQ3IL
	HgVF4L4svclB/JvGattUXcaKPQnWMn3YYMlANK+9DWoisX6YPbbgUl0w9KUpX+9Msxf4
	aeYXNNQoCWhXDC/MWZfdHDMEHZze5IguZ/vyoyop6A641S9FU58co+3JjsDT56+8Aj+2
	ObQmH0lMWNzYs8RKVrYqritlRWNRnwg8d13TGGH1jlmabWQc0xCZ6Dr59zxhKYUh2VJz
	GMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=M7V2u9qoKEV3NIKTGzfKR2XA6zUwiubdwrEhgSIE4mc=;
	b=niul+nP5SQuLpiX6zB+gw6WZm1OG8Di+4BCLnwm4apYokoPNTEPLnlAP4vfbhF4YdQ
	RDZ2F/xQAHBkmjOjjZMa88qoJo38s/TZxbGVLY3RyKP+q/Qywp5VYO45iHL8TryOnIjz
	gVLA2hq8eMagVuA4hEUrgjNa7W2ILXRBXbsPJxHK10+muhyRBtS40iLxbBP43QX6GsEo
	kvSw4DD6hbmNyIdQvIBWI0fC8AHZgwCoIYLs9zUvBSyH1R+MFfcY8DBzv/8EBug8HXAA
	eFseSwt0iGYo5a5h2CQnRzWDxgR6TUipWZ7kBf3J/7Y3GgrmsIZLPZkz0qdK7RjAkvX/
	LK9Q==
X-Gm-Message-State: AJcUukcigmtVeKmOhEtaA5qtqwKdLBck2KO30W0f3C+PDXj4zJL7/ruX
	giKjwnpji3x1HkpoHIA7iIg8lMq+BXY=
X-Google-Smtp-Source: ALg8bN6leFPFx8lrKsyHGgauFR0aeOLc7vhwbxQJHvSawyPguVftoLCIoN/GxLnJtvVfXuJLnFlbow==
X-Received: by 2002:adf:aa9c:: with SMTP id h28mr3809884wrc.216.1547570362636; 
	Tue, 15 Jan 2019 08:39:22 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:54 +0100
Message-Id: <8e93e3c8ca26693261071a78b9659e37e7e6c8e9.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 19/22] runqemu: add support for virgl GL acceleration
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:22 -0000

Also, do not hardcode -vga option to qemu, set it according to command line parameters.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-x86.inc | 2 +-
 scripts/runqemu                            | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

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
index c4a0ca811d9..38de092bfd7 100755
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
@@ -427,12 +429,18 @@ class BaseConfig(object):
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
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
-- 
2.17.1


