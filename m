Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CB7CC6B00
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9314.1775107335043995386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AaKtdYNd;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488895ad947so4609825e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107333; x=1775712133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSD9l0bwEUNW33RgmPxF5gbMXi7kaa+8L2HWZgr4zbw=;
        b=AaKtdYNdwZp7jwUIpcTCo2HC0sHsVBAoUEJ6ttJGPbcQIOF5UHpDd5oChrnsQx1gtq
         JB03Z0g2lvwA1IRrMlWm12OTjuX5Y2OaOKp+iMBbvHytUuRNxftiqCHjMKUbSphmAd38
         oP8kCOl7fZ9J948uRfdqP7ExA9Mh1LQUZgI4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107333; x=1775712133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GSD9l0bwEUNW33RgmPxF5gbMXi7kaa+8L2HWZgr4zbw=;
        b=b8HOncZSR1rSiubJ06iZtaWPaHgSCZfxQPwewu2AtvtlYLFWYPM82znJn2C7iosTde
         gP0zKJEMiQJ37vrd6bFjsaxLEDOBpm4GJgo2QuqDR1bhVM2s1hkuzrPUKCY8C3+Uiy4J
         V/HhE0rqwcU4RLcItfSyQ/tT0RwH8Pg0dOo/Ylgvh1DGWXebzH6J/z6o/YRBakmGCKAq
         eZtKGIOmwMQ0/6sdcopkiY/XyiTMyi+YfYHAayhIBwqaCBTR1pG6z8Fb5SjZ0fH9coQR
         fsIhatjeX3DNUfpvVGOl8LQGJRftX2niMw62+tY1d1TI74yzchvzkiR/fSwK7JKCvnXj
         iy8Q==
X-Gm-Message-State: AOJu0YwZEuw4/RLERGSSh4mvwVW8b6OL9PmoiaKXlIs0wmGBcECcxM2O
	u+xmzQD6Aj+L7OJMqWe5i13N0nhiJP6r6NLWlW4gd12JlR59qbb4oxmMDxs6W6KCpSh9CGIrIaT
	xe7dhoqI=
X-Gm-Gg: ATEYQzyX1fybhC4vMOAw1Z0pfuG0GuKfAhbCuTM5qtXOX4ao/gNQfysXsBdhYcZVjLl
	2+zuNDS9GFP1qQTq05N8v04fisWjMOhpE92Z4J8LkjfPZ7JCY/EuQbnw8g5T3wYU7lsUTqTMR2z
	im11ojNfKByRy2I3BXewYZREtsV3mmy9L7ebKOyBmIWc0yEtJ9E+menguI9wOTx0MXWJzt+HTzN
	s+tkTp521hI/Po6zJup9OVib8POa2d1I1WimGWv9m3hGQpCRVUrDh5YTPHUXfwOOo+A6FamWYQV
	wuaR6HMj3O01U6MfwviyQgMB/dREXMm4oBtmg1a4PS4bLTt+02LlDsjGV44hhqHUM/QA3n/kRlK
	CilcAjZv1HclUbGIV4v0NCJ3iR5kOKJnRtv7zQrAnD1yJcuWbf/rypd7f1XmxPmDqNaGSS/fsO6
	2wP8Rl+T5vmWxlUip0bn2Kwav5fgrNLCsncc0yPHtwS10+qJr3VtHYMmqNFZo/TQJTga44TXNb8
	+DwVmM6SGTjpSZCIZAChPwvr0I=
X-Received: by 2002:a05:600c:4744:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-48883599b38mr90689425e9.26.1775107333135;
        Wed, 01 Apr 2026 22:22:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 06/15] libxmlb: upgrade 0.3.24 -> 0.3.25
Date: Thu,  2 Apr 2026 07:21:23 +0200
Message-ID: <3dd54d88644d8127338944a0ad515f70a4759cd3.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234477

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
 - Correctly decompress heavily compressed zstd streams

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0421e9b2031fcc56df192da796a4cadef6966b38)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
index 24eb62c98cc..86874360522 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
+SRCREV = "b31dec072f4428123db3866c18bf32bc5db04d35"
 
 DEPENDS = "glib-2.0 xz zstd"
 

