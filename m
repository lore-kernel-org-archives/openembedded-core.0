Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B37C433F5
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 11:36:57 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.36602.1638704216608963687
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 03:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iyYvnew6;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id gt5so5666937pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 03:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=bJsO40ia0AmSVVi/EAMPiLS25M5q296h6/atpIfScYs=;
        b=iyYvnew6vlB3c/kWzwc1Nd02AkwCkkfzlNc7fYEfylSq0vyV3xv0tlTyuT+De9HTWM
         IPMZLbWynmFzlxem4KyZPBRkI9pzsXa1FmzrnIiuctgzLRlIbINJEBxWk/zG3rztjJdw
         BhvJ5ElhQWEVuXwmIoPQb2lbhLrT9cb/d8Tbv+q/Q4UwwaoszkmOyhMYkzQEYpGfkVLm
         qFDGJdUMPnlx7UztH29Ir8VzVFpKoEyXh1Kjr7UujghglZOSFz2oqN8+6k7f75pTFSju
         PavvpJWQJb6kdzCJSJFoooqs31Er2xDAEqbmAbm71r/0eM0lZA6/EXWIZq71BNAabWLj
         4lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bJsO40ia0AmSVVi/EAMPiLS25M5q296h6/atpIfScYs=;
        b=bykQv+n0WtQ/PiQettWmoINeDyqZ7aufYJmmZHh1oAa3+dW6FjJRtAB70WTDM67eyA
         jDN59S+feD+AhiSqEqza8ZG5EQ3UD29DBQApGMl3XPymnRMCfLcnfmztPHpIcAjmyFWZ
         CuHZfgKrEqaeSw6U57ja9cnFMR8sX2zsW485pKl1iTueWgs1gwb5yTCKOqST4/qV+9g3
         PS1LBkgVYMihlUhKg8vBwsbO7+vnhGn9o7rndyfnhUJWBuznygyrKTZdHE1j+7amgXbh
         389SxMIeK3arDloBPNeQFaJjVAmaK1bCWt9st95z5gVnYRkOO6d+nBP4wPm8/peYfz0S
         CCgA==
X-Gm-Message-State: AOAM533+oTFDYQKICzhAAXPCm3n8e+6FWNNmkytrEPERmvFM1q/bbwfY
	LGRgWVNKvuo4onAAntcnKURbzay+vWhJXA==
X-Google-Smtp-Source: 
 ABdhPJxmWdih++F0vgvjdglhzvOSNxlBqWeSOzMvNmYrZa0u+Dzx8RxiddENM9f6uvt1HCIkS3hgWg==
X-Received: by 2002:a17:90a:e60a:: with SMTP id
 j10mr29336503pjy.169.1638704216036;
        Sun, 05 Dec 2021 03:36:56 -0800 (PST)
Received: from localhost.localdomain ([157.45.160.11])
        by smtp.gmail.com with ESMTPSA id
 pi17sm10850892pjb.34.2021.12.05.03.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 03:36:55 -0800 (PST)
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH] tune-cortexa72: Add new tune for crc and crypto
Date: Sun,  5 Dec 2021 11:36:31 +0000
Message-Id: <20211205113631.609-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 11:36:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159190

The newly added cortexa72-crypto tune builds programs for armv8a
with crc+crypto. Whereas default tune cortexa72 builds programs
with armv8a only.

[YOCTO #14641]

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
---
 .../conf/machine/include/arm/armv8a/tune-cortexa72.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
index 2a510bd45b..8c32286c84 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
@@ -6,8 +6,12 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72"
+AVAILTUNES += "cortexa72 cortexa72-crypto"
 ARMPKGARCH:tune-cortexa72             = "cortexa72"
-TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa72"
-PACKAGE_EXTRA_ARCHS:tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72"
+ARMPKGARCH:tune-cortexa72-crypto      = "cortexa72"
+TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a} cortexa72"
+TUNE_FEATURES:tune-cortexa72-crypto   = "${TUNE_FEATURES:tune-cortexa72} crc crypto"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto"
 BASE_LIB:tune-cortexa72               = "lib64"
+BASE_LIB:tune-cortexa72-crypto        = "lib64"
-- 
2.17.1


