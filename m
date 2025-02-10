Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D035AC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 19:53:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2298.1739217192919961885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 11:53:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WgzPkyM3;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283dedso47657355e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 11:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739217191; x=1739821991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUGKnakHw7rZdiorau5oqF7qwDkFta2LGB9YGhZCM5Q=;
        b=WgzPkyM3nyRFzgEW259jMAAxsPwlOiLWshiK1W/F6n8R/qdFkNApT65JZwUGphNdwM
         ieiB26lwbF4kT5r9Y8D7EdOzn5Hu+DwZfhwUIBFJDmmN/9RLSsf2auyvmC8iCmboYQR+
         LbXx45EfzJ5K066lgDgo+ZaEn6e7QU320XOTnqPCgM6y2qA6efFx4xJ7/MEuzvSgC7a0
         Avh+dudLKP9Apls/yLykgPAnCJu7pq8oT/F55Ot2prwVTHi68aC2Rm6d4nn1pZ3E63Ln
         InVYxUTXrR+sGXTrwEEjEQ4+z1KY7NU+4zJrjAHtYy5cNNN4AV9lGz7QH2AXKIwi/4KD
         HOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739217191; x=1739821991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUGKnakHw7rZdiorau5oqF7qwDkFta2LGB9YGhZCM5Q=;
        b=N5LCq7NLvAAUKyrWBNwgf6kxYHhCAq9C4UMdIpVL5HX7m0AjHuo1JD9YKOC2crL4vh
         ibvoPbioBdpHY02QrXQFS/952KcWXEQfpx64QljGjXJvwfs9Zzx12ISAEb1eewoBxX2v
         plT9TX8Wsw8FrSG+h+hrfJtMRV4YPPPjkSXRBtz7ZQp+DKGBLnC/YNe8ivosIV1vJtZz
         Z/jkT2dpZV8fyNAVErVkqc7tR6UUvJauVa00ki/9/ld1HRcsVTsDm4tNfpLPVW+7JMeN
         a0gFn4k48fULFtM0Fe4AV4aahXmHS9bFJEuKhjDlGiXdlJWbItSgiTNDHfRdqcqgp3ss
         f1Yw==
X-Gm-Message-State: AOJu0YzOjaOVa/1Z924c6ps/yKsHrKyskW4eCuBjcSF+pbGJhlWWwm4q
	1Af7kpH6XeGYm9PPxXW4UBZu3YpLrFFfq0Zs9aAiNU6+lp808TtUWeG4zg==
X-Gm-Gg: ASbGnctxbHM4Hsd+kbyeTuX/yGlj/mfEr2eYo0GC8wpSSPy005FL2B5OmeDWyqYi8mA
	QST+fsCZT9T8397mH5HY2s+nZ8QNwgAguAWuih2U8DkwQRoVEtf4tVjfPjSMg0xJTxUQnmC6lIx
	PjM5WkHu/Uk7qu6sBPVpQmb0cv6tRoRXjHOVSOMlNy/eAo+Mx2J9CzbKClZwUr9GEWxC5De37br
	RYXSn8cmeV92vZhSLV8Rgry5wmbH6uv5L4EkO2IQho7qAyenn3D0tieumSK5F8PcQ4DrtIB+gHp
	81O3syBxUi2GD4CPgw==
X-Google-Smtp-Source: AGHT+IHShNydAW2X+IfEHGfMO3iXztGu0Uv3PBvr5LR7DbcrU2FB4MSbrP91PcLnFdML/x/HJF3GWg==
X-Received: by 2002:a05:6000:1a8f:b0:38d:e39e:ed14 with SMTP id ffacd0b85a97d-38de39ef19amr1869619f8f.25.1739217190805;
        Mon, 10 Feb 2025 11:53:10 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dc17e278bsm12188834f8f.48.2025.02.10.11.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 11:53:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] qemu: Do not define sched_attr with glibc >= 2.41
Date: Mon, 10 Feb 2025 20:53:05 +0100
Message-ID: <20250210195305.1719167-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 19:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211117

From: Khem Raj <raj.khem@gmail.com>

* backporting, because it's also needed also for qemu-native builds
  on hosts with glibc >= 2.41

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4dc6c104c7..c3401533cf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0003-linux-user-Add-strace-for-shmat.patch \
            file://0004-linux-user-Rewrite-target_shmat.patch \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
+           file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
new file mode 100644
index 0000000000..edb3e304c9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
@@ -0,0 +1,47 @@
+From ddb27569449c941014fa44b1b542de0831d993a0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Oct 2024 22:40:32 -0700
+Subject: [PATCH v2] sched_attr: Do not define for glibc >= 2.41
+
+glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
+and struct sched_attr. Therefore, it needs to be checked for here as well before
+defining sched_attr
+
+Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
+
+Fixes builds with glibc/trunk
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/qemu-devel/patch/20241011193140.1047648-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Laurent Vivier <laurent@vivier.eu>
+Cc: Paolo Bonzini <pbonzini@redhat.com>
+---
+v2: Use SCHED_ATTR_SIZE_VER0 instead of glibc version check
+
+ linux-user/syscall.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 1354e75694..caecbb765d 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -359,7 +359,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
+ #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
+ _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
+           unsigned long *, user_mask_ptr);
+-/* sched_attr is not defined in glibc */
++/* sched_attr is not defined in glibc < 2.41 */
++#ifndef SCHED_ATTR_SIZE_VER0
+ struct sched_attr {
+     uint32_t size;
+     uint32_t sched_policy;
+@@ -372,6 +373,7 @@ struct sched_attr {
+     uint32_t sched_util_min;
+     uint32_t sched_util_max;
+ };
++#endif
+ #define __NR_sys_sched_getattr __NR_sched_getattr
+ _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
+           unsigned int, size, unsigned int, flags);
-- 
2.48.1


