Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.24104.1605705754254754020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 05:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: UMqox3Qz0K5iqb3HzZTcyw6NADDsPYslvXsrrXawdfmeb3tj6HohFe53u7zVoe6UCk2fkpDCYa
 W5erdSVLk4sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="189188990"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="189188990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:22:32 -0800
IronPort-SDR: NT7dt7Zy85EAPrBd0lzLUS5LeTDsRUP1mOazp1RChEurElVtA3+YJEveEgBJ8qKRFww65RZAM+
 UBxvLRky5A0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="534283622"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2020 05:22:31 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] qemu: fix CVE-2020-24352
Date: Wed, 18 Nov 2020 21:22:27 +0800
Message-Id: <20201118132227.48678-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118132227.48678-1-chee.yang.lee@intel.com>
References: <20201118132227.48678-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-24352.patch            | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 84f600cec0..11be545cb5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,6 +32,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://find_datadir.patch \
            file://usb-fix-setup_len-init.patch \
            file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
+           file://CVE-2020-24352.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
new file mode 100644
index 0000000000..861ff6c3b0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
@@ -0,0 +1,52 @@
+From ca1f9cbfdce4d63b10d57de80fef89a89d92a540 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 21 Oct 2020 16:08:18 +0530
+Subject: [PATCH 1/1] ati: check x y display parameter values
+
+The source and destination x,y display parameters in ati_2d_blt()
+may run off the vga limits if either of s->regs.[src|dst]_[xy] is
+zero. Check the parameter values to avoid potential crash.
+
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20201021103818.1704030-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [ https://git.qemu.org/?p=qemu.git;a=commitdiff;h=ca1f9cbfdce4d63b10d57de80fef89a89d92a540;hp=2ddafce7f797082ad216657c830afd4546f16e37 ]
+CVE: CVE-2020-24352
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/display/ati_2d.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/hw/display/ati_2d.c b/hw/display/ati_2d.c
+index 23a8ae0..4dc10ea 100644
+--- a/hw/display/ati_2d.c
++++ b/hw/display/ati_2d.c
+@@ -75,8 +75,9 @@ void ati_2d_blt(ATIVGAState *s)
+         dst_stride *= bpp;
+     }
+     uint8_t *end = s->vga.vram_ptr + s->vga.vram_size;
+-    if (dst_bits >= end || dst_bits + dst_x + (dst_y + s->regs.dst_height) *
+-        dst_stride >= end) {
++    if (dst_x > 0x3fff || dst_y > 0x3fff || dst_bits >= end
++        || dst_bits + dst_x
++         + (dst_y + s->regs.dst_height) * dst_stride >= end) {
+         qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
+         return;
+     }
+@@ -107,8 +108,9 @@ void ati_2d_blt(ATIVGAState *s)
+             src_bits += s->regs.crtc_offset & 0x07ffffff;
+             src_stride *= bpp;
+         }
+-        if (src_bits >= end || src_bits + src_x +
+-            (src_y + s->regs.dst_height) * src_stride >= end) {
++        if (src_x > 0x3fff || src_y > 0x3fff || src_bits >= end
++            || src_bits + src_x
++             + (src_y + s->regs.dst_height) * src_stride >= end) {
+             qemu_log_mask(LOG_UNIMP, "blt outside vram not implemented\n");
+             return;
+         }
+-- 
+1.8.3.1
+
-- 
2.17.1

