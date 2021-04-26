Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: W4qMj7ZvbqulPM6km+6NkZ0kcwcV9spq9ftPdqnx86GDEjN8mALaSgBel/37N2ycewrEkV3YGS
 w2X3m8E6erNw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568905"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568905"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:18 -0700
IronPort-SDR: Ll8MY/FYoCDCrihvB2D88xPauMF3Nt2Se51z9vXCXfLBTIp2a6wX8OkbdHSgDJ3GIXiVEiiRBN
 HPeim0i+Ae9g==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067605"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:17 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 60/64] qemu: fix CVE-2021-20221
Date: Mon, 26 Apr 2021 08:53:31 +0800
Message-Id: <e71b85d59c96a9aba06852dfdcd6ad5d9cdc4c35.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59a44f8c70d4a026ae74e44b9d70100029c691b5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20221.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fc9c9e15f9..f118772208 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-35517_3.patch \
            file://CVE-2021-20181.patch \
            file://CVE-2020-29443.patch \
+           file://CVE-2021-20221.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
new file mode 100644
index 0000000000..d762a51d02
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
@@ -0,0 +1,70 @@
+From e428bcfb86fb46d9773ae11e69712052dcff3d45 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Sun, 31 Jan 2021 11:34:01 +0100
+Subject: [PATCH] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
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
+   $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
+   [I 1612088147.116987] OPENED
+  [R +0.278293] writel 0x8000f00 0xff4affb0
+  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
+  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13
+
+This fixes a security issue when running with KVM on Arm with
+kernel-irqchip=off. (The default is kernel-irqchip=on, which is
+unaffected, and which is also the correct choice for performance.)
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2021-20221
+Fixes: 9ee6e8bb853 ("ARMv7 support.")
+Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
+Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
+@@ -1474,7 +1474,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
+         int target_cpu;
+ 
+         cpu = gic_get_current_cpu(s);
+-        irq = value & 0x3ff;
++        irq = value & 0xf;
+         switch ((value >> 24) & 3) {
+         case 0:
+             mask = (value >> 16) & ALL_CPU_MASK;
+-- 
+2.29.2
+
-- 
2.30.2

