Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F34C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.6107.1639137035892974765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JQSb2CkI;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id t18so14437166wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=329PIbFwhmU8Vpn2rhb0hUILXacfm9wjvO9Q8meObdc=;
        b=JQSb2CkI+tixuZZSU15pCmdGYzuFQSWUObtqp01chjC8ROxG2wgwN/0Q7FwJgJCS1q
         qmc8CePiNiIfKXCenDhDOPDDgZbBHymeBU9ylCNtjy0CeIp3gVUxFRJey3XidEkzlcJq
         B9nXDyF9ufA/g3pYbxzVryty1rjPc6e7Axm8iqSKbweloAq/aDFGo0gyAvxmyuvQ1W7b
         6zNousQz1jEjMqD//ruG67pr0a3JBOtnzmYttbjXvl84S6Z7PmNaKVNopncVLdQfUpNF
         IR4EBfuPNFItf2o02zcGgskzs3RkvKi9QhRharF3ZCqRIAFWL4QC8xD9ysjkmOPLKr4J
         4vhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=329PIbFwhmU8Vpn2rhb0hUILXacfm9wjvO9Q8meObdc=;
        b=KRtzoqMpNWdp17QqVmQlBg1E7L9ORk4HLahfn/9p9gM/c2JEAxdsrlwtFhDGaV7kW8
         t/ioFTDhjME1r/1gbypqlqpulpGYAfxl0XhoiVA/TJb8FrhOc/B+oVidtZlq8ilNT7fL
         eiUL4rzES8xLcjWPzc6YRRqy9MnY2AFwa3k7r7HVsNEGkdnk+s0yhbjeFg25L9yfInP6
         WY4zWyjPLAc0LkDc3FFu7M0WcuI/lahmkjQKA+YP4MC6az0O1DikWDbKc+ukus0sCLnf
         F2CQ+aPKAKwPkEzSF8za9a0s1IKOYVBXevh8NpslTcwtzoBhTknjW/vUwB8jzyguw+qS
         6yeg==
X-Gm-Message-State: AOAM530PBy1R/qFfQifQCS40DXAzqYECWqVXPGRFGReIyeuAZgcEb3gc
	wItE7V/L5+y0nG5N8a+EwzBjt3xv54K7Tg==
X-Google-Smtp-Source: 
 ABdhPJxvjUJ3AZz6zxK5252IBL23euEU+GGQj5mFCvgJauFHmJe4kSUERY4uEzFVk7tGtTk4fZhzTQ==
X-Received: by 2002:a05:6000:82:: with SMTP id
 m2mr13210605wrx.202.1639137034214;
        Fri, 10 Dec 2021 03:50:34 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:33 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] image: add overlayfs-etc image feature
Date: Fri, 10 Dec 2021 12:50:23 +0100
Message-Id: 
 <0868e1b6fa2054521e0cde0a59e1d2606d6ab845.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159502

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


