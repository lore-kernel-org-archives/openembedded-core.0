Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CEACAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:05:15 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.33513.1758139509234453063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Nrd+fl5E;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32e34f4735eso144896a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758139508; x=1758744308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLSLLryCTuAr5uHsxBKtKGM48mvoRU7TXVyYk9iBWgg=;
        b=Nrd+fl5EKrCq9VYCJM45pXMUacljjbetRqLH1OlNLuJeBfIkkhgUMPrPAqvVXF4t8D
         J74rQPtWUYVKA45gz0BN3i+bNv4WpP6oS4kQKGtVAeTnBmmB58WpycwyvjtrGormZ8Jq
         C3kZmXFCzwTFLH/jkFEy8uHg76yoMuZF5xb9YYIGw3KrJtXUGkAZe+nQeePF95kUt2Sp
         T7aoSGS8o/KntCOH5MIZ+4kYTKCyRNCv5R6KofV67K+P+uoew1dTr16gprAvb8y3fXXt
         YC0KlU+MpfLdJO9dpKiKt2dlUIMn7kRHQH5vaS0f2hR/AFD+q0AY+U+yLyklRcbnQjvE
         7OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139508; x=1758744308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLSLLryCTuAr5uHsxBKtKGM48mvoRU7TXVyYk9iBWgg=;
        b=iHwgHKG7kuGjxAKqCp2FXI8iCCIjzYNordI5jfwQH0UqcrzxLK6PFeNfFPrl17C57p
         eeaLwwwk/Dci3T1f6forTG5pWYpLzdyuvVIy6CiGgX+ckz8JN0JlmREfDmdaumpsQUqy
         FjwVME4IEgV/3ghACHQsD7tSzvtfE3sT7mCiTrfALO5fZgz6ZuotdNg+4N4TciReiV1U
         /6YFGYl1hk6roW8B75bJUNTyDVLGTG/4yZhnfC5MvEot4yydWugy01FYua+NOUKx8rKw
         A3tYsrJvJBauQqs9phcARcg2H++mA4bcduaPfwEgOcP4AUH4MAdTvOMybY3nf0pq4gdh
         WTGw==
X-Gm-Message-State: AOJu0Yy4mwhMPwBhO0Zh0V2qXWApPbx4ylvq+IIzznASdi7AYIcQB1Ui
	twEoUZHZOxYxO6N+FML7omPc6eHmJtY0gtx1VOeD2KU0kaJE53KrGADbrvAFNfyys8iCG+Tq1ls
	rou1N
X-Gm-Gg: ASbGncujlRV+Q0LkVAvy1aVHjFhbWODoFc+oOHiQD72//COQY6s5/l+aiCmtRBIuV6Q
	3gKbfgt/3kmTBV8XXcrzfbFOr05oIrq53SKMy5NOtZileltGayWH7JwwApP6wP9UDL8TTvK81Tw
	G0zh7U22U0a2+nZonA2jntEnnLCmBYzLJvSs7qlQdl6Sq8G/2vYd15iVqUEwqB5eVwuxGCngmeq
	yo6FpiqedBrUHGjPZ0gb8eiWj+LdenHP64d1u2mf5lPqGb+FjMzajbxgMHUEHYE/SbUwtsUkIYU
	oLpckjN7Q4JLIV6RWGC0qxkNxdlj7am+xlqWcXOQ04WVHUf6GpdQ8FGiRQXonAyAaQBwbgOKyBB
	YK9ui+RzqV60fGb+ss7wSZeqK/gElzVdN
X-Google-Smtp-Source: AGHT+IEODIL5Cs2zmS8orVJ34lKZU4YAA3h/b1TYKC8QuWQhTdxNfYT2LL1LQz8Pft5pvixAVszxpw==
X-Received: by 2002:a17:90b:4c12:b0:32e:36f4:6fdc with SMTP id 98e67ed59e1d1-32ee3ec6268mr4136883a91.4.1758139508391;
        Wed, 17 Sep 2025 13:05:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ed6:a4e8:9109:79e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm247452b3a.10.2025.09.17.13.05.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:05:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/8] grub2: fix CVE-2024-56738
Date: Wed, 17 Sep 2025 13:04:39 -0700
Message-ID: <319210be147ec57518c237cb705857aeda9943e6.1758139278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758139278.git.steve@sakoman.com>
References: <cover.1758139278.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223617

From: Ross Burton <ross.burton@arm.com>

Backport an algorithmic change to grub_crypto_memcmp() so that it
completes in constant time and thus isn't susceptible to side-channel
attacks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30a1cc225a2bd5d044bf608d863a67df3f9c03be)
Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


