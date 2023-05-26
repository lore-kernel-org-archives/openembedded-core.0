Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384FEC7EE2F
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:30:01 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.88.1685068191825157788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WxZlozls;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ae852a5330so1475075ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068190; x=1687660190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXXUNBd2GngUgZxH44nfQTR8eLYkA/8zBrM6tS3KqaI=;
        b=WxZlozlsbMcArO3zPT1ewNnlL1OSxlCQS3VWy2/AOAPyLFTjEUF3XBojl3iSiMI7rL
         PdW1vk7HrxCXqSBX/2Q4e53NVhQlFEH3nrfKaJKQsvS0vgQxQnQMZ/yT+0KJD5XxgQkT
         ERtDAO9B2lQkohZFpxhPk70D7uSnMU6jlINA06DzxguLjtlpNv+crfOaM1PmAvard0fZ
         OfhYBxuqOEni5re0y5jv2qLx0UWKArwTYHkkHVPxcFjsmWItTqv070qtg4McI/GX4n3f
         ciJ6+u4LpOWqhA9SGgCH2U1pIJm5YCab0FVzK3jcwfTXs6I+qubQARJkO6aMZ2e6Qq/4
         CGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068190; x=1687660190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXXUNBd2GngUgZxH44nfQTR8eLYkA/8zBrM6tS3KqaI=;
        b=U5+Q8XpeLfbxr0YGJQArWdZwv/X/CxEDW3CmZZZvzqrkjdczKVit5RCT3OEY53He8R
         qP/6R/1IUXoF2doFP/XYrtaHoudPOXPt5YOUr9CjAA/xZnZhR1oa508X7sqFSJHU3qQd
         YktRIffxtfLu4JD3uhTddc+uFCdWkN73ZskkUEiGtqH5YXj5q9we4lq6rV049nKNUtWt
         6txiH/JsgHx5s89Pszsu7oQWt6mtOPYD4FoE7UspKeNKir7jxlu0hI13PZxBs1kuz0n0
         3tcWwnDzGFa1VQDEZnATyLxJfQmIt9+CZJbS8IU3TpIiz7U7VwqD1zlCYXSeTE0vSLf2
         xVhw==
X-Gm-Message-State: AC+VfDwApUXNtKXNOmDtu/ONeArmAF5m4Wb1qmn5XGKU+XOxvkjVv7Za
	E1+l+QhIWmPvhN4yvlYdjUJSLrfJuW2+8a0evhU=
X-Google-Smtp-Source: ACHHUZ7DUSByrs/uGhcy5kWtrwRbxTnvdqXLJlhJA+kUsu/1BfAYPgBF3hWer71CifeOx0UNCCQ0Qw==
X-Received: by 2002:a17:902:d2d0:b0:1ac:61ad:d6bd with SMTP id n16-20020a170902d2d000b001ac61add6bdmr1018881plc.65.1685068190497;
        Thu, 25 May 2023 19:29:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/21] dhcpcd: use git instead of tarballs
Date: Thu, 25 May 2023 16:29:04 -1000
Message-Id: <ceb8e2fd1686d9a8b9be3feb277741f97c4c6c66.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181748

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


