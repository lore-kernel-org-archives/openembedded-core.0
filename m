Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C90C433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 16:47:26 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.6714.1665161238729671002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 09:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KsBsc5Bc;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id a13so7874932edj.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi3jrDvys5fGhmica4PauZdfe13PsaNtMmYOk63ns8I=;
        b=KsBsc5BcB3PFy9rLjDn3Ij3kIPo9YkHoYeEtq80vwi236/VSI0rkShU2D2IiLyHGbT
         G/DdGyE229HV1hsIbsID3W0MVPKvE62GHbhDkWuIVZXqiGn/nT8N14wZ6bohdJQN+IXw
         6FxtoNdGWnzWudedRWITNisf/gxvjcYYg1iVvYnv6rTiE+jSk5jOb10C7oYL7CuF4N5K
         SmhWlzcCtPtN7ymYtZBiCnRykoNuyUuu2Ev2RIpLpu6AYDsTsSBBy9dNnnPsIcfn/Cfp
         jl0GToHoDIqh8bvZj+/wJWNTPSGECcds8AvFgUDazl4e4TwfzU6/SLTgXSBBaTkWQmUu
         rYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi3jrDvys5fGhmica4PauZdfe13PsaNtMmYOk63ns8I=;
        b=H0+0EKKyUjvVEq2pyw8XE59983HTDwM7GSNdzdasvcDWvGOL4FrEDR9cTYFhZ7by1h
         zyWKMp0GyK5014Qj2fsbO7qWmuJATVKSCSppNmqBRn8otDZ6R3VyGqV476dptPtHMQVp
         2mwsYqnA839X5YetRyezRQSui1U4j5Nnmu5f75PY4OV54o96+9TTIpyc5hJMuqppWifk
         MAS673bJtRXU55P0bE7bc0fAYoWsLTsLhNR38WNDG6k7TpRBjkxHndfxWW1AYhwdKqkd
         OTidNU3Q1BqOlsOa0IqsvxXZC1SgKBM5oAvMUD66KKOsuyQjmxjTOpD8eB0+vvP6IZW8
         fLhg==
X-Gm-Message-State: ACrzQf29/WrXqv4cQDipnA86HVhMt+itGjj/vEWRnA7Kq94kzdKyjO3V
	qsWsLPfE9eNa8QCvudXQzSIZ4w6Pl5Y=
X-Google-Smtp-Source: 
 AMsMyM5UxwjB5CuYgYZbyunokEjiPBcy3tFLJl07vDrYJ7VjmLQcbVYEUDw8PbFgvC0YMyUcThxVQA==
X-Received: by 2002:a05:6402:e9d:b0:443:7833:3d7b with SMTP id
 h29-20020a0564020e9d00b0044378333d7bmr5382383eda.151.1665161236838;
        Fri, 07 Oct 2022 09:47:16 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 ch8-20020a0564021bc800b00459ad800bbcsm1802171edb.33.2022.10.07.09.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 09:47:16 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/2] u-boot: Add savedefconfig task
Date: Fri,  7 Oct 2022 17:46:43 +0100
Message-Id: <20221007164640.17471-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221007164640.17471-1-alex.kiernan@gmail.com>
References: <20221007164640.17471-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 16:47:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171531

Add savedefconfig task which U-Boot supports (unfortunately not all
consumers of cml1 support this).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index b2f33e382664..5705e5835b21 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -26,6 +26,13 @@ UBOOT_LOCALVERSION ?= ""
 
 require u-boot-configure.inc
 
+do_savedefconfig() {
+	bbplain "Saving defconfig to:\n${B}/defconfig"
+	oe_runmake -C ${B} savedefconfig
+}
+do_savedefconfig[nostamp] = "1"
+addtask savedefconfig after do_configure
+
 do_compile () {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
         sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
-- 
2.35.1


