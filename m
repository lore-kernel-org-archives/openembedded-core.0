Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66851E9907B
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:28:31 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153094.1775816899816377839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kqXM+HkB;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso1900526f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775816898; x=1776421698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbtX2WoHA4ii6QO/laRDPzG1urp4oo2kuLoHtprLTEE=;
        b=kqXM+HkBRCACNdsyDmgzUWQzPtZsSI9w15qQyzQ5RQ5Lt68vi0IZ8T6cnD5DxlmJsX
         ikLUwqi1llxtXvGB9VIYu2vHn3wIQ8g9/pSf7KENmRI5fz+GDnSQ17HBOslDXIZisGSX
         mGXXoRcngBbsGclyTw6bxEVEpb1q+4dei0Flg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816898; x=1776421698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbtX2WoHA4ii6QO/laRDPzG1urp4oo2kuLoHtprLTEE=;
        b=X5XuOPBdUkc9R54Y62Gz1UTxSZJVs4M4jMpjaNrT3myYBSau4gdGkOn9jdvBQxQXoY
         mRKP1bgad/XXfvmzmy0A63Q+BVX0PYK0KYjhAipB9+AGiOf3qhTpsLgRQ3xywjBxeG8k
         iKmHi0K7Mm8dmZ2kMv+lgQPUfI+WkYqusq4PIkloljkfgCH+J6amRRd/wR94G8H4tQ/A
         ozkwaOnjN6dXF4z4nTzz3H9IsBm2QAKoDa3O2oBG/HbqdxMk++6wWc7XRZHbw5I+y7d6
         EftFAYs4A231nzf3SPqq0bi69PaYP96W5NQZOFIshqMQ40sK71OHZwUfWvTAn97RLJZ8
         Jvcw==
X-Gm-Message-State: AOJu0Yx9ylGtyVaRZtPtfik4XqgxyWqLY5Yp69xJmFnURXyVZsrghkdt
	g0BSLX0LJiUDyRsD85riiXS4jXcDa7P6nYskMqSMN+grWj/8j4JcGiM1JySMYU4fyvq7uLUZ9Zi
	Aw5zuq1vEPh6X
X-Gm-Gg: AeBDiesRTlmz/bF0bH10Ke3JmD8tNctNu74m6B1FcmBHA8Hr+ZoOdX6xXDi2eL9qNhJ
	GLKgiRgvlLUGmeLcVq6fft20M+V/sM7oZRBzcTkQBXzmacjLZ3GjBajmCkGa5MBmThh8XnEn+gi
	yxq0NmAuRzGitI/IrH6gQryIZxr/foyKT3KXhYYMhEYzTxGOn1Qw7vzTo+MMg3TswL0UWYxxNgZ
	8Sy8r1IYW784TVIpSMuicY9QZdm2QW558AVR7rkjEet7rQ/3xssByUkRj8psZQJ8Es3BEIacqM/
	3Pf4mH2GNsnz+EF7gtnVzE9S+MZjz8PSiLb97FfiEH/HnmcuIY5yYssSK/3KdMq2geA19zkkGBl
	4bzSbCRizRrMD+cLi1TD/yGWR5t8I73Khf4BCppdkXcZlnNj28EHftixMRf/v8TXELYRfva2iVW
	Uw0ec/0DxKgXw/q24G+wOvBJPw8/SFNIwoemU20g6wmTbhWVciQu1RSR5x2VorAYdeK2j9eyDPm
	I0XUTFMnVmLvofRjhD0TkRnaYuO
X-Received: by 2002:a05:6000:2010:b0:43c:fde7:f1 with SMTP id ffacd0b85a97d-43d6429b884mr3851665f8f.18.1775816897833;
        Fri, 10 Apr 2026 03:28:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bcd4fc1a1ff2417c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bcd4:fc1a:1ff2:417c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5d85fsm5470409f8f.36.2026.04.10.03.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:28:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][kirkstone 00/30] Pull request (cover letter only)
Date: Fri, 10 Apr 2026 12:28:03 +0200
Message-ID: <cover.1775816685.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235015

Those are the patches from the last patch review:
[OE-core][kirkstone v4 00/30] Patch review
https://lore.kernel.org/openembedded-core/cover.1775775154.git.yoann.congal@smile.fr/T/#t

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3635

