Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8877.1599639105300676967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SgXp3Xxf0MhEqbMBTuKsmO9XoFkFhZabsGQAsYrt1t1haTxfxcb3u2LAmTJr46RaOAMT0eb9dQ
 ZXpfeAPkn0ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155767017"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155767017"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:29 -0700
IronPort-SDR: caKYFWXs1WhlrzxrhgBFcHd+M8zvl7U5rSAIXgWqfpev7QZk2g7Eiv5U5AWytTSeu3BpOz4RAE
 D1/7rPF1Kb6A==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371059"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:28 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 05/11] qemu : fix CVE-2020-15863
Date: Wed,  9 Sep 2020 16:11:07 +0800
Message-Id: <ca40a5840e384acd214356088a31f0f8c55b8da7.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <Li.Wang@windriver.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Li Wang <Li.Wang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-15863.patch            | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 702a817988..012be74855 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-10702.patch \
            file://CVE-2020-16092.patch \
            file://CVE-2020-10756.patch \
+           file://CVE-2020-15863.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
new file mode 100644
index 0000000000..9927584d11
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch
@@ -0,0 +1,64 @@
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
+CVE: CVE-2020-15863
+Upstream-Status: Backport
+[https://git.qemu.org/?p=qemu.git;a=commit;h=5519724a13664b43e225ca05351c60b4468e4555]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/net/xgmac.c | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
+index f49df95..f496f7e 100644
+--- a/hw/net/xgmac.c
++++ b/hw/net/xgmac.c
+@@ -217,21 +217,31 @@ static void xgmac_enet_send(XgmacState *s)
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
+1.9.1
+
-- 
2.26.2

