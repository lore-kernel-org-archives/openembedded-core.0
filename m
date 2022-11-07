Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B72EC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:01 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.100.1667835412008578949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Bch3iL9J;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 78so10747033pgb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PX2lAyVGqruAruxnLAy134gUdjRwb46FOK9iqCyBdPo=;
        b=Bch3iL9J2k3hWJ1IssvOE6OaIJQOwlRCC7VTP89Sk7hFrM2m5hgnWbUijUTjrFpGfh
         hYQrYuQ4+yqxD0sgzxQ28z0LJwPqOsbTsKlylqDRTC/l25r/9pVXURD3/I3EEEmII9KL
         7s4uIIAvpR+7PASVEn3+cUE1inzlG9hdFnNpb9RI35AVpdLG7f2f1y1xt3CTFB2EAhsd
         Hsz6Bwku0S+8Ov4nb+LWaG1Ca4L5i0I6YEI9d7aG1uhw1rt9yeLmmvDqw7aAqp7lii1I
         TLShY5YYaWWQodwaSOuotncmJOD0KcBSYkYAgGdwPrdpjQEjJ0w70rH9+R2FGo5Ngmfy
         HLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PX2lAyVGqruAruxnLAy134gUdjRwb46FOK9iqCyBdPo=;
        b=D9TrelhP8/Hj4a6o60760bDEvvVgYOj3sL1MUwSl8xDP8c8U6J0Pf5nb6ZsRPLa07w
         lvF1mAin05X5nQ6yr9YHqzzH6WE1tj5NfqBaRxzQO62Q2U87YQX0NuQbCvBrmacJ7wbB
         SNGJzcoKzO7JichxdxjR6IITea5Um8kG0OxImUIzkYhRZZTgz5rr5hRtO4UKoq2GdsI1
         cG53HO7oeARJKTShk889ywceTbz/0odN5rwCdlzDotnad/MUoP3PZhjAvp1KMCg5dFpW
         S9dYwp6Gqc4KPjclrNMXRZlWm1GyrbuH1BS0DtjIpMLgo4oR06ZrzYxyaVDfi+2iiLFU
         Q+eQ==
X-Gm-Message-State: ACrzQf0zFWRlynHW367GypjutwPgj09ROQd8sjIV73iB8BivnMysoJtv
	o6wJ/bXcUCu1xgTU4Npr0dioYxDKGLwjLv6a
X-Google-Smtp-Source: AMsMyM5uVC693lCz8uPOFddzRkzb7zGoraMiG4aBI6nfvFJWNvGTowoKGU7p5rajUhozPgmtEC41pw==
X-Received: by 2002:a63:e641:0:b0:46f:b6e1:195d with SMTP id p1-20020a63e641000000b0046fb6e1195dmr35904699pgj.587.1667835410710;
        Mon, 07 Nov 2022 07:36:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.36.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:36:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/25] Patch review
Date: Mon,  7 Nov 2022 05:36:19 -1000
Message-Id: <cover.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172899

Please review this set of patches for kirkstone and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4436

The following changes since commit e1c36bdfb3c31f359e58d1644c238b74410d6091:

  perf: Depend on native setuptools3 (2022-11-04 07:55:17 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.72
  kern-tools: fix relative path processing

Christian Eggers (1):
  linux-firmware: split rtl8761 firmware

Claus Stovgaard (1):
  gstreamer1.0-libav: fix errors with ffmpeg 5.x

Etienne Cordonnier (1):
  mirrors.bbclass: use shallow tarball for binutils-native

John Edward Broadbent (1):
  externalsrc: git submodule--helper list unsupported

Jose Quaresma (1):
  kernel-yocto: improve fatal error messages of symbol_why.py

Keiya Nobuta (1):
  create-spdx: Remove ";name=..." for downloadLocation

Martin Jansa (2):
  vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in
    do_unpack
  externalsrc.bbclass: fix git repo detection

Peter Kjellerstedt (1):
  externalsrc.bbclass: Remove a trailing slash from ${B}

Richard Purdie (1):
  numactl: upgrade 2.0.14 -> 2.0.15

Sean Anderson (2):
  kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
  uboot-sign: Fix using wrong KEY_REQ_ARGS

Sergei Zhmylev (1):
  wic: honor the SOURCE_DATE_EPOCH in case of updated fstab

Thomas Perrot (1):
  xserver-xorg: move some recommended dependencies in required

Vincent Davis Jr (1):
  linux-firmware: package amdgpu firmware

wangmy (8):
  libcap: upgrade 2.65 -> 2.66
  libical: upgrade 3.0.14 -> 3.0.15
  numactl: upgrade 2.0.15 -> 2.0.16
  wpebackend-fdo: upgrade 1.12.1 -> 1.14.0
  libksba: upgrade 1.6.0 -> 1.6.2
  lttng-ust: upgrade 2.13.3 -> 2.13.4
  lttng-ust: upgrade 2.13.4 -> 2.13.5
  lighttpd: upgrade 1.4.66 -> 1.4.67

 meta/classes/create-spdx.bbclass              |  1 +
 meta/classes/externalsrc.bbclass              | 25 +++---
 meta/classes/kernel-yocto.bbclass             | 10 +--
 meta/classes/kernel.bbclass                   |  4 +-
 meta/classes/mirrors.bbclass                  |  1 +
 meta/classes/uboot-sign.bbclass               |  2 +-
 .../lighttpd/lighttpd/CVE-2022-41556.patch    | 31 -------
 ...{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} |  3 +-
 .../vulkan/vulkan-samples_git.bb              |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  6 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux-firmware/linux-firmware_20220913.bb | 18 ++++
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++---
 ...ttng-ust_2.13.3.bb => lttng-ust_2.13.5.bb} |  2 +-
 ...r-APNG-encoder-property-registration.patch | 86 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.20.3.bb    |  4 +-
 ...fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} |  2 +-
 ...-Raise-the-size-of-arrays-containing.patch |  2 +-
 .../libcap/{libcap_2.65.bb => libcap_2.66.bb} |  2 +-
 .../{libical_3.0.14.bb => libical_3.0.15.bb}  |  2 +-
 .../{libksba_1.6.0.bb => libksba_1.6.2.bb}    |  2 +-
 meta/recipes-support/numactl/numactl_git.bb   |  6 +-
 scripts/lib/wic/partition.py                  |  7 +-
 scripts/lib/wic/plugins/imager/direct.py      |  3 +
 scripts/lib/wic/plugins/source/rootfs.py      |  2 +-
 27 files changed, 173 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} (96%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.3.bb => lttng-ust_2.13.5.bb} (95%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} (90%)
 rename meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb} (96%)
 rename meta/recipes-support/libical/{libical_3.0.14.bb => libical_3.0.15.bb} (96%)
 rename meta/recipes-support/libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb} (94%)

-- 
2.25.1


