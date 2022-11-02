Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57536C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 06:50:53 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.3263.1667371846400103398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 23:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=d/3vBf9h;
 spf=pass (domain: underview.tech, ip: 209.85.160.177, mailfrom: vince@underview.tech)
Received: by mail-qt1-f177.google.com with SMTP id z6so10782791qtv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 23:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0xNumqO4xMnP4nEmcUulMfL1HYkiWQsR2TjrTvnCCU=;
        b=d/3vBf9h82CyQF9eMoq13hVWu+kGgVlu7fErYgL9Q4dwOLd+K97AH39iNBNc/mHqqV
         WYzm5wDC3X+rV6nBtDIezCsNSTC2wvHHR/d2uT/y99OF4waeTJXxGik8vg7NNRoN8UKX
         B4CWOTLhg7nov6sLcAolaOOPyXHNLBoAjvs1MGD6dM0ZfbpxBaNgtoK3kiuok6WvROPl
         Pbp5GbOYSfRgF5IHkLJ5TO+EfWyY2xvK40LzZHfbxVjgvkuIWQf2YKVztaLzDakLdI0n
         +I7zO1pkUF6upekz63Lh2EGVF0XJhtDUSAhNHtWT48FkSkhogBHQREwQZcCKKX1Hcc1S
         3bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0xNumqO4xMnP4nEmcUulMfL1HYkiWQsR2TjrTvnCCU=;
        b=qS6Gv94jt8wfsuwDR10vmqpsBfm762aIzLB9pvM8ngxjR/bEJvVE4w02cgyIcklNWW
         m3U2lMK3riUUMpM0zj7pF7q2pAMmXdOpYopCxfdhaaQBBKRrhFRUItDsG/c5Knguzci6
         uz8itZuRSvDe3qtX47xYZ0+SZ/Al3wId5nyHu8SlytWiiBnGwhPWpK1fC+JgTG90M0lV
         7qq7PhTEK8wOXnJwSLOg1YVYXx+9F/2CXl9NdbpIJa2Y3rxemhOI2tns4Q5j8YZZLP6M
         fTIWsHObVXxY13QSHsNSD+WR2IPwyTT41Xl2AWxLTlyGC8wi5fuEbe1dkvsbhTdD+Z6a
         fdLQ==
X-Gm-Message-State: ACrzQf3jXk9K1CBbsOu/upPrvzjnMwvZvS7Cs0J5DsiaCJFdNNng83nx
	ZgEnXgj8tHJzDsBilYhiQqlL6p8pgW+RlLQZFiU=
X-Google-Smtp-Source: AMsMyM5NBrs5Qofsn2wM6VYULRs54ZilNYtyZf9UjPgHPBApntCgO3ryzPuyEQeSaIPQR9bb2duUqw==
X-Received: by 2002:a05:622a:4a19:b0:3a5:28ea:fff2 with SMTP id fv25-20020a05622a4a1900b003a528eafff2mr10135241qtb.526.1667371845118;
        Tue, 01 Nov 2022 23:50:45 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-251-35.nyc.biz.rr.com. [172.254.251.35])
        by smtp.googlemail.com with ESMTPSA id fx7-20020a05622a4ac700b003a4f6a566e9sm6173171qtb.83.2022.11.01.23.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 23:50:44 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [langdale][PATCH] linux-firmware: package amdgpu firmware
Date: Wed,  2 Nov 2022 02:50:27 -0400
Message-Id: <20221102065027.8479-1-vince@underview.tech>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 06:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172575

Add packages for the firmware required by amdgpu kernel driver.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../linux-firmware/linux-firmware_20220913.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 45c9d0e861..bf15e53472 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -228,6 +228,7 @@ do_install() {
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
              ${PN}-radeon-license ${PN}-radeon \
+             ${PN}-amdgpu-license ${PN}-amdgpu \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
@@ -428,6 +429,17 @@ FILES:${PN}-radeon = " \
 
 RDEPENDS:${PN}-radeon += "${PN}-radeon-license"
 
+# For amdgpu
+LICENSE:${PN}-amdgpu = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-license = "Firmware-amdgpu"
+
+FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
+FILES:${PN}-amdgpu = " \
+  ${nonarch_base_libdir}/firmware/amdgpu \
+"
+
+RDEPENDS:${PN}-amdgpu += "${PN}-amdgpu-license"
+
 # For lontium
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
 
-- 
2.25.1


