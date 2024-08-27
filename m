Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FE9C54739
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 16:26:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1302.1724775971161502785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 09:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cs/YLU+I;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20230059241so47509885ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775970; x=1725380770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViyWDOrjawHAGlWbkGDH2LhLAi7os3jP22QjThQ/6rA=;
        b=Cs/YLU+I/NMCVeXMemv2xRh6UStwOnxnV8k3p0hQoG5CbEG0iGP+z8qFdJrG/Dam9G
         Avyv1W7uLV0x2cXnjhHtucX1QNzRS15occvmaURWjWU65PXwM42sCC+7ZFxrXM4LU4+b
         aKkSkV08pdySB7XSnT9dH0L8sNDTA5DtFhUTmC2DhnI/TfFbaX/en/lWPwi5GY+ry1/R
         78srXjO2R0AkDECc3DoaEHiTNs+RLZDxy9v1n4iKrIIdsUXExxNK+j7y/xfMDldNU0Fc
         ZIH2IWfPOfo7SCbXjVtwGd67ADA5p9xWxVPuLoiUFvwgiL7eAdR85WJuRxs0avKDQLEt
         Esmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775970; x=1725380770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViyWDOrjawHAGlWbkGDH2LhLAi7os3jP22QjThQ/6rA=;
        b=AOIbXigEwvsplrE62uwTa+BKsnQ0Jevk3XJ210Ogv9L93r7rFWTHXrcRp90SPDTHZy
         fK1x8nQ+Cw90xiLhvUlePTpPfubWfnl17mO8ObBIBV3dGhXJKKwHmFlsA0Ch0+kHrV0W
         zG6IfGo93tQNQ7ntahS3eGkc0t6siYHXNN0hNAHUkBfhN+VYSDAbMGn2cQFh/G+p7cEl
         Pgqndr2+eeeyxzFC/3uvvw3LwHhNkipj0ilWrtzUO/NdLOCxkN5AugTp+dRtTWb4yoK4
         tbFCOw8A0SxECqG3bJrAmUhuTsRHoFssN66HVV9G3oS5YkB9rTK+Z0LG6uB37NTBtHRK
         ZALQ==
X-Gm-Message-State: AOJu0YwW+IoftTzIejYWOrUr0lP8rN67PbMrU7tef/F8tg7rEiCsBEr5
	0OWDDfvEa5R3W1PXXkWIqx3nhTGYUfAJXgGFVf2LAJWO7DubQLYvOWo5Cg==
X-Google-Smtp-Source: AGHT+IElHQ9LvkzlR2skwrv7VYiEn2f051zwKI8vFdKWUfWVzJ1wQfKFtIXHaY1iwo8fZrgWYCLspA==
X-Received: by 2002:a17:903:2301:b0:1fb:2bed:6418 with SMTP id d9443c01a7336-2039e515956mr170508785ad.57.1724775970351;
        Tue, 27 Aug 2024 09:26:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385fc70f0sm85039895ad.299.2024.08.27.09.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:26:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 3/3] musl: Upgrade to latest tip of trunk
Date: Tue, 27 Aug 2024 09:26:04 -0700
Message-ID: <20240827162604.2108623-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240827162604.2108623-1-raj.khem@gmail.com>
References: <20240827162604.2108623-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 16:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203856

Bring following changes on top of 1.2.5

* dd1e63c3 syslog: revert LOG_FAC/LOG_FACMASK changes
* 008f737d siglongjmp: document why this function just calls longjmp
* 947b4574 inet_ntop: fix the IPv6 leading zero sequence compression
* 50ab8306 dynlink: avoid copying to temp buffer in get_lfs64
* 1b97d006 sys/epoll.h: add epoll ioctls
* ab31e9d6 getusershell: skip blank lines and comments
* 53ac44ff dynlink: fix get_lfs64() with posix_fallocate64
* 895736d4 syslog: fix incorrect LOG_MAKEPRI and LOG_FAC[MASK] macros
* 05ce67fe add renameat2 linux syscall wrapper
* 00799729 fix mismatched type in posix_getdents definition
* cbf59dd6 aarch64 crti.o: fix alignment of _init/_fini
* 84015cee fix typo that broke sys/reg.h and sys/user.h
* 1b0d4851 implement posix_getdents adopted for next issue of POSIX
* 2c124e13 stdint.h: derive limits from __LONG_MAX, use common fast16 types
* 7019fbe1 sys/user.h: derive __WORDSIZE from __LONG_MAX
* e709a6f0 sys/reg.h: derive __WORDSIZE from __LONG_MAX
* 29b216b2 unistd.h: derive ILP32/LP64 macros from __LONG_MAX instead of arch bits
* 0dfa1d8c unify bits/stat.h for all archs sharing a common definition
* ef600888 align aarch64, riscv64, loongarch64 stat structure padding type
* 6f666231 ldso: fix non-functional fix to early dynamic PAGE_SIZE access
* fced99e9 strptime: implement conversion specifiers adopted for next POSIX issue
* 3f9d4224 printf decimal integer formatting: shave off one division
* a23cf8f9 riscv mcontext_t/sigcontext: use __aligned__ instead of aligned
* cbf1c7b6 add missing STATX_ATTR_* macros omitted when statx was added
* 3f49203c initgroups: do not artificially limit number of supplementary groups
* 24ebbbde printf: fix edge case where hex float precision was not honored
* e3b0ace5 complex: fix comment in cacosh
* 9683bd62 math: fix fma(x,y,0) when x*y rounds to -0
* 5370070f fix pwrite/pwritev handling of O_APPEND files
* bdc9a9ff uio.h: add RWF_NOAPPEND flag for pwritev2
* 7ada6dde iconv: fix missing bounds checking for shift_jis decoding
* fd7d0185 add missing inline keyword on default a_barrier definition
* b5121e2e iconv: add aliases for GBK
* ca6f46af iconv: add euro symbol to GBK as single byte 0x80

(From OE-Core rev: 70179bc94c90ba1f33a3fff8f3019cb96fcdbaef)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: No change
v3: No change

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 63b2038e4be..e3a8dff7d5c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "0784374d561435f7c787a555aeab8ede699ed298"
+SRCREV = "dd1e63c3638d5f9afb857fccf6ce1415ca5f1b8b"
 
 BASEVER = "1.2.5"
 

