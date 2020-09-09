Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.8877.1599639105300676967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: NyQyOYCIztisOoSYMK8UUnqWy9we4CsZuLrLmgkFCXPKDu0GhpPSPsrBaRYK0G2fOB3LngI2t5
 TZQiF4zfOoRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155766994"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155766994"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:25 -0700
IronPort-SDR: A4/Da5Sz2bhuyLR68YZCdbGEU4aOxU2I0nw5gWn6eKLke/YxPGnxggjreKLIM9gqorIDkx04Xt
 axbqxnlosmZA==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371040"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 02/11] qemu: CVE-2020-16092
Date: Wed,  9 Sep 2020 16:11:04 +0800
Message-Id: <a2b53aad25e731b8518160b122337945bdb0b811.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

Backport CVE patch from the upstream:
https://git.qemu.org/?p=qemu.git;a=commit;h=035e69b063835a5fd23cacabd63690a3d84532a8

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.26.2

