Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3205C001DF
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:17 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.334.1688831769738808088
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e59Yv3Tl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-55b22f82ac8so2666858a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831769; x=1691423769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmmogTFLL4oQS0DV6JnOIMSKXocWeCPp3enqdNjH7kc=;
        b=e59Yv3Tl6Njx1ajUMy9cV4zIKct6hbgP4YFYapAB5eF4zud1h/q5KdVdM+u9EbqjiX
         JiLbL4vXnjkoTQ6wmXeeA0bDdNnYXqBwZ22eR+pD3nYag2I6RnjGe5spnMkDMKVV3F7O
         k6wI+0GmJ+wE0dvtgnEbHH07NBme44t/T75aAQKnk7aMmHR6q26X2gAuRqTdyWs8YpRQ
         6wC9VTzbPcyT1s0flwHj4P418ZQqP+79xhq888eyiREKR/KqkYwxHT71Q13s01uI0EVx
         IQMxJGdTLZfQBC/equWkdKew+B/V9rkRI3sQgd2LxBRGhccwXcWO903jtXBaoCNBVNJ3
         1SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831769; x=1691423769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmmogTFLL4oQS0DV6JnOIMSKXocWeCPp3enqdNjH7kc=;
        b=M+YsZ1UDA5Ck21+/h6QoZc8dZQ2WqUGHkfpjuahdw4NHORJwRBMCjr/T8BZ20pdw67
         Cwxk3VtA9Axt7PhvFZYNnADFfw7ny9CxzYzdVYGh9p66F2pMxxLpCd7YkmSCoSIm0bdj
         +WnYhCo3N4raW9SjqwqQIghRE2PSnyXZhKtSClfOxU8H5iT1ZIhzaIFTnbKieZypziFU
         lNZ8/xb6Pjo8pNo7B/heKIQUAz5dKz100/XBFu+liUD7Mk7Zfuh2kb/Worzcn0fLYC2s
         Fr6khTY1ja60WuNo5ww+vFYsVCuQJy9sb3663IE+J3P4GLRye6obhVw84QpqzCcaVpea
         1YFg==
X-Gm-Message-State: ABy/qLY51joTm9W00fRJL5pQ3qD0sryEbSbeHvj6mvNKSrdtGfgohfr3
	/oBOr+23QArxJXw0o0KbssV4ac6Moz3SYz5LF1o=
X-Google-Smtp-Source: APBJJlE5tW/Dr/+RrfGA/BzpdzqS35VO9hl1WoU3fyJrPZkYVBWGQ08mxZdakhdHhqk52Ug2N+88JQ==
X-Received: by 2002:a17:90a:8a14:b0:261:219b:13b3 with SMTP id w20-20020a17090a8a1400b00261219b13b3mr12445309pjn.16.1688831768761;
        Sat, 08 Jul 2023 08:56:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/17] mobile-broadband-provider-info: upgrade 20221107 -> 20230416
Date: Sat,  8 Jul 2023 05:55:39 -1000
Message-Id: <698a70eab4384ee4938cb4550fa8469d62db786b.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184025

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 125f72393c9b6fea02757cdc3a22696945e0f490)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index e802bcee18..a4030b7b32 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "22a5de3ef637990ce03141f786fbdb327e9c5a3f"
-PV = "20221107"
+SRCREV = "aae7c68671d225e6d35224613d5b98192b9b2ffe"
+PV = "20230416"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.34.1


