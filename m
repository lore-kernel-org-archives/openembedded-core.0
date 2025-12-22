Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B424E6918D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87673.1766434089880792461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zb0Z/1K5;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7cee045187so777577866b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434088; x=1767038888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kNarHLZmqU4ueCthw02zhMPgZ8Qg9mvfhFoVK/o7eQ=;
        b=Zb0Z/1K5+YLo8JMOjkNdwPAOpJILDoPg2+0O+5gfG8ytxHxYkN4YMKcEOEC7j4iLSJ
         hMX4b44ya7Md6oYmrOO1TU8wkUZPsRDvQHAmGW0OCJv6qfODHHHxBHpN5h5hIEpn1Os5
         IXYmoP5jFu9XRRgt8sN4gU27P/ItKP7DLApKP8Vr3yDri1mYq71frsck9CxWCkZgeVyY
         4FbP89oyyMSXRoaCL4aKl/nU60chp83uDzaVU7TF41foCLSfOKIm9ghjB9428mxKOKrG
         UsQu2hXoaEOP0wUPoveeRuJmciPIXgNkwwBQtX98dbzT31VFxpzdHDHTD2E1s5JxkS8t
         Ta8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434088; x=1767038888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9kNarHLZmqU4ueCthw02zhMPgZ8Qg9mvfhFoVK/o7eQ=;
        b=B0gZ0/MxOYNhmNDnl63B1PN7mkpLhmme5bJU4wF00QUjpRpYGtiZMfuk29fgz5OouD
         HN7mbseqnaOnNLpqtwkKr4F8kGdUT0Y2Gpm5l7fp70vHbeISrcp2r+SZR4hzk1aWDh5h
         X2EmflUc4dgBcuXeEVHVSRabq9aiUoY6ZQkD7NkAVZxi4N1oS/fGVWefEBPXQG6gCXBF
         66+HGP9wjGotpktjctTiS4pKrmFD7YnF9ai0T1K4j2PP9Uz0ZD7G41jd5QU1loCQeNuO
         8bJhdGRkKRDD/DUNjWechEONwWJpwPYpBUAqSx4jcSFN4b5JE0rdp6vXLqTMcTy9Rw/E
         xHHQ==
X-Gm-Message-State: AOJu0YwMsY5+8shoVvCHeZh3I8cgDCVWkdl1ln6/QwS1As2MACgb/1L1
	xHMig+Z8qVjLVyon4AnWPuka1n0NIcRwGSCOljbH5jCRXCOpMp8RwNQ4dKaPkA==
X-Gm-Gg: AY/fxX7Rh/mTdG1wGy9Nyr5l0KT3vIe8lIcvK3UsNdYFL5v4AaB6ZoPXbk1zI5ZYuGd
	WgvK/PN8KD1+VXloZ6IP7Sy0DMNaoXrYuJVATweb4NWVksUP35XEc9zmVAa7vcc5o57NXSUgYU9
	oIc5MqbOIE+5HH5llG+fHc4ZaRF6/wxQ0b3v3BvDquKR8J+iiIlJzI07bhHpPgYCpUip6Qpg1NZ
	9w12NgW1W2eZGh3T5M/DmflOsvsLlraequmuaUb3cWt5Eg4ZCKBi0N7Z4em8QrbebYFfSpf/Hxv
	NG9VKFQSsZBW6I4xO3JGJQfXHkD9u3EG97llf5FBiYAXxedkm19p4+rKGtPH5yWD1FLadrPRakr
	2qk1CCdfmQbMQTEnLYZIAyMLhkr3odjjVoYAXsSGc2IaMoscmA7eZoeLd7DCsyWjL8iimwQVwCE
	AH+6mPi04Jq1asPt2l92zAfXpGXSW20gcs0SfGiUNwzuiEdWE=
X-Google-Smtp-Source: AGHT+IE3LRP/alLX/SYdntfNII2n9i+RNpQVMSU4Mm1jQ2D2xfIp712MpPywPYtOg06TTriuE3hhSw==
X-Received: by 2002:a17:907:fdc1:b0:b7d:266a:772c with SMTP id a640c23a62f3a-b803574c34fmr1341576666b.21.1766434088088;
        Mon, 22 Dec 2025 12:08:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 031/114] libevdev: upgrade 1.13.5 -> 1.13.6
Date: Mon, 22 Dec 2025 21:06:13 +0100
Message-ID: <20251222200739.2278706-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228356

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libevdev/{libevdev_1.13.5.bb => libevdev_1.13.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.5.bb => libevdev_1.13.6.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.5.bb b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.5.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.6.bb
index a42bd38489..4a2cfee4c1 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.5.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "89918ae7b7c13936e6482604a77a2bfbbb74544c5d039fde01c3fa1bdf639987"
+SRC_URI[sha256sum] = "73f215eccbd8233f414737ac06bca2687e67c44b97d2d7576091aa9718551110"
 
 inherit autotools pkgconfig
 
-- 
2.47.3


