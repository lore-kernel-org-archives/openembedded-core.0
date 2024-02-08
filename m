Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080EEC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:29:05 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.13542.1707380936277297310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZbljZ8x;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5116643c64eso2823884e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 00:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707380934; x=1707985734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMbj7B6RLXranBLPldanU/38+U7tkcqJGr2A7ZK+VKY=;
        b=WZbljZ8xMAYs4PKSExEKDX8RxEhTNVc2/oaum3lNv58+jaTICtTlU+vfmVA2tUGUi/
         kme0VVBgweMiEuS1G3ga6kpc11j/u3zF6yGENj6houj5HHbKMzls3RAWkHCRoiA0cJEX
         uzk7fRtxjL0hsy5n+MjVZ7yEMO/f7wlTN1WXumze8a69T/q4tNz/kQ2+5HRlRLG5YUvN
         MLfpsI/BrOmBO62u1UQbWR3aC6gsa6xK9VFQ0XLh76139N+DvTRxLH4gzvwyDGOA+JSa
         t7oe8Kn/DtKOpQngtkzk4lSMxtETgqMRBOK4SVtBcDXdmnhZsPE+AkAEj1GMzR9LQiCu
         aKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380934; x=1707985734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMbj7B6RLXranBLPldanU/38+U7tkcqJGr2A7ZK+VKY=;
        b=nvLDbK0bXEQ60udmEYOFKmGVZNtKBf1yxV072SeUinaBhUKxO6vT+qlkcE2dPdwJZ9
         B0u1gInA+m9aNvWDNrjulv/4wJgNZZVC3v23RHYh0XtnzzMIU+pt6ALZXhJx2tcutXDA
         SslkN8/BucmZMKTahjJ85qS5GozmnAfyLWDjhdcrhtLpRyQtlnQBYreRHRpAZ3f7hqQI
         A4qnC36SZbrZC+bflAGqQtCvx/odlJ/q/m8HUtesLagl8zC1ZXHbQ4f+/H2ZgSqeevu5
         5r9AnbnrH50HsBwHyA5bUmWqTdciYPeu3Os2PuTdU2K+TnJTg/f1QLexRAOCFlhMe3Ka
         vISw==
X-Gm-Message-State: AOJu0Ywb/cw8MOSi7JBP1GR2J6wgkpWZMDgHpkjDTN+6Rj6qMo/7ep5S
	PfP8OV+T99LOKiZjMlS7cexT3gWK70AbfxFfAIe8FKmDmwrPy3iojoKfncEq
X-Google-Smtp-Source: AGHT+IF/uTcA/dOmMalGdStx+TWcradj0r2kV5ZRg4+EVfRUeghOa+NlCEg6FMuD2O9einKiFW1Zkg==
X-Received: by 2002:a05:6512:368c:b0:511:6f2e:d23f with SMTP id d12-20020a056512368c00b005116f2ed23fmr465728lfs.43.1707380933850;
        Thu, 08 Feb 2024 00:28:53 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm913321wmq.11.2024.02.08.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:28:53 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/7] python 3.12 related fixes
Date: Thu,  8 Feb 2024 09:27:26 +0100
Message-ID: <20240208082821.430510-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195105

Bug fixes for host distros with Python 3.12.

Tested by running the oe-selftest suite like this:
  oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg \
  reproducible -T yocto-mirrors -T machine -T toolchain-user \
  -T toolchain-system -j4

using the default local.conf file with 3 extra lines:
  SANITY_TESTED_DISTROS = ""
  IMAGE_INSTALL:append = ' ssh-pregen-hostkeys'
  QEMU_USE_KVM = 'True'

Host distro: Fedora 39

With this patchset the oe-selftest summary looks like this:
- oe-selftest () - Ran 575 tests in 19413.991s
- FAIL - Required tests failed
         (successes=558, skipped=8, failures=8, errors=1)

Failing tests are:
- esdk.oeSDKExtSelfTest.test_image_generation_binary_feeds: ERROR
- esdk.oeSDKExtSelfTest.test_install_libraries_headers: ERROR
  When running bitbake core-image-minimal -c populate_sdk_ext
  the exit values is 130 which explains why the test fails.
  No further analysis done.

- runtime_test.TestImage.test_testimage_virgl_gtk_sdl: FAILED (1454.58s)
  No idea why this fails.

- spdx.SPDXCheck.test_spdx_base_files: FAILED (21.39s)
  AssertionError: ...base-files.spdx.json' does not exist
  No further analysis done.

All wic tests pass if executed with oe-selftest -r wic.
Also adding e.g. -j4 works fine as well.
However, executing the wic tests with oe-selftest -a leads to failing
tests (more than once):
- wic.ModifyTests.test_wic_cp: FAILED (34.47s)
- wic.ModifyTests.test_wic_cp_ext: FAILED (57.94s)
- wic.ModifyTests.test_wic_ls: FAILED (32.14s)
- wic.ModifyTests.test_wic_ls_ext: FAILED (71.36s)
- wic.ModifyTests.test_wic_rm: FAILED (32.40s)
- wic.ModifyTests.test_wic_rm_ext: FAILED (24.41s)

The last patch fixes many warnings related to invalid regex patterns.
https://docs.python.org/3/library/re.html basically states that regular
expressions using the backslash character like "foo\s*" should be
written as raw strings like r"foo\s*".
This patch does that for most but not for all regexes. Some are not easy
to convert and/or test.

Adrian Freihofer (7):
  recipetool: cleanup imports
  oeqa: replace deprecated assertEquals
  selftest: replace assertRaisesRegexp
  oeqa/selftest/oelib/buildhistory: git default branch
  oeqa/selftest/runtime_test: allow GPLv3 for bash
  oeqa/selftest/recipetool: fix for python 3.12
  python 3.12 compatible regex

 bitbake/lib/bs4/tests/test_tree.py            |  2 +-
 .../feature-microblaze-versions.inc           |  2 +-
 meta/lib/oeqa/oetest.py                       |  2 +-
 meta/lib/oeqa/sdk/buildtools-cases/sanity.py  |  2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  6 +--
 meta/lib/oeqa/selftest/cases/liboe.py         |  2 +-
 .../oeqa/selftest/cases/oelib/buildhistory.py | 10 ++---
 meta/lib/oeqa/selftest/cases/recipetool.py    | 18 ++++-----
 meta/lib/oeqa/selftest/cases/runcmd.py        |  8 ++--
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  6 +++
 meta/lib/patchtest/tests/base.py              |  4 +-
 meta/lib/patchtest/utils.py                   |  6 +--
 .../perf/perf/sort-pmuevents.py               |  8 ++--
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  2 +-
 scripts/combo-layer                           |  2 +-
 scripts/contrib/bbvars.py                     |  6 +--
 scripts/contrib/convert-overrides.py          |  8 ++--
 scripts/lib/checklayer/__init__.py            |  4 +-
 scripts/lib/recipetool/create.py              | 12 +++---
 scripts/lib/recipetool/create_buildsys.py     | 40 +++++++++----------
 scripts/oe-check-sstate                       |  2 +-
 scripts/oe-pkgdata-util                       |  2 +-
 scripts/opkg-query-helper.py                  |  2 +-
 scripts/patchtest-get-branch                  |  2 +-
 26 files changed, 84 insertions(+), 78 deletions(-)

-- 
2.43.0


