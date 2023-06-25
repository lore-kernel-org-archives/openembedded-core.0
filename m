Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F37EC001DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.20351.1687728175064042798
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=W5xH2kDZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fa9850bfd9so1093255e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728173; x=1690320173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2D3hvLDkvLBmFTfV3pNdwHBlWJshbGXxM+5Ra3pjh/w=;
        b=W5xH2kDZMwY/qlMofS4/4VW1pVMswKVmYdrNFN1Ti/MArvxK4YJZulQXwvFHaWI1+w
         Wmd6bjaNrmQ4fzLy2/luJdcWqpjJXfrOBo8480AytHOZx5PXMbj+8AZ4HEX17JhkA6V7
         V/hjvMIzdOrZ52QqZsTcqnc1XB7Tq+fznFWp6bz0upHWniUPW275Br/AB7ovkHMHzTGu
         pgc/soRE6sljPN6rN7+9vlTQjqDcRwgoUItPLUB3nYbE135vTKoLB14dWGWknfUZuGeE
         jKOVOsbLT24I/8WNIV8uGJtqtHWUKSaeZ/CNK/yS+bDpDvM9OfIzBYqnoZPob9g+JGVP
         J5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728173; x=1690320173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2D3hvLDkvLBmFTfV3pNdwHBlWJshbGXxM+5Ra3pjh/w=;
        b=BnDlYK94igE103F35lZ5lon7V5TNWNzd2PNFK4dcgM9LpdjLDquulBZs3zCGg94ajy
         nc2OXjEu35Ks4DK5Dv2/9Vi+IKefY4imz6syI2pVvPeZ4yeBqeKjGqvGq7Z2kNQmcIhK
         tVTaSdeoTrOXOFQahSguDJXYwpUeCtnC5UZZHdbgllqaA+RnFHjYRBXuWKzsliHkZ0qb
         YgEwrpMF310JUk+9bFVgdzJQWnDTI6D1E0yDr99zYpCvubv09miJAeM8k9ZD0rLpqa0P
         LoIQcqT+Aufz0Pl8G1WL2jogypg6Ewjn3uBbMWcjd0nny6sFTuYH5LtgHJhdOzJB/FMQ
         PMoQ==
X-Gm-Message-State: AC+VfDwsHcj0qLYgZRIv/93e3db81QLXupSkK5Ya6AWimtk7rNNB8Hj9
	gsFP2ADlzOOz2PmNpxYsTfNy4p5NWndFxA==
X-Google-Smtp-Source: ACHHUZ569dfmhOc0kSBHzvelVfxf6r3SEZNvVALP4kNsbXwUmcT51qA/MZF/b27S1bpMuekXu5AzfA==
X-Received: by 2002:a7b:c7ca:0:b0:3fa:77ed:9894 with SMTP id z10-20020a7bc7ca000000b003fa77ed9894mr6334509wmk.7.1687728173496;
        Sun, 25 Jun 2023 14:22:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/21] libdmx: update 1.1.4 -> 1.1.5
Date: Sun, 25 Jun 2023 23:22:37 +0200
Message-Id: <20230625212241.915739-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183392

Upstream has migrated to tar.xz from tar.bz2, so default works now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libdmx_1.1.4.bb => libdmx_1.1.5.bb}            | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libdmx_1.1.4.bb => libdmx_1.1.5.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libdmx_1.1.5.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb
rename to meta/recipes-graphics/xorg-lib/libdmx_1.1.5.bb
index 3634d532082..96015ad882c 100644
--- a/meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libdmx_1.1.5.bb
@@ -15,7 +15,4 @@ DEPENDS += "libxext xorgproto"
 
 PE = "1"
 
-XORG_EXT = "tar.bz2"
-
-SRC_URI[md5sum] = "d2f1f0ec68ac3932dd7f1d9aa0a7a11c"
-SRC_URI[sha256sum] = "253f90005d134fa7a209fbcbc5a3024335367c930adf0f3203e754cf32747243"
+SRC_URI[sha256sum] = "35a4e26a8b0b2b4fe36441dca463645c3fa52d282ac3520501a38ea942cbf74f"
-- 
2.30.2


