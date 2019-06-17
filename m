Return-Path: <prvs=06424885f=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE957E782
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 22:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1560809040; x=1592345040;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=PIUQYp7nNyVwoM5+Qr04Dfe93xrDwl7xra3aeThUDDw=;
	b=MTLtcmW0ZUOF4XHDoghsHKRXUfuDcUAuc/EwIONfLZHrKvWNwwjMGSDV
	r1M8mNZ7IIPlVwQSZX6E2qee/wai72l1iQLluqTcLtvVn+/ZYzwIIMrQN
	Zks0xrHD55ilcgZPZj019veWHj+IMZckDAPapDRldylmJhlUXHs81lNbE
	1xckXcYLoGBmajDwpLXfraEuIzpL5BbQFsJYLwSH7AW5TFPZISw2THQDW
	aj96mAumnGITDRytoa7rUD9gDqJUEZ/zDzhAg9kfgwtSHDC0F8UxQ4XF7
	cm4fLLGM4rWBhv/7KE7suQ7I8RJHhV16q8rZMUlopEM5mkRImufbccY3a Q==;
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="217157210"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2019 06:04:00 +0800
IronPort-SDR: Ttx2bb9Q2gCyXBFmv37pSRoE3kX58XfgV+q2ZMsSGbBgM/KXrVrfi6w2zEcVuR5aYjWNl4l6sn
	+JQVMiyhERG+6L3xqX8z7+n7llaH4AmHlVGi13VWcXlukuaNb5969R+adblK/mm6bttRtc61gs
	vZi9gcDkkArBX1Yd0R1vx8KlX2bhc892RWgNDY9j/m/kLJMeJGa6dUydsxu+LOQ8uEtr7Hb89a
	Zzz8tMIsknJf4sRIYeeWN6CyjI7fR+8hdvF6XXLTfLmyCZUBH5buDRObyN19HUOxUCrB6yTYSO
	+JBzXFp39pJKiPHHPYQ5UmLk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 17 Jun 2019 15:03:33 -0700
IronPort-SDR: yCHNgH/1B2Ikazn4y/Z8liBSKAQ8WtUjvgFEZY2q63I8IRdYAuUeSxN3RTt6+jsoIys3ru3J/5
	cH9t1wvYjQGwUsJJqMQ0PPm/Io7coj1plDnLe7zPiR330Jly5zndBVyXvzrBQYx3XBjJ4J9vYs
	QKr1P6om4FHjuv+4Tm9UfctFzLzFXwjWZ2ZV6rn8hrt9l+3cHiYNjwl93AZMO4YVUzb9ojx8JF
	R4nafWg9OjpVA9B8J1k2HZuenNlJuEwZp5tqjLtW7YhxEFmzLNMTXllfCsLsPKLP4KxMgP73kZ
	bdQ=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Jun 2019 15:04:00 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 15:01:20 -0700
Message-Id: <20190617220122.13994-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617220122.13994-1-alistair.francis@wdc.com>
References: <20190617220122.13994-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] opensbi: Initial commit of OpenSBI
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
X-List-Received-Date: Mon, 17 Jun 2019 22:03:59 -0000
Content-Transfer-Encoding: 8bit

This is used as a bootloader for RISC-V QEMU machines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...Makefile-Don-t-specify-mabi-or-march.patch | 38 ++++++++++++++
 ...-address-of-packed-member-warning-wi.patch | 52 +++++++++++++++++++
 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 37 +++++++++++++
 meta/recipes-bsp/opensbi/opensbi_0.3.bb       | 49 +++++++++++++++++
 4 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
 create mode 100644 meta/recipes-bsp/opensbi/files/0001-sbi_ipi.c-Ignore-address-of-packed-member-warning-wi.patch
 create mode 100644 meta/recipes-bsp/opensbi/opensbi-payloads.inc
 create mode 100644 meta/recipes-bsp/opensbi/opensbi_0.3.bb

