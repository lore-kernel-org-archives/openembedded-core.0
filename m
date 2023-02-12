Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0EAC636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:10:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.20813.1676236249693722551
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cNopAYxq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id o8so9256158pls.11
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6M7Bl4phtJZB8c+i4H5ca79sdv0lTVClRr9G+g+Gpko=;
        b=cNopAYxqPVltN9gvBhIIbmMcLsO5SiOp0yNmz94XQ7FM/9SlBXGwLXEGX238y7pkK7
         olbyvLWZWpnGMngvLVJlgzSf8Vxl2BtHEnjZubtjtyzwKO71U0ft+Lg7RVaxlNzOwrk8
         QtVFXVzgVsjy1YlvgcpkOWe8j8CfjohNeNgxQ+FUcG2O9Sy8aYRSXum0NV5h8ojNYpQh
         PIJcc7Dd7GKa9Km1QNb1t35lE3lk6NI1AQYmuLvY04LP6WV3JmTmkPWXV9lpefMPDvMx
         E76xtaD8Y2YFk6LNmhoybHcESJjeIjRvfPzZxd34yoFJkklg/HjzSrlLvzEdMv3cuN9l
         0CJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6M7Bl4phtJZB8c+i4H5ca79sdv0lTVClRr9G+g+Gpko=;
        b=DmS3K3gMQPbr0CsObU65kzoUsmIO1zdjY9z8YKe4ObfeoNCqCSUAkCiSl4ncmsu2XS
         L+enCHmHoHbL8p28SkjSnVN+w2osPnxSelvOH4X5ndnOthuX7OP2hXcRmSuvVq9etezp
         MAIkkFTZxt8DI10jPqWjKsAwl6sVYUmA70iFc3kgSpIYI5ShEKirRQf3m7JK4pL/LRI6
         ueTCZbui/7+Ar01JOpwLK+xzvW13R7bfthSzzUCZ55g343+b4ngf2oDrZ9+Fl1C4WB7v
         o1QCXz04EY/ZXGhI6ZCNtHhL0RpPsihq31gTCw+1fV6qTqIvb7xGiQ8Kx1OhB9MpZYwh
         qBCw==
X-Gm-Message-State: AO0yUKWq99yhIqe06BLjfJ4CmWMK/m2dfojqNS0Dr/jk1E0dzj658QWZ
	++BCa/6U/E84c38HUicYqGfD8QoM2yFnJUwhQGQ=
X-Google-Smtp-Source: AK7set9wJTj9FgWFS+cTwTkiZqMBJxIY2WMw0dtlM0jYJDZLIG7aGaeaUdS/IOSKklMKTm5g21BUag==
X-Received: by 2002:a17:902:bb8c:b0:199:2e9b:622a with SMTP id m12-20020a170902bb8c00b001992e9b622amr17468545pls.50.1676236248125;
        Sun, 12 Feb 2023 13:10:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.10.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:10:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/27] Patch review
Date: Sun, 12 Feb 2023 11:10:16 -1000
Message-Id: <cover.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177044

Please review these patches for kirkstone and have comments back by end
of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4921

The following changes since commit cb64ace13db85e143d99627c8803fbb13ba18617:

  Fix missing leading whitespace with ':append' (2023-02-01 04:16:52 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alejandro Hernandez Samaniego (1):
  testimage: Fix error message to reflect new syntax

Alexander Kanavin (3):
  vulkan-samples: branch rename master -> main
  gdk-pixbuf: do not use tools from gdk-pixbuf-native when building
    tests
  oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with
    a signal

Arnout Vandecappelle (1):
  python3-pytest: depend on python3-tomli instead of python3-toml

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.89
  linux-yocto/5.15: update to v5.15.91

Changqing Li (1):
  apt: fix do_package_qa failure

Chee Yang Lee (1):
  git: upgrade to 2.35.6

Harald Seiler (1):
  bootchart2: Fix usrmerge support

Khem Raj (2):
  scons: Pass MAXLINELENGTH to scons invocation
  scons.bbclass: Make MAXLINELENGTH overridable

Louis Rannou (1):
  oeqa/selftest/locales: Add selftest for locale generation/presence

Martin Jansa (1):
  meta: remove True option to getVar and getVarFlag calls (again)

Mikko Rapeli (1):
  oeqa context.py: fix --target-ip comment to include ssh port number

Mingli Yu (1):
  glslang: branch rename master -> main

Narpat Mali (1):
  python3-certifi: fix for CVE-2022-23491

Pawel Zalewski (1):
  classes/fs-uuid: Fix command output decoding issue

Richard Purdie (3):
  kernel/linux-kernel-base: Fix kernel build artefact determinism issues
  make-mod-scripts: Ensure kernel build output is deterministic
  libc-locale: Fix on target locale generation

Ross Burton (4):
  git: ignore CVE-2022-41953
  buildtools-tarball: set pkg-config search path
  sdkext/cases/devtool: pass a logger to HTTPService
  httpserver: add error handler that write to the logger

Ulrich Ölmann (2):
  recipe_sanity: fix old override syntax
  lsof: fix old override syntax

 meta/classes/fs-uuid.bbclass                  |   2 +-
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/kernel.bbclass                   |   3 -
 meta/classes/libc-package.bbclass             |   1 +
 meta/classes/license_image.bbclass            |   2 +-
 meta/classes/linux-kernel-base.bbclass        |   4 +
 meta/classes/recipe_sanity.bbclass            |   2 +-
 meta/classes/scons.bbclass                    |   8 +-
 meta/classes/testimage.bbclass                |   2 +-
 meta/lib/oe/package_manager/deb/__init__.py   |   8 +-
 meta/lib/oeqa/runtime/context.py              |   4 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |   2 +-
 meta/lib/oeqa/selftest/cases/locales.py       |  45 ++++
 meta/lib/oeqa/utils/httpserver.py             |   6 +
 meta/lib/oeqa/utils/qemurunner.py             |  11 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   3 +
 meta/recipes-devtools/apt/apt_2.4.5.bb        |   1 +
 .../0001-bootchart2-support-usrmerge.patch    |  37 ---
 .../bootchart2/bootchart2_0.14.9.bb           |  11 +-
 .../git/{git_2.35.5.bb => git_2.35.6.bb}      |   4 +-
 meta/recipes-devtools/go/go_1.17.13.bb        |   4 +-
 .../python3-certifi/CVE-2022-23491.patch      | 230 ++++++++++++++++++
 .../python/python3-certifi_2021.10.8.bb       |   2 +
 .../python/python3-pytest_7.1.1.bb            |   2 +-
 meta/recipes-devtools/rust/rust-common.inc    |   2 +-
 meta/recipes-devtools/rust/rust.inc           |  20 +-
 meta/recipes-extended/lsof/lsof_4.94.0.bb     |   2 +-
 .../0001-Add-use_prebuilt_tools-option.patch  | 173 -------------
 ...w-a-subset-of-tests-in-cross-compile.patch |  66 +++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  17 +-
 .../glslang/glslang_1.3.204.1.bb              |   2 +-
 .../vulkan/vulkan-samples_git.bb              |   2 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +-
 scripts/contrib/image-manifest                |   2 +-
 scripts/lib/devtool/menuconfig.py             |   2 +-
 38 files changed, 432 insertions(+), 292 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
 rename meta/recipes-devtools/git/{git_2.35.5.bb => git_2.35.6.bb} (97%)
 create mode 100644 meta/recipes-devtools/python/python3-certifi/CVE-2022-23491.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch

-- 
2.34.1


