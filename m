Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SCrRW9L1yOXsv9m2nOnBUo3EPyStIkWlcXREX5Ncsdfz0gtjXv4Qyrt5OjMPwO+/A5CFXMEpeg
 SzoX4KfaxNRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568926"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568926"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:22 -0700
IronPort-SDR: r1PgwciF0lqcAswRbdR9vJGsMyrgYxHKRpAzhOqBl6ps3nec7GuYJHVBsbqiyCiHyXzqpMb92F
 +RK03fKwxo0A==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067619"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:21 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 63/64] qemu: fix CVE-2021-20257
Date: Mon, 26 Apr 2021 08:53:34 +0800
Message-Id: <5b66ff7972951db973d12f3dae6ccecf3bc29e56.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 547ac986a74cfcae39b691ebb92aadc8436443ea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20257.patch            | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20257.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 177e453fff..5797bbecf2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -53,6 +53,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
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
2.30.2

