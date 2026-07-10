Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D849C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:09:20 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12287.1783688953637093122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DffnlgJM;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2301; q=dns/txt;
  s=iport01; t=1783688953; x=1784898553;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o/u8ubR6r+ZfEq8NWdxU/6u8LxpCee66MRJaM3EDvvc=;
  b=DffnlgJMUoqolgTQQovr2U+8GkO66KrF8fCpseMwdvbuWdqzaVzsRWOh
   8tghDTrB6oYLxBl6FgwIXmXGgKZ+XxnjP99S5FPfmCL8CdCZP+b8yF1FT
   m6D1PNEZxUOWmeLDSTmlC7TyjBJUfArxesbU3pbrPBdVh20/UfTLhxixr
   +88hYlWvZ7o7kvQs8EnTRIJgj2MMzTTV79WejaCrizX4EoTiqbEmF/c5k
   pRxebeY6aI252TweCGvC0L6CQJtAnXymfDnNuIvEd0UiL08qnkggaHedp
   bvO4ERLLyws/GVbh1F1O31UgLf8aWiiAdQUwF4eGOEloLkgtoY4HUaPl2
   A==;
X-CSE-ConnectionGUID: gDGHLtoNSsOxn3bocuI43A==
X-CSE-MsgGUID: d6YLlyQRRJWvKQr2juHk3g==
X-IPAS-Result: =?us-ascii?q?A0BDAgBH7lBq/4v/Ja1aHgEBCxIMggULgld0X0JJlCmOC?=
 =?us-ascii?q?JI3gX4PAQEBD0QNBAEBhD9GjU8CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgE4ARgBWQMBAk8LIyGDAgGCOgM2AgERuT8aN4Isg?=
 =?us-ascii?q?QGDKAE/AkNQ2EkNglgBCxQBgTiFP4J8hSNbGAGEfCcbG4FygRQBg2mBBYEaQ?=
 =?us-ascii?q?gEBggYnhXgEgiKBDIFaHoUHimtIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBHYFZgQKEeSMfAzl/gTB1SnktcxIeCoFSghZUAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeNPhcPgj6BDiyBQxGkLYIhoB5xCiiDdYwhjz6FfBozqmwLmH2OCoQJk?=
 =?us-ascii?q?keEaYFoPIEoHwsHcBWCbgEzCUoZD444g2uBf8xbJDUCCTIBAQcCBw4DC4Fok?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:gHa7uKgr8TaypGadcgkCDH4/X161MREKZh0ujC45NGQN5FlHY01je
 htvDTqOP/yLYDamL4sjbomz80sFvJLVnYcxTFFq+CFjQ3hjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMtPrT8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUX1slXJX1J0
 8cDDyALNRqEjP+XnOmSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQZ/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9J4TVFJgNxhvIz
 o7A12inMzUeJeWl8xi67FGVnLXNgAP4A41HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn288lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:qTTnw6DheT5CJ5vlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssRMb+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:n3vHW27UD4hcpSdyq9ss+2I7OuQ5dVvm11DAJRSyDm10aeHOYArF
X-Talos-MUID: =?us-ascii?q?9a23=3A+AvuKAz8zcACI6yiuRrTyFt832SaqKjwOWQJgKw?=
 =?us-ascii?q?8geu7Kw9JIW2fkRS0GYByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507950058"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:09:02 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id B4E5018000369
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:09:02 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 62551CC2EC3; Fri, 10 Jul 2026 06:09:02 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 04/10] expat: fix CVE-2026-56405
Date: Fri, 10 Jul 2026 06:08:51 -0700
Message-ID: <20260710130852.2820953-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240644

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56405

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56405.patch b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
new file mode 100644
index 0000000000..c850801c1a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56405.patch
@@ -0,0 +1,32 @@
+From 73209f445f0265b203829fa7873caa78ca83cefe Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 11:45:17 +0530
+Subject: [PATCH] lib: Protect function getAttributeId from signed integer
+ overflow
+
+CVE: CVE-2026-56405
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0]
+
+(cherry picked from commit 2c6c42d33689f6b266a5267b639e03cde17e53c0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 1b7e289f..ec707336 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -7324,6 +7324,10 @@ getAttributeId(XML_Parser parser, const ENCODING *enc, const char *start,
+     } else {
+       int i;
+       for (i = 0; name[i]; i++) {
++        /* Detect and prevent signed integer overflow */
++        if (i == INT_MAX) {
++          return NULL;
++        }
+         /* attributes without prefix are *not* in the default namespace */
+         if (name[i] == XML_T(ASCII_COLON)) {
+           int j;
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index affc134285..578d745e61 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
+           file://CVE-2026-56405.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


