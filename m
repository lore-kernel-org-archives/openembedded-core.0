Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A166C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:04 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.4569.1670539382254600421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ANMdwlSN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id gt4so1293033pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DwAeKJB/yBnrl2l1YfH2Q/3tKRkUQojAO45OWqWFYc=;
        b=ANMdwlSNR5G3pZAcfuI0lkdFINNpMtMgor8ddfr4qPKgbGavLAOTo849mGQdOzeFXa
         PJWj4oKWUUWjSlwSfGCUuAeLpvX67CvpNO+xKl9EZ6fer65F+F/DpP1Kwyo7H5bocGAS
         kjW46UIOs6egQavbVmjPtU/NdXLSYJmC/9cOWsNa+l+fJt8VI/7AJHQ1J0CMH2wHeoml
         x0KLvnZu/+w/jSnVGf6jOMrTHOpxuc4ZL4XM1Ae+seLnFvfSTymf5hAc2SBZh7gMySZk
         BKKl4A771I2T+/2dzoCBHywCdeJw42Web0ujTNUWiB2MD6F5KylSV7yGAFpZi/Gi9vca
         cmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DwAeKJB/yBnrl2l1YfH2Q/3tKRkUQojAO45OWqWFYc=;
        b=Sx6NU03fRoxbneWZccmw1Rf3KN5Iq06Nl1c9Qw19e1WLi2Ne36lDvi9UOvh5vYUPUy
         hUHkKR3LSSJ2k4Hua0hjJZDjBsePAs818/j5/pct0CEJz95atj0DhLlvV6M76kMrKRZj
         JsV3yxwON1iK3JH0WBXAyvPD8oeV1A1fXlYO+e2HY5pOobTYn8rePPN8RYr6Wh2uMC8l
         x+GgJVZ68mbJRLW+LxiGSbVClaUP58pMTkJVdpRAXTYjJF0K28DHxwoNGd+oD3AmPkYu
         rITiAi4iFf41AS8F1cjVJaDG8RXYQiX8xoRG36Zq+U7Yv/ORRH8Ny56YVeJQ4R3Cyn4v
         dpLQ==
X-Gm-Message-State: ANoB5pnN9gMgI9zNLhY/Cj3weSyXP7g/8LdkFcF1BBDzWjZwwoHFKEQH
	g/OwEKx9Rk7iAS1/wxcOv5Us71Mo78wA/YUVVVFi6g==
X-Google-Smtp-Source: AA0mqf6q0Y+Bt7uvxERggA29MBk62x+t5FnwunavCjvWcAGFOjLuU3wK5YURhc7EnphJYSScTRup7w==
X-Received: by 2002:a05:6a20:939e:b0:ac:36bd:3f74 with SMTP id x30-20020a056a20939e00b000ac36bd3f74mr5228689pzh.34.1670539381054;
        Thu, 08 Dec 2022 14:43:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.42.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/12] Patch review
Date: Thu,  8 Dec 2022 12:42:41 -1000
Message-Id: <cover.1670539235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174413

Please review this set of patches for kirkstone and have comments back by
end of day Monday.

This should be the final set of patches for the 4.0.6 release.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4600

The following changes since commit c0f3da88a9646fc5e6d549b1a2327c0823c0e5a1:

  mirrors.bbclass: update CPAN_MIRROR (2022-11-30 05:51:07 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexey Smirnov (1):
  classes: make TOOLCHAIN more permissive for kernel

Chen Qi (1):
  psplash: consider the situation of psplash not exist for systemd

Harald Seiler (1):
  opkg: Set correct info_dir and status_file in opkg.conf

Hitendra Prajapati (1):
  libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c

Joe Slater (1):
  python3: advance to version 3.10.8

Joshua Watt (1):
  scripts: convert-overrides: Allow command-line customizations

Qiu, Zheng (2):
  vim: upgrade 9.0.0820 -> 9.0.0947
  valgrind: remove most hidden tests for arm64

Richard Purdie (1):
  oeqa/selftest/tinfoil: Add test for separate config_data with
    recipe_parse_file()

Ross Burton (1):
  xserver-xorg: backport fixes for CVE-2022-3550 and CVE-2022-3551

Xiangyu Chen (2):
  sysstat: fix CVE-2022-39377
  grub: backport patches to fix CVE-2022-28736

 meta/classes/kernel-arch.bbclass              |   2 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  14 ++
 ...i-chainloader-Use-grub_loader_set_ex.patch |  86 +++++++
 ...ot-Add-API-to-pass-context-to-loader.patch | 168 +++++++++++++
 ...hainloader-Simplify-the-loader-state.patch | 129 ++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 .../psplash/files/psplash-start.service       |   1 +
 .../psplash/files/psplash-systemd.service     |   1 +
 meta/recipes-devtools/opkg/opkg_0.5.0.bb      |   4 +-
 .../python/python3/cve-2022-37454.patch       | 108 +++++++++
 .../{python3_3.10.7.bb => python3_3.10.8.bb}  |   4 +-
 .../valgrind/valgrind/remove-for-aarch64      | 227 +-----------------
 .../libarchive/CVE-2022-36227.patch           |  42 ++++
 .../libarchive/libarchive_3.6.1.bb            |   4 +-
 .../sysstat/sysstat/CVE-2022-39377.patch      |  93 +++++++
 .../sysstat/sysstat_12.4.5.bb                 |   3 +-
 ...possible-memleaks-in-XkbGetKbdByName.patch |  63 +++++
 ...ntedString-against-request-length-at.patch |  38 +++
 .../xorg-xserver/xserver-xorg_21.1.4.bb       |   2 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/contrib/convert-overrides.py          | 103 ++++----
 21 files changed, 821 insertions(+), 278 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch
 create mode 100644 meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-to-loader.patch
 create mode 100644 meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-loader-state.patch
 create mode 100644 meta/recipes-devtools/python/python3/cve-2022-37454.patch
 rename meta/recipes-devtools/python/{python3_3.10.7.bb => python3_3.10.8.bb} (99%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch

-- 
2.25.1


