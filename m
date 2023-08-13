Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03907EB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:29 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.94028.1691961568497354800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=DrqcGUAT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-686d8c8fc65so2514293b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961567; x=1692566367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6SH0H01iEuGJNeLm+GcBokOeiK5ryM18KkUk+9hirE=;
        b=DrqcGUATp3eYlxCsFJcus83E7n/GJbWa3qRPQC7w0Pb2PkRLw5CnvSB5gYrcP5LbPh
         Z3vS9RESM6NT1yH6kaxO9AXDG9o+9XX2ZJoijlW+2To7OavxD5A3LSbVBWrLq8qK639e
         DNAQAy8Q2qiGLhRriQzRd3s7vYvtCqj2kef7wY/K09UNBgYg91FQtX+mgqQ1uLfFv9Wk
         fgdixsAF+bUKw4cHva8RHQYWrHW5eKRI2O+t9b2sJDT1syAb2cPqCSozuyNbapDdwgYD
         xlL0/XO//pmmYhR55u7OaKO77uFDGFKKUuJ1Wuc56dvrs2/AwNxPVDzv62d2Cb1bg7Nm
         1nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961567; x=1692566367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6SH0H01iEuGJNeLm+GcBokOeiK5ryM18KkUk+9hirE=;
        b=TxIT8KoDao/xWcPoUPwQfMHnMfT2nN+TfvlQS4EqLW4vL5FAQU9Ul6IkuOZ6UF16hi
         O8CfLHG3O/PRhCmqk1ceQcgQQGupWwfJgVU1upZg6Ocl9D9NeLAUsuDfxSwpJug05bvn
         KS0UpNq1fOvQjjDNiyoYGgapZU8CmnvKoi9FkbZvRVeKqud9879/c83AVFhlJfFrB7Td
         hcOG+Rz764AYI6vlU1CT9Qnql6gnnpyqjEwoHqYupUcTVY5kHiqzikEgDGgiSW8pEsb4
         IEia0XKO01bFqWmbxS2vJOZdEMNd3tdty2eTM3+V3tFICKsq0q0t47RSCGtf+r49Y5PV
         26GA==
X-Gm-Message-State: AOJu0YxUyn8LNB1b+R0WE6l7UnG84f7HB7+P/uCzHUm6U4pjSjlgL7Mi
	XsHjB2qgdpVaIgYXtlgrB9WlhPB+0hDBauF/6ZWnVw==
X-Google-Smtp-Source: AGHT+IEAH8O+SdUhWlAZb+CSYciSAM3UOp63TO31mgGL30OG50Z4h0Yho5FJPhH7DP/3dFhPf+UNsA==
X-Received: by 2002:a17:90a:cf96:b0:268:1b7f:257c with SMTP id i22-20020a17090acf9600b002681b7f257cmr5251094pju.6.1691961567573;
        Sun, 13 Aug 2023 14:19:27 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/22] linux-firmware: Fix mediatek mt7601u firmware path
Date: Sun, 13 Aug 2023 11:18:26 -1000
Message-Id: <2d56adfd53b0ea3b938c60bf57fd40f3d48b5c68.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185911

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
index a367a9fd01..206de1bcd1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230515.bb
@@ -411,7 +411,7 @@ LICENSE_${PN}-mt7601u-license = "Firmware-ralink_a_mediatek_company_firmware"
 
 FILES_${PN}-mt7601u-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmware"
 FILES_${PN}-mt7601u = " \
-  ${nonarch_base_libdir}/firmware/mt7601u.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
 "
 
 RDEPENDS_${PN}-mt7601u += "${PN}-mt7601u-license"
-- 
2.34.1


