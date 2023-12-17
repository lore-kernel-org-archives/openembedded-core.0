Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F02C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 05:41:55 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.14267.1702791709375770739
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 21:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7u/HcaL;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: ticotimo@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6d9f879f784so1753127a34.2
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 21:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702791708; x=1703396508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7mf+q9kva7Rh8/lsQdJJPNpe99s1cTgjyWbUiVh1t2Q=;
        b=d7u/HcaLrCjs6wKEpJ7MunhD7CsWvDRgM5rMqcvkOPzry6zqYWyuOxfT0z4Pxu+oe8
         BwcSKrPReiaAFh5Vw46Ine6edVCsAoZnasLHXZ72hOrJ8P9PTH6CbibDsxqcpRDAeS1w
         w/uItnY+EXoylpdizLa2QpTmcbHfKRa7pS8GCl6mfMoMhJ2dQYxwdCk14Z/UkOMsX6PN
         XocGIi0b5Ki5SQvkpsVOBe5QvPN2ipKDxtPUyOtOYtVgYqTzqimajBtM/UtWUq50hyTI
         WaCDDfUPqPKdQ4r8TyKyA679v9xOxn0XyINd0GZesVhlbxpBSDIHrOHXL8Bx8+toeYGV
         uAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702791708; x=1703396508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mf+q9kva7Rh8/lsQdJJPNpe99s1cTgjyWbUiVh1t2Q=;
        b=LMXPHQ+dt7gEu+WMKkUoTwq69vPl4VcQgDAQEI5co6IFFuLTTXU89Qe75u7N+n9AUC
         yO9Diwqpi+b3foD2MtcRn+DINGpAbElLyM2Ks8/RubUOt+5Q4s3/QGF98IPv4re3/NWz
         F3Ymnca05tYyvrBLpFZbXbsUs/xbRa3WHvuXFObm/xEwD8E6y/9/tiI+40+nZljFxf12
         V8dvnHjiAkGyDTkDngBKzELx/W9WB/ktVxZu/SQkTgZvugmZYhQEXzb/JfhhrcKL5qyC
         BNDEWsNQgzMu8/grxZRrS3SYd91ZyS2QXzCAIe+y++buK13yBaloM2avRnDXUrLHjxRH
         zxqw==
X-Gm-Message-State: AOJu0Yy4xSQQPMLlwS/DTiqGkSrZlsEOjLg2B8IrbOXYecsZNHt3Yr7/
	6VcKCyKnV+uO3ricv83XJVAiFs+IFm8=
X-Google-Smtp-Source: AGHT+IGntXwbheZQBX5WoOkuYQ/CWiA4I5zJPgzoym3xfu/2M5esYB/rRlIJZhCEEcq81p3az9StLw==
X-Received: by 2002:a05:6830:119a:b0:6da:3070:1946 with SMTP id u26-20020a056830119a00b006da30701946mr7552498otq.71.1702791708071;
        Sat, 16 Dec 2023 21:41:48 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a001ad000b006cedd530420sm15365545pfv.52.2023.12.16.21.41.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 21:41:47 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/7] Add 'maturin' backend support
Date: Sat, 16 Dec 2023 21:41:26 -0800
Message-Id: <cover.1702791173.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 05:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192574

We are increasingly seeing Rust extensions for Python added in the
ecosystem. The current best practices approach has moved from using
'setuptools-rust' to using 'maturin'.

* Add python3-maturin, including 'native' and 'nativesdk' support.
* Add a 'python_maturin' bbclass for the PEP-517 backend.
* Add recipetool support for the 'maturin' PEP-517 backend.
* Add a very basic 'maturin list-python' smoke test to oeqa for
  both 'runtime' (-c testimage) and 'sdk' (-c testsdk).

Changes in v2:
* Bump 'maturin' to v1.4.0
* Fix the reproducible build of the bzip2-sys crate which was causing
  python3-maturin to be non-reproducible.
* Add a more exhaustive 'maturin develop' test case for oeqa 'sdk',
  which exercises:
  - Creation of a python3 virtual environment
  - Fetching crates for the 'guessing-game' app from the maturin tutorial
  - Building dev version of 'guessing-game' crate and wheel

The following changes since commit 5815ccc1f6fd93690a684f7ff0f8a0a19758fdaa:

  build-appliance-image: Update to master head revision (2023-12-16 13:12:52 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/maturin_1.4.0
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/maturin_1.4.0

Tim Orling (7):
  python3-maturin: add v1.4.0
  python3-maturin: bzip2-sys reproduciblility
  classes-recipe: add python_maturin.bbclass
  recipetool: add python_maturin support
  oe-selfest: add maturn runtime (testimage) test
  oeqa: add simple 'maturin' SDK (testsdk) test case
  oeqa: add "maturin develop" SDK test case

 meta/classes-recipe/python_maturin.bbclass    |  17 +
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../files/maturin/guessing-game/Cargo.toml    |  20 +
 .../maturin/guessing-game/LICENSE-APACHE      | 201 ++++++
 .../files/maturin/guessing-game/LICENSE-MIT   |  25 +
 .../maturin/guessing-game/pyproject.toml      |   8 +
 .../files/maturin/guessing-game/src/lib.rs    |  48 ++
 meta/lib/oeqa/runtime/cases/maturin.py        |  23 +
 meta/lib/oeqa/sdk/cases/maturin.py            |  79 +++
 meta/lib/oeqa/selftest/cases/recipetool.py    |  29 +
 .../python/python3-maturin-crates.inc         | 618 ++++++++++++++++++
 .../python/python3-maturin_1.4.0.bb           |  42 ++
 .../lib/recipetool/create_buildsys_python.py  |   1 +
 13 files changed, 1112 insertions(+)
 create mode 100644 meta/classes-recipe/python_maturin.bbclass
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/LICENSE-APACHE
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/LICENSE-MIT
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs
 create mode 100644 meta/lib/oeqa/runtime/cases/maturin.py
 create mode 100644 meta/lib/oeqa/sdk/cases/maturin.py
 create mode 100644 meta/recipes-devtools/python/python3-maturin-crates.inc
 create mode 100644 meta/recipes-devtools/python/python3-maturin_1.4.0.bb

-- 
2.34.1


