Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F77CC4167B
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3576.1652871537727940583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LIgkRHIp;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id y7so1540909ejr.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LQ3HclGQmTKMWeXCeDKCKsefx2y9Dhhp22n+WzqgGL0=;
        b=LIgkRHIpxraRwAttI3F4/tIhBxo3C6YUtn2tMcKe67ZzdybeOaRSh5rQIYYQQPxhK8
         jvSmwLrFslD480vy9huu/DwKUAYzWcVvTpX+hlVm9kUfPzZtAFXteG0trJxjrVYNBKPy
         aMNr/NIzfTrOO9R7ItXU2RXyNMT5tpH+G8c81fH9tcYcoob/t3RY69pgHQ53vrKm969P
         w7Slut7a3fVZFKyQngp4Sqc6hniCyQ0Q4wzJCkhNWnky7PeOt6l9H0TYL4a0RWlDsX++
         VXE5IumwIOAZCZEgo2e4zPAQa2FB47LA4NIox16biIa74M4XprWJs4LetBn1hL4+Qpay
         ImsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LQ3HclGQmTKMWeXCeDKCKsefx2y9Dhhp22n+WzqgGL0=;
        b=f6azph3XxxuDED1mnBXw9gtvfCH8zEjGZELZtnGBl+CWKb7LcUYwQRo3Brj+eK9Xn9
         MV9pjfBhcMR5aL76R10ha/cmOre2zK4Hkp/UtdYvd1+cDdosF6J9FxIzdLc1sVUFXF/c
         6pS1I6t4aDMJebF0TzcdX8unNFBJfF0S0lSJlLgLnibw1P6h0D8brzmsPOq9917wV+r/
         0WUOs5h5p3kRsguP9xGt/X8Rc4lHfNZjkSb4OEgNqDZGaK57pR9CX9u0yeYhh0Bj9L8/
         WAN13+U4B6vZTICxP+5KlfCrUlBt1La2crBy8GP56gffAVXjxbkdKR1u+Q8RP8nYOjrV
         u27w==
X-Gm-Message-State: AOAM533JiBx43kMJoK8XAjLvj9lVFMKrWpcZMDT8iB+3jxrgxI1S0C8L
	grVNsKSHJwxXs+GlRYtZKO9LeTxt2+Y=
X-Google-Smtp-Source: 
 ABdhPJzxCFFAMLOghcqCdVHlS0cDqpyvDeFZvhcy/AQCVS6eR3e90DpSK+cbvf9vTwRmh6Ifd4qL+Q==
X-Received: by 2002:a17:906:854b:b0:6f4:58a7:5a07 with SMTP id
 h11-20020a170906854b00b006f458a75a07mr23488875ejy.440.1652871552656;
        Wed, 18 May 2022 03:59:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/49] gstreamer1.0-rtsp-server: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:19 +0200
Message-Id: <20220518105843.3299331-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165821

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
index 90d788ab80..fd6e16c2bf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4745bc528ad7de711a41d576ddce7412266e66d05c4cfcc636c9ba4da5521509"
+SRC_URI[sha256sum] = "6a8e9d136bbee4fc03858a0680dd5cbf91e2e989c43da115858eb21fb1adbcab"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.30.2


