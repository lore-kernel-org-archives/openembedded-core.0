Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDE1CF58EA
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:42:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17207.1763584942726938072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CI67OAJf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aab7623f42so144358b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763584942; x=1764189742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4n5Adt8dttxzsIk7RK7H4aW2zS6+kd28iMe11Nu/TlU=;
        b=CI67OAJfXmdTHYAEx0R2UxMt8uwMNO6Kzl/nzwzgg5fNVtJaSmW9lk82dBICqFytnS
         OzRF+E33EKkhp2krwb7llTxnAN6PvMwtMSF82eG/RGw6J4uqo7b0HrNoDEvYBiiChRG3
         7bQ3yzs+KfOvaXPP8jDWTwtehth1hYJp5BNz+7Zmqu5+hr3ApNqzCetECzyR+ht5ovV3
         W4kgAmYg8u5YN8VNgEgAbR9MYTuCob6/nww67S2oRlvEtfOV8Macbo3mwz3Mnvw88t8C
         r/9NLeVlek75s2DuYu1I+VSD+B6fPFeNq/uhHZm+okiKCWmuER2+WaNQD4bZmHctB5yf
         s4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584942; x=1764189742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4n5Adt8dttxzsIk7RK7H4aW2zS6+kd28iMe11Nu/TlU=;
        b=Q9gM9TqTSfEvrcjeWP5J+70JLkhe6tLjH0r7gGtWjKN8Crcpr3VyH4p7QHIDZMLi0r
         j9k6INSznGbhTyFCZc3Sd/qLma7FivccJrK06Vgxy9ystoU5sp4S4Q3n5JZSQ9C8RBAV
         MEZkqUDYOZYCe1NH5Xy5n1PWMjYzrSelHPVswt8EHdIX9kPKvJ43qAz2In3Vfdh0qfGf
         sZopB0mhCLK7Nw34gXoNmcqEmE48OJQgyahcntLu0rTorWFB59TgDxe3IfhSMo7jXRWi
         bSr50VomsLGV9oKv+zapr77l0ttKVDpm7zg3Nr2wAE5UzGqFs88yB+NqgbrLgZZYMruu
         jPUw==
X-Gm-Message-State: AOJu0YyYab5EcCKO300Z/XKOlWPRvgXEnVpui1GS0Udwj9VWL6zOvyjn
	Lxfej7NqXg1mFF/S1dv9mEBGKMQ+f12wzC2y+itKNsk/AUYc+4I5Viqid/1bwyzPe5UYtRBbdED
	Apoau
X-Gm-Gg: ASbGncvKUK6BHgiy4MHD9Sauujfx21CCrDUKKv7fC1PLiI2sarC9XjSNU5GZ0tLu8Wf
	TbbnihS8OrKymuUFMQY+J5eoZTJyWpJFsFCFzE5cGf6jmzOTD8R3JZW7QkBRixrximnr2d17T7O
	BeMDgN8w2ChLmBLtOz5gdmm3UMoh+5PlDKmtOQzzDiAOPZ89xPwT4rmba9EgZcjBIcH2RuaGJMP
	XAmt97rGw5xnfsAR5xuZw2kFH0qIXsdfqSkWapiygcDiI2BjYg8uTAKXSgLvEaQMCeVDsK02jun
	R0HYQNzhpOxeEBltR+3rOVmyL7rjTX5K1RIlsY3A9tv2EpcWsDfGv6u1Ojop0F5dxIV38YNLhLh
	sPbo/8DAtP0hpzJ6GLv9AAfRFksYhrdpaSRvuu92be0MptcqfUKSrX2DGuyLQKwPLfzr5cUu6/0
	zBbw==
X-Google-Smtp-Source: AGHT+IGMVyGRnlqQVYRWMbdI3KNHjeyC/ooqmwH4oojvsuTjMq+BZU/FMYRbv1F/5Wix1foB0iPzcQ==
X-Received: by 2002:a05:6a00:2e9c:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7c3f471a1d2mr393432b3a.7.1763584941758;
        Wed, 19 Nov 2025 12:42:21 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:95e8:2651:d6f9:404e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf7d5adsm269866b3a.11.2025.11.19.12.42.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:42:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Wed, 19 Nov 2025 12:42:08 -0800
Message-ID: <cover.1763584791.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226590

Please review this set of changes for kirkstone and have comments back by
end of day Friday, November 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2748

The following changes since commit 8aad87c12a809d790175b9848f5802d0a28eecac:

  goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task signatures (2025-11-13 08:39:38 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Gyorgy Sarvari (1):
  musl: patch CVE-2025-26519

Richard Purdie (1):
  oe-build-perf-report: relax metadata matching rules

Soumya Sambu (2):
  elfutils: Fix CVE-2025-1376
  elfutils: Fix CVE-2025-1377

Vijay Anusuri (3):
  xwayland: Fix for CVE-2025-62229
  xwayland: Fix for CVE-2025-62230
  xwayland: Fix for CVE-2025-62231

 .../musl/musl/CVE-2025-26519-1.patch          | 39 ++++++++
 .../musl/musl/CVE-2025-26519-2.patch          | 38 ++++++++
 meta/recipes-core/musl/musl_git.bb            |  4 +-
 .../elfutils/elfutils_0.186.bb                |  2 +
 .../elfutils/files/CVE-2025-1376.patch        | 58 ++++++++++++
 .../elfutils/files/CVE-2025-1377.patch        | 68 ++++++++++++++
 .../xwayland/xwayland/CVE-2025-62229.patch    | 89 ++++++++++++++++++
 .../xwayland/xwayland/CVE-2025-62230-1.patch  | 63 +++++++++++++
 .../xwayland/xwayland/CVE-2025-62230-2.patch  | 92 +++++++++++++++++++
 .../xwayland/xwayland/CVE-2025-62231.patch    | 53 +++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  4 +
 scripts/lib/build_perf/report.py              |  9 +-
 12 files changed, 515 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-2.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-2.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch

-- 
2.43.0


