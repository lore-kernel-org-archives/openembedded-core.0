Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B13DD2F7F0
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 06:18:33 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.42446.1729145907096232283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 23:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y3U8rNG7;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso421403a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729145906; x=1729750706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVk11ovmS9WvzFidYSOtin0c8eYSORKY8iQD3DkBlZ0=;
        b=Y3U8rNG7jSEbL0/AQRSBZk0ShojHg0kkilk6dQinVgEzflshoXxJrZPfkL7AaOLv3Z
         cmcfOJ5jjDbD3nx36ZCOAO7EgH7YX56/Sr927rho1F0GheXySs1+sJ5/lJfRboUuPfls
         1+sqBFyGAVMMCbrVG9NAmfwatSXRDXZUQaTHBqyEENhCY5F/ILUMbl6tRkZf3Y8gHsek
         VcCcmEclOvi2YOg/wzCRgwOqn06jjlGyT6Ge9+fU87gtIyUC5s1ZsVBgF+cCoLKigCAm
         RITcympfr7kguuLYuJMEJbgZR8xA9U6rJrPmHzOFW4i5KKvXBNI7NaGxXIArfXOL86mT
         2LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729145906; x=1729750706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVk11ovmS9WvzFidYSOtin0c8eYSORKY8iQD3DkBlZ0=;
        b=F17OORu+Ty2K1vKYT7VZbkZczFOsRrXtzHyeNq01KA7kgdpCEaCatUIdln5zmcc3cO
         ke5TmerooedX1Tb83MHj0NlmxT/7cdspmqMmOXMG8Zq5uKL4X6ZRzFuse0EhRgymt+Fn
         vXbZxD5mueuIEY9iXW0dsu+GLv1BXA3GmBhmcXIwg5nGpV2AE7ySMMpTO8Qyi9p+Je5W
         gxNSf5wYb9ROWmmUxyXpETQhRKkf9OF+IE9WJfPRP3XCL4XHXthsQ0Ahl/exv/fQNh1L
         FDyVOt2pw0L86zsAxFI2N6IQX04j3RPGnzSvr+Hkb/gn15sSdhltAeqhER0/UT6VSe2s
         6/3A==
X-Gm-Message-State: AOJu0YwxXVAEvt0kYgWuj8YA0rph261M3/Btcdi2JOvu4MlwR98R8oZG
	zglzcW38F3X3f+k7/7EErcVyvTqqZPG2aoQ7bBcvV4cQ1k7VFIk95nTtG9q1
X-Google-Smtp-Source: AGHT+IEys2j3zxjXzHkPxN5a53Vk+PpURJm8UhNsyo45DcuTqDFrC9kGJwPfs7yVLUAlntkk3pbTUQ==
X-Received: by 2002:a05:6a21:3482:b0:1d2:fad2:a537 with SMTP id adf61e73a8af0-1d91c6b9d9amr2923783637.18.1729145906159;
        Wed, 16 Oct 2024 23:18:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6310])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e84982905sm2145336b3a.96.2024.10.16.23.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:18:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to tip of trunk
Date: Wed, 16 Oct 2024 23:18:23 -0700
Message-ID: <20241017061823.1108832-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 06:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205983

- License-Update: One of COPYRIGHT holders name changed [1]

- Brings these changes

* 047a1639 sys/stat.h: fix typo in statx member name stx_dio_offset_align
* 5be920e9 s390x: don't allow br r0 in CRTJMP asm
* 2fc56aaa update contributor name in authorship notices
* 43664364 fix compile regression in exit on archs without SYS_pause
* 6d8000d3 abstract missing SYS_pause syscall with macros
* 23ab04a8 statx: add new struct statx fields and corresponding mask macros
* 4ca8c267 statx: fix uninitialized attributes/mask in fallback path
* 251cbb63 statx: fix ENOSYS emulation not setting stx_rdev_*
* 8c43c562 sysconf: fix _SC_MINSIGSTKSZ computation to match kernel interpretation
* 300a1f53 sigaltstack: enforce dynamic MINSIGSTKSZ limit
* 572a2e2e printf: drastically reduce stack usage without [long] double args
* c94a0c16 isatty: don't collapse all non-EBADF errors to ENOTTY
* ee18e584 printf core: replace if(0) blocks around switch cases with explicit gotos
* 06a96470 iconv: add cp858
* e1b57ede catan: remove no-op reduction mod pi and unused code
* ca4e632d remove incorrect comment regarding powl exceptional cases
* c851b268 strerror: add error strings for EUCLEAN and ENAVAIL
* 9c78557a use hidden visibility for C entry point function _start_c
* 882aedf6 fix lost or delayed wakes in sem_post under certain race conditions
* b09e3174 m68k: fix POLLWRNORM and POLLWRBAND
* 2de6b426 fix missing make dependency for Scrt1.o due to typo
* cde213f9 timer_create: replace pthread barrier with semaphores for thread start
* 9ee6f104 atexit: fail rather than deadlocking after last handler is called
* 8cca79a7 exit: add back lock to make concurrent calls to exit safe
* ef7d0ae2 move __utc string object to its own translation unit

[1] https://git.musl-libc.org/cgit/musl/commit/?id=2fc56aaa9f660ebd735d1595c3501b792af42eb8
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc    | 2 +-
 meta/recipes-core/musl/musl_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 9999b4d2d64..13f51bfde3c 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b03f1cc25363d094011f8f4fd8bcfb68"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0c2904cdc34777fb4067732bae145506"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e3a8dff7d5c..2ce16d041dd 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "dd1e63c3638d5f9afb857fccf6ce1415ca5f1b8b"
+SRCREV = "047a16398b29d2702a41a0d6d15370d54b9d723c"
 
 BASEVER = "1.2.5"
 

