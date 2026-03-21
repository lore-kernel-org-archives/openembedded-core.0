Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4771094477
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 13:18:36 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10728.1774099110764553524
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 06:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+cPRwRD;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso12788035e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 06:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774099109; x=1774703909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQBrRUbNkSUt6jz7Ei1z/zsrfERFjUVh3nqdkMGlFck=;
        b=Z+cPRwRDTkQI+VeCAgRbcOMFmk+4SWGATKba+ThAkCJElgLtV5a/QOcoNnAbg8lwbx
         nft01qjuDEKZGznsoXazDUWLXeWpsnR3NGTSG5MU7iwNc9TrS2aoPUGwZhWp99i+hzgu
         8ylkC2QQ7/xGq9PDcgKpjTYDKn8J4zIZYOJjfbVG8G5ujeT1pHbDNnOXET24yXwHJ9im
         /GNDtiK7qznQ1tO5+/tNdAPsGhwMWlPjS05qGtR/qxuZG6RoETTivnWIXu2+T1C6T4Pj
         1CAdtEzrP8N5aStPEyMXvgT4e8iLWWRwkyAKZM0e+WeVkVdZKgICyq/ryVMrzPzfQl7i
         HRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774099109; x=1774703909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQBrRUbNkSUt6jz7Ei1z/zsrfERFjUVh3nqdkMGlFck=;
        b=juH/Uig41RXLsHmhmHOeY//5jAE5Yjcna2oVSXJOV2i6cuvT5GAbLGpcpuThbCJwUA
         qAwIxz9CE1G17UYmELilpo5xM8qeS43i/nlPgtwESPimPPytwyQcyGnpqONq7fytEFht
         8XV0RPDSFZjQ/t3bzWhGe4wiYHnVCQPXPTwAmtzNBk3875E+YuEwH01m3WPxGlGqnTNo
         kBrXOilQ/n1qy6HKTHGjz8fniEZsK+EQeIN01IGMUtxlja1WUJ4WybF5bdldHUnkz8nj
         nBa6NSXEsoXDAtBt46oXfbgUdrm1CEAqpgQ0GJ3ly0P5A9+CXy3LFVNP1FADNZn/z8Xr
         1Pwg==
X-Gm-Message-State: AOJu0YyDx1RMptHVz51T3k5kmUDZivk8goSYgsMsUvPVRF+Pm7apoPiJ
	jVa/Cb5fSmFe2dF+w7OPTy/t+cZtlrHJsr2M5P5fwGsCHepW6P+lnxf+0MYsdHLG
X-Gm-Gg: ATEYQzwHueiEvQlm8zbdARyOs1JppHGxp9dRfxn9ltYq/HPu+UwQSgy4rT0lt4nOdAh
	UqSEmomShNE7wuqEUWoEyTfL7tDcOSneWNk4Fr86Q0Z7t1gWAuyQ30nHmpCCfPDbnocR34m85wO
	uWau5K9ooKTWOc+vr3C6Q6MMkqNvHOl6/SJZr8w3m4qG+2LkAesKJ6F9XwZOPSjvWm+9fffkvMg
	BfDpFaYa3ekF3G57o57CEpl/ieEDMYmsWDCJ+LJxIDvXVfzcjFl6849U5+s0x2qRQDraRWmiukv
	uHyNRYS68TkWjZPODnt18c7XaHGcgNYhIEPZWbF3OOn9mKv66my+nkn5nu3+qdi99TaG4gh/VWR
	l4A75/v0fvbh8L/GeQQxJR9VR0uVnFYe9Js9fTkBjTUP82fDMPI9uU1yiQ34G7DVxaouKuo1hlA
	s6skI5kgdMmcB0VOdr4qVpLh9onyqxdaMRXYA=
X-Received: by 2002:a05:600c:4714:b0:485:3bc7:a231 with SMTP id 5b1f17b1804b1-486ff01f1d0mr94304255e9.29.1774099108559;
        Sat, 21 Mar 2026 06:18:28 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm15004285f8f.14.2026.03.21.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:18:27 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v11 0/4] SPDX 3.0 SBOM enrichment and compliance improvements
Date: Sat, 21 Mar 2026 14:18:22 +0100
Message-ID: <20260321131826.1401671-1-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 13:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233657

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This series enhances SPDX 3.0 SBOM generation with enriched
metadata and compliance-oriented controls for current master.

Compared with v10, this series has been rebased on top of current
master after Joshua's related changes landed upstream. The merged or
superseded pieces have been dropped, leaving the four still-relevant
patches below.

Changes since v10:

  - Rebased onto current master.
  - Dropped patches now merged or superseded upstream.
  - Restored the current recipe/build SPDX task split after rebase.
  - Updated the remaining selftests to use the current builds/ output
    paths.
  - Revalidated the source-download enrichment tests requested by
    Richard Purdie and Mathieu Dubois-Briand.

Validated with:

  oe-selftest -r \
    spdx.SPDX30Check.test_packageconfig_spdx \
    spdx.SPDX30Check.test_download_location_defensive_handling \
    spdx.SPDX30Check.test_version_extraction_patterns

Stefano Tondo (4):
  spdx30: Add configurable file exclusion pattern support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Enrich source downloads with version and PURL
  oeqa/selftest: Add tests for source download enrichment

 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 +
 meta/classes-recipe/go-mod.bbclass       |   6 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   6 +-
 meta/classes/create-spdx-3.0.bbclass     |  17 ++
 meta/classes/spdx-common.bbclass         |   7 +
 meta/lib/oe/spdx30_tasks.py              | 279 +++++++++++++++++------
 meta/lib/oeqa/selftest/cases/spdx.py     | 104 +++++++--
 9 files changed, 345 insertions(+), 95 deletions(-)

-- 
2.53.0


