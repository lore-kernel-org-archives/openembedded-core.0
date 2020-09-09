Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8877.1599639105300676967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MmMKUGY3oJZDA07yWr+stlgJDqEW1YDnOE2Sv6x3xds/UVKRW7r0/WQ+tFuEtSPU4S6VHYESUu
 S5v7eGhxZKZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155767011"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155767011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:28 -0700
IronPort-SDR: cbTsywm1aMv7ergVKmL8oCjJKDJor2Up5ChqeVc1Jf1QmveiZ4kxEfL7D7uEg/IVEVIXD5jS3k
 qUy0cc4kmsbQ==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371054"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:26 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 04/11] qemu: CVE-2020-10756
Date: Wed,  9 Sep 2020 16:11:06 +0800
Message-Id: <d40f9740fc992e40de9e24fa496baa7c7b6fb0ab.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

An out-of-bounds read vulnerability was found in the SLiRP networking
implementation of the QEMU emulator. This flaw occurs in the
icmp6_send_echoreply() routine while replying to an ICMP echo request,
also known as ping. This flaw allows a malicious guest to leak the
contents of the host memory, resulting in possible information disclosure.
This flaw affects versions of libslirp before 4.3.1.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-10756
https://bugzilla.redhat.com/show_bug.cgi?id=1835986

Upstream patches:
https://gitlab.freedesktop.org/slirp/libslirp/-/commit/c7ede54cbd2e2b25385325600958ba0124e31cc0

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-10756.patch            | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10756.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e686b24e80..702a817988 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-13765.patch \
            file://CVE-2020-10702.patch \
            file://CVE-2020-16092.patch \
+           file://CVE-2020-10756.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-10756.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-10756.patch
new file mode 100644
index 0000000000..306aef061b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-10756.patch
@@ -0,0 +1,40 @@
+From c7ede54cbd2e2b25385325600958ba0124e31cc0 Mon Sep 17 00:00:00 2001
+From: Ralf Haferkamp <rhafer@suse.com>
+Date: Fri, 3 Jul 2020 14:51:16 +0200
+Subject: [PATCH] Drop bogus IPv6 messages
+
+Drop IPv6 message shorter than what's mentioned in the payload
+length header (+ the size of the IPv6 header). They're invalid an could
+lead to data leakage in icmp6_send_echoreply().
+
+CVE: CVE-2020-10756
+Upstream-Status: Backport
+https://gitlab.freedesktop.org/slirp/libslirp/-/commit/c7ede54cbd2e2b25385325600958ba0124e31cc0
+
+[SG: Based on libslirp commit c7ede54cbd2e2b25385325600958ba0124e31cc0 and adjusted context]
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ slirp/src/ip6_input.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/slirp/src/ip6_input.c b/slirp/src/ip6_input.c
+index d9d2b7e9..0f2b1785 100644
+--- a/slirp/src/ip6_input.c
++++ b/slirp/src/ip6_input.c
+@@ -49,6 +49,13 @@ void ip6_input(struct mbuf *m)
+         goto bad;
+     }
+ 
++    // Check if the message size is big enough to hold what's
++    // set in the payload length header. If not this is an invalid
++    // packet
++    if (m->m_len < ntohs(ip6->ip_pl) + sizeof(struct ip6)) {
++        goto bad;
++    }
++
+     /* check ip_ttl for a correct ICMP reply */
+     if (ip6->ip_hl == 0) {
+         icmp6_send_error(m, ICMP6_TIMXCEED, ICMP6_TIMXCEED_INTRANS);
+-- 
+2.17.1
+
-- 
2.26.2

