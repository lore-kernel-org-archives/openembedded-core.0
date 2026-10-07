Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D08CA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:24:13 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7414.1791372244554488336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gLnaeTjb;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1750; q=dns/txt;
  s=iport01; t=1791372244; x=1792581844;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cdcBlgA3TaPyaGDVlOLoXe/uuY88ZIpPfmxLFGVLRnQ=;
  b=gLnaeTjb43JCgHkqMnX/AhBetRERECB72J4yYZy/9mi5pcI2GxPjsebk
   xXCPzrBoZo4O+NfBUmp+pOgZGjmjSBfPRhs4HWQeMFy0chlvr6yjufLYW
   8cbCeZxWq+QGrtajc4NTcYIaF/8T0FGdo06JKH4kCVjTv7P6ifxC7uUsc
   9KZQWZBZo91UMGiF/XzBR9mxTgdG6aa+gSC68cgfu7BLfUAWTRCq2wAT7
   Si4lHbyv3iUptiVcB4YfR9c0Cn5mr8Yv8jvnVn44AuiPPjJIvLSnZBzpR
   eJx3HGYhWcd1uvNUTimX8d29liVi8s/UGXFAwan26xbCcOeMGqBEijiXm
   A==;
X-CSE-ConnectionGUID: jrBAZvfsQOisz1N/fgySgg==
X-CSE-MsgGUID: 02xsDK6ISTy4Z7EW7SkBhA==
X-IPAS-Result: =?us-ascii?q?A0DBAgAdKsZq/4z/Ja1aglmCV3VhQkmUKYIhnh2Bfg8BA?=
 =?us-ascii?q?QEPRA0EAQGTEAImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QSwEYAV1cRIMCAYJ0AgERBrVIgiyBAYMpAT8CAkABUNsxAQsUAYE4h?=
 =?us-ascii?q?UCII3UBhHwnGxuBcoR+gQWBXAMBGIIThXgEgiKBDIF4ZZJySIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJg?=
 =?us-ascii?q?gcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMKRgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5BbHoJgWgctKgEBgj2lZaEPCiiDdowilToaM6pvLphajgqVNoEah?=
 =?us-ascii?q?GmBagM3gVlwFTuCZwkWNBkPjjmIfoEtxXkkNQIBATkBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:tVlLY6xm8fgMmEB8TOp6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUGy
 DYaWWuOPPaCa2T3ft52YYq180gC6sSDnYRmT1c6pVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsaj1MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEMsF6Qq5OhsOEZP7
 u5BDncDYQG4iO3jldpXSsE07igiBNPgMIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cO3WjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCwaYqPK4HVHJ89ckCw/
 jjW5EjaXDAhCM3D+2WozS2XhcXPtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:I7zQ1av9X6/aIDJSpri4Si7m7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:ImVPC29zHwdWQ/JBGXKVv0wOMOkXbHPG9VDROF3hLyFnR6yuRlDFrQ==
X-Talos-MUID: 9a23:ksVm5QiwudQeJhNzs7PYacMpbJ14+IiNVmE2rYRaiZapCnNLOB2dpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="518295712"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 11:24:03 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 984CB18000591
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 11:24:03 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 4186CCC1611; Wed,  7 Oct 2026 04:24:03 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/8] curl: set CVE_STATUS for CVE-2026-9547
Date: Wed,  7 Oct 2026 04:23:56 -0700
Message-Id: <20261007112403.486499-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247387

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- CVE-2026-9547 is tied to the libssh backend. [1]
- Scarthgap curl 8.7.1 does not enable or expose the libssh
  backend in the recipe. [2]
- Hence mark this CVE as not-applicable-config for the default
  Scarthgap recipe configuration.

Reference:
[1] https://curl.se/docs/CVE-2026-9547.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.7.1.bb?h=scarthgap

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ade637adf3..f3b1c32e93 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -59,6 +59,7 @@ CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'n
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
+CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
-- 
2.35.6


