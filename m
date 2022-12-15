Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B2CC25B04
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.143548.1671132064789602923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=12y0KY0X;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id n4so25647plp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ch0XT0yIMK/+lp4EPyM97ArzIbrcgAVDZz/UeI6AJd8=;
        b=12y0KY0Xbl/sWw8P1GaT0r5Lv7sakBN7b8uznunI9KlgmkIVWU/vEfEZR3niv70fld
         Ot3bbF9LAtmkhGtFy7UhiYbHgzw5MatTcYSI0UhzGkBAm4qhohqF/cZM846w+NbZb10T
         1Cs2QHZE/6Y1Hg+BvMSuvtcZ9qQxYCyLAQpIAC6YhMLNn1ztyrEpl2/decJ9EDrRVg5J
         feo1SwP/FZk6rQKzNjzyE1t0S+mxiOFJCVsqs/qx8JCWexmqVU1WVDGbaQO2Akh5hyWj
         szMN0nN2fotr0FK44FNZ3KKbW/o7grU10rGTsimutMIkzs/PDq9rc+SE3qKxNvwneqiO
         7F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ch0XT0yIMK/+lp4EPyM97ArzIbrcgAVDZz/UeI6AJd8=;
        b=k5IRF91CCb+Iycfe+p0nfAJoi8FqR2KVV8C6dWDYxI4roibIU1ZB4WoWhubvLRbNA8
         Z6wf9j9nM6tf2pIBuR3mlzWPW0K/ymEwECghbqPOA0NsE1qpy2NaD2CEzoDudcZ5uefS
         uHpiQDRQwVo0db5ion0lRCsLICaKlv0GWMOp3nyiRCZy7xVsY/SEUJef36PcVDYMA9nX
         xR8438pRrk9x2nPiCPyNahLuC50aPxhs8u7iukyTLPdZO3RTbGJYe51pH3Zcrxsodyu2
         Arg3w09u1ZZWPx3pwhiQfSc0lSQki1wOkx0OWqm9udzcXz7OId+z1o4FyrpMVgYTONjm
         kbAA==
X-Gm-Message-State: AFqh2krMhf33tSN2/pspaZ1M73/G8TfNthxTGe4KXUsPF2hA+Gpx+1WS
	chOOfQRHuHUJoMgSr8BewrEbB62iQrpHUxkbilw=
X-Google-Smtp-Source: AMrXdXsjq1iKuTnRy4FJ2ZGByz6claaqDSVZ7K4T3obeMETQJOJU+yTqZTuZI3MzjVnaVNVlcN9YeA==
X-Received: by 2002:a17:902:7d8a:b0:190:edc5:a4e6 with SMTP id a10-20020a1709027d8a00b00190edc5a4e6mr5643768plm.13.1671132086066;
        Thu, 15 Dec 2022 11:21:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/30] classes: make TOOLCHAIN more permissive for kernel
Date: Thu, 15 Dec 2022 09:20:38 -1000
Message-Id: <1458a7ff80cd054f54170d9f312cb4bf111c89a1.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174606

From: Alexey Smirnov <pyih.soft@gmail.com>

Currently TOOLCHAIN is strictly set to gcc in kernel-arch.bbclass.
And this prevents any TOOLCHAIN changes for any kernel recipe.
This change makes TOOLCHAIN configurable as usual.

Signed-off-by: Alexey Smirnov <pyih.soft@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit be1634fc35dcc81f0301d942064a6eed584e0704)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 6f5d3bde6c..1531ae6cd5 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -70,5 +70,5 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-TOOLCHAIN = "gcc"
+TOOLCHAIN ?= "gcc"
 
-- 
2.25.1


