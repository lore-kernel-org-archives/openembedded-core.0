Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC61AC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 20:46:15 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.56028.1679517968991405364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 13:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SqsHIcPB;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id m20-20020a9d6094000000b0069caf591747so11096154otj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679517967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQx/ptCAmkgG8FMcIDH9O+G2IF/60px3YwvzUf5H4zQ=;
        b=SqsHIcPBHlWzjuwZM5DqlLPbBiUvO2ZlAs1NV7bPMjzVJVZRyQKzrK0+vYK7zeYqQr
         kS4aABotUG9DF5m2vpmJuo7wnSVkgGZXgP49pUXZ+mYaT8Vw8DSmeF5zqfEwqsA5ELuY
         gIArA0p+gFFHAltmh8uNRsPoqsQNvckSZ+bWGuoXK3C6bHzopR6txDGx/fDmAI/7kKtb
         Tc1wJTVtay7tyFIMAFahxgLZIiPTjz7FzJXq1N8H1kXR3zc3Z/4YKu56g4LyMPU2Dlgi
         U5AbPUFnRu9UVm3j0hbfEUWOT0XrJGNb7QUDZ7VTWwn17egPLUz8ZRM/DQmHbPKKCXuT
         jfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679517967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQx/ptCAmkgG8FMcIDH9O+G2IF/60px3YwvzUf5H4zQ=;
        b=awoA9Q3UkAt+eqGu/3JWtMrqh8bnoSBA4BsX8cf+/6E3ZCtdKFAZeX/SnPoGUWSLHT
         uwN5SVduOCrg4cL/OJ8dqz9+E6J1MRAyHj/HYADAoyDKUJ+CGb1p/kSULq7ERcpKSVHS
         JpENqW4Iz1m40Ejj1brPancYhoDEJIjmLuQvqcQguYPXaFlwcSCma9DvFHN9pHGfCXCK
         CGWL31deafdDiyrZe7p8K7Eqwse/xNrGhHX+pmoUu420H/Gr7RFp16wRcx5YhNZLvd0/
         ahWWAhaSCTAuRyRGznpdYCHRphuMwkJiQmAWM+/Y2DcgGOowf0Ahq9TZeJo1GeXae6ii
         P8Aw==
X-Gm-Message-State: AO0yUKVUOAjV2By+P4CsIWidsCm8PC5DzZC6iGYpJMmP8Ij9OieZvuhQ
	Bn0Nd+2vAnZPk/CnEvj3NEGqr14lEVc=
X-Google-Smtp-Source: AK7set8Ks4wpMVvdYYt5VpDAYXpIsdt1xLRlxD6bYqR5ALcoA3tCjuOv+gMsrcZwi+KJUXimk803eA==
X-Received: by 2002:a05:6830:3a83:b0:69f:9b0f:91d1 with SMTP id dj3-20020a0568303a8300b0069f9b0f91d1mr1395088otb.8.1679517967698;
        Wed, 22 Mar 2023 13:46:07 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y21-20020a0568301d9500b0069f87d2ae09sm2288561oti.54.2023.03.22.13.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 13:46:07 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH 0/5] Backport SPDX support
Date: Wed, 22 Mar 2023 15:45:53 -0500
Message-Id: <20230322204558.1386634-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 20:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178956

Backports support to creates SPDX during the build from the master
branch, with a few changes to make it compatible with dunfell.
Primarily, the SPDX data is compressed with gzip instead of zstd to
prevent needing the zstd host tools on the older distros supported by
dunfell

Joshua Watt (5):
  classes/create-spdx: Backport
  classes/package: Add extended packaged data
  licenses: Add GPL+ licenses to map
  create-spdx: Use gzip for compression
  classes/package: Use gzip for extended package data

 meta/classes/create-spdx-2.2.bbclass | 1067 +++++
 meta/classes/create-spdx.bbclass     |    8 +
 meta/classes/package.bbclass         |   39 +-
 meta/conf/licenses.conf              |    7 +
 meta/files/spdx-licenses.json        | 5937 ++++++++++++++++++++++++++
 meta/lib/oe/packagedata.py           |   11 +
 meta/lib/oe/sbom.py                  |   84 +
 meta/lib/oe/spdx.py                  |  357 ++
 8 files changed, 7507 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes/create-spdx-2.2.bbclass
 create mode 100644 meta/classes/create-spdx.bbclass
 create mode 100644 meta/files/spdx-licenses.json
 create mode 100644 meta/lib/oe/sbom.py
 create mode 100644 meta/lib/oe/spdx.py

-- 
2.33.0


