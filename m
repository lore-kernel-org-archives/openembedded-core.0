Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF73C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.4963.1647674182485806388
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p8UIdJsD;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id h16so5367326wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2veV1w7edRK9n1coMxE9EUWMmcCnyVOMSlzJK9GWFlM=;
        b=p8UIdJsDcQHFT2z3ZX+pYcw1QWUKeCyLqzl56zLZeLR30UPLNzVvgvAy0uHBFJ3YbR
         r1ZihaglQxsjLvZnA1lh0eGUoUe+zPiSdiAQchEzVj0/FjOwEIno9rqG9c8aaofmemzv
         6VGC7M2XrmG952Gillg5oCJCIeJCQG6vN8VaZnC1dpEcIdnb27/F37KI91rWoh33s0M0
         +kKJIgftryhDxz5DUPbv/bwUB0shXU3skdpNtXPhHB7ABNr1P5jTYmm9np9PMCJe9h5Q
         u/3Q6NMXWTevKTyNM5ujlAMDBlatrUFeHgkJTCxRuzxu9GGs4BpY5W7qUnQhLCIpEBIU
         C4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2veV1w7edRK9n1coMxE9EUWMmcCnyVOMSlzJK9GWFlM=;
        b=QrJoSAsxZniOEHgseOTkzirrJe/fPaLROs+ivYBDqW5gh56d7V1yfRkDFZgI6KBv0V
         7wUWA49groiGEuviGKHn9I5qphTpW75vn9QnKowUfuZgG64VTKpJ7t4CgBQQeSCP3/X+
         B5LZSpX9WrZ24r0q1xe68zJeC84jsV4gbA5+cM2J5JY/hs2eQTsqGMj9yBjMVkkyq0fi
         KgAsLV6LmV47aZ1IBw7Jg52x9MwCgooJUlnuvM54CwUWXa+TV1yDsCvwLHleNGSBIIiW
         GQS2jY3xr/cHdYG3B+iyH/XFYUhdrmRBV59s8rS19XkidGZCuooLLLr9VEzr3KTe3fwE
         SAsQ==
X-Gm-Message-State: AOAM531D4C8QSxJj9WW4k5D78duwKPxkhtt1Y7qDZ5JIcFcJ0wiIm4sV
	0inoeP3C4Odnr2Adry2R9YIaQHgSp1k=
X-Google-Smtp-Source: 
 ABdhPJxEbO9jv710c1/Lw1edgckMTH8Q0kYWTxNlWWGQpCSTNVf/FLHbG4ldj+jysYjyXf0sDySYQg==
X-Received: by 2002:a7b:c928:0:b0:38c:71e5:cb59 with SMTP id
 h8-20020a7bc928000000b0038c71e5cb59mr12915761wml.186.1647674181105;
        Sat, 19 Mar 2022 00:16:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/11] meson: upgrade 0.61.2 -> 0.61.3
Date: Sat, 19 Mar 2022 08:16:03 +0100
Message-Id: <20220319071605.152904-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163465

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/meson/{meson_0.61.2.bb => meson_0.61.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.61.2.bb => meson_0.61.3.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.61.2.bb b/meta/recipes-devtools/meson/meson_0.61.3.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.61.2.bb
rename to meta/recipes-devtools/meson/meson_0.61.3.bb
index 8304bfdac9..ecc6272998 100644
--- a/meta/recipes-devtools/meson/meson_0.61.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "0233a7f8d959079318f6052b0939c27f68a5de86ba601f25c9ee6869fb5f5889"
+SRC_URI[sha256sum] = "9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.30.2


