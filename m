Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5AF7F364D2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:16 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144824.1775776272396565638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W0U61GJe;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso20433265e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776270; x=1776381070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHgEm7EJWocu7zgxzyww7lxccYBVjtojgz51olFcNtg=;
        b=W0U61GJev3fvNUISeEOJgw7Q23SIDwQZYUnQITBElI48X0Mp/TrHB0KwnX1c/W49Xg
         B44Sbmn31yuh0QnsCkuOZQ7CJ3Ap04T9DJvrBP/jqw9KiD8ZPdqMJiaLyB1ZL4sDwCzT
         Kym1Fp7fPwMiPiG7jW/T/D44xLhoZeUgph7Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776270; x=1776381070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHgEm7EJWocu7zgxzyww7lxccYBVjtojgz51olFcNtg=;
        b=E+8Bt9dsfcRQ/YfcZtv7XjpMZ5Dxdv+Vb2hBMsPblBZkmSfNHJi8jAa9flRE0apqDS
         d4tXMkTgCBQbSh9p67MgYZ99UGdUViC04w/XeaXiHGmf2K9J8bFNR+zYVVbNPo92o1vQ
         nKQhGNL2SxV+mGyz5MxOSDJldLCExtOMdReOkbChZJUNq6vn+S8SMCdWWx22Z8vap633
         zHYPpoj8R3Lu7uAwpPGJQpPsfMhBKUH26/gsLJmoG8/VfboCsjqoKrFV3uogTRA6P0QI
         6sPUNhteun+XLhS4xhAD7IMnj8E9yt7Fe1ZVOLV7RSS7hXnMROf+9tuQIZW51LZf12XF
         PU7Q==
X-Gm-Message-State: AOJu0Yx5M2jcos8BJ7LAloZSg5jxC6++XGjeFYfDTzrwyS/Do+xETGxY
	MxBbtx/MYaXcKvBwHS2Myso+Nn71AmUSuvl2z+TGPa2PSGNvxtaSdz+FXQR76xs4oAQR3aMH9qX
	fDVhyR83QOPUb
X-Gm-Gg: AeBDietUOiTUm4TDmpCZm2h/Aolm0oikGdEtMgZOnrVTJgffS8GwKq5f53zXWPFXylK
	Ybj30pVNkLMojKqpsew0GJP9hZ6XapmqzpoeCtVa11BDpPxHiXaAASXadxFr0h7TWVh3jHGnoYZ
	qJeWaljlFOLhd7cDrmWkQ7wd6Tp53nN3+uOh759votd+JpLz7EVZCeddFtDm6FlzgfpN462LhOL
	1N24BJAvMyN6YIu/xMY8uLuGZojOOvinbRvx9Y5NMEHNXRdcK3SLLzJ4Cv4OvAMSWWGui4nIu+t
	BDTW7TI65RgTPGhNMLR2s2C6hd517Z+Q/jadVbT9Oz0i6KZzmIZs6uoawpdORNaaKk/qLDU6cZi
	ixAKtoM8oKzwoD19cTpQgavRMhz91UXFYuvJEXVl40qkm0u+KDFmzGuYkrvJkxQav+8mkEKgYDp
	cusx5ApSHGQl7fi4FjIwMHA026wv0oXgChv3ZHdgMDg3gyjs8DqKAVomeu4JQPQxJvIaAvQk1Bi
	8+J+3L0oiJ7LVAzjLvc03aKNd58Jba0+CktMmc=
X-Received: by 2002:a05:600c:a306:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-488d68607e8mr5363115e9.21.1775776270297;
        Thu, 09 Apr 2026 16:11:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 00/30] Patch review
Date: Fri, 10 Apr 2026 01:10:00 +0200
Message-ID: <cover.1775775154.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234959

Please review this set of changes for kirkstone and have comments back by
Friday, April 10 (10:00:00 UTC). I'm aware this is a bit short. Ping me
if you plan to review and need more time.

Please note: This will be the last review cycle for kirkstone.

A previous version of the branch passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3631
Impacted by #15467 – AB-INT PTEST: tcl ptest failure: in http11.test.
I backported the fix, and restarted the build:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3635

v3->v4:
- Added a backport to fix #15467:
  - tcl: skip http11 tests
- Added vim CVE fixes:
  - vim: Fix CVE-2026-28419
  - vim: Fix CVE-2026-28418
  - vim: Fix CVE-2026-26269
  - vim: Fix CVE-2026-25749
- Added fixes for shutdown git protocol on YP/OE repos:
  - selftest/scripts: Update old git protocol references
  - recipetool: Recognise https://git. as git urls
  - scripts: Default to https git protocol for YP/OE repos
  - oeqa/sdk: Default to https git protocol for YP/OE repos
  - oeqa/manual: Default to https git protocol for YP/OE repos
  - recipes: Default to https git protocol for YP/OE repos

v2->v3:
- Added ncurses:·fix·for·CVE-2025-69720 to the series

v1->v2:
- replaced "python3: Fix CVE-2025-15282" with
  "python3: upgrade 3.10.19 -> 3.10.20"
- Those patches are not held anymore since equivalent patches have been
  sent to more recent branches:
    - curl: patch CVE-2026-3784
    - curl: patch CVE-2026-3783
    - curl: patch CVE-2026-1965
    - vim: Fix CVE-2026-33412
The following changes since commit c4194cadb1180da37514c55cd97827eb0269c8e2:

  build-appliance-image: Update to kirkstone head revision (2026-03-20 09:58:53 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

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


