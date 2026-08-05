Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4ADC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:31:33 +0000 (UTC)
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35883.1785918693238619203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jBf0XJkv;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1553; q=dns/txt;
  s=iport01; t=1785918693; x=1787128293;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2a0TwD1OXz9lOWehKGZMRFQw/vwknlKtfegxj7yVImU=;
  b=jBf0XJkvx8IuMR8vOZvk2Av69OtH4vXXjkS/f60Crp5FCPP2WBzlpA+0
   DswrwtWi/PPF83gGhos1or+keICE4m3v/LK2z74flvYyV2xqn4eYTq+mt
   VobGfFicxRDAYsb64VRmYaJJptL8JR+KHz4CGiOIQLqqrdQWjFjwv5/vd
   bVTBmvlzlxAQdxvSmoSAN0hbyCM85JBoMrmeXQIONRHYV59WyK6HY+Y+S
   c1m0FUE8X0O5q/D5sTqeH+GWgNZXQWx2HGDeOcV2AkfDaLe3CrhTlaRxb
   3zTvRZ2E2zd3pFetHL3d/jzrY070Mb+FnTGxSl50U5xhujRowTlcCXTMS
   g==;
X-CSE-ConnectionGUID: Bz32xV0oSRO7s8mUBBMNjg==
X-CSE-MsgGUID: pRcLtWW1R22HaZasDA79FQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgCA83Jq/89K/pBaHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeG4F+DwEBAQ9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhlsCAQMyARgBPSAxKysRCIMCAYJ0AxEGvVqCLIEBg?=
 =?us-ascii?q?ygBPwICQAFQ2y4BCxQBgTiFP4ghdQGCSYIzJxsbgXKEfoEFgVwDARiCE4V4B?=
 =?us-ascii?q?IIiehKBeIEJJI8sSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFg?=
 =?us-ascii?q?R2BKIRtIxk2fIEJXoEtKmUSF4EJgnsCgnpvCxgNSBEsNxQZBD5uB41oIIJAE?=
 =?us-ascii?q?EoHLSoBAYI3BqVioRIKKIN1jCGVOhozqmwumFqOCpZQhGmBaDw5gSBwFTuCZ?=
 =?us-ascii?q?wkWNBkPjjiIfoEtxWE8NQIBATkBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:cUxcoaKuYcdJvzxxFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS0jIHz
 WdKWziGOarfZmD0L9wjadyw9x4A7JaEn9JiTAcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Ypajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1EHhpsLbNA/d1NJj5Vp
 fklAhooSBKM0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3M3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsjuiybISJJbRmQ+1NpE28u
 l35pl6jWDETBtWE5RPao1yV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvSS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:YpIcK6FX3ro7ELRRpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:QOlLLWy9X96x6i1MUHJ9BgU+CJt/YkOFy0zqBBCjWWNUYpewb12frfY=
X-Talos-MUID: 9a23:hB1V7gU2v0Ybpijq/CfWjxV+C/gx2f70KEk/mI4qkpbVGxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="56874647"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:31:31 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 287CF180001C6
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:31:31 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id E3CD4CC037D; Wed,  5 Aug 2026 14:01:29 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 7/8] curl: set CVE_STATUS for CVE-2026-9547
Date: Wed,  5 Aug 2026 14:01:02 +0530
Message-Id: <20260805083103.2633995-8-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805083103.2633995-1-deeratho@cisco.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242845

From: Deepak Rathore <deeratho@cisco.com>

Analysis:
- CVE-2026-9547 is tied to the libssh backend. [1]
- Wrynose curl 8.19.0 does not enable or expose the libssh
  backend in the recipe. [2]
- Hence mark this CVE as not-applicable-config for the default
  Wrynose recipe configuration.

Reference:
[1] https://curl.se/docs/CVE-2026-9547.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.19.0.bb?h=wrynose

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index b0edc5b960..4c3e31d438 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -43,6 +43,7 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
+CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6


