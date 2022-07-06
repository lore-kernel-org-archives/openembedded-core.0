Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B428CCA47C
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:32 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.3671.1657094850190641085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CNZQs7HX;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id y8so12469499eda.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8xNxAknfMujVu8utXOMdFfkLPLSZAT6N8d7VQJqGi8c=;
        b=CNZQs7HXFEcHwsoedyoNdz5iOhA/qGZSnEI4B6edzlqQxmVEbiwcO1zXQhjx9blZhG
         iZvNOn6uSFC852a7R96y1N2OM76834gp3SM5AsqmoRrxjMy+gPPJtluWT0dhVHgJWqFU
         CTOOfHaHyw51CtUWp3azoEA3s3Ce3AUA3wb9OhUkWzkRIgG6soIxIuz1Npad7JSOb19h
         /sCHlyDhPhKX2Z+mdk6vftg0V7wdGyMPUHzBdCeQ863iHZJFcAJv8XUsPFoU8+ySzYiU
         ARNrA22DTV+UMb2sFTjg4NuB9SCgDfzfE0eKfWWZlX5KI1eiAZ+7X7Ut/azvaueAYWWc
         YTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8xNxAknfMujVu8utXOMdFfkLPLSZAT6N8d7VQJqGi8c=;
        b=BuxE2KyJb51jR1qYe1ezCzGPS4C6F5HiUX9mQMLJNC3zyN3CpLn8k6d7fEOFR0AyUV
         gUoqPXLm/XEDPIph6ScX9WtbqujOeYYXFByeCBnBGhsUpiKw0dSzJyP3LskFNvtJcHVX
         dIXQjpU2CZppIm5MqOVrQdn6zLbX6c8Bq/MxYtOwT7w336IWXmL33TlTLK8lEXl65ULZ
         9NyjhT92XxXkfcs2z9iFpAwfzawfm8m/U+258urWo7UdBhcdLhfdAf16wAj8JU8uT90z
         ZTd5ksm79W5kaYOS7UXPu+ISZT/qeLETkdnoFhU6xu1J87Xlah4SYKkSoyEIQdbVdzql
         rIuQ==
X-Gm-Message-State: AJIora9yIBvZg8wegtXNUg8ajzCzG86ItG6bKZozObNNBbYk61JgiGMt
	s8Q0IwUeRoR/a3S7JoUwZZ8CxHp89/46jw==
X-Google-Smtp-Source: 
 AGRyM1sEVqqv+qC+2PCFvGVd0XpJ1RB0uUgZKjwPuE+pCACLq21iOwKZPbCnSI1QG77Mi5BwxaGsIA==
X-Received: by 2002:a05:6402:5306:b0:437:8bbd:b313 with SMTP id
 eo6-20020a056402530600b004378bbdb313mr52229214edb.123.1657094848746;
        Wed, 06 Jul 2022 01:07:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/27] glib-networking: upgrade 2.72.0 -> 2.72.1
Date: Wed,  6 Jul 2022 10:06:58 +0200
Message-Id: <20220706080721.3072553-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167691

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{glib-networking_2.72.0.bb => glib-networking_2.72.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.0.bb => glib-networking_2.72.1.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
index d578f17aa5..41f18d1c48 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "100aaebb369285041de52da422b6b716789d5e4d7549a3a71ba587b932e0823b"
+SRC_URI[archive.sha256sum] = "6fc1bedc8062484dc8a0204965995ef2367c3db5c934058ff1607e5a24d95a74"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.30.2


