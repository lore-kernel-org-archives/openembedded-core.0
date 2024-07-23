Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134A4C3DA70
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:42 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.43672.1721740416523763778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mWrAp/hW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb56c2c30eso3300213a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740416; x=1722345216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNk1lTX9+E78eXP/ZXxt68+h8ftRyx7qQPAxalByes0=;
        b=mWrAp/hW4Pn8a7ZLu2oWFGWJXDydJVKZc8q+9OD7xCCWI10Q6TeS9vGxbnmmk8wpaG
         yd0G5Two4az0P1bwg7bTK9oLw3BDgwyfeX9fytuXuHc0EZNlVcZ+4puEi855/YCVxgIz
         fXLH6572R/FxsiQBI5rS5uioRnHPkDY2obawaudRkoIeAPFcecHkX8u+6Hb/kAvEPjUY
         +/YcaVbJrd+IkV0aKlQmch1XXafKmI0+v+LYyVRN1jImd2RuYOROi9ZpjlwzoP/nTL9X
         seRdN0pUOsvqJ/SZCWeZxtSHeWq8YSPTtBdYQaPDX0Z1RmxvUodba7Wb0pEg5Pmdgkgs
         IoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740416; x=1722345216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNk1lTX9+E78eXP/ZXxt68+h8ftRyx7qQPAxalByes0=;
        b=RurMmfVFT3hvhgw4l+Yj1lz8LROHMfe5tNnNnhng67Nu8aF0b0gqNpqswmCg/eyLd6
         IYtc3GxgPLRvJTACsP2R8hBGsrzPNydKO4pf72wMG0hf7AOJ+XoDN4+6a1Fip6gpUQps
         ITsjvXOjdsFiUEwuADOiSCgSCKA2D4ELiGkcxbiguDYpXUxFT4Lr96RXrfNV9XhMu4Tk
         gCoDlSpoozAXfbqtD1Fds/vcyA9tkIIivelHJYe4jPm9jEuBhHiybJEbRATlKabJR/je
         /92r3FyO4qbmegFmuXV1v+sRpdqSlzl/hqFp4kmBhl47IS52/DuB/I18n4wb5Q5pQcfD
         oh+w==
X-Gm-Message-State: AOJu0Yz4KMWE0V27D+fe/7bUK9HGkVsVbE5o7H0oxsMB8SGuKfWUm4xe
	GprjqT4qpXsc6rclKqCVaomRsU0GSVdNtAIazZ6HbCb1R5PKLhTH8y2UMMw5hPd4DpAdjWauA89
	UXaE=
X-Google-Smtp-Source: AGHT+IFRNbOdr5w+eLHP/PYYzDki3IUHP/5/KYr6O+wwcWkM2cJCtr/Ackpvp/QGk0eVn70Es6bc7w==
X-Received: by 2002:a17:90b:703:b0:2c9:6d45:8187 with SMTP id 98e67ed59e1d1-2cd8d11cb19mr3132410a91.21.1721740415680;
        Tue, 23 Jul 2024 06:13:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/17] mobile-broadband-provider-info: upgrade 20230416 -> 20240407
Date: Tue, 23 Jul 2024 06:13:06 -0700
Message-Id: <081aa8f9e709314bf6a644a43674d8b44e04d894.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202352

From: Alexander Kanavin <alex@linutronix.de>

Convert to meson.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 643c7c2219886253857fdc7618d5db12ddc0e9de)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index a4030b7b32..06ded45934 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,13 +5,13 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "aae7c68671d225e6d35224613d5b98192b9b2ffe"
-PV = "20230416"
+SRCREV = "55ba955d53305df96123534488fd160ea882b4dd"
+PV = "20240407"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit meson
 
 DEPENDS += "libxslt-native"
-- 
2.34.1


