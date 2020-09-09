Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8957.1599639107362172797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4sdH5bZjdoqqSUfnw86IB+vIb3T6RO41RcTHS75gkNzXpMu+uSKWwN48puN3UyP3Qqwnb+4pFE
 GPubTnuHfskA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155767021"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155767021"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:31 -0700
IronPort-SDR: zrHsF7DHcifDm3OF4KAMMjb2PVIntKl27iT02v4dKZeHoNyWQv9CvX4WkDLvUCqp+JmNHttIgj
 HMVtvplsC8xg==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371063"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 06/11] bind: Security Advisory - bind - CVE-2020-8622
Date: Wed,  9 Sep 2020 16:11:08 +0800
Message-Id: <b663e78f76965b228e1f91dda01c84158ff3756a.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhou <li.zhou@windriver.com>

Backport patch from <https://gitlab.isc.org/isc-projects/bind9/
commit/6ed167ad0a647dff20c8cb08c944a7967df2d415> to solve CVE-2020-8622.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bind/bind/CVE-2020-8622.patch             | 60 +++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.11.19.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8622.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8622.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8622.patch
new file mode 100644
index 0000000000..dec5672657
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
index a77be8678f..0bfd5799b3 100644
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
2.26.2

