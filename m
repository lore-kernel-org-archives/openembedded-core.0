Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7538FC433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 07:13:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.13624.1646550810928406290
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 23:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qcyy4/Rq;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id m22so10706147pja.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=51HAGloKWH3K/Qfl6EzmaoAWVFFsgo94bzqCd72RWYQ=;
        b=qcyy4/Rqy5uemiVu9BdVWfmoFz+pwD/ObsOYDBr6RNNEBu2/GQjyq2NwP6vJtXIlVN
         TS/gBN1WMBNc6tD8NnlfOLPe9I+TnFQTVI/mq6M5x7A4GBTSrYzRMyB6bsZibUNmgTR4
         RbQj8CNCkIi0Ug6OP1Dy+w2iLrdHP03FPeLUPGYFqXY8wtOCMGgZnoaE/kYGzzvtZ1o9
         B+EeQocq8CaE6JLSwzO9yXDiGItfRnNbc/K/PeRhORoXKMJWdZHyq/M/ES591ArwS+Jc
         AmGs7JpkpvxMxMd5AROoAwYC6Wm6Xfb/P8rl50rSaLX7qoN7nmToO8EDvHU8pvrWxgzV
         W8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=51HAGloKWH3K/Qfl6EzmaoAWVFFsgo94bzqCd72RWYQ=;
        b=2wGGaSog7XJ7XOg2MyzU0h8IzLnbNzFzPqRGhmzZlP3czeCUz/rekT0O8NUP0Y27xU
         9tWFZhcBCDlEuzM1jvRnx2O1tW9X5TDT8Fl0mjnpPvm7ve38XVapPpECgpHX7jt1LDvX
         MJrDdkkTFBgk6qMGUUc6ges2IJdB81VR9FApq7JbMU/vy/cVHQuU/VNY0b12mA6uWu4I
         uGidi6vWxzxyBNtmyAJqtDfcmRypJuV7ca4aoMey7cc61rPPenuzVGS+LRcZ3tLtF4rZ
         cRLusdOTAMvimIEeT+pi2VUDWep+/4smcFe4wJGxRIeerTpFDbKepACwepgqeQZsK4dC
         H9vw==
X-Gm-Message-State: AOAM532bHPfErJoOd82PioXmJhvp2MJQabeejJ7MSy2YS8WOvwzAxzMd
	AbYuCtdqIf2K9u5B6YfsknFpphQck5SLJw==
X-Google-Smtp-Source: 
 ABdhPJw30fGR/Tg60RT9AaIhFfqhgq6v/qtAtEJGdM6Kkmj6vT0gXCEFJTw/9mIBVJn/Mg6IRZIhTA==
X-Received: by 2002:a17:902:f602:b0:14f:53a8:64f7 with SMTP id
 n2-20020a170902f60200b0014f53a864f7mr6386263plg.151.1646550810125;
        Sat, 05 Mar 2022 23:13:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 k7-20020a6555c7000000b0034e101ca75csm8457725pgs.6.2022.03.05.23.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 23:13:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] packagegroup-core-tools-profile: Enable systemtap for
 riscv64
Date: Sat,  5 Mar 2022 23:13:25 -0800
Message-Id: <20220306071325.1698626-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306071325.1698626-1-raj.khem@gmail.com>
References: <20220306071325.1698626-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 07:13:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162781

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 84eb46b9c21..6330200d2f0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -35,7 +35,6 @@ PERF:riscv32 = ""
 SYSTEMTAP = "systemtap"
 SYSTEMTAP:libc-musl = ""
 SYSTEMTAP:nios2 = ""
-SYSTEMTAP:riscv64 = ""
 SYSTEMTAP:riscv32 = ""
 
 LTTNGTOOLS = "lttng-tools"
-- 
2.35.1