diff --git a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
new file mode 100644
index 0000000000..9c2d0eb479
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
@@ -0,0 +1,38 @@
+From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 15 Feb 2019 14:57:41 -0800
+Subject: [PATCH] Makefile: Don't specify mabi or march
+
+To avoid
+    can't link double-float modules with soft-float modules
+errors when building 32-bit openSBI don't specify mabi or march.
+
+Upstream-Status: Inappropriate [Fixes a 32-bit Yocto flow bug]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ae68f55..10851fc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -145,7 +145,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
+ CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
+ CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ CFLAGS		+=	-mno-save-restore -mstrict-align
+-CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
+ CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ CFLAGS		+=	$(GENFLAGS)
+ CFLAGS		+=	$(platform-cflags-y)
+@@ -158,7 +157,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
+ ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
+ ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ ASFLAGS		+=	-mno-save-restore -mstrict-align
+-ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
+ ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ ASFLAGS		+=	$(GENFLAGS)
+ ASFLAGS		+=	$(platform-asflags-y)
+-- 
+2.20.1
+
diff --git a/meta/recipes-bsp/opensbi/files/0001-sbi_ipi.c-Ignore-address-of-packed-member-warning-wi.patch b/meta/recipes-bsp/opensbi/files/0001-sbi_ipi.c-Ignore-address-of-packed-member-warning-wi.patch
new file mode 100644
index 0000000000..28577ddf00
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/files/0001-sbi_ipi.c-Ignore-address-of-packed-member-warning-wi.patch
@@ -0,0 +1,52 @@
+From dbd2fdb9956417e1d49a14b9aea162b10598c6c0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Mar 2019 20:48:04 -0800
+Subject: [PATCH] sbi_ipi.c: Ignore address-of-packed-member warning with gcc 9
+ or newer
+
+This is a workaround until fixed correctly, for following error
+
+sbi_ipi.c:34:28: error: taking address of packed member of 'struct sbi_scratch' may result in an unaligned pointer value [-Werror=address-of-packed-member]
+|    34 |  atomic_raw_set_bit(event, &remote_scratch->ipi_type);
+|       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/sbi_ipi.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/lib/sbi_ipi.c b/lib/sbi_ipi.c
+index 5f189c8..bc9df11 100644
+--- a/lib/sbi_ipi.c
++++ b/lib/sbi_ipi.c
+@@ -31,7 +31,13 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 hartid, u32 event)
+ 	 * trigger the interrupt
+ 	 */
+ 	remote_scratch = sbi_hart_id_to_scratch(scratch, hartid);
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ 	atomic_raw_set_bit(event, &remote_scratch->ipi_type);
++#if __GNUC__ >= 9
++#pragma GCC diagnostic pop
++#endif
+ 	mb();
+ 	sbi_platform_ipi_send(plat, hartid);
+ 	if (event != SBI_IPI_EVENT_SOFT)
+@@ -97,7 +103,13 @@ void sbi_ipi_process(struct sbi_scratch *scratch)
+ 			sbi_hart_hang();
+ 			break;
+ 		};
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Waddress-of-packed-member"
++#endif
+ 		ipi_type = atomic_raw_clear_bit(ipi_event, &scratch->ipi_type);
++#if __GNUC__ >= 9
++#pragma GCC diagnostic pop
++#endif
+ 	} while(ipi_type > 0);
+ }
+ 
+-- 
+2.21.0
+
diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
new file mode 100644
index 0000000000..7df168325a
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -0,0 +1,37 @@
+def riscv_get_extra_oemake_image(d):
+    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
+    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
+
+    if sbi_payload is None:
+        return ""
+
+    if d.getVar('RISCV_SBI_PAYLOAD'):
+        return "FW_PAYLOAD_PATH=" + deploy_dir + "/" + sbi_payload
+
+    return ""
+
+def riscv_get_extra_oemake_fdt(d):
+    sbi_fdt_payload = d.getVar('RISCV_SBI_FDT')
+    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
+
+    if sbi_fdt_payload is None:
+        return ""
+
+    if d.getVar('RISCV_SBI_PAYLOAD'):
+        # This is internal to openSBI, not a full path
+        return "FW_PAYLOAD_FDT=" + sbi_fdt_payload
+
+    return ""
+
+def riscv_get_do_compile_depends(d):
+    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
+
+    if sbi_payload is None:
+        return ""
+
+    if 'linux' in sbi_payload or 'Image' in sbi_payload:
+        return "virtual/kernel:do_deploy"
+    if 'u-boot' in sbi_payload:
+        return "virtual/bootloader:do_deploy"
+
+    return ""
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.3.bb b/meta/recipes-bsp/opensbi/opensbi_0.3.bb
new file mode 100644
index 0000000000..fdfc5eca00
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/opensbi_0.3.bb
@@ -0,0 +1,49 @@
+SUMMARY = "RISC-V Open Source Supervisor Binary Interface (OpenSBI)"
+DESCRIPTION = "OpenSBI aims to provide an open-source and extensible implementation of the RISC-V SBI specification for a platform specific firmware (M-mode) and a general purpose OS, hypervisor or bootloader (S-mode or HS-mode). OpenSBI implementation can be easily extended by RISC-V platform or System-on-Chip vendors to fit a particular hadware configuration."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=c36118b4f615f9da37635f2a7ac8ccaf"
+DEPENDS += "dtc-native"
+
+require opensbi-payloads.inc
+
+inherit autotools-brokensep
+
+SRCREV = "ca20ac0cd4c099006d4eea4d9ac7bd7b58e2ae0f"
+SRC_URI = "git://github.com/riscv/opensbi.git \
+           file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
+           file://0001-sbi_ipi.c-Ignore-address-of-packed-member-warning-wi.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "621f38d8205ef5fb185e4055025e73df"
+SRC_URI[sha256sum] = "07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a224be300"
+
+EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D}"
+# If RISCV_SBI_PAYLOAD is set then include it as a payload
+EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)} ${@riscv_get_extra_oemake_fdt(d)}"
+
+# Required if specifying a custom payload
+do_compile[depends] += "${@riscv_get_do_compile_depends(d)}"
+
+do_install_append() {
+	# In the future these might be required as a dependency for other packages.
+	# At the moment just delete them to avoid warnings
+	rm -r ${D}/include
+	rm -r ${D}/platform/${RISCV_SBI_PLAT}/lib
+	rm -r ${D}/platform/${RISCV_SBI_PLAT}/firmware/payloads
+}
+
+do_deploy () {
+	install -d ${DEPLOY_DIR_IMAGE}
+	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOY_DIR_IMAGE}/
+	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOY_DIR_IMAGE}/
+}
+
+addtask deploy after do_install
+
+FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
+FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
+
+COMPATIBLE_HOST = "(riscv64|riscv32).*"
+INHIBIT_PACKAGE_STRIP = "1"
-- 
2.22.0


