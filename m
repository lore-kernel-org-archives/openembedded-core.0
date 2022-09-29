Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF848C54EE9
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 02:06:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.5948.1664417163028241095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uW4PZnVe;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so26568pjh.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=EHfp8IOchzUkF6IyHf3DJjTZ4ZkRUhFHoAM8CGoKuPk=;
        b=uW4PZnVezFtPOJAK9pzRP1uZW+l397oRxD21AGgiYz6tyMuYlPVzQ+GtqugcDhdPj8
         Tc6hpMdLhEdeZ9azfxwppglOtOQ1DMZirowP40eNQodqIocGCqzwQ2tTUd5iMi27PoTr
         nPobSBh2Ec6M6pr4VzDUapPIFsu61bSialgqFyT1FSpKmUIcRzaW3ORxXFldEI2bf7EI
         mplq23ZS1v7/VQlykqYsXZx/XIkydGc+sgGe5b3gAvndz1l6Fph16Oe6GgUAoF8IgZKF
         Zy/QrZ+8g4mfa09mDJt5LC/eUOCT9KHdPnYqEzDknO/NTUov62CO1+lCSzc5n60owRJ1
         5Mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=EHfp8IOchzUkF6IyHf3DJjTZ4ZkRUhFHoAM8CGoKuPk=;
        b=niz/hkPyGjjam2+saf+Ino6K215bDqAnHQoL7ZvnTXvVW7Zgsa4pfOIGiXDJaC4ni/
         VdDK6nvn8kBSv6RWhXjCX/HfseDyso8HKJ4BkGS9uPazCFmE8VSsbqYO9K76sR6XG3dM
         0MNX7FJVYwKxnEZI4gf8pkosG0tkPi4hoFgQIAZ31uNt62/HL9A/Vc/qSULNUJz3Deui
         Zk7tXi5RJlduNVO2uizgC+sRo7EdA+N+jTkfF1exoVBZPzpf6Q5cHokcfACiProtLwJw
         bS0IAmj6eGkAx2X4P9Mq5xHOdcZJJYCoac0qe/+gWWBDEaUft96FsRjooyISkipn9GaY
         JCHw==
X-Gm-Message-State: ACrzQf1zPGv0v6Pzbqy1AozyGnKmyIMypi4DyD3SWzuHCQizY+Iu+aAf
	C2cUGjTyOvuzKZo5hn0G2US9NWC7VZP4GfQS
X-Google-Smtp-Source: 
 AMsMyM5pQfzjLpPk51/A/fDfKDspTenJy934xYR1ifr2Z4bAmuX0VAdjTpPsjOrMOKd7Idt8jE9MkA==
X-Received: by 2002:a17:90b:1b10:b0:200:934b:741f with SMTP id
 nu16-20020a17090b1b1000b00200934b741fmr1069586pjb.212.1664417161509;
        Wed, 28 Sep 2022 19:06:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x1-20020a1709027c0100b0017680faa1a8sm4464214pll.112.2022.09.28.19.06.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 19:06:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Patch review
Date: Wed, 28 Sep 2022 16:05:49 -1000
Message-Id: <cover.1664417041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 02:06:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171160

Please review this set of patches for dunfell and have comments back by end
of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4278

The following changes since commit 6227efbf03d2e7ca773ab29177705203f2550722:

  linux-firmware: package new Qualcomm firmware (2022-09-26 12:29:44 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Hitendra Prajapati (1):
  bluez: CVE-2022-39176 BlueZ allows physically proximate attackers

Martin Jansa (1):
  create-pull-request: don't switch the git remote protocol to git://

Richard Purdie (1):
  vim: Upgrade 9.0.0541 -> 9.0.0598

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2022-39176.patch        | 126 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/create-pull-request                   |   2 +-
 4 files changed, 130 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-39176.patch

-- 
2.25.1


