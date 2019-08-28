Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7A53F7EDF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:24:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t6so489109wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R+E+ZdSZjeNmQWiJgFxXoPzvXaX9/KABWLmaLwrL3cs=;
	b=T2MY0mbrTZ/v0ntZfr3kI3ilQMDsjtnOSn/e4rdGfW7c6xcyBFGSdzMCJM7U6Pv7wX
	HfEUByuqQBmy4tAhUHmqWs2yWibNpNkROU5D7oh4QqGgyLJP95BJJIgjPQ4m71KXKLxc
	ew3CoU/VjVCEco92cKC4QOJqfmxVBq0cses14cWdVlqQcGRjTkCz4m5aQpa1CnCnnjwO
	pNexejW5hiOFdrr5x2nuOagA8Q/pL98FW7BpO9wRLGF0cdzPSivYLXOfA1WwUikD2WaH
	U60VLvh9QIIDQLQLQMXWlU2EVMCbO7eRCwHHMqJ4LLjoSUvLJWSkei/qxKqNzB2C1e9y
	CG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R+E+ZdSZjeNmQWiJgFxXoPzvXaX9/KABWLmaLwrL3cs=;
	b=RbkdrkPYckCpZPstG1J6ucdNkRM8U7J2WWeDYWOl2lj4fkHKeLnAloI2Qq2VJAh2Oj
	B2IZvCpEmALPv4LL01hXWw8LRHBHLInkqeZCPnn7h7VQO4hZD/2ALSafjsL9jGgBHJ5r
	Zb0Q3YYD6ignmP2HdFL6CYiz3zzq4CEMVATcV6sEIJNNvebG+r6yvWApp+ma7Zx4qr3l
	IlsV+TmxSs4vK+3B50NlXgjx+V2kZQzqXHdyUNtc/FDzkJjHjcGuNIbIazBdQL8P4RYN
	ZOAJ8W0czE0aDYS21mAObczQP0kDSkIt5wgKz8umhxyf1S/wUDpUeuznAPdp2DUpfxOX
	Yo5w==
X-Gm-Message-State: APjAAAUcFcrYNMr6d/uFnYHuOiJHrX80gNmvr2lhZNoYa0AKd18KS412
	ot01mhReIWvr0IlHrXFpJ6GxyaMR
X-Google-Smtp-Source: APXvYqwJGuDFj/wECz8V0KOmXmrUFZuE4bvb3udhtXRd33VoVXxTVqDbTUzn3x07qYeTUZ1j8U2OXw==
X-Received: by 2002:a05:600c:21d3:: with SMTP id
	x19mr5442736wmj.45.1567005887919; 
	Wed, 28 Aug 2019 08:24:47 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id w5sm2207074wmm.43.2019.08.28.08.24.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 08:24:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 17:24:38 +0200
Message-Id: <20190828152440.70861-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828152440.70861-1-alex.kanavin@gmail.com>
References: <20190828152440.70861-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/4] qemu: set default RAM to 256M for all machines
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
X-List-Received-Date: Wed, 28 Aug 2019 15:24:47 -0000

There was a discussion about what amount of RAM is appropriate for a
default; the outcome was that for now it is still 256M. Some qemu machine
definitions have however set this to 512M so for the sake of
treating all architectures fairly, they are reset back to 256M.

Also runqemu is adjusted to use 256M if QB_MEM is not set at all.

http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285900.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemuboot-mips.inc   | 1 -
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 -
 meta/conf/machine/qemuarm.conf                | 1 -
 meta/conf/machine/qemuarm64.conf              | 1 -
 scripts/runqemu                               | 4 ++--
 5 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/qemuboot-mips.inc
index a5f9ed821f4..1c2b532b482 100644
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
index f1cb62818b7..952779e98e8 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -24,7 +24,6 @@ UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
 
 # qemuboot options
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
-QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_DEFAULT_BIOS = "fw_jump.elf"
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
diff --git a/scripts/runqemu b/scripts/runqemu
index e9b83737cbf..7705b2b60e3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -755,8 +755,8 @@ class BaseConfig(object):
         if s:
             self.set('QB_MEM', '-m %s' % s.group(1))
         elif not self.get('QB_MEM'):
-            logger.info('QB_MEM is not set, use 512M by default')
-            self.set('QB_MEM', '-m 512')
+            logger.info('QB_MEM is not set, use 256M by default')
+            self.set('QB_MEM', '-m 256')
 
         # Check and remove M or m suffix
         qb_mem = self.get('QB_MEM')
-- 
2.17.1


