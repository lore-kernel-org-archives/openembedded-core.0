Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0250C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:10 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.1937.1709071029656837716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I7Sn7HX/;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c1a2f7e302so1225473b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071029; x=1709675829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SbZOj1Z8AHXQe36G5/ni1wGeeb/ONxD1HlSOZFuJxfY=;
        b=I7Sn7HX/gHOGl9TIHmv8SejCMiLKs3Hgal+gRKR3AX7KV2yTLAb1xsz4mHCsMBhyo1
         Q1sN1/5onwymvxegyKNixi4BEKRrhpypez3S079MSvds0y2M6MZsVmk1FSfiOwDS/s9j
         YL4gcZZ2+8ytTyvVUah9aE4SUNqAbKSf4bySfl7SAd+6G1P+THU2waeHCGb3zeCda2Vi
         FalWDHBqyuzWzf7PZjlOzV74tBRQHq0Cnak7Dt9+EAlI4ASbjPunj9M+m8j121Avn2i/
         adI+wqeVP5qJ34jrkD+XT7FAkrhgvF2XTWvaUqPzQBhWLp7/tKyY0SY+EVpnPM3mBDPB
         SAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071029; x=1709675829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbZOj1Z8AHXQe36G5/ni1wGeeb/ONxD1HlSOZFuJxfY=;
        b=OKiYDagYrmIQr+OnZKiKzw+kEWlzylc5BAT33VMf31jBlYeQZvHyqCW7itsYQ+ljH/
         RCbLv8QfJihrO5pV0R4+DUH/21A1rrPHKuZSZOVi4KAyD29zimgpLEovSFlHhEFGULGy
         kdkYrpspTgg/YdOh25jVd+VskmjflbbE/GI5s57EUfixevHNsjS7cIY1J9J2QEdJozF+
         FUIbf7NG/2P5sx1dJ6YAGKxarbioJjPFmvGFHSVPCdFS0jUqb3NjmDyToeHciK6mdJIP
         hEDdNOdyFyPyqAC24ttZ3vfCK4hoto75qcV+eZ1nj1CcYN0q7RX22DDZERpINltOBx4K
         /3jQ==
X-Gm-Message-State: AOJu0YwI0sN5DemkhrJNgCZYsNAS/F1PH0SHxeFb7GXFMG0EFGKQLED0
	MI637947l9L5mkKiAv06JmbL3S56L3Ux6v5RxbVq2tUMv/N2PrU+InwA9h/LXhrqN22i3bqjZsV
	Qra8=
X-Google-Smtp-Source: AGHT+IEIe1vWiIVF9HS5YfyPS7Vn/VjJo9UzWeDXAACjvdXfGyLVE75CRiKGpo5OzDZEz5SIqvvXIA==
X-Received: by 2002:aca:2805:0:b0:3c1:6e62:4a0e with SMTP id 5-20020aca2805000000b003c16e624a0emr2884222oix.30.1709071028805;
        Tue, 27 Feb 2024 13:57:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Patch review
Date: Tue, 27 Feb 2024 11:56:47 -1000
Message-Id: <cover.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196299

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, February 29

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6616

The following changes since commit 5103ce67741782e43612f495bcc851c6509b734b:

  runqemu: direct mesa to use its own drivers, rather than ones provided by host distro (2024-02-25 05:51:38 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Adrian Freihofer (8):
  oeqa: replace deprecated assertEquals
  oeqa/selftest/recipetool: fix for python 3.12
  oeqa/selftest/recipetool: expect meson.bb
  oeqa/selftest/oelib/buildhistory: git default branch
  feature-microblaze-versions.inc: python 3.12 regex
  meta/lib/oeqa: python 3.12 regex
  meta/recipes: python 3.12 regex
  scripts: python 3.12 regex

Bruce Ashfield (2):
  kernel: fix localversion in v6.3+
  kernel: make LOCALVERSION consistent between recipes

Chris Laplante (1):
  recipetool/create_buildsys_python: use importlib instead of imp

Ming Liu (1):
  kernel.bbclass: introduce KERNEL_LOCALVERSION

Ross Burton (3):
  populate_sdk_ext: use ConfigParser instead of SafeConfigParser
  runqemu: add qmp socket support
  oeqa/selftest/recipetool: downgrade meson version to not use
    pyproject.toml

Trevor Gamblin (1):
  scripts/runqemu: fix regex escape sequences

 meta/classes/kernel-arch.bbclass              |  1 -
 meta/classes/kernel.bbclass                   | 24 +++++++++++-
 meta/classes/kernelsrc.bbclass                |  1 +
 meta/classes/linux-kernel-base.bbclass        | 11 ++++++
 meta/classes/module-base.bbclass              |  1 +
 meta/classes/populate_sdk_ext.bbclass         |  2 +-
 meta/conf/documentation.conf                  |  1 +
 .../feature-microblaze-versions.inc           |  2 +-
 meta/lib/oeqa/oetest.py                       |  2 +-
 meta/lib/oeqa/sdk/buildtools-cases/sanity.py  |  2 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  6 +--
 meta/lib/oeqa/selftest/cases/liboe.py         |  2 +-
 .../oeqa/selftest/cases/oelib/buildhistory.py | 18 +++++++--
 meta/lib/oeqa/selftest/cases/recipetool.py    | 19 ++++++----
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |  3 ++
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
 30 files changed, 134 insertions(+), 75 deletions(-)

-- 
2.34.1


