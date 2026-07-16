Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F6AC44514
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 11:35:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10834.1784201734514938416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 04:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YVWYEJod;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47d70879764so4551445f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 04:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201733; x=1784806533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FjnXflBrALSNQesoH/AT/kWIDRHsIN3H5vyZZlTmFIQ=;
        b=YVWYEJod5Nei23eGrt2iTgLVZPHwx8uPD1J0pT+/riOElG3vsGocC5B855rjf2KU1d
         OUKWH8CYFlj62QHyJ28cWsirc+Xn6J4NmZNVa4KnVFOqOUXi+mKPWpoz4ra9CL7s/Hnd
         4Rw8tAox64ZAghlqJriDbJND68IZWMxoLFdM+UbBkbLxZggu+pBzKURpTTAycrkZLDRM
         10cQ84QN7hd0xjX80KSUyE+iebmlHrWcsLD37ICC3Bm7aSmTOyACaWAErsCq9cS+Y0gC
         bue/GupIU8bbmn5SsYJbZZYWuw9SsrI1LjCYt/mX8bD3mYmIjXtKnKbAtR7GlQE2QpeC
         B9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201733; x=1784806533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FjnXflBrALSNQesoH/AT/kWIDRHsIN3H5vyZZlTmFIQ=;
        b=IwlBeN9ynedyivXrmxVyJwhKxwuBweqnIk9/WYZxISZsjra56nk43WwBN6ptvfrCQS
         nrhU3s38qfrkJwjsmvCeI1L2QxqisuCeF5QjWVbcwqWsmr+NCb80V6sxwc/pQLQEQIN+
         HvR+oJZmKS1/ndgrX1fWmkit1qU5JLd4fsvGbWCQDi1WvrdzgGJFOxn+RB+jToAYfvBM
         Bw/5AO5tAwer3lFR6umA/S4QBq159AsFwew/Hjtzikg7KjIFuYK6ggrmY+kJ5aAhy3WB
         DctdhKJRP3ReeiIV5GRmwnjTyZ1Tw/ch+++izfzyS3MNqv2ONq5Y6VNNDk/5hfF0aDzL
         Ot8Q==
X-Gm-Message-State: AOJu0YweB/dFpRf4lFiS7/Ov5dxy2ETRC3B3TlIg8aMj8MJtSvp3gkMW
	1V96h3ElRU6YaEEbAvfXMN9FJvPnaOxW3/Ahi9vwt0ENbtwKfQvhC4c3orN1TQ==
X-Gm-Gg: AfdE7ckS+oDrXS2zBqdYBPpP0k3vFT3aTXsKF2Qj52NTp/S6dGyitHL9yQjaFxpv1Jf
	sbzmPY1hSuhyrxT+8K2awSyRn2QnWKrJP7kTOIxumBngO5JHMbUATIi40BIGutoaXJ5Uk+epWGn
	zNBKHYuaD7XyGXyQ1McXyH7wy2QZnOsav9uChpJ67BxKDO6OPXVMznwd7yTatrCFEG3cCViiNAj
	zy9lUZCAyHUfbDCU0vygqS88hHqnnNLkCgeJ9JfMbreo80pdscxh+FtFWYKWZQDfxqYjlwMrhkL
	0lI+FQcLJD0V9kjG1YX+esRFBtvrrFA8i2YyOff5anUSuXbD3mg4PvdcaqA6lfQGtlOAfpq47Hx
	QR7u5zNyMTjaJtJLuNnydzml0kzTBL/Pii5UtwSQZQbbGJHUTLGRiVasQINdHlqs51TQdzuXD/y
	E7ph5YtqkM0lwUqj5Kmv7ILNGWhLHHKph51VQReA==
X-Received: by 2002:a5d:584d:0:b0:47f:4dfc:ca1e with SMTP id ffacd0b85a97d-47f4fca8033mr7635635f8f.5.1784201732573;
        Thu, 16 Jul 2026 04:35:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm26215803f8f.18.2026.07.16.04.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 04:35:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] python3-dtc: use https to fetch from git
Date: Thu, 16 Jul 2026 13:35:24 +0200
Message-ID: <20260716113528.2322001-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241083

From: Alexander Kanavin <alex@linutronix.de>

git:// no longer seems to work, and all other kernel.org recipes
already use https for fetching.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-dtc_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dtc_1.8.1.bb b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
index 314107883f..4c362f513d 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.8.1.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 DEPENDS = "flex-native bison-native swig-native python3-setuptools-scm-native libyaml dtc"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.47.3


