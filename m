Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D25C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:31:18 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6830.1784547070181800423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VGHXXc28;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1656; q=dns/txt;
  s=iport01; t=1784547070; x=1785756670;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ChgUct2zUHfm9XLHdVfvlBk4LPHqNs1ZTGZyX7esy+g=;
  b=VGHXXc285RP9mOIhWk5DXNpF7t7nbGwmtuB0Jj49J+Of3+MnsYqHBwkC
   HPsJDf75EY72576ZELVTS0uSIiA8zXfgoxhqeovsSuJd5sLjQL8KkX1Nh
   FMHmVD3CbHhBEkm37c8z7Z/yoTgHjxTEL8fY01do9r8EzgdvlAWnX2q63
   CXMb6RrFVX+u3pn70H0i9NMgwEUBSe+4Lu7AAkI+o/wdUt8zyJ1qofGFz
   tYnwv6FHNXU6Foi3j30fUUXscQAurUHuzdYknGMc0Zzt+7lgZ2VGvBOhr
   9b0KZop1FSvtTqK1I58tuOq2eaqq1RL6K/Sy0zmW6fH0r1YlKdoWIYEuZ
   w==;
X-CSE-ConnectionGUID: tkQpQLThRNGDFHuA+05g2A==
X-CSE-MsgGUID: 9qod10mtQyqmPvwgfElAag==
X-IPAS-Result: =?us-ascii?q?A0BFAgCCBV5q/5D/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeG4F+DwEBAQ89FAQBAYUFAo1TAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhlsCAQMyARgBPSAxKysQAQiDAgGCdAMRBrxsgiyBA?=
 =?us-ascii?q?YMoATEFCQICQAFQ2y4BCxQBgTiFP4ggdAGCSYIzJxsbgXKBFYNpgQWBXAECg?=
 =?us-ascii?q?iyFeASCInoSgXhQgQiOFkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgTqBAoR0Ix8DOX+BL3VKdy1qEheBJoISAoE7AgcDCxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB408I4I/EEoHLSoCBIFoGDMGpWKhEgoog3WMIZU6GjOqbJkIjgqWUIRpg?=
 =?us-ascii?q?Wg8OYEOCwdwFYMiCRY0GQ+OOIVqhEHEBzw1AjsBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:iIfSY6Icfyy4i+V+FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1zdSx
 jMeXGDTO6mMa2L2eowlPIXl/E1TuJ7TmtAwSAod+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQsaj98B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1yD3guBKkk+txRLk1g1
 eExa2hQYUqq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEiojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeG2aIOEK4zVLSlTtheBo
 W6fp2HlOwADMeSB1jWL33aFj+CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:lZhEsa6LHwfxTj0iGAPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:z4IbjmPw4wWkye5DRCpe7HcwJsAfVFLx4lfNCgzgVGkzYejA
X-Talos-MUID: 9a23:+reSeQV/4XMRg8Pq/G71gz07bMJ02rW3DXgTjpoIls2tPCMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="513019987"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:31:09 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id D3A2E180003C9
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:31:08 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id EDD5ACC037D; Mon, 20 Jul 2026 17:01:06 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 1/5] curl: ignore CVE-2026-4873
Date: Mon, 20 Jul 2026 17:00:37 +0530
Message-Id: <20260720113041.2479444-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720105647.2451180-1-deeratho@cisco.com>
References: <20260720105647.2451180-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241364

From: Deepak Rathore <deeratho@cisco.com>

- CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated with
  clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
  transfer.
- In wrynose, these protocols are optional PACKAGECONFIG entries and are not
  enabled by default in curl_8.19.0.bb, so record this CVE as configuration-not-applicable
  for the default recipe configuration.

Reference:
- https://curl.se/docs/CVE-2026-4873.html
- https://nvd.nist.gov/vuln/detail/CVE-2026-4873

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Refresh the patches on top of the latest
wrynose branch.
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 3326f478b5..1cda69401b 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -28,6 +28,7 @@ SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d33
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2026-4873] = "${@bb.utils.contains_any('PACKAGECONFIG', 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop3/smtp support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6


