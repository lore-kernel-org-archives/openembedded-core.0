Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF079EB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:49 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.61458.1688484580834701278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cdZETSe3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b8033987baso34782305ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484580; x=1691076580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WcRMoWZdD+oHBS7u41NZOoI8EEWWBg/7mopsIHfzqeM=;
        b=cdZETSe3VSmr+cCPngzn6PXnpNNsJ0nOYjY0hi2B0pFmQ52yHFN8t6JoUhGNL7p78e
         Mvp5fWbeui+sUlTDk/xvcXDNOersR0wZe9syWGS/H9irKbLOVaNVEBq4gqVA9bsS+ag+
         o/xYin7vw5jCht06g2NZ5AzqDxZLo6q40iOcQD5oUMkyqdZUUsjivqFrf5QZoBPXeAUG
         j+L6fAwS8IZUTWJlDmd8kdWxioL29UGbaY+KgX+uC0hk3Kr4/jqYFTSLYgTe2g7UuLEJ
         Zyo+nk7LTv7PYrN7j8x+SLbVs080Bqrmys9EXtPva1Uzz71EAYIj4XaewazqEvJ2NdCK
         dyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484580; x=1691076580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WcRMoWZdD+oHBS7u41NZOoI8EEWWBg/7mopsIHfzqeM=;
        b=Z58YJsenoI6VgfN4+OCy0XEVvp1JlFZQMce+TGLaq0Gac6EUnWWSOq07JjltRv6An6
         ut5whCZEA4YJJ5dmuFNkcmlPfDyt9efAjzH19IW59YS6uwQmcgJ3zDDVlwFJb4j5jx3c
         8iU83aO4ybcHMBTWQySAORT8F8Cs3JlVKR/LoayAmtTJDG2WUWP6EqcG9G6LS9wldk/n
         thHxYEULC/Teho512hj01TAPt+wMP4urtCUAtJXruf0q9EIvP+VHK/jx2ILPDIgDS197
         kJEZnHc6mPed2mgKaoPtO1K2yLggk6yl6EtnpbxFrBnG1yNmq3pKSk8RP5GRsqkhA/Np
         jzYw==
X-Gm-Message-State: ABy/qLZho51ZdroJDDLAC0tbssxXETV3dPgb0+by5zjhWUSnJ+8A7l48
	z3P/lhcewsZAJa3tL8v4igOgKCS2BdTUdUjShLF/IQ==
X-Google-Smtp-Source: APBJJlFMgpNKDwJHaU1oRdWgK6odmiYnxazKTLdUezgnmHODOjJI4uIFxUz7xoihN5zkqoD/tU9lug==
X-Received: by 2002:a17:902:d501:b0:1b2:676d:1143 with SMTP id b1-20020a170902d50100b001b2676d1143mr21877139plg.15.1688484579488;
        Tue, 04 Jul 2023 08:29:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/30] Patch review
Date: Tue,  4 Jul 2023 05:29:02 -1000
Message-Id: <cover.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183835

Please review this set of changes for mickledore and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5556

