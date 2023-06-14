Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CACC04FE0
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.7489.1686734986795407898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sh+ov1/1;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-977d0ee1736so74362766b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734985; x=1689326985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iySYlYNoiU6Ssdz+9DUveBI8ySL1dEive+P5yxF2770=;
        b=sh+ov1/1oIXjFIxY8xsSvzxxghJR0TMC9KUUyv2q5BoUFjMc+9hLGDkxrGznXCsIz3
         9uo7yLD1UTP0JXOvCcITv70JQ8vidwsC81TCySosMrTIEsxJdKjqmf/tCVtulVZWyQS+
         N046e5dnsddzFYYOCZ7yMgfKQ0woei/OBkZKZpwuV0NXO/4r1JwnGBLVduIHnP0BI449
         Vj14QFExZ2gEzMDDd1cp2xYe3hzEBBTzo1Rh6KXoBDS3ze1uWJT6q9Urxi6YFeWMTWKL
         LFRjchiTW9cHEWvs8rSda8ln06EkWDE40PNXo6PXKO1tdBs5p8GwR7Vevem+Oe06psGs
         ceEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734985; x=1689326985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iySYlYNoiU6Ssdz+9DUveBI8ySL1dEive+P5yxF2770=;
        b=eKPozg5p5NMAVN/7bG1V3NBDik3FTwrp96gvEh70CwdQIV8kCWsxhbzGf1AqkTQ9u5
         XiSP0jv5jTQ7Y0x8RKSKi3uvluekLRVsgmJ1iqphMQ+0BBNfSkc7FLEm4XF87BCHvki0
         G+rZIOSriKF+C7u31cXWR2hUQ00t5oY2ai/pIO9qs18J6VmDqr4kgDqfaHQUq+6atWv2
         aYT94FFpoqxFlls3mugMelKUNndATMxwP6rcVkvq8IMbjnhcHwUZo2vwByvyV1dh9owf
         m+IT37wA2U4B76ngA5JkCFjQ6EzLMUd9vJJ9ymNnKF3bjJU6lNvxDTj3oxxfKwRXl1gq
         XwlQ==
X-Gm-Message-State: AC+VfDxDp3w21HJIjP1ddtoF6j8CSfCNjrxgyztSWdo/Nyds8hwuBGDs
	jYSghY2X9qOzVp1Hvf4x64BDmaABmyY=
X-Google-Smtp-Source: ACHHUZ6hbGraTS05vZMVraoJ3a+r9INzI5bquXUjMoX1SJ8QqafPuLzA6gC8Z+TD5F8RkJaOBqAErA==
X-Received: by 2002:a17:907:a0a:b0:958:4c75:705e with SMTP id bb10-20020a1709070a0a00b009584c75705emr13664912ejc.17.1686734985176;
        Wed, 14 Jun 2023 02:29:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/55] mmc-utils: upgrade to latest revision
Date: Wed, 14 Jun 2023 11:28:55 +0200
Message-Id: <20230614092918.4065570-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182777

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 1e2e17bfd3e..373ada2026a 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "d4c2910981ff99b983734426dfa99632fb81ac6b"
+SRCREV = "958227890690290ee766aaad1b92f3413f67048c"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.30.2


