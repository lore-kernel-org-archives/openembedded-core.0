Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B6EC43334
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 21:25:41 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web08.20345.1655069134231738430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 14:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=itcWeQEX;
 spf=pass (domain: foundries.io, ip: 209.85.160.46,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-fe023ab520so6173508fac.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 14:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SA8F8yVEXs9leuBQSqR9u/jCEwRXsltsbyZW8Qj77nM=;
        b=itcWeQEXt/nkhlWZkctkB1CPT9cTkbIHefqkkpMN8tOJ3Lt69kPMQBl7Lbr/eBTsoG
         rHOtdLqlt4PeHGvD/8Lc9ZY47UWYwSX+Bh80TwO1Sef3mqqcIvDDNpsHti2e/fw/aXHv
         rijP/TlE7siYVycoD3ICLYEbYfp5jpiWtnTv5utLzL0dReokitHNQGLw3lAU43lyL6KX
         uWY311n/g7g/2Xg5XGRBfi63OaRoerKILjFGqupfQyoDjVgOM1SClOkqMVs2/2f/MQ2v
         OsvUPbX1IkMVAOFXq+0jnN5INxJYVEcbzvR2qNTPA5rnHFjibUCu6nw0zgP1855+/g0I
         poEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SA8F8yVEXs9leuBQSqR9u/jCEwRXsltsbyZW8Qj77nM=;
        b=0v2b9awKDFN4GwJ4xb0PnpeYcWfPj7pkahGu0K9nyAroLokblVbWa5bS9HrsIHJckx
         bbmv5R/jlhQSRdQPS78r6bCkavG+FpPnfq2zOaLokFz3f/GhjeLRK6BNkNCgovot5Y3m
         K8AEwrr1SVw2dyjoxBO8r8hCh14qVOvCQ7XqG3a+drMwcMmQQGwWdXUL6sTL09e3VfBv
         d++yWJnJfHbTOwFCuibGV2GtE0BVojxzmXVXC67OyjqPQoqA2qMCmTvhNu11btgqv5cf
         Wsqf6eOGTWtRi7nVkMKGXdQiRek8dEAW1Mxdx4V7iD5S5sVt3y8gVvvi2ihV0xFG39lT
         ZMDg==
X-Gm-Message-State: AOAM531WZWuksu+YT4YxvpBBy1T6CiP9uGPDjGWILee6B1wOJiYLT31c
	9KLn/RkjB0NF757011jir/etWd8ij+6rBg==
X-Google-Smtp-Source: 
 ABdhPJwli5yLbwdZ7xGN61TeEBChSx/Pzpy8bzlmmAuogXL0eeH7IdCF5jzCavA9UCAA1CtKRbr1lA==
X-Received: by 2002:a05:6870:4788:b0:ee:3a:8ab3 with SMTP id
 c8-20020a056870478800b000ee003a8ab3mr5511999oaq.231.1655069133229;
        Sun, 12 Jun 2022 14:25:33 -0700 (PDT)
Received: from lola.lan ([189.55.41.141])
        by smtp.gmail.com with ESMTPSA id
 a25-20020a9d7259000000b0060b1e040014sm2654230otk.51.2022.06.12.14.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 14:25:32 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [PATCH] python3-pip: Fix RDEPENDS after the update
Date: Sun, 12 Jun 2022 18:25:19 -0300
Message-Id: <20220612212519.3422207-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jun 2022 21:25:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166827

Fix the following error messages:

   ModuleNotFoundError: No module named 'distutils'

   ModuleNotFoundError: No module named 'colorsys'

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 meta/recipes-devtools/python/python3-pip_22.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_22.1.2.bb b/meta/recipes-devtools/python/python3-pip_22.1.2.bb
index 0573db603d..5fe59a4762 100644
--- a/meta/recipes-devtools/python/python3-pip_22.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.1.2.bb
@@ -54,6 +54,8 @@ RDEPENDS:${PN} = "\
   python3-unixadmin \
   python3-xmlrpc \
   python3-pickle \
+  python3-distutils \
+  python3-image \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


