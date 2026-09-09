Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A319EC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 19:00:49 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20280.1788980446992263288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 12:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Mrt+KD/W;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2539; q=dns/txt;
  s=iport01; t=1788980446; x=1790190046;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=96hEnka7MY3GlLm74OHGzmahQcQ7dUZJ5ywBP3AIKQI=;
  b=Mrt+KD/WI4htcyTf3L4ANYOJLBVq6SXxgZhMv3p7KedwGe60+B2IWERm
   OE+Var4NsIflSvQZJHPMjTfdzDHEeuI5Q4OjLZiDDFem9awE3tYLBnzD5
   Gm63LiIO8dHV0PARTdjmPttNbf199g1shwMaZNzQjrE1LrvDm/ej62LkA
   PLsifXDZsTBJGze3auzoJ4/oaBigdbS9o7dSfD1kNMYe1Is3q+QkyTdkJ
   uVJk4vec1tcxXKxaGSf2mIQyv5D7Gx89a5UY8c6YGm2cb8/7PB1quZEZN
   0+4fn7XK6wnDVp1dfs79ydmhqpvtkFkmDt3SNwoJ0X7bF3zSq2jahhJnH
   w==;
X-CSE-ConnectionGUID: XNVnGWF5SqG0Cu3/1gBVFg==
X-CSE-MsgGUID: oaA2ITjqQrmgMauDiCSPhw==
X-IPAS-Result: =?us-ascii?q?A0BCAgDZq6Fq/44QJK1aHgEBCxIMggULgld0YENJlkqeH?=
 =?us-ascii?q?oF+DwEBAQ9EDQQBAYUFjgcCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBU2ARgBLTBcRBuCZwGCdAMRBsE2giyBAYMoAT8CAkABU?=
 =?us-ascii?q?NsxAQsUAQWBM4U/iCJ1AYR8JxsbgXKBFYNpgQWBXAIBgiyFeASCIoEMgXiBN?=
 =?us-ascii?q?ZEBSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2e?=
 =?us-ascii?q?oEJXoErKWABEheBB4IIAoJUggECAUlDDgdFUwknQQoSUykECxgNSBEsNxUZB?=
 =?us-ascii?q?D5uB48iH4JYYS0qAQGCBScRkziQDIIhoQ8KKIN2jCKVOhozqm0umFqOCpU2S?=
 =?us-ascii?q?lCEaYFoPIFZcBWDIgkWNBkPjjmDa4ZAxXknMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:SwVIqq4jLbaS0YE1p2kriQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mZOCmnXb/eJZmv8ctwkO4S/pBkH7ZfXytNkT1Fkrys1Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajNMuvrYwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eDasm/MlILzx17
 NNAAy1WKUmMrdyYz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0cn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIGIJYbWFJQI9qqej
 mXP1j7YPhMDDcaaxh+M716trdT3nTyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjVCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1qt94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:c/34eaH6NWxb8qWBpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:DoldgGMQjuwZbu5DaA9Z8mErNJ0ea1KF52qLZBa3I1hHR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AhlfsTAxSlrhZR+hed0LPelQeUyuaqKOnIRosrZc?=
 =?us-ascii?q?fgtOBOgl5Jhucpw+PQpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="835724995"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Sep 2026 19:00:45 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id B5B1618000207;
	Wed,  9 Sep 2026 19:00:45 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 5A1D3CC12A8; Wed,  9 Sep 2026 12:00:45 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] curl: set CVE_STATUS for CVE-2026-8458
Date: Wed,  9 Sep 2026 12:00:45 -0700
Message-Id: <20260909190045.5077-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 19:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245490

From: Devansh Patel <devanshp@cisco.com>

CVE-2026-8458 allows a Negotiate-authenticated connection to be
incorrectly reused for a request using a different SASL service name.

Scarthgap uses curl 8.7.1, which is within the affected version range.
The vulnerable code path on Linux requires both Negotiate authentication
and GSSAPI support, represented by the negotiate-auth and krb5
PACKAGECONFIG options.

The upstream fix [1] stores the SASL service name in struct Curl_creds
and includes it in connection-reuse comparisons. However, struct
Curl_creds was introduced by the credential-management rework in [2],
after curl 8.7.1. Therefore, the security fix cannot be cleanly
backported without introducing a substantial credential-management
refactor.

Use a conditional CVE_STATUS as the least invasive solution. Report the
CVE as unpatched when both krb5 and negotiate-auth are enabled. Otherwise,
mark it not-applicable-config because the vulnerable GSSAPI-backed
Negotiate implementation is not built. The default Scarthgap
configuration enables negotiate-auth but does not enable krb5.

References:
[1] https://github.com/curl/curl/commit/5e99b73cf441d9c369768b9cd48b5389b9a2503d
[2] https://github.com/curl/curl/commit/8f71d0fde515aa4c68002477356c35bd79927729
[3] https://curl.se/docs/CVE-2026-8458.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 365f02ad59..f2479a3364 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -57,6 +57,7 @@ CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of conten
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
+CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest
-- 
2.35.6


