Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEC6C54E67
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 10:06:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.9043.1710410781678621200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 03:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=L/flkEMi;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-413f8f5541eso253875e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710410780; x=1711015580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PvN2yoyoH1XZZf8wShnE265MmttlHCLb9mdWevtUa0=;
        b=L/flkEMiev+hOeZ5kD0Drs4hSfHIOZe/8Jv51JzmSJ7MTJkLx7NiLKG0Yw6B8pjYlO
         q/a7AUivKYwLcujNc7quAhFP8AN9aPKZRNTb5p5YglAskNYmXetyLTanuIm2tPi82TSH
         zAq9JNL9Ls0KCG2jHzPslIaXSMIdeiqA6cBrqtoj4KoImij3O52xhs67w2PmkULw66vg
         1kWsgyC56MqCkB5KFOkfvq1vLuUvcxWeewqNZI1AHxDCIUFDd8djXrrGrA3wfxvjrrho
         fjoBkflo99HahFuX3lp4rSVrmIilKyog1IvW28sQPP6f0/ahlKG2vps9kTC8ZLtI2A6C
         KdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710410780; x=1711015580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PvN2yoyoH1XZZf8wShnE265MmttlHCLb9mdWevtUa0=;
        b=q29Ak+aFsAZXBDQkrD+mOTLhSLY9WvfJX2zuJM2lpWWasQayRmhbL0+O9xDRH8OKtM
         vW0pU+HSX9TR//y46OzAg2QBMa/RWBsJrKtJbin6QJZkCfk7IVPVPnN0gppXlzikwOr2
         HRYbWk0BPnsA9LjIkl484NygS9cUhb6iZ6ggNBbYjQWJiyPgRX1XehYh4dr32KvPqc42
         eEo4/+1D16Lyet5JaZcEFELyNQS4FJRR6XxqUPOLDjaIoxioAjhF5riUfsWsCKvobdX3
         9aFQPH29Ip7j9KhbleYmNdUAjG2gpP04W3rOjaMjb2zXel8imw+kM/D2V0Q2qLLwRyZb
         tmyA==
X-Forwarded-Encrypted: i=1; AJvYcCWJq4vZXJJZEtLCKNK7wilmeqh42u1X0Dtrze/Z6+5omAyjOpbQbFEnJ+ach5HfaKHmjJWplrwNEZQboeBkiMJhnblojA8eaAj1Cvg2CbS3dpj/Mu3SonbQ
X-Gm-Message-State: AOJu0Yy+1G7sDqHq6ThLofL5PnHIlGCj/pd3NWXA0ownyUeg6v/sucsD
	oDiS6Pv8+C+qcrUYKuT4r9sL8pXQIfdU2ObQrZ429W9fWBjf9ubSgqVgPdiK+WOKa41Z4AwGWD7
	M
X-Google-Smtp-Source: AGHT+IFxjuchxND0GJwa8GrSIzCrk8THz1vWKlNeamIm3VdOqMLAlFSVOgbUmEYDVT6OS/M80xp/xg==
X-Received: by 2002:a05:600c:19c6:b0:412:e2c3:4b6 with SMTP id u6-20020a05600c19c600b00412e2c304b6mr1110402wmq.20.1710410779911;
        Thu, 14 Mar 2024 03:06:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3988:874a:a0b:40b8])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b00413e8df267bsm1911015wmo.48.2024.03.14.03.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 03:06:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 1/2] linux-firmware: update to 20240312
Date: Thu, 14 Mar 2024 11:06:09 +0100
Message-Id: <20240314100610.21815-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 10:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197101

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Update the linux-firmware recipe to the most recent upstream tag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...{linux-firmware_20240220.bb => linux-firmware_20240312.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240220.bb => linux-firmware_20240312.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index 1fd44f4d53..390d10d2f3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
@@ -155,7 +155,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "a344e6c28970fc7daafa81c10247aeb6"
+WHENCE_CHKSUM  = "514da1cd8b363373030f0c16749feb8d"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -243,7 +243,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348184199cb02c2bcd7"
+SRC_URI[sha256sum] = "b2327a54ad1897c828008caf63af5ee15469ba723a5016be58f2b44f07bd4b94"
 
 inherit allarch
 
-- 
2.40.1


