Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2457FC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 20:58:36 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5503.1749243509358190181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 13:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KE8bnzEg;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so1470547f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749243508; x=1749848308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RbRWST3euR9pf6WLt2R3dh2vCvA4OZfH3xDvI+13VH8=;
        b=KE8bnzEg13faBFp75uXYhhkL66NwfCdtLlVXoqpMJ8mTqNg6u41sYlQgHahthvE5Io
         31x3qf2nM24Cggz7KX35ETA78VVn0HPjfcvkzSxa2opHiREpGjYFDvROynV8s277h2g9
         684jn30B4DuI1Wxfa0MT5DynegHS1/PsdL6VKJ7gbABMPzoC400UjWTlysdqB6UfO8VJ
         TwlVlHZ3AhHA9tdAjBfD1daSwQGmCurLXfKL6es1G6jVpxLTmcsdOqx1qJsykuvp9OWU
         gRtERsplVVgxIZlxzCpnWAwF4ss2yj3aSfBjL896OenC8RNh9h2ZyrfWpcEmWfxU+Kzh
         K/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243508; x=1749848308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbRWST3euR9pf6WLt2R3dh2vCvA4OZfH3xDvI+13VH8=;
        b=TUtHHBx+AtneA6Dp4IGo7qNYu2hX5IkIw5FRLcTztMGq7EdpE0TaDq6NztAqW1RrTq
         BZcZ/JKmJsOjVKAsXcQqsvZ0Kig1ry0SS+0b/gECv4qVvgN62Ex3fJxGB1hvYL8v1tF7
         ucGV4xO6NlkJ9eolfKUFXShh1jQ70P+PWdKDPWQL+shSII7vb1LbDUjjsI611igBz19b
         ZdvVG+mUgObrzO1f4cwLrxTR8VfkZ8E6DLVBnFvKoin7g9WpK7V8Ry8XxzOgY5nXovIY
         4rBAnLpINfikO4GRIPrjS+mGhlhx+PnjF/y0rYj9EWrzDOsk38vpWhSNqLBbNp2Mvg8f
         M6Cw==
X-Gm-Message-State: AOJu0YxH8OiMZTzbgbn4dJSrxwSJneXeypyJoNophmVjaj+ZVcrWDpMl
	GJL3RXMdHIrms951S9BLqngRW7cWH1onA0eSnzawq/H091vTGorFgNr+Xdd80g==
X-Gm-Gg: ASbGncsu1GTLMOZuUVmudWJ0ltjxwGYtL8/W8EO882t6Rv0rcCZw9aaihm6Dy1vJyKr
	zNGR1VLDnCqi1ZbkrbTfvabie0AzMVn6QRSCNaWtwaq7+T5Ms4YXLK2uGEDvgWGDWuyQfdmmHbQ
	YNJFhaQjB3NSIzJnoWViOvHknj9DVt4M9SiDmybSkYdGpg5h9Z2xjxqznPb/kSdkwfPTZkYQlMg
	DWJegetaHVWOMtNAQ7KJMvgHAgQtOgJzjQ7KUY05wBwj/mSCP+T1NUj9oubqXKSwibAzsuTDYoC
	Y+XZQETA9Jy/rDSLS+PFSF5ltG2Cz/4UBHeGbkkQzBl+pi4ygz/KrPBXadoH89Q2RLs0ni4jnWY
	qMQkkY/y0vc5E
X-Google-Smtp-Source: AGHT+IEH8kWz9YnZdgPZWjBUUhwmCsj94GE5ZhaS0KZilBiAaaP4Ng6x5hQWKJt2JMP+8yBcfX3fpg==
X-Received: by 2002:a05:6000:22c4:b0:3a5:2c18:b181 with SMTP id ffacd0b85a97d-3a5319b5920mr3970175f8f.53.1749243507405;
        Fri, 06 Jun 2025 13:58:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f4e7sm2850859f8f.77.2025.06.06.13.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:58:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] kea: correctly eliminate build host paths from installed file
Date: Fri,  6 Jun 2025 22:58:05 +0200
Message-Id: <20250606205809.4071299-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 20:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218181

From: Alexander Kanavin <alex@linutronix.de>

Only the ${B} part should be trimmed, not what follows
(which is subject to change, depending on where the sources are).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/kea/kea_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
index ff7fb51fe0f..17e4378746d 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -69,7 +69,7 @@ do_install:append() {
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
-    sed -i "s:${B}/../${BPN}-${PV}:@abs_top_builddir_placeholder@:g" ${D}${sbindir}/kea-admin
+    sed -i "s:${B}:@abs_top_builddir_placeholder@:g" ${D}${sbindir}/kea-admin
 }
 
 do_install:append() {
-- 
2.39.5


