Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.40837.1597047524009565311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 01:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: li.wang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07A8Igip025114
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2020 01:18:43 -0700 (PDT)
Received: from pek-lwang1-u1404.wrs.com (128.224.162.178) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Mon, 10 Aug 2020 01:18:26 -0700
From: "Li Wang" <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH] qemu : fix CVE-2020-15863
Date: Mon, 10 Aug 2020 16:15:25 +0800
Message-ID: <1597047325-26870-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain

From: Li Wang <Li.Wang@windriver.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Li Wang <Li.Wang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-15863.patch            | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15863.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5cdba1f02c..8f40a28780 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-11869.patch \
            file://CVE-2020-13765.patch \
            file://CVE-2020-10702.patch \
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
2.17.1

