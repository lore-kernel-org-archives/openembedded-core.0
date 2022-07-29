Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E896C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.47.1659106023266760444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xSOnl4Fv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id x7so4795748pll.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1Z26tasGPdMhbG/rkDdWUkJOMApQo/51Id/KznrbDw=;
        b=xSOnl4FvUWlqQgjs5lpBCxP4yjM3TNvDV01sqPZHWwR90hNPVi21dSaG7lMjptomRn
         DftvRbeAFjmDQdsmFG0TEPEww7Cm3Nhm2HVKPtiXycm1IWBk9osBS+QrW96iiBBXih0/
         mi0f1+ReNtSVMe5ODMExawPdhBR8g75ravL2CSDnwd4nj/r0VZ7MmEyM3QEZcfSx9ciK
         CPtyg3+N3oddY+uXhjWHNcooLehfETMeW9eCoXSFmNZJ/1+5lW40KSIssM7ggCQVjgOa
         GIXfPFBcn7La8ePTMUth3juQK74obUF5/TGrVdawS82rrBF+OfxJYZ7YYIYXj3ftHNw5
         neVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1Z26tasGPdMhbG/rkDdWUkJOMApQo/51Id/KznrbDw=;
        b=ji19v1bubHaddSTvtLWs4PTtp9LAVuISpqrvfFY/efuaCtF5BbdL63ETMbuzouc89B
         evf3cBmNN2OjoTGHNt3tBeFnXJUu/LRwamWcLTWS8cZYpuRsc/VESaFC2cIkdalb6mra
         usDFLCwAXIVupCr+kXCK9+9X+kKqzQvYE1WgozTuPWkWXfS5/iZF276PfCnOHwHSdZ/t
         YtBqFmwJkZL+fy5/ldlMsL1sQ01762ntRMma9ELKAQFEEx+2hQHo7rhfQJTFUM/V0Fzp
         vc/bcq8cTpQB6eAUfyyyjxkYRY9YMGGCwIZoiSvr46e5rPh+J8cyzgVcDStbi2V1l2rT
         ABJg==
X-Gm-Message-State: ACgBeo0DK1qno4zadMp1wlzZFTRq3Vf+fAni5SKh/vX2js7DYm1mb4q4
	jX0wU0ojAqgnkylurs9hZAyVNwVyTllGUgT5
X-Google-Smtp-Source: 
 AA6agR6/zZDlfRZUzVq2jbwWOo4EurmrlHniAUGLCQ8ZQP7B/bFTyxQIi0kMdszXx3qIxHrekZxA1Q==
X-Received: by 2002:a17:903:32c2:b0:16c:3c8d:3807 with SMTP id
 i2-20020a17090332c200b0016c3c8d3807mr4244649plr.173.1659106021832;
        Fri, 29 Jul 2022 07:47:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.46.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/29] Patch review
Date: Fri, 29 Jul 2022 04:46:16 -1000
Message-Id: <cover.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168635

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

I've added change logs to the commits for version updates to make it easier
to review those.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3991

