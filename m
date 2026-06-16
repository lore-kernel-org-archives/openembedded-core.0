Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A322CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5762.1781637418990871797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jumuYxLT;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b7866869so50287915e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637417; x=1782242217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3rVq5YCm9NuXnpDsm2ySNhuoK4QCyxMrM4l8v2HTC4=;
        b=jumuYxLTzxLm2EBqt/At1w/SGr9bA0nvMweuxzpyPy7VqIo8haTPRfsY0avu3eX3z2
         Tv/sYRkHLcWP4rxt9DePqq2Eyq2K3Wtn+6KsOsfzcQZTowJuye6x9ZLUIQ3pIl/nexld
         8QNwEtbRWLSn7uOvRB6p63Gz7z7nD7+Hns4qWZBAve3lfIyPuV4jyV/OKtZncxileZH2
         6HMQRPyA4TBBD1HfwaBEjR2DM+rrlZEswvzrBp/L4HoYtqLibfe8e3huGk7n6AV1OW4r
         jcF69dfpCOvcDtBvpsNaKkhziOJ8hNjQ2LyHAltaTygh6+Cv5Nq6QRt/L8S3HnvV+MrA
         XZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637417; x=1782242217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N3rVq5YCm9NuXnpDsm2ySNhuoK4QCyxMrM4l8v2HTC4=;
        b=GlsH4+WhbtO5eChqe5UzQ4C9FAQsm3RkdLn3sdip6d+cOiHkRA7k3UWExEZDmNyKXb
         yNp6kpNGAFRbaMwFadIm/XaRUnuMVyzMhTP9IW0BsBMO6l0PwsbrCAOp53KE2AttBOsu
         vspjPKXQFVGedEzMfxnW+bxlJ7wTqCbg36WKl71yvpgaM76zXyUw9nqPmuM2BDJvcxsE
         qbSvL7JUvz98qtgdya15+rQFpFtonpzMRMik2MkhzTxYYz+/xDKG95BtX4yfI3ZmAO/D
         SGZtvCRXL+JV+XUKbHs9dApdyU4s4qWTz5qTQcjAPnJObPT2CMS64Jw9F+tYSAx6DD88
         CYsQ==
X-Gm-Message-State: AOJu0Yz9wW3JFpMPAdMA95KlrvubrQBl7TQ2Ox6D/BV0dW1t19nfehS0
	Ow+X7oB5RdYuKI7TmyHtkKFYhh6gis5NDxNZZmRKw1T9Ln5Jt64dIY/kuM0NNA69
X-Gm-Gg: Acq92OE5S3kmohPPRHGPoJBgIe9lZUHXBkCqi58FU/D+3BnTaryejhxRh9sBAykXzLD
	ilg31D5lHk5Dv/2ER6uZZrJbQXQccgBofBNkaMxjXG7OiZvq2i9JKvXPVACz7ywo/gOL7epCH0Z
	/N2WgrIpHpED7RHtDYIF7eecdymZh2GXeEHO1x93JmQBEV7xjtTintfEAfJ2sXnrJPBmHi2yKxB
	bznheC031MTPUezJVfB1kx9HdEPtyaBTp7eKVVF3g42ojBZvp2b3fGpaUpUYNBNqD3zbiXKCc5+
	W/wiT14zM9mPgcXPsI83855zqXUMjp7y0Yl3DyYAFPZCWKdyhVqmKY+7nM74oySm5HYoQaxit44
	DTubwrGIBHrTvGxcqDF2nb0U9wbHCFDzNk/2MwAwiS/W4WCIH6Otz2kRMHXdPz6wmWZc91obDoi
	OX1s2Yylgf5eXIhc1B4BDzuFjTOlaVPWLaNLtzwM+juRI0Ot8jXOOMpBzRuym6QM1BeX4p0g==
X-Received: by 2002:a05:600c:45d5:b0:490:e190:38f3 with SMTP id 5b1f17b1804b1-492333c8e0emr12895605e9.21.1781637417043;
        Tue, 16 Jun 2026 12:16:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/30] ltp: upgrade 20260130 -> 20260529
Date: Tue, 16 Jun 2026 21:16:19 +0200
Message-ID: <20260616191628.2014553-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238948

