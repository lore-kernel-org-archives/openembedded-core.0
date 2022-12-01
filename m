Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71516C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:12 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.44604.1669904583475965503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GgMgcwPg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id h28so1983751pfq.9
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bKGqifxGAvlOci/d4sYWxOp6VyXxPvUZuHSl4x7vW8=;
        b=GgMgcwPgb+4x9mlxUUm+3mEISqJyrK70w82NaLQkHEOuRhA5zU1I9sKyg5jAFpCPIK
         4OpUwCh1pcSAsNtCecJCoWZ6yTvFKDRLKGTlRef1wa+sFP2o4/Swp21srqkLzycnxbtB
         ia+dJr2c1/PH56fItiMfjOasHX7O9g5zTjvGw2BUGRiRnkw9TB6+uN3t6aBaYeffhK+o
         NgfsaRziJM7ZrEUzi6dZe1LC1CAFNMLLFBqpsVJDnBBI+gT6E4mgBLPWMRs0rf1SoQnu
         /IvYohfwXOFI6HiH6fJSLXh3h3qijJllisbJUtgKez4yvO9vMxI0wZ6lkKkZuN5UAxs6
         yUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bKGqifxGAvlOci/d4sYWxOp6VyXxPvUZuHSl4x7vW8=;
        b=qSWB7h73YGaYIoA9+tEHR3wyR8ruzU4QbkiIdy2mP7lAagjsSf7eWqN4+znxEafe7n
         jgo4YItqD4jylQhneuUf1lQIrYizJ0xTUMBqsx4TMvHaok5ZSlqRqunucEPoERH87dNA
         jxv1xj8LvrUx8p4y7Z/1yu9vxG2fXZJJj8D0ShhuCSLweyEY1DOF6eDcDIuxWX8LwX1/
         UAWA87ArD1LHwFmXhTNqUWmFJBAmMIcbV8dWxeYlyD6uFh5O6RKiVRVppFP2G29xbb0r
         /QzLCMDfGCzecAcfnLSOv+ASPYn2dEN1OjIplna6WwMu/jOYU1K/PuHEiiVecha+0/qh
         bkCA==
X-Gm-Message-State: ANoB5pmHqISo6l9esWhsgPeoYJyjCZrKjqB3U6fxIZu9aoQF8Eaiqugd
	BLu+dcThGobT/ErO9Ft0jjoHy295p9Npp2XkxhQ=
X-Google-Smtp-Source: AA0mqf6pgK7jzyMhV/wm3Vz6WhcgpCySR1ZWDZZv4txFBmzGK9MFO7gvVYpnx6ORWOR9vDBMgo1Bsw==
X-Received: by 2002:a05:6a00:3398:b0:575:72f3:d4dc with SMTP id cm24-20020a056a00339800b0057572f3d4dcmr13727902pfb.6.1669904582101;
        Thu, 01 Dec 2022 06:23:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/22] Patch review
Date: Thu,  1 Dec 2022 04:22:30 -1000
Message-Id: <cover.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174063

Please review this set of patches for langdale and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4566

The following changes since commit 30cdb7fbec8e9cf5c5a25e28a1102fa562a7f6c2:

  create-spdx: default share_src for shared sources (2022-11-25 06:16:14 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Bruce Ashfield (11):
  linux-yocto/5.15: update to v5.15.74
  linux-yocto/5.15: update to v5.15.76
  linux-yocto/5.15: update to v5.15.78
  linux-yocto/5.15: fix CONFIG_CRYPTO_CCM mismatch warnings
  linux-yocto/5.19: update to v5.19.16
  linux-yocto/5.19: update to v5.19.17
  linux-yocto/5.19: cfg: intel and vesa updates
  linux-yocto/5.19: security.cfg: remove configs which have been dropped
  linux-yocto/5.19: fix CONFIG_CRYPTO_CCM mismatch warnings
  linux-yocto/5.19: fix elfutils run-backtrace-native-core ptest failure
  kern-tools: integrate ZFS speedup patch

Chen Qi (3):
  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
  dhcpcd: fix to work with systemd
  resolvconf: make it work

Dmitry Baryshkov (2):
  linux-firmware: upgrade 20221012 -> 20221109
  linux-firmware: add new fw file to ${PN}-qcom-adreno-a530

Enrico Jörns (1):
  sstatesig: emit more helpful error message when not finding sstate
    manifest

Narpat Mali (2):
  ffmpeg: fix for CVE-2022-3964
  ffmpeg: fix for CVE-2022-3965

Polampalli, Archana (1):
  libpam: fix CVE-2022-28321

Qiu, Zheng (1):
  tiff: Security fix for CVE-2022-3970

Tim Orling (1):
  mirrors.bbclass: update CPAN_MIRROR

 meta/classes-global/mirrors.bbclass           |   3 +-
 meta/classes-recipe/kernel.bbclass            |   8 +
 meta/lib/oe/sstatesig.py                      |   6 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   1 +
 ...mprove-the-sitation-of-working-with-.patch |  82 +++++++
 ...01-avoid-using-m-option-for-readlink.patch |  37 ++++
 .../resolvconf/resolvconf_1.91.bb             |   9 +-
 .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 ...20221012.bb => linux-firmware_20221109.bb} |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-rt_5.19.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 .../linux/linux-yocto-tiny_5.19.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 meta/recipes-kernel/linux/linux-yocto_5.19.bb |  26 +--
 ...c-stop-accessing-out-of-bounds-frame.patch |  89 ++++++++
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 +++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |   6 +-
 .../libtiff/files/CVE-2022-3970.patch         |  39 ++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   1 +
 22 files changed, 629 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221012.bb => linux-firmware_20221109.bb} (99%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch

-- 
2.25.1


