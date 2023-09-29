Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978BBE810D5
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 11:57:27 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.15424.1695988637162572338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 04:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=ynKm2Chq;
 spf=pass (domain: thaumatec.com, ip: 209.85.208.172, mailfrom: dse@thaumatec.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so227034331fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 04:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1695988635; x=1696593435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XRRjKsCFrEWzWJaZM5lLWkbletVby3SZljCGJ+suds=;
        b=ynKm2Chq4rK/yUq/rI6NzG1Xx9SCJQGsCgPq7iqOwYqsCy780Pj8KS89P0So/h0IvY
         sukSr7wBQSDkVPv7jvEk36fsSa+aQi8SjPi7E7QHkR4iluWWFxNrq1yFX85QIpHdi6+Z
         HYHLUBh6bV907ZRJSNGtQ1E8ituoQXTXCaKkTX1NH3ovQbMzHsIwzBYHIbJCJlXYLIiQ
         XU7jpC8KPzGTmNlF7JKQXD2mDaYxM0GEIVbIndhor/1x0kcpCDFeuCOsTUUj9g4BTp5H
         QnPK8H2xf5h0IHR63E0xgcycdowGwFEWXUGzSyFbat9mrg9W49h7vrlgF/AKDDySrN1Q
         4BVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695988635; x=1696593435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XRRjKsCFrEWzWJaZM5lLWkbletVby3SZljCGJ+suds=;
        b=OAhpDAQxwBAxaVqR8nueyI1djXOQoqy+hZZbFxTQtEUt+dO4ZsFIaiX6gmSxB56okT
         i/orty3mdUXO3+BJaPxevlL0Le3HJt6QJGf8KnGnYuEvir3He1cSp58WbQNLZOrl2Cno
         tibEUMyOf0h6ekgxKMFlLcZH4m5IsXDS8rcElmpkliOBcsmpjsu7s/Dbjs/xleMT9BG2
         dnWtTo8PGp+0uwyBJ4umBuzxuxW0UmNv/3bENV0k0NDt7aRZ8vGe7u9a1qIEZaEJdmj0
         g7tiMlbmyhps7q1x714ZpwM6gPD7/aSpD8s6T/gJmLHAAVE/Gm1XaB0jdMXtRdxWOYCn
         Vo1A==
X-Gm-Message-State: AOJu0YzUGmyIQE4bazROdjN2G8gyqSBPsEIyQeqmrc6i7ZJTtQxYrpuT
	pohfzLotRcFYpU83/eHwjWL4lJd1pAIVW+a9Kcc0vg==
X-Google-Smtp-Source: AGHT+IHsP7TqbHkSrhq64Ldn6P38i+gwwNLObazUcsljJlfjNxTn5Tn5/lJCZdPa24XuBEOk6uQPzQ==
X-Received: by 2002:a2e:9b4d:0:b0:2b9:55c9:c228 with SMTP id o13-20020a2e9b4d000000b002b955c9c228mr3583536ljj.27.1695988634919;
        Fri, 29 Sep 2023 04:57:14 -0700 (PDT)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id x18-20020a2e9c92000000b002c12630e4d3sm4050389lji.127.2023.09.29.04.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 04:57:14 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH] uboot-extlinux-config.bbclass: Add missing variable descriptions
Date: Fri, 29 Sep 2023 13:56:44 +0200
Message-ID: <20230929115702.45926-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 11:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188401

Description of UBOOT_EXTLINUX and UBOOT_EXTLINUX_CONFIG was missing.
Describe these two variables in class comment.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index 653e583663..f752c16b9c 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -6,6 +6,8 @@
 #
 # External variables:
 #
+# UBOOT_EXTLINUX                   - Set to "1" to enable generation
+#                                    of extlinux.conf using this class.
 # UBOOT_EXTLINUX_CONSOLE           - Set to "console=ttyX" to change kernel boot
 #                                    default console.
 # UBOOT_EXTLINUX_LABELS            - A list of targets for the automatic config.
@@ -20,7 +22,8 @@
 # UBOOT_EXTLINUX_TIMEOUT           - Timeout before DEFAULT selection is made.
 #                                    Measured in 1/10 of a second.
 # UBOOT_EXTLINUX_DEFAULT_LABEL     - Target to be selected by default after
-#                                    the timeout period
+#                                    the timeout period.
+# UBOOT_EXTLINUX_CONFIG            - Output file.
 #
 # If there's only one label system will boot automatically and menu won't be
 # created. If you want to use more than one labels, e.g linux and alternate,
-- 
2.41.0



