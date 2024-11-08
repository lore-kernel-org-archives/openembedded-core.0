Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CA8D5C0D9
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.14261.1731077651420646035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6pfdlhF;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso1504914f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077650; x=1731682450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSX0VCM2HVdaeQWIhCjPTv7NKn14Lxc4Kg5hFfb3HKY=;
        b=L6pfdlhF8tqCSf5tKMuujuEjFIZcP0UBos+ePn0gWby1nk2fIrwiorgtDJ/cDBhmSB
         xX/URkrBzyhJzoM0f0A8Wzk7DJCZ3MhDhG/GHGv1eN2NsDVg1tHvwduFtqkeD2oSHeO3
         /vpG1wJyswDdY1PQRhNzUEuT5IGWVsFZKTdjkR8LI1RmgeMOkPhQaMVVZKzFyPUiHAOF
         1qRr25Op0baqwXaYRcM0/Wjhk/GRyoCC3e1bp/T51hNqEfnh9120Pui1P6haVNr81WT0
         rNvNT5JtZuvAS3BNE48pJj2XbnQ3HLM+aa9L6YVKw0mNrte9gpOG/3/JmNNm1F/LtJib
         pI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077650; x=1731682450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSX0VCM2HVdaeQWIhCjPTv7NKn14Lxc4Kg5hFfb3HKY=;
        b=Bu20WrrubTz5iCleXApZwQq9sI9mKPHz8XMNubAh8WwFNcQ32lh65hLUklL9WAfYSX
         NEPf8npcxl7npeTU36f7IGgHYPh/i9yyJ4cVALFsN6E4FjRvtGpY3jukpCKs0aZtRWXU
         pI7MWJECh4n/RDPcG9xy5sl1HGNkrB4VvqN3FfW4WJ17sioW6/bMYm2e1Zmj/XhLh97p
         ht1VqU09jnSIcYluE8r7TFq6hW7N6cLULNj2KuhxaPsFIL35tbDND7shqeoXdW8h459g
         DRWKhYin6BQFpX7wxZi9qwmOMosqXynt79hayRLrtO50lf+EcjhRFBjEc4DHeToFu1rn
         MDtw==
X-Gm-Message-State: AOJu0YwT/kH7WqJxtyWzmYGrs3p4g4hsSBMfIWOhZ8OWDOFriNS402vq
	yQ0bwEntjwn1VIApwLXaF3xWTuQmwRLZIxcSoRXpqt44QXw3gk3YkO3wcg==
X-Google-Smtp-Source: AGHT+IEiFgLZ0Xzy+ipox+ICM58wAc+cLhFj6Ed6gKDGEd+Nl9DiLp+ZhXJMvWjWIzGfOBZqOB5weg==
X-Received: by 2002:a05:6000:481b:b0:37d:2de4:d64 with SMTP id ffacd0b85a97d-381f1873535mr2583712f8f.35.1731077649710;
        Fri, 08 Nov 2024 06:54:09 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda137cesm4949890f8f.108.2024.11.08.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 06/12] pseudo: Update to pull in syncfs probe fix
Date: Fri,  8 Nov 2024 15:53:30 +0100
Message-ID: <20241108145336.224466-6-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206880

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the changes:

Eilís 'pidge' Ní Fhlannagáin (1):
      subports: Add _GNU_SOURCE for syncfs probe

Richard Purdie (1):
      SECURITY.md: Add file

Wu Zhenyu (1):
      pseudo.1: Fix a typo

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 134d941609..067fb6b378 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ec6151a2b057109b3f798f151a36690af582e166"
+SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


