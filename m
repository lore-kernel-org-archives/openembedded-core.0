Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CD1CCA47F
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.30988.1654516894928751584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Il1zm+BY;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso888738wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LOu+Wtys2jmM2dI8UM18pRCGs8LKI33ujL6BBMZRvv4=;
        b=Il1zm+BYv/1t+m0DROfFNhcFf0JAFHUtha7Ojalo6/P1z51m7DYxEEdgYtRz2bEZYG
         hhxbU1EKHK+DlyHJa93xLbr3kag2d0rRfOUpVnrfKHNNR1AI4BCi+skEGgvftNcaDXma
         frz975FmDwVbSL8/P29lRz4cpyb1h+Hc0C2ribzcUirE8f0diK1bCDDG/9I4WzkhH+sR
         DWu9Pk51kHh7sI5DK53J0P0guS9bpTMHlaNRd1N1eGXz/plADNOrmTMC19/DbYaILNF9
         D6RQFIGGw01/uA21mDJZwRZXt5yryh586dScVVevAhpe8ylfN0KySNMfK3QN2hkIq6qA
         6FhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LOu+Wtys2jmM2dI8UM18pRCGs8LKI33ujL6BBMZRvv4=;
        b=Ic1fgZNawinSv3Dw6Pvc04Ls5+tI8BbrBaK3gjXH+UZGIzdjKouVWghGbh0TF1r9wo
         OdEmbaFFNOJHuB+HvN/99t5UaP6cCFavJ3HtV9KPUFFve4oVDKmW7he2/ioEzF46dyrW
         cc6vKVQ3NKlvt+STwCT1D+KJBjFLzn+kgiQSuvY9vhz+g2KZd6Vnfd0+KLHqntNoaMXQ
         AC6v/p2qJPU0u+lCRb2ejxBVCsVmZmGK6mzL6a3FJPqJys09KIi6v0wGOJFayq2yc8R+
         i5KFpN3SG53SKd1NMwRUZTvcwGAWbamPN8YBDfaSbR40bVlG7BuxY1znc6GX/Umcv+b7
         xqUg==
X-Gm-Message-State: AOAM533bn8R2OKCM+5acvixBOLES3hKP4MlB27zZ5Zs2PPHMD69DaI57
	BnMQzLQBrN84Lbm74fZxbDairTjMo8x+hQ==
X-Google-Smtp-Source: 
 ABdhPJxPfZgMMojVEEuxGygRl7iqD78cnHLeecBaysLsuolNwOTcjxpLvwgC5aPgAHFYAccRJxm1Gw==
X-Received: by 2002:a7b:c1cf:0:b0:39c:4460:cfa8 with SMTP id
 a15-20020a7bc1cf000000b0039c4460cfa8mr13059300wmj.21.1654516905894;
        Mon, 06 Jun 2022 05:01:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/21] perl: drop perltoc regeneration
Date: Mon,  6 Jun 2022 14:01:24 +0200
Message-Id: <20220606120126.3381438-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166611

According to the linked ticket the issue is fixed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl/perl_5.36.0.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
index 9f7ce15f84..838ad0b75a 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -115,14 +115,6 @@ print(datetime.fromtimestamp($SOURCE_DATE_EPOCH, timezone.utc).strftime('%a %b %
 
 do_compile() {
     oe_runmake
-    # This isn't generated reliably so delete and re-generate.
-    # https://github.com/arsv/perl-cross/issues/86
-
-    if [ -e pod/perltoc.pod ]; then
-        bbnote Rebuilding perltoc.pod
-        rm -f pod/perltoc.pod
-        oe_runmake pod/perltoc.pod
-    fi
 }
 
 do_install() {
-- 
2.30.2


