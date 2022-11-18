Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A0EC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:52:30 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.49.1668793945037893943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ikMQodXb;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id jn7so3344412plb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 09:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WApGqkHI/Cj5t6Ujg/nlXc2pDxZXNMDnadCVbALvgSg=;
        b=ikMQodXbMoeV8xzDNC2qyz/cCEKTsqCVMCeTsFgpzM9lOYtxaSmTJUwnH22OW5NRFu
         yuba5O9NXeUGEsqAy12KBaIRdGWiLtTA1x/Tac07JODk8UIbdZueoUCVMb6x4rCVEJIe
         gegKhN8dK9E8pT+Zw4uRNQ13PL5CnXfsbvKH/PjeApoPs91hGP79l16AzMaL67BXwioq
         hhzxswX7Vq9GS5W4XLNKK7+e+PrD2GwrA96Q9CJ7k+rFxQk4ZZ58i0sgnyMqwSAQo8Wq
         QeQmzij88HXnRHWYaxgDMmO/776wkL5nVWhr8Rh+ZvvL8VFIZWqdN+My5zhKpN7wYvMy
         obXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WApGqkHI/Cj5t6Ujg/nlXc2pDxZXNMDnadCVbALvgSg=;
        b=1eyyhdcLqMvI7dls4R1UpkL9wXC37eFULu3xj2/tmJyfTv7SOOA7gQctIs20RE9dOM
         ra9XR2Kvr9qjv0GtI6XFUf6S/2dhUs2xENAfjR4G+GGySrGot4bJggZS/8TwKMko+M6i
         1g+py9aShjLqbG8eHBdq7n+xanBWhTJzVe7npCgStYeyNgBEIS1XpUruL8QGc2OljXlG
         v8wO7H3Hvpc1nbr1ewMD1n6yS8WZfQe5yCgqo8XshLeSlJ6N2jWG1NelMieoSQxvZ0m+
         D9xi/v5ZwqMG18oftWrGCzkkoGswL8SeIPg32FDLZlIwShCRka7X/kqfpUXKRWrWcsqT
         OiRQ==
X-Gm-Message-State: ANoB5pkXAo7O9tia4q7JyAraNmswzbtJXJFz90ECwb8GnojwHO0D2Iuj
	W1BxujohFzwrr5Fj152Xu3y9MJrgEjqfTQ==
X-Google-Smtp-Source: AA0mqf7xGIqmeVi7z4PrTn/RtHCbjnC3MpwZ53tEVYIAinjFCj9B4JXxLOTuhTRu5RLTLjzi6YFh0g==
X-Received: by 2002:a17:90a:71c5:b0:213:b0e:ede8 with SMTP id m5-20020a17090a71c500b002130b0eede8mr14776725pjs.89.1668793943945;
        Fri, 18 Nov 2022 09:52:23 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6693:e191:c3fe:39ff])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b0056c702a370dsm3443173pfp.117.2022.11.18.09.52.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:52:23 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] mirrors.bbclass: update CPAN_MIRROR
Date: Fri, 18 Nov 2022 09:52:03 -0800
Message-Id: <c74b3d25c9dfc060f031c6a6feee754675131f8b.1668793524.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1668793524.git.tim.orling@konsulko.com>
References: <cover.1668793524.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173483

Both of these redirect to https://cpan.metacpan.org/:
http://cpan.metacpan.org/
http://search.cpan.org/CPAN/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes-global/mirrors.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 8b984de3bfe..cda431ce891 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -67,8 +67,7 @@ osc://.*/.*     http://sources.openembedded.org/ \
 https?://.*/.*  http://sources.openembedded.org/ \
 ftp://.*/.*     http://sources.openembedded.org/ \
 npm://.*/?.*    http://sources.openembedded.org/ \
-${CPAN_MIRROR}  http://cpan.metacpan.org/ \
-${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \
+${CPAN_MIRROR}  https://cpan.metacpan.org/ \
 https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \
 https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.kernel.org/yocto-sources/ \
 "
-- 
2.30.2


