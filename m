Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CB4CA600C
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:24:15 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7415.1791372244657212687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ekLriJsn;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2398; q=dns/txt;
  s=iport01; t=1791372244; x=1792581844;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WZzKJXOXY4NIUu9VP/ejiL27MTGzNM+V+kr6AAMZJc0=;
  b=ekLriJsnc2bIml3zlW5phBbhCmhlge5EsHpuw4AYLDUimdfvn7MK6yEy
   CL0N+fINiQa2fh3LpqzKdA+SUVL1KLH/pIm/M6kgP1zKv/feEwLuXyk7Y
   KsKpFuXzR8jZRv1Z1RhsdDIkDBkheDTtaSJTXoEPLNYEiRImj40QvUbDB
   JdKzgXr4utATxQ9QGZDT2mYIdScALzz1qW5UxZYvxnX2AgDihOyP+/R3j
   jiuYcXHmgkR0jXN16FB2Fpr1vSwSkI09lgDU74fqUzaK7IA/kc6KkkaDq
   pJbBC1tcUD6f26uFkJMn8CT0crLpfjaJFHkX/1tyrW8DwGIqOu2YG/DDu
   w==;
X-CSE-ConnectionGUID: aCrLLA6QSdGTcsivVCp+hA==
X-CSE-MsgGUID: bXSYS2XOQMWyeDvAAeCfjw==
X-IPAS-Result: =?us-ascii?q?A0BFAgCcKsZq/5L/Ja1aglmCV3VhQkmUKYIhA54agX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBMCAQMyARgBPSAxKysZgwIBgnQCAREGtWaCLIEBgykBPwICQ?=
 =?us-ascii?q?AFQ2zIBCxQBgTiFQIgjdQGEfCcbG4FyhH6BBYFcAgEBGIIThXgEgiKBDIF4Z?=
 =?us-ascii?q?ZJySIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2e?=
 =?us-ascii?q?oEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4P?=
 =?us-ascii?q?AkoQRcMKRgNSBEsNxUZBD5uB5BbHoJgAVkHLSoBAQSBUDE4pWWhDwoog3aMI?=
 =?us-ascii?q?pU6GjOqb5kIjgqVNoEahGmBaDyBWXAVO4JnCRY0GQ+OOYNrhROBLcV5JDUCA?=
 =?us-ascii?q?QEHMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:ktFUBqlRuxf9M1dA/T4Bp6vo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWDyAOq3bazSjL49zaYzk/UJQ7JTTndMxHVdt/HtmEFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMs/3b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYQz4MJTKD93z
 vA3FDsWbw69rPr1wJvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZD/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKIIYbXH5wNxxzwS
 mTu9VTCMypABPum7AWU/16yr8bCti35R9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cH3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:uCfyNaPzBnGHB8BcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:tjGFRmyGMEyX2N3BwXkvBgUdMdoBVlSD9UzcDHOzEmd3dpaNCl+5rfY=
X-Talos-MUID: 9a23:RQq5IQnOBf/kx0g5PctudnpoBPxZ2P6eL3koroQLl9etHCFbNTWC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="532521012"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 11:24:03 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id A5BC418000230
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 11:24:03 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 4EAC0CBF203; Wed,  7 Oct 2026 04:24:03 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 4/8] curl: ignore CVE-2026-8924
Date: Wed,  7 Oct 2026 04:23:59 -0700
Message-Id: <20261007112403.486499-4-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261007112403.486499-1-devanshp@cisco.com>
References: <20261007112403.486499-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247389

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- curl identifies commit 51beed175dbfc37da3113f6acce60c630c070ce8 as
  the fix for trailing-dot domains bypassing the PSL cookie check. [1]
- The upstream fix changes is_public_suffix() and adds a regression test
  that requires PSL support. [2]
- Scarthgap curl 8.7.1 is configured with --without-libpsl, so the PSL
  check addressed by this fix is not built. [3]
- curl notes that builds without PSL cannot protect against overly broad
  cookies; this status describes the absent PSL check path. [1]
- Hence ignoring the CVE for now.

Reference:
[1] https://curl.se/docs/CVE-2026-8924.html
[2] https://github.com/curl/curl/commit/51beed175dbfc37da3113f6acce60c630c070ce8
[3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.7.1.bb?h=scarthgap

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 38083b5842..e361e6d6b1 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -58,6 +58,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
+CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
-- 
2.35.6


