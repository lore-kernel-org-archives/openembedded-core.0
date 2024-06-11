Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA4EC25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:26:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.5275.1718097972503946657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNL0vY0e;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57a1fe63a96so6986731a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718097971; x=1718702771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sbZShJFucEibjSldYr1JGH2/Bdlqj727ucEAAGmerSw=;
        b=SNL0vY0e43uznE3cCM+FDyCLm3I89Gaara/DOEVYENd81VyrXofXD9vJt1iYpIBIlZ
         1Yn4AE1vazSlqQ6w4U8CXJBVsQs2HGReqvlto9j6KXwemJ9TZZoq4TWwYVFQF0k6PKFW
         ZK2qbAlF9w7jjuapa7NLvduHGEwwAVWxEeiQXJLAM1KSjiWfwg01LLNx6Po3VdER+qFF
         KE9hs9Mswae8VsiBk2OZK89wUunpEYs4Jz745m7b52uSb8HASvnZgANljcqjYADTBfhh
         qchWfBT6r2oarB1qlHJgrmwYCspnZ5v5VbggNGkawFjXHqHUef+yosxESJRfZnjbccAT
         a+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718097971; x=1718702771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbZShJFucEibjSldYr1JGH2/Bdlqj727ucEAAGmerSw=;
        b=RlwWjagaQ551MTI0LSCRXT6MbJQNmBA39l6ssjGL75bYtoJWFoZXdGNy3dOnnb93Ke
         ockeysZc7zYqmEpGU6etCOLMkmsvICuNfoWtDA0B3DP/ZX6EBmw5q0et8j9K+IHhgnKc
         xZCpiv6aWIyJMF9V+SZ7KaSF3XpDj3zU9alrvmxdwC8uBJ/IIXsqefwLx6D0FM6BHtjv
         pdNsk+bRBtEVUtETqQfZ74cwfgterPQuLXPMDZlv7pi9imwBoA7Ppb+VEYsJLF/2fmcn
         YstNd9M3Pzyv/tJS6N6RLWpLdHFTW3vmaQyUYO53iTv/NjVPhiG8tv5S26rXWl8W/w+z
         1nPA==
X-Gm-Message-State: AOJu0YzbT0N2daYwhjPD7DEJ6Fj6U78z50tS6NtKQ5MSKWLkFF2V6CeG
	kwuU5jYeBqnqCukRcDsjOs3egV8UI1A5OnYzaTckvzZxhQEU1NnwaXnbs0APh9I=
X-Google-Smtp-Source: AGHT+IHsptxysWDQpI+bdYOQFLSAqMd8oBFly/PJIwfYEs5hZFZH5sKKVZuA1OsELZqcHoxtQwHgHw==
X-Received: by 2002:a17:907:b9da:b0:a6f:11a4:a451 with SMTP id a640c23a62f3a-a6f11a4abd0mr403712066b.46.1718097970603;
        Tue, 11 Jun 2024 02:26:10 -0700 (PDT)
Received: from an.. ([2a02:810d:640:170::d5f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6e23c9f22asm570173966b.171.2024.06.11.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:26:10 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH 0/3] Improve the install-buildtools script
Date: Tue, 11 Jun 2024 11:25:55 +0200
Message-Id: <20240611092558.513238-1-an010@live.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 09:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200497

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

This patch series improves the scripts/install-buildtools
script by removing the validation with the md5 checksum,
fixing some harmless error logs and updating the default
version to 5.0.1.

Aleksandar Nikolic (3):
  install-buildtools: remove md5 checksum validation
  install-buildtools: fix "test installation" step
  install-buildtools: update base-url, release and installer version

 scripts/install-buildtools | 47 ++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

-- 
2.25.1


