Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2606DC3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 16:17:34 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.2681.1746807452244739560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 09:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xJxVihmx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7403f3ece96so3302420b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746807451; x=1747412251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef+9j9PmqsQf+Ixv/CUmDOJAN0T0DcjuzjNlN0F5neY=;
        b=xJxVihmx4q1td+cgY5z8VFdCUv/2Ubvnubdq6UXl7UBeMLFPQWrl1B41AeuZ0GX3/t
         XLg40ze4Vdh4VvUKVXovB0Uv9GLxTaIZ43OHxI+J4xYEHPC3P7lZdoxLuPRVyoh6g2uF
         R3V/kkwvYGP3d9Ifx6rT9D90FWbWj+1fbf6pIPb2hfvG5DWBVG2jWS9eZYy36KbWdiDq
         hWTg5RhjHuuXV7u5N1z4y3eVwN7bvo3AQg9iKHW9o36xgMrAORLbjg69jvmrDzarvNRx
         p8hNddASF9jf7Sp9hcLrD7QdEZHmD2xJcO0nqyKRTV8cZKIrdHyLiiijU3dCZMy9uAoO
         wSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807451; x=1747412251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef+9j9PmqsQf+Ixv/CUmDOJAN0T0DcjuzjNlN0F5neY=;
        b=xCrdmb49EG5et/Bc1xZEMfLMCZY2vuMKucV4inaqidyiWge416+Rdqv7lVyK6xysfS
         tGQSfqd6UFsxDAcBQnci18SjWwykfeamfPEPAhl5a61yZ5earMnWJKj3uLRGX2piNYJV
         8Aecf5/uSICSWtwDwLLjjg7PQcXNDH7O2clsM4buNJ1iTiQd2jnl0oobkEoBpVrIGs/5
         OgjUIiZAsU35e5FlnkaEeVHnNV/CaxMfLQp+6Wm42wFhD+kAEfdlheV4y/lPaWDQrZgJ
         u20ntb++OFJ37xoj97WFpr+/uVc0ib08GYvZf1DqB5HQExE5xL83bg9G2w/0rc2DBDIr
         6RGw==
X-Gm-Message-State: AOJu0YxZAoRP+hZyPfVo+ijzTageg7xJqIzGXYk3IeiFn2EbZj2b2ovc
	8cHkhnNnVBUp70F2dcI9QiI8jUPXoQrtXnqrb9DMOa4tQe3bx9pgIt2Oc108GSfg+/uhtmnofK0
	A
X-Gm-Gg: ASbGnctvENnnomYv5UUZjfWA6rNkSLVa1blpdKIidvkii0dyFE0wk/fIZA6m9o0bi59
	rBviDgkH/IHBmSIRHovtsYj2RceUF2JweJ678cDtVNQSUQ5GIWQrGP75QWZgjQZrGP1LMOU9Zme
	nEr8bWDoAcN5oMeMsD7XZHz6vDf+vazurUlb9AnYSY95O+NHL58piIcVF2VeyP1+BuJDcIylZXf
	RL0gakcdmSuhM4iH7l4/0Jizi4QJqN2BZyNXuR/rkrqzBpVRuLNmbqFoN7/MPKVbMUtnss5fFkt
	zLJhobDkYJS6CycU5EWiTmeOznPzTmj2
X-Google-Smtp-Source: AGHT+IERggzkO+JtR7WXa/5fR3Rm/cYfM/psf++7N1hIcHoXdVYMuHSs2YSInvKEsFjf8cZ8dzct8w==
X-Received: by 2002:a05:6a00:1254:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-7423c030959mr6485367b3a.24.1746807451337;
        Fri, 09 May 2025 09:17:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377050fesm1919134b3a.24.2025.05.09.09.17.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:17:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] glibc: Add single-threaded fast path to rand()
Date: Fri,  9 May 2025 09:16:44 -0700
Message-ID: <00f7a2f60dd6de95a1a47fa642978613ce76dc56.1746806788.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746806788.git.steve@sakoman.com>
References: <cover.1746806788.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 16:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216242

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Backport a patch [1] to improve performance of rand() and __random()[2]
by adding a single-threaded fast path.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=be0cfd848d9ad7378800d6302bc11467cf2b514f
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=32777
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
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
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index d9cae79ac2..9073e04537 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -65,6 +65,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
            file://0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch \
+           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.43.0


