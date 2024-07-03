Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48682C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:06 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.51049.1720015265569139652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iFll4/+t;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7f3cc78afb6so182976039f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015264; x=1720620064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIvDOH2lxHSp8zEuRTUWPpdR+US2LI4fsfA7VYjBL4Q=;
        b=iFll4/+t4AKEet8FpxGVmYh74vzrNtGwpN+pzu7QgC4cVYjh2+aNYwNWQfPnE2Bf7S
         x9qUyqfIoiMNTyHOISnplAMoojWOA0JVY2+pt6nnxrpEeIQimuZWYl+MmmL441V7ZgzV
         qLs8s6X5JIrVN/EuAUPhLKv4a8WhoUvHrPImxxRyaKA39+OsoXs5z97ueD3VpGFOkLgF
         6KS16fnI8ZAv13ZzwsSbH5Hr1lWVlaaamohWtRDFsLIv5K833KmAxikiYCd8QZgzqXCh
         1zsg9Sg3q+ZrkAW4da5z3zRif2MaKRzCG5bWta8XwsQHeK/APR8z+k649pnCttKCeuvz
         qHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015264; x=1720620064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIvDOH2lxHSp8zEuRTUWPpdR+US2LI4fsfA7VYjBL4Q=;
        b=mWQ/bPrcfg4dI3Ug0dnbMr/2CjOnCGcuiX+pzT53o0jsFL2WsFmuGibJxY6Gz5egNp
         en3PzjRJ71rKYCyun1O07W93CvDbwSr+nkgrebjh6WyufE+J+iWCzZI0UeNIjtCdY30X
         l/841diFzK5d510vCYtLZAwV6GMsYUJ9SawlFqNXz5hIkRbG2w2EYWzPUK1aSuP0FhgH
         Ip7x7OchcvKLS3waEyHlrINKQtYtbR8f8l7xOMIdCFCVBmxpjNzPf4oIvyxYVSFAWsK6
         dF1EDXQbleyPE26V1gB0fhdgKv0WfMAcjGe8dILEwbH8ZHZ29m6mg/OJq3KM6psxGLsy
         yrXw==
X-Gm-Message-State: AOJu0YxI9Jc9Utgc/hyAaCHmwiRzLCbX/bqw5++0IsWYu5W43hNNZzTt
	lTkiYjOxrAJyLluqSd7wQvipo9qSVgktVJXlq4VmmO4FdpTJyM8o+1xDKA==
X-Google-Smtp-Source: AGHT+IFuQUMGQzOqQoCh42y+RGEiJlaMfh7igyNmR0MNt9rV7z6vBtlVwgiFSb27b4RwszrH/+Uj6Q==
X-Received: by 2002:a05:6602:88e:b0:7eb:cc55:af1d with SMTP id ca18e2360f4ac-7f62ee62429mr1146609439f.12.1720015263536;
        Wed, 03 Jul 2024 07:01:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f949])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb742f1e77sm3407500173.179.2024.07.03.07.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:01:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 0/8] Add SPDX 3.0 support
Date: Wed,  3 Jul 2024 07:59:15 -0600
Message-ID: <20240703140059.4096394-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201480

This patch series add support for SPDX 3.0 and sets it as the default.
Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
the same time

v2: Added tests and addressed feedback
v3: Fixed several oe-selftest and build failures
v4: Fixed silly typo mistake in staging.bbclass
v5: Reworked to make SPDX 3 output reproducible by default. Variables
    that introduce non-reproducible output are documented as such.

Joshua Watt (8):
  classes-recipe/image: Add image file manifest
  classes-recipe/baremetal-image: Add image file manifest
  classes/create-spdx-3.0: Add classes
  classes-global/staging: Exclude do_create_spdx from automatic sysroot
    extension
  classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
  selftest: spdx: Add SPDX 3.0 test cases
  classes-recipe: nospdx: Add class
  Switch default spdx version to 3.0

 meta/classes-global/staging.bbclass          |    9 +-
 meta/classes-recipe/baremetal-image.bbclass  |   32 +-
 meta/classes-recipe/image.bbclass            |   58 +
 meta/classes-recipe/image_types.bbclass      |    2 +
 meta/classes-recipe/image_types_wic.bbclass  |    1 +
 meta/classes-recipe/nospdx.bbclass           |   13 +
 meta/classes-recipe/packagegroup.bbclass     |    2 +
 meta/classes/create-spdx-3.0.bbclass         | 1231 ++++
 meta/classes/create-spdx-image-3.0.bbclass   |  224 +
 meta/classes/create-spdx.bbclass             |    2 +-
 meta/classes/spdx-common.bbclass             |    6 +-
 meta/lib/oe/sbom30.py                        | 1138 ++++
 meta/lib/oe/spdx30.py                        | 5996 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py         |  118 +-
 meta/recipes-core/meta/build-sysroots.bb     |    5 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb |    3 +-
 16 files changed, 8819 insertions(+), 21 deletions(-)
 create mode 100644 meta/classes-recipe/nospdx.bbclass
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/create-spdx-image-3.0.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py

-- 
2.45.2


