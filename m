Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA297C4167B
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.12.1668103992060279716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EztD67Ew;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id l14so3467649wrw.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcNFrT0j9JkQU1wnV4qnOq668zk/Adl6aJDyA5pVuXc=;
        b=EztD67EwLJbO4u9VvtFV/1qQw+tgatULHDvv/6eaIXVggZ5vP53MxNjJGFT7p6bz87
         0REiss6LrgmxHjAnCCZW8pZz5csSi6a38LLTxtHqh/lCHGZpY6p8K5htXE/HWVKdUBLo
         1uM82HtLk3H6cWJvBhM9V3bMNHkTjULHihnp1d51Kz3ckBPHJ17djSip9u0Y1pWoORTe
         MT3Itw3YJEMx5wanGXjtoXaEnlvBj60AyOZSPP3SDvtS//qYrHkeVVAfZzUfddhCMyAA
         rLBTn1h9TBsh07aBhPVZiuZCug3rJ6TmXtQr0zLLG3N1D75tr8jr2n7rWtqCFNzFimNL
         zZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcNFrT0j9JkQU1wnV4qnOq668zk/Adl6aJDyA5pVuXc=;
        b=mIj/XqSQENJWYLy7qp6gGUPfEbSLJOP6YW6sexvu27KdHjvl+d0mU6pCiVHDknEZE7
         9+BhK0+pj7RwFFdGzL5sFCvSOEyXO+fhVv47pTQ3iP6rUzMwK2V6qGCxy8wRBT1ibzh4
         LE18tl/kteZyUEizADhzSNhF1GHUGl3+JZy9sF1PFkRgBti0rWQs2mB2LGLg6+KK/x7h
         CuiAn1z1ybli8cSfLwOOSSiFqCE5pkuWCu5wlUdipkvXru3VJBirW6Tt5LibFhaZwfAL
         zCzkeqXs+uYiW/sZPWY5dzCCn9276z1vD7ztRkf1QmaVfmCaqxskyA3FxIffMgHusjCe
         rbdQ==
X-Gm-Message-State: ACrzQf0f28v54U77YDHwuA+cFN2FccaGzfS1P1X0ea63U1sFQ1+pRwds
	RUuGwHcRZpFUXYbtmxgwTcrCbD9A3ws=
X-Google-Smtp-Source: AMsMyM6jy3q3XAhyVl8Vq8gf6nZ9iLKW6+TZYPSeSx48M23Z22zfL8B2LFkNMW9rYezSTTHkQby6YA==
X-Received: by 2002:a05:6000:22f:b0:236:4f8e:a913 with SMTP id l15-20020a056000022f00b002364f8ea913mr41176730wrz.240.1668103990502;
        Thu, 10 Nov 2022 10:13:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/19] libepoxy: update 1.5.9 -> 1.5.10
Date: Thu, 10 Nov 2022 19:12:46 +0100
Message-Id: <20221110181249.1240200-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173099

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libepoxy/{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb} (95%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
similarity index 95%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
index b3b26b57fe..d10134568a 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRCREV = "ecfa8e0f083084181d36966fa084aca9a6c97d53"
+SRCREV = "c84bc9459357a40e46e2fec0408d04fbdde2c973"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig features_check github-releases
-- 
2.30.2