The following changes since commit ce5337d19ad290f30c0250158a1833a2cc3bd0ac:

  grub: submit determinism.patch upstream (2023-06-29 06:22:29 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alberto Planas (1):
  bitbake.conf: add unzstd in HOSTTOOLS

Alexander Kanavin (9):
  gawk: upgrade 5.2.1 -> 5.2.2
  gnupg: upgrade 2.4.0 -> 2.4.2
  libx11: upgrade 1.8.4 -> 1.8.5
  linux-firmware: upgrade 20230404 -> 20230515
  serf: upgrade 1.3.9 -> 1.3.10
  wget: upgrade 1.21.3 -> 1.21.4
  wireless-regdb: upgrade 2023.02.13 -> 2023.05.03
  gdb: upgrade 13.1 -> 13.2
  sysfsutils: fetch a supported fork from github

Changqing Li (2):
  dnf: only write the log lock to root for native dnf
  rootfs-postcommands.bbclass: add post func remove_unused_dnf_log_lock

Chen Qi (7):
  sdk.py: error out when moving file fails
  sdk.py: fix moving dnf contents
  rpm: write macros under libdir
  zip: fix configure check by using _Static_assert
  zip: remove unnecessary LARGE_FILE_SUPPORT CLFAGS
  unzip: fix configure check for cross compilation
  unzip: remove hardcoded LARGE_FILE_SUPPORT

Jermain Horsman (1):
  logrotate: Do not create logrotate.status file

Khem Raj (3):
  rpcsvc-proto: Upgrade to 1.4.4
  libxml2: Do not use lld linker when building with tests on rv64
  python3-bcrypt: Use BFD linker when building tests

Richard Purdie (5):
  strace: Merge two similar patches
  strace: Update patches/tests with upstream fixes
  ptest-runner: Pull in sync fix to improve log warnings
  ptest-runner: Ensure data writes don't race
  ptest-runner: Pull in "runner: Remove threads and mutexes" fix

Soumya (1):
  perl: Fix CVE-2023-31484 & CVE-2023-31486

Trevor Gamblin (1):
  glib-networking: use correct error code in ptest

 .../rootfs-postcommands.bbclass               |   7 +
 meta/conf/bitbake.conf                        |   2 +-
 meta/lib/oe/package_manager/rpm/sdk.py        |   3 +-
 meta/lib/oe/sdk.py                            |   2 +-
 .../glib-networking/eagain.patch              |   2 +-
 meta/recipes-core/libxml/libxml2_2.10.4.bb    |   2 +
 .../sysfsutils/sysfsutils_2.1.0.bb            |  10 +-
 meta/recipes-devtools/dnf/dnf_4.14.0.bb       |   3 +-
 ...ian_13.1.bb => gdb-cross-canadian_13.2.bb} |   0
 .../{gdb-cross_13.1.bb => gdb-cross_13.2.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   4 +-
 ...r-valid-inferior-thread-regcache-bef.patch | 286 ------------------
 ...low.cc-Fix-a-typo-in-ternary-operato.patch |  24 --
 .../gdb/{gdb_13.1.bb => gdb_13.2.bb}          |   0
 .../perl/files/CVE-2023-31484.patch           |  29 ++
 .../perl/files/CVE-2023-31486-0001.patch      | 217 +++++++++++++
 .../perl/files/CVE-2023-31486-0002.patch      |  30 ++
 meta/recipes-devtools/perl/perl_5.36.0.bb     |   3 +
 .../python/python3-bcrypt_4.0.1.bb            |   1 +
 meta/recipes-devtools/rpm/rpm_4.18.1.bb       |   5 +-
 ...0001-caps-abbrev.awk-fix-gawk-s-path.patch |  47 ---
 ...b541b258baec9eba674b5d8dc30007a61542.patch |  50 +++
 ...2f4494779e5c5f170ad10539bfc2dfafe967.patch |  50 +++
 .../strace/strace/skip-sockopt-test.patch     |  37 ---
 .../strace/strace/update-gawk-paths.patch     |  30 ++
 meta/recipes-devtools/strace/strace_6.2.bb    |   4 +-
 .../gawk/{gawk_5.2.1.bb => gawk_5.2.2.bb}     |   2 +-
 .../logrotate/logrotate_3.21.0.bb             |   1 -
 .../rpcsvc-proto/rpcsvc-proto.bb              |   5 +-
 ...FILE-macro-to-control-largefile-supp.patch |  80 -----
 .../0001-Use-cross-compiled-rpcgen.patch      |  11 +-
 ...-fix-detection-for-cross-compilation.patch | 103 +++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   4 +-
 meta/recipes-extended/wget/wget.inc           |   2 +-
 .../wget/{wget_1.21.3.bb => wget_1.21.4.bb}   |   2 +-
 ...se-_Static_assert-to-do-correct-dete.patch |  96 ++++++
 meta/recipes-extended/zip/zip_3.0.bb          |   4 +-
 .../{libx11_1.8.4.bb => libx11_1.8.5.bb}      |   2 +-
 ...20230404.bb => linux-firmware_20230515.bb} |   4 +-
 ....02.13.bb => wireless-regdb_2023.05.03.bb} |   2 +-
 ...-a-custom-value-for-the-location-of-.patch |   6 +-
 .../gnupg/gnupg/relocate.patch                |  18 +-
 .../gnupg/{gnupg_2.4.0.bb => gnupg_2.4.2.bb}  |   2 +-
 .../ptest-runner/ptest-runner_2.4.2.bb        |   2 +-
 ...print-in-the-scons-file-to-unbreak-b.patch |  29 --
 ...sl_buckets.c-do-not-use-ERR_GET_FUNC.patch |  28 --
 ...11083-fix-building-with-scons-3.0.0-.patch |  29 --
 ...ories.without.sandbox-install.prefix.patch |   2 +-
 .../serf/{serf_1.3.9.bb => serf_1.3.10.bb}    |   6 +-
 49 files changed, 664 insertions(+), 624 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_13.1.bb => gdb-cross-canadian_13.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_13.1.bb => gdb-cross_13.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-aarch64-Check-for-valid-inferior-thread-regcache-bef.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-gdbserver-linux-low.cc-Fix-a-typo-in-ternary-operato.patch
 rename meta/recipes-devtools/gdb/{gdb_13.1.bb => gdb_13.2.bb} (100%)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31484.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0001.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2023-31486-0002.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
 create mode 100644 meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
 create mode 100644 meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-sockopt-test.patch
 rename meta/recipes-extended/gawk/{gawk_5.2.1.bb => gawk_5.2.2.bb} (97%)
 delete mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-AC_SYS_LARGEFILE-macro-to-control-largefile-supp.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch
 rename meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} (60%)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.4.bb => libx11_1.8.5.bb} (92%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230404.bb => linux-firmware_20230515.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} (94%)
 rename meta/recipes-support/gnupg/{gnupg_2.4.0.bb => gnupg_2.4.2.bb} (97%)
 delete mode 100644 meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
 delete mode 100644 meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
 delete mode 100644 meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
 rename meta/recipes-support/serf/{serf_1.3.9.bb => serf_1.3.10.bb} (78%)

-- 
2.34.1


