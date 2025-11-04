Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2B3CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 04:34:20 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10893.1762230854754036165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 20:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tv4ZT4iN;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b9ef786babcso949286a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762230854; x=1762835654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfVwwanjko1618iqnhqXF03qqMReQy5VkHivoAT76MU=;
        b=Tv4ZT4iNu6exq32B6kU2X030LGxHrDp9E24g7GkKtNM5eGbIYd4xKLO6t/M3Za/xn6
         TUOEWvxP6+tR3PYWVgsN7AC852CfPPjmTxhSBt51kRu9aG0Gjuf5m0nSca3zJHrwgEdv
         e4l/n56Zy5JDEPMluS4TbrgSfJalfMr9fr//w0ScmbuInzTc8VnVF2uqFmNa1vIjqVko
         NBu2TM2njbgRdC9GcoASzviB9y13zU60B2a/dAfH2UkpJRHrLpKkmCml+dbu7jwD2a+5
         I1iYH1Qgo5cR/+9W0vizOgI4dVBNVuPgJRY/pE9p/PrIiF24EryZF8DcD24qdL2swIxa
         J11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762230854; x=1762835654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfVwwanjko1618iqnhqXF03qqMReQy5VkHivoAT76MU=;
        b=wJti5kIA61sltqZZ8VPWhKELRZxX5k7K5V8G5PJXonVmXeLkWz9/xv0+Lpromc+eTv
         LqiBUZVQy7bDvBu8+O7h94NxAvoL3yXvfT9Cn12fmEwDu4UEvajE5m1cmOlUiSfKiV2N
         tpZUt9cMOXHp3oiXoLChzGOuGQ2HJdydpL/S5w6ieZmPumsGycZPFXcyL8UsreWK25r/
         Ym/ewkniMr9TtybFxtL+2vUW2zD5y/B8P3mZOkZQC9cAX9IVFJa0ujwn74+IBtS5c/GK
         J/5pYIx+ISV/PG/WKf4RgJmYsNyelP9XApkPySoEaX0WoFVEx1l36ifi9UH23gSx6eeC
         G+7g==
X-Gm-Message-State: AOJu0YwLC5/PnZq1dAV0kWxYkAbSzIUQcbncsPw/fkAzXQ5VK8zeS3LO
	tVyHYJA7MbrXfs+TraoEOusIGMm3TtKQdZZK+ly/NBgtrC5RCN2OU3bvQs9kmTZ+
X-Gm-Gg: ASbGncsP1EsFgWYYr78jbTwZr4fdcwuec5jDIu6QWsGVo7Ton9tTQZxzN2fYeShm66o
	OPIN4ZrWsi3+0y3VNsHS0hJ2eS7rz6NOHIsOUVGjW0zkjbfCpJt+heyD4lEqdxIorzSsqWOtNMs
	zgKG4Z7FJH1i2iJ4QKYbGuxADjLvmcPq+Crb9NAIAIaCG0R0F5+qxmL0gB+Be6k8FxcXfUPXUhz
	k5zhnQ9cgXt9ir21208KKR8tZ3GPSWkms/MdcllFb7RZBR196suurIyX0tAYKo7Ju9+fYEMMnhb
	tXQHWWSpAwKaIwBx7qZr7BKRhENlTZPr30ENn/lF1UcJQ9ZBSNoeFPXBSdpprN17fsr0F805PuV
	qGqpzH+9aoy5DbfgtMf7I8DRS2hec7BncRX77Gb8WrmZO/txU8ZCv25AaqBAZbqhz0qjv+BkepB
	ePkXt/90LLKByAIw==
X-Google-Smtp-Source: AGHT+IEnVWURgyAOS/aiBpPSr6ibEb0vrpoJ4tgUj66ftOIXK+JVZ3psa0jvNSUArS8C0+GhLPKnpQ==
X-Received: by 2002:a17:902:d511:b0:295:64f8:d9cd with SMTP id d9443c01a7336-29564f8dcf4mr121171775ad.15.1762230853908;
        Mon, 03 Nov 2025 20:34:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a74214sm9147025ad.97.2025.11.03.20.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:34:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2 0/4] recipe updates
Date: Tue,  4 Nov 2025 17:34:02 +1300
Message-ID: <20251104043406.1086244-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 04:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225706

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

changes in v2:
- fixed iproute2 build error on musl libc
- dropped gobject-introspection upgrade patch because of following new
  submissions
https://lists.openembedded.org/g/openembedded-core/message/225604
https://lists.openembedded.org/g/openembedded-core/message/225605

Ankur Tyagi (4):
  wireless-regdb: upgrade 2025.07.10 -> 2025.10.07
  iproute2: upgrade 6.16.0 -> 6.17.0
  libevdev: upgrade 1.13.4 -> 1.13.5
  harfbuzz: upgrade 11.4.5 -> 11.5.1

 ...ridge-avoid-redefinition-of-in6_addr.patch | 34 +++++++++++++++++++
 ...{iproute2_6.16.0.bb => iproute2_6.17.0.bb} |  3 +-
 ...{harfbuzz_11.4.5.bb => harfbuzz_11.5.1.bb} |  2 +-
 ....07.10.bb => wireless-regdb_2025.10.07.bb} |  2 +-
 ...{libevdev_1.13.4.bb => libevdev_1.13.5.bb} |  2 +-
 5 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0002-lib-bridge-avoid-redefinition-of-in6_addr.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_6.16.0.bb => iproute2_6.17.0.bb} (95%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.4.5.bb => harfbuzz_11.5.1.bb} (95%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.07.10.bb => wireless-regdb_2025.10.07.bb} (94%)
 rename meta/recipes-support/libevdev/{libevdev_1.13.4.bb => libevdev_1.13.5.bb} (87%)


