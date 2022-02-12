Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9E1C433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 10:40:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.7649.1644662437303878234
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 02:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dXOQwm6C;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id eg42so19878649edb.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 02:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PNOORGsAnQlAU6w3tqpP2i1fI9db9tdPAt2xd9SJqKs=;
        b=dXOQwm6CSPqyyht4QMdU9Mply18tBRh0Cx9j0cBrXvEmpbBEYABJklXAhRIGQFciQW
         YvhJtoMy3/8jh40XLm8K9jK7gosq1i10R3pzBryNuQM+7AkIvpODlD4stGtf4nSd6UJ4
         /Zudj/0Qj9ccfcC9ey3DURtU3RrVqyvN18L4He0ZW9w9x0FwIzbLL4jFVSXEkbs/b4bh
         bzsAPNP79ich2pO3HvrqjpqK8Valq01sQOEFeOS3vkZwCEIaOBf+z4QRipgMhisNJ5Ab
         5SjAXsLJwBodj4vOqYlDMM5bXY+/EBRIeDl4OSZtP8jvEtzSreV76HJn2sAjHnXUofb4
         8SJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PNOORGsAnQlAU6w3tqpP2i1fI9db9tdPAt2xd9SJqKs=;
        b=VuOa6V6yjLHDIgaXhDDJLLmkifg9WgozcoS2zV1wczRthJ3UbERf30TIpCMUy0dVr3
         gbNsgrFimNfrFACPy8GJsVobMmALf6AzCKJFAbUBFxQpBM5hOPl1rBGAw5Fa1VlIAmHq
         LCebbgcrw30HOobborpDJD/KcQLqKWm62m3dFw3z64kO6ACjpYUza/wwleNIDpTBiwEk
         yABuZAH2TJ34kMTGj9eheHHwYLqtpYFho1IyRqhYGTvcScKfkHlYMtoBCqM9UZYVMi4q
         AQqTzTl/SI2rnvfQlGcue53mX9T7XcIZTuoP/HZFRY9W01dIPdcpixR2yWMm0uNn4Ndn
         6a5g==
X-Gm-Message-State: AOAM533gjpkoLgMbsl/G2uK3toiEaZLqfnn9dlvj3SfsBAUy0+LwXhRr
	6akLZLfAorFcg5frmju5qyrdcY90VIo=
X-Google-Smtp-Source: 
 ABdhPJxcJyFE9k51XVb3AWqshyEcaZ0k9tx9QAuUusXfF7/jMpF0crpfgV7N2SujWXwYqNOoSNzKPQ==
X-Received: by 2002:aa7:d858:: with SMTP id f24mr205109eds.156.1644662435917;
        Sat, 12 Feb 2022 02:40:35 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 cz12sm7135895edb.30.2022.02.12.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 02:40:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] weston-init: disable systemd watchdog option
Date: Sat, 12 Feb 2022 11:40:22 +0100
Message-Id: <20220212104022.842655-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220212104022.842655-1-alex@linutronix.de>
References: <20220212104022.842655-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 10:40:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161669

This starts to behave weirdly when test_date is adjusting the clock,
which means weston is restarted without need so disable for weston
test stability.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/weston-init/weston.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
index e09625b31c..80745998ed 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -37,8 +37,8 @@ EnvironmentFile=/etc/default/weston
 ExecStart=/usr/bin/weston --modules=systemd-notify.so
 
 # Optional watchdog setup
-TimeoutStartSec=60
-WatchdogSec=20
+#TimeoutStartSec=60
+#WatchdogSec=20
 
 # The user to run Weston as.
 User=weston
-- 
2.20.1


