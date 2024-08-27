Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F72AC5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 10:03:52 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.74207.1724753028227922466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 03:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rEqByKjl;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f3f68dd44bso60740171fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724753026; x=1725357826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3W76xuz8+QqIj31gG+GjqP/TPjGdYJxbbpQZqGsyCE=;
        b=rEqByKjl0zA1EBqvZw8+5QK1gFBdD2Id6kX7Cm3YgjhdgzmNFZN8MbEzWSz2UOS5PG
         Ge1iPWszZEapPYPO9LN5Hmmt1kYU6mAkIf29u/zpdHYMHJnz7VF2cPZtc2/SO0mUke7Y
         7N/lKt3aG+iqSVVHKimrC2CPrnz6AXyeeDSEYHH3WTKQJV9a4g/YqU42cmAu5eW8ZlC7
         j3dctiNhyGPfsF2XXWXWLcNay0q1tOvBaUiTk107JzbKoNtSMDvZ9HG0DR1f02BZeDou
         XiSUOpurL3EC99ofYZP00zSPeOeJ/K8rrDFylp0IAfWpwmGCfqdCU68JnS54P64eMBnx
         F0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724753026; x=1725357826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3W76xuz8+QqIj31gG+GjqP/TPjGdYJxbbpQZqGsyCE=;
        b=UV0CL+7sAXP5MnzYYdBtbumoHkhMSYZQoVayoDm5ATf7lc/n9+veGEwK89pUfro/AB
         d5FohFnrENUdBn+WrAr+41GG7AR5YtihwqIFkTb0pW9Gb/pJ7HWhWcYClkikkqNysCIN
         wCXoAxnrY9kRFmxTm/1HQ5nI+ZWzobNZErbIyzBmCEIBaca0F6WD2rTph5oG9g8Sz+KY
         wsKYsDJ2v4zDt4vrkmv3ADpgNlCcpQK0SVi1tB/0f++/V9HIH2XmXI1z1TzoMBmwsoYV
         hvY8uvMcpOU0ZpBjcm1sT4Cxp87MgGmJi0ZrmOWCCI3LRTdq9gAKXcbaEeu13wCzhAx8
         XXbg==
X-Gm-Message-State: AOJu0YyN8yfdhkbus985hmou+vIhwpOEBq2KQqKSo2d2TEmYLcEGmd+Y
	gL+cH7+pyZ/Q0o8Foy9qq/pD9r0LNczMGBljJ2b5zJtNpvhmCBgMLvYfUsTGPOhWKOd7nDFdyur
	u
X-Google-Smtp-Source: AGHT+IHKptT3Y1w95bY/DVVPROlzBMu84xTK3Ce3vQ3pk9ti4TgZ8FvTl5tOlxCjYetiHMgYCtNxXA==
X-Received: by 2002:a05:651c:1987:b0:2f3:994e:d68b with SMTP id 38308e7fff4ca-2f514bb1e83mr17426691fa.47.1724753025123;
        Tue, 27 Aug 2024 03:03:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047c8012sm15534921fa.52.2024.08.27.03.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 03:03:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [scarthgap][PATCH v2] linux-firmware: add a package for ath12k firmware
Date: Tue, 27 Aug 2024 13:03:43 +0300
Message-Id: <20240827100343.127172-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 10:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203822

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the firmware package for the ATH12K module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
[DB: added rdepends from PN to PN-ath12k]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Added PN-ath12k to RDEPENDS:PN as not to break users expecting ath12k
   from linux-firmware (Quentin Schulz)

---
 .../linux-firmware/linux-firmware_20240312.bb             | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index ff79bb9b33c6..5819d9287cc8 100644
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
2.39.2


