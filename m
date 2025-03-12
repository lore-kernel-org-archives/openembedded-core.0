Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4F2C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:47 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.4454.1741809160832485145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OCVtFZvN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22438c356c8so4538295ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809160; x=1742413960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q+sbp7GSovrBdM5WC63hzX7vjYftEXBdF2HZCc7cQ2E=;
        b=OCVtFZvNuz5a72g5+v/RpTa8vIpr/fn7u7tf5rHp62Xgj3+KsCXdSyLaj86xH+dm2/
         82nyA3Wyo996sorTANC2WHBPMFQQBYaL0PheBK2tztNdummMvZoGwSHZ4d9jPd8ri26I
         V1FVrp3OKSZxWHl0DpFdO4ZM9Hk2BcOBQ6S7Fd7LNJkOpiK2BxFoUkWHp1bWVOGJS2cn
         KDentFAaL8lNchuidyQEi4QgXG4o5BC+mqEliIm1Ss8OHoNLsIt5FrARomFvCrVp065v
         ybO2nSzBu2/GkoeZ4Jk4IqufTpBKlhnLJrY2b22/SOL2omMUVpMn0FAtRHkjkTlPbnuV
         /Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809160; x=1742413960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+sbp7GSovrBdM5WC63hzX7vjYftEXBdF2HZCc7cQ2E=;
        b=CYv3+O3XO5kcR0dzqhAQaDFC2SxP+8uz6qqFGFa+nlTExtnOjmShmhmFsKHC3WGDGH
         9LuAMkZRofbLtBuxLRv/Xf7K07UyOcbYFV1pc4r22LMvT0OsYjyouj4EnvECNQsnS7UF
         WoU876g20qQ+54dnErw/aVdiCi9V3D5PnRqibKwCrjaacXe/F9/7NseW5aUZx+/CIWIh
         X/rBqK5MFSxbarON6QTBso5oLqXzRBtyAHdqIDh68mZlc6dyDzQTxQC8lWBYUq+2UkI8
         DZTk1z2M8mt2Tjm/mYkuHoEO3oLN9dgGb63hO102KC7RnUJXNKjQKU/7qqMYwaVif7f8
         eALQ==
X-Gm-Message-State: AOJu0YzkvbQNk/tb/6XkXyeImyQuuhr5QHWezgslV0Qs6HhU1djX9tn2
	KH5B4fC4PQT8rY07ZxFjpHLCvQoU26dWozVZRgOAsgJZRKrqaOu9J6rhDrxuS2/I3xnJAGNUfQ8
	g
X-Gm-Gg: ASbGncsOyuXFmzuKQcOyBi9hbOIy/fIusFeFD5IbR25BQgaOXq+U7JJ95XePpA1W8QJ
	KjlQ9CbZ2sZ4eYH2kg1lve2SWU/YbgBAF5wbn1y5IX9m2jzzSDL+0HFmqXY02PCAmYlHCLbvGZZ
	g4+4le1SnJi9Nzz8Mbp5KrXUP3r9wK6hYXtaQFVEIvO9JTAhXJfyNnn77P0t0zETBNwzezIC2AR
	f6bLBIqmaubUKMUsbVMAQImdr4DNABPUCEXJ6Jjx+l5ad6NTqNEx6qUC78bJWThawPYls0wfg8u
	U3offLCuEXaF8rVumEhSl4cdWiyunOSSpbU=
X-Google-Smtp-Source: AGHT+IHIKRqvgt2t4b9c56Om+atxEdRNVJPlnT3cMxYiYnRiMvzxj+jGwTb6YWkxu0K9m4nwpiOw6A==
X-Received: by 2002:a05:6a21:4cc7:b0:1f5:884a:7549 with SMTP id adf61e73a8af0-1f5884aad41mr17131106637.41.1741809160001;
        Wed, 12 Mar 2025 12:52:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 00/25] Patch review
Date: Wed, 12 Mar 2025 12:52:08 -0700
Message-ID: <cover.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212667

Please review this set of changes for styhead and have comments back by
end of day Friday, March 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1175

