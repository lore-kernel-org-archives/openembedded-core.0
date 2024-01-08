Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB6CC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:18:05 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6858.1704721412846462287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:43:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=uPZIHSoC;
 spf=pass (domain: ossystems.com.br, ip: 209.85.214.178, mailfrom: rodrigo.duarte@ossystems.com.br)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3e05abcaeso7552365ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 05:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1704721412; x=1705326212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GkUaQeizrnxaOVDpmoAFLbQ1Jf3IcIF1iJYLJuIwvlI=;
        b=uPZIHSoCuGbUTa3nh10Z/Vrx48nVvFNQl4ooTe5SI/om6rXAduGbMGk2Ijm9A5rZxE
         xBx6x4fkZSC1FIQdayGFkx8hodE+YZg0PE3EzuylgDk+8RmFL1wWfVHcmRWG77jfokk3
         XSOICV1TiTrfWofcD3/dANZlWHwFQSTKcopqwNNIFILIuC5CMM48xhw10RLLYWyIgp7W
         YRLaXiQl5h/N5HdEYwVCT2ly/GLlpqx5TXmeBvW+eh5SKNWy90L3RnQimxIwTRiFkrff
         5tSA/NMW93i5Gfehk3U9zh0T4iSf/gTdbJ5tRI9BqG/Cy8mueIcQ8S9Us6UU537tTkpr
         birA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704721412; x=1705326212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkUaQeizrnxaOVDpmoAFLbQ1Jf3IcIF1iJYLJuIwvlI=;
        b=InYOOlz180v3A90ykcppJZ0JeUe6Z0qv0ysw+igbmgX8SD2vKvKknOochtJs7nuDK0
         bn4Ca1YO6GLA8tuOT1FjMEu1bxK7MOSm1lBkIwTt5tilbef/pmgOGzDUllGM/wBIwilq
         3kIV3znV0H9u9qM/VAQlGK+3FpZeLGEXJy489hrUWsrM0GTcAX1h5SvFqf2cJwHWG/6I
         WENGOUR8iLzszOHnoObCEibN5YETREa96Oo9i2BC+nKrAmUxH/JCxN73GKAUX19/Ga0K
         3aBjTPxElwjsqrgEzGQbRKJmYhnlECfLUmDlm2zev1aml9jPUdC1ETFjA9nfTkgBGJP7
         ErzQ==
X-Gm-Message-State: AOJu0YwiIM/TlGW/xYYh2wo2nVyCYQyaAUl8bb2uKKen1Cc8O50nmRoq
	D0qOKvOHaHw1OZwmiQb1Ppf/PEAll9puaPQZ/cmDcnutGa4=
X-Google-Smtp-Source: AGHT+IEtHBViUEuYSg8zm7nrm3x9nP6qWk1PcT3h8dVrvsk/R2Kj4vAwBoLBI9TWi350I2mthWWDDQ==
X-Received: by 2002:a17:903:11c5:b0:1d5:36cf:a8a with SMTP id q5-20020a17090311c500b001d536cf0a8amr839517plh.39.1704721411473;
        Mon, 08 Jan 2024 05:43:31 -0800 (PST)
Received: from lenovo1.lab.ossystems (189-74-215-108.user3p.brasiltelecom.net.br. [189.74.215.108])
        by smtp.gmail.com with ESMTPSA id jv5-20020a170903058500b001d4e765f605sm6281721plb.269.2024.01.08.05.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 05:43:31 -0800 (PST)
From: rodrigo.duarte@ossystems.com.br
To: openembedded-core@lists.openembedded.org
Cc: "Rodrigo M. Duarte" <rodrigo.duarte@ossystems.com.br>
Subject: [PATCH] linux-firmware: Fix the linux-firmware-bcm4373 FILES variable
Date: Mon,  8 Jan 2024 10:43:23 -0300
Message-Id: <20240108134323.37022-1-rodrigo.duarte@ossystems.com.br>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193405

From: "Rodrigo M. Duarte" <rodrigo.duarte@ossystems.com.br>

This commit includes the 'cyfmac4373-sdio.clm_blob' file in
the list of files for the linux-firmware-bcm4373 package.
Without this file, the linux-firmware package adds all
firmware packages to the image.

Signed-off-by: Rodrigo M. Duarte <rodrigo.duarte@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 6667f00612..b1f5247975 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -1071,6 +1071,7 @@ FILES:${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bi
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.clm_blob \
 "
 
 LICENSE:${PN}-bcm-0bb4-0306 = "Firmware-cypress"
-- 
2.30.2


