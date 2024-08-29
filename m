Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9BEC83F21
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:33:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.15248.1724938385220459955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zoGfx6gh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-204eebfaebdso5502195ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938384; x=1725543184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT4PXdIX4EFQbifuZpFz/oeogtITUZcuArCMDQ1phqo=;
        b=zoGfx6ghvEDjUYAC++VVKMC2NLqkoYspNxWLSk+wPvOXVazInFUkM2tvGSjZYHQVlG
         /xSrRDn4WRQEUjPOWQIABuE3Yg2TS+ma6vO4lpjxBbJVNg+/W5Yigvi576B+nFjAVvzn
         hNSZSX2WDU7tEnheeh2/laWsv5XXtZ8RCcZZaQZ1s/FFxuixPtUUI9D31t7q/EB+OMVP
         sEyjz/5JBrmn5exrLaNnKdvoyVMCu0iAdlbZXRwIAGzbWnZdzLIFowR8DgFGvH2E3dxm
         hRUCQ3cIqunZPzRnO1d4fN2oPHHHB6K8bgXwvLdGLzZoWUIdQxdyMXspXknZ8Lr4hr0W
         q6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938384; x=1725543184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT4PXdIX4EFQbifuZpFz/oeogtITUZcuArCMDQ1phqo=;
        b=N3OhOrRWCtdVV8tsIjZwxMSPJlMmQVqW7eGcouGVfI6ZZuWYvRA86yzfwHBX+Z1l0e
         hpqP6pR9iht3hJLM+w8XdyKSTu2RqlsMsLMUcnFEikvE58mXqbH5F4/GNgFGlpy2M02l
         iQe8bWZEFWrjtfMInWPyN4XDd8rJLKVjePx/HjTUzCmdh1+6DuX2o7Kd82pDVe6loPtM
         xNZ/VK79Rwa1VWg6xL0VBivRPcWSFArZA2TDCFbVHwYPItR/jDnETrn5oe6Muh53rZYe
         6soSySG2WuLX5FUuKLcqNKGWZqRweOg1s72sMrcTX/iwXe6wW8Pyx/M7QfJq3YEvCb0p
         n4rw==
X-Gm-Message-State: AOJu0YyNgTTg4k9H5WgBUL9hK6360artfSbMM47qLuU2g6h5p1VgO6LR
	59Nmq/8UDcAvj1FRzo33HnOEhnHc0axgTCIK6zRjIzQg8I1VyxVYzluXcyBSoIWIt4HrHQoaXRF
	e9OI=
X-Google-Smtp-Source: AGHT+IG2ew0ZMWgDOuAfSZX4Rv/ZxFzUlBszKqlMqkyAI5rNIUdxY2dep4l37rZ4GHFLCHmbitpZiw==
X-Received: by 2002:a17:902:db09:b0:1ff:4a1e:865c with SMTP id d9443c01a7336-2050c35067amr34963005ad.29.1724938383578;
        Thu, 29 Aug 2024 06:33:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.33.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:33:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/12] linux-firmware: add a package for ath12k firmware
Date: Thu, 29 Aug 2024 06:32:35 -0700
Message-Id: <553f31396a5d966ab827f1c4b807ef46649080d0.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203932

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the firmware package for the ATH12K module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[DB: added rdepends from PN to PN-ath12k]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20240312.bb             | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index ff79bb9b33..5819d9287c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
@@ -322,7 +322,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-carl9170 \
-             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
+             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-ath12k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -487,6 +487,11 @@ FILES:${PN}-ath11k = " \
   ${nonarch_base_libdir}/firmware/ath11k \
 "
 
+FILES:${PN}-ath12k = " \
+  ${nonarch_base_libdir}/firmware/ath12k \
+"
+RDEPENDS:${PN} += "${PN}-ath12k"
+
 FILES:${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
@@ -494,6 +499,7 @@ FILES:${PN}-qca = " \
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
 
 # For ralink
-- 
2.34.1


