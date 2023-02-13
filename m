Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D83C64ED6
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 21:04:30 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.27351.1676322263424142322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 13:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fq4gWwMF;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id be8so14885848plb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 13:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ba3rF2LLa7jkn4jEwxPXMNZvX1jRr+vwrzp2HxkN9gA=;
        b=Fq4gWwMFby8xJWEofTh0wEx2VIkCX026ZUJHMw0L4H9BnyzBXG2CHsF88Fv2VTlu87
         yYGGqegQ7eKMU2/eTUmjcoLVk3sbi7taQEQ6MfnUFbKFhxLQfCxy68+MrsNb6prB56eq
         AsFIWZQC8GtrZF2eLH0mKZzxAsp8rstZmv+nf6Q7JonguxvDsOJzZrFe7tLwr2tiEJSW
         MY4BdOXmkmOKJZy1/jydInfzaealSGRv0lJohSDxUYxOumu1XDsh6PgtB1eccQvVpHuX
         pgD6Azo9aMN0pRymI8lsaiYCIboBBHIUJuHS5oUgmPujQLgX8p3mfuHNz601aRVkqco+
         PIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ba3rF2LLa7jkn4jEwxPXMNZvX1jRr+vwrzp2HxkN9gA=;
        b=p4GtOOUsN3hD+xXQKPCrKAQLxzcO0gkdmqJJbZj6IU0cFrn37PLb619sJa8qmFnM/R
         LwyDDoGYaP8EHHO1J0H4Y7IIOWZYIQTo/w800QnPxVhHGYD2qXs4/SD8dJod5C+V+L1Q
         4JPGlmVayy3FgdlLyOMQg7xUHt5mC+Qh+GUzDGJlkH6M5kmrGsApAi/fzJx/kuoeF3cB
         r0eeDM6qz4PpM4PQbVgbijaM4LrhAUT/9sk+eBAXsAjXjPT32iHq/g9e/uOie8v4dlvw
         zh+xV2A9q2Co6BTuev5tcv2XhJnMB3OpIbuIgPwfhdRWYiYUOAZCX9Gcxbr4SlAqnWnm
         KaBA==
X-Gm-Message-State: AO0yUKUP60DTiE93eEW7mPlwxp+E3GDM/scsahJpvUMNhA4ui1+5ZqbC
	FD2hQup29sdom+hIw9LEVBMfGJVrPr4=
X-Google-Smtp-Source: AK7set/8eEvtJ3SeSDP4Qmqxazpecdpk5EOBGD5OYHNJ5BnohZQDpbVcFcUAQgqCMYTOZtfO1a2gww==
X-Received: by 2002:a17:90a:15:b0:233:ca14:6afb with SMTP id 21-20020a17090a001500b00233ca146afbmr9201353pja.37.1676322262596;
        Mon, 13 Feb 2023 13:04:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::789d])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090a4bc100b002311dbb2bc5sm6896493pjl.45.2023.02.13.13.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 13:04:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] stress-ng: Add missing header files for clock_adjtime
Date: Mon, 13 Feb 2023 13:04:18 -0800
Message-Id: <20230213210419.1152513-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213210419.1152513-1-raj.khem@gmail.com>
References: <20230213210419.1152513-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177112

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nclude-sys-futex.h-for-clock_adjtime.patch | 32 +++++++++++++++++++
 .../stress-ng/stress-ng_0.15.03.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Include-sys-futex.h-for-clock_adjtime.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Include-sys-futex.h-for-clock_adjtime.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Include-sys-futex.h-for-clock_adjtime.patch
new file mode 100644
index 0000000000..87d2ead46a
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Include-sys-futex.h-for-clock_adjtime.patch
@@ -0,0 +1,32 @@
+From 57f207ec7fb39c8b502f40dbdabd568f6b866a82 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Feb 2023 12:18:08 -0800
+Subject: [PATCH] Include sys/futex.h for clock_adjtime
+
+Fixes
+core-shim.c:1942:9: error: call to undeclared function 'clock_adjtime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+
+Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/261]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ core-shim.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/core-shim.c b/core-shim.c
+index dc539c64..de38e908 100644
+--- a/core-shim.c
++++ b/core-shim.c
+@@ -66,6 +66,10 @@ UNEXPECTED
+ #include <sys/prctl.h>
+ #endif
+ 
++#if defined(HAVE_SYS_TIMEX_H)
++#include <sys/timex.h>
++#endif
++
+ #if defined(HAVE_SYS_RANDOM_H)
+ #include <sys/random.h>
+ #endif
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb
index 13a8b49f70..cd7f41a016 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            file://0001-test-float-Make-variables-global.patch \
+           file://0001-Include-sys-futex.h-for-clock_adjtime.patch \
            file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch"
 SRCREV = "f3be0447c10fd5652b4c3753d56bcaac13fd8917"
 S = "${WORKDIR}/git"
-- 
2.39.1


