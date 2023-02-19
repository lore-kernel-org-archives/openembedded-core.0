Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFE4C678DB
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3843.1676835073406298325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NgsBkDCj;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id bx23so836009wrb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66vy84HUXsxydfVAcK67ZQiq/bANVepc+mW8YZA8fRU=;
        b=NgsBkDCjCY4Slkr1rg3CsbYZQCFiq4zC7ObFjzg00jqcDAkc9vR0fMi44sJMIrQGSn
         NShz21Y+kE9XMeGqPpH5aNxfFhV8O69UWAUzdwDC2NQHVvZ5F6LIR28GPWFEyPktxaqK
         m8h8XypjY47iMgTVUDrkcBqqk/HOiSUeQ6lbnT/d53EqUcbfj5/PxR5hgmiNxE5kwQy7
         Mcb2KMITlA812ZAVRbO5V/vHdpQmNa8XCsDhdQxNGp8jouekdQYl36uZGbH1io4HZrK0
         wIX8ICSI3t28IQODwdcf3tV5uI28GrcxWcQYWlIN++MACMGdpQglYl63XW068m3gNSEf
         GZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66vy84HUXsxydfVAcK67ZQiq/bANVepc+mW8YZA8fRU=;
        b=MCEU9cvTgGE9ZJYR9kpGD1SrLndcmAS7o5extq03x/cJyNnqfaWsGS2ySBZqPrSy4w
         QjPHlyzjZDLbkLLgx1S23GjStx8reYYV/atZkujp7Cp43K3wn3UXLbSlQpd62rled1Tl
         AB9ke+b9QLdQ3ws0lA8dIifJHuBPZUDFkzPpWR9GRydwu+uGo0kI5IsgzdT2d9KBUDUn
         cNYpMOPa7Ww3ouLooYcdaNtvKsZMwMxl8LvVx+BeSDkda0r9yRj+yQrvYRvegyW5oF9z
         pWtdd4wcjIk1uyqD6U3xkI+NZ7X9rKZiNECSrAJ4lwYgZwEmtlSKHsigsAoEuge3bNR3
         NeJw==
X-Gm-Message-State: AO0yUKVdfsPWNFHfWvve+yJdxMFNqnPC3xmYyR+ZlqhQ2WTG3psiE+za
	9RULII659EHQWURtkT5MtLWzGpPr4bI=
X-Google-Smtp-Source: AK7set/q/7+PZrtZiH0bgrOixPZUf/y6ZKjFhKtasdZ9S7cR8tAhL0B6Dt41QfCwa2SfC/tUp9qiMw==
X-Received: by 2002:a5d:4b4b:0:b0:2c5:a6d4:13a0 with SMTP id w11-20020a5d4b4b000000b002c5a6d413a0mr1698275wrs.46.1676835072008;
        Sun, 19 Feb 2023 11:31:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/39] gnu-config: update to latest revision
Date: Sun, 19 Feb 2023 20:30:33 +0100
Message-Id: <20230219193101.338397-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177355

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index e35e9008f9..080704753d 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS:class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "f992bcc08219edb283d2ab31dd3871a4a0e8220e"
-PV = "20221007+git${SRCPV}"
+SRCREV = "63acb96f92473ceb5e21d873d7c0aee266b3d6d3"
+PV = "20230216+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
-- 
2.30.2


