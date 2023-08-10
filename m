Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D853C41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:04:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.21354.1691683483026576989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Jt910n3g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so781384b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683482; x=1692288282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MMW0iNpvVLVfzfA2pkZrO5R7929QOe5pOTT5Y8glaPM=;
        b=Jt910n3gRvj/B2T8DbBcabTn0VdurXHzj4VmMyAU5LEICOSkApfsJFVS8qz+FxIbs+
         m+05h4WE3jN2t+dpbLMtsbzvO2LZPN2QB1WyANAGG+pWU9v5gfjhydF7ElXOJjFq2Udz
         IYcW2BHXwGMwX13lL1vIYjtfTIhgL1toDvhEmdC3joiICLxIgmIZwdspGaz7zVXxKO1O
         Y5bDLPhRWJP6Sh18I4OMfiZUCgLZn5JyWpv1tL+D5ufXuN3Bz2N53Cs2sBhC83hH7LO/
         cAIwGSbiJI8xl4rRuD/of+bQxA6VeXvUiVpJe1usIj+vFFwqlBAmCOpyNkImzNV6Y+kg
         gd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683482; x=1692288282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMW0iNpvVLVfzfA2pkZrO5R7929QOe5pOTT5Y8glaPM=;
        b=X7J3RzXAIZmuOLWwjJEDecqlrjWhb64m9p4o4gPVTh/YwmhibaqhDhLgfvv5VOIhq5
         ewr3jaTADzmBSaWI6x8He+f8aT5D2mHrx58uZn05y32at+Xq2IR6Nn8vRM1fDYCupdRf
         qt+NjcML5PjH0zLxiMYKp4D8X1ch8ZTA3lddyOsXQWXLWT641mfjbWgql7Zfn+ISVsZz
         OxaX07kN/nfElAvmPzHvScCBw7/IpzFjo7EW/CUuSUvlfYmWQzqwJTM5HrX/Ml7HP4mD
         kSTwDKHj8MhLpHh3DFVM789hDYtfsW8DknAUPSHCDiVYQ+SEJFvhN1zzwfuO5jPXbXa/
         a/QA==
X-Gm-Message-State: AOJu0YySu6PbnSaLvFkEJeVVO9gL+m0FqyFIhCkbIBBBvqqFIr9gNylf
	0V1HwGS2bctg/+/OjjhCc5v3Fzz9Iht36zv5Qkw=
X-Google-Smtp-Source: AGHT+IEV3aUDtHKhbDxtozc5VCLnd+LWmW48fPAUdVUawxYGrcizCNt7wVIHFR26+cUPm1KesfwMPg==
X-Received: by 2002:a05:6a20:914a:b0:133:17f1:6436 with SMTP id x10-20020a056a20914a00b0013317f16436mr3207341pzc.19.1691683481770;
        Thu, 10 Aug 2023 09:04:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.04.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/37] Patch review
Date: Thu, 10 Aug 2023 06:03:59 -1000
Message-Id: <cover.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185762

Please review this set of changes and have comments back by
end of day Monday, August 14.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5711

