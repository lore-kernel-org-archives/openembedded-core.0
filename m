Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1089CD98F1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5803.1781637429918866138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gdJuznNy;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b613a17bso45416595e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637428; x=1782242228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPxAZWgC7uofcUVEWcM0H3K66Ty/BR9NjfLmkFf9AKE=;
        b=gdJuznNycKimbEghM9/bvh6dUKyPMEGcYNqIEn7B2svIRpl5C9c84TS4DzuOua2NCp
         v9gq3qVKY4ZnybmSCZg/Y0kcDVlvcUOL4z/NpBTEIseWKLKwm1msj8Z+9gqhXunx38V9
         JsJ66nIBHrgBLkbxPlNRiF2LqJX5RbzEJpPv55YsKXbsxu4Gsd9GcfBDGrXR4D6TrYVK
         AQoiJb6yxWv6RvIMxuC3b8s9PUtAs2B8qcEwyuVIVt1eL6NaUZSNNMB9Jitpz/OU5PxL
         GlepjcRHN2skUVcEcAtO8ASdcr7lwyRYRegoNWvWmOviTAiwGY+govFua0NwITuVxkhn
         7BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637428; x=1782242228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aPxAZWgC7uofcUVEWcM0H3K66Ty/BR9NjfLmkFf9AKE=;
        b=R7Iytiwz3yhBU4+ChR4ZU7XRXFLF1kak956s66KJZMlinJ9O5w6FndSJ4ayxtBrZQh
         xHmUBw9s6b7cDxIuNZeqRXsb9MMy0QyAqAYlVXTqLkzedF5F0zp3fi3QmaGRU071PM+X
         R420H/gn69TflJEeNpeY971lynVOcdKs+RXXHeCLSbsiGDVBvwQ8zSFb/q/4fmudImmk
         5YgGK/pUa80Nr8zBxjnkBnciH7kg1o+ErjNrRFqjs11/blRtGvzmUajQ6UijVSjZfUJ/
         6tj5KbyM53mWZpzgiVMlXUMmFbaVzuECa0fWm3U5akLpZ/ZT1Vnt3mGWsIoWS8FOkrVu
         YMCA==
X-Gm-Message-State: AOJu0YwlLwT3+t9zdXdvuvzV00J7Le4kyveUMTgB/D0F7JcgLXHwi/Wl
	ky+rlG/orIlR6G51+GSjwm37L0OBttChZhg0X7l098CvnLhX+Dak9QwrDgo4zTtQ
X-Gm-Gg: Acq92OFSsJ3zTTYVdeZQTqTR8bHk8BAAaNxhwDoNtYoCqfrqhlb7HAqcFi1vWeWMbdZ
	UIfJzwUNHdgdmzRwi7Bit12ZH6KC2uaY5K+FykdDTMqhx/6ZAaUvpa49SQISFNlOC7HI9xPmbll
	SIXnRdvtchaRNJS/mIf3ltO7lt+dw+aZW6SGnBcDxs8/Vw869cSxJ2o7OwkXe+yY510t7FkMkne
	SbN9HmNgcC/KsZfg35SjkrZFrs6hll6IwJyio1t2EI/Ugeauk1KCdJFrUp34msfH+hyzE1PJCwV
	lMR2BDs5BRjogfqWx/RUPfbT1A9I4Qv7z7qzkimotRLabJr66FVRTR/fHHH871xBUO4mW+w2nhn
	1t3vPE05w7iUrQJ+tXLL0JqNamM82fy0zBQGn2Bb/1zZJcVlShrRNgZ1/C3UxCyX5NuI8XZs28D
	K6LgScgZaX4orICziJz+rYjalhxsisjf/B0gIuOIHRl3oY8+fHigSSliVCaj6hDGT2ibwH9Q==
X-Received: by 2002:a05:600c:8189:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-492333dd136mr15042245e9.27.1781637428002;
        Tue, 16 Jun 2026 12:17:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:17:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/30] virglrenderer: upgrade 1.2.0 -> 1.3.0
Date: Tue, 16 Jun 2026 21:16:25 +0200
Message-ID: <20260616191628.2014553-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238954

From: Alexander Kanavin <alex@linutronix.de>

