Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.60202.1597726282723070287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 21:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: li.wang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07I4pL73029719
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 21:51:22 -0700 (PDT)
Received: from 6327d4c8e1cb.wrs.com (128.224.162.178) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 17 Aug 2020 21:51:21 -0700
From: "Li Wang" <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][poky][zeus][PATCH] qemu: CVE-2020-16092
Date: Tue, 18 Aug 2020 04:48:17 +0000
Message-ID: <20200818044817.18740-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Backport CVE patch from the upstream:
https://git.qemu.org/?p=qemu.git;a=commit;h=035e69b063835a5fd23cacabd63690a3d84532a8

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-16092.patch            | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5cdba1f02c..e686b24e80 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-11869.patch \
            file://CVE-2020-13765.patch \
            file://CVE-2020-10702.patch \
+           file://CVE-2020-16092.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch
new file mode 100644
index 0000000000..8ce01e26ad
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-16092.patch
@@ -0,0 +1,49 @@
+From 035e69b063835a5fd23cacabd63690a3d84532a8 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Sat, 1 Aug 2020 18:42:38 +0200
+Subject: [PATCH] hw/net/net_tx_pkt: fix assertion failure in
+ net_tx_pkt_add_raw_fragment()
+
+An assertion failure issue was found in the code that processes network
+packets
+while adding data fragments into the packet context. It could be abused
+by a
+malicious guest to abort the QEMU process on the host. This patch
+replaces the
+affected assert() with a conditional statement, returning false if the
+current
+data fragment exceeds max_raw_frags.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Ziming Zhang <ezrakiez@gmail.com>
+Reviewed-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-16092
+[https://git.qemu.org/?p=qemu.git;a=commit;h=035e69b063835a5fd23cacabd63690a3d84532a8]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ hw/net/net_tx_pkt.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
+index 162f802..54d4c3b 100644
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
+2.17.1
+
-- 
2.17.1