From: Alexander Kanavin <alex@linutronix.de>

Drop 0001-ltp-fix-build-failure-with-glibc-2.43.patch
as issue is resolved upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-__clear_cache-declaration-for-clang.patch |  4 +--
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  2 +-
 ...tp-fix-build-failure-with-glibc-2.43.patch | 33 -------------------
 ...8-Skip-semctl08-when-__USE_TIME64_RE.patch |  6 ++--
 .../ltp/{ltp_20260130.bb => ltp_20260529.bb}  |  3 +-
 5 files changed, 7 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
 rename meta/recipes-extended/ltp/{ltp_20260130.bb => ltp_20260529.bb} (98%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index 24e8762f77..07778ec6fd 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From a2ce04cb82d545f3dbab71de7fa55eaad3df3063 Mon Sep 17 00:00:00 2001
+From cefa5ede50985803124fd09e9c6f2d07e2471e1b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jun 2024 22:52:56 -0700
 Subject: [PATCH] Add __clear_cache declaration for clang
@@ -19,7 +19,7 @@ Cc: Hui Min Mina Chou <minachou@andestech.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
-index 1dde9e87b..6a6f5fe5e 100644
+index f2984e2dc..5685bb864 100644
 --- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 +++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 860b2f127f..3a5ac2b5a0 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From bb9146dd322af98a7bb96ad0d84ec376589c6cde Mon Sep 17 00:00:00 2001
+From b7bf6f49fdc98dc0aac9ca6f2d581688e083ed7a Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
deleted file mode 100644
index 7c78660e3e..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-ltp-fix-build-failure-with-glibc-2.43.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-ltp: fix build failure with glibc 2.43
-
-glibc 2.43 added native openat2() support for the first time. This
-caused compatibility issues with LTP's internal openat2 definitions
-in lapi/openat2.h. LTP's configure detects glibc's openat2() and
-sets HAVE_OPENAT2=1, causing lapi/openat2.h to skip its own
-definitions of struct open_how, RESOLVE_* constants and the openat2()
-wrapper, resulting in a build failure.
-
-Undef HAVE_OPENAT2 in lapi/openat2.h to force LTP to always use its
-own internal definitions.this is a workaround until the fix is found.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-
-diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
-index 03327bdb7..bd44573c9 100644
---- a/include/lapi/openat2.h
-+++ b/include/lapi/openat2.h
-@@ -14,6 +14,11 @@
-
- #include "config.h"
-
-+/* glibc 2.43 provides openat2 but LTP uses its own syscall wrapper */
-+#ifdef HAVE_OPENAT2
-+#undef HAVE_OPENAT2
-+#endif
-+
- #ifndef HAVE_OPENAT2
- /*
-  * Arguments for how openat2(2) should open the target path. If only @flags and
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
index 364e203e23..e38e9c3e21 100644
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -1,4 +1,4 @@
-From 09364a758df9d89a0968894376f82f636441addb Mon Sep 17 00:00:00 2001
+From 89c83185e757ddaeb0262c17a10f605056f53916 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 23 May 2025 15:17:49 +0800
 Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRECTS
@@ -20,12 +20,12 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-index f4549adf4..28776f266 100644
+index 083179c92..a98eb35d6 100644
 --- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
 +++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
 @@ -12,7 +12,11 @@
  #include "tst_test.h"
- #include "libnewipc.h"
+ #include "tse_newipc.h"
  
 -#ifdef HAVE_SEMID64_DS_TIME_HIGH
 +#if !defined(HAVE_SEMID64_DS_TIME_HIGH)
diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-extended/ltp/ltp_20260529.bb
similarity index 98%
rename from meta/recipes-extended/ltp/ltp_20260130.bb
rename to meta/recipes-extended/ltp/ltp_20260529.bb
index 4183b5d497..e863503200 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260529.bb
@@ -24,13 +24,12 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "6a60ae592cd375f004df0694efc7d50ddae9aa5e"
+SRCREV = "3a64d78f58bdceba93ed321e91215fb969a047ed"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \
-           file://0001-ltp-fix-build-failure-with-glibc-2.43.patch \
           "
 
 inherit autotools-brokensep pkgconfig
-- 
2.47.3


