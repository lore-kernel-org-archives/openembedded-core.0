Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15447C7EE24
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:44:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.40945.1684291486106506245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UagZVxJ7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ae454844edso2756585ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291485; x=1686883485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NxnXKs+rQ1hOMxShJUmFgXqShv8MBqQDrORJNQpmQzs=;
        b=UagZVxJ7JzSsO3FJdYOHiLJ+DN3UzoSPPkdq0CmxtA5NsBqai3yHlcG976JkuPpxN3
         7Pf+DNF56DolJhHClfGglxQD+1ZLfGNF5eOW0ITnJPUZQcSItR0sjtbFVy7kTSRw7+mz
         NGETvf1qXxGKKjgStUFUf7cZsbtPOqCN33SREPjLkCsu/xwt1NojwyyjN6kyeNontvC3
         Jcb73LlureU7xiD31H0K36ePekWH1l2KJWzDBA0FDpLQr0r0NDiesfWXOIQR/u1M9hCw
         QsxK46CrvqbTpPurJZlfBFmCLe7+qaJsl5HLjusFzJwlSVkgkgZNCgoBUlSfWarqu4N0
         TzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291485; x=1686883485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NxnXKs+rQ1hOMxShJUmFgXqShv8MBqQDrORJNQpmQzs=;
        b=XpK7soEkZjUa8BoPB2d3W2w3wLOIX7ru/PcY48+jytMGo1bNcgoTr2lmAca0tkZ0Mj
         xAiebJU5Ib2kE9mnLYz6Zdza1/2ZwENeRTbHZi0lw0w7SY0/THh/mZFOzTi1+sp2/UB/
         hQmx2B6Z2atEbChXrv8BgQZerYa6ZkVOXwXeHoBHl8IpTTySHnMWSYHRHMPZv3lA11KC
         /rfLYQjPpvi/qhbzHYTkWKQOiC8Pl9BN5Ex/GgFe+GxcaHWyzncw2iu0uv08eIWPKkZv
         zzUXGtR4bBXysv9a/0y4pBTJE9qLvrJPBoPT8+RP3D/udGFF+Edgt5+RX8PmKF+PODyR
         2g0A==
X-Gm-Message-State: AC+VfDzjFzZR+mXLhtgc4741yf10n1J9ruJRrI8PWz+qS+He0i4xh2+C
	utdeszM2z5vspk7R28M925KrPT0DZ11xWt8wxmI=
X-Google-Smtp-Source: ACHHUZ6xxRO9OyskmSyNI8Wq1NK69R3tJo2RkgexNAzNNLcmiwzgqDWmjl7y7NCdbbOgMz01R7AEdg==
X-Received: by 2002:a17:902:f551:b0:1ae:ccf:6b40 with SMTP id h17-20020a170902f55100b001ae0ccf6b40mr14071427plf.13.1684291484901;
        Tue, 16 May 2023 19:44:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.44.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:44:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/13] Patch review
Date: Tue, 16 May 2023 16:44:23 -1000
Message-Id: <cover.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181429

Please review this set of changes for mickledore and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5305

The following changes since commit 2c5af07819b4a555737da9f07aa5236579300027:

  machine/qemuarm*: don't explicitly set vmalloc (2023-05-12 05:31:11 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (3):
  selftest/distrodata: clean up exception lists in recipe maintainers
    test
  dhcpcd: use git instead of tarballs
  perl: patch out build paths from native binaries

Enrico Jörns (1):
  package_manager/ipk: fix config path generation in
    _create_custom_config()

Joe Slater (1):
  ghostscript: fix CVE-2023-28879

Johannes Schrimpf (1):
  python3targetconfig.bbclass: Extend PYTHONPATH instead of overwriting

Khem Raj (1):
  quilt: Fix merge.test race condition

Markus Volk (1):
  gtk4: update 4.10.0 -> 4.10.3

Ming Liu (1):
  weston: add xwayland to DEPENDS for PACKAGECONFIG xwayland

Peter Kjellerstedt (1):
  license.bbclass: Include LICENSE in the output when it fails to parse

