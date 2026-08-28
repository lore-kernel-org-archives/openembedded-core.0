Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71ADC61DDD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3038.1787945889456712210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GzOVVYVx;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso661675f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945888; x=1788550688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0N2lOBFRWVaEkE+P9lL184uUOgJaU8UwzDCYtyH31D0=;
        b=GzOVVYVxVi12ljIUgHymigi86lMksh9ZVbSV75x3k30vA7GrKBkZM0d604YXBSPYf8
         osdM5kdaG1m3a5hgPsudp8OktDsN9jJHofmt8V0qa+U8oCRg9tBVi8A06Mc2fRSR1q0o
         IRXjxCanCyf7tzYe28krPyCZIopj5SIv7Q4EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945888; x=1788550688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0N2lOBFRWVaEkE+P9lL184uUOgJaU8UwzDCYtyH31D0=;
        b=mX7xAhFbsTaFHb0ZJwrGszPgYVBPRo1d40JbnCrcpLwDInjA1vvzgchXazP76KIBz+
         m/AkmseWKoevTTUVNp//afqW0bH1Xg4H0RsVEf+GEkOK4PX+VpsAY/DnsOCf25k1r3qN
         32S8+Pgzdn8zy0085tdjmk2SabC2ingVKPAqOWXhnTmDtc7ijFqiBALUcmOuEyTQ6g3v
         t3IAcjP3nSr9EYUfaBvDb0XpEie9pdaqus74GfrVLZHLeoWiqrlMN4R2o3oWHcVizgZn
         zHyN1+LGj7JTjg5aGB2RWQlLaJZvBgqnMSKn4+auvQ0XNq8xQboCnh3pQx6IlfikhGVQ
         wGxw==
X-Gm-Message-State: AFuF++mzU/zHC61KSoUd6SgEFI+uBEqoBbetiduU34x9T0QtiuTMaeC+
	H/IxeMjeyzVr03XG41oLq5pvPEyNtV7opHMC5UEDHbG2DLK7xEi0iz363Z8weRppxDCvtG/BbQW
	MV0kAMS0=
X-Gm-Gg: AR+sD10mYjN+IBbkKLIxqUQD7Rf20FaNiI1segBZJqsyrfT8SyLQP/8YQ4qCHxRCu3R
	YUJ4WqGSdrUGuBYyyMcodOGAQaGokuYn04/I7bjjKsmq5jZNecIj9J3ZIZVQIqb3heihdpmt0I+
	qgDpS7TC9JmpZ3KO16AfX09tQsrkdXQeuRdC9menHtbUurr5a4UbyPzu8cM7z0l63TP61FILBSA
	sr3iCdfB97RhcT1FW/hHIp/AwDBCHEnbZ7qv6R7E58Dr9hKsk0LJPdYQYAaKbSglMwBsMiqtKIa
	mDWRpQ1mI/TVfl7OmOlP8IFZe1tMlPNiWlASZJ9bzz1bpffMEpcLa/LRVTxaNbLc1T7f314q79D
	/pDFwx/EiFyEuojlMJKKvAnkE/eE1N94Z9yJFpiz42l4lSSYGE7dnJYcdAsFK386AEktAixQ9wX
	v1u1Cm0Fe85fIPXiUBSXrvQnMzBmBCe3At0w8DhMtuY6WtMBE/xpx7aPqzxvYdjJOMhWPy+AH6b
	K0tHmVaI0eIgm7IEejD2nIuLNGPvb1gSDeHUUtZilAYqBld4SzJc0/BpOBaCuKx
X-Received: by 2002:a05:600c:1389:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-49b91c1713emr124181065e9.3.1787945887653;
        Fri, 28 Aug 2026 12:38:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/56] wget: Fix CVE-2026-58471
Date: Fri, 28 Aug 2026 21:35:17 +0200
Message-ID: <48236b679cd64269ade3dbd65e145718f86d773f.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244568

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58471

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wget/wget/CVE-2026-58471.patch            | 71 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 00000000000..e306092a8ca
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
index fb777549653..25eea0f801b 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
+           file://CVE-2026-58471.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"

