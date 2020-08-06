Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3036.1596707180669197707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 02:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: UgOKiqTR7D31BSkQ1gkEjpCLCKRFtTHXG0glaL0svtDslqa2W9CHBoV6z4c/JwuvepG86038gr
 IzipTTUJyLvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="170836658"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
   d="scan'208";a="170836658"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 02:46:20 -0700
IronPort-SDR: JBPzMoUijURPdTITaa+W/ctC/sgbrasK1TgOVPqcY0DCTDXRbFlV+vVrb9yH8JEonxfgU6oWq9
 eghexyhI7j2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
   d="scan'208";a="493610328"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by fmsmga005.fm.intel.com with ESMTP; 06 Aug 2020 02:46:20 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu : fix CVE-2020-15863
Date: Thu,  6 Aug 2020 17:46:18 +0800
Message-Id: <20200806094618.31973-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806094618.31973-1-chee.yang.lee@intel.com>
References: <20200806094618.31973-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-15863.patch            | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b1c822b1a8..56df73c067 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-13659.patch \
 	   file://CVE-2020-13800.patch \
 	   file://CVE-2020-13791.patch \
+	   file://CVE-2020-15863.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
new file mode 100644
index 0000000000..1505c7eed0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
@@ -0,0 +1,63 @@
+From 5519724a13664b43e225ca05351c60b4468e4555 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Fri, 10 Jul 2020 11:19:41 +0200
+Subject: [PATCH] hw/net/xgmac: Fix buffer overflow in xgmac_enet_send()
+
+A buffer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
+occurs while sending an Ethernet frame due to missing break statements
+and improper checking of the buffer size.
+
+Reported-by: Ziming Zhang <ezrakiez@gmail.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5519724a13664b43e225ca05351c60b4468e4555]
+CVE: CVE-2020-15863
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ hw/net/xgmac.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
+index 574dd47..5bf1b61 100644
+--- a/hw/net/xgmac.c
++++ b/hw/net/xgmac.c
+@@ -220,21 +220,31 @@ static void xgmac_enet_send(XgmacState *s)
+         }
+         len = (bd.buffer1_size & 0xfff) + (bd.buffer2_size & 0xfff);
+ 
++        /*
++         * FIXME: these cases of malformed tx descriptors (bad sizes)
++         * should probably be reported back to the guest somehow
++         * rather than simply silently stopping processing, but we
++         * don't know what the hardware does in this situation.
++         * This will only happen for buggy guests anyway.
++         */
+         if ((bd.buffer1_size & 0xfff) > 2048) {
+             DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
+                         "xgmac buffer 1 len on send > 2048 (0x%x)\n",
+                          __func__, bd.buffer1_size & 0xfff);
++            break;
+         }
+         if ((bd.buffer2_size & 0xfff) != 0) {
+             DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
+                         "xgmac buffer 2 len on send != 0 (0x%x)\n",
+                         __func__, bd.buffer2_size & 0xfff);
++            break;
+         }
+-        if (len >= sizeof(frame)) {
++        if (frame_size + len >= sizeof(frame)) {
+             DEBUGF_BRK("qemu:%s: buffer overflow %d read into %zu "
+-                        "buffer\n" , __func__, len, sizeof(frame));
++                        "buffer\n" , __func__, frame_size + len, sizeof(frame));
+             DEBUGF_BRK("qemu:%s: buffer1.size=%d; buffer2.size=%d\n",
+                         __func__, bd.buffer1_size, bd.buffer2_size);
++            break;
+         }
+ 
+         cpu_physical_memory_read(bd.buffer1_addr, ptr, len);
+-- 
+1.8.3.1
+
-- 
2.17.1

