Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bam1fNIu9YA7D18TGKpVa8bP73hm/jPI29It17N+EsKK41nEvu/nummiPyEWkUY54I+cNgwZi3
 6B5QBbK1UJWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628810"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628810"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:26 -0700
IronPort-SDR: 8F3xyDa8ISEvM5N88FeS9l6tzndjWFxeGhEW0JKabTR/rbhnosj9DJWWsY8eqIc/zCVCkmHlGf
 2WDVKfMYIAcQ==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801598"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:25 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 05/10] qemu: fix CVE-2020-10702 & CVE-2020-13765
Date: Thu,  2 Jul 2020 08:54:07 +0800
Message-Id: <684307688eb0c1a98be8885164ecc8f578a36cf8.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2020-10702.patch            | 52 +++++++++++++++++++
 .../qemu/qemu/CVE-2020-13765.patch            | 48 +++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13765.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4e5ea174a9..5cdba1f02c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,6 +37,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-7039-3.patch \
 	   file://CVE-2020-7211.patch \
 	   file://CVE-2020-11869.patch \
+           file://CVE-2020-13765.patch \
+           file://CVE-2020-10702.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch
new file mode 100644
index 0000000000..21a3ceb30d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-10702.patch
@@ -0,0 +1,52 @@
+From de0b1bae6461f67243282555475f88b2384a1eb9 Mon Sep 17 00:00:00 2001
+From: Vincent Dehors <vincent.dehors@smile.fr>
+Date: Thu, 23 Jan 2020 15:22:38 +0000
+Subject: [PATCH] target/arm: Fix PAuth sbox functions
+
+In the PAC computation, sbox was applied over wrong bits.
+As this is a 4-bit sbox, bit index should be incremented by 4 instead of 16.
+
+Test vector from QARMA paper (https://eprint.iacr.org/2016/444.pdf) was
+used to verify one computation of the pauth_computepac() function which
+uses sbox2.
+
+Launchpad: https://bugs.launchpad.net/bugs/1859713
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Vincent DEHORS <vincent.dehors@smile.fr>
+Signed-off-by: Adrien GRASSEIN <adrien.grassein@smile.fr>
+Message-id: 20200116230809.19078-2-richard.henderson@linaro.org
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=patch;h=de0b1bae6461f67243282555475f88b2384a1eb9] 
+CVE: CVE-2020-10702
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ target/arm/pauth_helper.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
+index d3194f2..0a5f41e 100644
+--- a/target/arm/pauth_helper.c
++++ b/target/arm/pauth_helper.c
+@@ -89,7 +89,7 @@ static uint64_t pac_sub(uint64_t i)
+     uint64_t o = 0;
+     int b;
+ 
+-    for (b = 0; b < 64; b += 16) {
++    for (b = 0; b < 64; b += 4) {
+         o |= (uint64_t)sub[(i >> b) & 0xf] << b;
+     }
+     return o;
+@@ -104,7 +104,7 @@ static uint64_t pac_inv_sub(uint64_t i)
+     uint64_t o = 0;
+     int b;
+ 
+-    for (b = 0; b < 64; b += 16) {
++    for (b = 0; b < 64; b += 4) {
+         o |= (uint64_t)inv_sub[(i >> b) & 0xf] << b;
+     }
+     return o;
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13765.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13765.patch
new file mode 100644
index 0000000000..9014ba0f13
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13765.patch
@@ -0,0 +1,48 @@
+From e423455c4f23a1a828901c78fe6d03b7dde79319 Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Wed, 25 Sep 2019 14:16:43 +0200
+Subject: [PATCH] hw/core/loader: Fix possible crash in rom_copy()
+
+Both, "rom->addr" and "addr" are derived from the binary image
+that can be loaded with the "-kernel" paramer. The code in
+rom_copy() then calculates:
+
+    d = dest + (rom->addr - addr);
+
+and uses "d" as destination in a memcpy() some lines later. Now with
+bad kernel images, it is possible that rom->addr is smaller than addr,
+thus "rom->addr - addr" gets negative and the memcpy() then tries to
+copy contents from the image to a bad memory location. This could
+maybe be used to inject code from a kernel image into the QEMU binary,
+so we better fix it with an additional sanity check here.
+
+Cc: qemu-stable@nongnu.org
+Reported-by: Guangming Liu
+Buglink: https://bugs.launchpad.net/qemu/+bug/1844635
+Message-Id: <20190925130331.27825-1-thuth@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=patch;h=e423455c4f23a1a828901c78fe6d03b7dde79319] 
+CVE: CVE-2020-13765
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ hw/core/loader.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/core/loader.c b/hw/core/loader.c
+index 0d60219..5099f27 100644
+--- a/hw/core/loader.c
++++ b/hw/core/loader.c
+@@ -1281,7 +1281,7 @@ int rom_copy(uint8_t *dest, hwaddr addr, size_t size)
+         if (rom->addr + rom->romsize < addr) {
+             continue;
+         }
+-        if (rom->addr > end) {
++        if (rom->addr > end || rom->addr < addr) {
+             break;
+         }
+ 
+-- 
+1.8.3.1
+
-- 
2.25.4

