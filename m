Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88370C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5672.1788326819179254016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O8T0587m;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so6490575e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326817; x=1788931617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t9eZd2ld8w4iKXEGV3L0LyCFqRb8Nw0fzxb9pZfvfbA=;
        b=O8T0587mYPRPbET16y3IbE1SGUmLyzYppl3xzqWFPjg/MrQZ4FNBc5Sz5gW5lDmKVG
         BB6o5NDlyfk7tJ84pVH2Jq5ExH4ADXzXCUw1xRr+ZruySX68w608dXmHwcU74yjVJahY
         rlO2ZP+Fno5rY5r6FB7N1oViudol81y5U8bAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326817; x=1788931617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t9eZd2ld8w4iKXEGV3L0LyCFqRb8Nw0fzxb9pZfvfbA=;
        b=D8wN6bxRnSR6NBlRoaRHoYF6wbyL3Yeech/dtbl69ggmX4Yf/wY5iomiUrsEcHUSJI
         wtntMr5taRd8KfN3g4m6AeJPy8es7I7S9Sz46ofDFIe6ggQI6PXaJpAwpLnQqP18bntX
         XYM/cDklWDGs8Lg2I2Doi0/KT3y11xlP7IEsFVY+Db7ENvpxsQdvZI81Qp/pMwvqhRaz
         EbG7TaEYcSEP+QRS4mj2/NcE3kU0Ol/Ian2X1WJO6o/vGxg396FpY+7JSebjqPzaisGz
         zianbHZ7cxxXHDr25aclGcUtSUSd1RXlcArVoFrQnsyQQRvikA7APolE5WWSFryL6u75
         UIJA==
X-Gm-Message-State: AFuF++m/6sDXZ+RF4IdpmSb4ytCrMqv6OvO8duBLPQIU7DEXO8Vu8auC
	HYt8YjHRvxAhADZmXf2Nh21c7hHQ2eCc63PW1+TWqnjVVVnlu6T+0K0TIVtqLoRyP89cuwJqxli
	xr8SmIwU=
X-Gm-Gg: AR+sD10NIR57ZNS31/6EbhMQ8OTHKR3m52xu2totxRM+l9LCXHM2yxlTnXVsR7V96NE
	B65orPXYrqzd2iDLxRiBfWdVbZtlB9adVlWO4UH7exBxQbU9lHNjIJiwzIT+CZI5IkG9KOw74GU
	xBQCX31FmUq33x/57V/VmHWKc9Xc1ucxvRL8DXfRNAh0dAZpyhSdBucD+5RA0cwXhbDdAlzGvRp
	CGjOm7MVBfXUyUBuCh78lTXQdrbFFXh+WwkyGvvHUw/bW8QgHADwLhUFbT14aSxWUHniTgQiPtr
	tmsbrEAjg2eb0rOf+C6dAUtF+jcqqxDPtmw6UDb9aB/g9bifnXBQ9TH1FEE6xwU2JgKNBRZsyXm
	hI17L4TwOC3jV3GBr5o8XFrZkyf0MV34Oi5Nf4G7cql97uNmR2YTZqisF4OGd01OHEl5QgHxRnu
	eoDUCWfVkCHguS0QXLVrvULJuVBYqK0KtzXdV1b1bTFAKj7hBp8svLi9gGOuS8aQ2ssab9on0ew
	Oi0RBBR+C0JEDz28w==
X-Received: by 2002:a05:600c:4687:b0:49c:cfad:90c1 with SMTP id 5b1f17b1804b1-49ce5819a3amr31379485e9.14.1788326817339;
        Tue, 01 Sep 2026 22:26:57 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/27] wget: Fix CVE-2026-58471
Date: Wed,  2 Sep 2026 07:25:32 +0200
Message-ID: <e8a20e6c7f6b2fc06b1ef0fabf63ed5fc349f1ac.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244866

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58471

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wget/wget/CVE-2026-58471.patch            | 71 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 00000000000..4938e6761a5
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
index cb05ff34f89..9c7d42bd3f0 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -5,6 +5,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
+           file://CVE-2026-58471.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"

