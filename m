Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XByGwHB4OUV3ZIYk/LE4Fk/M64rwZbO289Se7gEoZs0NjEsHwcwzU4jOfbKI1w7HHb2Ue1232p
 0MZ0RpDaFIeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752368"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752368"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:30 -0800
IronPort-SDR: 9ZlhY6PfWdoT81bQQw3QdJfFTAhxzMC+JuTmLdpROpzzb+0xmES27FJ8+svyg5NUARhb25h9/b
 qkO2WATReqqQ==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670761"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/19] qemu: CVE-2020-29129 CVE-2020-29130
Date: Mon, 14 Dec 2020 11:35:04 +0800
Message-Id: <0a9a9a4d524c5b932cc24f51994368e07dd2e81f.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-29129
https://nvd.nist.gov/vuln/detail/CVE-2020-29130

backport patch from:
https://git.qemu.org/?p=libslirp.git;a=commit;h=2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5eda809a41732dfa4988799360be3d1280c1209)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/CVE-2020-29129-CVE-2020-29130.patch  | 64 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 11be545cb5..bbe2a39755 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://usb-fix-setup_len-init.patch \
            file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
            file://CVE-2020-24352.patch \
+           file://CVE-2020-29129-CVE-2020-29130.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch
new file mode 100644
index 0000000000..e5829f6dad
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch
@@ -0,0 +1,64 @@
+From 2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 26 Nov 2020 19:27:06 +0530
+Subject: [PATCH] slirp: check pkt_len before reading protocol header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+While processing ARP/NCSI packets in 'arp_input' or 'ncsi_input'
+routines, ensure that pkt_len is large enough to accommodate the
+respective protocol headers, lest it should do an OOB access.
+Add check to avoid it.
+
+CVE-2020-29129 CVE-2020-29130
+  QEMU: slirp: out-of-bounds access while processing ARP/NCSI packets
+ -> https://www.openwall.com/lists/oss-security/2020/11/27/1
+
+Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20201126135706.273950-1-ppandit@redhat.com>
+Reviewed-by: Marc-AndrÃ Lureau <marcandre.lureau@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-29129 CVE-2020-29130
+[https://git.qemu.org/?p=libslirp.git;a=commit;h=2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f]
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ slirp/src/ncsi.c  | 4 ++++
+ slirp/src/slirp.c | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/slirp/src/ncsi.c b/slirp/src/ncsi.c
+index 3c1dfef..75dcc08 100644
+--- a/slirp/src/ncsi.c
++++ b/slirp/src/ncsi.c
+@@ -148,6 +148,10 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
+     uint32_t checksum;
+     uint32_t *pchecksum;
+ 
++    if (pkt_len < ETH_HLEN + sizeof(struct ncsi_pkt_hdr)) {
++        return; /* packet too short */
++    }
++
+     memset(ncsi_reply, 0, sizeof(ncsi_reply));
+ 
+     memset(reh->h_dest, 0xff, ETH_ALEN);
+diff --git a/slirp/src/slirp.c b/slirp/src/slirp.c
+index dba7c98..9be58e2 100644
+--- a/slirp/src/slirp.c
++++ b/slirp/src/slirp.c
+@@ -756,6 +756,10 @@ static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
+         return;
+     }
+ 
++    if (pkt_len < ETH_HLEN + sizeof(struct slirp_arphdr)) {
++        return; /* packet too short */
++    }
++
+     ar_op = ntohs(ah->ar_op);
+     switch (ar_op) {
+     case ARPOP_REQUEST:
+-- 
+2.17.1
+
-- 
2.29.2

