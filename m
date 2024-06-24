Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2980C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:22:52 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.143609.1719242562625330929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KCvHZ9oz;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c9d70d93dbso3011683b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242561; x=1719847361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBkWdPerksXNepRjbLludNrrxOns72IYF35/Y99Ol9I=;
        b=KCvHZ9ozQ1j0eY+AqkoGBCBkQ8P7SASXkM9ojJgAhsdKHdPeFPGrVCNQh8gsw3tgk0
         hA3I7m3zP0u1oG0/OYJhACngrZ3lkrwwwyc1xxWm7f3W/letDuSVo77MdIbDqOoaH+yr
         X+hJfuBmxqa0RHdvRZI48FOcdVXTumcdYrPoc3SION7KKvSPzieWrkITNoo60POZV+2m
         EEy76V5O/2zSymXDaufdnRGRJb+uBdru7rPdaQCRYCo+WNyWpPTyG/y9TA+yl1quZxTu
         VFJfY3LhPz9nfCSEUQXB98b1rpsy13VlkT3NomAiorlmuzlEdT8HsbkrWmiZ6uGa3HcE
         qHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242561; x=1719847361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBkWdPerksXNepRjbLludNrrxOns72IYF35/Y99Ol9I=;
        b=vF0KgQ6WNji02QRFVrTQfhc7dY9rLYZiHN3BJb6edTTewpILkQda5h2R7b1yez3d0P
         tsy2lRsKZNp6kFfzhszPrJLh/85B6GnK7JhhkJqU1557mslVtrBNKU9lsHQCKb/ISZFz
         XFh1a57Afgs52iLCnyD9LXAV8oDAxymU+eYaM4y45/dBzhIuRS99eCJduy0owHC8y+VR
         PLvbo11mcW1IUXEjwimMYGCNl3A6WQye3wikpleI6WhoyacBr26514gMWChqCMb7+0cD
         axD6wDpK1jfUUf9/m9v2aMuv+1Y46JjWQbhv2uCPojk6aHvjIkNbATsHNy8E3IM28z5C
         tToA==
X-Gm-Message-State: AOJu0YwYiHg3zNEbJOEsdMY6C6s47j4eivg4PwzhLAPciEP3eTm2tbr3
	Ss03+YRWXCKUD/we0pJtULxteimQ6rKtcTNii0SjJc8dwjTznntF7bET0A==
X-Google-Smtp-Source: AGHT+IGOOXRtwQVG1y34pWJl63R/B1LZlvXL9J0ZMrR6hIQJPwO7mGNLgf6ocL7OnCCzkQ5k2+TvEw==
X-Received: by 2002:a05:6870:c1d2:b0:254:85c0:c70c with SMTP id 586e51a60fabf-25d06e29649mr4808866fac.40.1719242561165;
        Mon, 24 Jun 2024 08:22:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:22:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 00/10] Add SPDX 3.0 support
Date: Mon, 24 Jun 2024 09:20:29 -0600
Message-ID: <20240624152236.1019980-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201090

This patch series add support for SPDX 3.0 and sets it as the default.
Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
the same time

v2: Added tests and addressed feedback
v3: Fixed several oe-selftest and build failures

Joshua Watt (10):
  classes-recipe/image: Add image file manifest
  classes-recipe/baremetal-image: Add image file manifest
  classes/create-spdx-3.0: Add classes
  classes-global/staging: Exclude do_create_spdx from automatic sysroot
    extension
  binutils-cross-testsuite: Rename to binutils-testsuite
  classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
  selftest: spdx: Add SPDX 3.0 test cases
  classes-recipe: nospdx: Add class
  classes/spdx-common: Move SPDX_SUPPLIER
  Switch default spdx version to 3.0

 meta/classes-global/mirrors.bbclass           |    2 +-
 meta/classes-global/staging.bbclass           |    6 +-
 meta/classes-recipe/baremetal-image.bbclass   |   30 +-
 meta/classes-recipe/image.bbclass             |   58 +
 meta/classes-recipe/image_types.bbclass       |    2 +
 meta/classes-recipe/image_types_wic.bbclass   |    1 +
 meta/classes-recipe/nospdx.bbclass            |   13 +
 meta/classes-recipe/packagegroup.bbclass      |    2 +
 meta/classes/create-spdx-2.2.bbclass          |    8 +
 meta/classes/create-spdx-3.0.bbclass          | 1179 ++++
 meta/classes/create-spdx-image-3.0.bbclass    |  224 +
 meta/classes/create-spdx.bbclass              |    2 +-
 meta/classes/spdx-common.bbclass              |   13 +-
 meta/conf/distro/include/maintainers.inc      |    2 +-
 meta/lib/oe/sbom30.py                         | 1122 +++
 meta/lib/oe/spdx30.py                         | 5996 +++++++++++++++++
 meta/lib/oeqa/selftest/cases/binutils.py      |    2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  119 +-
 meta/recipes-core/meta/build-sysroots.bb      |    5 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb  |    3 +-
 ...ite_2.42.bb => binutils-testsuite_2.42.bb} |    3 +
 21 files changed, 8762 insertions(+), 30 deletions(-)
 create mode 100644 meta/classes-recipe/nospdx.bbclass
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/create-spdx-image-3.0.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.42.bb => binutils-testsuite_2.42.bb} (95%)

-- 
2.43.2


