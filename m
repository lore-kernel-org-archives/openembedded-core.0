Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3CBC3DA40
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:15 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.801.1687275613986454366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=i+Q3VKA7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-54fb3c168fcso3974753a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275613; x=1689867613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yRsAbHY9S2qkZGyfQDv/ZBZnwlsvI8LMj1qx3UG8iM=;
        b=i+Q3VKA7yRY0nTfg2fkp1whH8AJgJHUcqcKU9m9IUBgXP8r1m9ukRSjgVVybAHvVj6
         Yd528w8ZzpuLRgdpO6nI6TeG3QoeG/WxOxsQ1qGPY1SPckNUL/fjctmELibS8gl9SoYz
         bxR0C8sdORxOk/L+Bxnd22o/A+FaXxDJ3hJ2GEB0bq/0xmbYgYNGIwOzohqjzNyfHaJW
         OZPs/NesAfzP1qWDfQFIrMAQr0EbKh8UW3RQxHVqrwa5KAmWRKOUoiljsXY7gy4urvqy
         5DdBzaexVPwj53GJEEQWRt4WRJeMuDUymclUZx6RBTfTObOLETRq3eXOoxdGga99IPWH
         JoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275613; x=1689867613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yRsAbHY9S2qkZGyfQDv/ZBZnwlsvI8LMj1qx3UG8iM=;
        b=bYFNhqYBRg6efa6R9puMMxBX8tcewsFpsimRIP852gpCVUErF5uQ62N+4QFOB5NeuN
         wdUPDIF4c4bQ9brWg5yidlJuy9lT3slVzCT/gtk3o+Uhh0LAiQu4do331X8Wx6i0NELf
         YtwP2S+70deck8rXwlTAht02/f6GsXRetp1OuN606drzFKugdfmD8hFeT/kav4V0rSm0
         mndqnki94MzqRcDAIToGjp9daURmx6JebwFCk6B4mGhDe1EWdh2IBzn1809Qp8WtvobS
         WA0fs/PX0MOSVbNa0xbnm/MHEa06HvdTyF6hZ7ieweTWa27/LCjFmPbWUzCg6C5noxCG
         6LdA==
X-Gm-Message-State: AC+VfDxkB5CV+lSPq85hIq5Pz93jHuFori6EaAxpN3lWE4inkV5H+uaj
	WmOHR4nmIgENyyHJzGUYFO6OVS9ag05Db/T/ncI=
X-Google-Smtp-Source: ACHHUZ448PKMaMerqL44KFVhxEdcwYQP7Y8ETamUuJ31THyPeUwRNCKimiz9jO6DLQzJVPa9eokgFQ==
X-Received: by 2002:a17:903:2615:b0:1b2:48a:57fa with SMTP id jd21-20020a170903261500b001b2048a57famr13252297plb.56.1687275613187;
        Tue, 20 Jun 2023 08:40:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.40.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:40:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] staging.bbclass: do not add extend_recipe_sysroot to prefuncs of prepare_recipe_sysroot
Date: Tue, 20 Jun 2023 05:37:27 -1000
Message-Id: <dad053c4b99d4aefebe40459500ad53a2b458fa0.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183151

From: Chen Qi <Qi.Chen@windriver.com>

When running prepare_recipe_sysroot task, the extend_recipe_sysroot
is run twice.

What prepare_recipe_sysroot does is executing extend_recipe_sysroot,
there's no need to add extend_recipe_sysroot to its prefuncs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf7584a2ac16ee46ff5b41536b06bb46d0cbada7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 044873c9ae..a78839bdc2 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -648,7 +648,7 @@ python staging_taskhandler() {
     bbtasks = e.tasklist
     for task in bbtasks:
         deps = d.getVarFlag(task, "depends")
-        if task == "do_configure" or (deps and "populate_sysroot" in deps):
+        if task != 'do_prepare_recipe_sysroot' and (task == "do_configure" or (deps and "populate_sysroot" in deps)):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
-- 
2.34.1


