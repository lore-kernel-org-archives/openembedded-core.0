Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C4CC44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:48:23 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89495.1782730092612328433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KXI3E/c3;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2809; q=dns/txt;
  s=iport01; t=1782730092; x=1783939692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M/nm4iOss0tzANtkX6HlTXnwI9DY8Yeg/mzhbpm7Epk=;
  b=KXI3E/c3Epz7U8sF2rEQvVn2DAS0G6q08R5UPMQjfoWh/75/SbC+sYJG
   wtlw/A1gtFhqOw4hAzGjyQrajaxPoW3vTahXpeO9iOn/H+CTBS/MiJxFl
   SMp2Jj1E0fifqb0mtjkmZOsH6RJ0H8yo1XjMayd1PZ4GAVg3LOsvpNztG
   iU6S+HL4SZFHG2Bp6M5GI2YJ7TBsIa3LDQRyQFrWN1oUV7O2039WIKX48
   EWP2x4APX9vAS7Unm+uNv30SE0LjJMV7j8b5C84BZTcRiEYCh8cSkzHLz
   4fQ383rWpAm9iV436AhkjsWcNs3kMQxU9sl2CAToymXUA2b1UJVLeNP3Q
   Q==;
X-CSE-ConnectionGUID: /eWckEDISauxNoFCtmARjA==
X-CSE-MsgGUID: DXgdV2oTTeGPhUzxvUdFYQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgBFTEJq/5P/Ja1aglmCV3RfQkmWSwOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUGAo1LAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJzAgERBrYPgXkzgQGDK?=
 =?us-ascii?q?AExBQkCAkABUNssAQsUAQWBM4U/iB9bGAGEfCcbG4FygRWDaYEFgVwBAQGBJ?=
 =?us-ascii?q?ipchXgEgiKBDIFajy9IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbB?=
 =?us-ascii?q?wWBHYFpgQSEfSMfAzl/gTB1WGYVMDWBAgERHgqBUicDCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?4xeFw+CPQEFJzQtASkCIIIdBaVgoQ8KKIN1jCGVOhozqmyZCI4KllCEaIFoP?=
 =?us-ascii?q?IFHCwdwFYMiCRY0GQ+OOINrgX+EQcIQJDUCCTIBAQcCBw4DC4FokAACJoFVA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:/Gl1la26QHBvsNSNMfbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzACy
 mAXDWCHaPzZa2akLYhwbIvgoE1XvcKHydE2TQs+3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2AuYjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGS0wJNo411sdMCHxe0
 /s2AywIRyqBrrfjqF67YrEEasULNsLnOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUifC/FMEg9/5JYWleuvgHb2aTBwo1OOrq1x6G/WpOB0+OW1aoCPJITQGa25mG60l
 m3KwT7+Pi0XG+Sf9CiV7E+gqN72yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:uin7Oa6QWqEkC7XTugPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcW2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:+N9G725EWyX9qQPHedsss0MrEcMIXlzmxWrABUiWInpsYYeXYArF
X-Talos-MUID: 9a23:E0Ii/Qim1cbrg9zR+zYaesMpGPdn75r0D3wxnLo+u/SWJTJNNxmstWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="502226024"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 10:48:11 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 9A2F518000897;
	Mon, 29 Jun 2026 10:48:11 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 478F5CC12A6; Mon, 29 Jun 2026 03:48:11 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 2/7] curl: fix CVE-2026-5545
Date: Mon, 29 Jun 2026 03:47:52 -0700
Message-ID: <20260629104801.972184-2-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629104801.972184-1-adongare@cisco.com>
References: <20260629104801.972184-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239747

From: Anil Dongare <adongare@cisco.com>

Backport the upstream fix [1] for the Negotiate-authenticated connection
reuse issue described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd
[2] https://curl.se/docs/CVE-2026-5545.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-5545

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../curl/curl/CVE-2026-5545.patch             | 44 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5545.patch b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
new file mode 100644
index 0000000000..34400176f0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
@@ -0,0 +1,44 @@
+From b98d817a2c168834747ba4721b8d66cd1e683578 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 5 Jun 2026 01:17:44 -0700
+Subject: [PATCH] url: improve connection reuse on negotiate
+
+Check state of negotiate to allow proper connection reuse.
+
+Closes #21203
+
+CVE: CVE-2026-5545
+Upstream-Status: Backport [https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd]
+
+Backport Changes:
+- curl-8.7.1 still performs the NTLM/Negotiate reuse logic inline in
+  ConnectionExists(), so the upstream guard was adapted there.
+
+(cherry picked from commit 33e43985b8f3b9e66691d06e70be0395849856cd)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/url.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 759a994..34a3470 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1226,8 +1226,14 @@ ConnectionExists(struct Curl_easy *data,
+          Curl_timestrcmp(needle->passwd, check->passwd)) {
+
+         /* we prefer a credential match, but this is at least a connection
+-           that can be reused and "upgraded" to NTLM */
++           that can be reused and "upgraded" to NTLM if it does
++           not have any auth ongoing. */
++#ifdef USE_SPNEGO
++        if((check->http_ntlm_state == NTLMSTATE_NONE) &&
++           (check->http_negotiate_state == GSS_AUTHNONE))
++#else
+         if(check->http_ntlm_state == NTLMSTATE_NONE)
++#endif
+           chosen = check;
+         continue;
+       }
+--
+2.43.7
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ad7ceceb69..5d0133f605 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2026-1965-2.patch \
     file://CVE-2026-3783.patch \
     file://CVE-2026-3784.patch \
+    file://CVE-2026-5545.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.51.0


