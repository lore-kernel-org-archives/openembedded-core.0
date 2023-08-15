Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804B2C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 13:10:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.133751.1692105038747972414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 06:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GyLJnMam;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe1fc8768aso53987455e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692105037; x=1692709837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7OAM1L/51LjRbpVvmzJ+ys5WMPc0k/0nCl5sfTXJp6s=;
        b=GyLJnMamGM2hKHjat7Wyr2F/8TybB96tiDhvHSgjn89ynJTq7jiQTAC+yGu94tWlK/
         /voMlM2Q36+lguvJOcAErIaOFerrrfQE/sZi5V5FuRyPDPXJnUSdr0WCR1Ierx91zm5Z
         NZ3vjmSCnbWZak5tuTt5Fg63t3nfYlhIFVXD6P6fEwGz1baD1HaPMdpgBy9isVbwoAsF
         I4T+Rww/60gaESQyIFmB4ec2gtifPddTjSuEIV29QjPD5js0f4BNmL9iezIB8rdeMn5o
         uGv5zu0yAknCtAfcUM6tw3Xvm9c+HMyEzmxlOUajRgP2+DRH9i18OlnrojD+grSqhbWE
         XjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692105037; x=1692709837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OAM1L/51LjRbpVvmzJ+ys5WMPc0k/0nCl5sfTXJp6s=;
        b=VMO0y5bV/3EKi7FgO2712TzA6n8A/Fcw130Rn6GyagwTE22cxXhkltNDW3mvWEyiel
         dH8vU3RXV3owagrm4U2Ngk7avt2yPKNpHCkLg/4zlUnN6+AxZAXKFLmMbGN1y5DSu9QF
         tfvZ/fl7UDFwQDf7ICos9frxRWp/NW3+4y8r+P4pHwuWaCl/4vxklPmxk/g+72T976QV
         mvln37dO7gwPOVAUKnE9Lvx3kbWWB3qt8E46BdeqQgv8QOpwJ6xJ43zB8jxFTrMZrQQ4
         Y8U47gnuA8FH0ERM2g8gvqcxzAb0tVKennSv1fURQ1VO6fc2oV3rRH7uz5uQd9c5171k
         11tQ==
X-Gm-Message-State: AOJu0YyD2qj0Tiear4gY69eH5tSPgDYLJGVCYRdA0yeBIohdyF0qc6mb
	fy+lPW6kvV7u4dJsfi19jWmiAo1uqng=
X-Google-Smtp-Source: AGHT+IFSoT0PiHrmpbXlt3Vkjc9DeRQT9OOr05+eHDopnPP45LjnyL62M8LX9/uhAAdc6rPkoVNniA==
X-Received: by 2002:a7b:cbcc:0:b0:3fe:238e:b23b with SMTP id n12-20020a7bcbcc000000b003fe238eb23bmr10332636wmi.36.1692105036688;
        Tue, 15 Aug 2023 06:10:36 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c028500b003fe1ca92151sm17618335wmk.26.2023.08.15.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 06:10:36 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH] libxcrypt: fixup upgrade 4.4.30 -> 4.4.33
Date: Tue, 15 Aug 2023 15:09:28 +0200
Message-ID: <20230815130928.983960-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 13:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186064

The package version of libxcrypt is still 4.4.30 where the
libxcrypt-compat package is at 4.4.33. However, both packages
(libxcrypt and libxcrypt-compact) share the same .inc file which
referres to the sources at 4.4.33.

This bug fix does not change anything on the target device. It only
fixes a build-time issue when a package depends on libxcrypt >= 4.4.33.
For example, this is the case for nginx 1.24.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../libxcrypt/{libxcrypt_4.4.30.bb => libxcrypt_4.4.33.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.30.bb => libxcrypt_4.4.33.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
-- 
2.41.0


