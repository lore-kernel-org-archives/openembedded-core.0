Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C3EC0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.3309.1739304584088013101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WAhBsK7d;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f48ab13d5so100856845ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304583; x=1739909383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWTXUTBzdlEoVgsJySNPt21COzSMsPoYMLiqlsvFAGo=;
        b=WAhBsK7dmzsn4mGnWFutmufTiJYOwcBjaqwythHNLm6o84s6Ry5aKKhtCQmjJJWq2o
         I7Mh0DMH0gC7njDjS2STdqF5y/8KxdswO1s6X6ZxxpiwDR7zUG17tmDAySZa6bY2nY0Y
         YX8NoGknGhlE5WBI8HK9tVxhNjqTHyE1QCI7NEa6S1/yw0fifW2DAKl76RY9ZjfEV79h
         ATDiq/iFxBe4tH9xLkT8++X94fj7gN47WEklqWF/1+Yj6RcqNq/oeaUDGRNRKTX2HmKU
         cvMRPrjbr0KWlidPWuvAuEncl9iZV5tb046JK4cI18Yr7Ag+fIkVaxg/14ou8TCl5ycq
         XDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304583; x=1739909383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWTXUTBzdlEoVgsJySNPt21COzSMsPoYMLiqlsvFAGo=;
        b=duWtVSOVFLmciCUlgIydV6erT7/4ybZyxmHzGjx5Ayht4D40WB9ZVAnPsROV09/wxq
         Z8KVLdgASq5UDp5a+lN87mYDF47wR8G6qUU0Qgk6zvxRL6FhTFWT020SmleawZMbvpSQ
         /LFYNEgDQpsZ2X3W30s3WTW/mcVut4mSu9snWrOAA5RuW03xA3jiLyfJCppGwvTWAW5e
         l8daFQA+azpHsFvOUQhDFdiNiaTrecuY/Wj98cYidQ8vL4k+EcLq9Yw5nMLeBIOACZmx
         y90Yg1ZyPyE7vtnfRnwRjaXVnfvLUhpRLKDZ3zYLuSyoNGE8Qvx6SBWfTjXx2tjRzgFB
         MFzg==
X-Gm-Message-State: AOJu0YxlxPfRL57wV1geNzjxDvHzJM+tWRZ+7CsEckIairQ3AjMLsLcF
	Ly4ExBA1yr7N0lfLH5pTHcS+8To4/93lCGivCiiuhTigrpfKo83IlaIiDjOu1t8ejZzYXRUhKsn
	D
X-Gm-Gg: ASbGncvoZc2el3Q9td3yy5AJZvRoICC0czuyYwkYo+d0yJOM/SzrCfK7WbVmWh0yGHN
	1ofcTNdBSGm2kDGsBsQbIss12zU+CRbKBbX69WUN2h6T6GNeROTfKXYV6toSrz7O4YayKyni+wg
	5bqSVz+5XErim+/HDalwmC+CsB8x8qUVnJysxIHP9ELGVFZtZ4m/DHoMHsjRvAaWVbPhJYKApyU
	iah0mVc41rS/e6dDrmwZuWMZqEWC1I+/bRMhYVj9OUnsy2dQ/08joYZ3cHVHoyJ4c1JBPew1QBB
	tZC/
X-Google-Smtp-Source: AGHT+IFrx6wNJKAgQ+6ZCOvGDu+Pr6i3N5E0ltXmCWPs4pGAd1At29vAMC80UoQX83fA95Qq9WBTLA==
X-Received: by 2002:a17:902:da92:b0:21f:8718:fc64 with SMTP id d9443c01a7336-220bbcd19ecmr10035175ad.46.1739304581810;
        Tue, 11 Feb 2025 12:09:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/14] qemu: Do not define sched_attr with glibc >= 2.41
Date: Tue, 11 Feb 2025 12:09:12 -0800
Message-ID: <d34b38ecc2571fae0d58a34db1358dff2505148d.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211183

From: Khem Raj <raj.khem@gmail.com>

* backporting, because it's also needed also for qemu-native builds
  on hosts with glibc >= 2.41

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


