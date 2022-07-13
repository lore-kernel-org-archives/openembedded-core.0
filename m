Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA445C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:55:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.306.1657731343617583783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ITj4bhCi;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so775276wmj.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lzH17ZWw+SxicGZEBkbxW9TXsWAtuOL6x4kJAd0WgNs=;
        b=ITj4bhCir95NTdjmWbkMK3MamSd4Dk/1qRRQ8AVTEtyUVYFunlvQrdRd25UYagsmRi
         II4Jg/rTMP1q0le2qyBrLDAjgigvNUC8Mnl4I64Hz+lqyH4B14d/cnPOk/FcsukOGYRh
         ahfpaZRkrYcBqUmthh41/26iZStmHcW68x+GAphiwKEQ78EwRyF5ted64ojv+4rbSlga
         dKwnwItMTnApVRjB32iGk79ZBXcT5zOIACdg6wWGgQu6GXF3CHbkATeyC1bp0ns8s8JD
         XHU8bUI/pDyCAEqLFt8tXt5OFZnY5gjTFt73npWa+keMJoDCSEuLBKmCReo3NRbCGHwi
         bo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lzH17ZWw+SxicGZEBkbxW9TXsWAtuOL6x4kJAd0WgNs=;
        b=Sm/inT0jNOmKc3hakhcMDY74yZacPiE4foRUrCA9MPJSnty2R7VgyW2SP/44oi60cQ
         Ri8dNQ2kF9cHDIiBxpp4ISLpof6lOR0VYWzpgPr4kJeUc9+EXSphpJnPFZwjTZpH9RKd
         Eei1QSqpV4YZ/MEcp6JvpgGx0xqogaC7Zn122Ah57MXmXR6XycES4f/j7taPz8btqXMZ
         mfJ3mvd/REPVB8Wu22WE1g5h+254ue97oRxbAi8z5irinDe1VZnJmKAQ4k5CJEuD8th5
         BUIyFGR6ax/8OYfhjJUWU6+5QHJ0YnUQ1QPb5VQMPf7LGpriZ7VpeArDLp8+ZwvMXBcL
         alWw==
X-Gm-Message-State: AJIora+uIX+gmIlrdlvxZymT1wzjIDXnWzpK1cqmJTH4DezKlTx9KeXV
	qaO4O3RlU+TYt6Y7ALGCcPBIKLBlJ0I=
X-Google-Smtp-Source: 
 AGRyM1sSMahfMy7vm0zBFvIwtDMNroKUjDVfyTmzidIa/GG5+oNUyE3gGEz8uWOaZX2ZOU2TrGfvJQ==
X-Received: by 2002:a05:600c:206:b0:3a2:e224:da6f with SMTP id
 6-20020a05600c020600b003a2e224da6fmr10854733wmi.167.1657731341241;
        Wed, 13 Jul 2022 09:55:41 -0700 (PDT)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b003a2e2ba94ecsm2652327wmq.40.2022.07.13.09.55.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 09:55:40 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] poky-altcfg: enable usrmerge
Date: Wed, 13 Jul 2022 17:55:32 +0100
Message-Id: <20220713165533.125600-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711202929.3839971-1-luca.boccassi@gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:55:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167975

From: Luca Boccassi <luca.boccassi@microsoft.com>

Ensure it gets tested by the CI

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-poky/conf/distro/poky-altcfg.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/distro/poky-altcfg.conf
index f03306e798..57a76e8bb9 100644
--- a/meta-poky/conf/distro/poky-altcfg.conf
+++ b/meta-poky/conf/distro/poky-altcfg.conf
@@ -9,6 +9,8 @@ DISTROOVERRIDES = "poky:poky-altcfg"
 #DISTROOVERRIDES = "poky:linuxstdbase"
 
 INIT_MANAGER:poky-altcfg = "systemd"
+# systemd will soon require usrmerge
+DISTRO_FEATURES:poky-altcfg += "usrmerge"
 # systemd isn't suitable with musl
 INIT_MANAGER:poky-altcfg:libc-musl = "sysvinit"
 
-- 
2.34.1


