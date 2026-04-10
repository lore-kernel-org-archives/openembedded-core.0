Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA6EF36BBF
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:42:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150630.1775803353603794662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mo4XOUx1;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so20178925e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775803352; x=1776408152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DadqxYmnAlwOmDqK5SLdNEQNPTPX6vNJIzI7dQjNTLw=;
        b=Mo4XOUx1HTA2cane/n0aJJ2RERSM/MMGIX3mBO08WI0YgdW1LdNLMMEpXWScXQykxg
         uy1Woy0F0pYlZrPVjfK2WdVEAnjwUGyLYNX/BomwDFubYat27Q8W1OMjwO3sBT/ptkJO
         uPVOH4HSMwjKGJjqsAVdL+JGFoIvx9UmOmiEfX2uwUbDB/wzfiamYFY6GmWUUXjEzpa1
         iMGRLh3sm7d3xbUjJ+j1myHKkLvqAcOmGEom+n1TLr6MmVDxCMvVATdrNGZBom7yCL87
         hkv7+J+4NBLbjCyaOfj8FLWdyp20IpIzuh3Ju8hUbdcA6XtQ5sDqFPKPoBqqcY+U9VTO
         GzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803352; x=1776408152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DadqxYmnAlwOmDqK5SLdNEQNPTPX6vNJIzI7dQjNTLw=;
        b=UuweAhwk54VAVsJSTl6jR1nAL4FPT9VP9wZcpn3FbSzE3/5QAxwgXTpwP0WNv9CwLL
         847Gg9rtG+jKPe2OyeEv7ivX1nua3knYdES0bwUhQk767Mk9jlILKjbH+m7MK6hwNVrz
         Ql7kxHJaz0Fpp2ycP/gvAco1ZuxLkUoPXGQblVZG0DsXS+bHRFB36+2u54zmVsZIQ/Mi
         Vk3BZIuXjd9T73JhoEQpqYsqeWQzxD35Oaj6Vwf4M9zoHSVnoZKIiUu0GENiWT9XyOAf
         r45yqTj/KUml5UvMV2ZfNjGxQb8gjGnvWYYewp5RunbDkOA5pGXlH57Q8ZVUO/pshF5t
         SxzA==
X-Gm-Message-State: AOJu0Yy44jOmRNO9afLioCCi/ks8TzGtKc+OpcmqlIOLwx4HMjDkT0a5
	tcIFj+AHnQhGC3M2Yw9bajJa2sYprjXSl7uSKF2SMJmfcpW5LuTjarJ61RUTUA==
X-Gm-Gg: AeBDievBNHmY3TbZaJhyz+mKmYpNgjeKkqsKwXu1Js6VsOxAXuiTZNMU3skg9v38G/I
	CylMZEPCM4h8MOJzU3HBuDysUjDfME9YvnCeF5K2Fqio6d1690mhFGg59w1pP2/saaVVkK77H4H
	y0EtVNy+3WARRXtWcs+c0y6eFE5w2maZVji59r1+GkRlq6+dXlQgSdQAR7J3czWjYe8TfTSeU08
	sqCduvMgRA4bXSk1i+P7EEtdYYIRU4HiPVfLwLIHfadYdOuBVlc3PPIUMd6WlK1GDdIEUxnZ8ki
	bUilaIfifoUcc590Q4VJCQTAVv/ZxAPorIHPGwPuCoezeL0q9RSBL0E6yA+xMr+JLhg81mRMVLV
	Y84opHKKfgE2X57dQAF0EbY727tni29AY7/+pTGmC9s9YjClfdpOkr94eWytLxU6XOnmqvwtN9r
	XJQJBvS2ZPPn0NRBxTRR+kHgzx6sCmdVIAAZzeGPUJsadDsYVTpMzORwJKfQnOzGUdfJfoAkdGL
	mJ310A4tw==
X-Received: by 2002:a05:6000:220b:b0:43d:30b4:1859 with SMTP id ffacd0b85a97d-43d64235cf5mr2690278f8f.7.1775803351600;
        Thu, 09 Apr 2026 23:42:31 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63deb904sm5453533f8f.9.2026.04.09.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:42:31 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 1/2] mesa: fix build on host with glibc-2.43
Date: Fri, 10 Apr 2026 08:42:26 +0200
Message-ID: <20260410064227.1596281-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 06:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234992

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-c11-threads-fix-build-on-c23.patch   | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch b/meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch
new file mode 100644
index 0000000000..f4de5e61a9
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch
@@ -0,0 +1,56 @@
+From 3f007af78283aea2e8c1a3addff7aeae862d8b28 Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Fri, 7 Nov 2025 13:14:56 +1000
+Subject: [PATCH] c11/threads: fix build on c23
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
+
+Just fix up our use of it.
+
+Cc: mesa-stable
+Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38298>
+
+Upstream-Status: Backport [v26.0.0 179e744f7577d98df7c79d7324c22acfb32a0154]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/c11/impl/threads_posix.c | 3 ++-
+ src/c11/threads.h            | 2 ++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/c11/impl/threads_posix.c b/src/c11/impl/threads_posix.c
+index 2540e3e0c49..f75774fc51d 100644
+--- a/src/c11/impl/threads_posix.c
++++ b/src/c11/impl/threads_posix.c
+@@ -70,12 +70,13 @@ impl_thrd_routine(void *p)
+ 
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef __once_flag_defined
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
+index dbcb3459a9b..c849f385e30 100644
+--- a/src/c11/threads.h
++++ b/src/c11/threads.h
+@@ -118,8 +118,10 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifndef __once_flag_defined
+ typedef pthread_once_t  once_flag;
+ #  define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
++#endif
+ #  ifdef PTHREAD_DESTRUCTOR_ITERATIONS
+ #    define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
+ #  else
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9157fe9c3f..eb23a3f82c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-drisw-fix-build-without-dri3.patch \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
+           file://0001-c11-threads-fix-build-on-c23.patch \
 "
 
 SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"

