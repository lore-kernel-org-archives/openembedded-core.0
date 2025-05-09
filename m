Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC1BC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:03 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.1415.1746804240323475915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IlqQVbHH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7394945d37eso2071947b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804239; x=1747409039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5oYjdjFvboaYGSfx9sfQ9JiKG2ZmLAcaULEOcakGCc=;
        b=IlqQVbHH1Kek+MecKnmkJDzJ3lb8oc/8aFyQcPInZxAZ7E2hlL1L/AAQMpsqsW35ht
         nMf/swqmbyrT5DnK/+A4wx1ITrxYnghWYtqier3FGU8tQjQk3ogmZyczE36cvBz3NmGo
         7cLl+r2KTTs+BUDhn/W64GxqFL4ha+CNHSZ9YHEco8385V+N2ge2kubwPAMoDs9gLpnw
         fMuntT/W7Awv5afl7ZiXHmyxbaX41yV92oHDuZ6vGpNQcNWj5F7o5PFSlOhOK4ZwfFgi
         4fWRplkNYLmIfl8xoZ9ya6p6C9dVaZucr+EsEDS5qbguecujzYZbv89j9WJhwk0JHnLX
         dLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804239; x=1747409039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5oYjdjFvboaYGSfx9sfQ9JiKG2ZmLAcaULEOcakGCc=;
        b=lhGbj+I8RuaiU2nSaG0nJq985B9N+HpityC11p9sSdxWf2ZaZ25sLLHHmqbJjmbDy5
         pAk5gkNOyfyZ1Iy4pxT2gG+qmC71FqS5pRck5vJi9a3W1JYb80/0ZpJ26HKAdTu5Q7k3
         0m2Q3gi4xAxEAyIaODbvmVy5GIhqUeVN6scOISj4HNSdSvxFOpAHCyob7ybY9/V2PAbe
         uabUAi3S/HGab33Z4+AfWeHfD1HyPw5S8ckq+prQiflQqtZiKDFayC6rYeVOAdTx9YHJ
         HzCie/+xZp9d24nI5scZbDOtUYukDtlLoLlJ8ei30O6z26djOaQ3T6VEfWLl6P6dAb9Z
         L74g==
X-Gm-Message-State: AOJu0YwLefroo4V/6fKKCNZ8HX3Z3uU7TaSZE8ZEep0kbPwke2OJmH7V
	gDskWKXoiIPdZoINE5UvoK2JU56pAwkCEF8dnZG7xp+ZuOtYqMrN3UDpFDcM0nBJu2niYEmQiJD
	H
X-Gm-Gg: ASbGncvvNJuttMZGNc+HVBgIg5FZv3ZGQoH42j2YJPTn4ppYmXId1G51pMsNrm9Qtoh
	yTSuwDodD7A7vg28Sf9Oaa5V5fXLHL1rr4iHT5wdwmku02Fn5O2IYLw1ncEbcUEAhtH9VhMbj6p
	zfZ5X0/js9YnjRTZnwjc0E+kFC81CAZgJ+YD5Vanwu1W3kKJHWBWiz1dCllYifsZI6TLFSBFoyr
	2nKScshEc2nmPs5ldnzR2U/D9BOyFbjfcgax/xcxXrcczT2/hrWkVRs63bbNfSfjcy8YUpfGbIw
	tY9Dq0WXqF2SGz6r0QMe/sAyottCdyBn
X-Google-Smtp-Source: AGHT+IGYHN/0323HVqHUdfgiWOQX0py0fPDOsxRTVAawMGsHtUGKMZWuhTpjYF6PixiJVPY8CZt02w==
X-Received: by 2002:a05:6a00:985:b0:736:ff65:3fcc with SMTP id d2e1a72fcca58-7423c05b1d6mr5150925b3a.16.1746804239568;
        Fri, 09 May 2025 08:23:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.23.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:23:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/17] glibc: Add single-threaded fast path to rand()
Date: Fri,  9 May 2025 08:23:21 -0700
Message-ID: <09e2d663246d7335a9e33dd1a86dfe4630e4489a.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216213

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Backport a patch [1] to improve performance of rand() and __random()[2]
by adding a single-threaded fast path.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=be0cfd848d9ad7378800d6302bc11467cf2b514f
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=32777
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0ded4df5f2d3bb3319978d1a549c72f5daf238e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
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
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 71b89ac9ff..d707e1a677 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -53,6 +53,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
+           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.43.0