The following changes since commit dc4099307100de817110958c9426ced4189fd0ac:

  util-linux: add alternative links for ipcs,ipcrm (2023-07-27 04:32:06 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alex Kiernan (2):
  rootfs: Add debugfs package db file copy and cleanup
  rpm: Pick debugfs package db files/dirs explicitly

Alexander Kanavin (1):
  Revert "rootfs-postcommands.bbclass: add post func
    remove_unused_dnf_log_lock"

Alexis Lothoré (1):
  scripts/resulttool: add mention about new detected tests

Anuj Mittal (5):
  selftest/cases/glibc.py: fix the override syntax
  glibc/check-test-wrapper: don't emit warnings from ssh
  selftest/cases/glibc.py: increase the memory for testing
  oeqa/utils/nfs: allow requesting non-udp ports
  selftest/cases/glibc.py: switch to using NFS over TCP

Archana Polampalli (1):
  bind: upgrade 9.18.15 -> 9.18.16

Bruce Ashfield (4):
  linux-yocto/5.15: update to v5.15.122
  linux-yocto/5.15: update to v5.15.123
  linux-yocto/5.15: update to v5.15.124
  linux-yocto/6.1: cfg: update ima.cfg to match current meta-integrity

Chen Qi (1):
  ncurses: fix CVE-2023-29491

Dmitry Baryshkov (1):
  linux-firmware: package firmare for Dragonboard 410c

Enrico Scholz (1):
  shadow-sysroot: add license information

Jose Quaresma (1):
  go: update 1.20.5 -> 1.20.6

Julien Stephan (1):
  automake: fix buildtest patch

Michael Halstead (1):
  resulttool/resultutils: allow index generation despite corrupt json

Narpat Mali (1):
  python3-certifi: upgrade 2022.12.7 -> 2023.7.22

Oleksandr Hnatiuk (2):
  file: return wrapper to fix builds when file is in buildtools-tarball
  file: fix the way path is written to environment-setup.d

Ovidiu Panait (1):
  mdadm: add util-linux-blockdev ptest dependency

Peter Marko (1):
  libarchive: ignore CVE-2023-30571

Richard Purdie (6):
  ptest-runner: Pull in parallel test fixes and output handling
  glibc-testsuite: Fix network restrictions causing test failures
  oeqa/target/ssh: Ensure EAGAIN doesn't truncate output
  oeqa/runtime/ltp: Increase ltp test output timeout
  ltp: Add kernel loopback module dependency
  target/ssh: Ensure exit code set for commands

Ross Burton (1):
  ltp: add RDEPENDS on findutils

Staffan Rydén (1):
  kernel: Fix path comparison in kernel staging dir symlinking

Trevor Gamblin (1):
  linux-firmware: upgrade 20230515 -> 20230625

Wang Mingyu (3):
  libnss-nis: upgrade 3.1 -> 3.2
  opkg: upgrade 0.6.1 -> 0.6.2
  opkg-utils: upgrade 0.5.0 -> 0.6.2

 meta/classes-recipe/kernel.bbclass            |   7 +-
 .../rootfs-postcommands.bbclass               |   7 -
 meta/lib/oe/package_manager/rpm/rootfs.py     |   2 +-
 meta/lib/oe/rootfs.py                         |  20 +-
 meta/lib/oeqa/core/target/ssh.py              |   6 +
 meta/lib/oeqa/runtime/cases/ltp.py            |   2 +-
 meta/lib/oeqa/selftest/cases/glibc.py         |   8 +-
 meta/lib/oeqa/utils/nfs.py                    |   4 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.15 => bind-9.18.16}/bind9 |   0
 .../{bind-9.18.15 => bind-9.18.16}/conf.patch |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.15.bb => bind_9.18.16.bb} |   4 +-
 .../glibc/glibc-testsuite_2.37.bb             |   1 +
 .../glibc/glibc/check-test-wrapper            |   2 +-
 .../files/0001-Fix-CVE-2023-29491.patch       | 462 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 .../automake/automake/buildtest.patch         |   2 +-
 meta/recipes-devtools/file/file_5.44.bb       |   3 +-
 .../go/{go-1.20.5.inc => go-1.20.6.inc}       |   2 +-
 ...e_1.20.5.bb => go-binary-native_1.20.6.bb} |   6 +-
 ..._1.20.5.bb => go-cross-canadian_1.20.6.bb} |   0
 ...{go-cross_1.20.5.bb => go-cross_1.20.6.bb} |   0
 ...osssdk_1.20.5.bb => go-crosssdk_1.20.6.bb} |   0
 ...o-native_1.20.5.bb => go-native_1.20.6.bb} |   0
 ...runtime_1.20.5.bb => go-runtime_1.20.6.bb} |   0
 .../go/{go_1.20.5.bb => go_1.20.6.bb}         |   0
 ...pkg-utils_0.5.0.bb => opkg-utils_0.6.2.bb} |   2 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |  51 --
 ...emove-no-options-flag-from-gpg-calls.patch |  34 --
 .../opkg/{opkg_0.6.1.bb => opkg_0.6.2.bb}     |   6 +-
 ...2.12.7.bb => python3-certifi_2023.7.22.bb} |   2 +-
 .../libarchive/libarchive_3.6.2.bb            |   3 +
 .../recipes-extended/libnss-nis/libnss-nis.bb |   4 +-
 meta/recipes-extended/ltp/ltp_20230127.bb     |   3 +
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   9 +-
 .../shadow/files/login.defs_shadow-sysroot    |   1 +
 .../shadow/shadow-sysroot_4.6.bb              |   2 +-
 ...20230515.bb => linux-firmware_20230625.bb} |  11 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-rt_6.1.bb               |   2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   2 +-
 .../ptest-runner/ptest-runner_2.4.2.bb        |   2 +-
 scripts/lib/resulttool/regression.py          |  16 +-
 scripts/lib/resulttool/resultutils.py         |   6 +-
 53 files changed, 579 insertions(+), 156 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.15.bb => bind_9.18.16.bb} (96%)
 create mode 100644 meta/recipes-core/ncurses/files/0001-Fix-CVE-2023-29491.patch
 rename meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.5.bb => go-binary-native_1.20.6.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.5.bb => go-cross-canadian_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.5.bb => go-cross_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.5.bb => go-crosssdk_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.5.bb => go-native_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb} (100%)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.5.0.bb => opkg-utils_0.6.2.bb} (97%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
 rename meta/recipes-devtools/opkg/{opkg_0.6.1.bb => opkg_0.6.2.bb} (92%)
 rename meta/recipes-devtools/python/{python3-certifi_2022.12.7.bb => python3-certifi_2023.7.22.bb} (86%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230515.bb => linux-firmware_20230625.bb} (98%)

-- 
2.34.1


