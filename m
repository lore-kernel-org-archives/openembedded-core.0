Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9678FEED608
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:22:05 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.23351.1694791320125038979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WfJfh/Nv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-57756115f08so1842247a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694791319; x=1695396119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWdJYThNE1OwCqIhPhlIROMZpKlJ06/oS2LXC0unu0s=;
        b=WfJfh/Nv6XOZSBC5Cu8teNT3DcqgoOD9fwNqHxq4PPUVd7SCHnh8wwCg5kuD5558aB
         pkEz31SH9LvtUHEKJKK+SG7Et0v7hwTlUOUEv1X1B5TFUJ9q8uyoTWyJ46ZsGweVj9Jp
         XVA1tiDFvihBDE6v6CgDL8EcwxpNCTYQlUt9uXaFkjqaY0RKD1s5egwDZAZF++VczCNU
         unZTEOWJboC7WMidO0xd1DWYXKOuiXgcRfcl5VMbHBNDrSLb12MbwnDLEnFkPl9bZOZa
         Jqf19mrNxMLXXtoR8oEmBnMGee7NThSZv+AH2PK7nBlljz80zX1s5FD9x1u5RLiQJQhC
         D6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791319; x=1695396119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWdJYThNE1OwCqIhPhlIROMZpKlJ06/oS2LXC0unu0s=;
        b=oBBM1Wkd6/OPL04qFrv4vm7iEk2zAt6NDQ06HiWqFhQCkvy4LJcWD32BF2pAwJIHXS
         2CgHdBARvGK18m3TuONSKkX8XB/2XoEBCS9lYOpVsqUZLa6ySqVTQ7eGP1pMYh0QYxK4
         DrSuJCdfXI7cf8v42UBQRa1f91w2pB+/t8Fq+U/w9K1BzJk3nXSn6A2lWFHxRibFx+fs
         clgMTD/wzpkbKHxiIM1YFPVhWIXczEgWxmqfz+Gy40irmqFk5ryX6bWPa5CeFca/uGUx
         ESz4WtDWi5EQmMEPwsBUtLYjYjHZDkzSuu09QdCpK0nLk0eQLFRJnjz3yjS+EMicijY4
         lF7g==
X-Gm-Message-State: AOJu0YzPP5A0sNmx9yu+xDEJVfLo/Rq3v9F3PAc2bbdCPQyuQTKeoBWb
	JgKBV1r5D1dVTGmztToogNwIXLZiA181MuShA+E=
X-Google-Smtp-Source: AGHT+IEH7RmzFVqzQ3I1/2tMVBcNQE+5ul1sQ2Aw3RO2+g/zxQB/OR0UhsO7KOknHzQRvRGqEG+sUA==
X-Received: by 2002:a17:90a:bf16:b0:262:d6cb:3567 with SMTP id c22-20020a17090abf1600b00262d6cb3567mr1878142pjs.26.1694791318956;
        Fri, 15 Sep 2023 08:21:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090ae29500b002749ae93778sm1375398pjz.23.2023.09.15.08.21.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:21:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 1/8] dropbear: fix CVE-2023-36328
Date: Fri, 15 Sep 2023 05:21:39 -1000
Message-Id: <e2fe2c2066b066b1561eaba7bd7f27d4079c3cd6.1694790288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694790288.git.steve@sakoman.com>
References: <cover.1694790288.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187669

From: Yogita Urade <yogita.urade@windriver.com>

