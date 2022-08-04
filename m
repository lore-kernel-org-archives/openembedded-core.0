Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB16C3F6B0
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:05 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.708.1659653878542495263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TOYAcACN;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id b18so915338qtq.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=OQDxg/kD2KV2SvML6Lio5H0HDf6/1c26UT65f0dPGp0=;
        b=TOYAcACNA3DcWjMfW0YAwX9AbFLLnUkLCJAELDWrG0xARgRnI4CoaYPJ/JFCdJCkfQ
         A065kvlNSBM+e7XY8JmpUCW0t/qaYm5/1jtAG9teXzRY1BcvUA6ElezEg1fv7EpYq4DH
         rOul8z4DZyLHe8QrG2uNRTnQXOgwV2a7/nhkyBhNp0cVyPUlywZiQbLlZnWLPX1jMNu2
         SY0Vx9FWjCCbptkEdgCxl7nXkHolb/5OZZHqVA+IcBzcd3uz/ZwL082fffZoseNsuCPc
         akbjZ6vArMkUMa0GyyCpwM5C513xDDAwz5vZAd4wflHNcrgBheLvCUd4n91J6ELtuwcw
         vhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=OQDxg/kD2KV2SvML6Lio5H0HDf6/1c26UT65f0dPGp0=;
        b=JpZqLkV7D9WjcfLbXsehf0Bz9Jm/OutbBtIH6PactUrpB2ncyUHj3o4X/exeyfJvpr
         dqF6PXADctaSWdPOxSJiYmI9fgK+ALOZuD4s/E05wNBDSwnGLrRIRs2Ts7+DC/FCHGo3
         0Wu48FdcdxaeIdH8oyds8PdVQJNuOCl1aoc4gNEU4AP0PiJuayDMtssRBkkXmLxud9Is
         9KgcxiAwqUEPScUmIB9t1UMmhJ1hCAYQspzob4GhbD6uzf3C47u4T3U/iJNS4attSVQ9
         Slg5WGCYtLuS/Rw3p24iSpcq3Bo/k0CtK4HeyXCA90mhkVDFQCMGORDl/qIj5rIQQeLf
         RYKQ==
X-Gm-Message-State: ACgBeo27bKK70NaUodPTdS3j7vAZQJn/iek7eSaWLELcCV2MLxTkbL5w
	2HrOSwErlAXUt5KNDA2fnrEt+Ct5tkpylw==
X-Google-Smtp-Source: 
 AA6agR42ak8PeOX5iUPKyX4khEEf+98QDgCZ7bwLCx2gjQgJ4Jev9PQYwRiVISkzfNqN0Z4AtikZHw==
X-Received: by 2002:a05:622a:1708:b0:31e:ed2e:8224 with SMTP id
 h8-20020a05622a170800b0031eed2e8224mr3450920qtk.138.1659653877526;
        Thu, 04 Aug 2022 15:57:57 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:57:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/13] linux-yocto-rt/5.15: update to -rt48 (and fix -stable
 merge)
Date: Thu,  4 Aug 2022 18:57:40 -0400
Message-Id: 
 <1a2c733cacc114b6a81ffab8f622eea99dbb53f1.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168867

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
2.19.1


