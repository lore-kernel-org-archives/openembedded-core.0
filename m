Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCF9C77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:57:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.80352.1682431076768025186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KjY584KO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-63b7588005fso4869516b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431076; x=1685023076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFxr5QtJgZTM1GKdTHTOPTkLLKgE18i7EvtOwwZVg7c=;
        b=KjY584KOLE8+ct3uvPUMst1P68ktuBmT/c01sPMULJJhOUgjCNE/VDPwCoEWcXCbfd
         Zi5wlYPp8xRUPKl+6HQVzaVSp9zdG0JMRuoyttoImU2Q32T0xIoSczeaFHFxov7hfmdy
         g2PYlkEO1sI+mDkd6ExygoblaQPkCuJdFIp/8NIBizLgTwBHZIISw1m8/kNGyShfDkon
         QLIOib0pDZwCnt8o8w1uySRUuOoAkHy3mu/NB8O4gfYIrvHMV/+SWXid/o4cKGarG3rg
         uUdFSCm/gnuTpTTRCGpkknS0XlMHMpF+81HdBFERLRvuDXy/0cIHnCbKc9ZzifdCO1Pg
         XBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431076; x=1685023076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFxr5QtJgZTM1GKdTHTOPTkLLKgE18i7EvtOwwZVg7c=;
        b=YOSsD4TPdTORK3rJWNTUDGx6+Wl6c6PdWwAW6SCdrSKO4hUxvNwCU2uIJLZwLYXm/k
         +MzhesCUx/1DN4lHe3WmtvKEs0EZQe0tHJJCa6EohOX9nIE2/GCPnzsVppEae8nhx3p4
         EK1/BTvlISmQrMYbxu6CrZOPPeMTkFm6g9Y61ju7s9UZlroM/5Cw7/NbsaEbSOms6dqe
         WiiqKcde5XVqXB5abF9NBLRiRpg/2PSGBrfc1nN3nQa9MvvA7fr2VUP6+/+ksc3jXZ1F
         47OvuT+2idGPmcVRnkP3Z1hggogmgl5W7wiofoeXpxtZl25AelAiD20IpjI8aNxV+JyB
         ADGQ==
X-Gm-Message-State: AAQBX9fHPWsIXnlCokIS/l3BJyl/7z3kALFLxezoXfSBpDlIeDHJ4GSC
	K3JquSammrAPYUagIDrMttDGaNYCIFJaH5KsYlU=
X-Google-Smtp-Source: AKy350YS8IdxZsjLpnI/XFftm2zUmA4D3OzMeVizExM5ZZ6wcibz7kDkTd3wNeAs2rQ4bxr7yT9hFA==
X-Received: by 2002:a05:6a20:840e:b0:ee:454f:11d8 with SMTP id c14-20020a056a20840e00b000ee454f11d8mr22397862pzd.40.1682431075669;
        Tue, 25 Apr 2023 06:57:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.57.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:57:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/10] Patch review
Date: Tue, 25 Apr 2023 03:57:32 -1000
Message-Id: <cover.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180376

Please review this set of patches for langdale and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5215

The following changes since commit 5f2d74856e6790e8742f7d6049f7a21c4c17d987:

  report-error: catch Nothing PROVIDES error (2023-04-05 06:24:00 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.106
  linux-yocto/5.15: update to v5.15.107
  linux-yocto/5.15: update to v5.15.108

Chris Elledge (1):
  busybox: move hwclock init earlier in startup

Christoph Lauer (1):
  populate_sdk_base: add zip options

Marek Vasut (1):
  cpio: Fix wrong CRC with ASCII CRC for large files

Mikko Rapeli (2):
  oeqa ping.py: avoid busylooping failing ping command
  oeqa ping.py: fail test if target IP address has not been set

Ross Burton (2):
  xserver-xorg: backport fix for CVE-2023-1393
  screen: backport fix for CVE-2023-24626

 meta/classes-recipe/populate_sdk_base.bbclass |  4 +-
 meta/lib/oeqa/runtime/cases/ping.py           |  3 ++
 meta/recipes-core/busybox/busybox.inc         |  1 +
 ...g-CRC-with-ASCII-CRC-for-large-files.patch | 39 ++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |  1 +
 .../screen/screen/signal-permission.patch     | 40 ++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |  1 +
 ...posite-Fix-use-after-free-of-the-COW.patch | 46 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.7.bb       |  3 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +--
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++------
 12 files changed, 155 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch
 create mode 100644 meta/recipes-extended/screen/screen/signal-permission.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch

-- 
2.34.1


