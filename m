Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C2BEE57DF
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:27 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.35240.1726097006683663073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jiMyYT07;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-717849c0dcaso289248b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097006; x=1726701806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rluMex6ITIUYyJjg+oAT85IM1R9ufSo5t1UNoAJTGIU=;
        b=jiMyYT07Pui2cO9GcP6+epicg3qOXTdoEW/zJ7tXYTS82rxBQ+tOMFmwM8j+9D0Zy2
         7S8xhbOLUhxIv6HDkdKL2Kg0RAaLNA8sf3Jq4DdJW+cvDNqIwqJBf+TtR7+IKoJukaE/
         L/o1hv2hLRc6KIn1qHwcTExYj6u1MyOtwQ+ZycWoIE1hiayrK3m9lfSe4UkkXU4xBjbu
         jng8adsQyukSL81CRG8EsSbtvopiDAX4UqG1BXx4o47Jb9jsVVFxONEN5HP4GSm14KKl
         KGNxxYFDyq2dqUXGEE6pk/4lgAMfK3KHWcQuOOYdFMnVdm3+mqXiD1nz8aHO6ytOIxZn
         Ubhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097006; x=1726701806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rluMex6ITIUYyJjg+oAT85IM1R9ufSo5t1UNoAJTGIU=;
        b=v+sr2KieuIBMVRLotcYH0wmBgY8CUCEgwwX2+I7MfuMl60c1FOKvT7foXh0PtZfnkm
         k3XpIg9d0JLXSgmJ2cWd+lRqU+SUNbkPtQJcjMIaId3PGZcfiB/aKD1kB3mBQN2K8Db2
         JhjygzrcG5FzR7eUcsgPdRkju3t1Pth6HahI0aXOnnT2kgEJXSnrEconqCB9cJbdoRho
         I9iB2Ym4kgpJscJVBfrhHCo14mMh6MNNYMgOaS/RI7KAG5Obp/L2d1SxRO03Pq9+vukq
         VIyhWPDWh4VvfB/wE23a53wImP5GlIK1m65+B4K/Yw9b/knAfY/Aiz/tKJ/ZC3VRlrTd
         cjjA==
X-Gm-Message-State: AOJu0Yzn5iiK7KXhfCEu3CBed38pTUyuflcTzsVvyA2Bg5582k7KHsYN
	Z48ov2/8BrsUzeNxMr+tdwGnQ5W6G9XSLX5QZLiVmma1EhtduJTLfuCLxRiPc9NpKtFkk2uGMlQ
	+
X-Google-Smtp-Source: AGHT+IHWEm5DE6U1KzKVd/wfmeTaRrjWP4HivAIFT0yMXBKqnnFHEZgMpzCzqJlDPSF2Q+GqFTrC/w==
X-Received: by 2002:a05:6a00:8c4:b0:70d:323f:d0c6 with SMTP id d2e1a72fcca58-7192620d8c7mr1409398b3a.24.1726097005614;
        Wed, 11 Sep 2024 16:23:25 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/22] Patch review
Date: Wed, 11 Sep 2024 16:22:57 -0700
Message-Id: <cover.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204394

Please review this set of changes for kirkstone and have comments back by
end of day Friday, September 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7324

