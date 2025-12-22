Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2743E6ADC7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:57 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87710.1766434129413969939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e6WVEFrc;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so607122366b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434128; x=1767038928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weC9Io89SXG0fekN+I77YjWakNCElTYC1WOx78UZTTM=;
        b=e6WVEFrcNKmxCvZ/CJJKWfBFZzscTdeMLxs9XPRGJx+ME7qL6nqcsAQXEhcA9dTWtf
         Zr2tDw1O7e8CW856/fL90kafGZQxIZNCqKwBaYgJh6f1vCw2SyR+4hZYPaz4pYUFEqcV
         39dxXTt91hphcVTGMaF24a0qPQ8NOuG9m89N29Y8gyFIrZEM/lTvVxxWV91gkJAhIeMb
         oBzedupnt27YCidgTR7RkDaWpYIdkWSuyKqfBSN32OUj8T4JOcXGRRcDmNIQe8Lv4zqF
         ISpwPS6cHPgLvgX6E4dbTCYi/GazmahVyigBUetLb4i81Z6FOXeJsxe/1kFKxCIGpYiw
         l2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434128; x=1767038928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=weC9Io89SXG0fekN+I77YjWakNCElTYC1WOx78UZTTM=;
        b=nrj7XRW69hNw71ONsmlz6TgOm5teuhYfp5Kv/8y5le1yeNKD2PG6lpqqXFoYdi49+Y
         BP1DtrU9YOkhM3rAdrhlSesFz/EtO0Meo7pOM4eYQXi2JbeqVOt6a4THyDABTEXMg6cy
         e4kKwl96umKP0Wm5zwbgwQ7BR6M9ikErQq1ug3LzuCdJlt7yjnn94V1I+Oi3KcENONIe
         dS7c/6oC17M7OWR32whW4dZFiBjkCuG6blQsk/6il1FftkeUrcsb+mTMPlvrpjcAHlt+
         hipFqMR3guzpY6T5BbeNSNXOyWkKz6foFBT8wyNozcSuVKP58w2UujMFxB+2PlqSP9YE
         351Q==
X-Gm-Message-State: AOJu0YyYO6X6Dj4Gb/AGNhrM50INOWU7oKrgKrn+ztzrMVF/Zh5lNqNY
	kXf5bk4OEvHdEPLI1vX2i9xPfzzoChNAxEbFmxzXF9FmRmzxTgNlJvFX+H/2/A==
X-Gm-Gg: AY/fxX4aeizSEs98UdtVBEgoOB6PGpm5YqD1rSPlOuVRAnPhbFS72QTdERzG0mcTgtZ
	fyhH0/DvsEZSqyfM2SVq/MNtVJ0QQTsrzvrOEA9Ozg3I83UqvrrMWM/5YHKBXQgguNxpevngw+j
	S2VE5Cw3jMUk8W1hKFwhpxERCDYZd54vau67nDg2eSg4Y/aSGF1SSocrbiSjdfC9NTQpl6YqcUA
	6g6lg1ZywqTVS/aEYEmAjD0Sc+sDaqgg3QoerIEwn5+sPbR8f7J2kJBeUNmoOr0LIkjOZExsRhi
	Q85AtovXeGcZo+TAQJ5ETBK3R8bKA+JmXJV2l2Xdj1qLbv6pQB5H0HVpkwRq98Pfj3JvzpU4tl6
	JmHN6226wQZZV2F5ElOWz1/XhigTdG9tczY/8qfcrwd3iafhjG55PLRo5t/ahEgbMv54bZ55b3g
	JA/J4ib3cU1Q/WE+hCz+4nZYThWXX6sFDyl7Ft9BDcWPmM5Tw=
X-Google-Smtp-Source: AGHT+IF+Am5B84PkqtO7NRg62rNUMU/ySup2XYq2sXGf9UwWp9EyiirqYlQNs0hTzCDRNNhouTDowg==
X-Received: by 2002:a17:906:30d4:b0:b80:3fff:3369 with SMTP id a640c23a62f3a-b803fff3447mr889666866b.48.1766434127664;
        Mon, 22 Dec 2025 12:08:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 091/114] re2c: upgrade 4.3 -> 4.3.1
Date: Mon, 22 Dec 2025 21:07:13 +0100
Message-ID: <20251222200739.2278706-91-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228416

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/re2c/{re2c_4.3.bb => re2c_4.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.3.bb => re2c_4.3.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.3.bb b/meta/recipes-support/re2c/re2c_4.3.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.3.bb
rename to meta/recipes-support/re2c/re2c_4.3.1.bb
index eafdf93078..bead73279f 100644
--- a/meta/recipes-support/re2c/re2c_4.3.bb
+++ b/meta/recipes-support/re2c/re2c_4.3.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "51e88d6d6b6ab03eb7970276aca7e0db4f8e29c958b84b561d2fdcb8351c7150"
+SRC_URI[sha256sum] = "5f5e8a618960f68bb46ee8728ecd4132e1275b595cfc7a48476f977afd01d0cc"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


