Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED145C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:51:05 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.67701.1698317456937402445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSjpZXpL;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32daeed7771so486637f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698317455; x=1698922255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Irhqh6jUh+Zh8li3Eoliz//28gTnnELLLLW1pgBT9Tg=;
        b=KSjpZXpLutuU5H4h+izCfNCbKv5gmjqLfW6c4tI1Jx7QpMBjV6VeA9GkkyFJ5ppwFR
         8bDvldSy9beAbzc+4TRk3kebt1hOaNGX61xB54F2eMPKIIUCEGbZ8FPUZYlQgvA3PImL
         BqXY3HI0gQfcE9y+nroZLmBLnvBQnerq57QpaGF/kRknTWGJv0uUA4ZkihkDlG4rMQQ9
         BMdE3VOhVbFyLRVD5IKH2cHk4xQNJxh9qMUbGtmZrFxuKlL9AaKzxymDP5QJyow1+Ohi
         WHBLFfeefwFBzv1shMMSODUgbUvU703pLWCuiraqjbTpIg8k65w6YfLf0eW8w/MYMnDp
         6v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317455; x=1698922255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Irhqh6jUh+Zh8li3Eoliz//28gTnnELLLLW1pgBT9Tg=;
        b=jmRTjQxhrR6s1CtnYJ0mwhV82QLUH4Ed+TDqCiaZIj7yKgksGtHPPULkNHVk5sc/jQ
         OBsHqp7kDIyr/kscFRUYUoES7LKDRbvRgRh34taON84T8R02nYPfFXD/LJreE6phPM37
         dpiaDFxPYHTjVT9pZpYtDQ98Vn1bVeYj3v3GuVWoBkNz5E3gpTPeHU9nec3PsY/iODEf
         2MVgqh/NRWJIc0h/1HoOJ9MEdZsWWnp7I9FVMLQ6k744/Mfu5/tRT33VNu8yhSReJaHm
         ZZ/7061kkZKRVigbWwkb5/NuxVllD8DfoaLXCEwjYJXCddlXYYGhQQ6uUcboDC3U6o2k
         Ft5w==
X-Gm-Message-State: AOJu0Yyto9de3rX0c05z/QsqRgp8R385IefE+pWgDz7iomjP62CPYJYG
	xlpjf8m1K0Nuiud9Q+A29gG8Y9+c/cBzKQ==
X-Google-Smtp-Source: AGHT+IHuXX97O3IMdu9TixEzribCxPMeFpl6NVogmV+/jikPWhgRvQE4aiJoy+NhVVyG2met3qRm8Q==
X-Received: by 2002:a05:6000:713:b0:32d:a495:a9b8 with SMTP id bs19-20020a056000071300b0032da495a9b8mr16993686wrb.48.1698317454459;
        Thu, 26 Oct 2023 03:50:54 -0700 (PDT)
Received: from localhost.localdomain ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id f1-20020adff8c1000000b0032da75af3easm13936004wrq.80.2023.10.26.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:50:53 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [RFC][OE-core 0/7] SPDX3 Proof-of-Concept
Date: Thu, 26 Oct 2023 12:48:40 +0200
Message-ID: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189711

This patch-set adds a proof-of-concept implementation of the upcoming
SPDX3 standard to the SBOM generation of the Yocto Project/OpenEmbedded.

The current code delivers an equivalent of what is produced for SPDX2.2.
The standard has not been released yet, and there is some specification
work in progress still. Our questions and open points are available
in the README.SPDX3 file.

Also, this first RFC delivery will be followed by another one with
SPDX assembly and the Licensing profile.

Louis Rannou (5):
  create-spdx-3.0: copy 2.2 class
  oe/spdx: extend spdx.py objects
  oe/sbom: change the write_doc to prepare for spdx3
  create-spdx-3.0: SPDX3 objects as classes
  oe/sbom: search into json

Marta Rybczynska (1):
  README.SPDX3: add file

Samantha Jalabert (1):
  create-spdx-3.0: support for recipe spdx creation

 README.SPDX3                         |  42 ++
 meta/classes/create-spdx-3.0.bbclass | 878 +++++++++++++++++++++++++++
 meta/classes/create-spdx.bbclass     |   2 +-
 meta/lib/oe/sbom.py                  |  37 +-
 meta/lib/oe/spdx.py                  |  30 +-
 meta/lib/oe/spdx3.py                 | 385 ++++++++++++
 6 files changed, 1364 insertions(+), 10 deletions(-)
 create mode 100644 README.SPDX3
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/lib/oe/spdx3.py

-- 
2.42.0


