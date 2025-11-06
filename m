Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05579CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 17:29:51 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3403.1762450189059218336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 09:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XhYqy/mq;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so994011a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 09:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762450188; x=1763054988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnGBoNQVBZxwVRfJ0LF0mSQaz980+Xdw8CCz+AhE2uA=;
        b=XhYqy/mqeaG9SKb/nELpZZdy0IEJFshehujW2bgoBi1VWFezzkboRwPUEBws2SO+if
         lF2tOyhgbci6rDlssGDQgt6HG1Yztuw95tL7ifDRKBe007YXVmwYPpwkKP1wHCbaNYXk
         wxXEyaLnIWrmF4xFW8qhPJvm438j2HUojA58zg0FqCcl1UuZmNJpwrVS6Z7CCyW+Doru
         HeT6KyH3R4iSl0WilP66wMErxlBHYbxNlrphXlWFliW8IuiYHK/eIL/v7k+if8p/LWB6
         5N9JlKsd/iHuMdKKkb58iBBqcW5w3bAD1Af/vFS5CUKBy4MTIy4mIZ1LmijJ4v7VAeIH
         8ukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762450188; x=1763054988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnGBoNQVBZxwVRfJ0LF0mSQaz980+Xdw8CCz+AhE2uA=;
        b=h0BIANaBbCxUT5zTFTET6KeS2z63ZPj45Wv6FHvVjSXrHqBhASI7lnG/Lt1xuFoTvY
         uDaibPhqwiGhnwl9pYS3o2SJlqjrfx/5lABovZwOiDXaT3pFifSa5/zvcyjlp10Tuc9W
         IwmFkI1Q8HlouzqxMKrAreGKa+8bhnwt9J6BidEfWq37OnTLMw5K5GAuuerSroasC69g
         EU7NqycwYweXhOH8Va48tk+Hxi4HhrQVuLOaqsp0sqiEvmSOqRAQwCrzWhVjtNExfksI
         Tt7cncXEWbD6oEoOz/zwAu+aKwzdwchkc2eebvU0Kt0rflrtE9zaYBZRkETRmYg36tR1
         iWPA==
X-Gm-Message-State: AOJu0YyDr7BOXlpxWZsQyzorPemB7D4IE+9nqIXE9jXSTa3/G02myQap
	2kjmPT+Yl44+FTvOYrvkv7IXaAZhl1Dql/+9N095osTzQZ8AjmLUXCAz8Lkt//HE
X-Gm-Gg: ASbGncuGaGKoi6wdWkE5cC8taTtS1JOfTvQHWQoCbM48ohtXheyCoVoFKeqfVhNcqHr
	R2aD1BrKo2a65GB7M7Kwr25VDAa/rCYgP7gLB+wWAM6g99wOaUBpZbFoiyf0pSfFvVl0OublWjf
	yUlusf7fhyYGT7p+MaCZHxUP3RlRtM/eJTmYWyrKUoB8+x/Sq9uAyajIiM7wJo0Gk5WCieTuQL0
	OZP9sdfzDyRHXmC+B1h91vsdDU9dmXPwJafpDrlpwRjIheT2w/ZfCpqVOn/QPzc4HR7xpJvxfI/
	ZjN91zd9yPwRmDH+SBH4Q36mn9fW2hocJxhGw0gGiIZ/2rGK3zs1kjRMUO2sv01/W53TnwUTw4R
	Bb/dIait5Eb/qEndZwBF6LRUElKj7z+x/hxapvkeIY10rqBcmhHy6kOvb/6ZOWR6+syVgeBxvaA
	mJjshyiTs5dfGGLf08j7HxFZ7zsM6Cx6+9sQhgU0x2EyK/ScyIL8/AezuVUKNT44DX7mELoPtR
X-Google-Smtp-Source: AGHT+IGiHWrqH8aXfUCHiKOUo7qc1TKeeX+1J6hZpVIzXVnFUnopwQZ6AhY8rAjdj0M7JMoK+blNlQ==
X-Received: by 2002:a17:903:1251:b0:295:8c51:64ff with SMTP id d9443c01a7336-297c0442ebbmr3162875ad.29.1762450188056;
        Thu, 06 Nov 2025 09:29:48 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509682b4sm34081915ad.12.2025.11.06.09.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:29:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] mesa: Fix build with C23 implementing once_flag
Date: Thu,  6 Nov 2025 09:29:39 -0800
Message-ID: <20251106172942.2654398-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 17:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225983

This is needed to build with glibc 2.43+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 78 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/mesa/files/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
new file mode 100644
index 00000000000..e32a378792a
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
@@ -0,0 +1,78 @@
+From 6afe3c2ed510dd68d5bb3048a313cdd7b7eff5fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Nov 2025 13:32:52 -0800
+Subject: [PATCH] =?UTF-8?q?c11:=20use=20glibc=E2=80=99s=20once=5Fflag/ONCE?=
+ =?UTF-8?q?=5FFLAG=5FINIT=20when=20present?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+don’t build Mesa’s call_once shim on such systems
+
+glibc recently grew C11/C23 one-time initialization primitives (commit
+a7ddbf456d97, released with 2.42+) [1], providing once_flag and
+ONCE_FLAG_INIT via bits/types/once_flag.h and advertising their
+presence with __once_flag_defined. Mesa’s C11 shim currently typedefs
+once_flag to pthread_once_t, defines ONCE_FLAG_INIT as
+PTHREAD_ONCE_INIT, and implements call_once() using pthread_once().
+
+On new glibc this causes two problems during Mesa build:
+
+typedef redefinition:
+
+src/c11/threads.h:121:25: error: typedef redefinition with different types
+('pthread_once_t' vs '__once_flag')
+
+pointer type mismatch when calling pthread_once() with the glibc
+once_flag:
+
+error: incompatible pointer types passing 'once_flag *' to parameter of type 'pthread_once_t *'
+
+This patch makes Mesa prefer the system-provided types/initializers when
+available and only keep the shim otherwise.
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=a7ddbf456d97
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38272]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/c11/impl/threads_posix.c | 3 ++-
+ src/c11/threads.h            | 4 ++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/c11/impl/threads_posix.c b/src/c11/impl/threads_posix.c
+index 3b8692482bb..b108ba4ae0f 100644
+--- a/src/c11/impl/threads_posix.c
++++ b/src/c11/impl/threads_posix.c
+@@ -46,12 +46,13 @@ impl_thrd_routine(void *p)
+
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef USE_SYSTEM_CALL_ONCE
+ void
+ call_once(once_flag *flag, void (*func)(void))
+ {
+     pthread_once(flag, func);
+ }
+-
++#endif
+
+ /*------------- 7.25.3 Condition variable functions -------------*/
+ // 7.25.3.1
+diff --git a/src/c11/threads.h b/src/c11/threads.h
+index dbcb3459a9b..a6c6f38aa85 100644
+--- a/src/c11/threads.h
++++ b/src/c11/threads.h
+@@ -118,8 +118,12 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifdef __once_flag_defined
++#  define USE_SYSTEM_CALL_ONCE 1
++#else
+ typedef pthread_once_t  once_flag;
+ #  define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
++#endif
+ #  ifdef PTHREAD_DESTRUCTOR_ITERATIONS
+ #    define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
+ #  else
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6a36aea259f..4863a27949e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
 "
 
 SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"

