Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAE6C04FDF
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 04:59:31 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.101169.1691989166368694063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 21:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fvYoVybI;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bba48b0bd2so25345945ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691989165; x=1692593965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mM4G/Iqv4DTlzMjXhPpksbBxNqvLmoW/+/VBXguX4Y=;
        b=fvYoVybIXmbcFMZKtduOA6DgZ/Yb+xOQZ+1Owmni1rP3Vkd1pwOkuiroTh1gxUSHav
         BETKNRf1rZoz4hQXAw3hykuWd64/qfiskm0OUA/XUKBGCq3FcXmti7LZWUgcKO7Yi/S3
         yWo3yGAe/EGhkDVvbFBHKr9SRfELsVEdFRzBxQtDwwy2252LF8fSp30u6EYnSNfJtIod
         bNMOxRbBCOmZwWFPd/so8JLLmn0ksn3WElZpRSeL0ubuWFeiEcbvkcHaaxqkMTpxsEbo
         XRaFFnJcTANuC35sHE4Som/gCra+2qozYFpPkL7peIu/hik4a7/weVWrakT2e2gmBWoN
         Er6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691989165; x=1692593965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mM4G/Iqv4DTlzMjXhPpksbBxNqvLmoW/+/VBXguX4Y=;
        b=TCgL139oU1uthGu1d0Q7nTHYb9DWlIdP6AKlkTPPMbVxJ0OI0xihN4ahOuJug3dBKm
         DYVlJqwQ2wbq3Oy917Npa66bXz/grxu8mt3l6DzlkESpSoRQvwjL9XSx3d3uaFifVfwe
         ukzBY0zbDL1WtwQ7LClQPd8HlsoG4aSLbMJ1nN7Gm7KX52St85wcxzhE14L58HdsyLQr
         CE31Q0Sz0lQ4zsc7AF8v/LeaSIXroNjncJOmSR5fUxz47Hc7+W24daYMnCf4dde7IC64
         89AJQY0HlH4NSKcKCbbt3ctDVxO6fDqctJA7thTB6HgOumUCCaD3h64ywM1Z7ygkD/c5
         +Lpw==
X-Gm-Message-State: AOJu0Ywi5BoFFJ2CJP/qvPpcMLSK/LfL4Pag1VUgzKwZznmxZBjJDnny
	dt3bhnhcRHuuxrglZ8qrKrvgc454sZNFKA==
X-Google-Smtp-Source: AGHT+IEyvJkE6DZWrxS80ETGzolFjgWWeWA8n8gVWqRWfSI6LzCqCK2KgK0iaaHwREh03gvHb2HS3Q==
X-Received: by 2002:a17:902:bf0b:b0:1bd:a579:3003 with SMTP id bi11-20020a170902bf0b00b001bda5793003mr7505250plb.33.1691989165534;
        Sun, 13 Aug 2023 21:59:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ec8c00b001b1a2c14a4asm8242336plg.38.2023.08.13.21.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:59:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/5] glibc: Enable fortify sources by defaults
Date: Sun, 13 Aug 2023 21:59:18 -0700
Message-ID: <20230814045921.720515-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814045921.720515-1-raj.khem@gmail.com>
References: <20230814045921.720515-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 04:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185918

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase
v3: Rebase
 meta/recipes-core/glibc/glibc_2.38.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 851aa612b1e..94bff8f4486 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -76,6 +76,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --disable-crypt \
                 --with-default-link \
                 --disable-werror \
+                --enable-fortify-source \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
-- 
2.41.0


