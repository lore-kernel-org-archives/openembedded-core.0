Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F02C4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.4335.1667832933183410370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZOs6TaTN;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id o4so16615868wrq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPCEfb+C0JHj6zByBfmXY3AGV4Xlqw/wkp++C1LQRkE=;
        b=ZOs6TaTNJZO0pwfvDd5m/fZ93oOCIvo9ZVmj7mMNzJ9ZySYdNmnZiV/7XgHA6j7fx1
         wV7dDE63bxciJDIQinQy5TBwjtwVcva3MCj0fe3tH8cwl7TmJgipDUv1bCK2tUvQMl++
         QSYctrlfXnh7i3RXlsmdWqFGI0YOQohQAaclOx/oQqWa+z5PmQlP7g9CdfJwTd/v002Q
         S4XKVL69IAVIasZj6PcvULlnDt5NGhxFIGj5qVpEPfsPfd+SXDDlJy/cCkqmwUPQly3t
         32dQUQ013Ndq/H8OZ9WbdOTwY3rA09tYS3GpF9PHnVBXsCanfonWrRlW0MX6sB0l83qL
         +6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPCEfb+C0JHj6zByBfmXY3AGV4Xlqw/wkp++C1LQRkE=;
        b=QvZCQ3zprZtIGBz9iJzYoKkZAc25uvfuMtGqo3oNeoC0V/nDQKhBQjSQBKNQLkHJoZ
         NfXKkWr9C+3TSXmpifO/lq1bGQmeMS7iJ/3IPOedoRb4kUONcqBPJwowM45Z6D3qkhUY
         O6ycBApISNJWU81GrbDE/JT75cECeYgnpoaniOww4ccMPhs48helXKfAGv+J7ko4IiSU
         uEqjwESOJsGI+e2SrLIC9Iy8paWKPRiSW+qqPwl7l0dvBVJmuAGr/sxs7hIXaFxly8xO
         H6Wb9jObNs/p57NtPdxXt4unJpg16iW5tzG5bVtMAxmj1m6IH0kRYWBXOpJdvfGUCr3b
         oykQ==
X-Gm-Message-State: ACrzQf1Q4B5m06YJVeOFuPTpRNrHSolQzmEkjZcQumwEDI1WOS0MrGHs
	oSbOHbMUE0XHrkLix0lQX5pH/rBJFaw=
X-Google-Smtp-Source: AMsMyM4yoNVnPZ/j1p8GcYtd39ADJU4uwD/A2TJncOPHberwps1JNoWhxeZdRMgRDAWqcGJKRmZ/uw==
X-Received: by 2002:a5d:4711:0:b0:236:48b6:cb89 with SMTP id y17-20020a5d4711000000b0023648b6cb89mr32543882wrq.246.1667832931694;
        Mon, 07 Nov 2022 06:55:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/48] fontconfig: upgrade 2.14.0 -> 2.14.1
Date: Mon,  7 Nov 2022 15:54:39 +0100
Message-Id: <20221107145508.1051404-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172869

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../fontconfig/{fontconfig_2.14.0.bb => fontconfig_2.14.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.14.0.bb => fontconfig_2.14.1.bb} (96%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb
similarity index 96%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb
index 80f952a024..ae5a45be54 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
            "
 
-SRC_URI[sha256sum] = "b8f607d556e8257da2f3616b4d704be30fd73bd71e367355ca78963f9a7f0434"
+SRC_URI[sha256sum] = "ae480e9ca34382790312ff062c625ec70df94d6d9a9366e2b2b3d525f7f90387"
 
 UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.30.2


