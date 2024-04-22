Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42DEC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 10:08:21 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.14647.1713780494741827418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 03:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=fHSzS522;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34a7e47d164so2244591f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713780493; x=1714385293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkqlTMMMe7NK2i5iMxyMuW6SUqQ/+GgnNNwbVoQP4AA=;
        b=fHSzS522YOo3hvQbGG/rdEdI1oz1AkCA2n+NM9N6i+a7CdaDl0Dm5DoJa8Q7zSvsQD
         OhO5Ow71eSxEfZjJMLbelnJ/xFDH7V8IJ+28WJrCvxGT8coddaoP0srp0yhJie2shWFs
         92wRNXv07PRnRkfouVZTvOtvY1C+7MXNwulr6bJ2W74IPcs46g7ocg85SrrM5B/5QJgr
         A2TRqO/o2oEF+n/p9onSItjlkS0QaXQ7QmWnH5jUj4Gm1RzYXdpVhfrZBE6ZyW8woIQs
         eXHy5nY2FQL1f1xtd2D7zwBzAgbAD47TMjFQgJhrcKDHojHGFB/+WXoiTnYfd8Sz/OYr
         aGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780493; x=1714385293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkqlTMMMe7NK2i5iMxyMuW6SUqQ/+GgnNNwbVoQP4AA=;
        b=jeqZCCkkw6N5hhGOyWUcuMVhbg5R8tYeyB9U4LeYc8KplmtE6Y5kkXpiRyF6J160Z1
         SKT0KUOXM/Ag5AieKUYt79qWq/d+4O7mlweRtqhZ0N+eungTXI467GUVrZtKJMXKRhp6
         8fgmeWnXgxu0DgvYfTYo6Y6SPbFXr7+tpP6edKnGh8KGAFbYE8yHYA/EkEwdsrt1Cxw3
         v5f5KCtBMQFST9Sk/pC7kwlnVpqX4/sC/EgakQVOmgFTgIyPaLjPGURVyp7USBcsKqYj
         uFGP6K/DeIHdmaC6z3EuQbzZOtIqV0frYKK9XSyoIKq9QMZenyBhHqmL0AOfgvR8K6VA
         QwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQxntYhse+04Tvwl4AmZ7hpUNry4oIe95HVd0VbGi8vlz/W9mf8GMKX19NRB6kGaUz+EnJTcuJ2RhDDLhx1Cs2mBGIZxA9V4/z2QyI4ee1j1ixW8G7Moks
X-Gm-Message-State: AOJu0YxqB+5krvtmFSuqrd5eW3Ey9JxdLMCk+fYCJUhxka5vDk+HouTv
	WcR69ciI3fvknBd41AIXarIBzx7ACF4SrrO7b6n5uHi6uh5k/WgWJGf4EPqE0Xg=
X-Google-Smtp-Source: AGHT+IHhMhbEiBJld8rpmKK2L+WunYeT9/b3BBXGUvVL5OIKG5sR80p5INZGpiW/t5lYmbr+rDZeXA==
X-Received: by 2002:a5d:554e:0:b0:346:b778:eaa7 with SMTP id g14-20020a5d554e000000b00346b778eaa7mr7020123wrw.18.1713780492809;
        Mon, 22 Apr 2024 03:08:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:6981:a121:4529:6e42])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d5612000000b0034a62e51429sm8466864wrv.112.2024.04.22.03.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:08:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH] linux-firmware: add a package for ath12k firmware
Date: Mon, 22 Apr 2024 12:08:06 +0200
Message-Id: <20240422100806.22574-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 10:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198582

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the firmware package for the ATH12K module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../linux-firmware/linux-firmware_20240312.bb              | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index ff79bb9b33..53851b58fe 100644
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
2.40.1


