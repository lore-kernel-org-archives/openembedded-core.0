Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F8DC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:08:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.90684.1749571730404139208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sCPyTAWD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234b440afa7so57097785ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571730; x=1750176530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=btk5JolTkut5zWTYIfn9EMD8xudbHciIWfAAGG4s9UU=;
        b=sCPyTAWD5hNHJM0IyCkn32/V0TPBnI50tReeOgirHBt9msoT5A1Pnco42anVQbXp1l
         +Zcz3o3R34YAFbgXC/zIwKbqSoTk01iNeZMLfsUHzCpXHG9g8/bmLjbuHLHRpj1zPem8
         sJEftyEfWdLLVSRj1Cg6Y5sqOLTgoeMJNzDvAPEL0ZzkNl3SwZM4R6wtlc3nzkg4b5I/
         TEnGWmhyUvFv7zDf0V+6AorRYENxtkORSoyYoufibdkqcR6SKncS+WvSXTjNhAeQ/+HF
         rhkXB0pzB9x3yCXfkLZKJ/nEdI8q/0dyPYbv85wMQUNwEvkiasURSwQU7w/HXR5lM3XH
         9mKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571730; x=1750176530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btk5JolTkut5zWTYIfn9EMD8xudbHciIWfAAGG4s9UU=;
        b=CDPEok90V1noP4GLCOPav04bOwhdhfHANfOApDxIkwwu25AOJP1coJBNNKZrjv8jg9
         FS8gIuVwPev1nqRX0bx3gqCyqPqf3DSyCSWNeS5c7cyiS3jZCpaqeHML7tgx8uSrzZ7c
         GsCnE1ouU7MCbE6qfw8YFvmyEJjFT4dtmBoPyCQgq39B6WeEUN8OfwTnpUAq8+1oh//4
         sscrOpTH7XeN2tesvUOL6GqHCwsYm+vNcQF32sXzkY/6E6E1kuIC2aYFzMmSomGZp9FS
         i3ikqezjVI9A5wj3t06oh3sIgwbNW5cpDZm2sxb4F3ywvrtguvUJvr8KvMMOgSfxPQwf
         SYIw==
X-Gm-Message-State: AOJu0Yw7SAWlEtt5ixq1fzggzgXFUh1yjcuyGhYjgOwBVsnfuraPns4K
	zAx9YuNGOFhutbObdAwXRz7PKp0ikY7M0m/7oatgGaqgC3P6bAXLG//tE9PsfVI0jgL8bHM/yud
	dsTEy
X-Gm-Gg: ASbGncurUXT8+FB/58Uh9dse+aMhFNgAd+l0o92PvR4jCXxreRx3twoLdxM5k5nfoZS
	FuXaIoGJodzrIfACW0mkrXeANO1dIg2OB4Qv28XNNJcWz20IHF7ttXB4MtQAkOv7CuucrM8v1qU
	l/8Q3DzxkJAvq8USATFEIgmOt6Yml9e/A+rTgRAjC29F7L38Zo1DbctTrw91AiP0FcUdnzY82cx
	kZgolHk0PoW4nn81KJxEBNhhsjyA0jGVFACaqbGI9BE3puMl0+Gykl7QDAJoExNaD0wzQSHJhtW
	69ELr/i4G+BYCgVGqIcMCQyyfbVJvJ4HS58fQRVS6A/IWvmKAYTSSg==
X-Google-Smtp-Source: AGHT+IGk5SoJ1+NUqZyFwHR+qT/BL43vfcPdmWhCUeXVlDhoEz4u5YQN8q9chLvAEekkvKHixGORCA==
X-Received: by 2002:a17:903:166e:b0:235:779:edfe with SMTP id d9443c01a7336-23640d23c11mr6826955ad.43.1749571729555;
        Tue, 10 Jun 2025 09:08:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.08.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:08:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/32] Patch review
Date: Tue, 10 Jun 2025 09:08:13 -0700
Message-ID: <cover.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218369

Please review this set of changes for walnascar and have comments back by
end of day Thursday, June 12

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1768

