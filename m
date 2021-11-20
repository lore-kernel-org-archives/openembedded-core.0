Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AC7C433FE
	for <webhook@archiver.kernel.org>; Sat, 20 Nov 2021 18:11:16 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.1134.1637431875278645903
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Nov 2021 10:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kJ3i35fE;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso11601397pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Nov 2021 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3In/5C3e6jUWDjpc9LUPf/ibEHoyKgV2lj0yjQX7ORQ=;
        b=kJ3i35fEKpmDacUvIVyUFM/HMLS1ueaKhGtTiXGPzoYXcEM8v7heooEMOwfa00Qhq2
         a8vZ26rWqQdooK4Q78YOYsAeSeUaQGfDpNgSbxNITvzifZsBumj4Ig/ShbOHA1YWNpQq
         JQ80mfEU4FV2QBaEgg79Qhoe2M/QaviEQfzL119OE6ZHX88GDr365hRSxOodRV01KPRs
         tl+5DwVjm0EB31Jhk15HH6zdoaamooyvxHkqG9j/pcdLfWq9CCJT6PKRiRZeYLndbM4R
         kdsl9V3HPhaSasWOHq02mWrMsaALdHzKclepPaAokT9uW8rTZDhsIAYOnCdxOYXL0wa/
         xg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3In/5C3e6jUWDjpc9LUPf/ibEHoyKgV2lj0yjQX7ORQ=;
        b=l7myAabSNRxDwqEm1HJVoQcxPj1Zr5pVnydQyscaOhbOYvzfdZx3oo1FBDGKjkd0A/
         ZNQLvRNhA8G/F8q/wD9Y5TrxjUwx6zfKA0eF/j+O7nB0KwdBIzXqIGa1eLz6KJbhNbEv
         Pz5B/wQA0qPT4H4ImAF9q4OUwCEU8Ai7ZdiqAic4j1b3OMXMBU9wWBiAcWyh1Iq/AJ32
         5oVZvJh40JtqZ5y5bFi39DJLz/7tS7Tks8AsznP2l0vKleA4A8S5lcVHstSx9cH0QO1t
         ZYe2mvKfjxVXcL2wKeBi3hMZwlNNjd3CzqH5AykTB5zaJlT7OrfEsFgVkQNAE21KSu+m
         7ihQ==
X-Gm-Message-State: AOAM5309wWEtzoeMTJMyBQFC3wI5U8gxpcPS6yGQQoo8COZgHpODXadS
	oWa2FUcnS1jNhrB7AAc23q4d72u7lIovtg==
X-Google-Smtp-Source: 
 ABdhPJy32b8ELtu7NU4l1icoxP9mq2KhWLssPSlqe8icpHIVIXrsSUYzBeNcUUuuI7FJFYFAw4WYKQ==
X-Received: by 2002:a17:90a:17ef:: with SMTP id
 q102mr12500970pja.116.1637431874441;
        Sat, 20 Nov 2021 10:11:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 g17sm3519492pfv.136.2021.11.20.10.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 10:11:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] core-image-ptest-all,core-image-ptest-fast: Depend on
 core-image class
Date: Sat, 20 Nov 2021 10:05:06 -0800
Message-Id: <20211120180507.1970003-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Nov 2021 18:11:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158529

Use the default packages as mentioned in core-image-base without splash
since many machines ( e.g. raspberrypi ) add packages to enable wifi/bt
via MACHINE_EXTRA_RRECOMMENDS which are essential to boot the system
without errors, otherwise there are errors about BT firmware not being
found etc. which is then marked as failure and also services like btuart
fail to start and it marked as failure in system logs

Using default base package groups addresses this issue amicably

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/images/core-image-ptest-all.bb  | 3 +--
 meta/recipes-core/images/core-image-ptest-fast.bb | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
index 1472451675e..8edd9a2b886 100644
--- a/meta/recipes-core/images/core-image-ptest-all.bb
+++ b/meta/recipes-core/images/core-image-ptest-all.bb
@@ -1,7 +1,6 @@
-inherit features_check
+inherit core-image features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
-require core-image-minimal.bb
 require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
diff --git a/meta/recipes-core/images/core-image-ptest-fast.bb b/meta/recipes-core/images/core-image-ptest-fast.bb
index 40df274c4c1..286f20e547c 100644
--- a/meta/recipes-core/images/core-image-ptest-fast.bb
+++ b/meta/recipes-core/images/core-image-ptest-fast.bb
@@ -1,7 +1,6 @@
-inherit features_check
+inherit core-image features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
-require core-image-minimal.bb
 require conf/distro/include/ptest-packagelists.inc
 
 # Include only fast (< 30 sec) ptests
-- 
2.34.0


