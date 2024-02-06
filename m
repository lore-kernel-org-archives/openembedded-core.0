Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FC2C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:22:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.18474.1707214969957630726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 02:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UNvQpaD0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40fe00cb134so7611775e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 02:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707214968; x=1707819768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMhZqAo3ts/QDQvRK9hX+xvFnq9lJUJdKWtkhgAa0cE=;
        b=UNvQpaD0znVdOhD7GZIKNu8cQUuomutOWMr+kczETFeMzaY5WBJjsy2HIAjNzDwIpF
         MxFJZENyCOEczRL1CL5Ks8Ma/YUtgqkOp22sKoqjaJ9NkoYeGb0KFs/VTzi0Pkm/Vk/Z
         eEEQ7qgijGwlXcAANEoj1bZWZA2PMDoI+3QNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214968; x=1707819768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMhZqAo3ts/QDQvRK9hX+xvFnq9lJUJdKWtkhgAa0cE=;
        b=YuGRyQbj50CSswBm7/jw2Jua+EblV9oSXmToL1w7WOAgAoT7p+LdGxyRwMRjdxGBzp
         +CnXfM9LnrnDk5p1B5auacJNiO+OEAJNQgT5M5NEOMO5uBaQbhwBtjtlxpNhKv4UDP6w
         2gSwnK9gGb+UmnRaKbAWM3Pf0RHcwVJtTDOVnYKOMnyKD3+khaBwi/6nL0LwnZUFtFLw
         br1BW+mQYf1Y61kDmQ9/nbHsLHzv848rCmSEGS0IX6kRPHMBsZ936x6OMCyzF0rHxyNW
         ry11He1U9yEDYyI7e72GftgyYhEqOkiNq7cVAjoN9ttGeh1yVMyNZMdjVePuSXphdgfv
         MThg==
X-Gm-Message-State: AOJu0Yw/dCR8C+tysfrivxycReL3Ysulss9+KGBISAQEkUU/v9HYmPKl
	uCOyDzZ2HqcCrtrerBzQH7K/dvStDhSZcEVPTg7LMD8lYF/LlkRZmhdO7VfoglMRVew5MUVrU7/
	R
X-Google-Smtp-Source: AGHT+IFcyKdJ7mFnfw6mdq15lGgxnRiTorMl1Was+Z+JWMrdiTO9iVZZXdPdk1eAvAQrTcloXOVNwQ==
X-Received: by 2002:a05:600c:534b:b0:40f:df28:332b with SMTP id hi11-20020a05600c534b00b0040fdf28332bmr1687941wmb.29.1707214967893;
        Tue, 06 Feb 2024 02:22:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:45c0:34a2:1eea:2530])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c310f00b0040fd0f7d267sm1508471wmo.44.2024.02.06.02.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 02:22:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 2/2] ltp: Try re-enabling problematic test
Date: Tue,  6 Feb 2024 10:22:46 +0000
Message-Id: <20240206102246.2569704-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240206102246.2569704-1-richard.purdie@linuxfoundation.org>
References: <20240206102246.2569704-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 10:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194982

The proc01 test used to hang when reading /proc/kmsg. This issue could
have been a number of issues which were fixed in the meantime. Try
re-enabling the test to see if the issue is still present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ltp/ltp/disable_hanging_tests.patch       | 27 -------------------
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch

diff --git a/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch b/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch
deleted file mode 100644
index f25a692dc0f..00000000000
--- a/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-This patch disables tests which we've found "hang" on our infrastructure.
-
-proc01:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1748 (arm)
-https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1781 (arm)
-https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/2782 (arm)
-(was trying to read /proc/kmsg, looks like a horrible test anyway)
-
-Upstream-Status: Inappropriate [OE Configuration]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: git/runtest/fs
-===================================================================
---- git.orig/runtest/fs
-+++ git/runtest/fs
-@@ -64,11 +64,6 @@ writetest01	writetest
- #Also run the fs_di (Data Integrity tests)
- fs_di fs_di -d $TMPDIR
- 
--# Read every file in /proc. Not likely to crash, but does enough
--# to disturb the kernel. A good kernel latency killer too.
--# Was not sure why it should reside in runtest/crashme and won't get tested ever
--proc01 proc01 -m 128
--
- read_all_dev read_all -d /dev -p -q -r 3
- read_all_proc read_all -d /proc -q -r 3
- read_all_sys read_all -d /sys -q -r 3
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index 5cd33bb6a38..acd857f4a90 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -28,7 +28,6 @@ SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://disable_hanging_tests.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.40.1


