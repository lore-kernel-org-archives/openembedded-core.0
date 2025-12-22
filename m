Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FF7E6B240
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88334.1766436301706169507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNZnei++;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b802d5e9f06so548274166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436300; x=1767041100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlrvCi0RYCsPjKuHtu2JZbZWf1psWuizmO8vULlTilI=;
        b=DNZnei++vSteSRvTA/k1b5sDB3X2mAsIQwkjyz+0tvNsEwNc4TPgZLVufxdixBZH3V
         8g52BPggCKeD9x3JbaErJzvQr6fvCYEE5C4kFFZBA0ssjZemhwFP8aq8aIyNEJROsCKO
         oMB1sZGo3dI0QwRkIfvRrjEBB3g9QHAtEGAuhLSWTXfp+0HWG8cnB6orGcfWlu3Q/t7I
         iRd5aTtM6bx5OJyjUcl994DxaTC11W9G+h3TAVTS1QUNUX8z22UnMMZ51D1Qujms58ss
         4zwxAQeUultINs3WBuYAYr6F0ARscr9IVs8sgW1KZBYbSCLhQwHWXFBkxW6FswImg3gL
         Zk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436300; x=1767041100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FlrvCi0RYCsPjKuHtu2JZbZWf1psWuizmO8vULlTilI=;
        b=s+1E2PavvUd81lgh96oS7viG+96rSci7xb/xQOrn89XT9MNLU8fX4KgUsCrBD8jsZZ
         nWuuWKQxlAZ/pLvYl6xAZ8BmwQNWjErXU9e6Wq3SGLj+6bFzRai4/774LZvwBjoq4I6z
         wThzJkgTMdpU+dhG7frZxHSSEmJrRuOdTRRib82hgzHCSpjCINjcta66Va0wiP+SV0vJ
         yc75vdJJDv5CikTGfEUEV2ahdP0XRt5k1S3IcVCrqKGPNDdMpvLLYdeLi1RLL9oxs7dE
         gBC3L1gk4GE+bbduMQ1DacMJvGjXKop3lWjSAnayTECAFJsisZJY1GDWmqDJVdBIZV9y
         fVyg==
X-Gm-Message-State: AOJu0Yyu9Ok3DF5AjXDIadAI07/HvtYKAQYcVaDBBg5mWZsXvkWQ2fgC
	iASK77m6FjqgWL6MrgDfrbhSZ0xso8lSR3siypi0sN0tfmUGAb1awnZRjYt0bg==
X-Gm-Gg: AY/fxX5epu8026ZE098eTqMtEK0rBTVmDcxNPG5ROL0hH/wWrbnZBubdAyV4zFxmY2H
	e42b2Lw8uzuNLRh3iTHWVsFdPUZrQNy1lybox9zUJ5ErQG40TnUDrqYhtmiT+ntFU+AhLQRnIyS
	qkAv7NT2UMsE5fjxzm3YsyA/Dh1bwv+MzJsYFKPywIcUQECYHclWJKWQsNjc6xdTPet/fjtEtPx
	uRjKF6eht7X8rv1/ESKghbKhvI6/i/lC7trEkvc+oGebKT/9n2bsFoi6L/v9a68KSuGtlLej3X6
	sHPin0PBiqVH0rVjA0gYfT9V6GH1el3tWzGQy4EOQ6yf8ndH9lWCgp5HqfyCxFjkSEDT6MshN3M
	0umBgfuhaT5eit97t/G/9QXq9rXWsqajFshLnNVdN/pNsZEXwJIuKV8SJRkLDzBRLSczvYF5zaq
	+1ysuYJO34WnLExXev03qVID0k2z2YDuhM7i9qZZZ41luF870=
X-Google-Smtp-Source: AGHT+IFOwqpv3GzSG0hk4cTLMFEyx7gK15CpoA8y/DTmBVY3CSgzzXPvAL08iT5e5c9IMZ01p4SxNQ==
X-Received: by 2002:a17:907:7203:b0:b79:c460:39a4 with SMTP id a640c23a62f3a-b803723a663mr1453853666b.56.1766436299948;
        Mon, 22 Dec 2025 12:44:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:44:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/15] virglrenderer: upgrade 1.1.1 -> 1.2.0
Date: Mon, 22 Dec 2025 21:44:21 +0100
Message-ID: <20251222204455.2284529-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228428

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-s-once_flag-ONCE_FLAG_INIT-when-presen.patch | 16 +++++++++-------
 ...n.build-use-python3-directly-for-python.patch |  4 ++--
 ...lrenderer_1.1.1.bb => virglrenderer_1.2.0.bb} |  2 +-
 3 files changed, 12 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.1.1.bb => virglrenderer_1.2.0.bb} (96%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
index 1740d7605f..b077bf2033 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
@@ -1,4 +1,4 @@
-From 179e744f7577d98df7c79d7324c22acfb32a0154 Mon Sep 17 00:00:00 2001
+From c076c52a323584d6d00ca7079072cbc0dd88cb43 Mon Sep 17 00:00:00 2001
 From: Dave Airlie <airlied@redhat.com>
 Date: Fri, 7 Nov 2025 13:14:56 +1000
 Subject: [PATCH] c11/threads: fix build on c23
@@ -12,14 +12,16 @@ Just fix up our use of it.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1567]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/mesa/compat/c11/impl/threads_posix.c | 3 ++-
- 2 files changed, 4 insertions(+), 1 deletion(-)
+ src/mesa/compat/c11/threads_posix.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
+diff --git a/src/mesa/compat/c11/threads_posix.h b/src/mesa/compat/c11/threads_posix.h
+index 45cb6075..071faf79 100644
 --- a/src/mesa/compat/c11/threads_posix.h
 +++ b/src/mesa/compat/c11/threads_posix.h
 @@ -51,7 +51,9 @@ Configuration macro:
  #include <pthread.h>
-
+ 
  /*---------------------------- macros ----------------------------*/
 +#ifndef __once_flag_defined
  #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
@@ -35,11 +37,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  typedef pthread_once_t  once_flag;
 -
 +#endif
-
+ 
  /*
  Implementation limits:
 @@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
-
+ 
  /*--------------- 7.25.2 Initialization functions ---------------*/
  // 7.25.2.1
 +#ifndef __once_flag_defined
@@ -50,6 +52,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
 -
 +#endif
-
+ 
  /*------------- 7.25.3 Condition variable functions -------------*/
  // 7.25.3.1
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index f9080d53c5..6f0ba3ebab 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 9677f66a240a0513623aa26b47233b49193d0402 Mon Sep 17 00:00:00 2001
+From 51c8a5a568b2cd1dfcb53ed3b49a0f8899be7be4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 10be099e..3bb6eec7 100644
+index 193ba32b..c01cae65 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -77,7 +77,7 @@ flags = [
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
similarity index 96%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
index be4385ada6..df8473dad2 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
-SRCREV = "0f1f43929724a6a414c01a29bc51feccb445c2f0"
+SRCREV = "500b41d5c8638f9b80dd558f4044f3301c7457a4"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
-- 
2.47.3


