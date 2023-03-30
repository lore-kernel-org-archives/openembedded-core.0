Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF723C7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:43 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.38987.1680210873853986843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XIhifak4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso23374922pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210873; x=1682802873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SMaCavEhWqnUD1RNxRAQvZOMxViLCeZ/vXJQhvzFYU=;
        b=XIhifak4EN95zat5Om9OMYp2lrQ/3JuuDSp8uZWfqnBZium5EfAteobwxhRxCZ7w3E
         O4kt14LQBCUSNs2izN6D9TRqYFH/6zexWNcHBG/yEZ6DnOPSlmZ5pcQOkct+2rmd9U6q
         FSjABn3YJbDFK4wqSZq6VojUSSTwgiRb+xS2eLP0xotvelgCW/4IzM0qKB4xJ8zVGmQ2
         vTEI2gmWFo6qaqRCg6GBo1YgDZfq5foEIuJVq41nw27WnHCfdPVQfR9ssRUShTKBXTXA
         vjQupGhYLsQLjFFAGNpPNM0TqvetH97RpntaErUL0kgspEUCn/+681lCDJHAsSVdokjg
         BtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210873; x=1682802873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SMaCavEhWqnUD1RNxRAQvZOMxViLCeZ/vXJQhvzFYU=;
        b=kbQH71sRoOqc6xbADf6LGAi+NqIf9cEjOtPq7qpSJ90cVar0duhy7sINOuzVIaE/nI
         fgEDmWgUs4ZE8vMomECho2loJx8D3WqG0xDgy4tTiJ/LWsk6dC5YFbDrDUGOyi/6VNeT
         WzlgG3o6zN/SXkbTcM/K1BgO5wxm1Lovmf839Gq22L/zqy1QWoA7d2re0CsBR+tuVYXA
         rxdvZp25T5NQUT4qaYqw2pBAMu/VuqmyGa/LMsOhJi0FH/cH06rFcrgJnb5LTIQKvF0V
         rI3vW/7o9YvXUPfuNL4dBHzVf5zQvRepmVWyUw/qv/vPXkqWJ8QYD6pa4ugbRhsFzdGi
         syVA==
X-Gm-Message-State: AAQBX9fypfpHqqrqD9+FxPPnFP6dYcSO7yWoe4bajYCPSOU5JuyFHeLy
	UFKegPCy1ffgYJFR5/NU9iw8twLSYMRW8rKXV/Q=
X-Google-Smtp-Source: AKy350ZppF2cnGbtL/DfkvcOWggUlJcb8zrbqUwuGRkzOIwWiEwAgy714pah37M+Cq/UpURWtI2iAA==
X-Received: by 2002:a17:90b:4b8a:b0:23f:582d:f45f with SMTP id lr10-20020a17090b4b8a00b0023f582df45fmr25157564pjb.1.1680210872915;
        Thu, 30 Mar 2023 14:14:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/14] scripts/lib/buildstats: handle top-level build_stats not being complete
Date: Thu, 30 Mar 2023 11:13:56 -1000
Message-Id: <6c9ca2f2de98c84d11beccbfde7c1e26cb25dfb6.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179373

From: Ross Burton <ross.burton@arm.com>

If we try to parse a buildstats directory which was either aborted or
is still being built then the top-level build_stats file doesn't
contain an elapsed value which causes an exception:

UnboundLocalError: local variable 'elapsed' referenced before assignment

Default both start and elapsed to 0 so that the parse succeeds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 701d985aa8f2e9c2b9c0736fa25b424f3701889e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/buildstats.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index fa94c65539..6db60d5bcf 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -234,6 +234,7 @@ class BuildStats(dict):
         """
         Parse the top-level build_stats file for build-wide start and duration.
         """
+        start = elapsed = 0
         with open(path) as fobj:
             for line in fobj.readlines():
                 key, val = line.split(':', 1)
-- 
2.34.1


