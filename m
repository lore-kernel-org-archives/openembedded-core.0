Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75374C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:00 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.5144.1701377878578196136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2VsnlcNO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6cbe716b511so1407162b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377877; x=1701982677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWjoAO92hMADJzgu5K7k88QUSg63MHURWf8XwQs8s58=;
        b=2VsnlcNOUS967OWGjGG/Zi5CotF7wpa3nklDRJyxOiBajg4TrsCcUS8bEsQUWt16GA
         7eM089+9UKBqpfTgDALDCB6XVTMe5Rb/Vsjbwsq2XpCeiUQJ/Ny1QOae79612fOP18fu
         eqAwdyyDnf+b5gnOBZf/qTOXa4F8YgF617c9ngTofpV8poAemj37bQRvqRkBB6ZAcU0D
         hq/EfrUYpAa3nYdf6UwLPj/0pteORWCcbFGvSJEXznT3qul0kiGA8FosnXYw+KWmjEt0
         xj8w9MSru39uJU3wOj1maIMKoDnpLYZDJnYC19vF5MFGefizt4KivuEDKAr0VnzsXHMp
         XDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377877; x=1701982677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWjoAO92hMADJzgu5K7k88QUSg63MHURWf8XwQs8s58=;
        b=cvxGNMjvrk3m4fmZWzZw5TeK57eUF98aaS7PWbq7lnxxgp8utjyiy4cnZFNXDjW9mk
         dDL37WmfG37EbsqEYS0FZcq3pxQygR3EnIM/XTJvW/KyRb4sduxTZUPUJlVDbYVKsHvl
         Pc1mz8UbsmS/UMGSaKF6mk+/vmx6RlYqb89ORotVOpV3yWGnnwOrfmMCgAROhh9/2xiX
         PQBH1WhEEiTZPTiHgiEtu2gpzH+eN9S/wVhTk4lKQLLENvmpdKdIBm3EL+T6bombUI9l
         shhSRpp9L2gEn7wIH67sPwEoMSAYKUywCQBQ4ox4E2BOboTPbQNW23RujWKqKWTLnbh5
         hu8g==
X-Gm-Message-State: AOJu0Yz83x/9yC8SIdDroR41GAyupGnb3UnIv+cMfMsi366lXn2L+dAS
	7lqs7409vAO4XRWzIKJ4VfBUkGK3r9LszdMO02f8Cg==
X-Google-Smtp-Source: AGHT+IGpXtvsslQGDdT/1ZyRGJXo5c25X8OlPhPqpT4WiY5IPA4vf2IXgC3Oxei0eqVFu2a2LLZoJw==
X-Received: by 2002:a05:6a00:854:b0:68f:ece2:ac2a with SMTP id q20-20020a056a00085400b0068fece2ac2amr25036662pfk.27.1701377877691;
        Thu, 30 Nov 2023 12:57:57 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.57.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:57:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/25] linux-firmware: add new fw file to ${PN}-rtl8821
Date: Thu, 30 Nov 2023 10:57:18 -1000
Message-Id: <753a56079375b542e0e22a5bfb76804aa975eeb3.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191528

From: Bastian Krause <bst@pengutronix.de>

Extend the linux-firmware-rtl8821 package with rtw8821 firmware files for
Realtek RTL8821 variants.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 23c945938f8d8bcf5fbd6d9b840ec319aaa40c62)
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 0e8005bfc9..33be741a0a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -825,6 +825,7 @@ FILES:${PN}-rtl8723 = " \
 "
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin \
 "
 FILES:${PN}-rtl8761 = " \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin \
-- 
2.34.1


