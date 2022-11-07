Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7710EC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.4291.1667832929812357582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MfqJXUFO;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id z14so16606349wrn.7
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwMpGxDCZlFme8oJrOmkgKJ/8Pw/9gRH1baDSrReni4=;
        b=MfqJXUFOLZGvcb0ikvZWf6tLXGb1njqBj+hdqj3uKKYifgIJLWMAfhugibwVptNBTH
         tXaK4ZhwT2gF6lRvlmSzZ7IgWyURWVBoMCYQ1FOBEaxyumI+fluyzWH7QW1vZ8y5uXcn
         or9LpSPmHrPYahsPqDJp3hNoHFtFFu0c57TGyxXsPFa0U+rm1S0gm7FuFr12EMS9kDx7
         NtpPi+2uKh5To9xTYB4G7jj/K/Pf6h/AoywrBQLbliwWLbj5lsq1N1yMq1M/2W64VKPz
         Xs2LHMDzHa8Eq9WN4pRlObMcpZUPw31odYzZkHvjSVPt7cYer44lzcvnln71eLAVenOJ
         WY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwMpGxDCZlFme8oJrOmkgKJ/8Pw/9gRH1baDSrReni4=;
        b=gevfsUhaBtn/5Zw4+q/3+lqA4XWXF1P59uXGsnXNggGshYGyotzVqig3YgnAQ9XdDI
         v1lnBFBEwmJ0SbnB3Q3jMPuX5BxThWMvBFBvGKH4YZlYXJvRylIceqyG2N0ICduB9iBD
         5VjeCxTDHLn5BXcz8dhfCxDLlfinhe6WvudA9SRpGD4/GwrQ8tfOjKyyFmlQ6PUOuPW0
         5zc5i6ZaELB8RtAwqhOvSxeGIO5McENDFbNlafHyYJnjNLpT15JQhisOIpmcfvK8geyy
         LZLL99MLq5KTAM8P6U8m2xOpEIO1Y4D6eWPEoUeO4IblTN/joQVn5rkphfTd1jrx67PG
         WUtg==
X-Gm-Message-State: ACrzQf3eijBzPlH1MoMmoFzLoumIB3vncaQWyaeGp/RxR2D4zGwv6p81
	Hg70w1GoNJP+YC8Pt7D1Qvf3D3L+RSo=
X-Google-Smtp-Source: AMsMyM49gztZPDHmdXNvdpkR5N0mo0y6atCxaz80PtX9SpFGNht+38VjLyCHQCXGgMIYrhu5CAC6mA==
X-Received: by 2002:a05:6000:1241:b0:236:8a38:6744 with SMTP id j1-20020a056000124100b002368a386744mr33170661wrx.270.1667832928243;
        Mon, 07 Nov 2022 06:55:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/48] xwayland: upgrade 22.1.3 -> 22.1.4
Date: Mon,  7 Nov 2022 15:54:36 +0100
Message-Id: <20221107145508.1051404-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172866

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xwayland/{xwayland_22.1.3.bb => xwayland_22.1.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.3.bb => xwayland_22.1.4.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
index da1b27525d..8597d07a7d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a712eb7bce32cd934df36814b5dd046aa670899c16fe98f2afb003578f86a1c5"
+SRC_URI[sha256sum] = "5c39bdd77444c3fa7a0e2ef317ae69ddde89a901dc8914dbc8eac39a9313512a"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.30.2


