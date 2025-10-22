Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B2DCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 05:08:22 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.1762.1761109695171711219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 22:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dzQgAmFD;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7811a02316bso4497830b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 22:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761109694; x=1761714494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJJPhw3KF9hkInkYXmj1Iy5+j0DfxFQT31/UUauB430=;
        b=dzQgAmFDRoMIbT5MU3+As7F0QCzDYTN7z3a4FEHZyj3k/7ajBJlchRRJAYmRaV7u/t
         aHjWIUD2j4LS2ZQRh44/EBNrS7aZ+0ZROJoSvonXBrVQ41TZ24vXX4BJGuJFkpZvO95H
         Gh0qfMY8UnqiAbfHF4pWArKDHli0KYog70SasjeFJaS+EgzJBmACyUJOD4pWstyBoqf3
         bopXufLhdYhV63bRmTwCo0DTMCSolUjoTIsjn3Mkj35TNa0VKeH/wbcvLUukbsCepfM+
         0b/4i32PJyQrKfAHlcgwcGMZr/CmjMbnlEdxFRdlZk0Ur2uUW0fWm+/Xi7yi++jMcL+P
         Ug6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761109694; x=1761714494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJJPhw3KF9hkInkYXmj1Iy5+j0DfxFQT31/UUauB430=;
        b=m9wIMjDnVSwIQMeUP6ehKGMMCX3Ch0rvtewAKf2zJyd0mGrxeFG8GH8I07Srbkj1Ii
         2FAyTObONUfZBDrQeQS+LmFyKCiIv8M879lnzrWJjxhOsQ9iqM/n/O/I4R8bFSCYPnut
         yeau4qweWC0b76KkUJ7TSqu7bwE6W3wt+s9qZgOlThCibcufn1u1mPBBG3C4IUfsS8jL
         sL2s0NTtY014HUGjTqdIXQM0JwOo53aK0549hcZpUvGekBlleAvpgFVNA+mekI9gpKZM
         K89viSRgMr5uT5aP/b8m9g3RSHYp62O4h6bG9tmKLucUgVahY3B8BsEcWaFcwBM0m7lL
         M7RQ==
X-Gm-Message-State: AOJu0YyDazODR1b65kVZ66Hmcf9fyPOLuNUJyMVE425AYCz54WHfNhn1
	wNlIl8QU9OPV8Dz1AvPp6tQMtFlUqr+Qbc/6zD31ROtbgw4Us3njmDCvQ6zbFiy4
X-Gm-Gg: ASbGncvXgpS1zvtGD4HCUrhuDRbHzudrmMq+RpCrdYMbBvjkdX4VMPiTBFKZi0T/Mpr
	jdXVeIPlNYcYCP6I5F7C8yR59VHBqPzrX9Zm3PJcBCV5uB6rny52y1xtkEFM2RtTJGzedvwrGpa
	/qLKGjEdYFf2uWzu933Ah0tEhgLGFcWnvba+q48y7Xw6A/RV8G9o/M/dizw57G2tDBWPQwp1nhi
	N7H43YUKIwnssY5CzZwZ5NJxjiTxHUOKYwsJLsEs2XlQAuBJDoGY6TDL04mNDbr8t9lioAK+lef
	MoG61mslCT+JP3T/EsFm99hEsCr8ax6SnFDvbW64pJEwM8gl0ZugzRlsXtc9AlrBh9cyzJ0+FJW
	d6eNmDvg52CZLbJqEuiZ2lwUGBfSE5vfLmiWzVIPGfIKT5gLs1bFWx9EchezQNQ6io1fuY4GBdr
	RrFn9bPVNE6ooXE7kF4ZJ58VL4w5+omYeJ6/X11mRLJ4j5tghTxvXJi7K0mUKbzZ7+mawIHwZA
X-Google-Smtp-Source: AGHT+IHU9geyJX6HdQbe7y5LApmKA3yUwdSg7jXeLuA8/m/nIHK1KjSFy1l4DoYObiiaB9ySnpPh0w==
X-Received: by 2002:a05:6a00:94ce:b0:771:fa65:ae6e with SMTP id d2e1a72fcca58-7a220a99177mr27899046b3a.17.1761109693924;
        Tue, 21 Oct 2025 22:08:13 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff157f4sm13328563b3a.6.2025.10.21.22.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 22:08:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] gcc: Pin native toolchain to GCC as well
Date: Tue, 21 Oct 2025 22:08:07 -0700
Message-ID: <20251022050810.1572184-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251022050810.1572184-1-raj.khem@gmail.com>
References: <20251022050810.1572184-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225172

GCC is not buildable with clang and when using clang
for native compiler this fails to build native parts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-15.2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtools/gcc/gcc-15.2.inc
index 575987b6433..d178b254878 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -11,6 +11,7 @@ BINV = "15.2.0"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
 TOOLCHAIN = "gcc"
+TOOLCHAIN_NATIVE = "gcc"
 
 DEPENDS =+ "mpfr gmp libmpc zlib zstd flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"

