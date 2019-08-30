Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9B47F438
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u16so6890263wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=R+E+ZdSZjeNmQWiJgFxXoPzvXaX9/KABWLmaLwrL3cs=;
	b=GAJdu6eBTOMm1Yilcp+wFyjN7XRtJyD9EXx2J2T6umJiiDRjV17lO4ecWnKeoomdFt
	aVIZU4KRDt6BYGPAUPpHjcDZXrmJMYUxpIlZThM1TI3de4IjAH5pGyQPezaqIdYkEIZx
	/5Ah+9viDC/6qg1hNVNFIXeg74sdhy/10QRI8VBs4adhNjaMCPSCCqWFwRyyw4PoJL0f
	PrwU7EQ3YYwKU0BN6AJk0HyjR9ajpOuczJ03po4C9IkIxlhXaSaAcTlZxFANyzvzoMFo
	PEmHbYHU1ogbX4daLPyCr32BJJtZnTUm5ghuEPeWVWQnb49n0L3y6DX3iBXRE7WaJcmn
	1CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=R+E+ZdSZjeNmQWiJgFxXoPzvXaX9/KABWLmaLwrL3cs=;
	b=VNmhTyDJxAB/4mx4YQWMApnLBTeqXRXzo7xrDOzNQpRDlcuwf+LWBY3ctOzn8TO2pk
	eeDqEV7PNbEMCtnNCJvsK7MOXXvaJDYke/r/0u6UvMhy9NLOF20Vcncsoeh+3bL75D4u
	Q0oe7njnUd0jLVuUa+XRZGTd3ryn2rnUqbqK/zVL70bqt8vcJVe56+51BP88feqeH0aF
	m0vdEeB0+APZTP+kkXRsMciTeU+jrHCSZW/5OURLFnEJMPoJ39w4kK6JdrKSNCAVtJiS
	2kMXNvpmFz4aSMNQB1AxP+dLUZ1uOTzMhAQJyn6wrlSrJfhbJlhAvF1PbpqifNq3MzAT
	hsqw==
X-Gm-Message-State: APjAAAUokq/BcTeJMXruXhPTe4FUrLkQathSJ4ctybOf/xomLt+9er7M
	LuKID2bIOhVtVF1P7COIRs5k9fSM
X-Google-Smtp-Source: APXvYqwhYikqNcHvPhxjmaEYvLttiYN9LxaCnaO7SiPNVUllkn9IR3sRCPErGnJGbmc5129PxLDVFQ==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr16326922wrn.229.1567169407019;
	Fri, 30 Aug 2019 05:50:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:47 +0200
Message-Id: <940fca6ce3aab0ece8161cd549ec5901285b0a4c.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 02/13] qemu: set default RAM to 256M for all machines
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:06 -0000

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


