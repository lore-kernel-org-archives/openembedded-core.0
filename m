Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9677DC4321E
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:00 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13210.1668953752749321267
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KT8wyWVI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id j12so8429809plj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJkqDg3jqNA1e3oD7rKD20kN/ACICF3i0XLV0LDWZpM=;
        b=KT8wyWVIMNmRzOgfuBS8d2M1DGuw4AoJKLNd2GYaTsMNPZSa6Wg6jcCVKmMXcPifAi
         VW3Jdtkvj4ttXyWwNb3E08vckrgY1IEufGSRaSIx5lQvmAOAbcBiZdkbiOAILlkOyURL
         XUEfdF7dSKBREIFNdXqCiWdLybTpYjVAnV27sp9C2IGgYV61CofmkM9mlM8rFEBLNRtb
         YlrX5gEGQ/MqbJ9VTcTyvNjD8BlV6c04OkyX00DnixCXyAJGBuXEGD03C6xy16cYmvOH
         PJLkDfZNKI7IL8j5kP1o1WC3TwhzOnjvvaPOj/JC6elKjGhQLC/ntScbLRSngOYq9ebj
         amdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJkqDg3jqNA1e3oD7rKD20kN/ACICF3i0XLV0LDWZpM=;
        b=hOx0OVdNRvlgnh6+GBF5A2YqsRotwtyaVi7cadriitO2zH4w7MmzIEn42/5NV9oD5F
         ovdglDZbMHx3hAd8GSq2KlxiLCgdMW3pJ2kqz3K2g/u6HIV28bLkXD1jxv1q65Eh8QZC
         3UfxwsN/cZc2mdcW35zz+pVCNIVC5JZjAgLiV7y6vZlGgfdLViI05tEMGNCPKkY6G05O
         8B3Pny28qt6KVlIMpKy8IKCds5xej2DTw6E7UbDtAr4EPBzqpo8OIvqW9PyWNdIhz+vC
         BiMwYEul8P5rguljFcsG2Cs7mFwcigmDHyTmFYlk32tSVtipka1KDJnATTITKOljFHhN
         ZuCg==
X-Gm-Message-State: ANoB5pm0TGEaqGwND3+CzzgmpVSLvEXTxdxRb2sYGvwL3rT54zE23/+a
	NgtuFaninaJCvXyVnmNuaMiq6DOY1UUQAjem1G4=
X-Google-Smtp-Source: AA0mqf7qvW6Z7nsunbPr+46xVMDpa8qUjooPvdn/KFIN6SiUz27uzZlCX759y99UkUY7f1IemRHgvA==
X-Received: by 2002:a17:902:f80d:b0:186:5d84:604e with SMTP id ix13-20020a170902f80d00b001865d84604emr7738576plb.85.1668953751468;
        Sun, 20 Nov 2022 06:15:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/35] lttng-tools: submit determinism.patch upstream
Date: Sun, 20 Nov 2022 04:14:57 -1000
Message-Id: <a98c076bf29d1ee795cc6bdd6676aeb6dd751331.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173608

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bec62455d900a0d3e18a62ea7053c214bc545fb6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/lttng-tools/determinism.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
index b2ab880bd6..0a897a8e13 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/determinism.patch
@@ -13,7 +13,7 @@ to me whether the tests need that or not.
 
 Fixes reproducibility issues for lttng-tools.
 
-Upstream-Status: Pending [needs discussion with upstream about the correct solution]
+Upstream-Status: Submitted [https://bugs.lttng.org/issues/1361 - needs discussion with upstream about the correct solution]
 RP 2021/3/1
 
 Index: lttng-tools-2.12.2/tests/regression/ust/ust-dl/Makefile.am
-- 
2.25.1


