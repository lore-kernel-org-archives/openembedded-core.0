Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3B8CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 19:30:10 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4455.1757446209820628958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 12:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nzFKJ+f+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-251ace3e7caso46673775ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757446209; x=1758051009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VK3q+sC/86RFI926tuJAXDkAXUwsaBhRGk9L76SzTgQ=;
        b=nzFKJ+f+NkLSK12iCi921w5Z/tMiIITzucqxE+c1zUtFcIorjl2EA2LaU6q1quh34y
         6ueNXq9i8/tg1F00e6qn87WamQxXEKbuIfZDTcFa9PqHQxiRo08T6gtqMGodIxhFJVpT
         tF61QCZ/N7qYLNvs/Wx7aKH4A2/hIppT293VU7TxHQu2RXElVIqrDTbezoiawzOMLAWJ
         GzJ31Fl6bDQ8Z3G/Z4iOUvClpsYmBisaJjvOHkbCgu/el8c8P0ZdCIewyu6QpUt/fpvx
         0NtGEu3L/bblLVTY6g4E8EQELKBPXpUpJ0XyBxkvxzBTEdqL3y6jdWUTEEak1F35Ab9H
         80YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757446209; x=1758051009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VK3q+sC/86RFI926tuJAXDkAXUwsaBhRGk9L76SzTgQ=;
        b=CUCcU3p7xolNACS9bYJxZdj39zL/kV69bcAuGG285oFBhLrd+0Gm67eBeg4F3KPGHk
         SQl9O8LMsfkjFG2+tVpExpyNrVzeCciVtWsnKNmp6ZulI91nZKLisFkNuPcS0rytnY8b
         Jal7xJNtLAcqaYL2OKRVlZ9BcRL1STMlL6fvqkE+6EfsJA3FmGWVXn04AnoU6XwtQPLO
         2qO2gkKRMFL+YBVrkdgu5rJ03bGVvvlc5TOmOzthqaX641012v1zka26JT88sHL6cKf/
         73cRxM1N8Mgt3HxMDNDmiIXm6JVjQlQLBcxQbri55u/RcHe8cLGUD2ACDO5ORvj9m4dc
         7oFg==
X-Gm-Message-State: AOJu0Yz/dQzmfOun9lajYtb9i6kSV2GTSIjqKz2dZGEtGaePeEyjpiKK
	CXd7FJcmNXs7YGiQMQbrQYzLq4dU6aadzlS5e+x2xcZVl8umXDTg/e/zBJ7Ou39NlPzFCzY6lux
	eNney
X-Gm-Gg: ASbGncvAwdjYFRHz36mK04Pj9DAmqBMLN41GPJdn4Y6cjHox+OEGcebg0vA4BELseu4
	C8AH4sTEWyJOp+Tm090EiP2zjR99M6Z4WXgINSYpAT00eceU5s4RL+Pqy30NnYYn9q9LaCh51vu
	c5ZVRtu+Ppt4JlF55T1Peo1ZS+JD7brtNeFgdhBtu5EBK/nKioJEp1lqoPpdRXsE+sYVjsHm/xT
	HbsW7HDc5bgH17JfQBhJ7CeXLohKRkXu1vNCKUZTmkROcCp/NgUThG+LkAbUrrxNCc5kryEAPm0
	N15JUH1lTonLLfKh9mWvoEsj3OXbFBL/RhShitzg/WAXDHLvabvKuj/hVZ6B90mUFjBiMwBIWLN
	dZ6bxrcuVkJ5vxmHHb1JyVl4s
X-Google-Smtp-Source: AGHT+IEmmV3WGiON9wXU6AkUooCpQivJM9I9eIp4fzjiCsaL3MewkTMSRoNlG491/HxKgpBtTTfnMw==
X-Received: by 2002:a17:902:f54b:b0:24b:1741:1a43 with SMTP id d9443c01a7336-2517427d87fmr156794075ad.58.1757446208834;
        Tue, 09 Sep 2025 12:30:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c560:31a3:4ee8:6083])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2b0e5965sm5093855ad.143.2025.09.09.12.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:30:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Patch review
Date: Tue,  9 Sep 2025 12:29:58 -0700
Message-ID: <cover.1757446071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 19:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223132

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, September 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2346

The following changes since commit 71ed9d8394f7e625270ee66f9c2816bba4aa2016:

  pulseaudio: Add audio group explicitly (2025-09-02 09:20:07 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (3):
  ffmpeg: fix CVE-2025-7700
  ffmpeg: fix multiple CVEs
  ffmpeg: fix CVE-2025-1594

Divya Chellam (1):
  wpa-supplicant: fix CVE-2022-37660

Gyorgy Sarvari (1):
  llvm: fix typo in CVE-2024-0151.patch

 .../wpa-supplicant/CVE-2022-37660-0001.patch  | 254 +++++
 .../wpa-supplicant/CVE-2022-37660-0002.patch  | 139 +++
 .../wpa-supplicant/CVE-2022-37660-0003.patch  | 196 ++++
 .../wpa-supplicant/CVE-2022-37660-0004.patch  | 941 ++++++++++++++++++
 .../wpa-supplicant/CVE-2022-37660-0005.patch  | 144 +++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |   5 +
 .../llvm/llvm/CVE-2024-0151.patch             |  13 +-
 ...602-CVE-2023-6604-CVE-2023-6605-0001.patch |  79 ++
 ...602-CVE-2023-6604-CVE-2023-6605-0002.patch | 142 +++
 ...602-CVE-2023-6604-CVE-2023-6605-0003.patch |  45 +
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 104 ++
 .../ffmpeg/ffmpeg/CVE-2025-7700.patch         |  52 +
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   5 +
 13 files changed, 2114 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0001.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0002.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0003.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0004.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2022-37660-0005.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-7700.patch

-- 
2.43.0


