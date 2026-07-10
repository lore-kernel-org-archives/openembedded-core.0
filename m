Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200A9C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:10:30 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12233.1783689029208696099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZQIl/jSX;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3049; q=dns/txt;
  s=iport01; t=1783689029; x=1784898629;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OXQdt9FjmIXo247evAxp03GUAvsEVCIZce+oVfoz9yw=;
  b=ZQIl/jSXMg1tOd6pc9/o3ArDvYXtjZqAUKbtL210IS0LpzC64KrLJEUv
   SpjnILOMfQA38NIT0mrzU4IEaRfwob/EKyEuBLQjmZML5s53aqRj1xk4j
   z5nRH/0JDwm0c1NYdGKnCt9AZ+CaW9f0qc2Hxq0jIh89em3PgWpweOVab
   GkhFWvhoZjVsE51zbhLf4Ozt/hQGPK1zke9WLkX2AbQ9WvSq5YbetIl+t
   ioELRLkgL4jtM2PDr1D2QQ0W1XTKGbdc3nwxvNJB3WLe8aYVM+3FMcin+
   SoJEzJ+ZDFcH+zDu026s/mpich8g31fS24un5byvYWsmnL9FahVli4fB1
   w==;
X-CSE-ConnectionGUID: MkST4RwcTIOb/EJeTAoyiQ==
X-CSE-MsgGUID: FqihLhYTSoOBFWZ/SFzQdA==
X-IPAS-Result: =?us-ascii?q?A0BDAgBH7lBq/47/Ja1aglmCV3RfQkmUKY4IkjeBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP44VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBOAEYAVkDAQJPCyMhgwIBgjoDNgIBEbk/GjeCLIEBgygBPwJDU?=
 =?us-ascii?q?NhJDYJYAQsUAYE4hT+CfIUjWxgBhHwnGxuBcoR+gQWBGkIBAYglBIIigQyBW?=
 =?us-ascii?q?h6FB4prSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BWYECh?=
 =?us-ascii?q?HkjHwM5f4EwdUp5LXMSHgqBUoIWVAMLGA1IESw3FBsEPm4HjT4XD4I+gQ4sg?=
 =?us-ascii?q?UMRpk6gHnEKKIN1jCGPPoV8GjOqbAuYfY4KhAmSR4RpgWg8gSgfCwdwFYJuA?=
 =?us-ascii?q?TMJShkPjjiDa4F/zFskNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:ZMV+mK+tQPVXnb6Zzyy+DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zdJWzuPM6qPZGHweN5+aY/i/EIPuZaBz4AwQAZsqytEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbTpEs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kTPrYkptxoCl1v0
 vZfBRIAUjmEluOPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+HNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0cn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYKKK4HSG5UM9qqej
 kzf/mTdAiAmD9u44xS6wDWXqP32kQquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjVCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:1EKPR63A5NzN4dq8goqdMgqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoWpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:NRJheWOAOR0Ype5DfSpcyBIuBcsZU1rXi1ryLnORDndocejA
X-Talos-MUID: 9a23:mHB+jAlDO3W4kqpHP3mvdnpMLcZox6SfNHsKtr8ohPvDDgJiAju02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507950681"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:10:28 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 57E4B180000B4
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:10:28 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 0600CCC2EC3; Fri, 10 Jul 2026 06:10:28 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 07/10] expat: fix CVE-2026-56409
Date: Fri, 10 Jul 2026 06:10:23 -0700
Message-ID: <20260710131023.2822931-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240647

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56409

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56409.patch b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
new file mode 100644
index 0000000000..a24ce369be
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56409.patch
@@ -0,0 +1,52 @@
+From 10938bc2cef7573087566b5b1c948061baa68b98 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Mon, 1 Jun 2026 11:53:19 +0530
+Subject: [PATCH] xmlwf: protect output path join from integer overflow
+
+CVE: CVE-2026-56409
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e]
+
+Backport Changes:
+- Adapt the allocation hunk to the explicit cast used by Expat 2.7.5.
+
+(cherry picked from commit 61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 06416454..6a0a707a 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -1236,8 +1236,26 @@ tmain(int argc, XML_Char **argv) {
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
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index fa9a8bc100..a71e2f8cba 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
+           file://CVE-2026-56409.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


