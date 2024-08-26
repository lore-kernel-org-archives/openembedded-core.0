Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846F3C5320E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 01:39:17 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.43657.1724636353244405190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 18:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=duWRIu0u;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f401c20b56so32954171fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 18:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724636351; x=1725241151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJfRg3UEFoi/JlQlseYGhfJDDPXVL4lBVoaITCNuopY=;
        b=duWRIu0umtt+kQ0lxI/9NKbK/qZO5iO27oQpnMk4HkiDn3z7ZQoHu3LbyLZhlw1t92
         6ZLgZRvjb+Fmo/FKaa2OekhWfy8Ugu7GqRxGbmPkcId4mi4A7r9rWctY2aIudyMS/hI+
         KcRGr5q1PK5GfTPEY5TBUkm3XPPyRXylJWTyFIlSYoXWnZF8+Md5kY4D2e8aEIg++WBi
         KL/BwUNk0aDdAdEdvXYQ4yW777nHEjUlZiPGxWzj+yr/2XYfUThwnQs1CPc/oMKIG0Uh
         ZeIyCyQPdWhcj4kp5egJwFQiQgLyQQvjZUesYk8fdiu6amhA7JKUzChTPctLBITe6n/P
         tiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724636351; x=1725241151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJfRg3UEFoi/JlQlseYGhfJDDPXVL4lBVoaITCNuopY=;
        b=jYPN2Fr+J2QMUo3mNyopo3hO8AWqRQ90MDgofS4ZxucnjdA8iJrMTKHy+w/skBRT3s
         BZSTwCKecxyTxUDTqt5sCPFqEzSsBTcdZB1bRL16nauwTR18/tMcS+BBWjgwxFKB9oNX
         vTNx8rf2praj6xQJ6/HXLau6eM6pV/HTmn9BFdmmxkMdQmeAzUvPq3E4DIg4oAPVp9Nw
         e9B7wWtcKCEqYthuOs+pFXq1Pk2+4bt9WSsHYF/YYTm+3zHnV6l7hs7YH12X4y9B6bkk
         dGVuAkp6/e35Hhgs58khD+T5OwgVnfw0CCXhzXP+ycR47he92CkTGR7KZ1raH9hBtmq5
         qc7w==
X-Gm-Message-State: AOJu0YwvuA3uZiHfBEnsgtIVqyoEoLxsYVan14FdC/c7X24V00LNWWAa
	ehKFampDoMjQMIX92bpNQehTrXbgjHnqvJLqog21mzwPrTu7ZZNS2r+WyQFI8GM/hxbJwxKy6wr
	i3ka/zA==
X-Google-Smtp-Source: AGHT+IHI0sZPyLnIf17u6ckXgm86XDJHknGhzNcSpYZuPTMXjr2XxqHeBboxfWpxBJhsB1z2s34/1A==
X-Received: by 2002:a05:651c:19a1:b0:2f3:e2f0:b09a with SMTP id 38308e7fff4ca-2f4f48eeaf1mr28847051fa.4.1724636350376;
        Sun, 25 Aug 2024 18:39:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f404884957sm11184771fa.123.2024.08.25.18.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 18:39:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [scarthgap][PATCH] linux-firmware: add a package for ath12k firmware
Date: Mon, 26 Aug 2024 04:39:09 +0300
Message-Id: <20240826013909.353920-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 01:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203735

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the firmware package for the ATH12K module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../linux-firmware/linux-firmware_20240312.bb              | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index ff79bb9b33c6..53851b58fede 100644
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
@@ -487,6 +487,10 @@ FILES:${PN}-ath11k = " \
   ${nonarch_base_libdir}/firmware/ath11k \
 "
 
+FILES:${PN}-ath12k = " \
+  ${nonarch_base_libdir}/firmware/ath12k \
+"
+
 FILES:${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
@@ -494,6 +498,7 @@ FILES:${PN}-qca = " \
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
+RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license"
 
 # For ralink
-- 
2.39.2


