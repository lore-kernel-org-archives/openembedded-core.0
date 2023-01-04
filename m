Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511B5C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9368.1672830362190792853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O0Qcage/;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d17so12824918wrs.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5Eys6T3QMEoNTPHEHq9j4USGKr7/kIQX7Fv0fXLgM4=;
        b=O0Qcage/l3edM2qxOVGrlS8FZAtmMIGGWwAw7SOYuzPO9+7vVVG6X5aBLwXEV5qrUk
         VzeQt62i6pQ+dr2gMASlM+6P8uyyQKrjlVXg/7obYbM2tcttMeLQAScN+DiNxXmMm8xX
         Ql6eQT8u8QrojRewLtZ2mDK6dDSpkp82wxU8Y7Ii45EDvflpUZAklHsT4TULholHGSlJ
         DJT7ot/B5ECcAvhyzJYXKm1eQuD+U/o6Uvgb/oO07xMuRu+Lo/Gw+Yar/WWF/efEjfru
         CeQQDlf5Ku6vEkff2tytDtH8TxTY/qYIOmVPfa81sAcbrmpFvITTCqtj5cHPAWNs7efp
         H97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5Eys6T3QMEoNTPHEHq9j4USGKr7/kIQX7Fv0fXLgM4=;
        b=HvfiHzm3mxG958wplD3YOCe/kRCBttye+6ZwRjKZv8EFG/AyObOPPzhH00agxf/FCB
         fh3+2YH42QRD/Rha4N3+pXAh0tcCKttpYRnDlG0lrLTwIrf32Yna+NsSEbNxaYBQY+ZI
         HCBXTj5y8FK4tHadVOfajrTeA7nZPTne2/y8XlwqCLAdyb+RCjW+OR2kcZyKRPm5QCvY
         hFyoih/t90StiBlbyoc9wFrR6c5HgjYGS1Y2n5YXKiexhQrxMrfeTkQQXznEDQZ8A+Ry
         bycIaoPI2DNnsebXfbhlN0rVuBbUqjHbqMgDQIMyy0gYHFcbicrB9ewWpGrOGu2LQkU4
         1TDg==
X-Gm-Message-State: AFqh2kodqYQFm5aqJI9EHoAUgUiosGGxGfKTYmlIlsL6lRw3xdiPj6u9
	pqJmJL0vd6IMmbTgjfjPQiSAAyO47VE=
X-Google-Smtp-Source: AMrXdXvc4qECREOa435vZTEsM0Rbd0cLjWAWlAxfX036lHfem72ifww2io50xdQdjolHw1Vf9WFN8w==
X-Received: by 2002:adf:aada:0:b0:26f:596b:1fb8 with SMTP id i26-20020adfaada000000b0026f596b1fb8mr31780560wrc.44.1672830401585;
        Wed, 04 Jan 2023 03:06:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 64/77] python3-jsonschema: upgrade 4.17.0 -> 4.17.3
Date: Wed,  4 Jan 2023 12:05:35 +0100
Message-Id: <20230104110548.2537259-64-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175449

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-jsonschema_4.17.0.bb => python3-jsonschema_4.17.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.17.0.bb => python3-jsonschema_4.17.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.17.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.17.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
index 02337fe85b..392b9584a3 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.17.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "5bfcf2bca16a087ade17e02b282d34af7ccd749ef76241e7f9bd7c0cb8a9424d"
+SRC_URI[sha256sum] = "0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d"
 
 inherit pypi python_hatchling
 
-- 
2.30.2


