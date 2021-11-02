Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EB0C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.6551.1635842597842011250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GGxa8DK9;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id t30so7186389wra.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=byaCHf44nl5HgZfqIX3eY4kSU9XRkxMYiGB4ksYoBec=;
        b=GGxa8DK91id6Sa/Ede0ZLdTIWNIkQBNAWpwlQzcSGngyRDNzhy491LMcE14jfAWXnJ
         foM0AspV/aiT4f92f8xgbV+uqhzzKl2QvRWwYXPNerTVMJ/9HnnaM3ZnxGJckWTYmoqD
         /0drPkRzFdG0D/KRkn+5eH8QL4MNNON95PKjBtIUVJJNb9x8IoO0mg6Oxx2jAVZcDNhZ
         UEVkgPhQSDGHqzEdS1ONHoXxjZMFWojMwLeQ9qPtTg1O74iNnR8Diw4ZANF8m57woS2F
         NXQFolc+DjCLGhKJE9jI+7AmQEHci3SfcyH35sOt3reuOIYUt5zHm0/VLc0oBQ2CJYn+
         IFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=byaCHf44nl5HgZfqIX3eY4kSU9XRkxMYiGB4ksYoBec=;
        b=IN35RHq0bLVDsCHJCWk4FEHzm79icrZ6JqhFk1+qOalsg5foyyaehPQJ7hz5z0oWk3
         MmEQgrn32eboYVOsl/Oe7ANc6J3Gb0in+2/wRgEe1CqSpy4lpfQ4OsJ3WclkfDx+QaOp
         GhG54AaRuts/IygqvehucsombEdKaaHW9hBsswN86yQ0qmhj1PUBmi0F7eag4tEQCycm
         JPWLnh0Rw/HCvjfxWhQHWkQXbYUI0kYioofPRzwlIxhirzIAlL6S6xvEbQHFmRGtq/Xn
         5zh6Vc1Jf/098CSdrxdgvBDWXbZJjLXFJUpgzCii3K/OjD+gY79unDBtk4VqRFzNDqD+
         7BEQ==
X-Gm-Message-State: AOAM533Btb0f/CPM5ylEhmmhEHfZpfYaxDxReEob0BBiTUCx6nqFtxPH
	9ZZCdLOJrSr36yGRnYm0sEt67u6AGxY=
X-Google-Smtp-Source: 
 ABdhPJz4Wy8AEfwQZLwjs/Pu61OCR+jhjjK1biLrgrR0OKMEfjSQPafbS4lSrJykWTXyW46MY0LWAw==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr45981730wrx.137.1635842596513;
        Tue, 02 Nov 2021 01:43:16 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/33] libjitterentropy: upgrade 3.3.0 -> 3.3.1
Date: Tue,  2 Nov 2021 09:42:48 +0100
Message-Id: <20211102084303.2974802-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157756

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libjitterentropy_3.3.0.bb => libjitterentropy_3.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.3.0.bb => libjitterentropy_3.3.1.bb} (95%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
similarity index 95%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
index ec6bc05728..82673994cf 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.3.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master"
-SRCREV = "418c1e64231255aec2167cbb20aab62a0863415d"
+SRCREV = "887c9871ea110e397812ff7f3b28a6269f0a2ffc"
 S = "${WORKDIR}/git"
 
 # remove at next version upgrade or when output changes
-- 
2.20.1


