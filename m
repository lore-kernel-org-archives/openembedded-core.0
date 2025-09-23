Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3325CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 14:39:03 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.18537.1758638340511323892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t5CAkhhw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b5515eaefceso4273181a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758638340; x=1759243140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzLNJYYNFz5HEfRk8MuC3Gu4/mXLt44g6PAbsq6BJuQ=;
        b=t5CAkhhw7y5bfprzz6uFe556p36c7SDSqswceU2aqm0K+Xs3SFhGlKelfdYg6SvVlR
         wZbD1KMR+LFssSR0aSbzMduyGob/DOJ48CxViVQ0xoNpPxBTfIRlmtwdnnC2KrQmWFF+
         rGlkro0I7wAOctPGUklHac5sJXnNDREUv5fOjTVXykNwT6AhoaKAefDh4r0pMEA3CYBj
         sHjt1rIcnwp9lUfyl36sM7dhNBn3Oxr5ifrCZEfB+zdfp7y43ZdbzfriwILeCvgz9RGg
         rsXx5Ec74Ff6FIM20vkCoYLZ4KmvO4UK5UXoN+wyXe5jF+HKaiYqOEQKiI7eKINrqRp8
         bEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638340; x=1759243140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzLNJYYNFz5HEfRk8MuC3Gu4/mXLt44g6PAbsq6BJuQ=;
        b=KcbfMUHwHKLhsoPKRLcTbnyGagVeDD5FZlCOYTv8eJKDuwAP6mnDOigYJP9vf5H1kM
         IwhEH/207c6SDIgBbwtPlCY8fm15jgAAnJ4DjEooZRlMfOdVnTzreK4XqYADFiOKfd5u
         X2uUvuYkc0raLgfTUGUKbn33Pd7Zb2OfLcsHaGJrjPKArUlzITUuacBr8BfnCIJy9ZyD
         WjU0A59I008KFpd1IOnJJjW4dbU1vhFqy2CE5jLLwv4jQ5naOegp4cvbN9AZ7pmnYl8v
         gI0wz8I+byOBZKm4rEIMbhpCrywgqw+AdwjN8AP2/jXCXIzTD42LgRNTUQ3T4K39Y2EF
         bceA==
X-Gm-Message-State: AOJu0YxLdRgg1wK2frZrsbCzvMVLNrvmEBtp820JdfsBMtRC3mXy5oqA
	oZ8XPEGqC6qAk6PdWm4cDMpnR8jzmaovjqD9ZaVaUPUthFYY1l8Yj1dgj84UK3JEAU3iIW4Isg1
	htqyS9pI=
X-Gm-Gg: ASbGncs2j/9FM/gxrXOVTk7stDS6ry9F37FZcaQ3EV4UpchcOBtL+Ar4a0Xd2XW12Yi
	Z3DT1KG6STgV488F+7rpnMLiHSry3OASPXkXORscknhKqHv++E4RQg9xmhRRBBFKkn03GNZMPTk
	U7UT5bNYegmsJRwYTdZUBR+K+wzpNSG7xZeuF08Gcs1U0TVIL+G0EnPD7NirLCxApPA5TeP2lW4
	PA8XAezs8SRq3GPp0gS9/+2RjhlLluojdHfGyTK50Guh2/EauK6s5yW3VTA4TbFJG+5glNyBvVg
	n448CVnfQTNmbRCUw/3qHXfXal+jKb9xv+/86SanOcdI5npO97rnjqCPnomgzIBbRTslt1wBdsp
	ZyvktpEafyq4C
X-Google-Smtp-Source: AGHT+IE0U+bLBR0guIbWjfgBCXThz5l3RuZIt5+T53B8fBbnbTuQla9DN+6bF4pzzcfBLcheMnGezg==
X-Received: by 2002:a17:90b:5446:b0:32e:358d:666f with SMTP id 98e67ed59e1d1-332a9544cbbmr3592078a91.10.1758638339532;
        Tue, 23 Sep 2025 07:38:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3f58:7e15:309f:29c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55100df86bsm13428368a12.23.2025.09.23.07.38.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:38:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 1/7] grub2: fix CVE-2024-56738
Date: Tue, 23 Sep 2025 07:38:36 -0700
Message-ID: <f346b4e49a20023028238a810e0597b1c9f38d62.1758638188.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758638188.git.steve@sakoman.com>
References: <cover.1758638188.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 14:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223884

From: Ross Burton <ross.burton@arm.com>

Backport an algorithmic change to grub_crypto_memcmp() so that it
completes in constant time and thus isn't susceptible to side-channel
attacks.

(From OE-Core rev: 30a1cc225a2bd5d044bf608d863a67df3f9c03be)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-56738.patch           | 74 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
new file mode 100644
index 0000000000..f6a3641eb1
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
@@ -0,0 +1,74 @@
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
+		    grub_uint8_t *DK, grub_size_t dkLen);
+
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n);
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len);
+
+ int
+ grub_password_get (char buf[], unsigned buf_size);
+--
+2.43.0
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1fe39a59d2..db053b27b0 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -36,6 +36,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45778_CVE-2024-45779.patch \
            file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
            file://CVE-2025-0678_CVE-2025-1125.patch \
+           file://CVE-2024-56738.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


