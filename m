Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3471BC04FE0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.21372.1691683504028511837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3gYYcaVP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6874d1c8610so838637b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683503; x=1692288303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uhADN5TLquUe4wcLizAAc9WaavY7zM3wYO3pvD86ks=;
        b=3gYYcaVPlCQlH6uRPjbWr0b59YK2K1M5jNe7qJxVbFMaVL7VWEl+utW0AOE4EpTM35
         ucKGnpjc30buUHhfzVVqI5zHnVgxGpSav3U9EGpcHAVORUEoINTzDxDPWHW17Sw8yr9y
         8itpNxvhO+L0vizIhLmUPtj4VvDuLX00q4nZtSwxvV72NThbn6xdsQ1BYHpmVD2xOxIt
         TzuJl2aSBJ0WE1AaGGKAYj7R0wiKsC4AlU+/mcO4dxeTsuaMTwRHO9FP11fbaVaLvhe6
         uQpp6VC/+WPNaX07KHbwBT9x6apFHzAcI4oVAE3/R81AHL2WFDvkkz2x6Qu4IRFpFC2M
         Igew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683503; x=1692288303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uhADN5TLquUe4wcLizAAc9WaavY7zM3wYO3pvD86ks=;
        b=OTkNuThXSLOOnb0Y7YyKjSEYf3DbK9i2ivoVDWdWYg06pn+67zPJjTvmBX0+tTZOLl
         NL6kl1hI+LFIyKt+q46wNU5YG5TBFSNOE0IO2VknJj1SBpu82HogD/uxOiel3x2fw3gC
         cQMiFw9oTo8QS2sN/Z6S2zYlD4h/9fu23qJs5SH12R6kP0MPNh8Lpv4IfPhETwCYSLrx
         hvEE5iozqHQxMuxlghjkMpiqlRoDYxxJuau/E6XgMlHlABjoKk4wvbCCs3K8z9gZoPQh
         CaDtABHj6MlK0oUv2l0A9O4I8VWi4AOW7h1dPTPiqdgEQLJDU9WY1N6od/Jr3BPglsiW
         ciug==
X-Gm-Message-State: AOJu0Yw5nyzINX9NNHHwMkSE9ACEQAT+X2nmqgYhwRCOYAWEPJv9XMVD
	iiqeZAA3nxyYTVwTK+MIsf/qbsQJpbuKXQPbLFo=
X-Google-Smtp-Source: AGHT+IGkght9nhDo3TCWbIcFkByruD/MfF6jTEPUWUNsqN5mA8zGJ9CDPDeuUBlfsvRjcjlJBTqqUA==
X-Received: by 2002:a05:6a20:9712:b0:10f:52e2:49ec with SMTP id hr18-20020a056a20971200b0010f52e249ecmr2550690pzc.53.1691683503160;
        Thu, 10 Aug 2023 09:05:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/37] opkg-utils: upgrade 0.5.0 -> 0.6.2
Date: Thu, 10 Aug 2023 06:04:08 -1000
Message-Id: <525459d2f387ec82fabccdae19aa8b977f534929.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185771

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b0fe9b3dfbe78716c96b70ef098d9cfbf430d5b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../opkg-utils/{opkg-utils_0.5.0.bb => opkg-utils_0.6.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.5.0.bb => opkg-utils_0.6.2.bb} (97%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
similarity index 97%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
index b27e3ded33..eb88b9b734 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
@@ -10,7 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            file://0001-update-alternatives-correctly-match-priority.patch \
            "
-SRCREV = "9239541f14a2529b9d01c0a253ab11afa2822dab"
+SRCREV = "67994e62dc598282830385da75ba9b1abbbda941"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


