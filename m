Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFE6C27C44
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:24:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.36104.1717244693051538302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gCRYs4DB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f61f775738so20242275ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244692; x=1717849492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s6fVkykf3wrPhFLfzna+97M+jry6FS77iG4i8YDPYrs=;
        b=gCRYs4DBwSUjpThKaYVfoGricQLJTqHQVr9LNSc22sJJoS+qqW6xt8wgAQ2VltuMT7
         iK2gfS7/XjJ3pejv2vlJGJbuzrGok5PFVoypOZtXSU20Z44QmcQAawPMl7Ewl7/FwXGJ
         LqAcg1B+ER2raWULPobbmmC9W6oNUghvAwzPBxId6dyD+n45uhGuY0fETZ77aJ3QZK/U
         sgC4PEZfdTi49lr1GU0d1Lj6y3dthk91ZIe4epmT3hCjHkdnjXFm3Ac/jNOeqXMfrbOj
         L2Ah2gFjzdcM7sAKFFd9etVRasnVHU+MAf5LU48P930gL7Fo81LklgCJXfeVAv51dHj7
         ZBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244692; x=1717849492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6fVkykf3wrPhFLfzna+97M+jry6FS77iG4i8YDPYrs=;
        b=R6V6kLroc4KPVNH6hLLIo+Cr44dNTsXdbXEq11s3UUNbJT8YEKdhckC+IOWFaTcMbV
         2iveur80Zrm+GW28zwiWX9HdOW4eUBjYfdtKv0TcEEJoZnychH/qdlawJXTsEkdI4Gw4
         OrCx5+6x04ZSP0k2xZ4U7sGomFRA8tGcio0p04A/q2KlRWXNoekrDsGvYrBEWBamL5IW
         z8mqfRl/4Wq7+cl9dnaCKjvsIKPwGCSzNEZxgYmA5zFrkjSB1uhLBBFGjOAuY90y7DKJ
         NEbgi0BK/Og0j29EObKXQkXkVDzVkhL69JP0gcyH3AV3ydj0dv0uxCHBsD82+7+qEmGk
         4tDA==
X-Gm-Message-State: AOJu0Yy9ZoJUXhCw+OehQxPzwB8T84vu9Bv+txPpAzl2CfvdJAG0urIQ
	IZHk6BbiHHNW2MGVUcFqKzyLFCpXGYe9tpAanjKfenKZho0+AWyQpOUrQHVdg7cnlYZiRT0FJ24
	1
X-Google-Smtp-Source: AGHT+IGcDATK5FN7ye5I9Q881XToqoFULoLwzPq0VDCSYvG8ze6IQBvWOPq/IW9CjjZhby0TeIglbw==
X-Received: by 2002:a17:902:d2d0:b0:1f4:5c4b:dc6b with SMTP id d9443c01a7336-1f6370bd0ecmr47782765ad.47.1717244691896;
        Sat, 01 Jun 2024 05:24:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.24.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:24:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/21] Patch review
Date: Sat,  1 Jun 2024 05:24:26 -0700
Message-Id: <cover.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200096

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, June 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6993

with two exceptions, the first a known reproducibility issue also present
on master:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15491

and the second is a failure on meta-agl-core, which will require an update
to the ptest-runner override in meta-agl once "ptest-runner: Bump to 2.4.4 (95f528c)"
merges.


The following changes since commit 0795169be206f1d4d140fe378e2476a44d0ce02b:

  oeqa/selftest/debuginfod: use localpkgfeed to speed server startup (2024-05-19 13:50:01 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (5):
  ghostscript: fix CVE-2024-33870
  ghostscript: fix CVE-2024-33869
  ghostscript: fix CVE-2024-33871
  ghostscript: fix CVE-2024-29510
  xserver-xorg: upgrade 21.1.11 -> 21.1.12

Changqing Li (1):
  ptest-runner: Bump to 2.4.4 (95f528c)

Julien Stephan (2):
  devtool: standard: update-recipe/finish: fix update localfile in
    another layer
  oeqa/selftest/devtool: add test for updating local files into another
    layer

Khem Raj (3):
  llvm: Upgrade to 18.1.4
  llvm: Upgrade to 18.1.5
  llvm: Switch to using release tarballs

Marek Vasut (1):
  gstreamer1.0-plugins-good: Include qttools-native during the build
    with qt5 PACKAGECONFIG

Mark Hatle (1):
  gcc: Fix for CVE-2024-0151

Peter Marko (2):
  ttyrun: define CVE_PRODUCT
  update-rc.d: add +git to PV

Philip Lorenz (2):
  lib/package_manager/ipk: Do not hardcode payload compression algorithm
  ipk: Fix clean up of extracted IPK payload

Rasmus Villemoes (1):
  git: set --with-gitconfig=/etc/gitconfig for -native builds

Ricardo Simoes (1):
  libusb1: Set CVE_PRODUCT

Soumya Sambu (1):
  ncurses: Fix CVE-2023-45918

Yogita Urade (1):
  libarchive: upgrade 3.7.2 -> 3.7.4

 meta/lib/oe/package_manager/ipk/__init__.py   |  14 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  20 +-
 .../ncurses/files/CVE-2023-45918.patch        | 180 ++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 meta/recipes-core/ttyrun/ttyrun_2.31.0.bb     |   2 +
 .../update-rc.d/update-rc.d_0.8.bb            |   1 +
 meta/recipes-devtools/gcc/gcc-13.2.inc        |   1 +
 .../gcc/gcc/CVE-2024-0151.patch               | 315 ++++++++++++++++++
 meta/recipes-devtools/git/git_2.44.0.bb       |   1 +
 .../llvm/{llvm_git.bb => llvm_18.1.5.bb}      |  13 +-
 .../ghostscript/CVE-2024-29510.patch          |  84 +++++
 .../ghostscript/CVE-2024-33869-0001.patch     |  39 +++
 .../ghostscript/CVE-2024-33869-0002.patch     |  52 +++
 .../ghostscript/CVE-2024-33870.patch          |  99 ++++++
 .../ghostscript/CVE-2024-33871.patch          |  43 +++
 .../ghostscript/ghostscript_10.02.1.bb        |   5 +
 .../libarchive/libarchive/configurehack.patch |  19 +-
 ...ibarchive_3.7.2.bb => libarchive_3.7.4.bb} |   2 +-
 ...org_21.1.11.bb => xserver-xorg_21.1.12.bb} |   2 +-
 .../gstreamer1.0-plugins-good_1.22.11.bb      |   2 +-
 meta/recipes-support/libusb/libusb1_1.0.27.bb |   2 +
 ...-runner_2.4.3.bb => ptest-runner_2.4.4.bb} |   2 +-
 scripts/lib/devtool/standard.py               |  23 +-
 23 files changed, 888 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-45918.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
 rename meta/recipes-devtools/llvm/{llvm_git.bb => llvm_18.1.5.bb} (93%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29510.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33869-0002.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.7.2.bb => libarchive_3.7.4.bb} (96%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.11.bb => xserver-xorg_21.1.12.bb} (92%)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb} (95%)

-- 
2.34.1


