Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65863EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:20:18 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.15995.1687450811379526287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mWGEtgZ/;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-400813b8d56so3599621cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687450810; x=1690042810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqbKrfiDHHYqmTfRBlLMS4Rl/763JW0Os/z2DTfzLdA=;
        b=mWGEtgZ/tLoIMklItkDy1rtXF1xcHAIq2tnmzkRwIxz9VHmv9yHbNP2y+rY03Dq/hQ
         EJbag1LCg+TKlJ/Kjs6qQaS9Wv6LDicc5PeTRHD4eKR7sUiCoNT8hrtNR5/S+P84VcNp
         qnPuUpWP+6opA45RL3/zGY2M3koRTeC3HLHw6xnQ1I4oFTFOlpD4HZ8HI+4APxnAMLny
         Kz/LIVc0cAHOAkyGxZT9Q5dtf1tebKZAdBbKCm88rIs+DDEhThcNwsHMACdei2AO3oAD
         xOgNQL+B/uOfQy8z8AEHPut3hKAVw3eZ8Puy0gmkD3EbFTlqob8ufSz2Y1KJr5uf/4+N
         IADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450810; x=1690042810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqbKrfiDHHYqmTfRBlLMS4Rl/763JW0Os/z2DTfzLdA=;
        b=LnsyaxDmjFfYYZFe7cpc+M3OxRuHHW2CZYbroeUj9PHLjkFa1/s46e5wXm+lXhQDr+
         /3yGBD8FquHgAu/EZY5n4lShDTK+jEVD8gM0bizsdtJ2mHZgfiAoWdPeKxIGS0Klo9I7
         89jyKW8IwaCAX8Z8tzH/32nLAZUA5gBFRCJwIjQbkOJVl3ta7pdF2uA+P90LfH5zCXvu
         XHgofVIhdevNgLVWLNG0SSrZGvETrqVtItp2YnnViHlegH6jIpg6c/SVHHjulRxu4vwq
         u7P6+2bIvpJvU8BcfaSJbJthw9Hd7bfm0be+Uz8pcLzFitptq9RX0m3wpuYrxxM8TC19
         BojQ==
X-Gm-Message-State: AC+VfDzo7HDoWW6gylGTrxx8a13eAEjQn4uADDWP33nOi4LfLkdh3dKX
	gcv/uBLR/tCgk4DJSfmCtUc5QsNhVJg=
X-Google-Smtp-Source: ACHHUZ7Q2GxrbwnUJMNlWyZGSnj6gmZ5/Z97Bh2Unu6AFFFU6cqCIg9g9GejdBWFKaQgwvSA1hQRqA==
X-Received: by 2002:a05:622a:15c5:b0:3f9:e08:28a7 with SMTP id d5-20020a05622a15c500b003f90e0828a7mr20041253qty.38.1687450810191;
        Thu, 22 Jun 2023 09:20:10 -0700 (PDT)
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id l14-20020ac84cce000000b003f7a54fa72fsm460698qtv.0.2023.06.22.09.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 09:20:09 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
Subject: [PATCH v2 3/3] bitbake.conf: add debug symbol for sdk
Date: Thu, 22 Jun 2023 12:17:52 -0400
Message-Id: <20230622161749.797820-3-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183265

From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>

Without adding debug flag nativesdk dbg package is not packaged since
there is no debugging information

Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
---
v2: New commit

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9d9b268858..0635affbc1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -601,7 +601,7 @@ PATCHRESOLVE = "noop"
 ##################################################################
 
 export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
-BUILDSDK_CPPFLAGS = ""
+BUILDSDK_CPPFLAGS ?= "-g"
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
 TARGET_CPPFLAGS = ""
 
-- 
2.36.0


