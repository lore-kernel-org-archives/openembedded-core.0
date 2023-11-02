Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842B7C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:03:10 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.41004.1698951783612803215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bdDtT6pa;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6bb4abb8100so1230106b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698951783; x=1699556583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0+Jv0TVybuPipa1ULtt41SfFN5eJs9Dvf6+gKs1tGA=;
        b=bdDtT6paosneEhFPdhrPa7yzU+JglnbHNvpg9lgT21wa6eq8vPglJDl17MrX514hIk
         MmW93gAjfOm6bhem5Ug6khAONjGaCxwgycRXbKK9LP1e6U8aiRhOII0iqLIabe8rWPxT
         C8+UcGy7qrJo0iKJVLCnZ9tJmqGD3cqBfeCxKkerGXUFhDIMJUTERW4hDIEQLx7lr+8K
         X0HkNA/ccjfbytxguF8eaEE4Kr5TrPT7HOe/dryNt0cvgZLM/POuSd72NLyYhVwBS75v
         EYMAdlrBAZEfmmPpy4naglXosVXmzJ0XUrlMcBkz4Yg2XpFCIcbteMrV+CnscQHsCorT
         JNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951783; x=1699556583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0+Jv0TVybuPipa1ULtt41SfFN5eJs9Dvf6+gKs1tGA=;
        b=nsBVshhWwmzYek2lCORK96Yylw4LGCn9Y/+Lg6L1SgrgXmrBXSeyMMnBukzKGOtMbw
         ZlGkCkoTrG2aJ0g/rliOqDUOzkbph9vQbhdHLFS3Qm258yUulBjjcXlyQTF6bKCou1Pl
         3KEokKMdPHSrUQDnc/WGgxwmEEVdhmDgPzW/Fi6difQcQ7iwdRo+4IzInjaOoBqDIHzr
         UMGiOQxsSV6O63HhAspvUiNi95LZPssWaZ5EIU/FA1QvVIGxdWmYH+kMw9OwpoqQ64JZ
         2XocmpGcZK2QikEp8LxhDLj6fD2EQqwaKHOfN+edu3xHMN7TrlfNmq+4B1Cm4sMY3QF1
         FiHg==
X-Gm-Message-State: AOJu0Yxagzd2KCTlGFiHzVYCyi2D8rLl/d1P506N+qLak8oDcuoMQjhr
	5J1p5RST8eQWu9djC+h3agjoHM/M8PEM+A==
X-Google-Smtp-Source: AGHT+IENOcGxO6P/v/iD2KRdpAe/i0HR/Ks3LfXtBYrWyxq0EbJPhICZKsa7vQs4Zj0MhOdAnn5s4Q==
X-Received: by 2002:a05:6a00:1994:b0:68f:e810:e86f with SMTP id d20-20020a056a00199400b0068fe810e86fmr19153207pfl.28.1698951782474;
        Thu, 02 Nov 2023 12:03:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id m5-20020a62f205000000b006c0678eab2csm100636pfh.90.2023.11.02.12.03.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:03:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] Add riscv64 build host support
Date: Thu,  2 Nov 2023 12:02:51 -0700
Message-ID: <cover.1698951553.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190091

These are initial general fixes which helps in building OE/YP on RISCV64 build
hosts.

Khem Raj (6):
  poky: Do not inherit uninative on ppc64le and riscv64 hosts
  meson: Add check for riscv64 in link template
  machine-sdk: Add SDK_ARCH for riscv64
  uninative.bbclass: Add ldso information for riscv64
  rust-cross-canadian: Add riscv64 to cross-canadian hosts
  cdrtools: Fix build on riscv64

 meta-poky/conf/distro/poky.conf               |  2 +-
 meta/classes-global/uninative.bbclass         |  2 +-
 meta/conf/machine-sdk/riscv64.conf            |  2 +
 .../cdrtools/cdrtools-native_3.01.bb          |  9 +++
 .../cdrtools/cdrtools/riscv64-linux-gcc.rul   | 65 +++++++++++++++++++
 meta/recipes-devtools/meson/meson_1.2.2.bb    |  2 +
 .../rust/rust-cross-canadian.inc              |  2 +-
 7 files changed, 81 insertions(+), 3 deletions(-)
 create mode 100644 meta/conf/machine-sdk/riscv64.conf
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/riscv64-linux-gcc.rul

-- 
2.42.0


