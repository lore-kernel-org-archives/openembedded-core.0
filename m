Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBD1C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.4705.1642588891288743871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AeWqSeHP;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id n8so4468714wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EdEiqgT+9qJI/P/m2E4ih+3ujqKmhYCbxT0rYoLNc/Y=;
        b=AeWqSeHPBQokpYxfU3ej+Ymc71dFFtWQV2mUnWMePDXcO0QK4HCDaSvQdBNUvxTwWS
         R6ms+TN3ocWy4Hyd26BpV6TDWj2LVfgmlbDRphQXy6V22g06DHEGwtfbmoagZTyr7aKB
         s+IsUMnwsDEMlA82/JctqIY9gmpCoBTK2Gsi0eaivB/oD3xNCCWIq4uVBF599B2SR0M5
         ah+34UEFeFcvi8FF1/YvZduw+uey3apULyWVwN3jqgSWe2rwbPZJMqG6ofIVnQpIf1Me
         7Pcxhmzu2W4V3yKHJM0oSXBppcWiURpEIUI2W5XGS8u6pkldduCQAYpr5+Mw3SJ9SBh6
         OTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdEiqgT+9qJI/P/m2E4ih+3ujqKmhYCbxT0rYoLNc/Y=;
        b=z1X0hmfu7KWGcGpJZajjP6QemZ9cZ2IdRxqIjXdxdH/gDmm4f6kOK/QCn7BgVL5KFt
         Tpq0Lb8d1AEVVCtZSMwfMQrKpIbmDgHCO+hcvd6xlXvRVf41ZxfZsEEejvJiyp0LIwdt
         0RLbWfibwbk5wm+WqTGLvA1+Vw6BGwQ/dTCgTzXLxWjPOo1CodiAvqieSEc6QFn1oDuu
         RHI+ba8l2jQiKumN+/LR0g+AounACEbL990aUq6BMp3tRt7KhZaIPHgbZJUhtWrCi7pR
         VNKB7vpMwuunu1XSVryT3rUAkgVbt/oCGKWwG49RJBd+i50qjnZefvuDG+4S77Tz+Tav
         NQog==
X-Gm-Message-State: AOAM531QIw5oLSpnDeqJJXsvhPJnM4xMqxDWZa5psBpHQboCWfSNEnr+
	gabRzWHu/SnBIbOvtPvDD6hKUaW7bSE=
X-Google-Smtp-Source: 
 ABdhPJzO+ZTOxxOzBMsli3tAB7PrvKcc1E7eV/+4glvZqcX7DrlSQJZm/26JH66qZ/Ko94hPWcIWkg==
X-Received: by 2002:a5d:608c:: with SMTP id w12mr2376378wrt.313.1642588889927;
        Wed, 19 Jan 2022 02:41:29 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/39] systemd: update 250.1 -> 250.3
Date: Wed, 19 Jan 2022 11:40:45 +0100
Message-Id: <20220119104117.2120127-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160698

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../systemd/{systemd-boot_250.1.bb => systemd-boot_250.3.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_250.1.bb => systemd_250.3.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_250.1.bb => systemd-boot_250.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_250.1.bb => systemd_250.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_250.1.bb b/meta/recipes-core/systemd/systemd-boot_250.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_250.1.bb
rename to meta/recipes-core/systemd/systemd-boot_250.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 6739018559..9a460c187b 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "402280118fe082122437638f53a0019c4aea81aa"
+SRCREV = "1b003bbc806198dbdd57b405d968f30565495e70"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://0001-src-fundamental-list-fundamental_source_paths-using-.patch \
diff --git a/meta/recipes-core/systemd/systemd_250.1.bb b/meta/recipes-core/systemd/systemd_250.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_250.1.bb
rename to meta/recipes-core/systemd/systemd_250.3.bb
-- 
2.20.1


