Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9495EC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 08:49:46 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7071.1785314976979997784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 01:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fCprge+r;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1652; q=dns/txt;
  s=iport01; t=1785314976; x=1786524576;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YjKTXE8rWgCJPuBfHyNweoq7XPKpytK0/BbXDjs62Sg=;
  b=fCprge+ryfWKigU9SnsMJZ6rK6Pjl+d5gGrQbpI5mCmJ6iNeWcHpbix2
   2/mNT8ONYFx1e0BtHgE5ptLNhukKiY74HtmLFthOb4YOQVlWSC4m/bxoJ
   Dg9Yh7xZVMeZVzLOpM4gi9aC4cwbfhkXBitdkkdHSmiVmqEf7MVOjNkdz
   ChQ2Rwk7lQu3Pxr4mV5E66q4jIQAZmio7GWpwlFdzBBPmwcrUlx7ScpT1
   C8eFcx3LGIoFTaHvuQd8pweiYKSa+vlSk/hO3eERFMl1lC/yG+IWQ34DX
   x7BjPykwrc6nb4aN+PcrYlkv7s80Rdt+ogWLc/r01+m8ikqs7/4Cg+78L
   w==;
X-CSE-ConnectionGUID: B4s/gPRZSZ2oQZE8XBEb3A==
X-CSE-MsgGUID: 0+25WcJyRbyqKaLEXHNvjg==
X-IPAS-Result: =?us-ascii?q?A0BAAgDHvWlq/40QJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q89FAQBAYUFjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GXTYBRjBcRIMCAYJ0AxG+EoIsgQGDWgUJAkNQ2y4BCxQBgTiFP4ggd?=
 =?us-ascii?q?YR8JxsbgXKEfoJhAYIuhXgEgiKBDIF4gRePIEiBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBDRsHBYEdgSw/hFcjGTZ/gS91SnctaQESF4EagzkCgkEDC?=
 =?us-ascii?q?xgNSBEsNxQZBD5uB41vIYJEAYEOLIFslDyPWYIhoQ8KKIN1jCGVOhozqmwum?=
 =?us-ascii?q?FqOCpZQhGmBaDyBRwsHcBWDIglKGQ+UIsxbJzI9AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:R46hbaL75LPLFUuXFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS0DNUz
 GMWDTuPaPnfMWX2Kt5za4i39xwGuceGyNBmSQYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQlajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1EUFpxMrUiyN1FW2Z3x
 9FIGBogZEuq0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNXwsYDUXUrsTIJI8leuvgFH0ciZTrxSeoq9fD237k10piuW9bIqFEjCMbZ0WxBunr
 UDXxW7oGzITEPGv6Ryb8H3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvaS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:HmRQyKxWFD5JoStmJIPDKrPwGr1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBHWx6p6yb
 pqdbR4BZnbCFh3itu/3SyDeuxQpOVuNMuT9IHjJ7AHd3AMV51d
X-Talos-CUID: =?us-ascii?q?9a23=3A/1iL3GkTHm6SgpNn9LJ8YjFHCwjXOVeB1zDfG3W?=
 =?us-ascii?q?KMlQzT4SnZA+g0o5uyOM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AZuQ7bw7qhcmzZv98T5iEH6LIxowwoP7zN0svgK8?=
 =?us-ascii?q?MqtCnPAhdCxe7kja4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="790258488"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 08:49:36 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 20EC5180001BD;
	Wed, 29 Jul 2026 08:49:36 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id AC5B0CC1611; Wed, 29 Jul 2026 01:49:35 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-idna: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 01:49:28 -0700
Message-Id: <20260729084928.2302928-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242261

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:idna matches nothing in the CVE
databases, which track the Python idna CVEs as:

* CVE-2024-3651 (kjd:internationalized_domain_names_in_applications) [1]
* CVE-2026-45409 (kjd:idna in the CNA record, same NVD CPE as above)

Set both vendor:product pairs.

For wrynose, python3-idna is 3.11. CVE-2024-3651 is fixed before
3.7, so it does not apply here. CVE-2026-45409 affects idna versions
before 3.15, so this metadata change will expose that CVE as
applicable/unpatched for wrynose.

The bare product name is not an option here: it would also match
"servo:idna", the Rust idna crate (e.g. CVE-2024-12224).

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-3651

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48428c0fe22d8ecbfa53efffb28173d4d37539e6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>

---
 meta/recipes-devtools/python/python3-idna_3.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-idna_3.11.bb b/meta/recipes-devtools/python/python3-idna_3.11.bb
index de4595c1d4..eb87572934 100644
--- a/meta/recipes-devtools/python/python3-idna_3.11.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.11.bb
@@ -10,4 +10,6 @@ inherit pypi python_flit_core ptest-python-pytest
 RDEPENDS:${PN} += "python3-codecs"
 RDEPENDS:${PN}-ptest += "python3-unittest-automake-output"
 
+CVE_PRODUCT = "kjd:idna kjd:internationalized_domain_names_in_applications"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