Richard Purdie (1):
  recipes: Default to https git protocol where possible

Virendra Thakur (1):
  qemu: Whitelist CVE-2023-0664

hen Qi (1):
  unfs3: fix symlink time setting issue

 meta/classes-global/license.bbclass           |  2 +-
 .../python3targetconfig.bbclass               |  2 +-
 meta/conf/distro/include/maintainers.inc      |  7 ++
 meta/lib/oe/package_manager/ipk/__init__.py   |  2 +-
 meta/lib/oeqa/selftest/cases/distrodata.py    |  6 +-
 meta/lib/oeqa/selftest/cases/fetch.py         |  2 +
 meta/lib/oeqa/selftest/cases/recipetool.py    |  8 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  7 +-
 meta/recipes-connectivity/neard/neard_0.18.bb |  2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb  |  2 +-
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../images/build-appliance-image_15.0.0.bb    |  2 +-
 meta/recipes-core/musl/libc-test_git.bb       |  2 +-
 meta/recipes-core/musl/musl_git.bb            |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  2 +-
 .../update-rc.d/update-rc.d_0.8.bb            |  2 +-
 .../binutils/binutils-2.40.inc                |  2 +-
 .../btrfs-tools/btrfs-tools_6.1.3.bb          |  2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  2 +-
 .../erofs-utils/erofs-utils_1.5.bb            |  2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  2 +-
 meta/recipes-devtools/perl/perl_5.36.0.bb     |  4 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  5 ++
 meta/recipes-devtools/quilt/quilt.inc         |  1 +
 ...t-Fix-a-race-condition-in-merge.test.patch | 48 ++++++++++
 .../0001-attr-fix-utime-for-symlink.patch     | 88 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  1 +
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  2 +-
 .../ghostscript/cve-2023-28879.patch          | 60 +++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |  1 +
 .../gtk+/{gtk4_4.10.0.bb => gtk4_4.10.3.bb}   |  2 +-
 .../libfakekey/libfakekey_git.bb              |  2 +-
 .../libmatchbox/libmatchbox_1.12.bb           |  2 +-
 .../matchbox-wm/matchbox-wm_1.2.3.bb          |  2 +-
 .../recipes-graphics/wayland/weston_11.0.1.bb |  2 +-
 .../xcursor-transparent-theme_git.bb          |  2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  2 +-
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/kmod/kmod_30.bb           |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +-
 .../linux/linux-yocto-rt_5.15.bb              |  4 +-
 .../linux/linux-yocto-rt_6.1.bb               |  4 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  4 +-
 .../linux/linux-yocto-tiny_6.1.bb             |  4 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  4 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  4 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.4.bb |  2 +-
 .../recipes-kernel/lttng/babeltrace_1.5.11.bb |  2 +-
 .../lttng/lttng-modules_2.13.9.bb             |  2 +-
 .../systemtap/systemtap_git.inc               |  2 +-
 meta/recipes-rt/rt-tests/rt-tests.inc         |  2 +-
 .../matchbox-config-gtk_0.2.bb                |  2 +-
 .../matchbox-desktop/matchbox-desktop_2.3.bb  |  2 +-
 .../matchbox-keyboard_0.1.1.bb                |  2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.12.bb |  2 +-
 .../matchbox-terminal_0.2.bb                  |  2 +-
 .../matchbox-theme-sato_0.2.bb                |  2 +-
 meta/recipes-sato/puzzles/puzzles_git.bb      |  2 +-
 .../sato-screenshot/sato-screenshot_0.3.bb    |  2 +-
 .../settings-daemon/settings-daemon_0.0.2.bb  |  2 +-
 .../dos2unix/dos2unix_7.4.4.bb                |  2 +-
 .../gnome-desktop-testing_2021.1.bb           |  2 +-
 .../ptest-runner/ptest-runner_2.4.2.bb        |  2 +-
 65 files changed, 286 insertions(+), 70 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.0.bb => gtk4_4.10.3.bb} (98%)

-- 
2.34.1


