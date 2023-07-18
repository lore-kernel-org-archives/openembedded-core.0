Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25733C0015E
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.9083.1689690374341008979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=dB/gp4or;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-66869feb7d1so3831735b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690373; x=1692282373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp+tf9+fcNk0paEEs/jx5bvyT5YhWgAokTHUHzgXs2M=;
        b=dB/gp4or/h/gk8S/FP7iFj6Rhjn6m1SZydoJYCEM8Zkdc9IM7dKVHXq+v4I70B+P+M
         FB1mh9c9NEmCmZrmF3xWXXzEG20eB09QbqdnsM+sCaK4qjSjdI8ZDwktWOCNWwdYCNt0
         Lak1khiLvYdvaG4IOOAZrNjy7Q4OEUDch34Rd5ArrIIvm2X/nKJKoUxHNZqpOzjI6AGc
         jIi+c0+B+YY1+PB44mrgtB7WcVuB2HiHcPg19fXdbVLwEe6vvyFy5FwYoFAy1njwoAaR
         QCbsF7tmpOdglzY8uobdjOI7G4IM5AB8nRS9UtsOdVcT2W3adQ33Ey386QPmwjjXtWBC
         QBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690373; x=1692282373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp+tf9+fcNk0paEEs/jx5bvyT5YhWgAokTHUHzgXs2M=;
        b=Phba8+VCHFg2cF8ivC2GwpKxvZFc4GmOMfCVE6RKnZvKqBV/QL66WU7INYEWhypiwl
         EK9mT0Fmn3DiKB6+ESQ7C17g7Pma18rOqkU0XbbfmVmK7fA4yjgxkqfl6rUpm4CV/Fqj
         CZDIgtI1Amqy3syK9sp3qVNZJm6sIG+lzkf8c0Yz9I8/pgzZFOL8Ux43BEVNKvY0Av1p
         x7w5CLNLbW91DfDM8uhspVkB9+x/7JiQFPF5v5eh9A3VOEyRpVW6HJH012dR3MbwNWLs
         +DygfrHnttpQDHnIyBncL0rb8imD6ES+ZGuZNZP7ELy8ED3sahxO2R+VxmV7wI06WHt0
         StCw==
X-Gm-Message-State: ABy/qLZUcVJd2UByxJ3SLCgDOZd4x5dQJOXRmUYIjfhT0Fo969yffXXI
	t99B7G/ejm4oG7ZrSdiXfDHBtTH4M4Dt3iRoEIA=
X-Google-Smtp-Source: APBJJlFQy02uC+z1psQqiThbG857b7fiNFIRLJft1D8bBMaHPjDAW47TNeS9BIOg8zpVBG96M9Bv+w==
X-Received: by 2002:a05:6a00:10c6:b0:66a:2771:6c4d with SMTP id d6-20020a056a0010c600b0066a27716c4dmr17850086pfu.4.1689690373067;
        Tue, 18 Jul 2023 07:26:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/27] Patch review
Date: Tue, 18 Jul 2023 04:25:34 -1000
Message-Id: <cover.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184504

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5608

with the exception of a known intermittent issue on oe-selftest-ubuntu involving
a regression introduced in recent kernel stable branch updates:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15138

This will be fixed in an upcoming linux-yocto version bump, see thread below
for details:

https://lists.openembedded.org/g/openembedded-core/topic/99542122#182828

