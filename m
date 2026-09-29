Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A918CA5FB3
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:18:40 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.655.1790655517558975401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cQ6uvzjB;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3514; q=dns/txt;
  s=iport01; t=1790655517; x=1791865117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZSBU+hkMiyqkuYAAiGJ6YYWtNGBaUCtRgI5/YNAXevM=;
  b=cQ6uvzjBhereDkpDALm4MejsGaoNUfCDKOtQ6J03ETrVrXwgDUidSS1o
   eG5wtyXLMzEgFVLzA3vAWB4ujeE49zO4/zM5twwduzQYccWJZxK5aofJ4
   twvaoblk26WrHSft05jqzXGSRArCajZSlJMYky3XsuP6OSYRwqyTaGxtE
   o4GQ3dWpnVwUvXQJyPuMFYJJ4qkRY8cnJty3+FWTnq8t9O6YAAxvbuWMW
   ODgzfsXXt2sEupyOfL0e//zmfhsDlM4rYnyc8/64yP+zGtb4ZyPyuwr0k
   HrgglEGhQGDd2e9M02t7RnRLQ7+PYmgSzn5MFHZweYa5k2ngEpyDVu0u4
   w==;
X-CSE-ConnectionGUID: dV/fGTf4Smi0IdNBuyFRbw==
X-CSE-MsgGUID: QuCQxboaQX2W8BkZhaUP3Q==
X-IPAS-Result: =?us-ascii?q?A0BGAgBDO7tq/5D/Ja1aHgEBCxIMggULgld1YUJJlkqLZ?=
 =?us-ascii?q?5I2gX4PAQEBD0QNBAEBhD9GjgoCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEqCwEYAS0sAwECTwsjIYMCAYI6AzcCARHAA?=
 =?us-ascii?q?YF5M4EBgykBPwJDUNhLDYJaAQsUAQWBM4VAgn+FJF0YAYR8JxsbgXKBFYNpg?=
 =?us-ascii?q?QWBGkIBAQKIIwSCIoEMgVoekzhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQcbBgWBHYEgghkjGTZ6gQlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTC?=
 =?us-ascii?q?SVFEkcmIggSCQETGjALgSE4QQkoPxgNSBEsNxUZBD5uB5A/HoIYTQF6CQoBK?=
 =?us-ascii?q?gEigSFBo32CIaAecQoog3aMIo8+hXwaM4QElBeSVAuYfY4KhAmRX2iEaYFoP?=
 =?us-ascii?q?IFHCwdwFYMiCUoZD445g2uBf4MUxyYkNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:aGZ8Dazn7gtjd3ZkkN56t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUFz
 mdOUW+Gbv6MZGWjf40iYIWw8kIAusTTzIRmSwtuqFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWYlaDJMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJE0IeoM3xugrOmRPr
 d0UDhoQfz65jf3jldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW3YIeOJYbRGK25mG6hu
 0n/727+CygqbuPP4zm38nuRvrT2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:S5oZGKiZbAf4AghiABaTZAuwuHBQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:Z8P6+GNRkqz1me5DVBcg+mEoFJwed3yF7Xv2CVKpJ1xjV+jA
X-Talos-MUID: 9a23:l7RVVwp0Cu9rea2me2wezwh/H/546aOnMXBXrsUsuPuEPBFIYA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528537235"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:18:36 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A4F01180003C9;
	Tue, 29 Sep 2026 04:18:36 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 4AC62CC1292; Mon, 28 Sep 2026 21:18:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 1/8] libxml2: Fix CVE-2026-86137
Date: Mon, 28 Sep 2026 21:18:29 -0700
Message-Id: <20260929041836.2217090-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246813

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/76fe08d97de88bfaef2f7d5cd27f11954cc5bee2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86137

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86137.patch       | 59 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
new file mode 100644
index 0000000000..a756883d46
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
@@ -0,0 +1,59 @@
+From a9d489b86e46188d1c0fde7dbd0aa8281596e6d6 Mon Sep 17 00:00:00 2001
+From: Hieu Le Minh <leminhhieu.opensource@gmail.com>
+Date: Sat, 18 Apr 2026 21:18:24 +0700
+Subject: [PATCH] xmlregexp: Prevent out-of-bounds read in NXT macro
+
+Fixes: https://gitlab.gnome.org/GNOME/libxml2/-/issues/1099
+
+CVE: CVE-2026-86137
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/76fe08d97de88bfaef2f7d5cd27f11954cc5bee2]
+
+Backport Changes:
+- Add the parser-context length field and allocation-failure guard required by the Scarthgap 2.12.10 source, which lacks both pieces of the upstream context.
+- The allocation-failure guard is completed by the subsequent CVE-2026-86141.patch, which moves strlen() after the xmlStrdup() null check; keep that patch after this one in SRC_URI.
+
+(cherry picked from commit 76fe08d97de88bfaef2f7d5cd27f11954cc5bee2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlregexp.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/xmlregexp.c b/xmlregexp.c
+index f434a0cf..320a35ce 100644
+--- a/xmlregexp.c
++++ b/xmlregexp.c
+@@ -56,7 +56,9 @@
+     xmlRegexpErrCompile(ctxt, str);
+ #define NEXT ctxt->cur++
+ #define CUR (*(ctxt->cur))
+-#define NXT(index) (ctxt->cur[index])
++#define NXT(index)									\
++    (((size_t)(ctxt->cur + index - ctxt->string) < ctxt->len)				\
++      ? ctxt->cur[index] : 0)
+ 
+ #define NEXTL(l) ctxt->cur += l;
+ #define XML_REG_STRING_SEPARATOR '|'
+@@ -245,6 +247,7 @@ typedef xmlRegParserCtxt *xmlRegParserCtxtPtr;
+ struct _xmlAutomata {
+     xmlChar *string;
+     xmlChar *cur;
++    size_t len;
+ 
+     int error;
+     int neg;
+@@ -698,8 +701,14 @@ xmlRegNewParserCtxt(const xmlChar *string) {
+     if (ret == NULL)
+ 	return(NULL);
+     memset(ret, 0, sizeof(xmlRegParserCtxt));
+-    if (string != NULL)
++    if (string != NULL) {
+ 	ret->string = xmlStrdup(string);
++	ret->len = strlen((const char *) ret->string);
++        if (ret->string == NULL) {
++            xmlFree(ret);
++            return(NULL);
++        }
++    }
+     ret->cur = ret->string;
+     ret->neg = 0;
+     ret->negs = 0;
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index d476ba14b6..e4db345af4 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -32,6 +32,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-0992-03.patch \
            file://CVE-2026-1757.patch \
            file://CVE-2026-11979.patch \
+           file://CVE-2026-86137.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


