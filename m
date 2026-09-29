Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07706CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 04:18:38 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.655.1790655517558975401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 21:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SJPqQ1Da;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1630; q=dns/txt;
  s=iport01; t=1790655517; x=1791865117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OioZAjyq2vww9Pr1seUpEFNMI3Zn/J7kl4ca5P23NOM=;
  b=SJPqQ1DaCQtT6QMyMfxEdRA08RbO3tIqokehnvznvDvPnLq1hiqCHQC1
   YZbggNK3vjCNwGPfnkxG/SLn0E/xG3Re7W+g1DIhGQhN8IWkVeVBvpE5J
   l4aT6sOozKmuJIprcFBN49GoJr4QVU3aL33v+R6eKrlWunLhuFBA8rESE
   LZkfwv7B0cqjsve6PgC6KVIMLOSieXU/jN028ZCbZX5Md+xx3e2vRLL/3
   UHDacmFE9uF3wXLZqza1PFWJaZBQZecNuutrhIrxKs112vbTSa4Sd5kPn
   tcLflvtMop0GqFuLBPVFiFEa8izEsvuOvRjly5DyoTyHG8E48bn/djlff
   w==;
X-CSE-ConnectionGUID: n4+TQ0llRHiF8sbF9sdD2A==
X-CSE-MsgGUID: rWxOk/5CS1CXyhPCRevJNg==
X-IPAS-Result: =?us-ascii?q?A0BGAgBDO7tq/43/Ja1aglmCV3VhQkmWSgOBE50HgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4IAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZATAgEDMgEYAS0QIDErKxmDAgGCdAIBEcABgiyBAYMpAT8CQ?=
 =?us-ascii?q?1DbMgELFAEFgTOFQIgjdoR8JxsbgXKBFYJzdoEFgVwBAYIthXgEgiKBDIF4k?=
 =?us-ascii?q?zhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBHYEgghkjGTZ6g?=
 =?us-ascii?q?QlegSspYAEQF4EHggcCglSCAQIBSUMOB0VTCSVFEkcmIggSCQETGjALgSE4Q?=
 =?us-ascii?q?QkoPxgNSBEsNxUZBD5uB5A/HoFyc4EOLBcJAoFiAZNfgyKPHKEPCiiDdowil?=
 =?us-ascii?q?ToaM6pvmQiOCpZQhGmBaDyBRwsHcBWDIglKGQ+OOYNrgX+DFMcmJDUCCTIBA?=
 =?us-ascii?q?QcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:uy2D8qLZX5Nbqc9aFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS0jICn
 WVLC2+GOv6PZ2ugfY92aYni8U9UvpOAmtQwGQQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH9imQkajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1oUAIKBNUc/txXAE8e7
 vY2eSsBQkqq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsiuiwa4WPIYLiqcN9hHmIg
 WGBok/CWzoqJdyn4gCI7FCKibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:Mw2i8K3IU03hKItez22CywqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:KP9GwW9rt+BL3sxAk2iVv0hIWfwcKnnZ9lfRDR+jA0g4U7G5E3bFrQ==
X-Talos-MUID: 9a23:EHD2pQWTtjSuEjbq/CXTlBZhc5pD2P2FOFENqb48ttemEyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,129,1787011200"; 
   d="scan'208";a="528537236"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Sep 2026 04:18:36 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id AA6D7180001A3;
	Tue, 29 Sep 2026 04:18:36 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 52244CC12B5; Mon, 28 Sep 2026 21:18:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 3/8] libxml2: mark CVE-2026-86139 fixed
Date: Mon, 28 Sep 2026 21:18:31 -0700
Message-Id: <20260929041836.2217090-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
References: <20260929041836.2217090-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 04:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246811

From: Hetvi Thakar <hthakar@cisco.com>

The fix for CVE-2026-86139 adds a zero-length guard in
xmlURIEscapeStr, as shown in the upstream commit [1].

The libxml2 2.12.10 source already contains the equivalent guard,
so no additional patch is required. Mark the CVE as fixed in the
recipe.

[1] https://github.com/GNOME/libxml2/commit/8edbbdb09f24d26a2f900141fddc2b9d014f53b0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86139

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-core/libxml/libxml2_2.12.10.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 28ae601118..93b7a23754 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -46,6 +46,10 @@ CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail
 # https://gitlab.gnome.org/GNOME/libxml2/-/issues/958
 CVE_STATUS[CVE-2025-8732] = "disputed: the code maintainer explains, that the issue can only be triggered with untrusted SGML catalogs and it makes absolutely no sense to use untrusted catalogs. The issue triggers a crash if an invalid file is provided.  https://gitlab.gnome.org/GNOME/libxml2/-/issues/958"
 
+# The Scarthgap 2.12.10 source already contains the equivalent zero-length
+# guard required for the xmlURIEscapeStr integer-overflow issue.
+CVE_STATUS[CVE-2026-86139] = "fixed-version: xmlURIEscapeStr returns NULL when xmlStrlen returns zero"
+
 BINCONFIG = "${bindir}/xml2-config"
 
 PACKAGECONFIG ??= "python \
-- 
2.35.6


