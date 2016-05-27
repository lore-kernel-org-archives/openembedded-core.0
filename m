Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id A86C670179
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 13:43:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 30B9226552F
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2016 15:43:09 +0200
Message-Id: <1464356589-7982-1-git-send-email-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot: Update to 2016.05 release
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
X-List-Received-Date: Fri, 27 May 2016 13:43:18 -0000

Upgrade U-Boot to the latest upstream version.
Add a patch to unbreak build on some toolchains.

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
 ...utils_2016.03.bb => u-boot-fw-utils_2016.05.bb} |  4 +-
 ...kimage_2016.03.bb => u-boot-mkimage_2016.05.bb} |  4 +-
 .../0000-video-ipu_common-fix-build-error.patch    | 48 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2016.03.bb          | 10 -----
 meta/recipes-bsp/u-boot/u-boot_2016.05.bb          | 14 +++++++
 5 files changed, 66 insertions(+), 14 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.05.bb} (94%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.05.bb} (90%)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2016.03.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2016.05.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
similarity index 94%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
index 79f1548..94d9c13 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
@@ -7,9 +7,9 @@ DEPENDS = "mtd-utils"
 # This revision corresponds to the tag "v2016.03"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
+SRCREV = "aeaec0e682f45b9e0c62c522fafea353931f73ed"
 
-PV = "v2016.03+git${SRCPV}"
+PV = "v2016.05+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
similarity index 90%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
index d5921a0..bdfcaf4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
@@ -8,9 +8,9 @@ DEPENDS = "openssl"
 # This revision corresponds to the tag "v2016.03"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
+SRCREV = "aeaec0e682f45b9e0c62c522fafea353931f73ed"
 
-PV = "v2016.03+git${SRCPV}"
+PV = "v2016.05+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch b/meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch
new file mode 100644
index 0000000..452672d
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot/0000-video-ipu_common-fix-build-error.patch
@@ -0,0 +1,48 @@
+From c510f2e436008e55a50b063f2180cb1e63984224 Mon Sep 17 00:00:00 2001
+From: Peng Fan <van.freenix@gmail.com>
+Date: Thu, 28 Apr 2016 10:07:53 +0800
+Subject: [PATCH] video: ipu_common: fix build error
+
+Some toolchains fail to build
+"clk->rate = (u64)(clk->parent->rate * 16) / div;"
+And the cast usage is wrong.
+
+Use the following code to fix the issue,
+"
+  do_div(parent_rate, div);
+  clk->rate = parent_rate;
+"
+
+Upstream-Status: Inappropriate [comes from upstream's branch]
+
+Reported-by: Peter Robinson <pbrobinson@gmail.com>
+Signed-off-by: Peng Fan <van.freenix@gmail.com>
+Cc: Stefano Babic <sbabic@denx.de>
+Cc: Fabio Estevam <fabio.estevam@nxp.com>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Anatolij Gustschin <agust@denx.de>
+Cc: Peter Robinson <pbrobinson@gmail.com>
+Reviewed-by: Tom Rini <trini@konsulko.com>
+Tested-by: Peter Robinson <pbrobinson@gmail.com>
+---
+ drivers/video/ipu_common.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/video/ipu_common.c b/drivers/video/ipu_common.c
+index 36d4b23..5676a0f 100644
+--- a/drivers/video/ipu_common.c
++++ b/drivers/video/ipu_common.c
+@@ -352,7 +352,9 @@ static int ipu_pixel_clk_set_rate(struct clk *clk, unsigned long rate)
+ 	 */
+ 	__raw_writel((div / 16) << 16, DI_BS_CLKGEN1(clk->id));
+ 
+-	clk->rate = (u64)(clk->parent->rate * 16) / div;
++	do_div(parent_rate, div);
++
++	clk->rate = parent_rate;
+ 
+ 	return 0;
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
deleted file mode 100644
index 836b0ce..0000000
--- a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require u-boot.inc
-
-DEPENDS += "dtc-native"
-
-# This revision corresponds to the tag "v2016.03"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
-
-PV = "v2016.03+git${SRCPV}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.05.bb b/meta/recipes-bsp/u-boot/u-boot_2016.05.bb
new file mode 100644
index 0000000..57408e7
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2016.05.bb
@@ -0,0 +1,14 @@
+require u-boot.inc
+
+DEPENDS += "dtc-native"
+
+# This revision corresponds to the tag "v2016.05"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "aeaec0e682f45b9e0c62c522fafea353931f73ed"
+
+SRC_URI_append = "\
+    file://0000-video-ipu_common-fix-build-error.patch \
+"
+
+PV = "v2016.05+git${SRCPV}"
-- 
2.7.4


