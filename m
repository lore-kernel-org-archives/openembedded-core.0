Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2801C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 13:03:52 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.12861.1654779822945377891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 06:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JvCCCSqd;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id g25so847856ejh.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yVpGk+9r5u0QBQP04u7ZfZURkAsnrEGxcoli/ksHVaI=;
        b=JvCCCSqdlpnYVKpbdrVlVT8Ws4KeKJBb9tVAxK3VIAc+V6lM2GCAMIF/GdbO3AA7IN
         UKUgleF2ffk+KqsU//UYJQxwNE0JKfglpTWIq3W8nP/9bhbVMehaMJlKncPOzIB+0PGV
         c5Cx4XtdEG9YmKrnSCkaaBs4qmTY+76IWIDmcjkhL6hnenCN05JSeEd+82XwaVfI4K5r
         7qcuHCDmTBgez2zFO+3zO8MsheWgK2xIsKXNqz2NbnZ6xPoOIe8XhEg48i3VhQQGPZQl
         LdXDU34kr/Zx0Rcbn8fhDqhkSMPMSOoRNNSLdmk+7EIYyGPtxUGLAfagQ+ecPtLfImfa
         UZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yVpGk+9r5u0QBQP04u7ZfZURkAsnrEGxcoli/ksHVaI=;
        b=DIsVH1UlpKWeuDbmLlseRXeLZnKSzp1n22eTixsW9auf/jd4wxb1mFKAnFS0Zge6Aa
         NtzpqvBULwBEg2axDP498N1NW2BVnXVkTTCh/lC6R6Y7z3CSvCMKcUArbAJW5QtG3c3t
         VFZLGvzN85MjrrwLZbLReMGwveIPbS2xFBIhoTEAMqgnkW3/Z9xG8OUSkHKhAGXgkLgV
         K/GTnM5FVvLqW9svuWMx17L9kAWJ8J2RDbXztNRWmGWM72Q+mUyEe5VyZhHpao5LJgof
         lWRmpHoCRF4/sGsi/MzDbK5U14L0sWpYGmqgccMl3WonpmHk/PTODhKDMUKBPRj/f2NK
         6A5Q==
X-Gm-Message-State: AOAM532AroX//bB/AZ6hDDLzd70I8XpF7dSnFu29rk2e/jCMG+O2CVTy
	hd0NgmjoKvHnxlbX1nhebZ0KmEaUS0g=
X-Google-Smtp-Source: 
 ABdhPJwCTTNERz6aDQ0S7uDcP616Dvot9QccfY0vZ6V7m4DeaxDK2PvL28TLTb0TP//oaQXRZ7b0sQ==
X-Received: by 2002:a17:907:3da3:b0:711:ca9a:ae23 with SMTP id
 he35-20020a1709073da300b00711ca9aae23mr19976853ejc.709.1654779821214;
        Thu, 09 Jun 2022 06:03:41 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 w21-20020aa7d295000000b0042dd482d0c4sm14167079edq.80.2022.06.09.06.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 06:03:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] systemd: Fix build without utmp
Date: Thu,  9 Jun 2022 15:03:35 +0200
Message-Id: <20220609130335.3380293-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 13:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166779

* backport the fix for regression in v251.2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...red-utmp-wtmp-fix-build-without-utmp.patch | 32 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_251.2.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-utmp-wtmp-fix-build-without-utmp.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-shared-utmp-wtmp-fix-build-without-utmp.patch b/meta/recipes-core/systemd/systemd/0001-shared-utmp-wtmp-fix-build-without-utmp.patch
new file mode 100644
index 0000000000..2bb9565bf2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-shared-utmp-wtmp-fix-build-without-utmp.patch
@@ -0,0 +1,32 @@
+From d6e2c2d34d336398f5948a8b731fefff3dc0ff12 Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Thu, 2 Jun 2022 20:49:46 +0200
+Subject: [PATCH] shared/utmp-wtmp: fix build without utmp
+
+Commit 16618332388442f2f1c3e52b0a9fde00121564a3 changed a function to
+add an extra argument. The data types used when building without utmp
+missed the change.
+
+Upstream-Status: Backport [d6e2c2d34d336398f5948a8b731fefff3dc0ff12]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+---
+ src/shared/utmp-wtmp.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/shared/utmp-wtmp.h b/src/shared/utmp-wtmp.h
+index 36e4203b4f..188d011fdd 100644
+--- a/src/shared/utmp-wtmp.h
++++ b/src/shared/utmp-wtmp.h
+@@ -59,7 +59,7 @@ static inline int utmp_wall(
+                 const char *message,
+                 const char *username,
+                 const char *origin_tty,
+-                bool (*match_tty)(const char *tty, void *userdata),
++                bool (*match_tty)(const char *tty, bool is_local, void *userdata),
+                 void *userdata) {
+         return 0;
+ }
+-- 
+2.36.1
+
diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index 80f80849d0..8370bec0ca 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0001-shared-utmp-wtmp-fix-build-without-utmp.patch \
            "
 
 # patches needed by musl
-- 
2.35.1


