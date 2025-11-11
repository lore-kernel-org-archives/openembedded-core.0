Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EB5CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 03:29:45 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8796.1762831782415258629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 19:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ISEaRmB+;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b679450ecb6so2996288a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 19:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762831781; x=1763436581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJWegKpaCggl7RauLK8h74mn7sHBY0er8F3PMALZAfA=;
        b=ISEaRmB+qswNqi3li7j9HJKW7nMBm35x7s5QpcdtKQI5CS2UC50DqD31iUcnsVtWEQ
         jlJNQKnpJ1HEPawqPJcgPsWpMXFzwcTAdVLQa88nQKCThfRxNvCWvogSqgvbTbEP3h7E
         LBajbnGtSsmtmdyoMS9SEJPR+w0xRnHg++tyKe4y54Ejl11OxVEV6gGEDoip5SLuSRLd
         3lFZNc59wNaGZcm2mOk9C+1bIyl+kwmBIBWb/HsXEe9bC0lu30y2pDG0yNt0UNjL4eVQ
         T6CYdacYOcweorrjUBiEgFHgM3pq5gFwqBrQ7eDsYn3hfJOoucLSsJFo0h+tW6ES1a6U
         B8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762831781; x=1763436581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJWegKpaCggl7RauLK8h74mn7sHBY0er8F3PMALZAfA=;
        b=AD2ARi1yvL+rrVQfY0kB697mBrfuZGCyMGgToISyjMz2vGYI0tFC1ZZqPsovl8vbdK
         CBVtcn8GVuLzLAY9lD1nyPr9Rk3YTULbw6gT3MgIGPAweOj70mFW16/hd9psRvoA5esN
         k/AXr1J/38+JjRzcJblbEZp2icA6yJL7w9JUfTA+TZyYlbUsqC6NvZ3urh00snynnrCe
         5JLXAG2GI4HpwUlUPrbg0UI+lZGV32hHgOnBTikp9fNdC0LZYmq4Ygt4iD5vkc/RXMZt
         wYgZxNQG8WTSvkDSYxzQXvcHnEH5rC4V1Vo+NQuFWCEm7kwFwLlc+9cRrJ3W2bRRmGe2
         uKnA==
X-Gm-Message-State: AOJu0YzDmpmxQCJPk86Gdcf1tDhVCt0upXbuOPUXE/WVC0WpPMdzcH3C
	VgOHUzb9aK95zcBB+nDIV+yGdsBsQkhbHuS3KxM9IlaZ5L4c5gXUzD44FG+lUJJA1uA=
X-Gm-Gg: ASbGncu5uq4MuBP3kcUdJsT9YS7/KM2VxfxVYGQ0GDreFA5iR1fZOh9rrMwfpK5gKVX
	ZTfAIgeFE29c1uD+1CAO7HdTXGzAUrSfiwRdRx49iPGdrU4dBUmMrBgZbtVQGYehgv0wQ49Uklc
	RJF8Wd9coUl7gSVkOOqAJ+g5QOoddpJtDd+zOgpD4P3j356yXWosBim7M3Kv6vAYdnyTqtPkMpU
	rlFAEmE1Ni89o1NgVev1+kegXvTiS3Q1w/82FaWAIIfCJ+13NsrW0orVpdOXPU54M4d0+6pnWbz
	/FuEZDEPn+AO6H0KyKvzW6mVMqelqBn8Ck9EzhuoiJ+wfB5y2kv+r+HOg3HXlS8YDGd4J7BUBPw
	faWqE5e2Nua9SMc7zS2Pf9OtibAjdNI6b7LL72sP0u8tmCPW0Ubbeb9WLmztY1a5+O2hBXR5ZKa
	nt4wrPmn0m5pgNJVLy0aQyT0ZDOGalB6ZnKFmJLBFa5yezuYgwpa4S2Kz9kdtDFw==
X-Google-Smtp-Source: AGHT+IEXgL1o8b+fV1zu5I3SYDrdKOM4f4Fdvgndh8tQJ6ETYGjYjZ4fFI3MfHGqEGLtDKHiAEOHSA==
X-Received: by 2002:a17:903:1a44:b0:298:68e:4057 with SMTP id d9443c01a7336-298068e42a0mr112055135ad.59.1762831781298;
        Mon, 10 Nov 2025 19:29:41 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8f2b3sm165223055ad.76.2025.11.10.19.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:29:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] waffle: Fix build with c23/glibc-2.43
Date: Mon, 10 Nov 2025 19:29:38 -0800
Message-ID: <20251111032938.2187461-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 03:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226141

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-c11-threads-fix-build-on-c23.patch   | 51 +++++++++++++++++++
 meta/recipes-graphics/waffle/waffle_1.8.1.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/waffle/waffle/0001-c11-threads-fix-build-on-c23.patch

diff --git a/meta/recipes-graphics/waffle/waffle/0001-c11-threads-fix-build-on-c23.patch b/meta/recipes-graphics/waffle/waffle/0001-c11-threads-fix-build-on-c23.patch
new file mode 100644
index 00000000000..4082a763e16
--- /dev/null
+++ b/meta/recipes-graphics/waffle/waffle/0001-c11-threads-fix-build-on-c23.patch
@@ -0,0 +1,51 @@
+From 6b3c46483844faba4dfe7dd90dc2b0cd06e67158 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Nov 2025 19:20:22 -0800
+Subject: [PATCH] c11/threads: fix build on c23
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
+
+Conditionally check if glibc already provided c23 definition via stdlib.h
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/158]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/threads/threads.h       | 3 ++-
+ third_party/threads/threads_posix.c | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/third_party/threads/threads.h b/third_party/threads/threads.h
+index b4db50c..cdc7bea 100644
+--- a/third_party/threads/threads.h
++++ b/third_party/threads/threads.h
+@@ -102,8 +102,9 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifndef __once_flag_defined
+ typedef pthread_once_t  once_flag;
+-
++#endif
+ #else
+ #error Not supported on this platform.
+ #endif
+diff --git a/third_party/threads/threads_posix.c b/third_party/threads/threads_posix.c
+index bc50825..d93013b 100644
+--- a/third_party/threads/threads_posix.c
++++ b/third_party/threads/threads_posix.c
+@@ -75,11 +75,12 @@ static void *impl_thrd_routine(void *p)
+
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef __once_flag_defined
+ void call_once(once_flag *flag, void (*func)(void))
+ {
+     pthread_once(flag, func);
+ }
+-
++#endif
+
+ /*------------- 7.25.3 Condition variable functions -------------*/
+ // 7.25.3.1
diff --git a/meta/recipes-graphics/waffle/waffle_1.8.1.bb b/meta/recipes-graphics/waffle/waffle_1.8.1.bb
index 606881e0c91..aefa0069cf2 100644
--- a/meta/recipes-graphics/waffle/waffle_1.8.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle-1/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.8 \
+           file://0001-c11-threads-fix-build-on-c23.patch \
            "
 SRCREV = "49abc7cb5f73cc6852136c91da49ea3a338960e4"
 

