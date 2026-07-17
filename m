Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD9BC4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:05:17 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7686.1784268314440757964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EBz8AHSz;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2676; q=dns/txt;
  s=iport01; t=1784268314; x=1785477914;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+wR1uhWLqIMt9At/1ltt/gDvSzfK4XAD0Kc9fDwOaXs=;
  b=EBz8AHSzkK8IFjtIkpLDife5Nx8gD4+SFLX2ONyza7xW66rDN7Fp837L
   4Fpqv8JiKT/W2drd9LhhuI+7UIIIW4Y6ld5t7tZdeNH7EBlaQ0I0Qg1O6
   1BV+bEnj9yvCbdVH0Usc83JjlKxRxcd1CR99G9A4VPrNoejnVKVkvu9VX
   TH1ui5sXmWS8ofLMLuqNpGh1CRo0YsgZRHy8yXbfN0/psNEz2dWQGz/vu
   3AX16yN9wc6iGqPthHPzOzjHIoSyV6WjgMZYjU4MH0uRpeQ7AeukzDXxa
   nMIzQ0vYuX89q65VTIY/J1dTp9b8G5pbJZsnxs8DDP+YAkx5xEyVsia4w
   g==;
X-CSE-ConnectionGUID: vMHOyA84QtOSb6DYOXy0bg==
X-CSE-MsgGUID: 9237OLciRq6bRpx5PAIXTw==
X-IPAS-Result: =?us-ascii?q?A0BHAgBIxVlq/5H/Ja1aglmCV3RfQkmUKYIknhuBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjVICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMyARgBPRwDAQIvKyMIEQiDAgGCdAMRvHoaN4IsgQGDK?=
 =?us-ascii?q?AE/AkNQ2y4BCxQBgTiFP4ggXBgBhHwnGxuBcoEVg2mBBYFcAQGCLYV4BIIig?=
 =?us-ascii?q?QyBWh6Ec4sOSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BO?=
 =?us-ascii?q?oEAhHYjHwM5f4EvdUp3LWoSF4FOghSBPgMLGA1IESw3FBsEPm4HjUgjgj8xX?=
 =?us-ascii?q?QErgUOmXKESCiiDdYwhlToaM6psC5h9jgqVaGiEaYFoPIEoARoECwdwFYJuA?=
 =?us-ascii?q?TMJShkPjjiDa4F/zEE8NQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:oPbP3a0ya/3Rt7GPU/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzAFz
 mdNDWHUMv7ZMGakKop1YIvi9R4E6sXVx4BiGVdv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EtbDpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGEmQWGpwxqrpOHUZ1/
 6I0GRc9f0iJiLfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW0aYSPJobaH625mG7J/
 DmZ2EDyAysDatal0SrYyluNttPQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:zj0LoKAa8Cm800blHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:frio724i4Z3/kVzge9ss6ms0PdEMIiHk0FDrKRGUOEFZWeWfRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AyqCH1w/kfCFufCpL+3WSF8mQf5YyuPuJLEsMq4x?=
 =?us-ascii?q?YsfOcJXFIEhatsCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="511624282"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:05:13 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 4D5A6180001FA
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:13 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 700DFCC037D; Fri, 17 Jul 2026 11:35:11 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 02/10] expat: fix CVE-2026-56408
Date: Fri, 17 Jul 2026 11:34:29 +0530
Message-Id: <20260717060437.2910653-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241141

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].
The fix is adapted to the existing Scarthgap Expat 2.6.4 source.

[1] https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56408

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/expat/CVE-2026-56408.patch          | 33 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56408.patch b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
new file mode 100644
index 0000000000..7fbe617b47
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56408.patch
@@ -0,0 +1,33 @@
+From c1ad5610cf060c6374d8f8d3b39163edd7053321 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 23 Apr 2026 10:31:45 +0200
+Subject: [PATCH 03/17] lib: Waterproof `copyString` from integer overflow
+
+CVE: CVE-2026-56408
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817]
+
+Backport Changes:
+- Keep the Scarthgap 2.6.4 copyString loop and add only the
+  upstream allocation overflow guard.
+
+(cherry picked from commit 16e2efd867ea8567ffa012210b52ef5918e20817)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index df92a3ca..12bbe23e 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -8489,6 +8489,10 @@ copyString(const XML_Char *s, XML_Parser parser) {
+   /* Include the terminator */
+   charsRequired++;
+ 
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   /* Now allocate space for the copy */
+   result = MALLOC(parser, charsRequired * sizeof(XML_Char));
+   if (result == NULL)
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index dba4b2c81d..acd943b4e6 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -53,6 +53,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32778-02.patch \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
+           file://CVE-2026-56408.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

