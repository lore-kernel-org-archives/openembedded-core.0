Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BAEC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:31:57 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.134324.1700829114711849561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wgP/ui2w;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c87adce180so22660071fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829112; x=1701433912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=03EWItLg67INLNUr1nMVYiRzylNu0bXM+lLeCbTPRGM=;
        b=wgP/ui2wFzdMSjAsRU9Fgq6MNJvr+ezbj3e/ItfvYwgFY7PFGzgslap3VhFRmws/SC
         RqAWbgMbC5ks2tTbf9VKH8RC6aAGYcMiiBXkkCW2Xv57d+KIeHRefSEqquNrlSUWTJUD
         MZ2tk/fc09InId6mRwt9L+GdRYBVNorARxnFhI0O/qqYnU1eBf4+A3ItYowBVuMGc+/n
         xwsDJhiqHYV60IMTeiZH3Clyvcqmlhz49JU26Yt8JsdlAfs6bDZ4l5Umx6IiGOZ/Ya9k
         pSKTBV4GL5lPtEcyK9y/XX122PPkbNWG/exjLqbwlR70sC9o3O4NZTK/bRu0S6aR6SGS
         tP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829112; x=1701433912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03EWItLg67INLNUr1nMVYiRzylNu0bXM+lLeCbTPRGM=;
        b=rbyDY7zzdhpzJ/IPYW/EQw7GqI2iqO27Ykt1kPrEwpwmM7ab0IZY+BuZfb9MOLkJBx
         hTBLCpsp7Jxfjft2SlGiUD9FTNuL2eAr2qW+iTXO5cXDL7/B8OG0OklW5ILmlbzDHjBi
         99Ypaa9uovDDRkymcB6o5CE6zZtsGhjpJ+c9ImGObpYzq++5DJI/WRTaGvDoYktYq/BD
         uiiTIJXAjJ+kyeu6SJKAMn/Lo3qGs3eHLXsVVgQsKapfO20OM5tnsFkwLiPiPmND5kCT
         vJtNP5DGcEQLxKNhBbipgJhHTfHsivRd68cOtddmbyxGVCmu1I0oGdkTo+ZHBqvjDlC7
         DkVg==
X-Gm-Message-State: AOJu0YxUVrMmZ/s8sjGiTlZ8KPa3IgHTggiryTeb0QIxqVshDy2FJwFN
	ED1yDVr4vwuts6tifQZXE6nzPraln50FuseqjSo=
X-Google-Smtp-Source: AGHT+IF6SOhNkFOKcntCDOP1Lj/na7ROmKCJxLTTaLAwmyJK8MkYI+y1FCo8vzWm2ILblDBiVzr+rQ==
X-Received: by 2002:a2e:8e86:0:b0:2c8:34e7:b8ea with SMTP id z6-20020a2e8e86000000b002c834e7b8eamr1870032ljk.53.1700829112464;
        Fri, 24 Nov 2023 04:31:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 00/10] linux-firmware: upgrade to 20231030
Date: Fri, 24 Nov 2023 15:31:41 +0300
Message-Id: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191183

Update linux-firmware packgage to the 20231030 release. The proposed
patches fix some of packaging issues, bump package version and then
provide firmware packages for several Qualcomm boards (Qualcomm Robotics
RB1 and RB2 platforms).

Bastian Krause (1):
  linux-firmware: add new fw file to ${PN}-rtl8821

Dmitry Baryshkov (8):
  linux-firmware: upgrade 20230804 -> 20231030
  linux-firmware: add missing depenencies on license packages
  linux-firmware: add notice file to sdm845 modem firmware
  linux-firmware: add audio topology symlink to the X13's audio package
  linux-firmware: package firmware for Qualcomm Adreno a702
  linux-firmware: package firmware for Qualcomm QCM2290 / QRB4210
  linux-firmware: package Qualcomm Venus 6.0 firmware
  linux-firmware: package Robotics RB5 sensors DSP firmware

Fahad Arslan (1):
  linux-firmware: create separate packages

 ...20230804.bb => linux-firmware_20231030.bb} | 288 +++++++++++++++++-
 1 file changed, 278 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (83%)

-- 
2.39.2


