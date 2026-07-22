Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ECCC4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:13:08 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44571.1784715179150423062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lgaaBj4O;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3718; q=dns/txt;
  s=iport01; t=1784715179; x=1785924779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kWMGluSXc0tGoOp1vZA6QWkAWRgMn9uHC1zGO4WOoeE=;
  b=lgaaBj4OA4vzMPZn2CGTyiZ8i44lQK831NBWaLOomZRigGYbpL7Mqx+k
   Lv/+P4/wYwYh0sx/ndBeJn0bZB09ejJ2cf35rX6TiK1QBmxX5MNVVjBvS
   ru43DeDgjFIstHCIf49pU+ZJF8A78aH2VDtJAGDxrnwkdyzjy5L/RTzCa
   ztK46S+mB5uglzs8rbQAip8vZ4nGfh1p+KLPG8vj/y1mYdRj2+vyGQw5p
   gVki1bsiISTZNUPb4FJV16xExiMBfbBxPsdyaik0A5zeVFQd0f33bHWTm
   QtE8f4xfaz1i4Jnwyu7SYFejGILtr+Gfl5zGra3/RLYwhBgvXctBYDLcx
   A==;
X-CSE-ConnectionGUID: 1nQzJUwcRsSbIHi3uyZWCA==
X-CSE-MsgGUID: cSY1tS31QsOS4Rua/02eJg==
X-IPAS-Result: =?us-ascii?q?A0BIAgDRlmBq/4//Ja1aHgEBCxIMggULgld0XkNJlk2LZ?=
 =?us-ascii?q?JI3FIFqDwEBAQ9EDQQBAYUFAo1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAEtEBwDAQIvIAsjCBmDAgGCOgM3A?=
 =?us-ascii?q?xHAeYF5M4EBgygBPwJDUNhJDYJYAQsUAQWBM4U/gn2FI1wYAYR8JxsbgXKBF?=
 =?us-ascii?q?YNpgQWBGkIBgSSHAgSCDRWBDIFaGAaQIkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYEdgS6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6AoEDA?=
 =?us-ascii?q?wsYDUgRLDcUGQQ+bgeNaSOCQHQHEwErpgGCIaAecQoog3WMIY8+hXwaM6psC?=
 =?us-ascii?q?5h9jgqECZJHhGmBaDyBRwsHcBWDIglKGQ+OOINrgX/MEicyAgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJF+AQE?=
IronPort-Data: A9a23:B6zi264C5ixdLxwlTvBSEQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mMZDW/SMv6Damf1fN4iO9u09kgAuZSAydNlHgNtpXg3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZIsh6MRKHmp07
 scSCRAMNQ2Std2d6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc6FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEUUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYOOKo3QHJwO9qqej
 mn9zj3lOUpDDce48ma/73vr3rXCvyyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjZCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:ieyoLq8WOYfLK8oEz/Ruk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:YJXX8GFub+Fea+wBqmI+8ncGOP06eUfG933xA07jFHdbd5a8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AiGyRig0uhKknorf62LfglxiDyzUj6J+fUVw2ysw?=
 =?us-ascii?q?/oO6/aRZtMnDF1jmVTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513892113"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:12:58 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 443B318000394;
	Wed, 22 Jul 2026 10:12:58 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id E7716CC12A6; Wed, 22 Jul 2026 03:12:57 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/4] wget: Fix CVE-2026-58471
Date: Wed, 22 Jul 2026 03:12:29 -0700
Message-Id: <20260722101230.34771-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722101230.34771-1-hthakar@cisco.com>
References: <20260722101230.34771-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241652

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58471

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wget/wget/CVE-2026-58471.patch            | 71 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 0000000000..4938e6761a
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
@@ -0,0 +1,71 @@
+From f419222cc7e02dea2da104b4fb5a997019bab9a9 Mon Sep 17 00:00:00 2001
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
+index 68688256..6a9efe88 100644
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
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index 50df38aab1..fa4958a485 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -6,6 +6,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58470.patch \
+           file://CVE-2026-58471.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
-- 
2.35.6


