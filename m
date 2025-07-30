Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCD7C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:54 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.46731.1753909724637496159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xOrncB5g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76b0724d64bso243090b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909724; x=1754514524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfoyJoWJQRTfINq2xygh5ZV8EpdhR0/WYaM2XptxEAw=;
        b=xOrncB5g3kt/d4MFoC/NhjgxCEdxsyJm5dTNSnkod7HOkthsbOSE4tyvc2cKKY7prk
         HceGDkeT5M6aL7JjRvVKRAoKTTgiBRgccw4OXnKatD5B0Gt0VIYSUAwWOyzbXBkrkaQv
         wso5jm8yI0+EbhAo0+K2pg6GAJ/bGbVMZfzupa8cO5eGNFeZKTuBsHYR+6HHwNo8DohC
         1yw9ACY8edrFUcmiwqsydDR8DXkD769lIjXvusS0o6Xldzv6SlNO0pCRA9tEs2SlEbfI
         Ow5kH1QmeJNJdWjqgSx6M6xl82vSnaadAnCmxg6z5GSROByqc33eaFcx9j866t1TugBh
         PlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909724; x=1754514524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfoyJoWJQRTfINq2xygh5ZV8EpdhR0/WYaM2XptxEAw=;
        b=XGcIZ6FndKM5+5J12mFyUiDib4NSdaIF4q9B6u/QNyTTG5QskZjA4MOr/I4rLV6TFS
         7oiHEAWHzAkWeHxmLzd+lM+o+ZyuMuOCEfiJR5KH0OK+TYZ+kQYHh36aE401Ssk0dDKw
         DhnXBX8pF8UXLtw+9hbf2MoBZtRKbPbuIuSAKx/4B15z05ivAAAXbFvNh+HIRJOkKj45
         o8xAEEbsWOp7eP/STYnN2hnG1+o9Ln3vLNTdFEE5SnHExobhHgONiA0H1Ox13L4/zQRp
         +/zi98EzkHtChBJJHFTdxO1DxbJBSyL6tO1BJII/LN8BgAz6zeczUQvm7oyQswDz+X2U
         DfmQ==
X-Gm-Message-State: AOJu0YwWcG44iIiJifx5V+g25F/TLnsOyf0JhX+EnuLAqtpsgQl5IpvS
	KtCpyofkigeWhHwjxRpHHWuhRuPUbymfn8H8rZw4RAQLXymmoSGyBZlWaNlDSq4vOVZrtP9+fcv
	eZ1ZK
X-Gm-Gg: ASbGncvNDsZiOUN4aKQYdtJ+4EdgDnWf/8AbYGZ0NcUJlhQKArBw6D924P8wZHLHjVc
	sT/uS/KRWvN8kJHcc4NsrFZM1woJUYB5ski/5+TUCjZrQ99n9Ov/ziGKak3k5dxk0u+0fjS8zlY
	vodXuJyZOj9GxocCSEWDdM/rkS9kVyP1AoHv844s1hgejnulQE8z4FAAIFzdMTtjZZdlE8VqqIg
	BJFgni3UuGQCbN3h+dFmJq7C4jVTrTVBinOMUzM/3TPIvSJFjwYz+FdtFsCwLGep47PzaoVha67
	zcwhbptZIKOrBe/fA+QP61hOVyvR6LJA6tYo49gRmn5zbGUOZLWMZrcWLACvyYTCEs8JfCBs41I
	XSe/nkzSdPvPt
X-Google-Smtp-Source: AGHT+IGQePLj+0Djsp0u4R5zR1junWvfHNZ+k/ffohOqJ2liV+ij+wuWSNTntblYfXlIW0q5fIW/4A==
X-Received: by 2002:a05:6a00:b88:b0:747:b043:41e5 with SMTP id d2e1a72fcca58-76ab3067df1mr6005727b3a.16.1753909723843;
        Wed, 30 Jul 2025 14:08:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 8/8] ltp: Skip semctl08 when __USE_TIME64_REDIRECTS is defined
Date: Wed, 30 Jul 2025 14:08:27 -0700
Message-ID: <8bea495b4945e24b43398f40d634d7fdb73e981a.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753909581.git.steve@sakoman.com>
References: <cover.1753909581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221158

From: Jiaying Song <jiaying.song.cn@windriver.com>

When __USE_TIME64_REDIRECTS is defined, glibc redirects struct semid_ds
to a 64-bit time-safe version that omits the sem_otime_high and
sem_ctime_high fields. As a result, the case becomes invalid, leading to
incorrect behavior.

This patch adds a check to skip the test when __USE_TIME64_REDIRECTS is
defined, ensuring the test only runs when the semid_ds structurally
matches semid64_ds and the *_high fields are accessible.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...8-Skip-semctl08-when-__USE_TIME64_RE.patch | 48 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20250130.bb     |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
new file mode 100644
index 0000000000..b4859a6f0a
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -0,0 +1,48 @@
+From 55b48d66857a43c2609fc351293b5601e2eb955d Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Fri, 23 May 2025 15:17:49 +0800
+Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRECTS
+ is defined
+
+When __USE_TIME64_REDIRECTS is defined, glibc redirects struct semid_ds to a
+64-bit time-safe version that omits the sem_otime_high and sem_ctime_high
+fields. As a result, the case becomes invalid and leads to incorrect behavior.
+
+This patch adds a check to skip the test when __USE_TIME64_REDIRECTS is
+defined, ensuring the test only runs when semid_ds structurally matches
+semid64_ds and the *_high fields are accessible.
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2025-May/043647.html]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ testcases/kernel/syscalls/ipc/semctl/semctl08.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+index 1878bd4..3b799fa 100644
+--- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
++++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+@@ -10,7 +10,11 @@
+ #include "tst_test.h"
+ #include "libnewipc.h"
+ 
+-#ifdef HAVE_SEMID64_DS_TIME_HIGH
++#if !defined(HAVE_SEMID64_DS_TIME_HIGH)
++TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
++#elif defined(__USE_TIME64_REDIRECTS)
++TST_TEST_TCONF("test requires __USE_TIME64_REDIRECTS to be undefined");
++#else
+ 
+ static void run(void)
+ {
+@@ -47,6 +51,4 @@ static struct tst_test test = {
+ 	.test_all = run,
+ 	.needs_tmpdir = 1,
+ };
+-#else
+-TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
+ #endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20250130.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
index f9521acbc6..4c03b583fa 100644
--- a/meta/recipes-extended/ltp/ltp_20250130.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -31,7 +31,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-kernel-kvm-don-t-hardcode-objcopy.patch \
            file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
-           "
+           file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \ 
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


