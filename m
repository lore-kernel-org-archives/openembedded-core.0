Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B31C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 17:06:55 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.8350.1635527214968101239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JdMGTTOK;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id v16so7229931ple.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V9Rq76CW09xin4d9pmRHntOnmkUN9WDr+gO2xV6b2BQ=;
        b=JdMGTTOKX/IQIMX+TNivFjkJ9jxuwK5x+p2E8DKL/HCNizf/yPBdiY9uL2vGT9PPQ7
         PydsbPNqlOANLvXDJVpKwh1K8qor/NYvgf5vX60CWahWnl6ys0H+MZYLWihzia4iFzeh
         x1XO74gYQfVVfD8KnXPpwuZ0+b9inI8D1TjNMCB1v2wVdVyE7PAYtcT4fMDK00QY93VY
         1Tuovb+w2BG2j88IjYyOyLM2vpRdRHfWakGR5vufshF/hykZWkx+5fc44e18pnni4k2Y
         Nv3pTFZ1zkKIjCEy+B8zAnYnXJIz6fUnaXC1R4p1UxX7LYVZ31XNAPngHoB7+PUAFlNx
         gBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V9Rq76CW09xin4d9pmRHntOnmkUN9WDr+gO2xV6b2BQ=;
        b=gx7xSt3dMVm1wO4IO+yD1IfgCglPYapW6i8rw7BQ1tCOKGl6f7TnCflP3J553KaCjg
         Zda6cRBUJ/UnSyyHis2N0Eb4I78haahq5+Im2J7PlGIhSHumvl38ROlE+V663ZKX79Em
         d63s7DbkrBglZrZdxkvtq9EUzASbqv+rLXWBKWY3JDAoaYZcjvVIomdhy6ROzOtWF+aT
         6qvxkZ7RitlIv174ELJKXRHIdpOmfvvaDbZs4XlWQf3uo15VF6KELFDj9CjWjvUciqxm
         OdOqzoF0aZN5/IuD1USj5iqIhtLZBeCBbJuX3gyCCzO5Qtoc6WqR6rjB1/OUm+0QH1dB
         x0EA==
X-Gm-Message-State: AOAM53123S9xfHqsOthsCZ35740hocXudFI2htaMnA+qzST+HJ/NpZYg
	WwmaOA2EoNv4LQMDE8+wwsQfPcrux78=
X-Google-Smtp-Source: 
 ABdhPJzMyKfe9aQY9cN75Z0cgduPTWHzptlAG1ttrnDsBN/kpg6wJsS/B/qhsoI6PcGQvK7EeJzsVA==
X-Received: by 2002:a17:90b:350f:: with SMTP id
 ls15mr12709614pjb.220.1635527214026;
        Fri, 29 Oct 2021 10:06:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 j12sm7341797pfu.33.2021.10.29.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 10:06:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] musl: Update to tip of trunk
Date: Fri, 29 Oct 2021 10:06:48 -0700
Message-Id: <20211029170650.1278607-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 17:06:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157628

This brings following fixes

* b76f37fd add qsort_r and make qsort a wrapper around it
* 7be59733 add SPE FPU support to powerpc-sf
* e3e7189c fix undefined behavior in getdelim via null pointer arithmetic and memcpy
* b713b8b2 fix excessively slow TLS performance on some mips models
* 3eed6a6f fix error checking in pthread_getname_np

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 06b0e060d0..82fd9e9079 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "3f701faace7addc75d16dea8a6cd769fa5b3f260"
+SRCREV = "b76f37fd5625d038141b52184956fb4b7838e9a5"
 
 BASEVER = "1.2.2"
 
-- 
2.33.1


