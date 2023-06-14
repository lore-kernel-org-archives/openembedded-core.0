Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28238C001DF
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.7354.1686734978507523286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=puKbutx3;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9827bd8e0afso31467866b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734977; x=1689326977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+Q5kgtg9nzZbEQ5ypUBxWiw+819MhYvoyib698ChEg=;
        b=puKbutx3oa4JsUuTfIFy5TcGdd6bsSj3vxP6a68jAxIbHdSUCeMweb2s6sDVSlbhe0
         uP2Oj3V3/PdUab+nNDLhOlMjyu//wCbkedNiUZ8Vxah6qd+oafhidodnMvwd6Yt9FfQs
         yu8rjPWeY+sXI50gu7Hn9iO6xkCXp/3l4CLTuv093Gi3Ibjj3MtYpLmivO4hzUEdg9hw
         WudKPs/5LoORkLN9JQKZ2fTCZI1JHwWWaIsy2L6poe0kG34qqN4jtLD6CW/1WOVetW1Q
         YmvA6ijqCcuFl+eTn0XXf/K9AUdrn3ZNp8YYG8TxyrOpxkChSsWhG+gbLoRTkizbD4gK
         mQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734977; x=1689326977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+Q5kgtg9nzZbEQ5ypUBxWiw+819MhYvoyib698ChEg=;
        b=fxTfJftxpPRoVver8K3K9BU8qLhPrXYlNlDF7ubIpWW7Zftt/iOftDubW01yLKrU6v
         AawHwXz6wwr2dXX7qiHfxM0CBnPYAwK5Wt0x71e57hJhoVGIfpRJVlxlkANPJzbjoq65
         TutsS6hh1qftSiv2YXBtbjPZ5ALYOjlYEpUMkY0Kh2ZwZi9lktdoVS3/teo+/BsU31nV
         OSo5UahKcKYld9LTD2CYGAgzKTIs3oTBMcdrY+vvrcq8eay5tWa45cuhIeOsINc/zaUs
         ZVeo6SZn8Rxs1m9pHSs81KugJJRzT7V2JSvHayDpaPkJh4C8LS2Of2+LLRaXg+gkhSBG
         33Lw==
X-Gm-Message-State: AC+VfDwajxDQZYtxj/I4dtGr7aFFiZu9POaVlocuNZrFfDISsiY35dsv
	3Y6ohvamNdBHEzgaNkJRl/g5wnN+odA=
X-Google-Smtp-Source: ACHHUZ5ywAB+Ot0F67pEYKts374yOWKdjqeD5bBlEf1VuvtCW2SK9CQqRR7X7RmWijZiPLNg5YV5nw==
X-Received: by 2002:a17:907:6292:b0:982:3b43:6f23 with SMTP id nd18-20020a170907629200b009823b436f23mr4891345ejc.28.1686734976965;
        Wed, 14 Jun 2023 02:29:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/55] gawk: upgrade 5.2.1 -> 5.2.2
Date: Wed, 14 Jun 2023 11:28:41 +0200
Message-Id: <20230614092918.4065570-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182763

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/gawk/{gawk_5.2.1.bb => gawk_5.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/gawk/{gawk_5.2.1.bb => gawk_5.2.2.bb} (97%)

diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.2.bb
similarity index 97%
rename from meta/recipes-extended/gawk/gawk_5.2.1.bb
rename to meta/recipes-extended/gawk/gawk_5.2.2.bb
index 768c8eb3648..3c18b6911a0 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "529e7c8c6acf21ff3a6183f4d763c632810908989c24675c77995d51ac37b79c"
+SRC_URI[sha256sum] = "945aef7ccff101f20b22a10802bc005e994ab2b8ea3e724cc1a197c62f41f650"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.30.2


