Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059D4C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:32 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.3672.1657094851137117741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kloy55Hi;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v12so5600515edc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DwWkqIvkpGeUlQqin7mdU0G7IASoNh8C3W3hJsqZBP4=;
        b=kloy55HidEz+2iflnFaOfpC6xNApBHu9cX587k+HqGIU1mjA7NvlWAnN4tXZnmL8qq
         gcaj4yLfkuZ2z+O787ckD4P3pw6c+0DJtkyf8kv1qknrk8ttQadf7ksnKg3Agrq9vT+2
         k6XXN15yUxpkA73qH/2IabkKd5SNGfh/1/iHnAOtgL0siMX2vffmuBsmXtkeuLoUsIAm
         iEzib8jZ0En45kaN3BZedUvsD4SZh37oQ++xU6vNuDO2etx0OkmzjxdWsodZx6Bq3k/H
         kowJRUe6YHCEsS037A7e1sxx3vJMrWoGn6YUd1kDZtvfX5risvl3zddYjaN1LCK2RiP0
         meLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DwWkqIvkpGeUlQqin7mdU0G7IASoNh8C3W3hJsqZBP4=;
        b=ugYWuK5z75sZgLT/A3jbzRTWt/hyS+TEYMmOPLgFpo0ESjowysAPIS/+JdLWnR20zl
         b6Fkqsm5ZKoRXIA+qV2w3k+rz0neNA683HeLH0r+ehl/8yAHM6Y1W6rdAPd2/nQ3XP2i
         /05+Qa0QQm83TAzL+uIPP4nAkVZ6wLr193Odzu0Adxh7VIU/cFetR/7dP4t/ZWeDqy4M
         Q3u0ONuyX7O26g3Uhs2Rq2FeerdevIh4Uwx0YeCa2HXcazE8tA2BAZFLcUdowUoxeps3
         OM1Q3fHaLNX8+ZeSh5XYbjpse0keaimdV7GFhEPROsrkYKJNMPCjnF2T6eOsQip8jz9b
         nHUA==
X-Gm-Message-State: AJIora9jdRgFmwwqEuhEskz3pTXKZkHwB4q71MM9sc22DGKwLLcizXOF
	veCIAq03PVWHGLYnz9rs4zYJxt069txZLQ==
X-Google-Smtp-Source: 
 AGRyM1uq9x9up4B557r4uHp/Jev2GOZ91byIsEzmv6E5EHIBveZq3s+iI7mwj9L8ja8hEgjnfcxM0Q==
X-Received: by 2002:a05:6402:4493:b0:435:8dd5:c951 with SMTP id
 er19-20020a056402449300b004358dd5c951mr51329878edb.289.1657094849627;
        Wed, 06 Jul 2022 01:07:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/27] gstreamer1.0: upgrade 1.20.2 -> 1.20.3
Date: Wed,  6 Jul 2022 10:06:59 +0200
Message-Id: <20220706080721.3072553-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167692

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{gstreamer1.0_1.20.2.bb => gstreamer1.0_1.20.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.2.bb => gstreamer1.0_1.20.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
index 3aa9aa7048..1f4576c3e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d143b17da939ceb5e0a"
+SRC_URI[sha256sum] = "607daf64bbbd5fb18af9d17e21c0d22c4d702fffe83b23cb22d1b1af2ca23a2a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.30.2