Integer Overflow vulnerability in mp_grow in libtom libtommath before
commit beba892bc0d4e4ded4d667ab1d2a94f4d75109a9, allows attackers to
execute arbitrary code and cause a denial of service (DoS).

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-36328
https://github.com/libtom/libtommath/pull/546

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dropbear/dropbear/CVE-2023-36328.patch    | 144 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch b/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
new file mode 100644
index 0000000000..932503e507
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
@@ -0,0 +1,144 @@
+From beba892bc0d4e4ded4d667ab1d2a94f4d75109a9 Mon Sep 17 00:00:00 2001
+From: czurnieden <czurnieden@gmx.de>
+Date: Fri, 8 Sep 2023 05:01:00 +0000
+Subject: [PATCH] Fix possible integer overflow
+
+CVE: CVE-2023-36328
+
+Upstream-Status: Backport [https://github.com/libtom/libtommath/commit/beba892bc0d4e4ded4d667ab1d2a94f4d75109a9]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libtommath/bn_mp_2expt.c                | 4 ++++
+ libtommath/bn_mp_grow.c                 | 4 ++++
+ libtommath/bn_mp_init_size.c            | 5 +++++
+ libtommath/bn_mp_mul_2d.c               | 4 ++++
+ libtommath/bn_s_mp_mul_digs.c           | 4 ++++
+ libtommath/bn_s_mp_mul_digs_fast.c      | 4 ++++
+ libtommath/bn_s_mp_mul_high_digs.c      | 4 ++++
+ libtommath/bn_s_mp_mul_high_digs_fast.c | 4 ++++
+ 8 files changed, 33 insertions(+)
+
+diff --git a/libtommath/bn_mp_2expt.c b/libtommath/bn_mp_2expt.c
+index 0ae3df1..ca6fbc3 100644
+--- a/libtommath/bn_mp_2expt.c
++++ b/libtommath/bn_mp_2expt.c
+@@ -12,6 +12,10 @@ mp_err mp_2expt(mp_int *a, int b)
+ {
+    mp_err    err;
+
++   if (b < 0) {
++      return MP_VAL;
++   }
++
+    /* zero a as per default */
+    mp_zero(a);
+
+diff --git a/libtommath/bn_mp_grow.c b/libtommath/bn_mp_grow.c
+index 9e904c5..b9321f7 100644
+--- a/libtommath/bn_mp_grow.c
++++ b/libtommath/bn_mp_grow.c
+@@ -9,6 +9,10 @@ mp_err mp_grow(mp_int *a, int size)
+    int     i;
+    mp_digit *tmp;
+
++   if (size < 0) {
++      return MP_VAL;
++   }
++
+    /* if the alloc size is smaller alloc more ram */
+    if (a->alloc < size) {
+       /* reallocate the array a->dp
+diff --git a/libtommath/bn_mp_init_size.c b/libtommath/bn_mp_init_size.c
+index d622687..5fefa96 100644
+--- a/libtommath/bn_mp_init_size.c
++++ b/libtommath/bn_mp_init_size.c
+@@ -6,6 +6,11 @@
+ /* init an mp_init for a given size */
+ mp_err mp_init_size(mp_int *a, int size)
+ {
++
++   if (size < 0) {
++      return MP_VAL;
++   }
++
+    size = MP_MAX(MP_MIN_PREC, size);
+
+    /* alloc mem */
+diff --git a/libtommath/bn_mp_mul_2d.c b/libtommath/bn_mp_mul_2d.c
+index 87354de..2744163 100644
+--- a/libtommath/bn_mp_mul_2d.c
++++ b/libtommath/bn_mp_mul_2d.c
+@@ -9,6 +9,10 @@ mp_err mp_mul_2d(const mp_int *a, int b, mp_int *c)
+    mp_digit d;
+    mp_err   err;
+
++   if (b < 0) {
++      return MP_VAL;
++   }
++
+    /* copy */
+    if (a != c) {
+       if ((err = mp_copy(a, c)) != MP_OKAY) {
+diff --git a/libtommath/bn_s_mp_mul_digs.c b/libtommath/bn_s_mp_mul_digs.c
+index 64509d4..2d2f5b0 100644
+--- a/libtommath/bn_s_mp_mul_digs.c
++++ b/libtommath/bn_s_mp_mul_digs.c
+@@ -16,6 +16,10 @@ mp_err s_mp_mul_digs(const mp_int *a, const mp_int *b, mp_int *c, int digs)
+    mp_word r;
+    mp_digit tmpx, *tmpt, *tmpy;
+
++   if (digs < 0) {
++      return MP_VAL;
++   }
++
+    /* can we use the fast multiplier? */
+    if ((digs < MP_WARRAY) &&
+        (MP_MIN(a->used, b->used) < MP_MAXFAST)) {
+diff --git a/libtommath/bn_s_mp_mul_digs_fast.c b/libtommath/bn_s_mp_mul_digs_fast.c
+index b2a287b..d6dd3cc 100644
+--- a/libtommath/bn_s_mp_mul_digs_fast.c
++++ b/libtommath/bn_s_mp_mul_digs_fast.c
+@@ -26,6 +26,10 @@ mp_err s_mp_mul_digs_fast(const mp_int *a, const mp_int *b, mp_int *c, int digs)
+    mp_digit W[MP_WARRAY];
+    mp_word  _W;
+
++   if (digs < 0) {
++      return MP_VAL;
++   }
++
+    /* grow the destination as required */
+    if (c->alloc < digs) {
+       if ((err = mp_grow(c, digs)) != MP_OKAY) {
+diff --git a/libtommath/bn_s_mp_mul_high_digs.c b/libtommath/bn_s_mp_mul_high_digs.c
+index 2bb2a50..860ebcb 100644
+--- a/libtommath/bn_s_mp_mul_high_digs.c
++++ b/libtommath/bn_s_mp_mul_high_digs.c
+@@ -15,6 +15,10 @@ mp_err s_mp_mul_high_digs(const mp_int *a, const mp_int *b, mp_int *c, int digs)
+    mp_word  r;
+    mp_digit tmpx, *tmpt, *tmpy;
+
++   if (digs < 0) {
++      return MP_VAL;
++   }
++
+    /* can we use the fast multiplier? */
+    if (MP_HAS(S_MP_MUL_HIGH_DIGS_FAST)
+        && ((a->used + b->used + 1) < MP_WARRAY)
+diff --git a/libtommath/bn_s_mp_mul_high_digs_fast.c b/libtommath/bn_s_mp_mul_high_digs_fast.c
+index a2c4fb6..afe3e4b 100644
+--- a/libtommath/bn_s_mp_mul_high_digs_fast.c
++++ b/libtommath/bn_s_mp_mul_high_digs_fast.c
+@@ -19,6 +19,10 @@ mp_err s_mp_mul_high_digs_fast(const mp_int *a, const mp_int *b, mp_int *c, int
+    mp_digit W[MP_WARRAY];
+    mp_word  _W;
+
++   if (digs < 0) {
++      return MP_VAL;
++   }
++
+    /* grow the destination as required */
+    pa = a->used + b->used;
+    if (c->alloc < pa) {
+--
+2.35.5
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 0c7a8f4caa..12ac732f58 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
+           file://CVE-2023-36328.patch \
            "
 
 SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"
-- 
2.34.1


