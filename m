Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.9137.1600421824581542933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: XmTgLqO7M7D8d/AZHMEZGKPqQpVoG8gxKkmAeSpZarw+pgM5T69Nf++2qqEyR6Z6TPTd/83VRp
 J8U10T3J96CQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159953943"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="159953943"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 02:37:03 -0700
IronPort-SDR: FiSyvO8WxplbePhuiUsYKi9SRSncQM6nHBKak9QAjXgY6iwakHbtZ8QAaxW/HGyMIBKuIuM4N8
 wgw4TyiJdx7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="484135147"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga005.jf.intel.com with ESMTP; 18 Sep 2020 02:37:02 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/2] qemu : fix CVE-2020-16092
Date: Fri, 18 Sep 2020 17:37:01 +0800
Message-Id: <20200918093702.30262-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-16092.patch            | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e0ea5ad477..7ce89c0023 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -47,6 +47,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-15863.patch \
 	   file://CVE-2020-14364.patch \
 	   file://CVE-2020-14415.patch \
+	   file://CVE-2020-16092.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch
new file mode 100644
index 0000000000..5085a28a4f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch
@@ -0,0 +1,45 @@
+From 035e69b063835a5fd23cacabd63690a3d84532a8 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Sat, 1 Aug 2020 18:42:38 +0200
+Subject: [PATCH] hw/net/net_tx_pkt: fix assertion failure in
+ net_tx_pkt_add_raw_fragment()
+
+An assertion failure issue was found in the code that processes network packets
+while adding data fragments into the packet context. It could be abused by a
+malicious guest to abort the QEMU process on the host. This patch replaces the
+affected assert() with a conditional statement, returning false if the current
+data fragment exceeds max_raw_frags.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Ziming Zhang <ezrakiez@gmail.com>
+Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=035e69b063835a5fd23cacabd63690a3d84532a8]
+CVE: CVE-2020-16092
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/net/net_tx_pkt.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
+index 9560e4a..da262ed 100644
+--- a/hw/net/net_tx_pkt.c
++++ b/hw/net/net_tx_pkt.c
+@@ -379,7 +379,10 @@ bool net_tx_pkt_add_raw_fragment(struct NetTxPkt *pkt, hwaddr pa,
+     hwaddr mapped_len = 0;
+     struct iovec *ventry;
+     assert(pkt);
+-    assert(pkt->max_raw_frags > pkt->raw_frags);
++
++    if (pkt->raw_frags >= pkt->max_raw_frags) {
++        return false;
++    }
+ 
+     if (!len) {
+         return true;
+-- 
+1.8.3.1
+
-- 
2.17.1

