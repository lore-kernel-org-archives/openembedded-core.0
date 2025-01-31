Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E4AC0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 22:54:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.32219.1738364090365112801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 14:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I76tqzcb;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862d6d5765so1406809f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 14:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738364089; x=1738968889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o+R17IgvKvjdKwbbjSunpt3aFRtPfazGCHQB9lyFgNM=;
        b=I76tqzcbrOF6zCnuBMr3xjBK1z6XXvnpGQoOALH6L7uuaG6FRWWEpnqzSgFRIZOg1S
         rBBHeis6iEle1vHHAH7VJ/X2OEh1PX36NZirp5slgD+oT4pFU2AhPhARY0+o7ZOCbsnG
         fCtpy8Q53D7Ol5atdLLc5/pQaNILqIa2B3G34pALmyg6oAnbzE3Oh6jsYLdcMKITzGN0
         BX+dcKLdfx+gil95z/AfL7MK5d48VUQ7bmBbkXpD4/y439Yx/AIK0FYhicVVDXdSt0Yl
         52A9EEYpHiJCUIsX/Xo6CD0vfFGaCbarwuvQEb+x4Ecb+oipo2xTTPCGYnSDAvZKeiBF
         rQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738364089; x=1738968889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+R17IgvKvjdKwbbjSunpt3aFRtPfazGCHQB9lyFgNM=;
        b=AFkQPnbpguYfgtmcqcO+PhB2J6VMKY9nUAYMCoOW4x1ruEO0wiz8lQWLlZp6IR2J9E
         gRkaPB/39zNxGg5jgf98bBrom59NekbvqXa7kvyGSjVKxY9pCkkgD5CHAq3OPNPOSYRX
         q94f5YDxARq6eI5rm6G+oiInSJ9A0mE3Ol4ILFPXTfCNrTwCgYeEXmP2FRozR7kLRWor
         I1F/CEmwfZqTtrn280onC83hoJWByGSXDy29Da4cYVnJcKN8wLNLbfXK1O/v3tzTevRG
         CQA3v3r2Mlb8X7L8hGX5XE3KS1ygZzxhBhrNSOz3/t8ep7Wu/gd04H5hlMhcXzzCkuu8
         psMA==
X-Gm-Message-State: AOJu0YwPmPIpxD/GSYGABZeAaq5mV86HJs/SXQKCb0v4LVo2RfR3l8UE
	ETRDKMH2o14XakNjVEalIElcq9uVM0FdHNilSd/rPdSPasz53Hc50HB8DQ==
X-Gm-Gg: ASbGncsxvvhLUcIUOSyF2iQdnwh4IEmABaFu7UAnPo/XF9VT3ZYKPyqNN5UIVr9GyMI
	NshJ7RiMda0x+RXam5n3TMWTTKosCRK0k/1WooGJBMLENoC37uCiAPSZgSLkFEcbJJBqqU7xlWA
	3dy7UX3gPbq48kd1DSGV81Sh2oZ/iKwWeSuW8RDAS12mL6vHK2RytCAnarTaAQ6FN4+G+uqMGOi
	Uh/VcbG/R5IeroZfeWZ+e5uURcCSdE/0FUxOF2mTcuu31QoFJBCQrBGbvlDQWX6GaSemHNnLRIG
	ciLFDeENTNtWAuR5//ul3w+pux3vFg==
X-Google-Smtp-Source: AGHT+IG+hiGDR2tX8CEzS5ktzqC88qUHUTXMLi/iazfQbWo8FGxX/bXdG0hoNXJGACFmiv7yyb6t2A==
X-Received: by 2002:a05:6000:1a86:b0:38b:ed6f:f012 with SMTP id ffacd0b85a97d-38c51946f83mr10292338f8f.9.1738364088662;
        Fri, 31 Jan 2025 14:54:48 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc819ebsm102831065e9.39.2025.01.31.14.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 14:54:48 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Hui Min Mina Chou <minachou@andestech.com>
Subject: [PATCH 1/1] ltp: Update to 20250130
Date: Fri, 31 Jan 2025 23:54:44 +0100
Message-ID: <20250131225444.1144932-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 22:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210496

Removed 0001-sched_attr-Do-not-define-for-glibc-2.41.patch
(accepted upstream)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

could please anybody test this patch? (I'm an LTP upstream developer
with very little Yocto / openembedded knowledge).

Would it be possible also to test if 0001-Add-__clear_cache-declaration-for-clang.patch
is still needed? As Cyril noted at [1], it sounds like clang bug
(__clear_cache() is a pre-defined function and as such the signature
should be part of the compiler).

@Tim any change your kirk recipe is merged upstream?

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/Zmg9WZ1TitB7D_RC@yuki/
[2] https://git.yoctoproject.org/poky-contrib/log/?h=timo/kirk

 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 42 -------------------
 .../ltp/{ltp_20240930.bb => ltp_20250130.bb}  |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
 rename meta/recipes-extended/ltp/{ltp_20240930.bb => ltp_20250130.bb} (98%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
deleted file mode 100644
index 58d665c7dd..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 38ac9ed7a4f7e2dcedb3c13d807ad0575435bab4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Oct 2024 14:37:12 -0700
-Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
-
-glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
-and struct sched_attr. Therefore, it needs to be checked for here as well before
-defining sched_attr
-
-Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
-
-Fixes builds with glibc/trunk
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
-
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-October/040678.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/lapi/sched.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/lapi/sched.h b/include/lapi/sched.h
-index 26fdb628d..e1c7ff011 100644
---- a/include/lapi/sched.h
-+++ b/include/lapi/sched.h
-@@ -15,6 +15,8 @@
- #include "lapi/syscalls.h"
- #include "lapi/sched.h"
- 
-+/* sched_attr is not defined in glibc < 2.41 */
-+#ifndef SCHED_ATTR_SIZE_VER0
- struct sched_attr {
- 	uint32_t size;
- 
-@@ -44,6 +46,7 @@ static inline int sched_getattr(pid_t pid, struct sched_attr *attr,
- {
- 	return syscall(__NR_sched_getattr, pid, attr, size, flags);
- }
-+#endif
- 
- #ifndef HAVE_CLONE3
- struct clone_args {
diff --git a/meta/recipes-extended/ltp/ltp_20240930.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
similarity index 98%
rename from meta/recipes-extended/ltp/ltp_20240930.bb
rename to meta/recipes-extended/ltp/ltp_20250130.bb
index 3fe8772ea7..908a037959 100644
--- a/meta/recipes-extended/ltp/ltp_20240930.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -24,12 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "60f81419c43f94ec182827ef0b9eb5baeb303419"
+SRCREV = "a7c31dff7edc089a32e990765e12952cc4d7666a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
-           file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.47.2


