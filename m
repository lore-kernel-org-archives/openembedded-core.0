Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50474C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.4914.1708035438714367070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MEf8bqWo;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-411d3c75026so11057665e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035437; x=1708640237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwLUo0Jq+vvuNydD27ybVBCvAfYbn5/+Mx8xeTaus5Q=;
        b=MEf8bqWoBP+K6f9HNC3pBsmVpsnspayugBCGZpsFCng8Yk0A1xtLZVgSbASptXfBAQ
         RQ8by0OqSu3doAfGCCM749g5CLFbWS4PN+P1HW7czvh5SheaZxl7MQ5slfzSCenAW6Zw
         h/PWEdkEbJhB3kjEkzI4en3JwZVwfN45YwU9Psn4tfdSi09us1yyfhn396xUYq9N/jr0
         sGh8lTEBMn6HPpB3SstqWJd0l6ximAtS4QTrow3Af0HKfA8N2A3d+hn1S52vaa1d3t0h
         r3+/eO2vOSYQ8o2qaumxSpGLb4Fo8NCgkBY1Ykg0DHGc4OQyIwwsV9sVnd78NfUEW69H
         t3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035437; x=1708640237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwLUo0Jq+vvuNydD27ybVBCvAfYbn5/+Mx8xeTaus5Q=;
        b=R4+lOtbcedsq+R+5BqEufdeNtCei0eZDIYRYA1IwxaS5oaHUJXRV2/mNDOdZBfEsF9
         wgRT11+X+pgq/zk5C/03tYRU6D8QeOQMdYDJqYhya30SLqaHB7Rjh+1ck2ij3XcnojAT
         9UObPAoehIdG16xnj6YYAG057w7ktUS/5Fq5OIRry+cguLE7Wp1F3QH32vuzEdlKCHw1
         XN3rl1IVN+Xdp2LPxkQqar4PguiPKIovhm9oFlYYi2zA1tQHkbRupcIqqsdPhqoe0VCF
         MpEYkDImJoNvxfKnacM5VRXjuYl7SWdPYXpMwgoDoPrAvv/nwGcbDK9vVwBtk6D7eax6
         qh2w==
X-Gm-Message-State: AOJu0YwcxgbuOL6+lsu8DJunmWj0TfzfGrSCzjfqdj0eug7fqx0SswN0
	Sh4kChdbr/12DoIV9/BWrYJ+h8UshTNtW7imTyDEaXH/xNGWusfWw4fm/5oM1A8=
X-Google-Smtp-Source: AGHT+IGA9l3BD+G9MeZ9+yAMXPYuGIuaVoT3tsTV05egf5oI+zbc/W/pZxeoHEt18kTAASAoVbdilQ==
X-Received: by 2002:a5d:6dad:0:b0:33b:75d0:9b4b with SMTP id u13-20020a5d6dad000000b0033b75d09b4bmr2929176wrs.50.1708035436625;
        Thu, 15 Feb 2024 14:17:16 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:16 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 00/12] python 3.12 related fixes
Date: Thu, 15 Feb 2024 23:13:46 +0100
Message-ID: <20240215221711.332614-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195711

With these and 3 more patches sent to the bitbake-devel group oe-selftest
looks already much better:

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



Adrian Freihofer (7):
  oeqa: replace deprecated assertEquals
  oeqa/selftest/recipetool: fix for python 3.12
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
 meta/lib/oeqa/selftest/cases/recipetool.py    | 23 ++++++-----
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
 23 files changed, 97 insertions(+), 74 deletions(-)

-- 
2.43.1


