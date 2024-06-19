Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9464DC41513
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 22:18:16 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.34243.1718835490166219870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 15:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cR6l6DUk;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d22802674cso107483b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835488; x=1719440288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4t4aWXcxLzX9gRctT0nrboArgE7HWAQLObvQUTkB8U=;
        b=cR6l6DUkQL2QcGfFvXZbmolRRZzmKJgvbHn4pvA9dHzKU/fRVKGrJa/6UMQkHYbZgu
         dSHUtK84LSQcHXGjvYVP26PzuRDMFcEInF0ROPzXqhCCAQrw69bdnVbBP+qkv9fFct9L
         TUJiwjKWhCP/goRyMavhuf8FZ5Bm+uNXHcSiqPur3sEon28dlvNf6VdSVXGPf/z8LH9M
         K0R5X/y/x3hqZbpIJM4CNypojEEEh6yp3vq63jAJzMt/Y5DtVOb0Yt5hM6WACzyk4gah
         U0Kgx5M8LobzbGgf9ZittfQzqwidzvEKsn+XcScFmSI4RMhwWxR6XM8N+60/HusSB7AM
         JeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835488; x=1719440288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4t4aWXcxLzX9gRctT0nrboArgE7HWAQLObvQUTkB8U=;
        b=G/UIl+pmOjCAviEjxu4TXXV8OU+ltpi5gORPBHiOJTqeO6Jj/pTT5JMuG4tTczA5z0
         mFU4bHSl99T3xX/WkphOMDJEtlle4lZSTdnT/uw5iEMFvHKqcmqA4VHmgNndeDQAqKE5
         luTgMpyOHylq64i6FDfdN6Z68aQYco/vr/4E8jIIuo/YaeM75bOG4slMg8Psl5HQyodM
         TRSw3bbNdcAl7Zb1wvNkzyXLZbYY/7z0Q9kXwo840G6I9peKHt35+uWhebLMABezTK9x
         Q4aQ6j3pJeb5t1jEqEmdBx2u71OCpwiteySvoyua6cJfV1otEb1HBg6HLjuASod3tYPl
         uc2w==
X-Gm-Message-State: AOJu0YxiB51J1WsCZEfKvU6TDWjHJ7CQDx8dPgpooqQDj/wTqxuA9SKr
	+0gNjDJTZiQKM8c7AWjNHkA3Zn9ENPJ4WYYfE8fgAlPwuMhMsXCRCfH88g==
X-Google-Smtp-Source: AGHT+IG+O5v9g8JSRu6TK1WPb95qc/jWBbZkI2Dsmzq1evba6EtmMi8zpXR7k824q2iA0kBJciPZqg==
X-Received: by 2002:a05:6808:1a11:b0:3d2:4684:e9d with SMTP id 5614622812f47-3d51b963beamr4617984b6e.9.1718835488275;
        Wed, 19 Jun 2024 15:18:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4189])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2475e5359sm2321190b6e.3.2024.06.19.15.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 15:18:07 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 0/7] Add SPDX 3.0 support
Date: Wed, 19 Jun 2024 16:13:22 -0600
Message-ID: <20240619221805.3038528-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610214456.2757397-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 22:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200929

This patch series add support for SPDX 3.0 and sets it as the default.
Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
the same time; users may choose to specifically use SPDX 3.0 instead of
2.2 by doing INHERIT += "create-spdx-3.0"

v2: Added tests and addressed feedback


Joshua Watt (7):
  classes-recipe/image: Add image file manifest
  classes/create-spdx-3.0: Add class
  classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
  selftest: spdx: Add SPDX 3.0 test cases
  classes-recipe: nospdx: Add class
  classes/spdx-common: Move SPDX_SUPPLIER
  Switch default spdx version to 3.0

 meta/classes-recipe/image.bbclass            |   58 +
 meta/classes-recipe/image_types.bbclass      |    2 +
 meta/classes-recipe/image_types_wic.bbclass  |    1 +
 meta/classes-recipe/nospdx.bbclass           |   13 +
 meta/classes-recipe/packagegroup.bbclass     |    2 +
 meta/classes/create-spdx-2.2.bbclass         |    8 +
 meta/classes/create-spdx-3.0.bbclass         | 1116 ++++
 meta/classes/create-spdx-image-3.0.bbclass   |  203 +
 meta/classes/create-spdx.bbclass             |    2 +-
 meta/classes/spdx-common.bbclass             |   32 +-
 meta/lib/oe/sbom30.py                        | 1118 ++++
 meta/lib/oe/spdx30.py                        | 5996 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py         |  119 +-
 meta/recipes-core/meta/build-sysroots.bb     |    5 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb |    3 +-
 15 files changed, 8654 insertions(+), 24 deletions(-)
 create mode 100644 meta/classes-recipe/nospdx.bbclass
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/create-spdx-image-3.0.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py

-- 
2.43.2


