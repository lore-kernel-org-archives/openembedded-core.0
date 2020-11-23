Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MrK8XEATLC+0oNCz5OBMfxeEk5WDuQ/hQuv0cFqqjlA/fmYnNNL0AaMvaDptuOjCA8JWgngpFY
 a9a5Qxzv62hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920771"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920771"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:34 -0800
IronPort-SDR: 7yI+LajkaoW7roiiR85K03/N0fEHPIBG30xE7DsAgwAzWui0uIwdwSIHRAaWS2c3owNQYY3/5E
 aEgTukAmj1Xg==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475258"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:33 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 21/21] qemu: fix CVE-2020-24352
Date: Mon, 23 Nov 2020 23:06:51 +0800
Message-Id: <12bee66a42a7c2a38789ddb37cb098bcbf0b3841.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.28.0