The following changes since commit 2bc86c029fb82ae572f6a89407ccfe332972568c:

  gcc-runtime: Pass -nostartfiles when building dummy libstdc++.so (2022-07-26 05:34:59 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Kiernan (1):
  bind: Remove legacy python3 PACKAGECONFIG code

Alexander Kanavin (14):
  xev: update 1.2.4 -> 1.2.5
  xmodmap: update 1.0.10 -> 1.0.11
  xf86-input-synaptics: update 1.9.1 -> 1.9.2
  encodings: update 1.0.5 -> 1.0.6
  font-util: update 1.3.2 -> 1.3.3
  xserver-xorg: update 21.1.3 -> 21.1.4
  linux-firmware: update 20220610 -> 20220708
  libuv: upgrade 1.44.1 -> 1.44.2
  log4cplus: upgrade 2.0.7 -> 2.0.8
  vala: upgrade 0.56.0 -> 0.56.1
  vala: upgrade 0.56.1 -> 0.56.2
  webkitgtk: upgrade 2.36.3 -> 2.36.4
  xwayland: upgrade 22.1.2 -> 22.1.3
  epiphany: upgrade 42.2 -> 42.3

Hitendra Prajapati (2):
  qemu: CVE-2022-35414 can perform an uninitialized read on the
    translate_fail path, leading to an io_readx or io_writex crash
  libtirpc: CVE-2021-46828 DoS vulnerability with lots of connections

Mihai Lindner (1):
  wic/plugins/rootfs: Fix NameError for 'orig_path'

Ming Liu (1):
  udev-extraconf:mount.sh: fix a umount issue

Richard Purdie (3):
  xorg-app: Tweak handling of compression changes in SRC_URI
  xwayland: upgrade 22.1.1 -> 22.1.2
  base/reproducible: Change Source Date Epoch generation methods

Ross Burton (2):
  oeqa/runtime: add test that the kernel has CONFIG_PREEMPT_RT enabled
  perf: fix reproduciblity in older releases of Linux

Shruthi Ravichandran (1):
  initscripts: run umountnfs as a KILL script

gr embeter (1):
  efivar: fix import functionality

leimaohui (1):
  systemd: Added base_bindir into pkg_postinst:udev-hwdb.

wangmy (2):
  mkfontscale: upgrade 1.2.1 -> 1.2.2
  xdpyinfo: upgrade 1.3.2 -> 1.3.3

 meta/classes/base.bbclass                     |   1 +
 meta/lib/oe/reproducible.py                   |   1 -
 meta/lib/oeqa/runtime/cases/rt.py             |  17 ++
 .../0001-Fix-invalid-free-in-main.patch       |  30 ++++
 meta/recipes-bsp/efivar/efivar_38.bb          |   1 +
 meta/recipes-connectivity/bind/bind_9.18.4.bb |  13 --
 .../{libuv_1.44.1.bb => libuv_1.44.2.bb}      |   2 +-
 .../initscripts/initscripts_1.0.bb            |   2 +-
 meta/recipes-core/systemd/systemd_250.5.bb    |   2 +-
 .../recipes-core/udev/udev-extraconf/mount.sh |   2 +-
 ...{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-35414.patch            |  53 ++++++
 meta/recipes-devtools/vala/vala_0.56.0.bb     |   3 -
 meta/recipes-devtools/vala/vala_0.56.2.bb     |   3 +
 .../libtirpc/libtirpc/CVE-2021-46828.patch    | 155 ++++++++++++++++++
 .../libtirpc/libtirpc_1.3.2.bb                |   4 +-
 .../{epiphany_42.2.bb => epiphany_42.3.bb}    |   2 +-
 ...ontscale_1.2.1.bb => mkfontscale_1.2.2.bb} |   4 +-
 .../{xdpyinfo_1.3.2.bb => xdpyinfo_1.3.3.bb}  |   4 +-
 .../xorg-app/{xev_1.2.4.bb => xev_1.2.5.bb}   |   4 +-
 .../{xmodmap_1.0.10.bb => xmodmap_1.0.11.bb}  |   5 +-
 .../xorg-app/xorg-app-common.inc              |   3 +-
 .../recipes-graphics/xorg-app/xrandr_1.5.1.bb |   3 +-
 .../64bit_time_t_support.patch                |  51 ------
 ...1.9.1.bb => xf86-input-synaptics_1.9.2.bb} |   7 +-
 .../xorg-font/encodings/nocompiler.patch      |   8 +-
 ...{encodings_1.0.5.bb => encodings_1.0.6.bb} |   6 +-
 ...{font-util_1.3.2.bb => font-util_1.3.3.bb} |   5 +-
 .../xorg-font/xorg-font-common.inc            |   3 +-
 .../0001-render-Fix-build-with-gcc-12.patch   |  90 ----------
 ...-xorg_21.1.3.bb => xserver-xorg_21.1.4.bb} |   7 +-
 ...{xwayland_22.1.1.bb => xwayland_22.1.3.bb} |   2 +-
 ...20220610.bb => linux-firmware_20220708.bb} |  13 +-
 meta/recipes-kernel/perf/perf.bb              |   3 +
 ...ebkitgtk_2.36.3.bb => webkitgtk_2.36.4.bb} |   2 +-
 scripts/lib/wic/plugins/source/rootfs.py      |   2 +-
 37 files changed, 309 insertions(+), 207 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/rt.py
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
 rename meta/recipes-connectivity/libuv/{libuv_1.44.1.bb => libuv_1.44.2.bb} (93%)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.0.7.bb => log4cplus_2.0.8.bb} (90%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.0.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.2.bb
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch
 rename meta/recipes-gnome/epiphany/{epiphany_42.2.bb => epiphany_42.3.bb} (94%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.1.bb => mkfontscale_1.2.2.bb} (82%)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.2.bb => xdpyinfo_1.3.3.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.4.bb => xev_1.2.5.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.10.bb => xmodmap_1.0.11.bb} (78%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics/64bit_time_t_support.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.9.1.bb => xf86-input-synaptics_1.9.2.bb} (74%)
 rename meta/recipes-graphics/xorg-font/{encodings_1.0.5.bb => encodings_1.0.6.bb} (78%)
 rename meta/recipes-graphics/xorg-font/{font-util_1.3.2.bb => font-util_1.3.3.bb} (84%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.3.bb => xserver-xorg_21.1.4.bb} (79%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.1.bb => xwayland_22.1.3.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220610.bb => linux-firmware_20220708.bb} (98%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.3.bb => webkitgtk_2.36.4.bb} (98%)

-- 
2.25.1


