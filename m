Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1D9CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:50:21 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.227.1759261820095405214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hq3Qg7U0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f605f22easo5824313b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759261819; x=1759866619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YosUY6TkjzDn+Mut3B/gGqY0Mf/r4W+vjLNZqkDXZ7A=;
        b=hq3Qg7U0enL+1jeOi1znKWBaCrT1pcEYwtiwLkbw7iwomMMNl8/S+ML1ydDX/whtdq
         utFrDshgufpOIofie1d/gxECXLJx8IDdHDD9SKupAUKhcK2hCMx6BX5QFghI4wiaUD0C
         05x9Ye1LjISnF3WxQvEzgvHbGcerotYVzMF77WuRrmSKCGpOWsvH2UYSqy8qQso/NIE9
         UPfdLR9RpLoPY5BboEbWA4gxMLaG9Wz6aTOSZAMwuWAb03v0peBOilED+vpBCq7ylN28
         CpZjh3h6sH1txhM6n/hPVHv7cyrTMD+YF7pee8RtBlKc108twEs8In2ua7QmiJQmacfF
         RLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759261819; x=1759866619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YosUY6TkjzDn+Mut3B/gGqY0Mf/r4W+vjLNZqkDXZ7A=;
        b=NVJUEc1SuTJmFJseyAcmIGvAmPcAXrOxLhg+ivC2geM7ebtIftNq4r8d70zAJH5STE
         RCXXtApOMIv6vKXTusWB62Z3WaJDfnYwDs4rCp6DGjLEz5CG4nXY9I+zLFLu++/6LiAv
         8fCxOt58gnP7RRB+5ZZ3tcaCT7j4UR95bixMhEX4EpQufGlJedLLMc1fDP1X+x6NQfLF
         cYJn1lRPAB5/8STEVdlLyAZb3BDpmz4cQvdk4AVL63UBUrlvrbAfT/zU7+GVPQEGPHMM
         z/KkwuqpkrxaYaZjls+rLxeTKLc1P51RPhvKdqIxJ+9i6uleEtQEEk4kzMIkYsihC5y4
         ha+A==
X-Gm-Message-State: AOJu0YxxYRsILYsGOYTv5PAyFqG4tHxkO56gsgyWDGaQkP1ggm2E7Ekv
	u1IB1B08Ch9T7YAFxaYQZ77rga5XrOYOENfaQasev5QKESVwRadLYy1gEImirk5599hB331Nvv4
	ThvyS
X-Gm-Gg: ASbGncuV7Blz0qv8h52GARK0SUzr6XEvQnww8vDAnr7MUKM7y1Ze+WYjz2iPfnEZ5Po
	TYlZzxAwl90843YC8UKhLW/jBnlJd76uClismMzEHfNmTmHe/qKuermHJJHn4Dpt/g7eSBiZZ2f
	nPJaPJ4FCxcRRKAyVU6UHlkNQFXi8ixfWJPgwP7MR/woVKXVUeuHs4isbxq80IcILWWtcu20hWc
	QBZp/SPX9OFq+OKMFfn+TyxzibxX8fkElWVn1/DWWqPZnfNqhNk1uKNLJwZgv7dHFR++mQwsde3
	NhTtOyaAotRzDbP1WegSYb4CiXgiZHHArtzDgk/j7ZqvUqCjK4E1VrAY1gSDGhaw5ZZkRCrk71M
	c3Uy80m89vX9r2LA5DL6rx972K2SG1Lpr05d6Z2iCexqoQd0J
X-Google-Smtp-Source: AGHT+IGCNlTwqYoSufpS/Hm/P/J7tRbn4eNEMEMx+UXTJVdm0szQxe/M2468lN+lpDb/oTaOy5GbhQ==
X-Received: by 2002:a05:6a00:848:b0:77f:605f:20e1 with SMTP id d2e1a72fcca58-78af422e910mr688324b3a.27.1759261819206;
        Tue, 30 Sep 2025 12:50:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm14411202b3a.8.2025.09.30.12.50.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:50:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] grub2: fix CVE-2024-56738
Date: Tue, 30 Sep 2025 12:50:04 -0700
Message-ID: <d6572d29892b7da593acafe3af68cf98230acf04.1759260542.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759260542.git.steve@sakoman.com>
References: <cover.1759260542.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 19:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224195

From: Yogita Urade <yogita.urade@windriver.com>

Backport an algorithmic change to grub_crypto_memcmp() so that it
completes in constant time and thus isn't susceptible to side-channel
attacks.

reference:
https://git.openembedded.org/openembedded-core/commit/?id=30a1cc225a2bd5d044bf608d863a67df3f9c03be

Upstream patch:
https://cgit.git.savannah.gnu.org/cgit/grub.git/commit/?id=0739d24cd1648531d0708d1079ff6bbfa6140268

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-56738.patch           | 75 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
new file mode 100644
index 0000000000..1212b2d3e5
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
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ grub-core/lib/crypto.c | 23 ++++++++++++++++-------
+ include/grub/crypto.h  |  2 +-
+ 2 files changed, 17 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
+index ca334d5..1bfa922 100644
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
+index 21cd1f7..432912b 100644
+--- a/include/grub/crypto.h
++++ b/include/grub/crypto.h
+@@ -393,7 +393,7 @@ grub_crypto_pbkdf2 (const struct gcry_md_spec *md,
+		    grub_uint8_t *DK, grub_size_t dkLen);
+
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n);
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len);
+
+ int
+ grub_password_get (char buf[], unsigned buf_size);
+--
+2.40.0
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index cb61080aeb..1b019752b7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -59,6 +59,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0678_CVE-2025-1125.patch \
            file://CVE-2025-0690.patch \
            file://CVE-2025-1118.patch \
+           file://CVE-2024-56738.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.43.0


