Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8532AC44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:15:05 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37290.1782738900973189256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BXcvWKF7;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1750; q=dns/txt;
  s=iport01; t=1782738901; x=1783948501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=akFs9bPzu/WBATdi82RuTMfVfkQQUEKQwxkIT4drzZQ=;
  b=BXcvWKF7ZillQg8kc23nR7G+tSTQSIotP24GFRmvO1j97LsLKzy9UTOx
   bp6rnJxPZuczRwd8rW/cMw7hLKepjLKS/+KcYUVCtKsdHsAjSQk+EFH9X
   Argw6aqJrkLiHr4+qvb/p7Yb0HbW8IsYayaH1bOBFy1fc7/68Z13w/4il
   KZibo8fcHlnhI+SqRxoKvJvozvDl8ZqP/OPWHiElKv6Q65rgJhG8H+lbU
   S8wfuK09+xjbLGmzluu0ayBbm8A1y6lt7Kbpg/Wfprh7P1/WY9KhCSrmy
   zvKcIzB+kbKwwSYSAJkLhe4+gt3qNMhFuu4SzfTtalpQnr72Pq/6I7bSI
   g==;
X-CSE-ConnectionGUID: dOEtBvXrQgSxDTVLfOTywg==
X-CSE-MsgGUID: bJD5AYBzQ/CBug4BGipbww==
X-IPAS-Result: =?us-ascii?q?A0BEAgAqb0Jq/5P/Ja1aHgEBCxIMggULgld0X0JJlksDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGFBgKNSwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZbAgEDMgEYAS0QIDErKxmDAgGCcwIBEQa2coIsgQGDK?=
 =?us-ascii?q?AExBQkCAkABUNssAQsUAQWBM4U/iB9zAYJJgjMnGxuBcoR+gQWBXAEBAYIsh?=
 =?us-ascii?q?XgEgiJ6EoF4gXuNFkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEdgWmBBIR9Ix8DOX+BMHVYZhUwNYECAREeCoFSJwMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?F4XD4I9EEoHLSoCBIFoSwalZaEPCiiDdYwhlToaM6psmQiOCpZQhGiBaDw5g?=
 =?us-ascii?q?Q4LB3AVgyIJFjQZD444g2uBf4RBwU0kNQIBOgEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:F/wE9KulrutloekVR0KCCxd/g+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKW7UOq2CNjDxKtFyaI/l9UhTv5WAmNNgTQpurCs2HiJAgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/zZ+Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw9sFaHUtQx
 eYhJwsdQiy9o+yR/KOkRbw57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3XejFfrl2cv6cf6GnIxws327/oWDbQUoHSH5gLwh/E9
 woq+UzzID1HHe212wPC2VixibPlsiLjUp0NQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cZLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:Xw+BcKy9iVZ1/Fi3O8LTKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICOsqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: 9a23:a4gslmy2nXMy9xMhwfBRBgUYPe05WGPt1k7fGF+UNVhNRpqpWECfrfY=
X-Talos-MUID: 9a23:oilVJwazxeJmoeBTvR3A2RhTHtVRpI+EFU9Ru7oHo8ObKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,232,1774310400"; 
   d="scan'208";a="502564149"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 13:15:00 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 120A6180008B5;
	Mon, 29 Jun 2026 13:15:00 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id AF247CC12A8; Mon, 29 Jun 2026 06:14:59 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 3/6] curl: ignore CVE-2026-5773
Date: Mon, 29 Jun 2026 06:14:47 -0700
Message-ID: <20260629131453.1077612-3-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629131453.1077612-1-adongare@cisco.com>
References: <20260629131453.1077612-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239776

From: Anil Dongare <adongare@cisco.com>

- CVE-2026-5773 affects curl before 8.20.0 when an authenticated SMB connection
  can be reused for a different set of credentials.
- In wrynose, SMB support is available only through PACKAGECONFIG[smb] and is not
  enabled by default, so record this CVE as configuration-not-applicable for the
  default recipe configuration.

Reference:
- https://curl.se/docs/CVE-2026-5773.html
- https://nvd.nist.gov/vuln/detail/CVE-2026-5773
- https://github.com/openembedded/openembedded-core/blob/wrynose/meta/recipes-support/curl/curl_8.19.0.bb

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 2b1bc40e37..5580791ec8 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -29,6 +29,7 @@ SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d33
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 CVE_STATUS[CVE-2026-4873] = "${@bb.utils.contains_any('PACKAGECONFIG', 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop3/smtp support is not enabled in PACKAGECONFIG', d)}"
+CVE_STATUS[CVE-2026-5773] = "${@bb.utils.contains('PACKAGECONFIG', 'smb', 'unpatched', 'not-applicable-config: smb support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.51.0


