Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B974CC4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 13:33:00 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.7273.1665495176085902798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=im3X4cwv;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id s2so20175455edd.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 06:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+uEIp3jvCw2q5JRrb8zWyf8kqb8PElnZrlFAd0faKM=;
        b=im3X4cwva7hwvMkEsJr0+fGeRHFQ0mhz9KXSULIvtAuimC9KIjMljiUrdWkV732QEe
         5CSY2mW2aLeY3HYbYypBLofS1j5ycrsmc2gFzbWpjROrIM4JyNXmj7oQ6FJwhnOjtuZK
         9ry/Y5TAlXXfzhbAo6OZrp+qYztQjtwZ8ffYsgM4kfHUjzlPrPeq67vOMt8LHNdXA6pc
         cNy4KAqcHS1ES/l7t7UJenz858Tx+hJibwZRgITAoBFjoLxPwPIb90820Y6S+dgV3oBX
         +6Set1vxkPbd+/rn8z2SEN1uJ+4jANh8rHSop2EJ5qnH9NxI1527kcMZyzx5iNqTcSjp
         N4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+uEIp3jvCw2q5JRrb8zWyf8kqb8PElnZrlFAd0faKM=;
        b=WpRvQ24ROU/Iwkw9u9NQDBhyx+zfXjeYXDtCduFUSUBzDD8EXrLStxfhkPeMVSJ3uB
         LCygo+KJK+/sMJPZSaeq9+vUOLB20akZFc4jzdHt+hmgUfOB730BW7a/RxpvM9EfwCnQ
         ElTn2ACo1BbcsQSF+v7MyvXA3woOeea/D34B/5ocxNBxNltYDNwlyRH/Igo8wBPdf9XK
         Yy5HL8JcLuXzYwg5wJAl+Lu5V0aF4DBII1W6B8h33i0mJGtcKvMOQiDwp9jpbeprlLUI
         8l9CB01SH+ByVboeHmMIGHBkkKh+ZVwOm0d66aocKJheMKXlkKE53b7Mz3a1BIJCumZy
         VU0g==
X-Gm-Message-State: ACrzQf3QDbygWsVrB2zTtXEHK2d+HusYWoTQnUOCtOOMjoKzZXOtBNzg
	Igx3uoM3SH6F9EgDNsmN9ZT1LRRy/kQ=
X-Google-Smtp-Source: 
 AMsMyM6haCuC3jZtpbCQsQL7tQK8UKh7eLQODzfzRy4WP0VDwefOGUDCFeAgLrIsPsN8VBJvZhquPg==
X-Received: by 2002:aa7:dcc5:0:b0:45c:7613:65f6 with SMTP id
 w5-20020aa7dcc5000000b0045c761365f6mr3503812edu.142.1665495174296;
        Tue, 11 Oct 2022 06:32:54 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 e12-20020a056402190c00b0045c329a5f81sm3432643edz.48.2022.10.11.06.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 06:32:53 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH v2 3/3] u-boot: Add savedefconfig task
Date: Tue, 11 Oct 2022 14:32:46 +0100
Message-Id: <20221011133246.25707-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221011133246.25707-1-alex.kiernan@gmail.com>
References: <20221011133246.25707-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 13:33:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171625

Add savedefconfig task which U-Boot supports (unfortunately not all
consumers of cml1 support this).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b2f33e382664..046e842289fa 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
+inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch cml1-savedefconfig
 
 DEPENDS += "swig-native"
 
-- 
2.35.1


