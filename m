Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD85C48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.454.1708544443416317268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aW5rNgoZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41274cada64so8417265e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544441; x=1709149241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9YLwrDtkXW6VllpEUfYcPjaS7FabxvyaB9C5xcz3+s=;
        b=aW5rNgoZ5GsZ+iP9K3d825K85saMXJXLksCy3WxictykA0W7sXajJ3Hmq5ix7xT+/P
         ZJYH6D3sqrdl0mnRzpDeLpx9rXpLNP536gbwvSmA3UsWu5AFivVMw4L4UxtamB9ZQvo6
         m06MbDb0CYKd+v76c1KdqWDtYyeehLtT3rYMPpStullF0/I7xZtyc/Y3L11plltj9fvw
         Oxll3SGHuxInNn0dNU5ds0tvnmO5Tl/hCIEgalZ0mV4+HKHHnbGjuKTiQdyY0D/RMgRg
         8bWNpWNGxJcTHR9afy91pAIVmPM9UUIydD7bdswItmZqnlHwsBG3OZzPDoZQd/ijKHBP
         Qo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544441; x=1709149241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9YLwrDtkXW6VllpEUfYcPjaS7FabxvyaB9C5xcz3+s=;
        b=ISzrkKTY254TPF0Tj5+ewFXKNwjU26Gpw0byIKkzRUCFz5eYTXHQIWWCg6Ag6dhD4D
         J2D0Jt5uOff2z4+k2kD+J2nl4mS+5pX87cs+yj3/e9qTh1elz7rEoC8cOWbt0SaOauvw
         Xiriu3f4U0cvYnyjuuJDaqkBA9pvbI0QOnaDnBTHq8cPbAFFF//WvAI0/OBEtJeCQFDb
         0ElQ3DksI3vIfaadPgdzzqKjLDj9h85Z5smjhaEPYrkTfgTRIedY2h0pOF1/XMIMwCoI
         qV+y/HaTYOOgeIC1LGPYO2aoQ2ihPI+keqmvQrzZplPgFPzhz0PmfzecMQEdPQ4iG9vX
         k2ug==
X-Gm-Message-State: AOJu0YxJiqIvf5JBQidt+WqP9Hl6fdcwhiSfk3p6RO6aKdSbYAK6mBBj
	yaIVMGL/U+hNgbsnAQT6zc0eQ+Xyuw2sc2skLMk4ENXBtO+SKLRidJNQ6FyD
X-Google-Smtp-Source: AGHT+IEY8SjJbv04XmESGmcYCjsV6WrjyhRg7EKZPXCUQ7yfrwb34LhIUXCavZUUAqGiMwRyoMEVQA==
X-Received: by 2002:a05:600c:3b26:b0:412:5db5:c0e1 with SMTP id m38-20020a05600c3b2600b004125db5c0e1mr8679959wms.25.1708544441021;
        Wed, 21 Feb 2024 11:40:41 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:40 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 00/13] python 3.12 related fixes
Date: Wed, 21 Feb 2024 20:36:52 +0100
Message-ID: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195984


Changes in comparison to v2:
Fix oe-selftest errors
- https://errors.yoctoproject.org/Errors/Details/753468/
- https://errors.yoctoproject.org/Errors/Details/753470/
by adding one more commit: "oeqa/selftest/recipetool: expect meson.bb"

oe-selftest -a
Required tests failed (successes=502, skipped=6, failures=7, errors=3)

eSDK.oeSDKExtSelfTest.test_image_generation_binary_feeds: ERROR
eSDK.oeSDKExtSelfTest.test_install_libraries_headers: ERROR
runcmd.RunCmdTests.test_result_assertion: ERROR (0.01s)
runcmd.RunCmdTests.test_result_exception: ERROR (0.02s)
distrodata.Distrodata.test_checkpkg: FAILED (132.52s)
incompatible_lic.NoGPL3InImagesTests.test_core_image_full_cmdline_weston: FAILED (215.33s)
runtime_test.TestImage.test_testimage_apt: FAILED (807.54s)
runtime_test.TestImage.test_testimage_dnf: FAILED (1032.04s)
runtime_test.TestImage.test_testimage_install: FAILED (110.76s)
runtime_test.TestImage.test_testimage_virgl_gtk_sdl: FAILED (724.11s)
runtime_test.TestImage.test_testimage_virgl_headless: FAILED (0.04s)

Note: Some opengl/weston tests are currently also failing on master
on my setup. Not sure why. Lets wait for the opinion of the official
Fedora 39 runner.

For what ever reason recipetool seams to work differently on my machine.
  recipetool create -o https://github.com/mesonbuild/meson;rev=0.52.1
creates a recipe named meson.bb, not a recipe pyhton3-meson.bb.
Not sure if another is a patch required which fixes two test cases:
  test_recipetool_create_github
  test_recipetool_create_github_tarball
or if this depends on the host machine.

Adrian Freihofer (8):
  oeqa: replace deprecated assertEquals
  oeqa/selftest/recipetool: fix for python 3.12
  oeqa/selftest/recipetool: expect meson.bb
  oeqa/selftest/oelib/buildhistory: git default branch
  feature-microblaze-versions.inc: python 3.12 regex
  meta/lib/oeqa: python 3.12 regex
  meta/recipes: python 3.12 regex
  scripts: python 3.12 regex

Chris Laplante (1):
  recipetool/create_buildsys_python: use importlib instead of imp

Ross Burton (3):
  populate_sdk_ext: use ConfigParser instead of SafeConfigParser
  runqemu: add qmp socket support
  oeqa/selftest/recipetool: downgrade meson version to not use
    pyproject.toml

Trevor Gamblin (1):
  scripts/runqemu: fix regex escape sequences

 meta/classes/populate_sdk_ext.bbclass         |  2 +-
 .../feature-microblaze-versions.inc           |  2 +-
 meta/lib/oeqa/oetest.py                       |  2 +-
 meta/lib/oeqa/sdk/buildtools-cases/sanity.py  |  2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  6 +--
 meta/lib/oeqa/selftest/cases/liboe.py         |  2 +-
 .../oeqa/selftest/cases/oelib/buildhistory.py | 18 +++++++--
 meta/lib/oeqa/selftest/cases/recipetool.py    | 19 ++++++----
 .../perf/perf/sort-pmuevents.py               |  8 ++--
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  2 +-
 scripts/combo-layer                           |  2 +-
 scripts/contrib/bbvars.py                     |  6 +--
 scripts/contrib/convert-overrides.py          |  8 ++--
 scripts/lib/checklayer/__init__.py            |  4 +-
 scripts/lib/recipetool/create.py              | 12 +++---
 scripts/lib/recipetool/create_buildsys.py     | 38 +++++++++----------
 .../lib/recipetool/create_buildsys_python.py  |  5 +--
 scripts/oe-check-sstate                       |  2 +-
 scripts/oe-pkgdata-util                       |  2 +-
 scripts/opkg-query-helper.py                  |  2 +-
 scripts/runqemu                               | 19 ++++++++--
 23 files changed, 95 insertions(+), 72 deletions(-)

-- 
2.43.1


