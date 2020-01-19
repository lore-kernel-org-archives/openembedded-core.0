Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8C27F7FCA9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 19:13:56 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id k197so14361945pga.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 11:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JRmHEJ9RImArolfHP9Y2WV5Mj2yBqjpk5Fzxg5fhtpE=;
	b=lN6jugO4/tqHZQWAlRB1DW93ZCq6d4AgU3lK13Oe7knpPQM6GEVL+MBb6qKCR7J5Hd
	uwm9yKUwBD/EgauqGlckxCKaMYKwnx5v04hRnJHV2M/EzXAu6sb0PRUB3o9YOWtNlQKr
	XIzZ3DlxYxIBYVgOQG0iyDIBpMKsZhZRqSUtNK3H9lruejbGGC41CeElmhKDLmLGkFOn
	HTxWXg+tZKM0Jp1v8NnsKBsfXS9O3qxIm9tDZL7qsLZJdJ95bPJfZvwMeK9/fappAzjC
	4SrlB75Opd5om9VSeefSSibLiuf6tYxPc6owXfoNHtFEnC0KoiuD2eeCLFKkL0AQLEbD
	fDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JRmHEJ9RImArolfHP9Y2WV5Mj2yBqjpk5Fzxg5fhtpE=;
	b=h9SI1N6Td+OVH3oAjOmk+UszjVFJIPTpO97Ch1sB4AlJRkY0CYIrRzOLDeOGpk9Agk
	EykfLQWcOZFxfqmf+n+a7oq4esJRcTFl8Qnj35RP3pznkk2vQZzqkrbjl8TBx6jQ4GgO
	jhsdlQqsdID1PCRqXKb3JDYRydjGJJ3B5QzTC0LgI5OV+3drvhTjqzYwTW33o8wgEIdl
	7mO/78ff95U6gmxaOR0ofUkvnfOqel1eC5nKcOcVmsLceyxlTWCI3sC/tiRL8vBOWtQ2
	yv7X5lb8mrKsjBkP9mBJMvPuYYH11TNGHBHtRsA+nr/G6epHuezmN/9apN93t0jWd18L
	HKrA==
X-Gm-Message-State: APjAAAWED0I5C6K5X4lidTHnWUh7ZyNcHl6Gnmbd0QCVIUtKkfY5qFIE
	BpVWrSMYGy2yCU92bBJwwYsf9Xnp5L4=
X-Google-Smtp-Source: APXvYqxqGTpzgV0UIA8pSmzmkrftCuEglG0aOk7R8WOU/JyvRXMrWQuNpfirfvtftu76BwtWHkVHlg==
X-Received: by 2002:a63:364f:: with SMTP id d76mr57909620pga.215.1579461236944;
	Sun, 19 Jan 2020 11:13:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z16sm37413477pff.125.2020.01.19.11.13.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 11:13:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 11:13:51 -0800
Message-Id: <20200119191351.2078978-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH V2] qemu: Enable ppc64le support for qemu-usermode
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
X-List-Received-Date: Sun, 19 Jan 2020 19:13:56 -0000
Content-Transfer-Encoding: 8bit

glibc defines minimum kernel needed to be 3.10.0 for LE ppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Exclude ppc64le from system-qemu target list, its usermode only
    option

 meta/classes/qemu.bbclass                   | 3 +++
 meta/conf/bitbake.conf                      | 1 +
 meta/recipes-devtools/qemu/qemu-targets.inc | 2 +-
 meta/recipes-devtools/qemu/qemu.inc         | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index f5c5780125..55bdff816b 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -16,6 +16,8 @@ def qemu_target_binary(data):
         target_arch = "ppc"
     elif target_arch == "powerpc64":
         target_arch = "ppc64"
+    elif target_arch == "powerpc64le":
+        target_arch = "ppc64le"
 
     return "qemu-" + target_arch
 
@@ -62,3 +64,4 @@ QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
+QEMU_EXTRAOPTIONS_powerpc64le = " -cpu POWER8"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ce89b80ade..2da7c5849a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -430,6 +430,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 OLDEST_KERNEL = "3.2.0"
 OLDEST_KERNEL_aarch64 = "3.14"
 OLDEST_KERNEL_nios2 = "3.19"
+OLDEST_KERNEL_powerpc64le = "3.10.0"
 OLDEST_KERNEL_riscv32 = "4.15"
 OLDEST_KERNEL_riscv64 = "4.15"
 
diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 8184ef5781..24f9a03948 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -13,7 +13,7 @@ def get_qemu_target_list(d):
             softmmuonly += arch + "-softmmu,"
             archs.remove(arch)
     linuxuseronly = ""
-    for arch in ['armeb', 'alpha', 'ppc64abi32', 'sparc32plus', 'aarch64_be']:
+    for arch in ['armeb', 'alpha', 'ppc64abi32', 'ppc64le', 'sparc32plus', 'aarch64_be']:
         if arch in archs:
             linuxuseronly += arch + "-linux-user,"
             archs.remove(arch)
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dff5762b80..eb9f060997 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -59,7 +59,7 @@ do_install_ptest() {
 }
 
 # QEMU_TARGETS is overridable variable
-QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc ppc64 riscv32 riscv64 sh4 x86_64"
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc ppc64 ppc64le riscv32 riscv64 sh4 x86_64"
 
 EXTRA_OECONF = " \
     --prefix=${prefix} \
-- 
2.25.0


