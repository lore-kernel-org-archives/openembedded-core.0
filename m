Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34916C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:01:56 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.6891.1639141315050150312
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PQpBqdfh;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id j3so14860106wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=329PIbFwhmU8Vpn2rhb0hUILXacfm9wjvO9Q8meObdc=;
        b=PQpBqdfhTR/AJmQ9TGXIFjmFk1oezgLlu6w8ZI5hlFUhNsgEtsFugjBbNUrIlw16JV
         otTpuutin5PFLerOrcqoRQecQzChKyzYp2q4eCl69oUABd/DDMsOTG9W49SoN/K6wdWW
         5iMSBrbaNjB3euzkKYEHhnmWzvToRSJEmCjduUIaGDyJvBatA0s2mds1dl6FixVefh0Q
         HMJbST0j4ASWOY5SvSsbK7gH5ses71oscB6G9FMO+Yffflp4nM0FLaJ8ibxym13YFfrG
         ZAG0fpfR5BqRvQDdgBjsxj50y5fd7aazyjYYSdbNSmNZsW+ThmdM4RXJLUUYNWEvWBwp
         lVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=329PIbFwhmU8Vpn2rhb0hUILXacfm9wjvO9Q8meObdc=;
        b=Ap5+qUbMk8ZjM6OOCr8KSVIjaXvIL+jkr2ICl5lpHugkdvseC8MFJZ+pGxAJNeSDJX
         c+dPhfdkpBSLB3VlNVCDkF2EhIdS0LqYzIGoQDw2OSQcQ6bJcPEde9VQDodBw2zMlkB5
         zI2oofiitbG/7e3TYGjWxvsB/R2GaErNeVjKp+rWfWHnwUEH6CTdt4hnHuCX+Vf2rDDp
         Vp2nYCYLWeuhZ4ZeooBFshQxrr1Ol+1156sVDf9YS8YWnNi9NPfN+xDn7nIZP10HJ5CS
         hbEhQ1mLBYiFk45kw41dk/VpZh6/UqN1G9pnOadCrIYxIQTdMpL9AT9GzUQeLGgzlFwp
         Ikzg==
X-Gm-Message-State: AOAM533XpVMvZE4kZ+6Nxzucu8gP3FV+OiCm8bWeE+gt5BaxVr93ndGO
	I6JvqQ/dbvWJGvHR4dQTxjeq9LTHvotaLA==
X-Google-Smtp-Source: 
 ABdhPJwFnpJvxewfCVvV46RtwZaL+WYVb/JowyUENa5uh8odzCSYT+pjHYCYpdFk2zvaDi+oxTzAPQ==
X-Received: by 2002:adf:d18f:: with SMTP id
 v15mr13198536wrc.447.1639141313311;
        Fri, 10 Dec 2021 05:01:53 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 d2sm2899653wmb.31.2021.12.10.05.01.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:01:52 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] image: add overlayfs-etc image feature
Date: Fri, 10 Dec 2021 14:01:41 +0100
Message-Id: 
 <e4838579fa539dbb0fcc0f31f46b5f69ea0e280e.1639141237.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639141237.git.uvv.mail@gmail.com>
References: <cover.1639141237.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159513

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8a46b4852c..2b0ce4a988 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -15,6 +15,7 @@ IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-contain
 IMGCLASSES += "image_types_wic"
 IMGCLASSES += "rootfs-postcommands"
 IMGCLASSES += "image-postinst-intercepts"
+IMGCLASSES += "overlayfs-etc"
 inherit ${IMGCLASSES}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
@@ -33,7 +34,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging overlayfs-etc"
 
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
-- 
2.28.0


