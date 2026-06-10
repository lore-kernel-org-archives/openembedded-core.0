Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4B1CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:06:43 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16977.1781085994835865472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YLCizGxA;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1439; q=dns/txt;
  s=iport01; t=1781085994; x=1782295594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qiTc+Fg/PJMvEaBJzDJuLKI//tcq0eoeWiQDvPt/wKw=;
  b=YLCizGxAmAJJKEaaHZP5rtjXJ3I4lyP9xPyYvBnOkZv7nJEhhVkRh2zS
   T/rtBVd4zMZWkhQIHbZAQKfQQd5fPeWSgMd33W7LZwR6MccCzmS2QhLpw
   NBC2wx6fDxK0FnS9xWiCPiLMj3KDGiFPdzTQVzIu9tXoj0dWKmUElGOSn
   DeXq4ZDg4vVceDTwPm3KPhNZZ/vfLDIFivkpriQ+Zqa5FGZd2lLNme4Gu
   d8NXu59UuoLMEDsrw2uz3tk1c2D2vbBqWH4A53GKzGpo7vbMwm4Anckcs
   nuFsrlf6LlERS1ZJCzGExbhlLLPbCqJmH8EFiG6Ieg6ZpNs0QhiYa4ybD
   w==;
X-CSE-ConnectionGUID: n1adDfaBRzisAGwAQmd7ZA==
X-CSE-MsgGUID: y1rZJY80SdSvPD+FztpI/Q==
X-IPAS-Result: =?us-ascii?q?A0BEAgBpNilq/5T/Ja1aglmCV3RfQkmWTp4bgX4PAQEBD?=
 =?us-ascii?q?zcaBAEBhQYCjToCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWwIBAzIBGAEtECAxKysZgwIBgnMCARGzGYIsgQGDKAExBQkCAkABU?=
 =?us-ascii?q?NsrAQsUAQWBM4U/iB5zAYR8JxsbgXKBFYNogQWEC4V4BIIiehKQb0iBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFKgTdogQKFECMfAzmBFYF6g?=
 =?us-ascii?q?ShnaRUwNWwDCxgNSBEsNxQbBD5uB4w6Fw+COFoHLSwEHKgCoQ8KKIN0jCGVO?=
 =?us-ascii?q?hozhASmZ5kHglmLMZU1gRqEaIFoPIFZcBWDIglKGQ+OOIh+wz0kNQI7AQEHA?=
 =?us-ascii?q?gcOAwuBaJF9AQE?=
IronPort-Data: A9a23:MRce2a4UUU+Po7Ob71uFcgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mdJWm7UP63bZWWjf4slaorl/UkCvMLXy4dmTVE+rig3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNs/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eO9QR9sp5CEt05
 /0DAR8SRymGi72E6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEfUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGIaEI4PSFZwPxi50o
 ErXpn7LICBKbOeT8iS93jGClPPXvGTCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:wcqOtaGcUjqKXidppLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:bMTRuWMoCePof+5DXnBu+GIaE+ofYHzG5VjPCna9BTlbYejA
X-Talos-MUID: 9a23:tItSJwSe5lDgXTg2RXT93StQFvY4u5+iM141vdYoqdWcFGtJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="491708120"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 10:06:34 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id D8EB218000257;
	Wed, 10 Jun 2026 10:06:33 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 85EE0CC1611; Wed, 10 Jun 2026 03:06:33 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 4/5] bind: Ignore CVE-2026-3039
Date: Wed, 10 Jun 2026 03:04:03 -0700
Message-Id: <20260610100404.2993940-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260610100404.2993940-1-asparmar@cisco.com>
References: <20260610100404.2993940-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238345

From: Ashishkumar Parmar <asparmar@cisco.com>

Analysis:
- CVE-2026-3039 affects BIND servers using TKEY-based
  authentication via GSS-API tokens [1].
- This recipe configures BIND with --with-gssapi=no, so the
  vulnerable GSS-API TKEY negotiation path is disabled [2].
- Hence ignoring the CVE for this build configuration.

Reference:
[1] https://kb.isc.org/docs/cve-2026-3039
[2] meta/recipes-connectivity/bind/bind_9.18.44.bb

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-connectivity/bind/bind_9.18.44.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
index dd8923f185..7b5baf5338 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -43,6 +43,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>9.(\d*[02468])+(\.\d+)+(-P\d+)*)/"
 # Issue only affects dhcpd with recent bind versions. We don't ship dhcpd anymore
 # so the issue doesn't affect us.
 CVE_STATUS[CVE-2019-6470] = "not-applicable-config: Issue only affects dhcpd with recent bind versions and we don't ship dhcpd anymore."
+CVE_STATUS[CVE-2026-3039] = "not-applicable-config: BIND is built with --with-gssapi=no, so GSS-API TKEY negotiation is disabled."
 
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_header update-alternatives
 
-- 
2.35.6


