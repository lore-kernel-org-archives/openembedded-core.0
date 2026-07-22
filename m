Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743BAC4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:08:48 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44374.1784714918964241263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QsSNKepV;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3720; q=dns/txt;
  s=iport01; t=1784714919; x=1785924519;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ZHoHwQgiJ7cyOIWl8UGd0CpBrX5BkEblToIQxLqcYo=;
  b=QsSNKepVc5r/lJ+d7chFUA+w3wlDhrM/9V8FhGSNY07HXHpr8+m0D/fV
   Tx9qmze0R3W/E2B7/0z0tKRsncLrCVBaUywkOJpxGuwGX2daPA8LLiltq
   Em+DdnbTxKlYxRK25Eoti5I/7opYxci/vcKVno3uQLqM2ALoWjUi44Wle
   iIrbyYTic0Lq8vLPHNWwZLn44m/vIWEj7EWk9CV2gZejvUPq+ODcAeolo
   VATZiYlxr2buG5Ztem7e+kNPVK2x2kUdN3Y9t7YWAQI86TPSxIjcy2Nr+
   vQRhaXas2R2sdFS8VJp0p7VFBQvZAtdddYS4H62fwUBRCso0iUZ46c6zx
   Q==;
X-CSE-ConnectionGUID: qqtfToS5Rs+pVJ+ut78OQg==
X-CSE-MsgGUID: 1HrKHYqJSmSQJG/GcspKoA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDClWBq/4v/Ja1aHgEBCxIMggULgld0XkNJlk2LZ?=
 =?us-ascii?q?JI3FIFqDwEBAQ9EDQQBAYUFAo1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAEtEBwDAQIvIAsjCBmDAgGCOgM3A?=
 =?us-ascii?q?xHAbIF5M4EBgygBPwJDUNhJDYJYAQsUAQWBM4U/gn2FI1wYAYR8JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBGkIBgSSHAgSCDRWBDIFaGAaQIkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYEdgS6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6AoEDA?=
 =?us-ascii?q?wsYDUgRLDcUGQQ+bgeNaSOCQHQHEwErpgGCIaAecQoog3WMIY8+hXwaM6psC?=
 =?us-ascii?q?5h9jgqECZJHhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/MEicyAgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJF+AQE?=
IronPort-Data: A9a23:cP0gr6nGoxhtUnfkE9szHHno5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeDz+BbPuNYTajL49ya9nn/R8EvpGDyddiHFZrrS9mRFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsfjb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZQB5uhLBloTz
 +dbMA4vLQ2f2LKR+b3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeMII3RGZwMxS50o
 Eqf337aIiADFuea8gOn3TWDjfTXviTSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:9iLrjKiHYHIREZ8jqtN7O4gzYnBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:4BkOZGyXYnzFNzpcBMahBgUNA9wrTnrmkU3LYFeGKyV0VOLFbmafrfY=
X-Talos-MUID: 9a23:LvN8Lgh+BAWtPRSkf5xoTcMpbedywISfEWI2lK4/mebDGidrIxSapWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="512934113"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:08:38 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id DF8F418000202;
	Wed, 22 Jul 2026 10:08:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 8DB70CD144D; Wed, 22 Jul 2026 03:08:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/4] wget: Fix CVE-2026-58471
Date: Wed, 22 Jul 2026 03:07:53 -0700
Message-Id: <20260722100754.1568842-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722100754.1568842-1-hthakar@cisco.com>
References: <20260722100754.1568842-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241647

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58471

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wget/wget/CVE-2026-58471.patch            | 71 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 0000000000..e306092a8c
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
@@ -0,0 +1,71 @@
+From d22eee13f1fa56c4fdc9f21d5ea1db08dbaf9fe6 Mon Sep 17 00:00:00 2001
+From: Arkadi Vainbrand <arkadva8@gmail.com>
+Date: Tue, 13 Jan 2026 12:22:04 +0200
+Subject: [PATCH] Fix buffer size handling in filename conversion
+
+* src/url.c (convert_fname): Fix buffer overflow.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-58471
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee]
+
+Signed-off-by: Arkadi Vainbrand <arkadva8@gmail.com>
+(cherry picked from commit c2640fe5171c59f87c58dc9fcb195b2d18b010ee)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/url.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/url.c b/src/url.c
+index 2f27c48a..7e7a3cea 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -1603,7 +1603,7 @@ convert_fname (char *fname)
+   const char *from_encoding = opt.encoding_remote;
+   const char *to_encoding = opt.locale;
+   iconv_t cd;
+-  size_t len, done, inlen, outlen;
++  size_t len, inlen, outlen;
+   char *s;
+   const char *orig_fname;
+ 
+@@ -1625,7 +1625,6 @@ convert_fname (char *fname)
+   inlen = strlen (fname);
+   len = outlen = inlen * 2;
+   converted_fname = s = xmalloc (outlen + 1);
+-  done = 0;
+ 
+   for (;;)
+     {
+@@ -1633,7 +1632,7 @@ convert_fname (char *fname)
+       if (iconv (cd, (ICONV_CONST char **) &fname, &inlen, &s, &outlen) == 0
+           && iconv (cd, NULL, NULL, &s, &outlen) == 0)
+         {
+-          *(converted_fname + len - outlen - done) = '\0';
++          *s = '\0';
+           iconv_close (cd);
+           DEBUGP (("Converted file name '%s' (%s) -> '%s' (%s)\n",
+                    orig_fname, from_encoding, converted_fname, to_encoding));
+@@ -1656,10 +1655,17 @@ convert_fname (char *fname)
+         }
+       else if (errno == E2BIG) /* Output buffer full */
+         {
+-          done = len;
+-          len = outlen = done + inlen * 2;
+-          converted_fname = xrealloc (converted_fname, outlen + 1);
+-          s = converted_fname + done;
++          size_t used = s - converted_fname;
++          size_t newlen = used + inlen * 2 + 1;
++
++          /* Ensure we actually grow the buffer */
++          if (newlen <= len)
++            newlen = len * 2;
++
++          converted_fname = xrealloc (converted_fname, newlen + 1);
++          len = newlen;
++          s = converted_fname + used;
++          outlen = len - used;
+         }
+       else /* Weird, we got an unspecified error */
+         {
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index e8847de042..98fe71e220 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58470.patch \
+           file://CVE-2026-58471.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
-- 
2.35.6


