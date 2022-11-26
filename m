Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A909C47089
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:06 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.70808.1669472104629731671
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5sAvEsIU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so6475893pjg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYSY+QO0/1beQS5neaOQEh6K9kXTYeGc8Nku57AyQLo=;
        b=5sAvEsIUAl8F1cfHsmcXCKdQVeh+/Civ9x56eXvAw/j3XXAt54V5Zb1HVYxs4Do8Zh
         QdS3KyunWorURnLG+qid2vVnojzBRGFAlQ5EzfmR3hxm8DbuVReMfRhTIMWjMfKcn4l1
         JXoxow8BAu9nWsgX4ED5SOCO7Jvl0jjZezWKZIHctmcsY7Dx5xw7vkmO61wWx4HpkcJH
         pwMjHhE54cXP5eK9c+nmF609Dz0uo6RBMlvnTWdosMAKYAE4SHvzRK3IoiVHFdFm6eIZ
         Krf6qf1IiUE08xV5Y7x1irqx0bkvpAAXdVU0RSKmQN205RaN+MvpaHyNVyxrXrfbNTce
         kxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYSY+QO0/1beQS5neaOQEh6K9kXTYeGc8Nku57AyQLo=;
        b=MmgFPgQ6R8irT1nR5JKqcMa3t1BDrZAqgseZRS/3atXJRxbQs3rVVQ/WG6mDBSrHD2
         LIwb64cya+thPR1Bsex96Px5e34PYP9m+YnJo9M0MBzjhTrCLIcsXLNsVfcuGwLRnGjA
         NhIGLLa41QvUNKzZ1gElfF0eoEPBZ89dA2jWJ1NkuM1z0tt3Vj/iWTGPOG1d1mZkjf1v
         2WykkF1vDKiub4D/jXGEqACwsRIMFqmRAOSzioevujfQifPqldJXqBdO0XVLMEHs6qJh
         PGSRaKfIOcqARC0xjiPm5+vsqTc9MRw4tkXw35WxpuNxDvqX5pDvSJmY0x0ceGzSaXvj
         5sQQ==
X-Gm-Message-State: ANoB5pkk/SwqyXdbXSBAiuA2qOHwHWmK83ArfQyi3zGdpevRBXqwHoWM
	/4yJWWVFR34yqijKwrlkHE1rf9s8ScwUWG3zUlM=
X-Google-Smtp-Source: AA0mqf667Xq8DH4wxRCvKf1NZmpVfEOqrSzBHTF0gB5TY/uIN5RKNtkaorlMMZ5qFPwvjnAjoxKJXw==
X-Received: by 2002:a17:903:2013:b0:188:f7d0:3952 with SMTP id s19-20020a170903201300b00188f7d03952mr23039372pla.164.1669472103593;
        Sat, 26 Nov 2022 06:15:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/37] xwayland: upgrade 22.1.3 -> 22.1.4
Date: Sat, 26 Nov 2022 04:14:07 -1000
Message-Id: <28bd622e2012da4ae732dcb740c66524017aefab.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173796

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 553c080e0e30c8f6b69b4c5fae72903ee45ef6ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


