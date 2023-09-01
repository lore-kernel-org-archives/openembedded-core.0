Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1725CA0FF5
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 18:38:36 +0000 (UTC)
Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
 by mx.groups.io with SMTP id smtpd.web11.3290.1693593508403106368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 11:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QmqaqA0p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.65, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-1c4c5375329so1521650fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693593507; x=1694198307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8S1C0LYLGJSTmO0xMbP75F743Af1MAVjCH6xYdgE7Vw=;
        b=QmqaqA0pTw9rm37+myKf+lkMPC+/lV8zrYZQYdjMWNEeeAP4RW/LWjFLSIYdTSbGVD
         zkpqhnw9tjkLmHwxV5OblWR4i/whASjdweUAOcVKuyoAi+sbtCtMJcDjhzNh6UA4+T+K
         BQGPQUZ+hCgxwKKmtoaEuNUFdCLLOvnokM4bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693593507; x=1694198307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S1C0LYLGJSTmO0xMbP75F743Af1MAVjCH6xYdgE7Vw=;
        b=YMNh2FhaFOb5TcmUPXA+BG3rxKymrfYfbX1sMApxFQASuMQ65nqpcxooLNcydT+o8R
         0nLIf0QJuHBRpjwAAiahyKJPSsoCm8jGzmEtUHIRpS42nIgTNvz1ifHKtDmW7tWyLUUU
         RSXWUrT6g8uJpHuR79PWpGFZ+2Gr1oFc5W89N3Yp6vnR8ZKQXPWb7iUmYxIVmpdYYkjL
         3YCk5PaLQs2kkvi7PKsTliGs9z4c3CWfZ23B3JWnfMnvayymd3mwAloW/re8w3XyTBxc
         hbM/F01b1PVkYJfIJjiJZ91YrlvQMK4DZBWddkUIEb0QlZpYCB4zHmOqRQWv2vZ3umxU
         gh/w==
X-Gm-Message-State: AOJu0YyjhD6eLQQj2fxGzlry75AMY5VM2nsSrnd5FrxUvAx2y9B3rODO
	sJDcbX2APTk3TUKasbJK4fMJpzha8qOGJ2cUP1ch4QG7sNM=
X-Google-Smtp-Source: AGHT+IH/Ug2WMpe8TVq8TkEgJj1ZbHGUugUze0s5LksPxrt6HV6As581j4Ws+9T7VpiUxX3uc9jotA==
X-Received: by 2002:a05:6870:e751:b0:1b0:3821:f09e with SMTP id t17-20020a056870e75100b001b03821f09emr3502233oak.18.1693593507215;
        Fri, 01 Sep 2023 11:38:27 -0700 (PDT)
Received: from hd-yct-laptop.chateau (97-115-93-241.ptld.qwest.net. [97.115.93.241])
        by smtp.gmail.com with ESMTPSA id s2-20020a05687087c200b001cc6b64d5f3sm2438053oam.44.2023.09.01.11.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 11:38:26 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] yocto-uninative: Update to 4.3
Date: Fri,  1 Sep 2023 11:37:29 -0700
Message-ID: <20230901183728.83121-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 18:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187015

Add in stable updates to glibc 2.38 to fix malloc bugs

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 6596c0f4a2..eaa3e9b31c 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.38"
-UNINATIVE_VERSION = "4.2"
+UNINATIVE_VERSION = "4.3"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "cff40e7bdde50aeda06707af8c001796a71b4cf33c5ae1616e5c47943ff6b94e"
-UNINATIVE_CHECKSUM[i686] ?= "a70516447e9a9f1465ffaf1c7f89e79d1692d2356d86fd2a5a63acd908db1ff2"
-UNINATIVE_CHECKSUM[x86_64] ?= "6a86d71eeafba4fefec600c9bf8cf4a01324d1eb52788b6e398d3f23c10d19fb"
+UNINATIVE_CHECKSUM[aarch64] ?= "8df05f4a41455018b4303b2e0ea4eac5c960b5a13713f6dbb33dfdb3e32753ec"
+UNINATIVE_CHECKSUM[i686] ?= "bea76b4a97c9ba0077c0dd1295f519cd599dbf71f0ca1c964471c4cdb043addd"
+UNINATIVE_CHECKSUM[x86_64] ?= "1c35f09a75c4096749bbe1e009df4e3968cde151424062cf4aa3ed89db22b030"
-- 
2.41.0


