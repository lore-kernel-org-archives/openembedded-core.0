Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8D2C04E69
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:25:03 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.138692.1692116697205986576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PQZgB8Sp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bc3d94d40fso47545675ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116696; x=1692721496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8c3W2SnkBPdAbkvuef6fLSfB51mfXi/KNQENhIlKYqc=;
        b=PQZgB8SpLHmH/GjN5yxbjr0m/UWVQUffoQWnPnd0mQ48Zvdi4P9T65bx/ay0RtItCp
         Q6hZta9yWQ46WBTo7sCvdC8p36cuzVh47Odx/Ey2Xwg087Ca+lNSg626xByP/+D/yJCM
         6TQ1i3bGS+R9rYoNfpEFlqKm4UNMjbxNe31/TQKNVMpzCNQrY6zTHbnxPtDwXhh4n31z
         5fO0rWNBmVFwZ5107vBh8XmjHXpYNQ6qEwuvmlmYwtqYvMCH1RpcJGKuLsFibncaEGji
         MQM76uALuF7dRNUBeKP+6ORunU6rIWTUJUW9MM15314ud13XoN9GYYQrHB4lYpU4FZJM
         n3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116696; x=1692721496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c3W2SnkBPdAbkvuef6fLSfB51mfXi/KNQENhIlKYqc=;
        b=DvZHHEvBxQ1DjMzR33fM0mMZOh5kLaiHOUg2I2qnxWt5SA/CvHgeBwYaB+cU08RtCq
         TqV3nBNIVDHzyZTvOtEteBMLnIUlShKV0XNQxQZeRe03Q0PXeLmrPUO5TSdX1rAFH2Vo
         DIW1pN5n1dmCwRtYrbCniwlVqXJMO9KL456uTfJ/XuuDk9uX8V2g1IhgYsyzUjXSfqcS
         OCoAGlqZhfIn8MiEhO33l8JuGX8IQJ4gRmBC3m6hFOmYjfi9V9nmbhFNpwaaLCXzH5Mc
         hstRB9+a0iiv+Ox5wZeq9Cg7U4jjWOeJSEVAZRo9AmiCvJ1oOIxRd1sMR0JmadSTJcBP
         jA4Q==
X-Gm-Message-State: AOJu0YwjFwn5Y0ODwnjfPaji08OVzoqLFUzCedJ96TlxOGQDYRGz0qZX
	BWAI21WsKmH1Hs7R04JhH64Gz7EL/9pV4OEqtCE=
X-Google-Smtp-Source: AGHT+IGgtDNt2l4ejSq5BF/0aX20iCJfh+ITfLW9BjprDLJy+RbCr+qBpnC07RPi6QTZTUfimNEPhQ==
X-Received: by 2002:a17:902:d715:b0:1b8:88c5:2d2f with SMTP id w21-20020a170902d71500b001b888c52d2fmr13099743ply.64.1692116696316;
        Tue, 15 Aug 2023 09:24:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/18] linux-firmware: Fix mediatek mt7601u firmware path
Date: Tue, 15 Aug 2023 06:24:21 -1000
Message-Id: <6db983b6dfcf1f2c393c61e1fb0f9a4742baa3e3.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186091

From: Marek Vasut <marex@denx.de>

The following linux-firmware commit moved the mt7601u firmware blob
into a mediatek/ subdirectory, update the path accordingly.
8451c2b1 ("mt76xx: Move the old Mediatek WiFi firmware to mediatek")

Fixes: 64603f602d ("linux-firmware: upgrade 20230404 -> 20230515")
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index a98a4e9b45..7d0a794e8e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -418,7 +418,7 @@ LICENSE:${PN}-mt7601u-license = "Firmware-ralink_a_mediatek_company_firmware"
 
 FILES:${PN}-mt7601u-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmware"
 FILES:${PN}-mt7601u = " \
-  ${nonarch_base_libdir}/firmware/mt7601u.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
 "
 
 RDEPENDS:${PN}-mt7601u += "${PN}-mt7601u-license"
-- 
2.34.1


