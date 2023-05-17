Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD82C7EE24
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:45:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.40828.1684291504042460661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Qh1yRUwk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aaebed5bd6so2618825ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291503; x=1686883503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXXUNBd2GngUgZxH44nfQTR8eLYkA/8zBrM6tS3KqaI=;
        b=Qh1yRUwkhaQs14L99Z0j73t7oVfbtydrzbPssstdOvReYamO4Sra200TVn0ohx0ku5
         AvMa+7nPAxb5GwRAQuoKEk/H27obPDGSXd2dPDvSfsZqZ48zIweW2dZDwViHrf5J9o5r
         /JDdOaZdsvI2tjYRgYdt/YYNlbl1dBCEHeGkwnFwamaHwJsZvgHfnMxrLkk3bYaszjAU
         2RIh9VPRoVcuaCQb3WRwSClJX4gIuAdjwPmVJ6X03pO9glbgy5keu2XvqWnyB0oT/KLX
         vfLOOclqQqCMAtP8UqBvgQcAQ1WmogAw+urIOsgHnUM62eo9F6AZPaOC/EiZY/E6jIVP
         1Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291503; x=1686883503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXXUNBd2GngUgZxH44nfQTR8eLYkA/8zBrM6tS3KqaI=;
        b=AayEdE34Jlfv1rWEpLWJuP9gpuFC/GYvxCpuv89+xrE8qZIRUC0eOS5PsDJ0a66JzE
         PgL7NRXIPz4nfO82bJSxafyUEa02dnwvNyHUTs2iqy0irkB93aUL8oy3xpde5soNggfL
         KaPo0vrnBBehET03NmPra8k/ARDmOiPPtfBt1Dl5kk3LrrEYelMNMPsa56VoByLsUEgP
         q/Tkh4yCdkuUztdgCMK6QNTv6NThYEd2WxL46CzAmluSs/8LeeeQqpgpDMHWqI1VN139
         D21p3nLoAAnxavqNF8aWq8tRRtjyioJc/PrxfTbPdXfM0Di4DMkuCHAUHw0vlDDf1xyc
         tU1Q==
X-Gm-Message-State: AC+VfDw35f13zTks284Z1X92/B/9HbemohHQDY9s79PQhKMarXkcQ+mF
	H9HcZutxwey6slIvWNwS6hDDG7QLjgjDJh0KpPE=
X-Google-Smtp-Source: ACHHUZ60uVSFgWkaAKbCvEJLYDoGqRG/MJ2cGfDjfoVeJIcabdzunv9GhE4yQet+55KhTByECXUnwQ==
X-Received: by 2002:a17:903:246:b0:1ae:40ed:4b8 with SMTP id j6-20020a170903024600b001ae40ed04b8mr3318670plh.22.1684291503114;
        Tue, 16 May 2023 19:45:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.45.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:45:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/13] dhcpcd: use git instead of tarballs
Date: Tue, 16 May 2023 16:44:33 -1000
Message-Id: <6578d20898f68c0cc88eda7e0f56e6f5a557f17e.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181439

From: Alexander Kanavin <alex.kanavin@gmail.com>

As announced here:
https://roy.marples.name/downloads/dhcpcd/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e317eaab45da2dea70d1485fdae93cfeea0db1d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 579fa95df7..21b2eebbd8 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -9,9 +9,7 @@ HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d148485768fe85b9f1072b186a7e9b4d"
 
-UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
-
-SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
+SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=dhcpcd-9 \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
            file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
            file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
@@ -22,7 +20,8 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRC_URI[sha256sum] = "819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c"
+SRCREV = "3c458fc7fa4146029a1e4f9e98cd7e7adf03081a"
+S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
 
-- 
2.34.1


