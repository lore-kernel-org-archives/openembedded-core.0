Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EA5C43217
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:33 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.7219.1651727185680073583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QJJ5bUOZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id l18so6545259ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NfoSegfp2x0P0Pbqhu/n6346ZvCQ7bVeWFkXvvOOWh4=;
        b=QJJ5bUOZwwwbplzid0QlvRpiOlARxW5Bt0LdMvCobFXDmk1n3jeRH4cawmW9DsOWhg
         0j0/gbHqsfWYQfBwYXdzU/8okmNcIOjgLOrlkM3XhG6GihxpI9Wh7Xk0sO65ba8It/rN
         hU5SVLg6hucsBWDS/j6VuzziNmwYw01VlrZEdSAGg4GmWqrnIseetXSZuo08quc6IWEo
         XuMTGn+gQIn7maBjMjQTCObVz3zkMzP85ZSIWISYIdALbCinvOmjB/4O5Ghd+beack11
         EdIOSN7nJjgkEOcZZL5HAUPcdkgDvTAIxg4k8aEhx9sTqnhXs8IxdUWWXpEg+z8yPT01
         k5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NfoSegfp2x0P0Pbqhu/n6346ZvCQ7bVeWFkXvvOOWh4=;
        b=WWxi5I13TSXKo98ADkummmIeZHQNYRAkFZrKBFpoMwP1X6/c1Ko0fLhqc3rEZu4u5y
         li2sJCt3MLs5WJjJRZ7SNo0VoSWNzZ+760U3mYD42ccIC/iUMfl4v5LlPFkNf2Cxt63B
         hrpMu5iASQaBVa4zS8+SiERMCUo9bhseptJ1ah4K0zvLiU9d+yXmbOTeTRiMCoJYfdfg
         Iw3L1w+Y4FAJyyWLdi/9rfGHSrM13CLfqR13ZxciqKJu5AXQHS0evIDHbJcB0HHbgywy
         T3XEYmU7hJrBQRVIZF0/DegOHQ7RWaJg4UopiLn1WGJrfZMavs+Rdo60iFBLVaQqK5SS
         asGQ==
X-Gm-Message-State: AOAM533T7bwbshC/iKELO86F8hSAFgEZsEiduSt52CEijvhWLNee7JFe
	OjAxAYGlphEhi/iY5Bxd/JjfFsg86Vw=
X-Google-Smtp-Source: 
 ABdhPJxPP/CyjGgbrM0TV5cwsFTXI7qL33/6QutW5z6hq1eWEzoMsGwivR/1UVmg2UvLuCh0rdRXAg==
X-Received: by 2002:a17:907:3d8e:b0:6f3:e16c:2549 with SMTP id
 he14-20020a1709073d8e00b006f3e16c2549mr25195573ejc.109.1651727184293;
        Wed, 04 May 2022 22:06:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 47/61] xwayland: upgrade 22.1.0 -> 22.1.1
Date: Thu,  5 May 2022 07:05:30 +0200
Message-Id: <20220505050544.651895-47-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165277

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.0.bb => xwayland_22.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
index 9769235ce6..b512b9932d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.0.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1752d6d0a930e71292b5a308d3811ebd54d8cc68cacff44de654265b8617a2bf"
+SRC_URI[sha256sum] = "f5d0e0ba37e19bb87c62f61da5970bd204939f2120620964bed4cc8495baa657"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.30.2


