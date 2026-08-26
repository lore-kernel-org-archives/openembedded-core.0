Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552B2C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 07:54:10 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7458.1787730845210793848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ca5Yv5LY;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1182; q=dns/txt;
  s=iport01; t=1787730845; x=1788940445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/hR0uBrWDuLCgDHfdmsUWkyacdzIoo8ByMRzmQoXwdg=;
  b=Ca5Yv5LY0PYOYBWSgpw0VU8CkwaBQRvUOJL8JBlvRGvCQlzEVPqxY6cE
   KIkb1vP0HksIK5xVTziSb82z4FtlXUqRrMQ1uuFX0pPLn9Q6kcnfbfXTH
   NlYVjsYZm9PLtRZVK75cHTCXcdp30DBaK/tFu9XgY9xKh7xDDDl/RJWGE
   32WVlwrTU2BziRzC6P+WANTK0CY1xEMRugblAt6zro4B7DSZXbvqztaJa
   w8p2/jgn3DFP5LThpFV3wghyUeOMXRfN2cpe3wiNCS9SVIHNfqECwmXOv
   uaJfQrgQQSlv0mf0E5k0Aa1geJWs/S0RYWXe+umpJG+IifsM8uNSPViUE
   w==;
X-CSE-ConnectionGUID: H3mMxB7/TUyXNt8p8gO6Nw==
X-CSE-MsgGUID: QFoG5KYdT1mZxPmoUVEjLA==
X-IPAS-Result: =?us-ascii?q?A0BCAgBqmo5q/40QJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAO/A4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hAF7JxsbgXKDbYERhBd5hXgEgiKBDJNiSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWABEheBCYIHAoJaggUCA?=
 =?us-ascii?q?UlDDgdHPgsYDUgRLDcUGQQ+bgeOax+CSQE8URmCUJNrkXqhDwoog3aMIpU6G?=
 =?us-ascii?q?jOqbC6YWqRahGmBaDxGgRNwFYMiCUoZD95cJzICPQcCBw8Ck3EBAQ?=
IronPort-Data: A9a23:Ig8YU6J/ER+GrZ7eFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1TwHy
 zRKXzvTO63bMGOhKdxyYIXl801TvpaDnNM3HFcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1OV0QTLadHvdpKEFFo6
 awAeD8qMDac0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNXwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQhiuG2b4CKI4HiqcN9p2ifi
 T/lzmjFWxQoJOSazge733CIr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMFhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:yJTdv6meFg2mqXz+85oOL5YOHIPpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:B4eyg27Y6E0Sa2uVTNss1BURP9APLTrh8WbgBVPoETZmb+OzVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3APK4AWg4J55/SBgtOoaTH/xZVxoxRzaOBVWM8nal?=
 =?us-ascii?q?fvvuUDSl3BgmwjhCeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821372715"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 07:53:48 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 50CE718000B7E;
	Wed, 26 Aug 2026 07:53:48 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id E4568CC12A9; Wed, 26 Aug 2026 00:53:47 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] nghttp2: correct CVE_PRODUCT mapping
Date: Wed, 26 Aug 2026 00:53:47 -0700
Message-Id: <20260826075347.63861-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244321

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
nghttp2:nghttp2 is the sole active NVD dictionary CPE and configuration
identity, and is also used by CNA affected data for the packaged source.

This changes the generated product identity to an exact CPE, but the
frozen sbom-cve-check database leaves the nine-entry CVE report unchanged,
with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.70.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
index 1b09f91ce6..bfb7d4ba42 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c428
 
 inherit cmake manpages python3native github-releases
 
+CVE_PRODUCT = "nghttp2:nghttp2"
+
 PACKAGECONFIG[manpages] = "-DENABLE_DOC=ON,-DENABLE_DOC=OFF"
 
 EXTRA_OECMAKE = "-DENABLE_LIB_ONLY=ON -DENABLE_PYTHON_BINDINGS=OFF"
-- 
2.35.6

