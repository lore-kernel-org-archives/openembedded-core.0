Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCD67EC5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:26:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id z23so4836112wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/Qbjx+zhLwZGp7dwqpDifH9mQgpQ11SloKTj2JdKOeU=;
	b=CWHhaRMa7yrR4QaA8tbZnwCSNu1i+TAabQYl3CjJUrG/ex+zic7uImit055BSR9bci
	SWXMZ3gilY4e7Rt2Jbk7M+H7hg6eixeirBCJWahcWZIiOUlOdEzRecF8lNfarlcTZhHa
	ezeTV0m0deS8D53vL2uNyli6b2ev/0IOU20WdxDLvCWfyzDcchH9SNXHxGbCrKcpKXNp
	ExpPkpizzaYSaNQdPqX/19bQ04xwVqbwsCfbOasucdzrih7mz9hhD7exoU5Z3s3tkpHf
	2584+UWTVBQXJvfkd8zAbKQm194RDFH0htqSnsU8HLefejN1PcMj6K3fG5g9vcugoEEy
	rDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/Qbjx+zhLwZGp7dwqpDifH9mQgpQ11SloKTj2JdKOeU=;
	b=HUP4+ih6eD8SK7NcdL0E5Uca1H/5HHJLtaFOLBdmSM/Kp0QHkdL0Hz7zxMgUnlz7Bx
	NVxr3A+u/8u0mNHFM25QPNjFrw0vfSxjwegfX8EEwtMEBADNJAsTl4WEfSOY3z0soxpB
	0dOphj0wM4mUfQukSqOPdoL7LR/OMmrVgpXpTWV3xTImhfUIfXBXXKzxAkjTMfAUV/GU
	up4OHGzd50741SCEoouj11awUYYFRRSr0ToItrLHUmw+6BYD/Fwr54iNsHBh0nMPVdBv
	WxllcodG2aDfRFs7FlOvmw5+L8iosWQOliN+71mFK2ylGQHuuz047Fk7SwOCtilElVzj
	Sk9w==
X-Gm-Message-State: APjAAAWQTCCuSifbcyoFlukrFHkX/MtPQvKytv29+wmELyVYbGvq4Wkt
	8BBUPofiygOl2WG65TeE6jwKFFr0zss=
X-Google-Smtp-Source: APXvYqxvgDKFkuPf5OhsG0fIpS1loFBF9SYXACkwptt1Fze9b6tZVLLzeOIXoK+F7HNXapG4sHLpkQ==
X-Received: by 2002:a1c:2dcf:: with SMTP id t198mr8563174wmt.147.1565796379592;
	Wed, 14 Aug 2019 08:26:19 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v12sm66620wrr.87.2019.08.14.08.26.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:26:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 17:26:12 +0200
Message-Id: <20190814152613.46996-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814152613.46996-1-alex.kanavin@gmail.com>
References: <20190814152613.46996-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] qemuboot.bbclass: increase the default RAM to 512M
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
X-List-Received-Date: Wed, 14 Aug 2019 15:26:19 -0000

This was already the case for various specific qemu machines,
and 256M was found to be no longer sufficient for x86 either when
switching X from vmware to standard vga+bochs vesa driver as provided
by qemu (Xorg would then attempt to clone() itself with ENOMEM returned).

Let's just accept this new reality :)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/qemuboot.bbclass                 | 2 +-
 meta/conf/machine/include/qemuboot-mips.inc   | 1 -
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 -
 meta/conf/machine/qemuarm.conf                | 1 -
 meta/conf/machine/qemuarm64.conf              | 1 -
 5 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 15a9e63f2b2..9d4f4dbd70b 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -57,7 +57,7 @@
 # IMAGE_CLASSES += "qemuboot"
 # See "runqemu help" for more info
 
-QB_MEM ?= "-m 256"
+QB_MEM ?= "-m 512"
 QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
 QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
 QB_DEFAULT_FSTYPE ?= "ext4"
diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index 75bb98861f8..3a4c8f96f1e 100644
--- a/meta/conf/machine/include/qemuboot-mips.inc
+++ b/meta/conf/machine/include/qemuboot-mips.inc
@@ -1,6 +1,5 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
-QB_MEM = "-m 256"
 QB_MACHINE = "-machine malta"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
 QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -device usb-tablet"
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 84d09fa78e2..bd7568121cc 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -24,7 +24,6 @@ UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
 
 # qemuboot options
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
-QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_DEFAULT_KERNEL = "fw_jump.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 0a2c9953125..26f40b14194 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -11,7 +11,6 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
-QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a15"
 # Standard Serial console
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 353ac927d94..ec2a887bddf 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -11,7 +11,6 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-aarch64"
-QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
 QB_CPU_KVM = "-cpu host"
-- 
2.17.1


