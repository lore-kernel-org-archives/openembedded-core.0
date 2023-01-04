Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DA5C54EBD
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.9383.1672830373513666754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lCCnCY1n;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id s9so554025wru.13
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47PP1YBH13KpW35H//Fy3vrHgyAeh8ZHxcLbD0goSeQ=;
        b=lCCnCY1nDFPrO+s3T68Yg7cVMT7cjeUPTsuGpVaMO4rm7aNvmQd3L1KkHjXZ28ItDQ
         uZaSl4IjRT2J1BtaB+InuocNaK9P+zfrg0X5NI8gp/3+H6OxBBhVELSgDx5vmxNKaPR8
         emOX/wjP9wWH0XpECoek0HHuzE3x36Sw3eFZ06E/nN4R1aSGYiCx1rIZcggE+puN0N3G
         vUzNxiASwU80Bqt2GwtywCRBncXfrb0VZLT00x959/COR//7RuwPDGlCgA5PvqYLZ9Sn
         AC6OABGq3Z/0e+YqEHh6J310HIHlX8TpBZZ/23vIhI+zr7amSizhyXb+NvCAUIMPsny9
         yDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47PP1YBH13KpW35H//Fy3vrHgyAeh8ZHxcLbD0goSeQ=;
        b=zgui+bLIgZ/FCmxXUn0YthbcTX3B+63ZVsfLY85YVuF5EzNsi52WPzxJ+6/J5cMVTi
         Eim7TbGZV9xVLv7k6P7Um5/pdMlDrUvdlmbrAjKqR9G3Prci1J1bP7PF1ARAzNpb+T3B
         e8w9Kwa61KpHMf9JuyrWgIEmz7oBZ1ZpbCumz7UVhwJCa1aS9N52tLCVd5ApD7brQnnC
         02oSMSz87V8uUAF0aJtou8WQ8tBOCZVvHRX9H+wyXcn4o/nkedkX/HW9MG19Aedel5f+
         jbyUxG4PrRSXZPlyZ8synBsVaGoS7lkql0e9lrYmEV5SlnClH95aYQe3t/7Uza+dgHUu
         ySNA==
X-Gm-Message-State: AFqh2kpbKwfe6jm8t5FAuHv4KjcPHXQZwLwhjwFMhnQUVtMNyIA/8ahQ
	e36BEWOkKn2DKENjKutp4PnxBFgYmH8=
X-Google-Smtp-Source: AMrXdXvo2NAQyDHe5blRU7Vbkqbx2yhxeKrYGioZ+BbuvoMv9yyyky7STlFQXpPDFx3I/VcwjsWh1w==
X-Received: by 2002:adf:a4de:0:b0:2a9:89e:2b53 with SMTP id h30-20020adfa4de000000b002a9089e2b53mr454259wrb.45.1672830405687;
        Wed, 04 Jan 2023 03:06:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 69/77] python3-hypothesis: upgrade 6.57.1 -> 6.61.0
Date: Wed,  4 Jan 2023 12:05:40 +0100
Message-Id: <20230104110548.2537259-69-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175454

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-hypothesis_6.57.1.bb => python3-hypothesis_6.61.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.57.1.bb => python3-hypothesis_6.61.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb
index 064d7014d5..204471c186 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.61.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "1d8ed5136f368e343f39172b06f68aa7fd1312cf643c332ab18a75d56789fa90"
+SRC_URI[sha256sum] = "fbf7da30aea839d88898f74bcc027f0f997060498a8a7605880688c8a2166215"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


