Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E80FC64EC6
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.3142.1675840915639126473
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bt9h5g29;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ba1so11707701wrb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXuVS87TfhVbm4trxjy0fvq/oqGzJWEGQy6daRWHJOM=;
        b=bt9h5g29INnWmM/P2D6X08XlqV3ah6VENDGbVcHu12xgcN4O+oBnqHTu4Sk/J+RQLU
         lMb29gngEQriNoE0OePlIL29/Lc4vEGIU44QxzKvdDfUEy5XIhyA6cFnUNFXBu2g0Aga
         x88/QylBz8BBUC3j1Dpuslwj8BXhWXzm55Gy6pf5yajpEuU72gU/qpLAAu/0F+JCrYqK
         igh2G+JxAJUlUrJWQNz5qqY2Y30aahfh6gcAJ6WoylOyTbVcDKkjHxMtEtymSu0g78qK
         VkrG4TMo1X23lEeh+X9Th+n00XaUgmCVIVzddHME3Q0ledYx4fzLRPlzhmypnQbUJ6AH
         cfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXuVS87TfhVbm4trxjy0fvq/oqGzJWEGQy6daRWHJOM=;
        b=0eX4x90EhX0MUBkfv33NIwrMKWpdob9sPX5IQ7KUPY6kYyI7EDRO2BeC11MLnAYY/b
         xzZA6lp9Bt7+180KNuTC+Ymt5+xHxbj3RbhEOmLFBMFOP1WdxKU56h2UhSPq3gEjXbuL
         m9l8qcZ05DxW3KtGrVSp1J+Mg5CrM/StsjH9zKG6nLjLvAHYkgzM1yZlS+ivtYNpQJ7x
         sY7W8I8hzYWbihphAmxtC3aWu3c/Cm18LUmLeavk6hmJLGrV9dlSSA4aeBC06cvw2XHi
         0AoUybAF2HTPZoZdJjxnQeoOtZtWjpJFdw63wDYB0m2fDvzbu632iPYcBCmQ3wytjDdM
         KKvw==
X-Gm-Message-State: AO0yUKVgDd8LYdUTmi31T2oWLnpf4OTzMXYYvduXhhnDJEnWpxyLKl85
	2S4lp552MKTWU/IHovqMxz0ZXS5ZxMg=
X-Google-Smtp-Source: AK7set/3xz8OSk91tGhUD+oTs24AOuuIrdP8+THn5mX7N91orpIXv+jPH0W/M7TkK35KwAoY+FhCvw==
X-Received: by 2002:adf:d4c7:0:b0:2c3:f8e8:e71e with SMTP id w7-20020adfd4c7000000b002c3f8e8e71emr3424531wrk.23.1675840913881;
        Tue, 07 Feb 2023 23:21:53 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/52] systemd: update 252.4 -> 252.5
Date: Wed,  8 Feb 2023 08:21:02 +0100
Message-Id: <20230208072143.2930292-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176851

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../systemd/{systemd-boot_252.4.bb => systemd-boot_252.5.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_252.4.bb => systemd_252.5.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_252.4.bb => systemd-boot_252.5.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_252.4.bb => systemd_252.5.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_252.4.bb b/meta/recipes-core/systemd/systemd-boot_252.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_252.4.bb
rename to meta/recipes-core/systemd/systemd-boot_252.5.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 9d747ef64d..df27e01b1c 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "4b48117716f84751dc6c8ee16c94de9858eaef4f"
+SRCREV = "61f5710d0bfd8f522af6f8eef399a851509946e2"
 SRCBRANCH = "v252-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.5.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_252.4.bb
rename to meta/recipes-core/systemd/systemd_252.5.bb
-- 
2.30.2


