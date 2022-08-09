Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1242C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:28:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.419.1660080491575888147
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5CbT5D0S;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso183509pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3J5NNsrHRu+3k6bXPcbmUy3GoMTaE9nlIzAgWL6ihoY=;
        b=5CbT5D0SP0d6KLpPzWfIPlAW5MH0wONb6CkLqv3U6rk89LI9OwxvB7KiHfIlGVKrQ2
         FVlT7dRLV2ahdkS0CN6d0j1viH4dPuslql9xmPGNGclcuYh68IRGHD+n5T/VogpVvqmG
         ZJ2zfmL2lgbYcrTyABYrtUvOq18tji87FnRezmwHKCLCkP15WlHXWNf04P2AQ13OYoIy
         2Dagku4EBtmW00YnfkPw6oF5yya16KMBeDZ5y4nAdaFKQ88ghL90ElgX2YboUYjDNr4m
         pOYj+IibGFQU/FCoCpQIDyQMle0+fXuZxY+A8EkDXX7UufwjgmBoFi1TGy9xzhgv3YpN
         G6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3J5NNsrHRu+3k6bXPcbmUy3GoMTaE9nlIzAgWL6ihoY=;
        b=mt3NxWPLqVafFtpeKPfh+kHELxPG0fENqU8Pq9UrS8h/A+fF4YSPHCNQuNh8txip2B
         iRx7Db4wsk7MqBXT/BQQ1V1KZuXRe9wCe55rVB9/EUj3SWVhsqhDP+h/L3cIRKWz57t7
         lskywk5KPoktTsZ/vjmvMz2d7hfYxx5jm5blvSy9L162isOph6vRWbw2N37loMIatRQY
         K4O2gKc0ku1aR6Xleu56eRXpDHtvgd1eT4nQAbIRxrh1hjLnxDi9IpjjAfhDgBMUlVls
         W42iXnFyVlC9njnLNEuftsusUJ74G5u1WFidM9DMwQa8q7I3tAW5lvP8My5ylZILrqmT
         D9Qw==
X-Gm-Message-State: ACgBeo09uRZvED39J6zimuscZYGtlut1V7Yq8kdjEe/SUlUuV+QQKzwt
	HwzSkp8gaNx+nQ4fM6csnn5jiqCva+jQ+aNb
X-Google-Smtp-Source: 
 AA6agR4tajkRL9TL8ryHYdZHZ4Yo0GBCbolepINQ7RqM4IZdbqK5OoPIAVCIKbFixtIJ6TFj1BY1Gg==
X-Received: by 2002:a17:90b:4390:b0:1f7:2cb1:9e43 with SMTP id
 in16-20020a17090b439000b001f72cb19e43mr406704pjb.91.1660080490592;
        Tue, 09 Aug 2022 14:28:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a17090a4b0c00b001f4d711e165sm62273pjh.11.2022.08.09.14.28.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:28:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] linux-yocto-rt/5.15: update to -rt48 (and
 fix -stable merge)
Date: Tue,  9 Aug 2022 11:27:38 -1000
Message-Id: 
 <ffa3332f656b82076ca613cbdc07367dd9dee0ea.1660080350.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660080350.git.steve@sakoman.com>
References: <cover.1660080350.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:28:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169167

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    6bc08dd702bb 'Linux 5.15.55-rt48'
    9a1a3c0162ef sched/core: Always flush pending blk_plug
    f178a16e9368 crypto/cryptd: fix leftover hunks from 2a30446f4
    0e01a5c5a80e 'Linux 5.15.49-rt47'
    2aa2253a0595 'Linux 5.15.44-rt46'
    c94ef3468bef 'Linux 5.15.43-rt45'
    264141c33af3 'Linux 5.15.41-rt44'
    9934b33b68d9 'Linux 5.15.40-rt43'
    ca63907ee4b7 'Linux 5.15.39-rt42'
    238b266d7aa8 sched/deadline: fixup -stable / -rt merge

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a95f9299cc178b2b7607c312086b768ddf322a56)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ef47daab6e..7560ce8241 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2a966fea899c00cf90fa1b79b9449e4ea384e9e4"
+SRCREV_machine ?= "6bc08dd702bb8993f84d81ad426fd9acad26cede"
 SRCREV_meta ?= "f45197776b360447cb4df7bc1e74dce6f8ad52b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.25.1