The following changes since commit c4194cadb1180da37514c55cd97827eb0269c8e2:

  build-appliance-image: Update to kirkstone head revision (2026-03-20 09:58:53 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

for you to fetch changes up to f2bc121f821f684a541b1f4e317078c50d29c389:

  scripts/install-buildtools: Update to 4.0.34 (2026-04-10 00:51:17 +0200)

----------------------------------------------------------------

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.200
  linux-yocto/5.15: update to v5.15.201

Fabien Thomas (1):
  README.OE-Core: update contributor links and add kirkstone prefix

Hitendra Prajapati (6):
  vim: Fix CVE-2026-33412
  ncurses: fix for CVE-2025-69720
  vim: Fix CVE-2026-25749
  vim: Fix CVE-2026-26269
  vim: Fix CVE-2026-28418
  vim: Fix CVE-2026-28419

Jinfeng Wang (1):
  tzdata/tzcode-native: upgrade 2025c -> 2026a

Paul Barker (1):
  create-pull-request: Keep commit hash to be pulled in cover email

Peter Marko (1):
  libtheora: mark CVE-2024-56431 as not vulnerable yet

Richard Purdie (2):
  recipetool: Recognise https://git. as git urls
  selftest/scripts: Update old git protocol references

Ross Burton (1):
  tcl: skip http11 tests

Vijay Anusuri (10):
  tzdata,tzcode-native: Upgrade 2025b -> 2025c
  python3: upgrade 3.10.19 -> 3.10.20
  python3-pyopenssl: Fix CVE-2026-27448
  python3-pyopenssl: Fix CVE-2026-27459
  libarchive: Fix CVE-2026-4111
  sqlite3: Fix CVE-2025-70873
  curl: patch CVE-2025-14524
  curl: patch CVE-2026-1965
  curl: patch CVE-2026-3783
  curl: patch CVE-2026-3784

Yoann Congal (5):
  recipes: Default to https git protocol for YP/OE repos
  oeqa/manual: Default to https git protocol for YP/OE repos
  oeqa/sdk: Default to https git protocol for YP/OE repos
  scripts: Default to https git protocol for YP/OE repos
  scripts/install-buildtools: Update to 4.0.34

 README.OE-Core.md                             |  10 +-
 .../devtool/devtool-upgrade-test2_git.bb      |   2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |   2 +-
 meta/lib/oeqa/manual/crops.json               |   2 +-
 meta/lib/oeqa/manual/eclipse-plugin.json      |   2 +-
 .../oeqa/manual/toaster-unmanaged-mode.json   |   2 +-
 .../oeqa/sdk/buildtools-docs-cases/build.py   |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   4 +-
 meta/lib/oeqa/selftest/cases/externalsrc.py   |   2 +-
 meta/lib/oeqa/selftest/cases/fetch.py         |   2 +
 meta/lib/oeqa/selftest/cases/recipetool.py    |   8 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |   2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |   2 +-
 .../images/build-appliance-image_15.0.0.bb    |   2 +-
 .../ncurses/files/CVE-2025-69720.patch        |  42 ++
 .../ncurses/ncurses_6.3+20220423.bb           |   1 +
 meta/recipes-core/psplash/psplash_git.bb      |   2 +-
 .../update-rc.d/update-rc.d_0.8.bb            |   2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++
 .../python3-pyopenssl/CVE-2026-27459.patch    | 106 +++++
 .../python/python3-pyopenssl_22.0.0.bb        |   5 +
 .../python/python3/CVE-2025-12084.patch       | 171 --------
 .../python/python3/CVE-2025-13836.patch       | 163 --------
 .../python/python3/CVE-2025-13837.patch       | 162 --------
 .../python/python3/CVE-2025-6075.patch        | 364 ------------------
 ...{python3_3.10.19.bb => python3_3.10.20.bb} |   6 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   4 +-
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 +++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../libfakekey/libfakekey_git.bb              |   2 +-
 .../libmatchbox/libmatchbox_1.12.bb           |   2 +-
 .../matchbox-wm/matchbox-wm_1.2.2.bb          |   2 +-
 .../xcursor-transparent-theme_git.bb          |   2 +-
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
 .../linux/linux-yocto-rt_5.10.bb              |   4 +-
 .../linux/linux-yocto-rt_5.15.bb              |  10 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   4 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  10 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  30 +-
 .../libtheora/libtheora_1.1.1.bb              |   3 +
 .../matchbox-config-gtk_0.2.bb                |   2 +-
 .../matchbox-desktop/matchbox-desktop_2.2.bb  |   2 +-
 .../matchbox-keyboard_0.1.1.bb                |   2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.11.bb |   2 +-
 .../matchbox-terminal_0.2.bb                  |   2 +-
 .../matchbox-theme-sato_0.2.bb                |   2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |   2 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |   2 +-
 .../curl/curl/CVE-2025-14524.patch            |  42 ++
 .../curl/curl/CVE-2026-1965-1.patch           |  98 +++++
 .../curl/curl/CVE-2026-1965-2.patch           |  29 ++
 .../curl/curl/CVE-2026-3783-pre1.patch        |  66 ++++
 .../curl/curl/CVE-2026-3783.patch             | 157 ++++++++
 .../curl/curl/CVE-2026-3784.patch             |  73 ++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   6 +
 .../ptest-runner/ptest-runner_2.4.2.bb        |   2 +-
 .../sqlite/files/CVE-2025-70873.patch         |  33 ++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 .../vim/files/CVE-2026-25749.patch            |  64 +++
 .../vim/files/CVE-2026-26269.patch            | 150 ++++++++
 .../vim/files/CVE-2026-28418.patch            |  78 ++++
 .../vim/files/CVE-2026-28419.patch            |  86 +++++
 .../vim/files/CVE-2026-33412.patch            |  61 +++
 meta/recipes-support/vim/vim.inc              |   5 +
 scripts/combo-layer.conf.example              |   4 +-
 scripts/contrib/patchtest.sh                  |   4 +-
 scripts/create-pull-request                   |   2 +-
 scripts/install-buildtools                    |   4 +-
 scripts/lib/recipetool/create.py              |   2 +-
 74 files changed, 1662 insertions(+), 947 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch
 rename meta/recipes-devtools/python/{python3_3.10.19.bb => python3_3.10.20.bb} (98%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-26269.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch


