Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F79C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:36:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.62.1743546995562699834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HQa6pVE9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-226185948ffso118420475ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743546995; x=1744151795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef+9j9PmqsQf+Ixv/CUmDOJAN0T0DcjuzjNlN0F5neY=;
        b=HQa6pVE9NjOLVvSA6woOaTNa5aKh9xBRMxt0Jaf7rx8YLNXn7hXMj7HEdVB0WK7CUc
         27OZo78fVLlzSBS9S4IyAyJECl5gfn2oRPt2x6NmjyNHqT/E21I0azcXHf/eThY4ivS8
         qiwxyqX/mzes4es7diXReYafrbzl9E17HIc1SuGUoMAZXec08BhNFPnY6bVNryIefz0X
         EhlR2f8L/ssursuvNw10vcZoVvWDSRcs1IaSRVg6ziMtNhLN+F2vrc+Q7cRTCiX/MPmG
         r35JsBwGJxbuJ87Hk98gYslsHOPR7WhwLC6UyrSrRdzf49pYass1GLqdNS4JuQmIhWuQ
         4uwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546995; x=1744151795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef+9j9PmqsQf+Ixv/CUmDOJAN0T0DcjuzjNlN0F5neY=;
        b=X+wITxKGcnVg59sARRxwOWKNEWyBLG9OxIzFBXJFsil/ce1buM1f57Jdeivn1UH5ch
         dqIdjMSNb1YVjUk7c5IAp7WUsZ7YkFzpObh4MjX4uYn6BwDLjUzQ4k4huUbgLJHE2yvT
         CMl0sNsX4NBVb/4CpQHTf2SdyZOhemXJWfiFh1VkuILkCE5roLJU1wvsAYccRHIMyvsN
         Krc1l14hcIkFTrR5Xx3XwOGji5rLR8lMRIE/r7Fhewd7Cn5TdSdLhQxkDTbRNLswIm2t
         zRdBIjP6b0phw479QTYjqBDRw/M5rUjAaLiP85n5+yd1w1ap60dmLLZKDv5W6P8StD2P
         r0wA==
X-Gm-Message-State: AOJu0YyfT8as21+T5X8mNWdWmzwvsGEmx7GM3eKVFmTJnulbr8DtzUgh
	TBqEstMaUhcVZwUI8At4v+47VbGk3IGnjbTrwuKJm5RwC3jiWYtNJyVDbGcIhoS25FVAARvdgor
	1
X-Gm-Gg: ASbGncuwHXZHNWEhG9BiyC8uis4hwjIdLXfMQ7W9djLTUSuPF+ir/hy5yvKE9V8G9oZ
	BN02xcS3DABccI+UhbTED+O4Se6O7flmCXeoaoXFK64GEbh46UTvczOe0svd1C4sFby2gmFIX0n
	xuoElNnwmAPo3SuRwgXzkYQDWu1/eAgFJP7UG4pwl9mN1ALQzWjuvFpWYMofSuAYvaAs67t7H/A
	+9LaKzX75p/58up0oGcDtR2o+B80WGKtwIltLkH+eppX1aro4m3nzfVPYXfbAf6wvdw9wGgcnDG
	UDl+dzMbcWIn5l6kJ1MmJ0u7QWYwPW6cbxhy
X-Google-Smtp-Source: AGHT+IGrfz36nByO7vJnDt3M9dhU4PUOTePpUiIZmlvuKWkuHH61i33GAHHz7wMHyQLc2kByNMPKVg==
X-Received: by 2002:a05:6a00:3a11:b0:739:4a93:a5df with SMTP id d2e1a72fcca58-739c78b093bmr520670b3a.12.1743546994717;
        Tue, 01 Apr 2025 15:36:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm9534241b3a.48.2025.04.01.15.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:36:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] glibc: Add single-threaded fast path to rand()
Date: Tue,  1 Apr 2025 15:36:15 -0700
Message-ID: <0c99e9e0d1c848d10abe0527e5aa98f2a0750b2a.1743546795.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743546795.git.steve@sakoman.com>
References: <cover.1743546795.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214160

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


