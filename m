Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA165EE8019
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 16:01:29 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.545.1694188887586218362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 09:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cAY3pXgL;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5657add1073so1514089a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694188887; x=1694793687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=47TwFEzwKVsIHNdDAXzZ36ABgM1+AVR8USEpjXwcmJk=;
        b=cAY3pXgLwrPCovkqd7FP7iEvk7DsjTSmh8JIFTMzwVPXZ/HMvpkPK81y6GPgIV0v1d
         nCXU8CI3Pt1HCSYHuIN9XTUUK/Meo36U7qAOzR1vcuUVPknoXSWO1UeoSWIXyp6HEXm5
         bOz27Bo60P8CbQ3q27kYIqpi1jvromTHO77lL0+KUycHfPbwqBK4zqIyuQmyuZftRaKA
         W3zKUptWbSlrLYB+w5TYSccx0P1HcaDxXquXHjfQXhFDHT5VH+B8NQvz5wf5rLh96Vmt
         oI7eUtkv8D32yYdNvtposxS20RiEHr5Gf48DVdo+CKKlW9Fw4ENKBwDwAb+e6I7yCrrp
         Epsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694188887; x=1694793687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47TwFEzwKVsIHNdDAXzZ36ABgM1+AVR8USEpjXwcmJk=;
        b=HhuanNPLYtRHfZppM0a4F2LKjIF6yxwPbcyXSKF56x1AercjQBEJGAouSgFCmCJSEI
         RZRqZ4udklGapa7/8X56P75NA6ITot7xPg7jf+/zEurgmPwgogoH7PC7reBSwe6oOLKa
         zOowZ0MLRZW6khnUN0UOUh19punLQs5InWmuXVlSJnl0ZTw8XsAF5KfB/sw82nG3Ldf5
         SKGjeNleIjAGuxEBrSkEYVdIvJ8xahHpiaJ9C4phX1JsmCoTitxW2sM2mcc6e3Zu0lp3
         0wcvz2wDP5bDAtd2q+16JOFABZYmbbLz+v8MI6/gXhU1xYt+rRa1IshK1qSiPg9np2e6
         VXGA==
X-Gm-Message-State: AOJu0Yzz0w3IuSaHVYGijfb4jYw5SXPot9eY5MKRVJx/5eURfOvTDe2F
	80sJvsoMC6AZbasb/En3BPFw/lUWGuU6tA==
X-Google-Smtp-Source: AGHT+IE0QPXVu4KznWzCz71kX8pZo1FFYqSDPXeE/Hf7sIQRzz4aXZYHB9LgLmIc1p6xfYA+loN4PQ==
X-Received: by 2002:a05:6a20:9188:b0:154:3f6:9490 with SMTP id v8-20020a056a20918800b0015403f69490mr3272336pzd.6.1694188886448;
        Fri, 08 Sep 2023 09:01:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id w24-20020aa78598000000b0064378c52398sm1487124pfn.25.2023.09.08.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 09:01:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libc-test: Depend on musl-staticdev
Date: Fri,  8 Sep 2023 09:01:22 -0700
Message-ID: <20230908160122.2188276-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 16:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187440

It builds statically linked tests during ptest run and therefore needs
libc.a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libc-test_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index d18c967e138..e63abe838d2 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -34,6 +34,7 @@ RDEPENDS:${PN} = " \
 
 RDEPENDS:${PN}-ptest = " \
      ${PN} \
+     musl-staticdev \
      sed \
 "
 
-- 
2.42.0


