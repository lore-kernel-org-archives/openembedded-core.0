Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6239CC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4130.1667832919242540772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CIcSBJ6Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso7299744wmp.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNZl+Le2VmPYPK5JVKS8RzurjA2spBiTXDjwbdEqR/g=;
        b=CIcSBJ6YZqsO3zkA21TdUKcdcaf3oPdROkcsceY08DzHRK8VvOo+m7Df/ePP1N9Lqb
         4jvdj5C7mWmLD5P0jdtv/re1VMsjJNWvOBohaII8olvsu+I8pX8SvsFB4Mj5vqkON6s7
         2JEI59KLHcS0qAK10fgnfCcaLcshAZjXvmt9VwKs7B57WZ0dnNiV1IoTsDaJ6ww35Ny/
         CFdczL3lOepHE1apvXJqm08cI2zBdN4pW8yTQ+I2m56RC0Bi9aHmHkAWdrWk+2qO6KVr
         ZA5afuTbJy5PPu/bz3R6vVAfVMNe7jTdWp1y8Tw2iFfGrqSJmqENFbvXNDu7oqyygSI9
         Ma7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNZl+Le2VmPYPK5JVKS8RzurjA2spBiTXDjwbdEqR/g=;
        b=QS+6RPDzLxoWNRqpI7FdHn9rXvVD6yWpIULefL8kh6WEwVQ4VsAyj2k5v4yz32SDVW
         xmkoR6N4t+69uVkJLJHY91fpd5EbZWvbT6e+dCUUs4+LLfTgL6sTWZl19a08OwdWaD6W
         oker+TAPV11dNNm6dR2L8MJVD2tV9/c8LRSrWNtRUV8M+gDTICFysMKzh7i0B3NLq0V2
         I98SnyKGQKkDtZrWoDdRaZH9ddm/XAhJEybf/Ocw5NVVQyYQoyJEMbqDbHOLELMFAKsz
         1UVy+aMbmH7zeSlOAyO3iITIjOupwvoH8BTL7J822vNSELOnZ6G1DBU4loHDkrR+oEV3
         fkHA==
X-Gm-Message-State: ACrzQf3ZUrZtM3++xBuQBYvANdfSi22cnpa7BNaAkNm/URAftZPOqnjd
	NR0B5OVjNJBWQFqmc8Yj1Y422pg49DE=
X-Google-Smtp-Source: AMsMyM6X0hSSJGtzkNftOgd7QPi8sMmxv3EqNGrXCcZeUMCKSAxDqeCKU6rOxzdTOIJp1MCsMRmUuA==
X-Received: by 2002:a7b:cb41:0:b0:3b3:34d6:189f with SMTP id v1-20020a7bcb41000000b003b334d6189fmr43815926wmj.6.1667832929404;
        Mon, 07 Nov 2022 06:55:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/48] strace: upgrade 5.19 -> 6.0
Date: Mon,  7 Nov 2022 15:54:37 +0100
Message-Id: <20221107145508.1051404-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172867

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/strace/{strace_5.19.bb => strace_6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.19.bb => strace_6.0.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_5.19.bb b/meta/recipes-devtools/strace/strace_6.0.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_5.19.bb
rename to meta/recipes-devtools/strace/strace_6.0.bb
index 5e69cfd5f9..4fa3589d15 100644
--- a/meta/recipes-devtools/strace/strace_5.19.bb
+++ b/meta/recipes-devtools/strace/strace_6.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
            "
-SRC_URI[sha256sum] = "aa3dc1c8e60e4f6ff3d396514aa247f3c7bf719d8a8dc4dd4fa793be786beca3"
+SRC_URI[sha256sum] = "92d720a666855e9f1c6a11512fd6e99674a82bbfe1442557815f2ce8e1293338"
 
 inherit autotools ptest
 
-- 
2.30.2


