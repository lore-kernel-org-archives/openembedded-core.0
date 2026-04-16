Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F9AF88078
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7584.1776322117780781017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=00a4kNBI;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b0046078so73607735e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322116; x=1776926916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXzXM3DbToyzC5TpDNpfUuaOMlAQtMvX2S9gnLe3IMg=;
        b=00a4kNBITFwpvuGWhBo0sQONuDi0GUMqZn2jvA4g72n6V7Yw6T8W+wHc4+EV7Giu1+
         kfiHmuLF1uceYrySjcWUhpcBWUdECz6RIluOhnXepJ/nvr30E8LN0AOfYUYjqfoMOC1L
         kD8UzFqpM7Xs7vCjq7hXQWtkggAXiOd2xrYqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322116; x=1776926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WXzXM3DbToyzC5TpDNpfUuaOMlAQtMvX2S9gnLe3IMg=;
        b=P0CVAuoHtKnejXcVtwaZSwyQiobZm9Ymedq2iwOXVTkvjg9KO9Gzz9osrFTozonEw7
         rSlY7gF54s7rvM/bAZ3XyerNzcFJmZhJQRFPX3qEFMzYCVugQ4ZcNysD218psFK14wzD
         2Aby7TslyPvRc12DJHAgvXrNtSuUDx7mu2mwyhOoOTqh4zBfBwstzNFX/dsz+C+pZNBH
         1p4Ws1MscWIEfLATtsh93Ppo46f/z6QWDW9JVagJ6r5ddSbSSZoaoBVTs2x5VKr5nj3C
         HLfVAMl/yU1Cxv9wwAiORUHz08UBbjIokx135SFpapIvRFGO/2SF6TdqDVw6dyas5o0h
         GVfQ==
X-Gm-Message-State: AOJu0YxE81L9HhtsIvQAcXt6V5OR6bE9IcjbqO8d7dhMJ5oPDg//mJkR
	GnChakD4OWE/vs/FUVk/lCELpVVYJJBqtds6cqxwmV7TmFi0oQXkq0Z1SaOE2dnjz0D/s9CrRke
	EIHAxnmb359CB
X-Gm-Gg: AeBDietrCfl/Xw+vSGcB8WLwDqZMqNxUJ88n8w6qGTg+laD3+1g1rAPxowHcSIODOeI
	t4Fl9ZreXx0bn2xG6kqVwWbUE0WL1rMEyfmMIzcXPEm/XWydBZqucAbFfaqyPw0uJXZ73UBwKkE
	bPL/ArcBuSo95XFP4KOiPxmqDq4P/AwfjMS9hggx5poHTgfjA1NPY5HIEtTl4Q4Dgc5AjDHwwG4
	JVElW6NRrcBbYT+IfYimWuTHGaA03yG/FB3l4FhV8Nkpa8gHoDMmN+LBWaNpnzqhBrMcU1bUzSy
	Jz51MGkCAniFhpvjwC0sSw3KVWB/NhE9xmKye3dHMScP4tFPJJaDdo+2tbH/PKtFmf3x+m+IX03
	tdJ4MsTQuqaJ4jHRdPQ5lKsQvy6vnX8WAim6fZG8RqSf1490/CkyuS2XjDk+rWQUYB9MUrcFhbh
	HfNbFoDtMBQycy6PfxWhG7Jbsg0apoAKjskNiM/3FxwTVqtItl7h+VJmtA7y/0y6AxM10h7b6Fo
	73h6HphvfXbbDIbAEg3sNtfQGhXpCBdZ/PK4w==
X-Received: by 2002:a05:600c:8709:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-488d66580e3mr334531945e9.0.1776322115755;
        Wed, 15 Apr 2026 23:48:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 27/47] libxcrypt: Fix build wrt C23 support
Date: Thu, 16 Apr 2026 08:47:28 +0200
Message-ID: <e99b48a8e6b8a8ebc0b826861f4274c0cc44103c.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235369

From: Khem Raj <raj.khem@gmail.com>

latest glibc has better C23 support and exposes this problem

Fixes following errors seen in nativesdk-libxcrypt

| ../sources/libxcrypt-4.5.2/lib/crypt-sm3-yescrypt.c:139:9: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
|   139 |   char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
|       |         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| 6 errors generated.

Compared to wrynose remove lib/crypt-sm3-yescrypt.c change, because
the file doesn't exist in the version used in whinlatter, it was failing
only in lib/crypt-gost-yescrypt.c

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a666b8e71ecda97db58c90d5af137671f9823f38)
[YC: fixed patch format]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch | 29 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch

diff --git a/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch b/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
new file mode 100644
index 00000000000..75749c054a2
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
@@ -0,0 +1,29 @@
+From 174c24d6e87aeae631bc0a7bb1ba983cf8def4de Mon Sep 17 00:00:00 2001
+From: Stanislav Zidek <szidek@redhat.com>
+Date: Wed, 10 Dec 2025 14:03:54 +0100
+Subject: [PATCH] fix -Werror=discarded-qualifiers
+
+On Fedora rawhide (to be Fedora 44), gcc became more strict
+wrt. const-ness.
+
+Upstream-Status: Backport [https://github.com/besser82/libxcrypt/pull/220 without lib/crypt-sm3-yescrypt.c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ lib/crypt-gost-yescrypt.c | 2 +-
+ lib/crypt-sm3-yescrypt.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/crypt-gost-yescrypt.c b/lib/crypt-gost-yescrypt.c
+index 190ae94b..e9dc7e80 100644
+--- a/lib/crypt-gost-yescrypt.c
++++ b/lib/crypt-gost-yescrypt.c
+@@ -131,7 +131,7 @@ crypt_gost_yescrypt_rn (const char *phrase, size_t phr_size,
+   intbuf->outbuf[1] = 'g';
+ 
+   /* extract yescrypt output from "$y$param$salt$output" */
+-  char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
++  char *hptr = strchr ((char *) intbuf->retval + 3, '$');
+   if (!hptr)
+     {
+       errno = EINVAL;
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 1292f4288bc..d84cbc9db39 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
+           file://174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch \
            "
 SRCREV = "55ea777e8d567e5e86ffac917c28815ac54cc341"
 SRCBRANCH ?= "master"

