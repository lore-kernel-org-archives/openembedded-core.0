Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEC6C3DA50
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:33 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.11484.1720800209969854046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L5UCux3Z;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5c69848ca98so1134923eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800208; x=1721405008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cCfKaO80LORRfyhwDMDVmIvcR4CwCvt+imS8JHpHrY=;
        b=L5UCux3Zlaxu/hfOva2NN4/zN3vQLo0TSsOmG2mhGcKhsm9QY9GBx5q4N4B/t6EuF7
         yHsTTcY8k0A3hdla+AejwRXBpReEYQu2sozMICf7Dn825yJPnBX2zhfvUDftip9KHp5G
         EltwHeAOyzziXfOjZ9JvJJHYpvZhRL8QR5k1fxtHDy3JC3jDxw6tCh8/NIJmsIyDt5TN
         7YyB1jGymPgd5cvLWuBFnZsmm7CazRfj1Gey8jNy4ziiZTaZiBWQiHy0COnofAadwtof
         zJRJoK9vjBSvwMu6OPn14y2ePJ3kfeZbUfa7WNDAS3QHXhcrEO0u2dvl3bmjV7rQ/x+4
         oWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800208; x=1721405008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cCfKaO80LORRfyhwDMDVmIvcR4CwCvt+imS8JHpHrY=;
        b=a8CyNADd6xk6lpnCgKviE+m2L/tLX/YZxc4VL9j05SgpoIn4DDSD9Cu1q57e+vEHdH
         g7y9Zr3Ky7y9PNIE455X111pHxU7A5eyEF1itPpCwXV4nc2m1QHO8gNr9pv8viMt9DED
         +inm74vOJVXVCEee0NLBYXjZkxtGC8tkk22jt/Bu1lcxqx4HS6+eXpfNbn//OPktbUVB
         NTyo/Xf47VYF3wiuWWif0lsDoAOBpeCsjcTyf6PEQaUyjhlvS6+QW538gKPg/aza0uX8
         xqB1IUuuz3od1LOS1mt3vx5/5djRuodsh5pY5vA4hoRXOwJhZTMTweBKdpAgmokR5g2U
         y0zQ==
X-Gm-Message-State: AOJu0Yw2U/Jp27VBn8s5m/YMqcEjqWTlV2V0RnL03zP7N0858+UnOl8D
	HWMpYRxVrWAyWyYZ+68FV9icLhJnldyL4Mm90SgZ7Kv7btKJxUYOD7XhoA==
X-Google-Smtp-Source: AGHT+IH68wmtADwishkicarpXs90dY8IpTG1rACbLx+4M3CkI8lYefn5t39O5QD/gbXsGGRA33OJWA==
X-Received: by 2002:a05:6870:d8c8:b0:25e:bcf4:b5d4 with SMTP id 586e51a60fabf-25ebcf4b6ddmr8978431fac.0.1720800187884;
        Fri, 12 Jul 2024 09:03:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:07 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 00/12] Add SPDX 3.0 support
Date: Fri, 12 Jul 2024 09:58:10 -0600
Message-ID: <20240712160304.3514496-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703140059.4096394-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201847

This patch series add support for SPDX 3.0 and sets it as the default.
Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
the same time

v2: Added tests and addressed feedback
v3: Fixed several oe-selftest and build failures
v4: Fixed silly typo mistake in staging.bbclass
v5: Reworked to make SPDX 3 output reproducible by default. Variables
    that introduce non-reproducible output are documented as such.
v6: Many changes:
  * Fixed bug where building baremetal images would break SPDX 2.2
  * Most SPDX code is now in python library files instead of tasks
  * Removed dependency on pacakge_write_* tasks 
  * Fixed sstate selftest cases to account for SPDX 3.0 task names

Joshua Watt (12):
  classes-recipe/image: Add image file manifest
  classes-recipe/baremetal-image: Add image file manifest
  classes/create-spdx-3.0: Add classes
  classes-global/staging: Exclude do_create_spdx from automatic sysroot
    extension
  classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
  selftest: spdx: Add SPDX 3.0 test cases
  classes-recipe: nospdx: Add class
  selftest: sstatetests: Exclude all SPDX tasks
  classes/spdx-common: Move to library
  classes/create-spdx-3.0: Move tasks to library
  classes/create-spdx-2.2: Handle empty packages
  Switch default spdx version to 3.0

 meta/classes-global/staging.bbclass          |    9 +-
 meta/classes-recipe/baremetal-image.bbclass  |   32 +-
 meta/classes-recipe/image.bbclass            |   58 +
 meta/classes-recipe/image_types.bbclass      |    2 +
 meta/classes-recipe/image_types_wic.bbclass  |    1 +
 meta/classes-recipe/nospdx.bbclass           |   13 +
 meta/classes-recipe/packagegroup.bbclass     |    2 +
 meta/classes/create-spdx-2.2.bbclass         |  106 +-
 meta/classes/create-spdx-3.0.bbclass         |  191 +
 meta/classes/create-spdx-image-3.0.bbclass   |  145 +
 meta/classes/create-spdx.bbclass             |    2 +-
 meta/classes/spdx-common.bbclass             |  195 +-
 meta/lib/oe/sbom30.py                        | 1121 ++++
 meta/lib/oe/spdx30.py                        | 6020 ++++++++++++++++++
 meta/lib/oe/spdx30_tasks.py                  | 1229 ++++
 meta/lib/oe/spdx_common.py                   |  228 +
 meta/lib/oeqa/selftest/cases/spdx.py         |  133 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py  |    3 +-
 meta/recipes-core/meta/build-sysroots.bb     |    5 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb |    3 +-
 20 files changed, 9243 insertions(+), 255 deletions(-)
 create mode 100644 meta/classes-recipe/nospdx.bbclass
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/create-spdx-image-3.0.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py
 create mode 100644 meta/lib/oe/spdx30_tasks.py
 create mode 100644 meta/lib/oe/spdx_common.py

-- 
2.45.2