The following changes since commit 200c2783b3f8546f561382fff6bd5268680d403a:

  cve-update-nvd2-native: actually use API keys (2023-07-13 06:39:45 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alberto Planas (1):
  bitbake.conf: add unzstd in HOSTTOOLS

Alexander Kanavin (5):
  serf: upgrade 1.3.9 -> 1.3.10
  wget: upgrade 1.21.3 -> 1.21.4
  linux-firmware: upgrade 20230404 -> 20230515
  wireless-regdb: upgrade 2023.02.13 -> 2023.05.03
  sysfsutils: fetch a supported fork from github

Alexander Sverdlin (1):
  rust-llvm: backport a fix for build with gcc-13

Chen Qi (4):
  sdk.py: error out when moving file fails
  sdk.py: fix moving dnf contents
  zip: fix configure check by using _Static_assert
  unzip: fix configure check for cross compilation

Heiko Thole (1):
  wic: Add dependencies for erofs-utils

Hitendra Prajapati (1):
  bind : fix CVE-2023-2828 & CVE-2023-2911

Jermain Horsman (1):
  logrotate: Do not create logrotate.status file

Jose Quaresma (1):
  selftest/reproducible: Allow chose the package manager

Marek Vasut (1):
  systemd: Backport nspawn: make sure host root can write to the
    uidmapped mounts we prepare for the container payload

Mauro Queiros (1):
  pybootchartgui: show elapsed time for each task

Mikko Rapeli (1):
  selftest reproducible.py: support different build targets

Nikhil R (1):
  libpng: Add ptest for libpng

Poonam Jadhav (1):
  libx11: Fix CVE-2023-3138 for kirkstone branch

Ross Burton (1):
  tzdata: upgrade to 2023c

Soumya (2):
  perl: Fix CVE-2023-31486
  libwebp: Fix CVE-2023-1999

Tom Hochstein (1):
  cmake: Fix CMAKE_SYSTEM_PROCESSOR setting for SDK

Trevor Gamblin (1):
  vim: upgrade 9.0.1527 -> 9.0.1592

Vijay Anusuri (1):
  sqlite3: CVE-2023-36191 CLI fault on missing -nonce

Vivek Kumbhar (1):
  curl: Added CVE-2023-28320 Follow-up patch

 meta/classes/image_types_wic.bbclass          |   2 +-
 meta/conf/bitbake.conf                        |   2 +-
 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/lib/oe/package_manager/rpm/sdk.py        |   3 +-
 meta/lib/oe/sdk.py                            |   2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |  14 +-
 .../bind/bind-9.18.11/CVE-2023-2828.patch     | 197 ++++++++++++
 .../bind/bind-9.18.11/CVE-2023-2911.patch     |  97 ++++++
 .../recipes-connectivity/bind/bind_9.18.11.bb |   2 +
 meta/recipes-core/meta/wic-tools.bb           |   2 +-
 .../sysfsutils/sysfsutils_2.1.0.bb            |  10 +-
 ...-host-root-can-write-to-the-uidmappe.patch | 216 +++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 .../cmake/cmake/OEToolchainConfig.cmake       |   5 +-
 .../perl/files/CVE-2023-31486-0001.patch      | 215 +++++++++++++
 .../perl/files/CVE-2023-31486-0002.patch      |  36 +++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |   2 +
 meta/recipes-devtools/rust/rust-llvm.inc      |   4 +-
 ...-missing-cstdint-header-to-Signals.h.patch |  32 ++
 .../logrotate/logrotate_3.20.1.bb             |   1 -
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   2 -
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ------------------
 ...-fix-detection-for-cross-compilation.patch | 103 ++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 meta/recipes-extended/wget/wget.inc           |   2 +-
 .../wget/{wget_1.21.3.bb => wget_1.21.4.bb}   |   2 +-
 ...se-_Static_assert-to-do-correct-dete.patch |  96 ++++++
 meta/recipes-extended/zip/zip_3.0.bb          |   1 +
 .../xorg-lib/libx11/CVE-2023-3138.patch       | 111 +++++++
 .../xorg-lib/libx11_1.7.3.1.bb                |   1 +
 ...20230404.bb => linux-firmware_20230515.bb} |   4 +-
 ....02.13.bb => wireless-regdb_2023.05.03.bb} |   2 +-
 .../recipes-multimedia/libpng/files/run-ptest |  29 ++
 .../libpng/libpng_1.6.39.bb                   |  16 +-
 .../webp/files/CVE-2023-1999.patch            |  60 ++++
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |   4 +-
 .../curl/curl/CVE-2023-28320-fol1.patch       | 197 ++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 ...print-in-the-scons-file-to-unbreak-b.patch |  29 --
 ...sl_buckets.c-do-not-use-ERR_GET_FUNC.patch |  28 --
 ...11083-fix-building-with-scons-3.0.0-.patch |  29 --
 ...ories.without.sandbox-install.prefix.patch |   2 +-
 .../serf/{serf_1.3.9.bb => serf_1.3.10.bb}    |   6 +-
 .../sqlite/files/CVE-2023-36191.patch         |  37 +++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/wic/misc.py                       |   1 +
 scripts/pybootchartgui/pybootchartgui/draw.py |   5 +
 49 files changed, 1496 insertions(+), 429 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-header-to-Signals.h.patch
 delete mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch
 rename meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} (60%)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230404.bb => linux-firmware_20230515.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} (94%)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
 delete mode 100644 meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
 delete mode 100644 meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
 delete mode 100644 meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
 rename meta/recipes-support/serf/{serf_1.3.9.bb => serf_1.3.10.bb} (78%)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2023-36191.patch

-- 
2.34.1


