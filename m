Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2481C54732
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 17:18:03 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.58413.1724692679143027740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 10:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FiUkvoyg;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fee6435a34so29770165ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724692678; x=1725297478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaicDt2LVocAvQJGTTVy+47HTCDOH1TFhKyuAGMne9k=;
        b=FiUkvoygXwM58/K/6bcSAT0sdYOgf6MMhxmLDxruXYlY3q+xpM4lF7iwXaUAGD4Xce
         Uu3ippFM/bomLWioiFTS3ANGeYJM8v7vrYuoRTDL33SfIY5h/vfavfP/Q9cH4FGOMLW7
         PBocbI6/5S2/LMtutqMCqPp8kJk51igCrVDhNy5TnuzJ9sXaJdaU8HqiohPUJE7p8hyM
         52XOxG/tGWhCEx5eFGs/jHlXwAt0QjVuOEM62TEMHkiCkPpkFlATXU62QOnfMENMS5i1
         uSjeUIoTA8g9mdHPO4+QB29CiI24hkIDzIuPAMHPxzsbRxfFAQpaZZhDAVqTC7QGvQBx
         c7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724692678; x=1725297478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaicDt2LVocAvQJGTTVy+47HTCDOH1TFhKyuAGMne9k=;
        b=nqc0s66ApP+jM9TimSnrhVWNgZ5akq3oftB9Z/sC20q8CPldiGq9WhrT6G+Hu6Efg7
         fbOXMHnkNED0C7qbpPfiUik6i04jElGEoNbcY7cRtaRs5trhNAoUGwZyYhxGVBkf0Gox
         X2qGFZTeYuDaWANBzpb7sguyAqpuxzpODtxQLgBbn7TnapSUgFSWjORP06GjZ/iy4bvj
         Jc/t6XTGQUwocYOpG66eSZP2cHZ6Xr+NNQuBMmOyijIsiN3skfaEb9b5J+R95auQFwr+
         KgWrzea4zh4Ep/hXBiXeCYdDpXszNkgSjdqu6cKD/MFUXa+kAeVyLQ2n73xkVV/bJBI5
         jZ1Q==
X-Gm-Message-State: AOJu0Yw6nMw9WDsfu6O8pid5ny3Gl6M7Ik32+RyvvQj1FiTGBPpH+H4O
	oWrhR+FNEEu2W26N7sjLoktylPN+TgC00cImOVc8N7Z9nnPO0PJHViqyCw==
X-Google-Smtp-Source: AGHT+IFoyirDCD7RS04M1SC3EG/qcBK/UsKwO3BUoyq0q89sJxonvHdGVFccACD91aJ1rhK+2EJB5Q==
X-Received: by 2002:a17:902:c404:b0:203:a0f1:3400 with SMTP id d9443c01a7336-203a0f134f2mr116495555ad.0.1724692678326;
        Mon, 26 Aug 2024 10:17:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557eeccsm69968205ad.84.2024.08.26.10.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:17:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] musl: Upgrade to latest tip of trunk
Date: Mon, 26 Aug 2024 10:17:52 -0700
Message-ID: <20240826171752.2886654-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826171752.2886654-1-raj.khem@gmail.com>
References: <20240826171752.2886654-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 17:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203764

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
 

