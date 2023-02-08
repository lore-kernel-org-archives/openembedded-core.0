Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA59C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.3134.1675840925245421797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MIIT+Fdi;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id o36so12660820wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2qVCktMnwPkOYh5gN6jy5TH4nXXca5L6tg4O7Z4++g=;
        b=MIIT+FdizN9kmdR1t6oLqj17WQwiWrfzWFdxxfo7Jli9a8feKC5ZjHqm2WChIvs1S1
         tbIP7Bd+RYUlvNiKy9JMysRQkNbApOBiY8FqMngJscp80voF+3ySUfBmiCCiCPziYHvX
         lKm6MgpwzfMl4zf5E43bVtm/yyoHA+XmY6fu5AiJVDC4VkvrxHmc8VSvUtHPfBvhYc+a
         L+RbmvtUZLv1D4KbUDJIwJ7RDP2x1HJzMe+X68uV5yEDyNSS1do12ZTIxbTcyaUgkuam
         6hLZO2dBgoKhM17DwQxSh7ada5kQ/4YAN8/TAEsW2uGN+YBDFropJmuALKGwPQ1sQRRw
         8UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2qVCktMnwPkOYh5gN6jy5TH4nXXca5L6tg4O7Z4++g=;
        b=0JU12TqbYgnZ2Bc0MxF8Rw5sNXvaHH0d4Hjl1rXDBmodDByjKFY10zVFPAuG2U6IcJ
         WzplgFdJNSrnUK4j/vngdtgOQL41jf97PbXKJsAzbCTzfi4Cb7qR3GjJimh61H5Zzb5b
         J/bx8WbQG5zlxSx6vSE0fuTz1Qak9g0D/mKJnJ30QVg4LwekiZ5UhfgeEiwTiX55YQ/u
         xcTQ3yWOpFGVOTJtN8nYmqW29exVO32EwgVQuRTuO17Mi8PxXg5oRr4TRw7T28j67BjI
         lydTtdrupYOxcm8cZvw7Jaiu7KbwSid1nutIMCBv9AoS/RvzIwOP6oDv9M1c1sP3/3FH
         5LtA==
X-Gm-Message-State: AO0yUKXCPt9M1mlYvtS+wYvA7KEhqTU5Us4TgEYMQ9Xhuk32c82tIczT
	3icrfsJIaPaS9qzjOyq3vzwSrEEKnRQ=
X-Google-Smtp-Source: AK7set/JZzbEBohexbjlsWPPhdGsXKGkbQIcmBCJZ/m22rCVlsCrWSIMA8Ii6M74V2js/KCkJaWMXA==
X-Received: by 2002:a05:600c:4384:b0:3dc:1054:3acd with SMTP id e4-20020a05600c438400b003dc10543acdmr5566342wmn.17.1675840923816;
        Tue, 07 Feb 2023 23:22:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/52] mpg123: upgrade 1.31.1 -> 1.31.2
Date: Wed,  8 Feb 2023 08:21:19 +0100
Message-Id: <20230208072143.2930292-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176868

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mpg123/{mpg123_1.31.1.bb => mpg123_1.31.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.31.1.bb => mpg123_1.31.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb b/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
index a8a2377bd4..0a2d870cfa 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.31.1.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "5dcb0936efd44cb583498b6585845206f002a7b19d5066a2683be361954d955a"
+SRC_URI[sha256sum] = "b17f22905e31f43b6b401dfdf6a71ed11bb7d056f68db449d70b9f9ae839c7de"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2


