Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.5558.1619154716288996009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N5BtoO024592
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 22:11:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 22:11:55 -0700
Received: from localhost.localdomain (128.224.72.54) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 22:11:55 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 6/6] qemu: fix CVE-2021-20257
Date: Fri, 23 Apr 2021 01:11:40 -0400
Message-ID: <20210423051140.106348-6-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423051140.106348-1-sakib.sajal@windriver.com>
References: <20210423051140.106348-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20257.patch            | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f41bda4f16..a0b7f19239 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -50,6 +50,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3416_8.patch \
            file://CVE-2021-3416_9.patch \
            file://CVE-2021-3416_10.patch \
+           file://CVE-2021-20257.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
new file mode 100644
index 0000000000..7175b24e99
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch
@@ -0,0 +1,55 @@
+From affdf476543405045c281a7c67d1eaedbcea8135 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 24 Feb 2021 13:45:28 +0800
+Subject: [PATCH] e1000: fail early for evil descriptor
+
+During procss_tx_desc(), driver can try to chain data descriptor with
+legacy descriptor, when will lead underflow for the following
+calculation in process_tx_desc() for bytes:
+
+            if (tp->size + bytes > msh)
+                bytes = msh - tp->size;
+
+This will lead a infinite loop. So check and fail early if tp->size if
+greater or equal to msh.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
+Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
+Cc: Prasad J Pandit <ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [3de46e6fc489c52c9431a8a832ad8170a7569bd8]
+CVE: CVE-2021-20257
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/e1000.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/net/e1000.c b/hw/net/e1000.c
+index cf22c4f07..c3564c7ce 100644
+--- a/hw/net/e1000.c
++++ b/hw/net/e1000.c
+@@ -670,6 +670,9 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
+         msh = tp->tso_props.hdr_len + tp->tso_props.mss;
+         do {
+             bytes = split_size;
++            if (tp->size >= msh) {
++                goto eop;
++            }
+             if (tp->size + bytes > msh)
+                 bytes = msh - tp->size;
+ 
+@@ -695,6 +698,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
+         tp->size += split_size;
+     }
+ 
++eop:
+     if (!(txd_lower & E1000_TXD_CMD_EOP))
+         return;
+     if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
+-- 
+2.29.2
+
-- 
2.25.1

