Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.14941.1602253181554831162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AGyDXmGx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 144so7008851pfb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JP0u47ezldPkKvZcf1RQA0VaQK+OWR7SAqbjwEuy2UE=;
        b=AGyDXmGxuyNuMTEfaALKf2iUW4UpkrlyY9csWQtw2Vp3vSvBKbIPRLyLsd6FZEwyU1
         Hw4c4WNFvX7YMPDvp74AEvk9Breyl+z6IevezjXkG2ZEa9V2snQI/+SL/joTQompKY8j
         w96POU1OlP9VpxnRxukYcTNaFV2XgGig3e5tEh+Sc2nTHDVJuYBkxqVZ+cvOVVimhtEY
         f1N1rh20RqJZPsRa94/EvIud703lyd439uZK88cB/7btcRE+Q4RkrrNFejqyzVozhxdQ
         +Iq8UQagUkA8vxVKjuaTJdSswsxKOdSXT8fYeFermd8JSa58IW21qGRGsiyzaPDfKR1h
         l2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JP0u47ezldPkKvZcf1RQA0VaQK+OWR7SAqbjwEuy2UE=;
        b=NNKApU9IrrWQPwl6s2HWEclG81gZ+h6TgkNC+ui6cw87l/nb2xsgfQTMywx5ipSjMK
         UzhqfZh+DFyS8Nf+vPk/lJh0/V8yiTE+D6Wl2Xs9n1kQxj8aG5yc94CcGvGIo2UsgxRs
         PRgXuxWrPxBTHaNE6iVAwGkIUQVFFwIzIrRkoGK/pUx7/ar7iWuKp6ATxutaHKvg5oY8
         kI9riIjtajebWgZGHXB39TmQe49FzAsV/2CSxiyIvCIIpTOBzMeJl3oaX52AmS2eZ+GC
         s+ZL7X1wX/Yjv1u2gH+bckHhIeKK1KxkMOUlqertWIPTvEYvNmjIKlHtFu1fGAN9aM1O
         IfRA==
X-Gm-Message-State: AOAM533giGGF4JMxh2EpSmcWS5YBUHUzobfA2ZJBFp6BHEDmq4FY2fbV
	YHkuAIa9FDWgSYOWNb0aoOZ1J3O/epwmfT4R
X-Google-Smtp-Source: ABdhPJx1F2cLgGhAbNbrM171gSyvMrckXgUaw4XLWobE/N2QIIz259BlWctqnmBtmF+dzCCmuapCfQ==
X-Received: by 2002:a17:90a:62c3:: with SMTP id k3mr4804200pjs.157.1602253180750;
        Fri, 09 Oct 2020 07:19:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] qemumips: use 34Kf-64tlb CPU emulation
Date: Fri,  9 Oct 2020 04:18:49 -1000
Message-Id: <f417f4b7aaf9a4470508d22f0122438176a538f4.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Victor Kamensky <kamensky@cisco.com>

In order to improve performance of qemumips autobuilder
test runs, let's use 34Kf-64tlb cpu type that was introduced
in OE version of qemu. 34Kf-64tlb cpu type is identical to
34Kf but it has 64 TLBs configure vs original 16 TLBs.

The change in number of TLBs in emulated CPU reduces
TLB trash and reduces number of times TLB refill kernel
code runs, and therefore siginificantly improves tests
execution time.

Note 34Kf-64tlb qemu cpu type does not exist in upstream,
so far it is added as patch in OE. See qemu 34Kf-64tlb
cpu addition commit for more details.

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a9568401cbf8bed89d1f63dae61a07a83a20b50)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/qemumips.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 1373e4cba0..b8c80f02ef 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -15,4 +15,4 @@ SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips"
 
-QB_CPU = "-cpu 34Kf"
+QB_CPU = "-cpu 34Kf-64tlb"
-- 
2.17.1

