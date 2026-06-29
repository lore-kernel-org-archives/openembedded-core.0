Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A385C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:15:05 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37291.1782738901069608698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=H50Hj28r;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1568; q=dns/txt;
  s=iport01; t=1782738901; x=1783948501;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4x0vvS5Z5zcvZHZjWj8lAzBx+MgdX/iRNDcHlTDkS38=;
  b=H50Hj28rQ7KebLe5SDNaGGq8zAMAe90Yrxy3YbgCBqWaPYkUBjTMOgTK
   sUrBKLwCybAh6U/GC9U0H3rnX1k4DU5QD4pl/Lhj8WxGN+OirpUjvJWs8
   Z+VfjCmyZOCMwfaBAdebsiK/5NTdm/2YipNUHqLiXLbz5b4R8kHnVMTeg
   d3NWE/hgv7O72EzHoO+QYUlV9viQr53sGRbRo4mVyC+Ik/mCB6bIYvo5n
   NscUGcaMnZtlGMy4MiLt6uCU60gP1IKSuma/l5UhfEphvG6Dpi3/cXB6z
   HVYauptGKGBuypLg7xg47MHl2FYU9p+1xEi66dfEIogxM+oxtXFOFyegO
   A==;
X-CSE-ConnectionGUID: yz7ujXjfRH2f1Lrp+HjqEg==
X-CSE-MsgGUID: siVsF6o5QoqxRbv7PCuT1w==
X-IPAS-Result: =?us-ascii?q?A0BBAgCnbkJq/5T/Ja1aHgEBCxIMggULgld0X0JJlkueH?=
 =?us-ascii?q?oF+DwEBAQ89FAQBAYUGjU0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GXTYBGAEtMFw7CYMCAYJzAgERBrZ0giyBAYMoATEFCQICQ?=
 =?us-ascii?q?AFQ2ywBCxQBBYEzhT+IH3MBgkmCMycbG4FygRWDaYEFgVwBAoIshXgEgiJ6E?=
 =?us-ascii?q?oF4UIErjRZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYFpg?=
 =?us-ascii?q?QSEfSMfAzl/gTB1WGYVMDWBAgERHgqBUicDCxgNSBEsNxQbBD5uB4xeFw+CP?=
 =?us-ascii?q?RBKBy0qAgSBaBgzBqVloQ8KKIN1jCGVOhozqmyZCI4KllCEaIFoPDmBDgsHc?=
 =?us-ascii?q?BWDIgkWNBkPjjiFaoRBwU0kNQI7AQEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:mIMi06qOmx5gVZcXKMG/YJzBijpeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnTO6zeZmTxKt0la97n8UNXuJTdztcySFRupSFjE3lEoOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8kI35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vdlXnxMx
 f4WEhBXYEmnnfr14LCiZ+Y506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzRUr1SarLA6y2PS1wd2lrPqNbI5f/TWFZoFwxvJ9
 ziuE2LRGRAkL/LBzme89Wu8vOXRwhvQRb5LC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:pYxkZq/1y2Ws8XgzyRBuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoI0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:Ve2QK26SkHA07y+Ahdss5VxLB8IVcHPn7C3eemuiESVJSqS4RgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A9goHaQ6MfpIXqCpYMSyzVOFNxoxz4pq1Jh4KzKw?=
 =?us-ascii?q?Botm+PzIvAxyAsG2oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,232,1774310400"; 
   d="scan'208";a="487855992"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 13:15:00 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 0D78518000147;
	Mon, 29 Jun 2026 13:15:00 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id AA9A6CC12A6; Mon, 29 Jun 2026 06:14:59 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 1/6] curl: ignore CVE-2026-4873
Date: Mon, 29 Jun 2026 06:14:45 -0700
Message-ID: <20260629131453.1077612-1-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239777

From: Anil Dongare <adongare@cisco.com>

- CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated with
  clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
  transfer.
- In wrynose, these protocols are optional PACKAGECONFIG entries and are not
  enabled by default in curl_8.19.0.bb, so record this CVE as configuration-not-applicable
  for the default recipe configuration.

Reference:
- https://curl.se/docs/CVE-2026-4873.html
- https://nvd.nist.gov/vuln/detail/CVE-2026-4873

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index d58b774011..41e6888977 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -27,6 +27,7 @@ SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d33
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2026-4873] = "${@bb.utils.contains_any('PACKAGECONFIG', 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop3/smtp support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.51.0


