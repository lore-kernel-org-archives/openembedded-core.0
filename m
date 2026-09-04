Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590A1C79F83
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:00:16 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9551.1788512409467513020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=A/kqCkhp;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4977; q=dns/txt;
  s=iport01; t=1788512410; x=1789722010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0fuEG2w3xG6rGt3jy1sHUwy3WDcxgvtD3Noe7QAO1o0=;
  b=A/kqCkhp5hu918nDo/cTTGJYCkuqJqhggWBNs8opm5hCzo1dntDiWcAK
   GBo+jKn0khGtnHXbmzxV7ryQwR5JViD3F/oQVl+1NoqEEQf9OATwWI4UM
   oKbK45YLXBr+4w9xShjueITXYiz6Fq1bPKaAlmMIltbatWZGx6GO7Vm+X
   nX+rZSDcgqx9wRb8Y8IGbQm5A/VY67f4DKbIUxX00X43OKIwiVFaYukYJ
   2qrSw4y47WlyWGIeQRuVhifJG80/AtHghNK7bCXarPjf+1/el8RN5yjfg
   +LJqs3rRAsAsw7VMynq7jFbFig+91DPQ7oa+DKmD6yP88BurX8UEx2DDH
   w==;
X-CSE-ConnectionGUID: dFUzJcNYSkObsKr97IE08w==
X-CSE-MsgGUID: ydr77p8hS5S6nSFzYGPxbg==
X-IPAS-Result: =?us-ascii?q?A0C2AABwh5pq/48QJK1aHQEBAQEJARIBBQUBgX8FAQsBg?=
 =?us-ascii?q?lZ0YENJlkoDoBkPAQEBD0QNBAEBhQUCjgICJjcGDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBCwEBBQEBAQIBBwWBDhOGTw2QGQECAQMnCwEYAS0QHAMBAi8rIwgZgwIBg?=
 =?us-ascii?q?nQDEQbCOIF5M4EBgygBPwICQAFQ2zEBCxQBBYEzAYU+iCJdGAGEfCcbG4Fyh?=
 =?us-ascii?q?Ah2gQWBXAIBgUeGXQSCIoEMgVqBDpB/SIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BJ4M/Ixk2eoEJXoErKWABEheBCYIIAoJUggMCAUlDD?=
 =?us-ascii?q?gdHUwknQQQLGA1IESw3FRkEPm4Hjl8fglABYC0BKQEBggIDAzULFgijG4Iho?=
 =?us-ascii?q?Q8KKIN2jCKVOhozhVulEpkIjgqWUIRpgX4mgVlwFTuCZwkWNBkPjjmCA4Foh?=
 =?us-ascii?q?kDFeScyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:YuGETKgz/B7f+VnTve+BuEXaX161NhEKZh0ujC45NGQN5FlHY01je
 htvWDuEPPvZZTf3e98gPtvjoBwC75+Byt5hTQZp+X1kEyNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMuvrY8E8HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUU1NtlI2pox
 McbDzoWTQrS2MObmOKkH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYT/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFII3RHJgPzxnwS
 mTu7mjjXU4CZNyklAHb9EmClN7gpTPxV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cEHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Ixd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:J9uszK6LNgWV/sOWSQPXwBDXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPI
 5bAs5D4aXLfDtHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGthdB8MTMHfhLqWwLzM2faYEKA
 ==
X-Talos-CUID: 9a23:tOiV92MWMlJHMu5DVAda5mwfPPEecVrX11TKchCZJD45V+jA
X-Talos-MUID: 9a23:+AA85Qgp4ALmg9ywlMWICMMpJctyvPu2WEA2zK5YvfKqJx1fAyeXg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="829315297"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 09:00:08 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 6349718000133;
	Fri,  4 Sep 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id E7AF8CC12A7; Fri,  4 Sep 2026 02:00:07 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 2/6] curl: Fix CVE-2026-8924
Date: Fri,  4 Sep 2026 02:00:03 -0700
Message-Id: <20260904090007.27374-2-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260904090007.27374-1-devanshp@cisco.com>
References: <20260904090007.27374-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245079

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1]. Backporting it also protects downstream
configurations that enable libpsl.

