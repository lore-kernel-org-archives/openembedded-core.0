Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5439.1619153115694629130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 21:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N4jFSm022170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 21:45:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 21:45:14 -0700
Received: from localhost.localdomain (128.224.72.54) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 21:45:14 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/6] qemu: fix CVE-2021-20221
Date: Fri, 23 Apr 2021 00:45:02 -0400
Message-ID: <20210423044505.105208-3-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423044505.105208-1-sakib.sajal@windriver.com>
References: <20210423044505.105208-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 13N4jFSm022170
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20221.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index fc9c9e15f9..f118772208 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://CVE-2020-35517_3.patch \
            file://CVE-2021-20181.patch \
            file://CVE-2020-29443.patch \
+           file://CVE-2021-20221.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch b/meta/=
recipes-devtools/qemu/qemu/CVE-2021-20221.patch
new file mode 100644
index 0000000000..d762a51d02
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
@@ -0,0 +1,70 @@
+From e428bcfb86fb46d9773ae11e69712052dcff3d45 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <f4bug@amsat.o=
rg>
+Date: Sun, 31 Jan 2021 11:34:01 +0100
+Subject: [PATCH] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Per the ARM Generic Interrupt Controller Architecture specification
+(document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
+not 10:
+
+  - 4.3 Distributor register descriptions
+  - 4.3.15 Software Generated Interrupt Register, GICD_SG
+
+    - Table 4-21 GICD_SGIR bit assignments
+
+    The Interrupt ID of the SGI to forward to the specified CPU
+    interfaces. The value of this field is the Interrupt ID, in
+    the range 0-15, for example a value of 0b0011 specifies
+    Interrupt ID 3.
+
+Correct the irq mask to fix an undefined behavior (which eventually
+lead to a heap-buffer-overflow, see [Buglink]):
+
+   $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,ac=
cel=3Dqtest -qtest stdio
+   [I 1612088147.116987] OPENED
+  [R +0.278293] writel 0x8000f00 0xff4affb0
+  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds f=
or type 'uint8_t [16][8]'
+  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm=
_gic.c:1498:13
+
+This fixes a security issue when running with KVM on Arm with
+kernel-irqchip=3Doff. (The default is kernel-irqchip=3Don, which is
+unaffected, and which is also the correct choice for performance.)
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2021-20221
+Fixes: 9ee6e8bb853 ("ARMv7 support.")
+Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
+Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+Message-id: 20210131103401.217160-1-f4bug@amsat.org
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport [edfe2eb4360cde4ed5d95bda7777edcb3510f76a]
+CVE: CVE-2021-20221
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/intc/arm_gic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
+index c60dc6b5e..fbde60de0 100644
+--- a/hw/intc/arm_gic.c
++++ b/hw/intc/arm_gic.c
+@@ -1474,7 +1474,7 @@ static void gic_dist_writel(void *opaque, hwaddr o=
ffset,
+         int target_cpu;
+=20
+         cpu =3D gic_get_current_cpu(s);
+-        irq =3D value & 0x3ff;
++        irq =3D value & 0xf;
+         switch ((value >> 24) & 3) {
+         case 0:
+             mask =3D (value >> 16) & ALL_CPU_MASK;
+--=20
+2.29.2
+
--=20
2.25.1

