Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80525C77B60
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:45:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.29126.1680191099474157319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e5lp/TUB;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id r29so19528186wra.13
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680191097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2rvZKIo6ljP2FJr9gF+wtd0ilLm6uWI5oXcYmI29KM=;
        b=e5lp/TUBC9SK4hYybtDPyHpVEDxemP42+Do4LEaWukJd7XLDpg7eXsv2jDKhG+O7yB
         0ptEWM8VtYD/R/R54l9TnM3MKvBQcbPmQ0PDl1vOHcmA4IgayOO6XksFnu1KWRLl0jAr
         f337zXE82condERKbKo9zGudhj3vrByUBUZZzqdO06tzcM9dpDvISYv/IoSn3CvPduhb
         W7hCMDmemSU5Ra2wAhQ+yum2X6wRfuuu72Jr+0MudaaJ1Dc6fHE+tpMeVh2eD6216Grn
         ojp7JA9IttiF75TopmidfclHtmY4xZ44SVZjiq0IZ4bl6VamniVcKIfPlxsu/pVRJVc8
         kwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680191097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2rvZKIo6ljP2FJr9gF+wtd0ilLm6uWI5oXcYmI29KM=;
        b=wyq/SzG+9gXWqgjpbX9MT9xGPao5NrkZZ/HQYUJ3f54ixAPe7eCzhL0fvNzHRhDixm
         jHTmBSTgs4Et/aZs9aKFMXnU2Z9jsbCXbPTT2n7o0IM6YvrvSX18sEig9gRLpkMLUkPy
         VwXtfEfb/tBvk8MMi/jgm3pXEgY3ei4HX6obWMPJznEV7HveMRR3tWVbC73kXQDtNYb9
         krdspAD2m6fy+xiienDext8B20CB3DZi4chMMn3vV1vaDvIBYuzxP1BJPtUSqK/lQuj9
         PaVYWYNs970rwDaL+ywqB8EQS78uGa+PFw9oTSYeGnmiM5/NwYfborklv2DiDpKbeS3L
         RvrA==
X-Gm-Message-State: AAQBX9fcnVvLLyr5SVUZh9GHSkgKNgsEF80JRdPzj0jM+RKjukGRMq1V
	Z3jBJi7Lhiyvw0cdkXI1cr3USzQZ5v8=
X-Google-Smtp-Source: AKy350ZttbXi49NRQYioO0gEGsnDS/Aefiwo42KDjXlXpfrMGV6ea4+ltAtw2Cgsk80uwgH4+7yYrg==
X-Received: by 2002:a05:6000:114b:b0:2e4:cbef:9f2a with SMTP id d11-20020a056000114b00b002e4cbef9f2amr2405368wrx.2.1680191097165;
        Thu, 30 Mar 2023 08:44:57 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:c898:b1f6:d5c7:39c5])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm33151056wru.89.2023.03.30.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:44:56 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V5 0/6] Extend cargo based recipe support
Date: Thu, 30 Mar 2023 17:44:47 +0200
Message-Id: <cover.1680190966.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 15:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179337

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series brings the support of local git repository inside
a cargo based recipe.

It also enables devtool capacity to such a recipe along with
an example of recipe and a new selftest case.

The following changes since commit c3fe173d5196506d89aa464ba56aabcf581a60db:

  oeqa/selftest/cases/package.py: adding unittest for package rename conflicts (2023-03-30 12:32:26 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-git-and-devtool

Alex Kiernan (1):
  cargo_common.bbclass: Support local github repos

Frederic Martinsons (5):
  cargo_common.bbclass: add support of user in url for patch
  devtool: add support for multiple git url inside a cargo based recipe
  patch: support of git patches when the source uri contained subpath
    parameter
  meta-selftest: provide a recipe for zvariant
  cargo-update-recipe-crates: don't walk on the whole dir

 .../zvariant/zvariant-crates.inc              |  268 ++++
 .../0001-Tweak-zvariant-crate-config.patch    | 1292 +++++++++++++++++
 .../zvariant/zvariant_3.12.0.bb               |   26 +
 .../cargo-update-recipe-crates.bbclass        |   12 +-
 meta/classes-recipe/cargo_common.bbclass      |   33 +
 meta/classes/externalsrc.bbclass              |    4 +-
 meta/lib/oe/patch.py                          |   57 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   93 ++
 8 files changed, 1765 insertions(+), 20 deletions(-)
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb

-- 
2.34.1


