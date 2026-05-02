Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA19FCD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9475.1777739401196542042
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eNwijly+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fe62837baso1456608f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739399; x=1778344199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJIsBRO3v4APlHNbWDayXSpjAg01mY+m4+ntmW6AJsw=;
        b=eNwijly+k5lepLx/Q7n8ke09lQAjGDLA/QCeg3GdyfDSiJzX6CnQGFwO70NtE48n+N
         LdF/60gPrtlznYpsjPAw3qzKtWS7qDX96iUH+jiKp9a2CnSI1Uy24ipiZLsx2+1ZOHyl
         jIOq5uv4SueYJh6v2uh2j8pKMk4B/dx+oCzZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739399; x=1778344199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RJIsBRO3v4APlHNbWDayXSpjAg01mY+m4+ntmW6AJsw=;
        b=he978tf9mrdh4cORSp21eUs5y4F7Czsy9DL5HNpQLG6HH3MRM8b8x5bx0pX6ULJqGV
         kpPXFoKbMajZfqfws5Ukmdg6PyVCG6uXwADoNcISRsh0+W7FLjxDV2dWproZPj1S6gEX
         ABxw7T835YggvHPPLnUelymeyJMqeJBya53saAh/7YYpyAPwZg647DrKClGty9bardGH
         yufv09b54u1+eYkCRBVfacjTRZTeKql8kHj7AhG1q3AqkE+uHimsIE585Vcu5vAV3/po
         HOmTqtKVxjeGn+vA9mVWtl+SpejdGoZwR2y+bmdeohWbFCc7zUD4DmV45mV2tzvxATzJ
         NddQ==
X-Gm-Message-State: AOJu0YwZSwetVTMA2v2tfW55ym9wYQhM7bU9AFzNS8kXtA869ckFnTW1
	8D25uggeSK5DDzd3BDTyHmlfqbNPHdNckayJTQ21my6Jydm18dZBSinb1lvWqaUqYY1cS/JRMGP
	GKqUMy6yRwNyUNVhq203ASUGVOSqFxXQyX0vX2XTV3gQLmwyoXZDi9eK8/ZXwqUFwiiUP95lPfI
	U/Of7W6wOuSW0820I=
X-Gm-Gg: AeBDiesFbAPVvnIbEOSIeK3MIQa9ze8u3JANic91pa/U8SEu2X9PcTGcOl1oiFW2MMt
	58pm3ivzvswK1KwX/ddk4csxXcUkoYHpam1FiASi8SPrbSINazvoS/vKhBjXQ0l8pdNafyNdbeo
	Nd2uiSlORjFW/ZYvfBpGcqsV8xNIjRnBLL3+5RAy33gdFC4xUDkbax9C3U0PkKne7lXgBOGzv3N
	48qGmfnM6+yAvCKbbtUkNThZQCI0CUV4jJVWkurUmdxroLPcJhNDR1VWYPBNU2BME5r3CblwY4r
	ltOL54tY1Zy+pi3UH7rKFuiTAZ++YZW/RxlQJFg1HfTnzVRczt+p1dbczpE/K8/VQ88GgETL+Iu
	vbOFPEduT107sbTtUfLvYRGlpd+WaBQix1ZnFes/wPwcj/1+73LOyeUTwKfeSmvES1aY4EXmQyK
	mpXnV0bD3uq0Zr1DOkg8K0tW9U79L8ffQmJtVVPsxWjDdzW5ZsEsoQMmaieWnXC8s=
X-Received: by 2002:a05:6000:2910:b0:43d:7ba4:6b5a with SMTP id ffacd0b85a97d-44bb63f5791mr5366837f8f.22.1777739399198;
        Sat, 02 May 2026 09:29:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/62] libgcrypt: upgrade 1.12.1 -> 1.12.2
Date: Sat,  2 May 2026 17:28:36 +0100
Message-ID: <20260502162929.1377831-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236325

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-libgcrypt-fix-m4-file-for-oe-core.patch      |  2 +-
 ...001-tests-Fix-link-errors-for-t-thread-local.patch |  9 +++------
 ...kefile.am-fix-undefined-reference-to-pthread.patch | 11 ++++-------
 .../libgcrypt/files/no-bench-slope.patch              |  2 +-
 .../libgcrypt/files/no-native-gpg-error.patch         |  4 ++--
 .../{libgcrypt_1.12.1.bb => libgcrypt_1.12.2.bb}      |  2 +-
 6 files changed, 12 insertions(+), 18 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.1.bb => libgcrypt_1.12.2.bb} (95%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index e60507e6367..9f4baff00f2 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 3bc536529c9bbe1e62d1c1127abee6183ed64298 Mon Sep 17 00:00:00 2001
+From f78c2dc171ed1f84260f5d8cb38a1c9e42550065 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 8dc2fe328c1..cbfa6af0ef9 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,4 +1,4 @@
-From 942e232ded48fa08d2bda417ae8ad8c03d644372 Mon Sep 17 00:00:00 2001
+From 9b6967df2ebe1824204ad0875352f44878a3a9c2 Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
 Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 4800135..f0f7adb 100644
+index b5ad74c..b7de27d 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -98,7 +98,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -102,7 +102,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -33,6 +33,3 @@ index 4800135..f0f7adb 100644
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
  
  # Build a version of the test driver for the build platform.
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index bbd48ebeee3..d57e055b5a9 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From a3496435dcc223a914eec5e61e853934fd4eb635 Mon Sep 17 00:00:00 2001
+From 92f5bf2a511bef2d38413736f6997b9627f15f7f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Aug 2025 11:46:17 +0800
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 93daf3c..4800135 100644
+index 4f42925..b5ad74c 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -96,7 +96,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -100,7 +100,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -26,7 +26,7 @@ index 93daf3c..4800135 100644
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
-@@ -117,7 +117,7 @@ else
+@@ -122,7 +122,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -35,6 +35,3 @@ index 93daf3c..4800135 100644
  endif
  
  # xcheck uses our new testdrv instead of the automake test runner.
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 606cca1344c..988f9044c01 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,4 +1,4 @@
-From 254821a620c1f7d6542c23dbe555e7c02637a3f8 Mon Sep 17 00:00:00 2001
+From a4ad0acc649abaaace2940a2bdb88fa56836b3bb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 9 Sep 2022 11:13:37 +0100
 Subject: [PATCH] libgcrypt: disable bench-slope test case
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index 98874ce12a9..9c43669486c 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,4 +1,4 @@
-From ede03b847038afc294e206ca345d12d75bbba844 Mon Sep 17 00:00:00 2001
+From 2068315e64c8e1b887643a383135d2443a373379 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 26 Aug 2022 15:23:37 +0100
 Subject: [PATCH] libgcrypt: rewrite ptest
@@ -13,7 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index bfca4c2..634b718 100644
+index 7743258..bffa3cc 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
 @@ -32,7 +32,6 @@
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
similarity index 95%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
index b3c0d050b7d..1eb6c472a35 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c"
+SRC_URI[sha256sum] = "7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 

