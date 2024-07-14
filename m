Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A66C41513
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.15478.1720960794192591492
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eo83hGdU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fb72eb3143so23783265ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960793; x=1721565593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNurfB9n4FPO2/xQzlJvV4qj6U//+h8D1VkfvvaRSQk=;
        b=eo83hGdUGkt+A3HL1N7dXmExw2Qg0qxPU7pG37BFT9SQomaXaIqKiaTwdsXOawX9iL
         B/0S/7qb05/k4n2y7LNgmZj0eLzaFkthwoqexasmTSfjuyWPTp1ievAeDZNgw38vkXe7
         UvZT+vuuZi15eLZNWjU7015ASgoJVmUclqibfehKwMKFfVM05mKL+b8T5eHL31LcewAL
         8oTP9JTB6AwsMstg/pu/WZoBk3NRG3x0X8PmyGJC8YzmdnWX4nUtzFJZ0D36CY23Vrss
         smUaqpFQW8PNeZtH2idSyQ8WTuwgrdhYOMcTMza8YvAr3k89Vo0JQEi2x+luEGsXNUEG
         rlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960793; x=1721565593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNurfB9n4FPO2/xQzlJvV4qj6U//+h8D1VkfvvaRSQk=;
        b=dO70eboS0F381QyXEKqrHgw6bToHuGdBk6ZmxBBf3O4YOZL9iO62O3A1J5g9EqxK1S
         62QjqBszpZqo/1rCfVt9Pd8/LevMD7+9j4iSaTjaw4DvS4J9CQc3tgfbDHZOFGPm76pV
         tQpUrfQpZ+n5IUcxhRZd/3xJMWGBU6ejpWzkeq+g0RDHkaGxH+oY+G8ffDl6TJGKdWoL
         HaMjn8Eb0gU5dItlhostFCv/LjJ/5Raw9tqjJ7lsXha9ar0D7OvBX8L52NtBY7SyNFNr
         KCADXN9364ZEgUW63t7kVjjkp9H/gYzoA7POTmr0fOcZ6TyeLBpKSnIphlxYWc582Vmj
         56Hw==
X-Gm-Message-State: AOJu0YxgA07fRTr01pG+aeIp2pp1tr27LZ/KEbCLoOGvLDGH7htK4TjG
	t9Wg2J2f4lbyRW4ILM8RiYj/F6ntXO7res6yzUVB8+RnZUpFZSRs06++RAy7dplfP/08TcQ/QrA
	Z8bw=
X-Google-Smtp-Source: AGHT+IGGzUp2b6JVLL4RhgMra6xSDHIVC9AeKQlNwikYj9te+40CRk32fV87SGvUC7Z21cHQbzzX1g==
X-Received: by 2002:a17:902:e54e:b0:1fb:9cb0:3e46 with SMTP id d9443c01a7336-1fc0b4b6453mr66577515ad.7.1720960793515;
        Sun, 14 Jul 2024 05:39:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/27] webkitgtk: fix do_configure error on beaglebone-yocto
Date: Sun, 14 Jul 2024 05:38:55 -0700
Message-Id: <feeadc65bdae8ad9ba6f5e5fefa7a2466479fe87.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201885

From: Changqing Li <changqing.li@windriver.com>

* According to latest comment [1] and the mentioned pull request
[2], build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
supported, so original issue already fixed in current version, the
EXTRA_OECMAKE setting is not needed anymore.

* This EXTRA_OECMAKE setting causes following configure error on
beaglebone-yocto, remove the setting to let the configure process decide
the configuration:
CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
  ENABLE_JIT conflicts with ENABLE_C_LOOP.  You must disable one or the
  other.

[YOCTO #15254]

[1] https://github.com/WebKit/WebKit/pull/17447
[2] https://github.com/WebKit/WebKit/pull/17688

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.44.1.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 29e12bb8c5..14f7531549 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -114,18 +114,6 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
 
-# And for armv7* don't enable it for softfp, because after:
-# https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e76168a918
-# https://bugs.webkit.org/show_bug.cgi?id=242172
-# softfp armv7* fails because WEBASSEMBLY is left enabled by default and JIT gets
-# explicitly disabled causing:
-# http://errors.yoctoproject.org/Errors/Details/734587/
-# PR was sent upstream, but the end result is the same both JIT and WEBASSEMBLY disabled
-# https://github.com/WebKit/WebKit/pull/17447
-EXTRA_OECMAKE:append:armv7a = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7r = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7ve = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-
 EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
 
-- 
2.34.1