[1] https://github.com/curl/curl/commit/51beed175dbfc37da3113f6acce60c630c070ce8
[2] https://curl.se/docs/CVE-2026-8924.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-8924.patch             | 127 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8924.patch b/meta/recipes-support/curl/curl/CVE-2026-8924.patch
new file mode 100644
index 0000000000..9f3ac9ae39
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8924.patch
@@ -0,0 +1,127 @@
+From b9eaedeb9d5440eae886c0b33f4ee48859d7123d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 16 May 2026 00:19:09 +0200
+Subject: [PATCH] cookie: trim trailing dots when checking PSL
+
+Verified with test 1629
+
+Closes #21636
+
+CVE: CVE-2026-8924
+Upstream-Status: Backport [https://github.com/curl/curl/commit/51beed175dbfc37da3113f6acce60c630c070ce8]
+
+Backport Changes:
+- curl 8.7.1 performs the PSL check inline in Curl_cookie_add(). Apply the
+  upstream trailing-dot length normalization at that equivalent code path.
+- Register test1629 in the target-generated Makefile.inc instead of the newer
+  Makefile.am list.
+
+(cherry picked from commit 51beed175dbfc37da3113f6acce60c630c070ce8)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/cookie.c            | 13 ++++++++--
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test1629     | 53 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 65 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test1629
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 67494d2855..11081e0ba0 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1032,12 +1032,21 @@ Curl_cookie_add(struct Curl_easy *data,
+     char lcookie[256];
+     size_t dlen = strlen(domain);
+     size_t clen = strlen(co->domain);
++
++    /* trim trailing dots */
++    if(dlen && (domain[dlen - 1] == '.'))
++      dlen--;
++    if(clen && (co->domain[clen - 1] == '.'))
++      clen--;
++
+     if((dlen < sizeof(lcase)) && (clen < sizeof(lcookie))) {
+       const psl_ctx_t *psl = Curl_psl_use(data);
+       if(psl) {
+         /* the PSL check requires lowercase domain name and pattern */
+-        Curl_strntolower(lcase, domain, dlen + 1);
+-        Curl_strntolower(lcookie, co->domain, clen + 1);
++        Curl_strntolower(lcase, domain, dlen);
++        lcase[dlen] = 0;
++        Curl_strntolower(lcookie, co->domain, clen);
++        lcookie[clen] = 0;
+         acceptable = psl_is_cookie_domain_acceptable(psl, lcase, lcookie);
+         Curl_psl_release(data);
+       }
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 461eb37b92..9fd47df771 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -207,7 +207,7 @@ test1598 \
+ test1600 test1601 test1602 test1603 test1604 test1605 test1606 test1607 \
+ test1608 test1609 test1610 test1611 test1612 test1613 test1614 test1615 \
+ \
+-test1620 test1621 \
++test1620 test1621 test1629 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 \
+ \
+diff --git a/tests/data/test1629 b/tests/data/test1629
+new file mode 100644
+index 0000000000..6ee479ba31
+--- /dev/null
++++ b/tests/data/test1629
+@@ -0,0 +1,53 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf="headers">
++HTTP/1.1 200 OK
++Content-Length: 6
++Set-Cookie: something=1; Domain=co.uk.; Path=/
++
++-foo-
++</data>
++</reply>
++
++# Client-side
++<client>
++<features>
++PSL
++cookies
++</features>
++<server>
++http
++</server>
++<name>
++cookies with trailing dot after PSL domain
++</name>
++<command>
++http://foo.co.uk.:%HTTPPORT/ http://bar.co.uk.:%HTTPPORT/ -b "" --resolve foo.co.uk.:%HTTPPORT:%HOSTIP --resolve bar.co.uk.:%HTTPPORT:%HOSTIP
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET / HTTP/1.1
++Host: foo.co.uk.:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++GET / HTTP/1.1
++Host: bar.co.uk.:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index c006649a1b..6516c95030 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -42,6 +42,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-8286.patch \
+    file://CVE-2026-8924.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


