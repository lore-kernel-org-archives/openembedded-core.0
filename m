Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.141711.1598039291007402671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 12:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: stefan.ghinea@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07LJm9E3014464
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 12:48:10 -0700 (PDT)
Received: from localhost.localdomain (128.224.79.207) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 21 Aug 2020 12:47:50 -0700
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] [zeus] qemu: CVE-2020-10756
Date: Fri, 21 Aug 2020 22:47:47 +0300
Message-ID: <20200821194747.12221-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

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
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-10756.patch            | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10756.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5cdba1f02c..6b7c05ca4e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-11869.patch \
            file://CVE-2020-13765.patch \
            file://CVE-2020-10702.patch \
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
2.17.1

