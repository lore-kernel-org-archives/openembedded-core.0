Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7817C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.6965.1744145490779593218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KhiweKwL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2254e0b4b79so75274225ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145490; x=1744750290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef+9j9PmqsQf+Ixv/CUmDOJAN0T0DcjuzjNlN0F5neY=;
        b=KhiweKwLvxthq2EMd5pcccdWrYjraN6KzXXWXIM9NY49iK58wr0pzNsZlZz2GKIC4M
         XjMorl7bFQ+GlChvfajAi6jO8iMJEXWUlI5CvhNPW8XgcJ0A9dFk73fi0d9iqm8x1Huv
         20NFDb/DTj/mYF9sZa+TVFVd1tCOKoTjJkyYZp3cUDjvQwgKbS2Zg0rfhiwsVaCGq17B
         bckLX8m9EikmA6/MBSxyjZV+3IX07FhR8R0rknmaPMx8l/yrsQt8Ura/ZOSb69JxKhjT
         X5rSvxBYdjQfTSCs6YNolaiZH5mAALLIYx7qLqpmOJNYBi+jTQeGzbJMSXC1sHROYxwu
         iM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145490; x=1744750290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef+9j9PmqsQf+Ixv/CUmDOJAN0T0DcjuzjNlN0F5neY=;
        b=PaLnOL1uWJa3Yg7SzS7LPhbL8FFiB2kfT6YDJW6DEGTrA+065Oqcna3obi3tFdoYvH
         YWWM5Xu6rgTuszkSRtHXxdns2b0BACAfz4c3YP0jwIoKdOGbf9CLvPHDLZJ7hEoOTzmW
         988bboTMVnEafMh9qt2GxIVCd7KbDAWB8TmHS9+Hdm0J/v/DL78hKwLMrZuHCybhYd1z
         K//m1q7WlAo6sBPrLls8zM8W4QLSJy4WDrPaYC8yDomhaVjpgSf+SgcRInj89N9T4pGm
         oY2tWDEkQhk9+7YWjrfcVKd5hhNLHN9bwlHha5H8u1NaUW5+3Z6thrlTfqUacW4y3sWh
         1cVg==
X-Gm-Message-State: AOJu0YzlnfpYub6LhNxiH/lPBO6m4tM6qsd1LSTxIwUpcgy3pNn83uDt
	IH3DxkTy8l4oq+VVaJmHweNs+PxT6ehT3lwruKiZg8dm9xNOE9aP/WmHYjANeUIZf9kcmhnQ6pO
	R
X-Gm-Gg: ASbGncsDvw/dWbQGaT6/NI2PbPJRcgYZMccKhs8ZdeF+farYPG/6CdXxp7zShJH7opY
	kJgSA+rsVMx4A+8Z/SqZAEhBEcRA9Anm4Ib5e66lmvx6y0BdxpfT1uqhNGwnsBv03gqpBfg4pcZ
	oqU0U/DiCw3LNpTBT2JkbJD32bwPjRmuH+O33vwnIcSXjFIko07m7B4PU1UFrY/siUIuOp/cff3
	BDwUWy56HMuL0TJdgH3Vse9AQcKYLtRm/ir5Wq8VOBgePHlSReZu2wa5o6A4EsuXqN4M6hWgxjv
	vUorkQLFM2YU5ckmHk9ui2tzvDGc5wQtvfqv
X-Google-Smtp-Source: AGHT+IGBCaMgAeIqA2fK6MG5rlcsDdThV87XUwkUyiVYQB4oV0e/mwWs3LD+uf5nnY2OVE2azwPZxA==
X-Received: by 2002:a17:902:fc85:b0:224:f12:3734 with SMTP id d9443c01a7336-22ac29b52bamr10114125ad.30.1744145490029;
        Tue, 08 Apr 2025 13:51:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] glibc: Add single-threaded fast path to rand()
Date: Tue,  8 Apr 2025 13:51:06 -0700
Message-ID: <19fcc012160c6b8782be0e6fc54797c88bf084ba.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214565

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


