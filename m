Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F78CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:26:12 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88645.1781346365407534235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Xpl140q+;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1193; q=dns/txt;
  s=iport01; t=1781346365; x=1782555965;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J0oYB3fqyhKjlJGJSXZ5cwpTOSSzWEI3hVsfH46KTG8=;
  b=Xpl140q+O0N84+EmCWGdbJD98b9l+pjBKxbm1+CZNcueFYeExQLm06Wr
   4AhA5wXCPtk7FbtMi70bD6aLcSc7tEUULdRIBAnCLqvpNj1VfpEssQ+mN
   3VbEhK5x+g6iZmyusbinaP1rjGCR42N9VhFx98QT86oXp2rTo8j94Hjlo
   EHgafkOo5Zy5YA9qQ96pVjQBjP/07FQaeg95JA8cvhRixhyuDW+j/1DsA
   Y2X4aLeArlMwZB1QgK/KMK90LHNDaVmMcf+GCv9bMxVEYWYGqh1mtzW4c
   bNvdUTGe004ysHLWj+z089diRy5H3bl5JJrjpIryOWAjDENff8/oPqz4C
   A==;
X-CSE-ConnectionGUID: PKfFvh/eSnquTgZBHNmQnw==
X-CSE-MsgGUID: omGNY2LoQtya+SDsoEpwyw==
X-IPAS-Result: =?us-ascii?q?A0BFAgD1LS1q/4v/Ja1aglmCV3RfQkkDlCeCIZoahASBf?=
 =?us-ascii?q?g8BAQEPPRQEAQGSSwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYcTARgBXVxEgwIBgnMCARGzVoIsgQGDKAExBQkCQ1DbLAELFAGBO?=
 =?us-ascii?q?IU/iB9zAYR8JxsbgXKBFYNpgQWBXAGCLoV4BIIigQyBe48dSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgUqBK2qBBIUNIx8DOX+Bc4EoZ2cVM?=
 =?us-ascii?q?DWBAhEfChwDCxgNSBEsNxQbBD5uB4xdFw+CPj1RLCKBSkARpWWhDwoog3WMI?=
 =?us-ascii?q?ZU6GjOqbJkIijSDVpZQhGiBaDyBRwsHcBWDIglKGQ+OOINrgX+DFMF8JDUCD?=
 =?us-ascii?q?C8BAQcCBw4DC4FokX0BAQ?=
IronPort-Data: A9a23:9JRuHaySEIl4Addtnb56t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUGn
 GAYXj2CParZYzfzfN91aIm+ox5UvJbdxtFlQQo9rVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4+aT/H3Ygf/hWYqazlMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHkVM6MG+qF6OmdX6
 MAXGhotSBW6gf3jldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tPy1imT6eT1RgFmUvqEwpWPUyWSd1ZCxYYaPIYLTGJg9ckCwo
 Wfp2VWjJhYjKM2WigGp6XWBnvDegnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:NCTGoapPeMHNXiMa0ePg2NMaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3Asez772jPCBinzuX37PE6HQ+mrzJuSl7T4mnQZEK?=
 =?us-ascii?q?DD390dLKnY3+2/ZpijJ87?=
X-Talos-MUID: 9a23:RiATXwuVlMQXGLfZIc2ngzRNEvYyx6OXFFEE0q4qoM6pLTNhJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,202,1774310400"; 
   d="scan'208";a="494236155"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Jun 2026 10:26:04 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 6551218000350
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:26:04 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 0D647CB6A93; Sat, 13 Jun 2026 03:26:04 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/2] gnutls: set status for CVE-2026-3832
Date: Sat, 13 Jun 2026 03:25:20 -0700
Message-Id: <20260613102520.3703528-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238671

From: Sudhir Dumbhare <sudumbha@cisco.com>

Analysis:
  - CVE-2026-3832 affects GnuTLS OCSP multi-record response handling.
  - The vulnerable OCSP response handling code was introduced in GnuTLS 3.8.8.
  - This vulnerable code is not present in the current GnuTLS 3.8.4.
  - Hence ignoring the CVE for this version.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3832
https://security-tracker.debian.org/tracker/CVE-2026-3832
https://gitlab.com/gnutls/gnutls/-/issues/1801

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index ccb6a2b4b2..6d43c58df2 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -124,3 +124,5 @@ pkg_postinst_ontarget:${PN}-fips () {
         ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.libhogweed.so.6.hmac
     fi
 }
+
+CVE_STATUS[CVE-2026-3832] = "fixed-version: vulnerable multi-record OCSP response handling was introduced in 3.8.8 and is not present in 3.8.4"
-- 
2.35.6