The following changes since commit a7322472e41c3cac922e29d867ae3f2f74318279:

  sstatetests: Switch to new CDN (2025-05-30 06:32:58 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Changqing Li (25):
  libsoup-2.4: update patch 0001-CVE-2025-32911.patch
  libsoup-2.4: fix CVE-2025-32053
  libsoup-2.4: fix CVE-2025-2784
  libsoup-2.4: fix CVE-2024-52530
  libsoup-2.4: fix CVE-2025-32906
  libsoup-2.4: fix CVE-2025-32914
  libsoup-2.4: fix CVE-2025-46420
  libsoup-2.4: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-32052
  libsoup-2.4: fix CVE-2025-32909
  libsoup-2.4: fix CVE-2025-32910
  libsoup-2.4: fix CVE-2025-32912
  libsoup-2.4: fix CVE-2024-52531
  libsoup-2.4: fix CVE-2025-4476
  libsoup: upgrade 3.6.4 -> 3.6.5
  libsoup-2.4: fix CVE-2025-32907
  libsoup-2.4: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4969
  libsoup: fix CVE-2025-32914
  libsoup: fix CVE-2025-4476
  libsoup: fix CVE-2025-32907
  libsoup: fix CVE-2025-32908
  libsoup: fix CVE-2025-4948
  libsoup: fix CVE-2025-4969

Deepesh Varatharajan (2):
  binutils: Fix CVE-2025-1181
  binutils: Fix CVE-2025-5244

Patrick Williams (1):
  systemd.bbclass: generate preset for templates

Peter Marko (1):
  python3: upgrade 3.13.3 -> 3.13.4

Ross Burton (2):
  python3: remove obsolete deletion of non-deterministic .pyc files
  python3: backport the full fix for importlib scanning invalid
    distributions

Trevor Gamblin (1):
  python3: upgrade 3.13.2 -> 3.13.3

 meta/classes-recipe/systemd.bbclass           |  11 +-
 .../binutils/binutils-2.44.inc                |   3 +
 .../binutils/0016-CVE-2025-1181-1.patch       | 141 ++++++++
 .../binutils/0016-CVE-2025-5244.patch         |  25 ++
 .../binutils/0017-CVE-2025-1181-2.patch       | 337 ++++++++++++++++++
 ...shebang-overflow-on-python-config.py.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |  14 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   6 +-
 ..._fileno-test-due-to-load-variability.patch |   2 +-
 ...ctive_children-skip-problematic-test.patch |   2 +-
 ...t_readline-skip-limited-history-test.patch |  10 +-
 ...orlines-skip-due-to-load-variability.patch |   2 +-
 .../python3/deterministic_imports.patch       |  39 --
 .../python/python3/makerace.patch             |   2 +-
 .../python/python3/valid-dists.patch          | 160 +++++++++
 .../{python3_3.13.2.bb => python3_3.13.4.bb}  |  18 +-
 .../libsoup-2.4/0001-CVE-2025-32911.patch     |   2 +-
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 150 ++++++++
 .../libsoup-2.4/CVE-2024-52531-1.patch        |  39 ++
 .../libsoup-2.4/CVE-2024-52531-2.patch        | 133 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  |  39 ++
 .../libsoup/libsoup-2.4/CVE-2025-32906.patch  |  71 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  |  39 ++
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  38 ++
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  32 ++
 .../libsoup-2.4/CVE-2025-32910-2.patch        |  94 +++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  28 ++
 .../libsoup/libsoup-2.4/CVE-2025-32912.patch  |  32 ++
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  |  35 ++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 ++
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  |  61 ++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  47 +++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 ++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 ++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  23 +-
 .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 +++++++++++
 .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++
 .../libsoup/libsoup/CVE-2025-32908-1.patch    |  89 +++++
 .../libsoup/libsoup/CVE-2025-32908-2.patch    |  53 +++
 .../libsoup/libsoup/CVE-2025-32914.patch      | 112 ++++++
 .../libsoup/libsoup/CVE-2025-4476.patch       |  39 ++
 .../libsoup/libsoup/CVE-2025-4948.patch       |  97 +++++
 .../libsoup/libsoup/CVE-2025-4969.patch       |  78 ++++
 .../{libsoup_3.6.4.bb => libsoup_3.6.5.bb}    |  13 +-
 48 files changed, 2541 insertions(+), 77 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-5244.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
 delete mode 100644 meta/recipes-devtools/python/python3/deterministic_imports.patch
 create mode 100644 meta/recipes-devtools/python/python3/valid-dists.patch
 rename meta/recipes-devtools/python/{python3_3.13.2.bb => python3_3.13.4.bb} (95%)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
 rename meta/recipes-support/libsoup/{libsoup_3.6.4.bb => libsoup_3.6.5.bb} (83%)

-- 
2.43.0