The following changes since commit 7adb3079430af789f73550eba2da2495b30e78a4:

  tzcode-native: Fix compiler setting from 2023d version (2025-03-06 06:47:57 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Peter Marko (19):
  binutils: patch CVE-2025-0840
  grub: drop obsolete CVE statuses
  grub: backport strlcpy function
  grup: patch CVE-2024-45781
  grub: patch CVE-2024-45782 and CVE-2024-56737
  grub: patch CVE-2024-45780
  grub: patch CVE-2024-45783
  grub: patch CVE-2025-0624
  grub: patch CVE-2024-45774
  grub: patch CVE-2024-45775
  grub: patch CVE-2025-0622
  grub: patch CVE-2024-45776
  grub: patch CVE-2024-45777
  grub: patch CVE-2025-0690
  grub: patch CVE-2025-1118
  grub: patch CVE-2024-45778 and CVE-2024-45779
  grub: patch CVE-2025-0677, CVE-2025-0684, CVE-2025-0685, CVE-2025-0686
    and CVE-2025-0689
  grub: patch CVE-2025-0678 and CVE-2025-1125
  xwayland: upgrade 21.1.4 -> 21.1.6

Ross Burton (3):
  puzzles: ignore three new CVEs for a different puzzles
  xserver-xf86-config: add a configuration fragment to disable screen
    blanking
  xserver-xf86-config: remove obsolete configuration files

Vijay Anusuri (2):
  libtasn1: upgrade 4.19.0 -> 4.20.0
  xserver-xorg: upgrade 21.1.15 -> 21.1.16

Wang Mingyu (1):
  xserver-xorg: upgrade 21.1.14 -> 21.1.15

 .../0001-misc-Implement-grub_strlcpy.patch    |  68 ++++
 .../grub/files/CVE-2024-45774.patch           |  37 ++
 .../grub/files/CVE-2024-45775.patch           |  38 ++
 .../grub/files/CVE-2024-45776.patch           |  39 ++
 .../grub/files/CVE-2024-45777.patch           |  57 +++
 .../files/CVE-2024-45778_CVE-2024-45779.patch |  55 +++
 .../grub/files/CVE-2024-45780.patch           |  93 +++++
 .../grub/files/CVE-2024-45781.patch           |  35 ++
 .../files/CVE-2024-45782_CVE-2024-56737.patch |  36 ++
 .../grub/files/CVE-2024-45783.patch           |  39 ++
 .../grub/files/CVE-2025-0622-01.patch         |  35 ++
 .../grub/files/CVE-2025-0622-02.patch         |  41 ++
 .../grub/files/CVE-2025-0622-03.patch         |  38 ++
 .../grub/files/CVE-2025-0624.patch            |  84 ++++
 ...025-0685_CVE-2025-0686_CVE-2025-0689.patch | 377 ++++++++++++++++++
 .../files/CVE-2025-0678_CVE-2025-1125.patch   |  87 ++++
 .../grub/files/CVE-2025-0690.patch            |  73 ++++
 .../grub/files/CVE-2025-1118.patch            |  37 ++
 meta/recipes-bsp/grub/grub2.inc               |  21 +-
 .../binutils/binutils-2.43.1.inc              |   1 +
 .../binutils/0016-CVE-2025-0840.patch         |  55 +++
 .../xserver-xf86-config/qemuall/noblank.conf  |   7 +
 .../xserver-xf86-config/qemuarm/xorg.conf     |  42 --
 .../xserver-xf86-config/qemuppc/xorg.conf     |  42 --
 .../xserver-xf86-config/qemush4/xorg.conf     |  42 --
 .../xserver-xf86-config/qemux86-64/xorg.conf  |  37 --
 .../xserver-xf86-config/qemux86/xorg.conf     |  37 --
 .../xorg-xserver/xserver-xf86-config_0.1.bb   |   6 +
 ...org_21.1.14.bb => xserver-xorg_21.1.16.bb} |   2 +-
 ...{xwayland_24.1.4.bb => xwayland_24.1.6.bb} |   6 +-
 meta/recipes-sato/puzzles/puzzles_git.bb      |   3 +
 ...{libtasn1_4.19.0.bb => libtasn1_4.20.0.bb} |   7 +-
 32 files changed, 1368 insertions(+), 209 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45774.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45775.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45776.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45777.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45780.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45781.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45783.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0624.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0690.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-1118.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-0840.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/noblank.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.14.bb => xserver-xorg_21.1.16.bb} (92%)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.4.bb => xwayland_24.1.6.bb} (84%)
 rename meta/recipes-support/gnutls/{libtasn1_4.19.0.bb => libtasn1_4.20.0.bb} (63%)

-- 
2.43.0


