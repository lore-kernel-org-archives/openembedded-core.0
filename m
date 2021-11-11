Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E96AC433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:22 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.6190.1636603761216572609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3Coj1PPu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id g18so4505750pfk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Zdxh9cvLL2SvtB+lVcCGtlB1eVyy658Dc911f+9f0XY=;
        b=3Coj1PPuVFg0rUsRMw2KZln+y3X6w8XiAeUqibbLlrDxt8tczy8J60orKh46R6dxPg
         l3c/nX/hX/XlfGLN0+wx/mlKgMqw761aTLl/UrWmPSn/oVST2/zhtBda4QkkScQN3EPk
         bxb16i2qnwh9nQGcPbfS96OdAMJFz3Dmncq+tbbRcYaiGLzZv2Hh9/W52jWpJ2cQQ+VI
         9+eW77KL4fqQdh/a/S934Cdsp8nMs0cDs3CuEK2HoHcARzXd8RYMXhruYo8M/DSryC3b
         V23SPSqIysCB/UKkaHtRaTbVeRTi1chLHjiDS9GnD/F2u7dYdQ1PjFhZ7/XJz5Kfc/PP
         itgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zdxh9cvLL2SvtB+lVcCGtlB1eVyy658Dc911f+9f0XY=;
        b=shNPNgZ4K8d9mbl7IVS0c7Kyce/h3QDGbBxNP3nwd4hkzodDIdsorbeY6vpyDzzIbl
         tRy3amSVh3Lhy+FTzcua8WwvKi5IKICKHHap3r75JLqOoqN80nVtxHeqdC4UPAlFqBI7
         Ir+CleR6jUB99Vnluch6XeAZK9D9uUBklB8wfK3vWIDt+QZhaRBWREDtCAELuV3nwKMl
         0hwcN56DjXaEYH5CH1aB2rlK4ajZn6gL5/2xlmX2b1udCh8xojXD06U7Z2rQpCoFKFb8
         BniiH4M77tzumvK+qSDJIHt8Pv9rm607w0RTs5OORIuRzSO7iv6qlIUSiJfnUFwGkHYb
         Ap7A==
X-Gm-Message-State: AOAM532MgWkC8yf5un/etkF+GD36SgdpUdknXK3SbGK9WF+6ZsSwKigQ
	3FhbiDObKrnHJFN9FUmSe9gncPqt9t1jzvVbjsQ=
X-Google-Smtp-Source: 
 ABdhPJwAPnV0gr1r1aerCr7fYJPTUzPzLjbth6Zv9vAJlPWrRDB2PridxSP2MvcyanL0Sd8Yjx/p1w==
X-Received: by 2002:a63:d110:: with SMTP id k16mr2746853pgg.90.1636603760331;
        Wed, 10 Nov 2021 20:09:20 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] mirrors: Add uninative mirror on kernel.org
Date: Wed, 10 Nov 2021 18:08:34 -1000
Message-Id: 
 <ebeb1458c7f24cd97978beb7cddf814cae43c6a2.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158141

From: Richard Purdie <richard.purdie@linuxfoundation.org>

At the last nas outage, we realised that we don't have good mirrors of the
uninative tarball if our main system can't be accessed. kernel.org mirrors
some Yocto Project data so we've ensured uninative is there. Add the appropriate
mirror url to make use of that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index ebec56c83c..2ba50f174e 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -61,6 +61,7 @@ ftp://.*/.*     http://sources.openembedded.org/ \n \
 npm://.*/?.*    http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
+https?$://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \n \
 "
 
 # Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
-- 
2.25.1


