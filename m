Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712D1C2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.178871.1692240618979775695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ImdtkzaR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bbff6b2679so47775485ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240618; x=1692845418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMpexHpfzxTry30ar6ne/TkIaOzYupZ6yuK1eoqGbvU=;
        b=ImdtkzaRGmD4RTN3+Bc+6/lSX4MVHBfrYQRapbr+/wolglhbadhmasVMzZAKKczO57
         fOBEfgyWS6YkV5ozh8257fw9RGkmaub7HEGyIlHfeIvP9zUyVFqbWQMHYRTmVEXVkOMK
         JoY5PM+hBmCVGTXdwW5MDlfTd6P8Ww/6NmZEdWft9pW3SZOXs2B2Hv7JTHrCkEvr5CKO
         MRpe+SrILwE3ckPCFSQ+FN0NGzIQ8hT/ec7KQ4jvrowJB19LQLzRi5Oo7B50rBtSDTR7
         b4YFyGuHIULeJui5avChEt44A4wGi44jxJ8DxI5XlyxG0XDk+Zrtc4K6a0UCOQAJ0PbK
         Ictg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240618; x=1692845418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMpexHpfzxTry30ar6ne/TkIaOzYupZ6yuK1eoqGbvU=;
        b=SV5JkNx/+iFUm+ZvRIQGO4Ja6l3G3WEuTtERtdQBRr8B4QNUSWYGxzegLWpEAqUYVg
         A0JGrpsVyjSUSHNq1SIV6vi5m+PN6p5TD5m0PbHd3UnTocZlMuu0FCSCSKV+XgVdzlR7
         jDL917XMX0cYbRuXpmMdMTTfN+s+BbK7vox9etG1/Hd7KHFgBR7XUDNVuE/Ns8q3/Iuq
         qLAKtefsuIRhXfajRu+bAtp3z23EJ3pdC5W8bGlWnkR9VMY2xmu1n1PRuD61vrk9fvVq
         swzOWZSG4qyhN+MsT9X9tLylRQBaFfRRHRBj6eEI0ir2Suao3orLA1X6QhJV2zJ7LkKe
         OnTA==
X-Gm-Message-State: AOJu0YwCZNzpGTEjbiotYP0iyoyxeA5TjD50PEWtl/v8lf1q9bvkSNsr
	aMD3wu1VBWviifCrdKpQPbvcT+0Ms9qDHwP6GgY=
X-Google-Smtp-Source: AGHT+IEPcDOlFP0qsRBLkYP7KG3JLZN+FXOqKqwzJ5cAMhjSjDMI6aEt9u3zu38VqL+/gYAN11Si7w==
X-Received: by 2002:a17:903:428c:b0:1b9:e591:db38 with SMTP id ju12-20020a170903428c00b001b9e591db38mr3372025plb.8.1692240618135;
        Wed, 16 Aug 2023 19:50:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/16] linux-firmware: Fix mediatek mt7601u firmware path
Date: Wed, 16 Aug 2023 16:49:44 -1000
Message-Id: <8f041ef841e03996768fb7e0a96a4a4d066eb796.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186277

From: Marek Vasut <marex@denx.de>

The following linux-firmware commit moved the mt7601u firmware blob
into a mediatek/ subdirectory, update the path accordingly.
8451c2b1 ("mt76xx: Move the old Mediatek WiFi firmware to mediatek")

(From OE-Core rev: 6fa5c4967a7e70192e9233c92534f27ec3e394c8)

Fixes: 64603f602d ("linux-firmware: upgrade 20230404 -> 20230515")
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
index 3470131294..d304b75c5f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -417,7 +417,7 @@ LICENSE:${PN}-mt7601u-license = "Firmware-ralink_a_mediatek_company_firmware"
 
 FILES:${PN}-mt7601u-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmware"
 FILES:${PN}-mt7601u = " \
-  ${nonarch_base_libdir}/firmware/mt7601u.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
 "
 
 RDEPENDS:${PN}-mt7601u += "${PN}-mt7601u-license"
-- 
2.34.1


