Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2974C624D4
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 06:09:49 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6000.1788329387795936263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 23:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ps94pAAk;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1366; q=dns/txt;
  s=iport01; t=1788329387; x=1789538987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nIc3zEsWzkI7SssGz8CQ/LWJBw0S0GJrT3qJGd3M31A=;
  b=Ps94pAAkjFZnfBHPWYKoXCnORqkRm0YC46gw0knY5wKpC+ZTGJ2mfS5q
   tcXFfcFo1LCdwg7P1Bc9weGr+0ts1n/M6UMbAog2XPwoqVpb21MF/wh2K
   HBoTw/IURyYJFYU6TraNS25apGlFWU1G42I7Qh+is48O3xpDi/2+H3LKe
   eJqhSMhInibBeCWqXASmW9Gfv+7vXVwNB99yhIKipGLvGh8SlLrxRF6MO
   qdjURn4mgWo2GQiLeWwIuF8PF0meFk4wFEuaEQB5y3nai9BCgl4MuOobv
   KPPEtW5Gdb5a9NGU7FoNhi+qyG7dqsga850DMrtbLN/vM/IypA0HLdUl7
   w==;
X-CSE-ConnectionGUID: n7MrGLrkQRCu1eigtlNGAg==
X-CSE-MsgGUID: VC3dgUUDQkeP1EUi9atBww==
X-IPAS-Result: =?us-ascii?q?A0A2AwBSvJdq/40QJK1RCYJZgld0YENJlV5sA6AZDwEBA?=
 =?us-ascii?q?Q83GgQBAYUFAo13AiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyQGgIBAzIBGAEtECAxKysZgwIBgnQDvgqCLIEBgygB3QQBCxQBgTiFP?=
 =?us-ascii?q?4gidoR8JxsbgXKEfoQKDXmFeASCInoSk2BIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEog0EjGTZ4gQlegSspYAESF4EJgggCglSCBQIBS?=
 =?us-ascii?q?UMOB0dTCScKCxgNSBEsNxUZBD5uB45ZH4JPATxRllSReqEPCiiDdowilToaM?=
 =?us-ascii?q?6psLphapFqEaYF+JkaBE3AVgyIJShkPji4V0BknMgI7AQEHAgcOAwuBaJAAg?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:Ms1uE6lIYmfwrOq6a/62ei3o5gzqJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJWz+FOa6LZmTyctglPN60oxhUv5HRn9FrHVdqpCFkEVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpFs/jb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYtH3/xYJXtNz
 MYzNWkAbx+fg8SZ6b3uH4GAhux7RCXqFIobvnclyXTSCuwrBMifBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEWUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIqPJIbXHJUNxC50o
 Er41D/1DSwnGOWcxALc30+t1+bTtzzkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0c9lQHuh88giP4q3P+ECAG2EARTlEbZots8peeNAx/
 laNm9WsAXlkt6eYDCrBsLyVtji1fyMSKAfueBM5cOfM2PG7yKlbs/4FZowL/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:Uu6Rwa6H6bHK9wK5XgPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AlEH3rWjLI9pSCFdC/Pwj1vPRJTJudCL41lj0OUy?=
 =?us-ascii?q?BM010EbCURkOU3oxNnJ87?=
X-Talos-MUID: 9a23:f4ZHdwa3QmGiduBTiRS3iD5fCetR4KmWUW0wkMQPp+ObKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,257,1779148800"; 
   d="scan'208";a="826251802"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Sep 2026 06:09:47 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id D52B3180004AE;
	Wed,  2 Sep 2026 06:09:46 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 729C2CCD9B2; Tue,  1 Sep 2026 23:09:46 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2 2/3] python3-py: correct CVE_PRODUCT mapping
Date: Tue,  1 Sep 2026 23:09:42 -0700
Message-Id: <20260902060943.2931635-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260902060943.2931635-1-dkelaiya@cisco.com>
References: <20260902060943.2931635-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244891

From: Devansh Patel <devanshp@cisco.com>

The product-only "py" mapping generates a wildcard-vendor identity
instead of the exact NVD identity for the packaged pytest-dev py
source. Use "pytest:py" for its NVD dictionary CPE and configuration
matches.

This changes the generated product identity. With sbom-cve-check 1.3.3,
the current CVE report is unchanged using the pinned database snapshots;
both mappings report CVE-2020-29651 and CVE-2022-42969.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 26fa8b053b71d1f3f8da359abaef578c671c692f)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
index a75b9c2b14..906410e9bb 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
-CVE_PRODUCT = "py"
+CVE_PRODUCT = "pytest:py"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.35.6


