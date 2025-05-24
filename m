Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96923C5AD49
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:37:04 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.7118.1748093820636649277
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L4elIUfk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso650734a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093820; x=1748698620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQXgwg4rXEr+0CASCSmyaZZXVGGyPjq0x1vt5B13Gbc=;
        b=L4elIUfk2ybOQyo94ssfdwcT3cA+IQ77zmEHZXNfgBEKcBTtOcVVfzDj9EPJxuSQ5r
         3YORt7ExiRIgKvFJ3UpRGeHlCiHlwy3myyoBE9bET5HppLLZqbPPhqGQD7suTr9gupqT
         W3YJSS2xhw0MJDLQDe3Tfnb2Ynz+oNG8EwbTdT4mzcUDwRvBWqeHhAsNgkfUKIXV0uhW
         7eP9NvXSZ0D8QeP1KYXBnkNHaedh8WiwLR4T2XzLMq99RHln/arcgShACuXCxSf30JGY
         BGitsZ7bC+rg7xKrAfyrij9DSpy6TVPd2v1OuAwRF2VTu2UMWJVx12xCX+G/SFgS52F9
         aDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093820; x=1748698620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQXgwg4rXEr+0CASCSmyaZZXVGGyPjq0x1vt5B13Gbc=;
        b=eorAspsaNDi9bLSpCg8wB+su9shBa8Sg20u16VFtagKme4maSXOcvLYCV7p8TetnwW
         rqdBROpec7tSaKiGPuX0HsunDRCTivQ9XNJx42CJuZl0Kh2H/CXpVTU0WXu13JjBZgxu
         FV5FuFM6FXV71Z08L8BX/pzz41+dt7IEQzGX+0wGQ8Hsn2MfR04EsskSqR+/KuUzv+BK
         DYG+Dur29gg5n5/5FS5gy7Y0bGZR8V2WySuNpzQEU1yf2q7V8RC+ARHlm/6U0hJNq9ix
         1+5gMIow4+DIKBqLtc+p+LIVvtcNUXgg/FWrfUnb6g4NlS8Oghy5Oxe516fYN+uF9pA/
         4gFA==
X-Gm-Message-State: AOJu0YyMwaCx8P904D13rHj9quEJVej/w3s9+/4WhRb2z2qQS+nS5AY2
	U6saYg9/HkdMG3sqIAe3Gr08sVq7mSeLNWOUGBTmeoPISTR+wUkIHVXn2dMfSRVu2btwz2yp6Je
	k0Ai8
X-Gm-Gg: ASbGncuUs/7FUe27qHr4Kf0n/9V5iwc+qKYH6QGyuCjEkqAIQwZ7XClEyAg3G977obl
	Sovw74IbO6IEAMpHpH6MNn3YObkgb042QsVKixPQzSIdqJc4QzcGYg4UH6FJwYDxsLR3s4bqALN
	bgr0MncdE2tiD1J/2iTwzZ033HgMq2ESzGn2DITWZ/iyq0B6YRAxzf82S+jqnlV0+PYjxS1sM8j
	cfFpfNl62nq0zh3PlPSgrb8QfCoC72mf9UAOFvT4BCdAZ181TzUgW0yCnCD2hZ5ggBDzaQ5RCR9
	KOhTgcIJDuD+bW5V/b8zJrD9JKNYtS3ClHsvC1uP0pY=
X-Google-Smtp-Source: AGHT+IH85AZQi1hFpp8A0bKFSf/tJGYd5KPE65eXt3uc+k+ueiE9u40S6ZQB1FWQ+n23g7Suk39jEw==
X-Received: by 2002:a17:90b:17cb:b0:309:f5c6:4c5c with SMTP id 98e67ed59e1d1-31111184fdfmr4209577a91.25.1748093819843;
        Sat, 24 May 2025 06:36:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/12] gcc: AArch64 - Fix strict-align cpymem/setmem
Date: Sat, 24 May 2025 06:36:28 -0700
Message-ID: <a99a65632116955dc69809a14bf536b22582de72.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217237

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
Clean up the condition when to use MOPS. (PR103100)

The original patch for GCC 12 removed MOPS & SIMD conditionals for setmem and
cpymem expansions in aarch64.md file. However, this version for GCC 11 does not
backport the SIMD & MOPS-related changes and retains the conditions in aarch64.md
file to preserve correctness and compatibility with the GCC 11 backend.

All changes and outputs have been verified by the author.

Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
 ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
index f17ec9da5c..1e8371b2bd 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
            file://0029-Fix-install-path-of-linux64.h.patch \
            file://0030-rust-recursion-limit.patch \
            file://0031-gcc-sanitizers-fix.patch \
+           file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
new file mode 100644
index 0000000000..4c2d827799
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
@@ -0,0 +1,45 @@
+gcc: AArch64 - Fix strict-align cpymem/setmem
+
+The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
+Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
+Clean up the condition when to use MOPS.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
+
+Signed-off-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
+---
+--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -0700
++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -0700
+@@ -23621,14 +23621,15 @@
+   int mode_bits;
+   rtx dst = operands[0];
+   rtx src = operands[1];
++  unsigned align = UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode = BLKmode;
+ 
+   /* Only expand fixed-size copies.  */
+-  if (!CONST_INT_P (operands[2]))
++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16))
+     return false;
+ 
+-  unsigned HOST_WIDE_INT size = INTVAL (operands[2]);
++  unsigned HOST_WIDE_INT size = UINTVAL (operands[2]);
+ 
+   /* Inline up to 256 bytes when optimizing for speed.  */
+   unsigned HOST_WIDE_INT max_copy_size = 256;
+@@ -23750,11 +23751,12 @@
+   unsigned HOST_WIDE_INT len;
+   rtx dst = operands[0];
+   rtx val = operands[2], src;
++  unsigned align = UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode = BLKmode, next_mode;
+ 
+   /* We can't do anything smart if the amount to copy is not constant.  */
+-  if (!CONST_INT_P (operands[1]))
++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16))
+     return false;
+ 
+   bool speed_p = !optimize_function_for_size_p (cfun);
-- 
2.43.0


