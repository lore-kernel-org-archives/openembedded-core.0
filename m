Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F08C54732
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 17:43:34 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.58156.1724694208506031253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 10:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K+m6OM2q;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20203988f37so44784425ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724694208; x=1725299008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6NDW9LuRcsXOj767e2HvsjOO6lwB0MHZZPTGksN9BY=;
        b=K+m6OM2q7NAksIGJ3mwaQRx+LM4Li/OPO+lnuBwKx/Zl6eIdbpY54NszFqGHjH85tf
         XOUpvObVVmQhlRrysxoc+A2c/PxiFhpmRq4V7NOHJeCxawHVGK94TzV2R4Tuj/3EZHL0
         Q3lyGnDACOiZh0hCdAJ5+w5hW3N+TDwGhYOHCtTbkmTr8GZZLah5ueR6eVKTZfk4Gujf
         139CyPcesvtB+mUh8cZB8/KrAusqKNSjkvXM1gvvnt6a+YcLTE6MlBBs6YEUsR06hCV5
         o+vKy5KF0AyMWNs9yv+V95HhIu7QThZ6ivY5uq6pWT+6J0GSWEhnUwOmhwPVvB2WAsdQ
         4Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724694208; x=1725299008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6NDW9LuRcsXOj767e2HvsjOO6lwB0MHZZPTGksN9BY=;
        b=P44UuRGT9EwG+jQjh7smKhK6TAvcnifmLaVXFAy72G7nlbSNPmwO/z0ThO/SN7hHoL
         qjSf4/6RAfl5zRSdTCDIspNURtEOXPKCX52EX1iI2yeeYRvk0ImUSEM12aEyaiwT9hTH
         lbMmNhDHfCzYMdE4R1/K26c93DCy6S0i2aM/5D0RcmiZdyPn1e+6cx5nuxbWS9xMadyC
         8PWoLTHih8rzVxEGwDdw+leXYgKtqay57cQwuq9hSm11yMXtDG07pgbpEjJ/R9HYRVuN
         yjSZz+iQ21xXLgRNnesBbA1dsZqFFfvggxncthm2AgMzwk/ZI46BPOtUkd5QGXW9qhpo
         0rUg==
X-Gm-Message-State: AOJu0YwO8/Gck5lB0X5yOyZKNpiZlfkKeTkXS2SnrktTM6fsDG9cgfaa
	/q8Kg/qBhMsj1cefcHV+tUTFVnl8ygb9idrhi3KTjA9dsddywIQbVlTfzw==
X-Google-Smtp-Source: AGHT+IGHE3uFGRij1B8qhgEr1BHEQB6WWQ5VCtrhFgd+hV8Ok/RdhzAy9LlInS2k8VioxP4wwI+zvQ==
X-Received: by 2002:a17:902:e74f:b0:1fb:7e13:a7c5 with SMTP id d9443c01a7336-2039e4f1d0dmr161835135ad.45.1724694207647;
        Mon, 26 Aug 2024 10:43:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm56933625ad.31.2024.08.26.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:43:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/4] musl: Upgrade to latest tip of trunk
Date: Mon, 26 Aug 2024 10:43:22 -0700
Message-ID: <20240826174322.2938481-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826174322.2938481-1-raj.khem@gmail.com>
References: <20240826174322.2938481-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 17:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203769

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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No changes

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
 

