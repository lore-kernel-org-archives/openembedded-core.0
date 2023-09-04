Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAAFC83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 08:48:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.43830.1693817318421932806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 01:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=JcY3mDw7;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-401da71b85eso12110785e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 01:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693817316; x=1694422116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uCTOfYh+QevYGpxgloAQlWveUuDwNrXwb99k/F7sEo=;
        b=JcY3mDw7tgub66pDCXv4hN+UvNEqq5lOXs//mJjLbEisd9IIV5K36qDBc/ikitffCZ
         7DAbdpJC2o6ErDMEAn690pmGGtU6Gz3Lnv0/TjXz9sNeV6Wz8U/ReTEEw+CzZ8ON4I3u
         eildDaBaNfC9yJJxJvCMxnZKkIWs5ahuRyZED9YpKChRgA7HteNKQfwJl8ygx0T1N39G
         YBDD/thBkePi+ftAK6toqcW4oI+IDt09MXLDkRhX3T5imzhQu7jZCGAvzvC0E1mV+E6o
         da6A7FVXQo8WpKq2ylYv8EuiM3zAcF+ZD7iP7l5BeXBBAvlMlqA0HwvoC4Cge2gFBWYa
         CK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693817316; x=1694422116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uCTOfYh+QevYGpxgloAQlWveUuDwNrXwb99k/F7sEo=;
        b=EHrJKOnPoJgci/3QO8Y4Wj5ncotLNacKMRuj5Ok8vwjCWzqe5kPDwgnRYcZD2Fs6fs
         HBQhhoFxKSYLyKYEmVKPxrZ+TKXk8sxzuINbf3a5Dkn7FKkKFp0gpWl3745SFEIpcLdJ
         f+oshEUKsZ5GYTUqlIT1y5Fj4MWwYPfRTAN4jWEItdjJ+D8j7CTU985LFL1aUhqOg23U
         uWKhk7F9bbQ5Td0DGrSR1flhJZqKaIY0sekY+Txk/434dS1OD1o8LMzNrWWJaWB8uzn3
         CF0X4+AAMLwooVDnm91athpi29LMEpH5++xUpTAMRtb74h2tTEMfgTdq4RL+UQhW80uG
         uZjw==
X-Gm-Message-State: AOJu0Yytji3tIqd/Orl4X4rytzgY7h1LVeHFeYYQBu5P0lf1Nx0UCBbW
	EzRJaKhmmDmd4QDvXy1vObOp/0Dry30VHg==
X-Google-Smtp-Source: AGHT+IEAeH8ud8knQ9BWPn7xhYb+KonPjnZiroaKQ9wKyaWoQYRXQTAqqHTSuJJi0veSD37mM79uXQ==
X-Received: by 2002:a5d:6847:0:b0:319:8161:ecc6 with SMTP id o7-20020a5d6847000000b003198161ecc6mr6110597wrw.63.1693817316161;
        Mon, 04 Sep 2023 01:48:36 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b0031ad5fb5a0fsm13843265wro.58.2023.09.04.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 01:48:35 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH] nettle: avoid neon on unsupported machines
Date: Mon,  4 Sep 2023 10:48:27 +0200
Message-Id: <20230904084827.4135108-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 08:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187165

From: Benjamin Bara <benjamin.bara@skidata.com>

Disable neon if the machine does not support it. --enable-fat also
includes the neon assembler code, therefore also disable it.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/recipes-support/nettle/nettle_3.9.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/nettle/nettle_3.9.1.bb b/meta/recipes-support/nettle/nettle_3.9.1.bb
index 6bb76a6217..396708cf87 100644
--- a/meta/recipes-support/nettle/nettle_3.9.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.9.1.bb
@@ -30,6 +30,9 @@ EXTRA_AUTORECONF += "--exclude=aclocal"
 
 EXTRA_OECONF = "--disable-openssl"
 
+EXTRA_OECONF:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," --disable-arm-neon --disable-fat",d)}"
+EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," --disable-arm-neon --disable-fat",d)}"
+
 do_compile_ptest() {
         oe_runmake buildtest
 }
-- 
2.34.1


