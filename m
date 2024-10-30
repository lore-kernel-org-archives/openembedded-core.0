Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBE2D6B6DC
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 21:50:21 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.27393.1730325016482874577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 14:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aP8WR5Y+;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a3b6b281d4so1271565ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 14:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730325012; x=1730929812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYHK8qwfatpYl+/N0ScvI243JdvP2qIICgL0DIUbp+Q=;
        b=aP8WR5Y+P7WrxP7PJX5ENCmme9AgD1q3SdnA/5qs2BNvspJRV2QxNkFbkwUsD5+D7V
         nh/XHFPTx8iANjkoJRC9PfA1Y2BRxKtlTY6qDS5YNz0yDhjf8jnblQh9KC/xIT2WWzVQ
         SLWpfSlGH/dwiHL2wZmCavQQlCaCZp+f6i8GhiCtdPoAD1la93iZSMVgeqDh1+UqsQ7w
         GypdDu5pjbWn5Xq7lGRnBz8k0cNJGXDPvMhFDr0FAGwfPXcLlg2B5GlKDEuHyQU3U4EP
         baCECnkvyWQv8OgUoz8VQ9G7KU08kV3m5wX2nNIgzC+n8F54xJkgVJDr/vUAoSQmdmXI
         zQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730325012; x=1730929812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYHK8qwfatpYl+/N0ScvI243JdvP2qIICgL0DIUbp+Q=;
        b=BFKR5SPgDqRxW8k9Na9OmIqu/UrdlJpmFjbp+fHRmywiZCigG8OS4CLLQcj6ItdlrK
         eGjt4nNWak7JauW0IuUUrMOMufv33jbdYXui3v1yX1HFUlMANTi4b7tMVsAr7W0m/p2z
         YubsG5JhLLSlbhX9fBw3QvObnUCIPlZhBLlPlMMTFoQaXzH5eZOPrJUpS6mlpCUsZXdB
         4V97nAKMBKOPZItiTJXMOsLny9BxCWoSLwEHxeJapf5816V8Xnau7s1NrjkBB43t5xS8
         PjIuImaExMEnZmBCZK2oM9QO6yWuitJnFtzWiHSjpEdVDU1oHwfusCwhVUmvCOl4MRDe
         L84Q==
X-Gm-Message-State: AOJu0YzHY0L/NTDqkpuIyzAvNJnB8VxCvry65fvVwslIWVOlC7zievXO
	22zzgn+u4Oz3dcPNjtWtu9z+l8K8MAgUwUBJL6Y6gtiaFcOcYjbT5ufr3pMS
X-Google-Smtp-Source: AGHT+IGOq02zvsVgtXriMGcCKR9uV3DIZaL9W0XqyhE44O5IOhJsKQkIAKIrcg7eFn6WLCjyyyXGaA==
X-Received: by 2002:a05:6e02:b49:b0:3a4:ea3d:8014 with SMTP id e9e14a558f8ab-3a4ed26669amr191954255ab.2.1730325012276;
        Wed, 30 Oct 2024 14:50:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::35b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee455a74b3sm51147a12.52.2024.10.30.14.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 14:50:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ltp: Fix build with glibc 2.41
Date: Wed, 30 Oct 2024 14:50:09 -0700
Message-ID: <20241030215009.544348-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 21:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206564

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 42 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240930.bb     |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
new file mode 100644
index 00000000000..58d665c7ddf
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
@@ -0,0 +1,42 @@
+From 38ac9ed7a4f7e2dcedb3c13d807ad0575435bab4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Oct 2024 14:37:12 -0700
+Subject: [PATCH] sched_attr: Do not define for glibc >= 2.41
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
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2024-October/040678.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/lapi/sched.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/include/lapi/sched.h b/include/lapi/sched.h
+index 26fdb628d..e1c7ff011 100644
+--- a/include/lapi/sched.h
++++ b/include/lapi/sched.h
+@@ -15,6 +15,8 @@
+ #include "lapi/syscalls.h"
+ #include "lapi/sched.h"
+ 
++/* sched_attr is not defined in glibc < 2.41 */
++#ifndef SCHED_ATTR_SIZE_VER0
+ struct sched_attr {
+ 	uint32_t size;
+ 
+@@ -44,6 +46,7 @@ static inline int sched_getattr(pid_t pid, struct sched_attr *attr,
+ {
+ 	return syscall(__NR_sched_getattr, pid, attr, size, flags);
+ }
++#endif
+ 
+ #ifndef HAVE_CLONE3
+ struct clone_args {
diff --git a/meta/recipes-extended/ltp/ltp_20240930.bb b/meta/recipes-extended/ltp/ltp_20240930.bb
index ac8bea4244e..3fe8772ea71 100644
--- a/meta/recipes-extended/ltp/ltp_20240930.bb
+++ b/meta/recipes-extended/ltp/ltp_20240930.bb
@@ -29,6 +29,7 @@ SRCREV = "60f81419c43f94ec182827ef0b9eb5baeb303419"
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
+           file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            "
 
 S = "${WORKDIR}/git"

