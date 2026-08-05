Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746F5C55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:04:33 +0000 (UTC)
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35532.1785917072387456243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=W09XRww0;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1310; q=dns/txt;
  s=iport01; t=1785917072; x=1787126672;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EVvdk1SpcJCkjp3/pEOAhwQ35YjrAbnXeFzanQBECcM=;
  b=W09XRww0u9O+P4j1HHEkdJA+i02qXt5KIm3pZOvAjBrPagQIFTsBIg2D
   7xQJcC6j+XN479y6nphLvmc/WoSmju5gX6iiD0Yp6ESGsrL3INTvfZDRD
   LhM1/Cppov3yILlRUCp+7o9k2x7+MbO8vJNYYR6R7uq4/SpgnuSXkSwdk
   5/3TwOPAvdjatgAb+o10sv5EdljrdsjO+h3tBh2L4tLXI++hRI1G2s7uT
   Ac1z9nJ5uz09qo5bD/BgFftIhLGbUePzgTKAgru2jycOqUP2ZctNDC8Kv
   4qUsRU9WQOhTTZh2Kdec5EUVqvs7ijKvLqJLcrfE+WGqpjNROtV7UwLmz
   A==;
X-CSE-ConnectionGUID: NwCC1KduTBi74DtyDZt1/A==
X-CSE-MsgGUID: jIlyNYvcT2qAnmxwAcZjNA==
X-IPAS-Result: =?us-ascii?q?A0BAAgCV7XJq/8xK/pBaHgEBCxIMggULgld0X0JJlCmgP?=
 =?us-ascii?q?4F+DwEBAQ89FAQBAZJtAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhxMBGAFdXDwIgwIBgnQDEb0ygiyBAYMoAT8CQ1DbLgELFAGBO?=
 =?us-ascii?q?IU/iCF1AYR8JxsbgXKEfoEFgVwBgi6FeASCIoEMgXiQWUiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSiEbSMZNnyBCV6BLSplEheBCYJ7A?=
 =?us-ascii?q?oJ6bwsYDUgRLDcUGQQ+bgeNaCCCQIEOKwGCPZNpkXmhEgoog3WMIZU6GjOqb?=
 =?us-ascii?q?AuYfY4KllCEaYFoPIFHCwdwFYMiCUoZD444hWrKIjw1AjsBAQcCBw4DC4Fok?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:YbiO5awZIu6rqZPnh6Z6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkVWz
 DEZXmjXOKncZmqmL4sgao+y80hU65LXxtcyGgtqq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaj9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGcpFqZB2epqPUtPq
 qA0NCEhXAzawMvjldpXSsE07igiBMDmJsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkycC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+Oa1aYuMI4HQLSlTtkS5o
 nPgznryPksDHdqa2SWs+UCuoMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:pRf6rqDh9tz9wB7lHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:fiVksW1lFaMafAqd7oEZJrxfPN8OWST+wGrsCU7nVUp1WZGnVQbX0fYx
X-Talos-MUID: 9a23:LQsbSwR7u3ALy6JzRXTupTVzEvZ26Jj0EWkLlIUZksK2NwpZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="60191152"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:04:28 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 452EC18000847
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:04:28 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id ECF97CC037D; Wed,  5 Aug 2026 13:34:26 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] nghttp2: set status for CVE-2026-58055
Date: Wed,  5 Aug 2026 13:33:58 +0530
Message-Id: <20260805080358.2604687-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242836

From: Deepak Rathore <deeratho@cisco.com>

CVE-2026-58055 affects the nghttpx proxy when forwarding HTTP/1.1
Upgrade requests with a Content-Length header and body.

The default recipe does not build nghttpx. Add a conditional
CVE_STATUS entry so the CVE remains unpatched if app support is
enabled, while default builds are marked not-applicable-config.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-58055

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.61.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
index ebba15db28..9ed27b7277 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb
@@ -16,6 +16,8 @@ PACKAGECONFIG[manpages] = ""
 # first place
 EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF -DENABLE_PYTHON_BINDINGS=OFF"
 
+CVE_STATUS[CVE-2026-58055] = "${@bb.utils.contains('EXTRA_OECMAKE', '-DENABLE_APP=OFF', 'not-applicable-config: nghttpx proxy is not built in the default nghttp2 configuration', 'unpatched', d)}"
+
 PACKAGES =+ "lib${BPN} ${PN}-proxy "
 
 RDEPENDS:${PN} = "${PN}-proxy (>= ${PV})"
-- 
2.35.6