Drop two configurations options removed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 57 -------------------
 ...uild-use-python3-directly-for-python.patch |  8 +--
 ...5fc57b07c06b5e0b3a3694d06898ebc80163.patch |  7 +--
 ...nderer_1.2.0.bb => virglrenderer_1.3.0.bb} |  5 +-
 4 files changed, 7 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.2.0.bb => virglrenderer_1.3.0.bb} (81%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
deleted file mode 100644
index 5f90d59ba7..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c076c52a323584d6d00ca7079072cbc0dd88cb43 Mon Sep 17 00:00:00 2001
-From: Dave Airlie <airlied@redhat.com>
-Date: Fri, 7 Nov 2025 13:14:56 +1000
-Subject: [PATCH] c11/threads: fix build on c23
-
-C23/glibc is now including once_init in stdlib.h
-
-https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
-
-Just fix up our use of it.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/3f0f775edb2df5ea54c37863286ad565ccddb276]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mesa/compat/c11/threads_posix.h | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/mesa/compat/c11/threads_posix.h b/src/mesa/compat/c11/threads_posix.h
-index 45cb6075..071faf79 100644
---- a/src/mesa/compat/c11/threads_posix.h
-+++ b/src/mesa/compat/c11/threads_posix.h
-@@ -51,7 +51,9 @@ Configuration macro:
- #include <pthread.h>
- 
- /*---------------------------- macros ----------------------------*/
-+#ifndef __once_flag_defined
- #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
-+#endif
- #ifdef INIT_ONCE_STATIC_INIT
- #define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
- #else
-@@ -66,8 +68,9 @@ typedef pthread_cond_t  cnd_t;
- typedef pthread_t       thrd_t;
- typedef pthread_key_t   tss_t;
- typedef pthread_mutex_t mtx_t;
-+#ifndef __once_flag_defined
- typedef pthread_once_t  once_flag;
--
-+#endif
- 
- /*
- Implementation limits:
-@@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
- 
- /*--------------- 7.25.2 Initialization functions ---------------*/
- // 7.25.2.1
-+#ifndef __once_flag_defined
- static inline void
- call_once(once_flag *flag, void (*func)(void))
- {
-     pthread_once(flag, func);
- }
--
-+#endif
- 
- /*------------- 7.25.3 Condition variable functions -------------*/
- // 7.25.3.1
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 6f0ba3ebab..6064329e35 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 51c8a5a568b2cd1dfcb53ed3b49a0f8899be7be4 Mon Sep 17 00:00:00 2001
+From b804697f9814c1beac5f2b9a9eb1dd9d04dfcd1c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 193ba32b..c01cae65 100644
+index 69c1bb82..08b1f266 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -77,7 +77,7 @@ flags = [
@@ -23,5 +23,5 @@ index 193ba32b..c01cae65 100644
 -prog_python = import('python').find_installation('python3')
 +prog_python = 'python3'
  
- not_found = dependency('', required: false)
- gbm_dep = not_found
+ with_host_windows = host_machine.system() == 'windows'
+ with_host_darwin = host_machine.system() == 'darwin'
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
index 91e01f0616..1aa73c4693 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch
@@ -1,4 +1,4 @@
-From 986b5fc57b07c06b5e0b3a3694d06898ebc80163 Mon Sep 17 00:00:00 2001
+From c0eeacaf2f3487cc3225f1b2316461eccdcf44b5 Mon Sep 17 00:00:00 2001
 From: Maximilian Hofmann <maxi@maxiicodes.dev>
 Date: Thu, 26 Feb 2026 23:28:58 +0100
 Subject: [PATCH] fix: build with glibc 2.43
@@ -19,7 +19,7 @@ Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/15
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c b/src/gallium/auxiliary/tgsi/tgsi_text.c
-index db7d7b952..7e37bf794 100644
+index db7d7b95..7e37bf79 100644
 --- a/src/gallium/auxiliary/tgsi/tgsi_text.c
 +++ b/src/gallium/auxiliary/tgsi/tgsi_text.c
 @@ -84,7 +84,7 @@ streq_nocase_uprcase(const char *str1,
@@ -31,6 +31,3 @@ index db7d7b952..7e37bf794 100644
     if (unlikely(str)) {
        *pcur = str;
        return false;
---
-GitLab
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
similarity index 81%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
index c7aef527b0..ed47563734 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.2.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.3.0.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
-SRCREV = "500b41d5c8638f9b80dd558f4044f3301c7457a4"
+SRCREV = "ca50e008863837e094747a69974dde3ae148aeaa"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
            file://986b5fc57b07c06b5e0b3a3694d06898ebc80163.patch \
            "
 
@@ -22,9 +21,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'venus', '',
 
 PACKAGECONFIG[venus] = "-Dvenus=true,-Dvenus=false,vulkan-loader vulkan-headers"
 PACKAGECONFIG[va] = "-Dvideo=true,-Dvideo=false,libva"
-PACKAGECONFIG[render-server] = "-Drender-server=true,-Drender-server=false"
 PACKAGECONFIG[minigbm_allocation] = "-Dminigbm_allocation=true,-Dminigbm_allocation=false"
-PACKAGECONFIG[venus-validate] = "-Dvenus-validate=true,-Dvenus-validate=false"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,libcheck"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


