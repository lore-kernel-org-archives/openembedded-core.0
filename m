Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27560C6FA8E
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 17:55:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.25099.1677261332636305373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 09:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AJA5sCAf;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so3667972pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 09:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pkFxve/388u84pRIsPjimZ+TTBJR12c/f2bA0ykTAeE=;
        b=AJA5sCAfl2VsMA1aZG35opYEzAZf+pnRlXE1eF36sf30StXSYLTCjAY+vGC+G2U39K
         ddLrflRh8dE+x3TQQktoMMDSVJpech8RgF49GcksVEo0WJyKdtQ5JQkg7MCNRAqv95or
         dQ5GHpgx8hiSlc+smr6qOJ8Csip7OFj7vB2qvbBVTjSwfFHsZIzJpghkA58uIo5k+5UT
         ydXOBAVXdSylckar8RdbK5xUWBdyWOlB/k4x4d4GyjWvcrIKl07mjkSlxEAfAPuQHTJX
         KSxhKIK6emGgmp6izAq9OL40mPGtEEya5Z3FaR1JYdDJLdxr25LM99h2hjb1cRC/ELtD
         +VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkFxve/388u84pRIsPjimZ+TTBJR12c/f2bA0ykTAeE=;
        b=0y1DRPJrJ1wsniGPOpT32WsEbP8nilzXoqsRUSo12Bgbuvb+l0tG3IbfQCJSUvxtFF
         /j+jzxH2tEIsFAaR6LUUXrVx0Fy+J8OcjnwrrkRtZwdC5SbFD7vZdixPIUsjgoj3k9PI
         0MVW/FB7ko9++bQaIb2WKMQ5Sf8ErikzXdJxORXaXBEKFc43qJfTLaxYVNlGdzEGbCVc
         MA7yj8FlmoFap1nmE191zBxVdEWd70Xm2ih/hpUcwqWSNLh1sML9nwRn8ydoctj+PORn
         pXJOgIWZ7RirOkNxK1O+cKKvm+Y0rCA7fuw4zJtg5fsXqFMkl8vti8JePEvylStJuDHv
         XCHg==
X-Gm-Message-State: AO0yUKW3AOGQOL1p8yb4FPdx4+ADChcMxpkoEVSQBhmmF9KTxqFVg0WT
	YtjsmmQtNS+lNjhxWqEOk7wk1qmkf5M=
X-Google-Smtp-Source: AK7set8IzZ7EQduOG45o9JPX2s/dz11z5Zx85TSiF/r6mFlYfStfrHdGDTTCgE91oH3rlNZHkiAf2g==
X-Received: by 2002:a17:90b:3714:b0:237:72e5:61bd with SMTP id mg20-20020a17090b371400b0023772e561bdmr5040221pjb.49.1677261331508;
        Fri, 24 Feb 2023 09:55:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id mm13-20020a17090b358d00b0023417fec520sm1835321pjb.44.2023.02.24.09.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:55:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to tip of trunk
Date: Fri, 24 Feb 2023 09:55:28 -0800
Message-Id: <20230224175528.3418258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 17:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177707

This brings in following changes

* 7d756e1c (upstream/master, origin/master) dns: prefer monotonic clock for timeouts
* 07616721 fix return value of wcs{,n}cmp for extreme wchar_t values
* 35fdfe62 math: fix undefined shift in logf
* 7e13e5ae inet_pton: fix uninitialized memory use for IPv4-mapped IPv6 addresses
* 7e6da7ac hsearch: fix null pointer arithmetic UB
* f79b973d increase sendmsg internal buffer to support SCM_MAX_FD
* 0ab97350 mq_notify: block all (application) signals in the worker thread
* 711673ee mq_notify: join worker thread before returning in error path
* 8c0c9c69 mq_notify: rework to fix use-after-close/double-close bugs
* fde6891e mq_notify: use semaphore instead of barrier to sync args consumption
* c3cd04fa fix pthread_detach inadvertently acting as cancellation point in race case
* 115149c0 powerpc-sf longjmp clobbering of val argument
* 5763f003 riscv64: add vfork
* 269d1938 fix wrong sigaction syscall ABI on mips*, or1k, microblaze, riscv64
* ea3b40a3 fix integer overflow in WIFSTOPPED macro
* f897461d fix debugger tracking of shared libraries on mips with PIE main program
* a4b0a665 expose memmem under baseline POSIX feature profile
* 9532ae13 use libc-internal malloc for pthread_atfork
* 7d358599 prevent invalid reads of nl_arg in printf_core
* c5f4b2df elf.h: add ELFCOMPRESS_ZSTD
* 159d1f6c semaphores: fix missed wakes from ABA bug in waiter count logic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 7749495ec6..39f6dd8219 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "f47a8cdd250d9163fcfb39bf4e9d813957c0b187"
+SRCREV = "7d756e1c04de6eb3f2b3d3e1141a218bb329fcfb"
 
 BASEVER = "1.2.3"
 
-- 
2.39.2