The following changes since commit c40a3fec49942ac6d25ba33e57e801a550e252c9:

  build-appliance-image: Update to kirkstone head revision (2024-09-07 05:39:34 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexandre Belloni (1):
  cve-exclusion: Drop the version comparision/warning

Archana Polampalli (3):
  expat: fix CVE-2024-45490
  expat: fix CVE-2024-45491
  expat: fix CVE-2024-45492

Bruce Ashfield (6):
  linux-yocto/5.10: update to v5.10.216
  linux-yocto/5.10: remove obsolete options
  linux-yocto/5.10: update to v5.10.223
  linux-yocto/5.10: fix NFSV3 config warning
  linux-yocto/5.15: update to v5.15.165
  linux-yocto/5.15: update to v5.15.166

Hitendra Prajapati (1):
  python3: fix CVE-2023-27043

Hugo SIMELIERE (1):
  python3: CVE-2024-6232 CVE-2024-7592 fixes

Niko Mauno (6):
  iw: Fix LICENSE
  dejagnu: Fix LICENSE
  unzip: Fix LICENSE
  zip: Fix LICENSE
  tiff: Fix LICENSE
  gcr: Fix LICENSE

Richard Purdie (2):
  ruby: Make docs generation deterministic
  libedit: Make docs generation deterministic

Siddharth Doshi (1):
  openssl: Upgrade 3.0.14 -> 3.0.15

Vijay Anusuri (1):
  qemu: Backport fix for CVE-2024-4467

 meta/recipes-connectivity/iw/iw_5.16.bb       |    2 +-
 .../openssl/openssl/CVE-2024-5535_1.patch     |  115 --
 .../openssl/openssl/CVE-2024-5535_2.patch     |   44 -
 .../openssl/openssl/CVE-2024-5535_3.patch     |   84 --
 .../openssl/openssl/CVE-2024-5535_4.patch     |  178 ---
 .../openssl/openssl/CVE-2024-5535_5.patch     | 1175 -----------------
 .../openssl/openssl/CVE-2024-5535_6.patch     |   45 -
 .../openssl/openssl/CVE-2024-5535_7.patch     |   68 -
 .../openssl/openssl/CVE-2024-5535_8.patch     |  273 ----
 .../openssl/openssl/CVE-2024-5535_9.patch     |  205 ---
 .../{openssl_3.0.14.bb => openssl_3.0.15.bb}  |   13 +-
 .../expat/expat/CVE-2024-45490-0001.patch     |   35 +
 .../expat/expat/CVE-2024-45490-0002.patch     |  250 ++++
 .../expat/expat/CVE-2024-45490-0003.patch     |   91 ++
 .../expat/expat/CVE-2024-45490-0004.patch     |   49 +
 .../expat/expat/CVE-2024-45491.patch          |   39 +
 .../expat/expat/CVE-2024-45492.patch          |   38 +
 meta/recipes-core/expat/expat_2.5.0.bb        |    6 +
 .../recipes-devtools/dejagnu/dejagnu_1.6.3.bb |    2 +-
 .../libedit/libedit_20210910-3.1.bb           |    7 +
 .../python/python3/CVE-2023-27043.patch       |  510 +++++++
 .../python/python3/CVE-2024-6232.patch        |  251 ++++
 .../python/python3/CVE-2024-7592.patch        |  140 ++
 .../python/python3_3.10.14.bb                 |    3 +
 meta/recipes-devtools/qemu/qemu.inc           |    5 +
 .../qemu/qemu/CVE-2024-4467-0001.patch        |  214 +++
 .../qemu/qemu/CVE-2024-4467-0002.patch        |   73 +
 .../qemu/qemu/CVE-2024-4467-0003.patch        |   76 ++
 .../qemu/qemu/CVE-2024-4467-0004.patch        |  571 ++++++++
 .../qemu/qemu/CVE-2024-4467-0005.patch        |  265 ++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |    1 +
 meta/recipes-extended/unzip/unzip_6.0.bb      |    2 +-
 meta/recipes-extended/zip/zip_3.0.bb          |    2 +-
 meta/recipes-gnome/gcr/gcr_3.40.0.bb          |    2 +-
 .../linux/cve-exclusion_5.10.inc              |   14 +-
 .../linux/cve-exclusion_5.15.inc              |   14 +-
 .../linux/linux-yocto-rt_5.10.bb              |    6 +-
 .../linux/linux-yocto-rt_5.15.bb              |    6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |    8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |    6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |   24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |   26 +-
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |    2 +-
 43 files changed, 2684 insertions(+), 2256 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_2.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_3.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_4.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_5.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_6.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_7.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_8.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-5535_9.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.14.bb => openssl_3.0.15.bb} (94%)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0001.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0002.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0003.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45490-0004.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45491.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-45492.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2023-27043.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-6232.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch

-- 
2.34.1


