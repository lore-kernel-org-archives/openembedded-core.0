Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC86C4829C
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:17:41 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.13252.1707571060016429220
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iXZVgQhM;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5116b540163so2678967e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707571058; x=1708175858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJswVudMm6Ps8ZyW/GDQGGYmM7mXBS3TnHd/Eeth/8M=;
        b=iXZVgQhM6DTSLE3CsWKcAepLTrEbyA8ZLLP8nWkHfLsdEFmM6R2huBym+rSGh+sF02
         8HYzDZNBs/ePL8fuVT0Vt1MwLeS5+YSwar/fJZVevlm42OLrSfKk0gNfL7NAbgzTuAkx
         6uBv14mJxBolDXDeV/RchOjOKsr+mRqdxUHK5gIxTdQWMBy6ztwPcgsx77v5+She0F2v
         JBJvB/Xfyj0JsAIPk9QSH4pWfPyN/Lv42ZmA6+X4TLjZL4cUOhNjWIzcMNrtpc40VcXO
         w1j8sBagfo9vJQG+PQFCJcG77ORDyM7oEpcCGkZvjAU6FAqVudbY4RM+Ch5qWF+BLGQt
         RtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707571058; x=1708175858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJswVudMm6Ps8ZyW/GDQGGYmM7mXBS3TnHd/Eeth/8M=;
        b=hOEaNgER2j7HsFsRrCVozfZw0T6SWB4Z1410HFQ6Q2hrYhF3kHVaA141qiElL4moUD
         ddXPR9eZ15NQ9MM265rL386+Edh493hGn78ipnS6fqhzhgjpKTtQUP0IDAw5FHWSr0P4
         GBVCdR8M1qF7SKa+N5Vw2JivV73rePZZwWJebb/WGDsDMuYrakI63ZDBwuCBVcWJfj8J
         8GUL0dGM9Du8N11U6HxT78wx6egeUpbJUW/Lszw7cOvGxxQCjAnn3T9ZTc7Mv3ngM22P
         4N2EvzAHMicEaj+Rk58Co65s5t/78H54cm1+d9ZlNgXPU4BzJMW7+kQqT1aKDVf7UP4m
         sLEA==
X-Gm-Message-State: AOJu0YzHUczT+1rY+S5blNzXmCzwgCjIuNnsPImapqNWgsFpYYXzEe3m
	enSb7KqJYEYyRZyVKZ11113IT75a2BRwgjP9Rp87UsANyRMqYQi7XdxC4rV/
X-Google-Smtp-Source: AGHT+IEBV6VMw6V0RihUFC1xDRmuiLVl4KfNoFkkQ1771bG0gTLOmsxubrQchw26RIAmzvzacEvbJQ==
X-Received: by 2002:a19:e046:0:b0:511:47f2:ac66 with SMTP id g6-20020a19e046000000b0051147f2ac66mr1143085lfj.50.1707571057559;
        Sat, 10 Feb 2024 05:17:37 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id hu20-20020a170907a09400b00a3bd0742a94sm1793064ejc.9.2024.02.10.05.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:17:36 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/7] python 3.12 related fixes 2
Date: Sat, 10 Feb 2024 14:15:52 +0100
Message-ID: <20240210131727.342583-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195264

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
Based on master-next including latest related fixes from Richard and
Ross.

With this patchset almost all oe-selftests pass on my machine.
Failing tests are:
- runtime_test.TestImage.test_testimage_virgl_gtk_sdl
- spdx.SPDXCheck.test_spdx_base_files
- sstatetests.SStateHashSameSigs3.test_sstate_sametune_samesigs
- sysroot.SysrootTests.test_sysroot_cleanup
- Some wic tests fail when executed as part of oe-selftest -a but pass
  when executed with oe-selftest -r wic
Lets see what the official Fedora-39 runner will report later on.

The regex related patches fixes many warnings which will be errors with
the next Python 3.13 version. How regexes should be defined chagned with
Python 3.0: https://docs.python.org/3/library/re.html basically states
that regular expressions using the backslash character like "foo\s*"
should be written as raw strings like r"foo\s*".
These patches do that for many but not for all regexes. Some are not
easy to convert and/or test.

Adrian Freihofer (7):
  oeqa/selftest/oelib/buildhistory: git default branch
  scripts: python 3.12 regex
  bitbake/lib/bs4/tests/test_tree.py: python 3.12 regex
  feature-microblaze-versions.inc: python 3.12 regex
  meta/lib/oeqa: python 3.12 regex
  meta/lib/patchtest: python 3.12 regex
  meta/recipes: python 3.12 regex

 bitbake/lib/bs4/tests/test_tree.py            |  2 +-
 .../feature-microblaze-versions.inc           |  2 +-
 meta/lib/oeqa/oetest.py                       |  2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      |  2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  6 +--
 .../oeqa/selftest/cases/oelib/buildhistory.py | 18 +++++++--
 meta/lib/patchtest/tests/base.py              |  4 +-
 meta/lib/patchtest/utils.py                   |  6 +--
 .../perf/perf/sort-pmuevents.py               |  8 ++--
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  2 +-
 scripts/combo-layer                           |  2 +-
 scripts/contrib/bbvars.py                     |  6 +--
 scripts/contrib/convert-overrides.py          |  8 ++--
 scripts/lib/checklayer/__init__.py            |  4 +-
 scripts/lib/recipetool/create.py              | 12 +++---
 scripts/lib/recipetool/create_buildsys.py     | 38 +++++++++----------
 scripts/oe-check-sstate                       |  2 +-
 scripts/oe-pkgdata-util                       |  2 +-
 scripts/opkg-query-helper.py                  |  2 +-
 scripts/patchtest-get-branch                  |  2 +-
 20 files changed, 70 insertions(+), 60 deletions(-)

-- 
2.43.0


