Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2745.1599034870130569784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: li.zhou@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0828Knqb004320
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Sep 2020 01:20:59 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 2 Sep
 2020 01:20:20 -0700
From: "Li Zhou" <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe][zeus][PATCH 1/3] bind: Security Advisory - bind - CVE-2020-8622
Date: Wed, 2 Sep 2020 16:19:29 +0800
Message-ID: <1599034771-87010-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Content-Type: text/plain

Backport patch from <https://gitlab.isc.org/isc-projects/bind9/
commit/6ed167ad0a647dff20c8cb08c944a7967df2d415> to solve CVE-2020-8622.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../bind/bind/CVE-2020-8622.patch                  | 60 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.11.19.bb     |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8622.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8622.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8622.patch
new file mode 100644
index 0000000..dec5672
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2020-8622.patch
@@ -0,0 +1,60 @@
+From ca543240380475d888d660ea3296fc880ce52f35 Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Wed, 15 Jul 2020 16:07:51 +1000
+Subject: [PATCH] bind: Always keep a copy of the message
+
+this allows it to be available even when dns_message_parse()
+returns a error.
+
+Upstream-Status: Backport
+CVE: CVE-2020-8622
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ lib/dns/message.c | 24 +++++++++++++-----------
+ 1 file changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/lib/dns/message.c b/lib/dns/message.c
+index ac637a2..39ed80f 100644
+--- a/lib/dns/message.c
++++ b/lib/dns/message.c
+@@ -1679,6 +1679,19 @@ dns_message_parse(dns_message_t *msg, isc_buffer_t *source,
+ 	msg->header_ok = 0;
+ 	msg->question_ok = 0;
+ 
++	if ((options & DNS_MESSAGEPARSE_CLONEBUFFER) == 0) {
++		isc_buffer_usedregion(&origsource, &msg->saved);
++	} else {
++		msg->saved.length = isc_buffer_usedlength(&origsource);
++		msg->saved.base = isc_mem_get(msg->mctx, msg->saved.length);
++		if (msg->saved.base == NULL) {
++			return (ISC_R_NOMEMORY);
++		}
++		memmove(msg->saved.base, isc_buffer_base(&origsource),
++			msg->saved.length);
++		msg->free_saved = 1;
++	}
++
+ 	isc_buffer_remainingregion(source, &r);
+ 	if (r.length < DNS_MESSAGE_HEADERLEN)
+ 		return (ISC_R_UNEXPECTEDEND);
+@@ -1754,17 +1767,6 @@ dns_message_parse(dns_message_t *msg, isc_buffer_t *source,
+ 	}
+ 
+  truncated:
+-	if ((options & DNS_MESSAGEPARSE_CLONEBUFFER) == 0)
+-		isc_buffer_usedregion(&origsource, &msg->saved);
+-	else {
+-		msg->saved.length = isc_buffer_usedlength(&origsource);
+-		msg->saved.base = isc_mem_get(msg->mctx, msg->saved.length);
+-		if (msg->saved.base == NULL)
+-			return (ISC_R_NOMEMORY);
+-		memmove(msg->saved.base, isc_buffer_base(&origsource),
+-			msg->saved.length);
+-		msg->free_saved = 1;
+-	}
+ 
+ 	if (ret == ISC_R_UNEXPECTEDEND && ignore_tc)
+ 		return (DNS_R_RECOVERABLE);
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.11.19.bb b/meta/recipes-connectivity/bind/bind_9.11.19.bb
index a77be86..0bfd579 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.19.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2020-8622.patch \
            "
 
 SRC_URI[sha256sum] = "0dee554a4caa368948b32da9a0c97b516c19103bc13ff5b3762c5d8552f52329"
-- 
1.9.1

