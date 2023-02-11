Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E66C64ED8
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:47 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.19585.1676150685185723119
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wUam7hHl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id v3so5932444pgh.4
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zhPEcWzaBr1vaDKyD4nckw/0IF3Itph7FHH8BdScQQ=;
        b=wUam7hHl8rW3f4Y/hQeIYjRMSB36nsTcgDpxR5kCycndmqJrTTkuXZ190jdf9R2KEN
         kdZ6GcvoHcHh2EmDoILw9wUw1Tzy+GifpQgT2UgykE8rwOugWYTcGEU/snQmKPDliEKU
         HaNmchmaL18eNW+yTrKkfOCjKDXm+8DoH2qNOR8FEpIF5GBxzIR44ravRjganMlM8Dop
         iNGietPX0uJ9kSEYUmRStCW7b/cNjV8NZNkmshqRpScPtAZyk7TVb6388JkMV3S4EJRX
         rAZylujgHS5e081l9T+2wgqPN+cD5/KMoM6mzggI2rNSuAPsoSSqz8DrUp1FggsowSvZ
         M6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zhPEcWzaBr1vaDKyD4nckw/0IF3Itph7FHH8BdScQQ=;
        b=dobTIgLBFzRI6GAjxbbNtH4klmV7t1zMNpa6Hahve/WkBcwgiHPsqXubVCV3XGU7OL
         F/yOWXWXajK/D/oy8VH9HosZwi1pc2e5NMl3xYvHRqCdTgM4dw0FdPL0IizlNS5kOG92
         8lhsZApw4mb/BS4ZWIgy0iJ8uAbGkoUrNX193VkCTdjWHS8o5P/znz9PItcP3Rh5Wi8V
         r5J1hEB6ATLgKSpMWx0P3Sx2V3j41r8kwW4hz7CjWn5uZSpqQGQBcvWW4rohY3hULL4h
         yFDD/Hgj1XChpsYqDrvQc6nlcUNA7Y9C/dATD0FCBPhYLDJeoL2J7siDiS4VBNL9IcOM
         LPRw==
X-Gm-Message-State: AO0yUKXCOiPvduSWtubR3Qp6bB80tf5jPfZXHdTbA6v+7j2ertSYvV1r
	291Yeu1jf0YSykJuMu5GPtuWm2L0V0JzDNrbxAI=
X-Google-Smtp-Source: AK7set9L4PPbK721suGex6lPHpbUVu9AhPmiw2UQu6mEWlGVkY7msPn9epgShpXWZpZcvDhnUGqQzA==
X-Received: by 2002:a62:6585:0:b0:5a7:e4c3:abd9 with SMTP id z127-20020a626585000000b005a7e4c3abd9mr12962142pfb.8.1676150684226;
        Sat, 11 Feb 2023 13:24:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 27/28] lsof: fix old override syntax
Date: Sat, 11 Feb 2023 11:23:50 -1000
Message-Id: <6712dfadb37fd22c683824995449efa844531460.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177037

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 052f767f85eddab9b6e5d78268d2732f4a65d446)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/lsof/lsof_4.95.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.95.0.bb b/meta/recipes-extended/lsof/lsof_4.95.0.bb
index 80128369ec..f59fe009bb 100644
--- a/meta/recipes-extended/lsof/lsof_4.95.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.95.0.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "lsof"
+ALTERNATIVE:${PN} = "lsof"
 ALTERNATIVE_LINK_NAME[lsof] = "${sbindir}/lsof"
 # Make our priority higher than busybox
 ALTERNATIVE_PRIORITY = "100"
-- 
2.34.1


