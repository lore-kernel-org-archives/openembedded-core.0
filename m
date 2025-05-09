Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7D1C3ABCD
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:46:33 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.1944.1746805585153563942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y7to0pNK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so1288145a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746805584; x=1747410384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J7KFf5lggbjXtsnvRTWvuoRxacgrKZtUq3b/b2K4gk=;
        b=Y7to0pNKBB8pAu83SoNo83wODXIXQZiA0e7tDyLF7ylKZn242E7RF5XexZdeR0w4af
         lSji2Now9YlGIUSHaqsoSFDuQ2J7XipyaEym03P5MZbk7Pag9I6wU4/5IA+nJRbiVqJ1
         YLaSf0WBVE/TlWHCqAyPch7jBcueGpVi8DCx26C979gGOshueOlMpx4d9XGSQ4vw41Tb
         VoJorDYBAIdhkUiziP0wR+uotzjZG9ueE3rX3I09u2Dpbt4dwUGKxJmWfvEwf8ferUOG
         ez3ND3bWoR5ND9Ld7OiWhNB103RigOx3372+HFRhKRHuc6E7pS18dclEEsigNODzo+oc
         AyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805584; x=1747410384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J7KFf5lggbjXtsnvRTWvuoRxacgrKZtUq3b/b2K4gk=;
        b=TfBEKaE/xquU1HoER/gHsI6F82v3TYS/hJmkx9TT109Hwv+gayul2iVbMBY22KjrxY
         5k2CZ/z3k/vtPgNvtzq2Gm6jBI4NQUmKdAFT/YN1uPcQhC2V48np7ecU0bFAYZfoWguE
         55SJNRol+QzrYwcEUsIN9RUYtwqE1b2hQ8U9xnJhA7Fei6I2ELhksVeW8d1bjZ3gcQaK
         9ZQqJR27zzMXcs5EICRRvc3+hyBdU39k3taisvDMrTvusL5MmY8G4do3Zmfg9bkY5JCK
         oXmuXLOsb8SPY7sOGNHe0ZWYpMaa0JD13ZHVAW0KEh2+f3U8Wzm+InYH1yrWMQOOSV9e
         LgJw==
X-Gm-Message-State: AOJu0Yywh7LeQ84i5aaIhhbv6HGgSWVf4mFMgZbbXUe1/p8nVltTfWKu
	oCAHdlfCSpmfDfMALUvRVSfFPKa0r9OU8aiw4+5n1PgfvmyQ9eiP243GyCuZOiIkPuuyl1Ck/p1
	B
X-Gm-Gg: ASbGncubnJW+bHVkOn16PMQTff2PnJqnOkeA83BSkobLI+OClz+lRR12DSA4kcvydxb
	oD3FqT/d8feu4Pvu+VYue4Ya03/xoUjnAORd9JHnIZ4l4DpX43jhXPv58BnaA3s93y8M+L0PYQA
	x01lY19mDcSW1DsTGqrCwYFDeF9MNGfFJUFoxL49vP9jfTut99zfGVN2yZRAV6zkCQc/IqPMlrk
	ODkU2S8qvpiazkvvoCBW6KPUCgcyFu0+ezy9v8GL3JowEnUHeUGLum5/lGwfwAYj6QvUHSvn/tG
	7umFufJFVNEwBsj+XeUIOzLPCtnK7bWhMiNnF9v8oQw=
X-Google-Smtp-Source: AGHT+IEicfcsNe8AtBKGxWjF/g3D6syx07hRf/bmtkb2hBcJcN7dokBjg7+aUAwgfLVyQOvvzDSfwA==
X-Received: by 2002:a17:90b:4c89:b0:2fe:7f40:420a with SMTP id 98e67ed59e1d1-30c3d3e8b69mr7573721a91.17.1746805584395;
        Fri, 09 May 2025 08:46:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dee9aasm1983093a91.25.2025.05.09.08.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:46:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] glibc: Add single-threaded fast path to rand()
Date: Fri,  9 May 2025 08:45:55 -0700
Message-ID: <68ee8d16fa5419acba9111d3aca285be92bd93d3.1746805404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746805404.git.steve@sakoman.com>
References: <cover.1746805404.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216234

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Backport a patch [1] to improve performance of rand() and __random()[2]
by adding a single-threaded fast path.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=be0cfd848d9ad7378800d6302bc11467cf2b514f
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=32777
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
new file mode 100644
index 0000000000..736fc51f38
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
@@ -0,0 +1,47 @@
+From 4f54b0dfc16dbe0df86afccb90e447df5f7f571e Mon Sep 17 00:00:00 2001
+From: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Date: Mon, 18 Mar 2024 15:18:20 +0000
+Subject: [PATCH] stdlib: Add single-threaded fast path to rand()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Improve performance of rand() and __random() by adding a single-threaded
+fast path.  Bench-random-lock shows about 5x speedup on Neoverse V1.
+
+Upstream-Status: Backport [be0cfd848d9ad7378800d6302bc11467cf2b514f]
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ stdlib/random.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/stdlib/random.c b/stdlib/random.c
+index 17cc61ba8f55..5d482a857065 100644
+--- a/stdlib/random.c
++++ b/stdlib/random.c
+@@ -51,6 +51,7 @@
+    SUCH DAMAGE.*/
+ 
+ #include <libc-lock.h>
++#include <sys/single_threaded.h>
+ #include <limits.h>
+ #include <stddef.h>
+ #include <stdlib.h>
+@@ -288,6 +289,12 @@ __random (void)
+ {
+   int32_t retval;
+ 
++  if (SINGLE_THREAD_P)
++    {
++      (void) __random_r (&unsafe_state, &retval);
++      return retval;
++    }
++
+   __libc_lock_lock (lock);
+ 
+   (void) __random_r (&unsafe_state, &retval);
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 8373db2c4f..e4e2a766d7 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -53,6 +53,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-qemu-stale-process.patch \
+           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.43.0


