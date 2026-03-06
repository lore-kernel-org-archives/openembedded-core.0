Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E9EF01808
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64470.1772781784754330265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jiia1mud;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso76697585e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781783; x=1773386583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYoNDMjelospYlbKoZqhkBVyOEU0ikkLfF8ZJ9JjW+U=;
        b=jiia1mud4TcSfIuBZOVjsC1Ih7pmWwkoALjlx7Y2yH5x+coagjIWVgEygSlyV1kFz3
         iGj78Sz5hDEpWm96PP6wH0+IeqfclnE/5nHNZjcCbXKDR/07Wha1/gmfev4Wdw9OtVH4
         xVCdVUglMpt/++zYMO0sd1ifg3f8/p8sofASQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781783; x=1773386583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JYoNDMjelospYlbKoZqhkBVyOEU0ikkLfF8ZJ9JjW+U=;
        b=vtXij1hqd+faDxMS93v4zahJFVgMEo0zjEWONRNsKdo/Hk+BTVVb/8xm64Df/l0APV
         GQr+DK9/T9i9jMs60A9iQ4Vs0yojFYZZ8LJjBMRuvMEdbHEdPA+99IWR8t6D3Qohh3wC
         kkwfHAm7LqHuF5EiYWmdFC9gt2HeFSpH+v/U/cbbWeE9djHYpUzwW7Bp00SLbB/jwMdi
         e+4ynSbwFElq93ieoQIiIWI8mEFpKGD+gwkXhUOCl6BzuSAyok4VJvoQxhY7DVZL3YVc
         c02ic6Tfcg5neMWDf2JsekqGoxd1HTatp2Dm/eWuQUedzbhDNmjEnu2sfnm70AoNPz3y
         Ppkw==
X-Gm-Message-State: AOJu0Yw3TUzwVVkD21qg1co72Ca7uSEqfhwnb8RjL17PvsLN6WzfXLNO
	w/ZrbWMj2aPSM19LuDpOkyV8+1v4XMb8js7wJKPpoh1foT+gGKUs0UZtELWKlPCeGhPCWrm98Ke
	hVZfU
X-Gm-Gg: ATEYQzzxWab9LKuidC5zN0YY1qMZ4iH7zpbb9HdmchsP0EJGCdxU0KU37UiajSJrP4n
	YAik3C4QKkxITJFMcd9XilUqRMo0X/f3m0HMJr4z8kAlXSW+mddS1kKYyQzir63FUzNqPI4kfit
	0bhYhzjPAQXrM3/LFqcae6pLfHAY4EGk4e+LpIrS+p7Z6DTVTZrtcCaiSGJCF+FZgA1hdcBw6Wg
	8/W8i0/9QoKLBThgVp3TYbQtSWULMa872fACo0lflRK5VIFg3fu7OiTuO4XzCuyXoP48IHgC+AJ
	o30ZSkKTAjIiZRPMtYxqMs+RgN1RwN4Z+azJdkzmuGaKPOUGUn4AyITD/5GjCr8JETlZGICSxdf
	Ob9+2wQl1K+MqsWvT2Fo2737MHX8SKjgzhTtckV91bo15iXLfrHduKkTCWw+O7iPo8ZHB58UGM+
	wXA9lb8ChZ7LQ4KG89sops0QPHChwHrz1Cp6SKy6RY/xRRif8W+DMuPrKKBcvwZj/9jz+iJa9II
	F0Q02ZUel9NQLWYvjUN+cpl/ABN
X-Received: by 2002:a05:600c:1e2a:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4852695d227mr14174485e9.25.1772781782720;
        Thu, 05 Mar 2026 23:23:02 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:02 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 07/16] zlib: Fix CVE-2026-27171
Date: Fri,  6 Mar 2026 08:22:07 +0100
Message-ID: <56fa706a39e837f5c4b9e782f215fa98ea23df12.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232545

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/madler/zlib/issues/904
[2] https://security-tracker.debian.org/tracker/CVE-2026-27171

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../zlib/zlib/CVE-2026-27171.patch            | 63 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
new file mode 100644
index 00000000000..e6a8a3eac5f
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
@@ -0,0 +1,63 @@
+From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Sun, 21 Dec 2025 18:17:56 -0800
+Subject: [PATCH] Check for negative lengths in crc32_combine functions.
+
+Though zlib.h says that len2 must be non-negative, this avoids the
+possibility of an accidental infinite loop.
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77]
+CVE: CVE-2026-27171
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ crc32.c | 4 ++++
+ zlib.h  | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crc32.c b/crc32.c
+index 6c38f5c..33d8c79 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, const unsigned char FAR *buf,
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2) {
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+diff --git a/zlib.h b/zlib.h
+index 8d4b932..8c7f8ac 100644
+--- a/zlib.h
++++ b/zlib.h
+@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2);
+    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
+    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC-32
+    check value of seq1 and seq2 concatenated, requiring only crc1, crc2, and
+-   len2. len2 must be non-negative.
++   len2. len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ /*
+ ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
+ 
+      Return the operator corresponding to length len2, to be used with
+-   crc32_combine_op(). len2 must be non-negative.
++   crc32_combine_op(). len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index ef831421216..892467a1fbd 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
+           file://CVE-2026-27171.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 

