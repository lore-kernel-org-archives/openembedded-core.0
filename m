Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D32DC05052
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:36 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.178878.1692240626426906396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Msz+q/DC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bc6535027aso61081215ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240625; x=1692845425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeilMslX91QWPJpBLmlKli7SvyCOklSQTB0dW5UTQmY=;
        b=Msz+q/DC1OW6qbUn1kLnqCQJntk5UKxsuo0hwRJb7ykAYkkrGP0SwgzRm3iW6J5bS4
         YEexS34k4dY/zCreSGd9YpLjFSH5tD595CZgqDnMhIb24KFg5aPeqiWN+3/JrFLLWPCb
         1ts+Ge8NKm9lm3toQckYT3JUfUwcM912ekkbKBPltnSJUPMRLJBHRTugQ+wwE7bj7xvS
         SoGgRlLK1k9BhufkSTqjtE8TaIDGO/WWFzMsggboku5yCZDYDP4tOl3St6KoTCBaBEQe
         76LZx04LDsv3hlMLBwAQghDNNM2wMaRGSMdbECdnZ8MKX3qzE30lv3En0NeQD7OalJnE
         xDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240625; x=1692845425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FeilMslX91QWPJpBLmlKli7SvyCOklSQTB0dW5UTQmY=;
        b=YHKeLOoTILNF/LKBfgVAgJLXbgB0TZnkBExCt7XaPn1vyx3M/ZjDA+tQZHtwApxikU
         qo2RrvqPD5SxJazcFWZ9Yf6LVbR2R6Av6SzrOrX4NQkg5QVS056zz4y/bOQmSAAViTkc
         +qZn6kwVeyWWfzw+h8GQ6VltCVCS3XTbmhocoPc0LXa2eQX16njAbKkpjaIxOn+W4pB3
         /KMPFceVRcZNItnOgpg9XsUPfSoX7+Z1NQ1yf66adUBcAWOiCJ3HBtqGSKUCGe2UnKEU
         WWz6tSeWKWaSYhVkdzdnoSlcWlMIsLDWOgcIHIpd8A8Kx3bkG/dpuYnT36q718XoyZoE
         7cDQ==
X-Gm-Message-State: AOJu0YyvxaBsSXstGLONfe5u+4YJ68V9E65LbFil1RVl8iwO5gytrEHA
	+pnCoRzh6G4jhvhtr/iLKmAIeVI3igjorwqd53w=
X-Google-Smtp-Source: AGHT+IHdVQRlAUDS/0Jvm0tKQLHdOYfyRVFIHTBORR1KR9/B8Do91HbHEQhCT449UI89NSXHdv92eQ==
X-Received: by 2002:a17:903:228a:b0:1bb:3498:9caa with SMTP id b10-20020a170903228a00b001bb34989caamr4727532plh.58.1692240625630;
        Wed, 16 Aug 2023 19:50:25 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/16] libxcrypt: update PV to match SRCREV
Date: Wed, 16 Aug 2023 16:49:48 -1000
Message-Id: <f20a06149cb61264662d1eaf6ea02aefabc0a18b.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186281

From: Alexander Kanavin <alex.kanavin@gmail.com>

When SRCREV was updated, only libxcrypt-compat was renamed to match,
but not libxcrypt proper.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 98c89359532778a894f50ddea1cc6ab922d6e562)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxcrypt/{libxcrypt_4.4.30.bb => libxcrypt_4.4.33.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.30.bb => libxcrypt_4.4.33.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
-- 
2.34.1


