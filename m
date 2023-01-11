Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17097C677F1
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:47:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.21662.1673437656736175717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mj94XWDI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso14136615wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 03:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLtBRrS5wMvWkLP2xd9uBG/vA5NCBngkAJsneifALXs=;
        b=mj94XWDITtx/nFHWgieDX3Ukgqd5nkqv5S7ktI6O//uzRtvCoWd2c3a3ohyW1qZmKo
         /qCgnGnQ2wBcUQX1lRgFd67ZhnrlMazpLAmajgcs0jVAl5zPvdyohtKc1sg30hgElMLL
         YPLCREvaxvQuVs0IsTca+M09ItsZ+6EmR4U2b6TjMALCSEL5puryauKGS78YGgOk/xVJ
         ehjqoc8gDSE1I7GVp7mgXqO5ZrzI9I0LE0RnvLcqf9MTEcCJaQRVsPKZ+r++0m4xkSPT
         Pn6kzagMuKQJn/NSklwkf4ViQthfFaLAS73g1RsGt+kuCLQ9yYwRsJ4v5AZmOXn2ijYH
         11VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLtBRrS5wMvWkLP2xd9uBG/vA5NCBngkAJsneifALXs=;
        b=bLSfoSimn+rdHUF3uq/EWw6d6l6dd8sBqYeaRzBww8GPVgtUouxY/4wiQxJesECES/
         oBRfLjurnX3ML4DbGU7Qrzxufr2qYLXAPbtx37cObD0qgxplzIC9o1l4+mjHPxWrQWUr
         /WC58Y7ENIrJlPHHN52OFy9Wo0eGrkZjlcELGTm2mSZjNrSzFNUDNxZ9sGF8Vlx1/0kZ
         fg6wZV7pvbs7Kjsfz9vxczefU7Kmskp/AlpsM0Vh/caXTQmo8N6eqC7M4kCeHpAMMqep
         4qjYc0MLb1hwJDoa82IFJ62WCycH++WShBUPoghH3HdvWTj1gR93m9uwXOuiIwbDeclh
         sEMw==
X-Gm-Message-State: AFqh2kqQOvUgCnQxmSPi03N/PvVJr8qBAgN+IHodD6gfM6yA7q/okS0z
	QO2IaxM4LZej9JhVxMn6+Vqd6+KYeOU=
X-Google-Smtp-Source: AMrXdXt+5fmsVvz/MFlelp7Fg6d4Hy5vsNw7SYtEWrHqtM2E22yjOWUFBrRW0DB7ynsHNCjqJlWZ0w==
X-Received: by 2002:a05:600c:539a:b0:3d9:efe8:a424 with SMTP id hg26-20020a05600c539a00b003d9efe8a424mr8153818wmb.34.1673437654914;
        Wed, 11 Jan 2023 03:47:34 -0800 (PST)
Received: from localhost ([137.220.119.58])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003d1e1f421bfsm1484594wmo.10.2023.01.11.03.47.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 03:47:34 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] systemd: ship pcrphase/measure tools and units in systemd-extra-utils
Date: Wed, 11 Jan 2023 11:47:29 +0000
Message-Id: <20230111114729.395529-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111114729.395529-1-luca.boccassi@gmail.com>
References: <20230110222227.314983-1-luca.boccassi@gmail.com>
 <20230111114729.395529-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175736

From: Luca Boccassi <luca.boccassi@microsoft.com>

New tooling related to signed TPM policies introduced in v252

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: rebase to use systemd_system_unitdir

 meta/recipes-core/systemd/systemd_252.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.4.bb
index eb6f5ecc17..7c3c78a364 100644
--- a/meta/recipes-core/systemd/systemd_252.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -529,12 +529,15 @@ FILES:${PN}-extra-utils = "\
                         ${bindir}/systemd-stdio-bridge \
                         ${base_bindir}/systemd-ask-password \
                         ${base_bindir}/systemd-tty-ask-password-agent \
+                        ${systemd_system_unitdir}/initrd.target.wants/systemd-pcrphase-initrd.path \
                         ${systemd_system_unitdir}/systemd-ask-password-console.path \
                         ${systemd_system_unitdir}/systemd-ask-password-console.service \
                         ${systemd_system_unitdir}/systemd-ask-password-wall.path \
                         ${systemd_system_unitdir}/systemd-ask-password-wall.service \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-console.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-wall.path \
+                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase.path \
+                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase-sysinit.path \
                         ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
@@ -542,12 +545,17 @@ FILES:${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-bus-proxyd \
                         ${systemd_system_unitdir}/systemd-bus-proxyd.service \
                         ${systemd_system_unitdir}/systemd-bus-proxyd.socket \
+                        ${rootlibexecdir}/systemd/systemd-measure \
+                        ${rootlibexecdir}/systemd/systemd-pcrphase \
                         ${rootlibexecdir}/systemd/systemd-socket-proxyd \
                         ${rootlibexecdir}/systemd/systemd-reply-password \
                         ${rootlibexecdir}/systemd/systemd-sleep \
                         ${rootlibexecdir}/systemd/system-sleep \
                         ${systemd_system_unitdir}/systemd-hibernate.service \
                         ${systemd_system_unitdir}/systemd-hybrid-sleep.service \
+                        ${systemd_system_unitdir}/systemd-pcrphase-initrd.service \
+                        ${systemd_system_unitdir}/systemd-pcrphase.service \
+                        ${systemd_system_unitdir}/systemd-pcrphase-sysinit.service \
                         ${systemd_system_unitdir}/systemd-suspend.service \
                         ${systemd_system_unitdir}/sleep.target \
                         ${rootlibexecdir}/systemd/systemd-initctl \
-- 
2.34.1


