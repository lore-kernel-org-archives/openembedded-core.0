Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38740C54787
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:20:56 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.15687.1708442452023658176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 07:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HO7ZTbhq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d4c11bd34so1774293f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 07:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708442450; x=1709047250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMLby4SJj374VD0mcWQtPgp5ebVV8G5arlLb+qyd8AY=;
        b=HO7ZTbhqFbVj6iZ8LLK/RgG4aLhXE+Hrd7ocHmCQCVuMBF7RYuPVq18XY0s1pL+IzL
         I7rKtpn7N14W8ZWYX4LstO+HFT5orHxYTGTeNSJLkw8BzD8uLsX4/WpssNDi4RniReGb
         NC0eTnoI+TP0EPRLZ5sHj/JlXmzgoeqDI4ahA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442450; x=1709047250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMLby4SJj374VD0mcWQtPgp5ebVV8G5arlLb+qyd8AY=;
        b=raE1qmZ5wPkVrgN3LinK3bzpsmMFYrRIs/ytE+kplT8wN3DAS68Rxo75hJt77sB8ft
         o/tKSl/7Rc2MYe5ByytEs+/jYFKN3x+kBhhAo5D+lm/JqoVM2hJhygrV5db6fPO/RZ5G
         N1kv9lOw0Q4J58S6i6IWiFLAr8nuVzNrPYp/5KO5hnNw/vmTYxh9AZra39zQCziEH20n
         55QZC0elGfvCJB/MHva7VC9T3tEr8CQFQcn5qBBG53T9Ibdj8/pVGqHH6sTSzRzB7T4Z
         ku9pNktOYb1TnXpUf7xTo5xVtTGYL2N4hOsjgRFwIqE5nZnx+Kma01ySIy+6T+iqc4LH
         +osw==
X-Gm-Message-State: AOJu0YwWeygjYdE08KEEkxGOEkDiepYb0MuPEN/p+TRNjTcyYkQchaY/
	ktgocENqFRAa5yMUQcl/CPgOeleW4iImNG/9lyi3JzfGncS8GamWVlOFmWGTCrSJ4ZYr+mbb8j1
	/
X-Google-Smtp-Source: AGHT+IG25RKZJvpQ3Wz5fHx1d9sFhw5mxswQ+Gv3xBqh9gIIC6IH9uTsm75UPgSBDjkuIKO/1UNbPg==
X-Received: by 2002:a05:6000:2c2:b0:33d:6fe4:21a5 with SMTP id o2-20020a05600002c200b0033d6fe421a5mr1712233wry.28.1708442449919;
        Tue, 20 Feb 2024 07:20:49 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b883:fc21:a202:c294])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c459100b004124907f43fsm14374151wmo.12.2024.02.20.07.20.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 07:20:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] numactl: Upgrade 2.0.17 -> 2.0.18
Date: Tue, 20 Feb 2024 15:20:47 +0000
Message-Id: <20240220152048.683706-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 15:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195918

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../numactl/numactl/0001-define-run-test-target.patch     | 8 ++++++--
 .../numactl/numactl/Fix-the-test-output-format.patch      | 3 ++-
 meta/recipes-support/numactl/numactl_git.bb               | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
index 185dcb3e2d3..68b3e2491ff 100644
--- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -1,4 +1,7 @@
-rename test target as run-test
+From a5e1fa272f294e739d6caaf629968478796ca53a Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Mon, 19 Oct 2020 14:42:11 -0700
+Subject: [PATCH] rename test target as run-test
 
 Upstream-Status: Pending
 
@@ -8,12 +11,13 @@ not suitable for cross-compile environment, so rename it as run-test.
 and define test target to compile the test files.
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
  Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index e84b21e..94a8bff 100644
+index da01d27..c738b93 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -126,7 +126,9 @@ regress2: $(check_PROGRAMS)
diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
index 00c4f9dfcbc..8345f71d72b 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
+From 29f811d9d381f2ab54b3c8cef77334e32970ef09 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Tue, 21 Jul 2015 02:01:22 +0900
 Subject: [PATCH] Fix the test output format
@@ -8,6 +8,7 @@ Upstream-Status: Pending
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
 ---
  test/regress  |  6 +++---
  test/regress2 | 11 +++++------
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index bc5b09fc82e..bd16df91ecb 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,8 +10,8 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=9f34c3af4ed6f3f5df0da5f3c0835a43"
 
-SRCREV = "c1165896572b74e971d817909bf652066ddf801a"
-PV = "2.0.17"
+SRCREV = "3871b1c42fc71bceadafd745d2eff5dddfc2d67e"
+PV = "2.0.18"
 
 SRC_URI = "git://github.com/numactl/numactl;branch=master;protocol=https \
            file://Fix-the-test-output-format.patch \
-- 
2.40.1


