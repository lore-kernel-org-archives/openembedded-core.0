Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B8DC54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.4736.1747808404314526586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EfefpGVd;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7426c44e014so6423930b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808403; x=1748413203; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRFphNC4JnJeMk+++9j1BwqaZsjiHNtrYKlDg4kSkHs=;
        b=EfefpGVdd/+gJbYcZsEBmBu8yu02JiTOiQ6C7KcaOzwbShCOobqOK4W4f7VJJ67OpO
         br15w/mmE0sBtxoj8V9omnqUeVNN3B8sYuUBjRESeeN3ychzd5fT7lYrFPWC7zy3SS2m
         MsG0LUwV4kfrpe3HyAZ/ln+c+1pyEs57KqhABZ5+/v8ckJbyaLCRmdM+vFoPqICkIIDe
         p4qQRzMHe2k41CB6gpBomhSzUVU0tdK82qzARcVhxwm+EkYX1ih3VcIbfpBHp8azmEVr
         76OLjECdm64Ipkwf1VqJnjFZsUuweOyLsKQFKA42c2360PT0a/zA8ooSzYodvF5EzVwu
         CO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808403; x=1748413203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRFphNC4JnJeMk+++9j1BwqaZsjiHNtrYKlDg4kSkHs=;
        b=EmT7KZ7VlrWu/mTtl5T2mgTTs2na2eSwY4uHuJjCc4sUXYH7pyjbAti/OeLohEQS55
         kdgfeiDlallljMg9gVqUMe5EQsmC6YeY6ZH6HWkKn6+GqCsoV74eFFCtXtZjvEZ3oMnC
         +WEffKXJdnajabV2rnnDRk9Ty2DACqM6/P0T3A3ygVmCjYDTZm6I2DlZPPKBdqXWeCQF
         2kOqyYQ0WoVMtp9+tP5blwF2Y5wxWsnIs2FdubtUfvYhJF/JxrdlSClufTGK8jqy67me
         W6sBQhyrt7A8aKtlHiux879zmJnuXhV/GeVj82xgfv7M+vS4RndNxycWS0kBgkD7ar7O
         pTHw==
X-Gm-Message-State: AOJu0YyTcG1H5OI0dbPuKkxOmhuwFkkJNcQixf2q+F1K1z1/iM5qU03G
	AsNz+EGWEnzHprrQ9IXorRACNM5fw2ZCU0RDKwd5NrHTnRzTsvjvfOHzdeLTeWFJ
X-Gm-Gg: ASbGncuM9R7FTNQs/9rYalDi0lnI/Fc3znlbvolefMAbZBZmRNzgXnbHDgXLTx4YWA6
	3pFt53ilzKzeytHPE3LpIOQvoAA4/Wn3LkNCtkaqmJlt244wHLhFgncEmZ5uN3xUvpeknsYwt8v
	/YaZsBb2J7c7P6dZfhvfX7Ek+mL0X7I8heKJfxajy3G9d3VG8KRlGOMSFeredpLJHZRhDtSEPqy
	CYT/mxJyG6snlBrj1MhXMZf3iBnFdXavVm41FTOxBbgHYdOzlj06jjLvp+BrdOlJtwIXMA5WZs/
	yVOP/WdY3/wyW5JYZBlEKSDHBFsfRyTbZ7JhaqNnMSM=
X-Google-Smtp-Source: AGHT+IG7dScssCKSvC1fzuYBIcefhpSrumc3GPAJ9vPJs8yk08ZYV4YL46DyMvf5gWh5C+8eVzx/yQ==
X-Received: by 2002:a05:6a00:9455:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-742a978730dmr25679689b3a.1.1747808403519;
        Tue, 20 May 2025 23:20:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:51 -0700
Subject: [PATCH v2 15/28] gcc: Always use GCC toolchain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-15-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216983

GCC is not yet compilable with clang e.g.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-15.1.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools/gcc/gcc-15.1.inc
index 864c6091a6be81567bec2aaa9133c3929eaa2286..f3e9204131425b54e862655a52fd60fb4f8c41ca 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -10,6 +10,8 @@ BINV = "15.1.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
+TOOLCHAIN = "gcc"
+
 DEPENDS =+ "mpfr gmp libmpc zlib zstd flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 

-- 
2.49.0


