Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9A6C4167B
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.4130.1667832919242540772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pLF6qpOZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso7299268wmp.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZThbEvL6H7+DteheLmsYaQekUcdg1gg6/rknHvwqJQ=;
        b=pLF6qpOZLM3PvR/XzLq05nK4OfK7MRXu3IqUJR0Uy96c+hd1EQsGCUzix1zEfy87cD
         Nye//DegRkht/QnSPmaskEQwoJMaW13ANV8IeuHLsyZZuf+zhf+xWWI4QLsXRScignuN
         anh+rm+H9PFAK73aRdU3vmYICW2HboNMIYbRbyxu+cpUDWA16TuLXeugrNh0iOI0GN5j
         S3az2iJD8a5CA93uDmhWZFh0A7Id2m11PUrY48PlHsF3MipNB/ZU+8VXbFc5cyLx+XAU
         i/4tgjNHx7sGKodQ2A9ZptBq79EmQq/xH18va24xVDWIFFxoUXh6EbCoW8hUgmnZfrVV
         m2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZThbEvL6H7+DteheLmsYaQekUcdg1gg6/rknHvwqJQ=;
        b=1dvcj+90R3DVxtYpSO5H9xXCzyjeLooCGj5e9fCs/X+dXugKezP7p7nW8GlozkPRpL
         YmTqLJQ3/nmKnDcaMry/bFqWa8z1fqs+4CKnzflTSnkhxOKa3A05g95HI0QvIwMsKXhs
         gyaLwEbQ9U/579CCqqC1QGhCgH91qbAr8eeyvIPUEhFsu/2V0qHP+MVewwyrHKWnKXag
         Z4AmZbSDI8FF3kUes1I/dM5xkFCokS04rS+ymrJi6oolN2vKAXKJbQQbjzoLcLvEjbHm
         GQaD3w1pWMfTcOiJG9jAs994IA0tN7hqmKbaBJ3EqE/qhwZi3tIgYD4854eEM5AXgiDX
         A7GA==
X-Gm-Message-State: ACrzQf2NWNRPGeAT0F4wbD3pbNvdlRkjNFqWqhWrewMKrkS/3mZpm+61
	+Z0DL7/MS0vcg5g0RLcaHToGkzTN/ms=
X-Google-Smtp-Source: AMsMyM4TbhRHvVJLkUkWvid0NVrvy8HTg0+vexaNFvhiW/orPdzxBvDWnz3H7jfmPBCGNw5mWZ86kA==
X-Received: by 2002:a05:600c:3c8a:b0:3b4:eff4:a94f with SMTP id bg10-20020a05600c3c8a00b003b4eff4a94fmr42916549wmb.105.1667832917501;
        Mon, 07 Nov 2022 06:55:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/48] lsof: upgrade 4.96.3 -> 4.96.4
Date: Mon,  7 Nov 2022 15:54:23 +0100
Message-Id: <20221107145508.1051404-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172854

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/lsof/{lsof_4.96.3.bb => lsof_4.96.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lsof/{lsof_4.96.3.bb => lsof_4.96.4.bb} (95%)

diff --git a/meta/recipes-extended/lsof/lsof_4.96.3.bb b/meta/recipes-extended/lsof/lsof_4.96.4.bb
similarity index 95%
rename from meta/recipes-extended/lsof/lsof_4.96.3.bb
rename to meta/recipes-extended/lsof/lsof_4.96.4.bb
index c32fcd5583..bdd883d0ce 100644
--- a/meta/recipes-extended/lsof/lsof_4.96.3.bb
+++ b/meta/recipes-extended/lsof/lsof_4.96.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
            file://remove-host-information.patch"
-SRCREV = "eec10fac8f57544e26ff00bf41a2dc09c56049bf"
+SRCREV = "669c33a253e414feb60fbbcf2984c25dc413cd75"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


