Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A016C0015E
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:01:20 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.11750.1689696074848776459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=2zkJShhi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666e3b15370so4290519b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689696074; x=1692288074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uj3tdf2aEXTpmjwRQGONhtxKQiXoekW/BJe0yfZIIhc=;
        b=2zkJShhixo9kcpMCsRi2smvmIGcyPbBAGhpPEhXvUc1Gp5zhuRp9I3GIpEqnWCU85J
         OzwbvzfezBq4EiGAA03X8HDbnxawkA9+dzQchZaRN40L4phAUZxyRqZwbbmwu6oULJBS
         1XyCznbFenF2hRKu55c96NB5xRp8Csv83R1naQWKDfzGZnfelSXyTI1lVICdXYNROFxM
         TH6fWeiqSwF1yio84jBn6M4dBEeHZC9ctnUiRaYm95J39RmBQyF8vbFKBAhJ2tBjhIwA
         yYQ3CKsHc51X+hnTvMAzdkht97WZDcGzFvVT28kLSvruXhu7Gz+d3lT57CCEwyEJAXG4
         9ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696074; x=1692288074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uj3tdf2aEXTpmjwRQGONhtxKQiXoekW/BJe0yfZIIhc=;
        b=ZRHCcYp56JJDS593Ow8iJBgjO8TqHvRKPiSO+IebUmRakciV9EeFohsGVEYefUX+NG
         VJaqs0TydNh3gGW4bog6b0OMChen1oAIwujiXE17Qx162ws074mUAOGssLUHmfchnJ/G
         dmQD+ZsaxY92+9vhr8jHLO7YmPFRPpQ7ZYwtWtUZTu1URyb57/EjvLknQgdQmLvCVWgm
         WRBcUpy9KsF5tM4fgb0NJLXVO60XctAbY6shpijuavbH9piSAPhD5XMjjr+wru69+n4d
         bcqM78IH212el1iJrB0QoQXT9mB9x7x317eTTb6h9Fkp1UrMyyh07PTS1WvpTw0NW4In
         39TQ==
X-Gm-Message-State: ABy/qLZ0JNjsKSbe1cxeYriZtpS+a0+Efwduzjd4Lzy4o0XLi95h6F88
	3gjMGbYoMOQLKH/PpsSK3btU0tXyWL7bABH+5es=
X-Google-Smtp-Source: APBJJlFVF7e++sjSmJROq4N0FH1Qb2pqObP9XD7uE/5VGkh8Vr+Cxm5Ug1xum0qaf7SHUBkJt9HLfg==
X-Received: by 2002:a05:6a20:6a27:b0:134:6839:c497 with SMTP id p39-20020a056a206a2700b001346839c497mr3022337pzk.11.1689696073740;
        Tue, 18 Jul 2023 09:01:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q17-20020a62e111000000b0064928cb5f03sm1710089pfh.69.2023.07.18.09.01.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:01:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/13] Patch review
Date: Tue, 18 Jul 2023 06:00:51 -1000
Message-Id: <cover.1689690585.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184537

Please review this set of changes for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5614

The following changes since commit b3fc8ef9aba822b3d485242c8ebd0e0bff0ebfc8:

  cve-update-nvd2-native: actually use API keys (2023-07-13 06:54:58 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (2):
  linux-firmware: upgrade 20230404 -> 20230515
  wireless-regdb: upgrade 2023.02.13 -> 2023.05.03

Anthony Bagwell (1):
  kernel-fitimage: fix dtbo support for fit images

Ashish Sharma (1):
  go: Fix CVE-2023-29400

Deepthi Hemraj (1):
  glibc: stable 2.31 branch updates.

Nikhil R (1):
  libpng: Add ptest for libpng

Poonam Jadhav (1):
  libx11: Fix CVE-2023-3138 for dunfell branch

Priyal Doshi (1):
  tzdata: upgrade to 2023c

Tom Hochstein (1):
  cmake: Fix CMAKE_SYSTEM_PROCESSOR setting for SDK

Trevor Gamblin (1):
  vim: upgrade 9.0.1527 -> 9.0.1592

Vijay Anusuri (1):
  qemu: backport Debian patch to fix CVE-2023-0330

Vivek Kumbhar (2):
  curl: fix CVE-2023-28320 siglongjmp race condition may lead to crash
  python3: fix CVE-2023-24329 urllib.parse url blocklisting bypass

 meta/classes/kernel-fitimage.bbclass          |   2 +-
 .../distro/include/ptest-packagelists.inc     |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../cmake/cmake/OEToolchainConfig.cmake       |   5 +-
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2023-29400.patch           |  94 +++++++++
 .../python/python3/CVE-2023-24329.patch       |  80 +++++++
 .../recipes-devtools/python/python3_3.8.17.bb |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-0330.patch             |  77 +++++++
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../xorg-lib/libx11/CVE-2023-3138.patch       | 111 ++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
 ...20230404.bb => linux-firmware_20230515.bb} |   4 +-
 ....02.13.bb => wireless-regdb_2023.05.03.bb} |   2 +-
 .../recipes-multimedia/libpng/files/run-ptest |  29 +++
 .../libpng/libpng_1.6.37.bb                   |  15 +-
 .../curl/curl/CVE-2023-28320-fol1.patch       | 197 ++++++++++++++++++
 .../curl/curl/CVE-2023-28320.patch            |  86 ++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 21 files changed, 705 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29400.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2023-24329.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230404.bb => linux-firmware_20230515.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} (94%)
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320-fol1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patch

-- 
2.34.1


