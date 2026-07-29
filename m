Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3C7C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 08:45:56 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7023.1785314751131603375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 01:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UtLJcqGm;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1813; q=dns/txt;
  s=iport01; t=1785314751; x=1786524351;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lwn5IHyMZnNCcCkeVNSSoB3VgzRRyzU/3yvIaiD85cU=;
  b=UtLJcqGm3AOfxk0ExM5z+iKN7gu0qagJYVwTEtD2Uf3x6cmeXsUqwuDm
   qqvPnagrelZDCiRUOe33KgOH06MR4TlUwN0NPU2deZEO4H6cpqIZcGo22
   pz0CBwodw9P05yQQTFU6iAGaVkzzU963g/94nALc6AdAin/qtVXfiGZv/
   viGHuX+dBldmoHkqLYwVd9TVq8YymdosWMH8axf9VV3ucx2Hro96KPNbn
   WL0QPmz/3nfPW/5HLStrZj236kWhV4mC5OYupTyItl9/WMXPlrrd49RCK
   dVu1naqRH42Yx46oQ374chHIB8FAbRFS3TOXU25YwkMiIV/MR82XZrhHH
   w==;
X-CSE-ConnectionGUID: 0Fl0reHRS/CkuOtFzKJX4w==
X-CSE-MsgGUID: odHeKRjfS1KUfrCv4AjteQ==
X-IPAS-Result: =?us-ascii?q?A0BBAgBavGlq/5UQJK1aglmCV3ReQ0mTWQGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDz0UBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdNgFGMFxEgwIBgnQDEb4RgiyBAYNaBQkCQ1DbLgELFAGBOIU/i?=
 =?us-ascii?q?CB1hHwnGxuBcoQIdoJhAYIuhXgEgiKBDIF4gRePIEiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDRsHBYEdgSw/hFcjGTZ/gS91SnctaQESF4EagzkCg?=
 =?us-ascii?q?kEDCxgNSBEsNxQZBD5uB41vIYJEAYEOLIEYVJN2Ro9ZgiGhDwoog3WMIZU6G?=
 =?us-ascii?q?jOqbC6YWo4KllCEaYFoPIFHCwdwFYMiCUoZD44uFYVfzFsnMj0CBwIHDgMLk?=
 =?us-ascii?q?2YBAQ?=
IronPort-Data: A9a23:bJ96T6JGbGS2ju2+FE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS02FVz
 2IXXDzUO6yKN2ekcownPNm08BlQ6JWBn4QyHgId+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQlajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN02IkVuJ4A4wN0wKmJT0
 uA2OhMvXkyc0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSAV7AtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzPXwsYDUXUrsTIJI8leuvgFH0ciZTrxSeoq9fD237k10viuK0aYWEEjCMbcJZvku7n
 GDIxD3aPx8AH8LD4DiZ/0v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIk/CS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:9UA5U63Fk1EQFYyJ9HBmfgqjBIQkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3ArmSxMmpKTWSNDGc6IS3AkVPmUZgLdiXHwVfqGAi?=
 =?us-ascii?q?TCntOVJOHan2gpLwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AfavbFQ50rFlYVxvLpSMiswuzxoxv74SjK3oPn65?=
 =?us-ascii?q?fmPSKLwduZx6fkDmOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="796221179"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 08:45:50 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 0B22A18000982;
	Wed, 29 Jul 2026 08:45:50 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 9C45ACC1611; Wed, 29 Jul 2026 01:45:49 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-idna: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 01:45:45 -0700
Message-Id: <20260729084545.2289375-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 08:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242260

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:idna matches nothing in the CVE
databases, which track the Python idna CVEs as:

* CVE-2024-3651 (kjd:internationalized_domain_names_in_applications) [1]
* CVE-2026-45409 (kjd:idna in the CNA record, same NVD CPE as above)

Set both vendor:product pairs.

For scarthgap, python3-idna is 3.7. CVE-2026-45409 affects idna
versions before 3.15, so this metadata change will expose that CVE as
applicable/unpatched. The fix for CVE-2026-45409 needs to be handled
separately.

The bare product name is not an option here: it would also match
"servo:idna", the Rust idna crate (e.g. CVE-2024-12224).

Note: Original commit was for python3-idna_3.11.bb. This is adjusted
for scarthgap where recipe version is python3-idna_3.7.bb.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-3651

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48428c0fe22d8ecbfa53efffb28173d4d37539e6)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-devtools/python/python3-idna_3.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-idna_3.7.bb b/meta/recipes-devtools/python/python3-idna_3.7.bb
index 729aff1c46..e4213be5df 100644
--- a/meta/recipes-devtools/python/python3-idna_3.7.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.7.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
 SRC_URI[sha256sum] = "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
 
+CVE_PRODUCT = "kjd:idna kjd:internationalized_domain_names_in_applications"
+
 inherit pypi python_flit_core
 
 RDEPENDS:${PN}:class-target = "\
-- 
2.35.6


