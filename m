Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8D41615AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 19:35:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rALJZrBn025208
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:35:53 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 21 Nov 2013 11:35:53 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 13:35:52 -0600
Message-ID: <1385062552-3945-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][PATCH] Qemu:Arm:versatilepb: Add memory size checking
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
X-List-Received-Date: Thu, 21 Nov 2013 19:35:54 -0000
Content-Type: text/plain

From: Jiang Lu <lu.jiang@windriver.com>

The machine can not work with memory over 256M, so add a checking
at startup. If the memory size exceed 256M, just stop emulation then
throw out warning about memory limitation.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 ...-Arm-versatilepb-Add-memory-size-checking.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.5.0.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
new file mode 100644
index 0000000..ef1090b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
@@ -0,0 +1,34 @@
+From 896fa02c24347e6e9259812cfda187b1d6ca6199 Mon Sep 17 00:00:00 2001
+From: Jiang Lu <lu.jiang@windriver.com>
+Date: Wed, 13 Nov 2013 10:38:08 +0800
+Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking
+
+The machine can not work with memory over 256M, so add a checking
+at startup. If the memory size exceed 256M, just stop emulation then
+throw out warning about memory limitation.
+
+Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
+---
+ hw/arm/versatilepb.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
+index 753757e..0906377 100644
+--- a/hw/arm/versatilepb.c
++++ b/hw/arm/versatilepb.c
+@@ -193,6 +193,12 @@ static void versatile_init(QEMUMachineInitArgs *args, int board_id)
+         fprintf(stderr, "Unable to find CPU definition\n");
+         exit(1);
+     }
++    if (ram_size > (256 << 20)) {
++        fprintf(stderr,
++                "qemu: Too much memory for this machine: %d MB, maximum 256 MB\n",
++                ((unsigned int)ram_size / (1 << 20)));
++        exit(1);
++    }
+     memory_region_init_ram(ram, "versatile.ram", args->ram_size);
+     vmstate_register_ram_global(ram);
+     /* ??? RAM should repeat to fill physical memory space.  */
+-- 
+1.7.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
index 06c2cdb..f8c60e8 100644
--- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://fdt_header.patch \
             file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch \
             file://target-ppc_fix_bit_extraction.patch \
             file://fxrstorssefix.patch \
+            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
            "
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-- 
1.8.1.2.545.g2f19ada


