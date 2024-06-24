Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65389C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:00 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.151206.1719257515472540923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iTyDvN2I;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d35f1dfda2so2580642b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257514; x=1719862314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s87HPNAA0xYDfO2sl8Bah4bETU479O0bFbWYHXGFmaU=;
        b=iTyDvN2I5I1QAr94eEPraRKS66Kun3tbJnHNCCTTnSqCOsVtiXML10IyiZ57CU5xae
         z87nEhjkvI5Hs5WFU+n6BbdqDenuoWZNK2jIo0J69QGsgDh1OgqnBQ44viWRdJsWDtAb
         Or1PwQlSrlUVbnRhDViYkm+a+5vNHYmMbG2GmqtEWRxZSkXwz+iyjbkUDB9KQrWP71ph
         3YXl1J/2JTtnewMYqEsJpNufdjPcWhYE05BY9maGZ6hrymcy++VP4B4cunU5icgAtDCo
         s2Vp6uglU/E2fdKaJt/u+BKzpgnjO4xiJ5UVuGEu7dWRzMRwa7Fd7Sgr2QKIYSE9EFKI
         hjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257514; x=1719862314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s87HPNAA0xYDfO2sl8Bah4bETU479O0bFbWYHXGFmaU=;
        b=Vkg1ZweWo8r5B0i/1BvXLVKhebEkj0CXtZsAYF4I1aMgM0oHgcNuZw7kqP5vfGezmx
         TMonSB2dN5nFdOefM9OEuKbnmXKwVUNbB1BQLP8dYtStSrCZmRQjOwkrxEEVfSzpYa2F
         PZ6b0Yz5ozxzdfzH4Tl4VGgHFQOeiCrYViWFCLVadPTJj/6PJs7/CPwRD/qfD7JGlkIT
         AhSkZHEgP/4ssDwULw2kIYJNu+yEgxfJ13Fgs3FvCGOLgBc1j5LTqp9lFj2aS+F8YXvt
         YqGhXi+Ot8vnyGBZKiel51OGW8M+TaIZXeGFQ07mY6SWQhdHpaGq8gLHpqUj/10DM2um
         n0Pw==
X-Gm-Message-State: AOJu0Yzf4ezdb3NKhUTmhaS6RAyPH2LHa9w4l03eM+pvRKvAIEoN+wIY
	FsjItQILF5ig/DIh21fqP33N0n/pf7xpyqyD+r8FjugBZiGP9xRb6L9V9g==
X-Google-Smtp-Source: AGHT+IGtzmZ2GWpbZKHxba226ZeNqhb/GaqG03zBObyWmVf9c+nmvVIS5evgDD04EaXV+HqR0DkLTw==
X-Received: by 2002:a05:6808:2226:b0:3d5:3d91:a7ca with SMTP id 5614622812f47-3d541c9333cmr7813366b6e.32.1719257514030;
        Mon, 24 Jun 2024 12:31:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:31:53 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 00/10] Add SPDX 3.0 support
Date: Mon, 24 Jun 2024 13:10:50 -0600
Message-ID: <20240624193151.1645802-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201102

This patch series add support for SPDX 3.0 and sets it as the default.
Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
the same time

v2: Added tests and addressed feedback
v3: Fixed several oe-selftest and build failures
v4: Fixed silly typo mistake in staging.bbclass

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
 meta/classes-global/staging.bbclass           |    9 +-
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
 21 files changed, 8765 insertions(+), 30 deletions(-)
 create mode 100644 meta/classes-recipe/nospdx.bbclass
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/create-spdx-image-3.0.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.42.bb => binutils-testsuite_2.42.bb} (95%)

-- 
2.43.2


