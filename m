Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CCCC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.7300.1651727163890420281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f5fX6/rO;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id kq17so6565366ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w126hi6gdZ5SQW++QfdO7vzukEmGBvrsmJpnYOc/bHg=;
        b=f5fX6/rOOnNLv1Xkjpc1fKtPbQB/0f5IcJtNagjYZ7gyAGHGub9pz7LqIRpvfiUyEu
         3Suv1mMEw6hBCQ9Yk/gUJ37eSMtW9OjLrWHwh/wR6kUuJTN6C9hiQc4KXSFJAU6DQSvD
         4ESoC9Dmk3+SUdgDGp6b1+vdGpvu2ooqK/Ff+kFZvb5Q2Nwao7loDA8K3pf6P/KgCH0k
         foJJnYbADfFGB8YP5OKMuKB8hRVYUDwvNuBAf7UWDcnMRH+vIEAZed/lDwETz+WFimEV
         Y2xkNNDimbNqGNHhiFlfa3iyw0Hzj9OkIy4cG4mEZnrhARog9RHQ/8HGSrgpgkBHKoLe
         B8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w126hi6gdZ5SQW++QfdO7vzukEmGBvrsmJpnYOc/bHg=;
        b=iC85MinYKvEothp3RT6ePvYo2Mw/dFy2dL9/UkfVL7LTkT4kVV+LyPIBTgrSBEDG4Q
         syX/DyxE6XkPqnWEDHtOCRKdjW3RzV9oK2ScI1gFCYUaLp8Fkuc28aSjzyAvJi+nFtJK
         FpFmvkEUmHWE7cAqVatxUZU1owuV/uq2qgpwFQ2/tvlms7vascUZIgURUPw2d4rqD42z
         UAn+nUascIJ+uGq19SX5eEjhdusFz3KM6nzCNA0XZ/DZgqS0o6MrNduUdttc3BZGf5pb
         7vSp5DokOBR/rtZcEbO+ZoGogh9vvsEAUWFTR5s0/iHZdGL2qFQxp/hhvN1mGAUu915L
         tBwg==
X-Gm-Message-State: AOAM532GrhwQVyuWbmkwoecrwqHnyz9+UeiI9j0LXhdwC85BL7/2Rsg/
	79iNAchNVLXPVjLZfN17Ik/aoz++ukg=
X-Google-Smtp-Source: 
 ABdhPJz798qrftBovG3f7tQOgPrsgFDICPG+mBKwh7OdSDf8C34QhsuLX2kT4ecRAhj1wKsByD4zmA==
X-Received: by 2002:a17:907:3e28:b0:6f4:3ba3:504e with SMTP id
 hp40-20020a1709073e2800b006f43ba3504emr19262674ejc.632.1651727162496;
        Wed, 04 May 2022 22:06:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/61] ffmpeg: upgrade 5.0 -> 5.0.1
Date: Thu,  5 May 2022 07:05:03 +0200
Message-Id: <20220505050544.651895-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165249

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ffmpeg/{ffmpeg_5.0.bb => ffmpeg_5.0.1.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.0.bb => ffmpeg_5.0.1.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 96eef5e0fe..dd14f8df6f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -25,7 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
-SRC_URI[sha256sum] = "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
+SRC_URI[sha256sum] = "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
-- 
2.30.2


