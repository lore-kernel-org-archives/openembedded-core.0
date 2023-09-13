Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3DFEDEC61
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:30:56 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.13475.1694615454111822531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gN9r27rR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68c576d35feso6597852b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615453; x=1695220253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uZq1pKDa3gGDvu5hyo7J/Z2WNXpAlWKaT2c23OD4ws=;
        b=gN9r27rRmApd1oaGzQzgla3Fp7kLQZvPUtaZv3sNW8CNg5P1rcobdsl0WCt13SFPgd
         GWZdrty7WyRanv528owU2O6BS6o2OzcXvlwB7He+Z+PtfFq9yEF1TfDrxiGXXzu2ndFg
         Hp0iZXrkOij8LCmESUZFEvQFNGiLA31NejvtIygCdODTFSCc9FpVp0xTsQeMNVd30IWp
         mU4IoF1TnRBc5EdNHZb/kw0FFePs7FWCRetx6ie5SywpFkoSTJFgD8ynzzB7gS2n2wGe
         bSKzeoCRjnjevt+NZakPm/pvH5XMXku3nOwbENqcSDiOFKG44PiFiXyKL/r51XNMU6Rc
         z6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615453; x=1695220253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uZq1pKDa3gGDvu5hyo7J/Z2WNXpAlWKaT2c23OD4ws=;
        b=PsYq8Dpc638u7JCoSFqn4Hii80c6Vw9zxWHRvmAHLwVZVZ8xRiKSvjkBohRM02u43d
         gwBHJA1beu99rr9kkTt9jSvRXdA69WsSQP8+ZuaGFUKf1l/KUm3e88IXb6MrHy0hRt3k
         o2xjrtnorl9sopZbPbGIQ15YRHEBapiKg1dIhLkrNK468sDTzTofLhTwR8QjXaMkgvdi
         ayiuwzTzA5FXXBHjhV2Zx83FRSSuwA6l94RGu5vWNuSizR9uzk0HHRPpSBki1/H0EVSq
         DKpHGJErcMDGAoHaPFwijJBbBaOBmYtd5PAoi/C5Glj1xZ506N7GIaGEmVoo714Lt8Dx
         ek9w==
X-Gm-Message-State: AOJu0Yy9rxEBMZ8fivrvShru2LM2VHrArBCDVuYLthvrv+ZXuaLDxyml
	5xZBIWRDx7bT13CKyB2iVj6hyGcBXUFuH/B8twc=
X-Google-Smtp-Source: AGHT+IHsX+UCMy8uNAdJhybZUBCzQfdkRvK0f5r7UtGmEdgc54V4tknGUKCGUKq3So3nUr6K8SBpaA==
X-Received: by 2002:a05:6a20:3d21:b0:137:d14d:79ea with SMTP id y33-20020a056a203d2100b00137d14d79eamr2839818pzi.25.1694615452948;
        Wed, 13 Sep 2023 07:30:52 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.30.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:30:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] dropbear: fix CVE-2023-36328
Date: Wed, 13 Sep 2023 04:30:34 -1000
Message-Id: <38709b0d35e7bd6760285bfa926dc85985c5cdcd.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694613269.git.steve@sakoman.com>
References: <cover.1694613269.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187597

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
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2023-36328.patch    | 144 ++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index f3f085b616..e61930f7db 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -29,6 +29,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
 	   file://CVE-2021-36369.patch \
+	   file://CVE-2023-36328.patch \
 	   "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch b/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
new file mode 100644
index 0000000000..4d8c40f70b
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
@@ -0,0 +1,144 @@
+From beba892bc0d4e4ded4d667ab1d2a94f4d75109a9 Mon Sep 17 00:00:00 2001
+From: czurnieden <czurnieden@gmx.de>
+Date: Wed, 6 Sep 2023 10:48:58 +0000
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
+index 0ae3df1..7d4d884 100644
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
+index 9e904c5..e7b186c 100644
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
+index 2bb2a50..c9dd355 100644
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
+index a2c4fb6..4ce7f59 100644
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
-- 
2.34.1


