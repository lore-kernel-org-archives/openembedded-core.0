Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D393ACA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 09:43:11 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web10.18758.1758102186600450290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 02:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=f7Oh0YPy;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3984; q=dns/txt;
  s=iport01; t=1758102186; x=1759311786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HBohfDDNnVdKNVE10Zvr3DHCVr0zab/N/LE2GGQ+IP0=;
  b=f7Oh0YPyJocNjc8ipglSa0zfM8oaLZc9Vq2BjtC/u6qaO3AOeZEF8d12
   kmOWPgdH8UWWB4lMpH7v7r18kPAm/F8Es/BBcwsCNFrpE6Zjb0H2DOMkg
   FwxSCZVENYBiWAHSjzij/wYXkTm8k6a5m3riNMvB1ir6S2kGmNN5ZUYx4
   0AxXoszfVREt3R9/mS/oQ8jC7bdA1QofI5FIeZWWKNXwoJj+HmARQeyj9
   f0Mq/HYUTRVoLsomos76Z3jvdk2F64JSZyDoqC+p6V2rNpDfpTnQU5ae1
   qUGQ94JoarvpPl4Hnpa1M0th6OaYWVkV3RW8DwLMHjLzNt2aDB3bi2J69
   Q==;
X-CSE-ConnectionGUID: BVyBdhT3TmCNTAuHrjy1+g==
X-CSE-MsgGUID: f3TNkXtmSLy5AsufYFi9aA==
X-IPAS-Result: =?us-ascii?q?A0AFAABRgcpo/4z/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8FAQEBAQsBgkaBVENJjHCVTJImgX8PAQEBD1EEAQGFB4w3A?=
 =?us-ascii?q?iY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZchloBA?=
 =?us-ascii?q?gE1AUYsAwECWiMhgwKCcwO9XIIsgQGEfNk9gW2BSQGNTG8Bg1iBHycbgUlEg?=
 =?us-ascii?q?lCCLYEFigIEgiKBFoYkig19gV4gFIkPSIEeA1ksAVUTDQoLBwWBYwM1DAsuF?=
 =?us-ascii?q?W4yHYEnhQuEHitPhQKEayRrDwaBFYNbBoExhGZAAwsYDUgRLDcUGwY+bgeVY?=
 =?us-ascii?q?YMwAYEOAYJ1pVahDoQmoVcaM6prC5h7pFiEaYFoPIFZTSMVgyJSGQ+OLQsLx?=
 =?us-ascii?q?h8mMjwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:spph1a3Tz+a0fLbdKPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzwGx
 mIdWDrUPP2MYmajfoh0aonioRtTvcTRmNNmQFFs3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmG4E70aNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU6
 bsen+WFYAX4g28tbTpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJn8nF4EYxr1LBEpoy
 dUFCCoPf0nAiLfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWh/+1nXnncDRwo1OOrq1x6G/WpOB0+OWwaIqII4zWHa25mG6W/
 V7g/FTlByo+JYG20ieLw1yt1+bmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:ojd+iay8x5B8klVQZLjEKrPwJ71zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBEXMoVmpM
 Bdm28UMqyVMWRH
X-Talos-CUID: =?us-ascii?q?9a23=3AVKIogmg0V1wMnLyWS/VFv1nZhDJuWEPM5nvQHxS?=
 =?us-ascii?q?EDE1PdJSIaUWS6fonnJ87?=
X-Talos-MUID: 9a23:UCQMlwR8hMlA5c+tRXTi3w1EN/d05p+KGR0kiogIiueFZCVZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,271,1751241600"; 
   d="scan'208";a="550851840"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Sep 2025 09:43:05 +0000
Received: from sjc-ads-9088.cisco.com (sjc-ads-9088.cisco.com [10.30.208.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 81103180001F7;
	Wed, 17 Sep 2025 09:43:05 +0000 (GMT)
Received: by sjc-ads-9088.cisco.com (Postfix, from userid 1839047)
	id 2AC09CC1292; Wed, 17 Sep 2025 02:43:05 -0700 (PDT)
From: Shubham Pushpkar <spushpka@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [OE-core] [Scarthgap] [PATCH] grub2: fix CVE-2024-56738
Date: Wed, 17 Sep 2025 02:43:04 -0700
Message-Id: <20250917094304.2619993-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.98, sjc-ads-9088.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 09:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223588

From: Ross Burton <ross.burton@arm.com>

Backport an algorithmic change to grub_crypto_memcmp() so that it
completes in constant time and thus isn't susceptible to side-channel
attacks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30a1cc225a2bd5d044bf608d863a67df3f9c03be)
Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../grub/files/CVE-2024-56738.patch           | 75 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
new file mode 100644
index 0000000000..c7b64aa6ed
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
@@ -0,0 +1,75 @@
+From 4cef2fc7308b2132317ad166939994f098b41561 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 9 Sep 2025 14:23:14 +0100
+Subject: [PATCH] CVE-2024-56738
+
+Backport an algorithmic change to grub_crypto_memcmp() so that it completes in
+constant time and thus isn't susceptible to side-channel attacks.
+
+This is a partial backport of grub 0739d24cd
+("libgcrypt: Adjust import script, definitions and API users for libgcrypt 1.11")
+
+CVE: CVE-2024-56738
+Upstream-Status: Backport [0739d24cd]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ grub-core/lib/crypto.c | 23 ++++++++++++++++-------
+ include/grub/crypto.h  |  2 +-
+ 2 files changed, 17 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
+index 396f76410..19db7870a 100644
+--- a/grub-core/lib/crypto.c
++++ b/grub-core/lib/crypto.c
+@@ -433,19 +433,28 @@ grub_crypto_gcry_error (gcry_err_code_t in)
+   return GRUB_ACCESS_DENIED;
+ }
+ 
++/*
++ * Compare byte arrays of length LEN, return 1 if it's not same,
++ * 0, otherwise.
++ */
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n)
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len)
+ {
+-  register grub_size_t counter = 0;
+-  const grub_uint8_t *pa, *pb;
++  const grub_uint8_t *a = b1;
++  const grub_uint8_t *b = b2;
++  int ab, ba;
++  grub_size_t i;
+ 
+-  for (pa = a, pb = b; n; pa++, pb++, n--)
++  /* Constant-time compare. */
++  for (i = 0, ab = 0, ba = 0; i < len; i++)
+     {
+-      if (*pa != *pb)
+-	counter++;
++      /* If a[i] != b[i], either ab or ba will be negative. */
++      ab |= a[i] - b[i];
++      ba |= b[i] - a[i];
+     }
+ 
+-  return !!counter;
++  /* 'ab | ba' is negative when buffers are not equal, extract sign bit.  */
++  return ((unsigned int)(ab | ba) >> (sizeof(unsigned int) * 8 - 1)) & 1;
+ }
+ 
+ #ifndef GRUB_UTIL
+diff --git a/include/grub/crypto.h b/include/grub/crypto.h
+index 31c87c302..20ad4c5f7 100644
+--- a/include/grub/crypto.h
++++ b/include/grub/crypto.h
+@@ -393,7 +393,7 @@ grub_crypto_pbkdf2 (const struct gcry_md_spec *md,
+ 		    grub_uint8_t *DK, grub_size_t dkLen);
+ 
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n);
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len);
+ 
+ int
+ grub_password_get (char buf[], unsigned buf_size);
+-- 
+2.43.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7c83febaa2..fd671d88ad 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -37,6 +37,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45778_CVE-2024-45779.patch \
            file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
            file://CVE-2025-0678_CVE-2025-1125.patch \
+           file://CVE-2024-56738.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.35.6


