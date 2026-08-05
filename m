Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1969C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:31:43 +0000 (UTC)
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35884.1785918696540070133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VSYASk6I;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1718; q=dns/txt;
  s=iport01; t=1785918696; x=1787128296;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=yRzuER7V0WZp0muT9R1IqUg5A31rOewzWi+VyAqx9zU=;
  b=VSYASk6Idw/Fckea7MKpq5XaAFGl8KX9A9DKS+3mbZAlvNIZGKfJrkLf
   oUseAmfcUYQ84MNBJ/5W1dm9lDCTL1fPA5dBoqvIIHFzT0Ld81TBFhq5v
   OEqhfioGvWQzLBCdMeVSeKe1WFSVzpwmXr/0yOxWEWloidIoWuxLXFP4D
   H6s0QmrxEXyF9ZWjnOUrfUedtFUMXNy9qud4EimIckh7WY8njliFjfon9
   TQN5T4hscSrAbaqWiyew3dTBsRjrO3XnkrozZY06QXknjTgrIDyo7fwL+
   Bvrxu+pbBn21GQkvwfZfHKcWBxl0EVYv731V5ejuMSiZjGVOimd11icy3
   Q==;
X-CSE-ConnectionGUID: zgu/hW7ITx6MEtNzC+TbrQ==
X-CSE-MsgGUID: N44Cb6uySySpoisq7Y9StA==
X-IPAS-Result: =?us-ascii?q?A0BFAgCA83Jq/8tK/pBaHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeG4F+DwEBAQ9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhlsCAQMyARgBPSAxKysRCIMCAYJ0AxEGvVqCLIEBg?=
 =?us-ascii?q?ygBPwICQAFQ2y4BCxQBgTiFP4ghdQGEfCcbG4FyhH6BBYFcAwEYghOFeASCI?=
 =?us-ascii?q?noSgXiBLY8sSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BK?=
 =?us-ascii?q?IRtIxk2fIEJXoEtKmUSF4EJgnsCgnpvCxgNSBEsNxQZBD5uB41oIIJAWgctK?=
 =?us-ascii?q?gEBgj2lYqESCiiDdYwhlToaM6psCyOYWo4KllCEaYFoPIFZcBU7gmcJFjQZD?=
 =?us-ascii?q?444iH6BLcVhPDUCAQE5AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:G2O5aqIhDS97fWZqFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENSgzYHx
 zBNCz2EP/jcamfzL9l0aYqy/ExV78PUyYMxQAAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Ypajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN18A1xxPbJH29pnX0Rj6
 doKA3MxZAq60rfeLLKTEoGAh+wqIdOuOMYUvWttiGmDS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3N3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsjuiyboCKIbRmQ+1zwhqzr
 Dzb7l/oOQkdNceGlgvUyW6F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvCS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:EovohKNWGnYMT8BcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:32MuQ20hg6cV+tjl8c9wGrxfCM84NX3ik1bsMxGdJHpPWpbWdVWKwfYx
X-Talos-MUID: 9a23:abOvNQSVHrWM7KdSRXTK2G1JPpl18p+/M1gKkI4f5PjVDjBZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="56876273"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:31:32 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 4A14C18000143
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:31:32 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 04DE2CBEFAA; Wed,  5 Aug 2026 14:01:31 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 8/8] curl: set CVE_STATUS for CVE-2026-12064
Date: Wed,  5 Aug 2026 14:01:03 +0530
Message-Id: <20260805083103.2633995-9-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805083103.2633995-1-deeratho@cisco.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242846

From: Deepak Rathore <deeratho@cisco.com>

Analysis:
- CVE-2026-12064 affects the curl command-line tool when
  SCP/SFTP protocol support is available. [1]
- Wrynose exposes SCP/SFTP only through the optional libssh2
  PACKAGECONFIG, which is disabled by default. [2]
- Hence mark this CVE as not-applicable-config for the default
  Wrynose recipe configuration, while reporting unpatched if
  libssh2 is explicitly enabled.

Reference:
[1] https://curl.se/docs/CVE-2026-12064.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.19.0.bb?h=wrynose

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 4c3e31d438..1bf32ffc53 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -44,6 +44,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
+CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.35.6


