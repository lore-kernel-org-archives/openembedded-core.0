Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219B5C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:57:03 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.706.1785477421809308946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FP43FVhH;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3523; q=dns/txt;
  s=iport01; t=1785477421; x=1786687021;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cWtxzeWOPSbwIggeEvnGN/E5RNdf0ezjMwJ7ojUFrpc=;
  b=FP43FVhHILCkYezhtBGvVzDKpAqYd48J/aRQgRYYWTxw4MHGHjmc8T/T
   2T2hWnRM6LO12qgZJWJNl5k6+sok2P2gZV1UIhLqnESEKtDFg/7/dl7V2
   /AXix7sp+CbxLt2zQw+cSYFucKbRORilumSXOv9eTIijz17qvUYcD5mE3
   UqSzh/B5RqrCWczvcTZcAPNCNw3oiAMWe8BCwYVxnZDuX5Aq8vb+wvjt1
   xMmmnovUKZi40uGP9E3npYhMn8jyqVCBDk+Pw4TmyAcCxXvwGs+yz0TjV
   aKNnOkm57EQZdYUA4T0uYK3g+NF5PSEhl2n4q+WeBJMWDIZxklPeKhjGn
   w==;
X-CSE-ConnectionGUID: sZZs1cgVR6SodXPrFpTKGw==
X-CSE-MsgGUID: S71Y+9VARhua04iOdBUSCA==
X-IPAS-Result: =?us-ascii?q?A0AnAAD1N2xq/4z/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHKHN4IhA4tkkjeBfg8BAQEPRA0EAQGEP0YCjWYCJjQJDgECBAMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMyARgBPRwDAQIvI?=
 =?us-ascii?q?AsjCBEIgwIBgjoDNwMRujAaN4IsgQGDKAE/AkNQ2EkNglgBCxQBgTgBhT6Cf?=
 =?us-ascii?q?YUjXBgBhHwnGxuBcoR+gQWBGkIBAYglBIIigQyBWh6EK4wSSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKy+EUyMZNnyBL3VKdS1qEheBG?=
 =?us-ascii?q?oMxAoJfAwsYDUgRLDcUGQQ+bgeNaSCCPgE9UQErgUMRpkugIXEKKIN1jCGPP?=
 =?us-ascii?q?oV8GjOqbAuYfY4KhAmSR4RpgWg8gSgfCwdwFYJuATMJShkPjjiDa4F/zEM8N?=
 =?us-ascii?q?QIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:BL3686K/LDkWKGM+FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgz1Tz
 2IeXDjTaP+LZGSkct8nbovk9hwHv5KBzdI3QQAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGUsajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN11PnMtZIYXxNwpOmZCx
 cQCBigxTT+c0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeGzboCKJYLbLSlTtn3H/
 1OFrlrQOBEHPYTDyB2J2E+XrcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:2pN7oK500VGQWneQQgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3A4ffjZWmuVD9+OX2PLTAd7PFwA1zXOWbv/myJKEC?=
 =?us-ascii?q?GMzhST7GlcUW+4J9HvNU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AOPbkbwz/Dy7u9aWn+1sT8eySFMmaqJ/xUXFOwKs?=
 =?us-ascii?q?vgcmZPHQsOhCRpgmMaaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="516627769"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:57:01 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id A950F180001C8
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:00 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id C2C75CC037D; Fri, 31 Jul 2026 11:26:58 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 07/10] expat: fix CVE-2026-56409
Date: Fri, 31 Jul 2026 11:26:22 +0530
Message-Id: <20260731055625.4187716-8-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242404

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56409

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- No change to the embedded upstream source patch.

 .../expat/expat/CVE-2026-56409.patch          | 51 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56409.patch b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
new file mode 100644
index 0000000000..b0aac26073
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
@@ -0,0 +1,51 @@
+From 174ce18f2a283be634d830a5259bd07142635fe8 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Mon, 1 Jun 2026 11:53:19 +0530
+Subject: [PATCH 10/17] xmlwf: protect output path join from integer overflow
+
+CVE: CVE-2026-56409
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e]
+
+Backport Changes:
+- Adapt the allocation hunk to the explicit XML_Char cast used by
+  Scarthgap 2.6.4; overflow checks are unchanged.
+
+(cherry picked from commit 61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 7bbdb303..bd5f68a4 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -1240,8 +1240,26 @@ tmain(int argc, XML_Char **argv) {
+         }
+ #endif
+       }
+-      outName = (XML_Char *)malloc((tcslen(outputDir) + tcslen(file) + 2)
+-                                   * sizeof(XML_Char));
++      const size_t outputDirLen = tcslen(outputDir);
++      const size_t fileLen = tcslen(file);
++
++      /* Detect and prevent integer overflow in the addition (without
++         risking underflow) and the multiplication, mirroring the guards
++         in xcsdup() and resolveSystemId() */
++      if (outputDirLen > SIZE_MAX - fileLen
++          || outputDirLen > SIZE_MAX - fileLen - 2) {
++        tperror(T("Could not allocate memory"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++
++      const size_t charsRequired = outputDirLen + fileLen + 2;
++
++      if (charsRequired > SIZE_MAX / sizeof(XML_Char)) {
++        tperror(T("Could not allocate memory"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++
++      outName = malloc(charsRequired * sizeof(XML_Char));
+       if (! outName) {
+         tperror(T("Could not allocate memory"));
+         exit(XMLWF_EXIT_INTERNAL_ERROR);
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index aa2a4f8966..0f996f882b 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -70,6 +70,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
+           file://CVE-2026-56409.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


