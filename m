Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A7FCF649E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:46 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.45271.1727661447897218758
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X/i/9oAz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e0c7eaf159so2157383a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661447; x=1728266247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XxxIm1nmnnsy+O86nBP+MFCtI0DEh02Lp6/92x8y+CE=;
        b=X/i/9oAzlngcItUtSiteWhBXA1sE3htiGeU7Lto+nNmkSaSBchslNuU2v7LsE5C62T
         ZVDX1RdkCvL0rk33addiXu2Bk5rLuLm+Dn727aEnhy6huiTYnnxrqtv+yM/qmL3jXpHt
         49l415Ixv2qbodskBtBTGA8hm7pMxwUrGwTRVAS4yFPHM9TCaFNbtxJ9lDy3cOHN4EuO
         DX3n66aIsXudOrtNS7A+EknOuj91Z7pfXlqeye2c6BfxOj8nu+KD26Z6OQY0/AC9aEP0
         yD8NWxkzneD3+hjp83HYEHDJlvKdRlatYEKMxxSSUktiJVLJ8fKikW49z+5WabaklP/1
         nKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661447; x=1728266247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxxIm1nmnnsy+O86nBP+MFCtI0DEh02Lp6/92x8y+CE=;
        b=aWK6DPMJE8fqOuo1C67qs9dM0/xuQstYdjjaN/pDd8xCk1N/YNACxSQl7zRpQoQcT+
         T9aYVjVrmuNHKH4aAiurBFu6EGwqob25dm5kVXO+DlgK81Q8cO0YxF2tyeod09Bht+KV
         nmpBjUuYPK3bgQPP6/YvvPZa+OvP64liTlLAqXzNHYS9wI9t1OAAMugtQm8BSkbm4eCE
         FJmcNtHTiJ8cpntA9wQlhpJyjZokifdlqYIGCQi3J+6/iWO7YkLJ/mfjaNjaYCjWd0Gt
         t1zc9dX13oZjENaAkMlf18Zwb68WMHGwxdRDOwkwFpuLcphuQmcU/mQdjSf7vEkPi0j4
         MIYA==
X-Gm-Message-State: AOJu0Yw9vnvMmt0H92rVeXyqYU0hh0RFbxiqQlKUFpD/h308zHWjvllm
	Hye8ImSU19KcKYw+wRMkLRgtZsOZHtDiBdmP9A8Kac4KK3nJOFtLMhz08e1WXpN9JiX9R1/e+v7
	cLTI=
X-Google-Smtp-Source: AGHT+IFi7fXwVE5m66Rke6bM4XdTOeXDlopz5sZLmXroCee0MXkXX+1BvgKCnNGJKpct6GFxqwcgXQ==
X-Received: by 2002:a17:90a:6b4e:b0:2e0:ad42:8faf with SMTP id 98e67ed59e1d1-2e0b8b498e5mr12752712a91.22.1727661446937;
        Sun, 29 Sep 2024 18:57:26 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/27] Patch review
Date: Sun, 29 Sep 2024 18:56:55 -0700
Message-Id: <cover.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205062

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, October 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7365

The following changes since commit f888dd911529a828820799a7a1b75dfd3a44847c:

  build-appliance-image: Update to scarthgap head revision (2024-09-25 08:06:11 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Adrian Freihofer (2):
  kernel-fitimage: fix intentation
  kernel-fitimage: fix external dtb check

Aleksandar Nikolic (3):
  install-buildtools: remove md5 checksum validation
  install-buildtools: fix "test installation" step
  install-buildtools: update base-url, release and installer version

Alexander Kanavin (1):
  pulseaudio, desktop-file-utils: correct freedesktop.org ->
    www.freedesktop.org SRC_URI

Bruce Ashfield (11):
  linux-yocto/6.6: update to v6.6.36
  linux-yocto/6.6: update to v6.6.38
  linux-yocto/6.6: update to v6.6.40
  linux-yocto/6.6: update to v6.6.43
  kernel-devsrc: remove 64 bit vdso cmd files
  linux-yocto/6.6: update to v6.6.44
  linux-yocto/6.6: update to v6.6.45
  linux-yocto/6.6: fix genericarm64 config warning
  linux-yocto/6.6: update to v6.6.47
  linux-yocto/6.6: update to v6.6.49
  linux-yocto/6.6: update to v6.6.50

Deepesh Varatharajan (1):
  binutils: stable 2.42 branch updates

Hitendra Prajapati (1):
  curl: fix CVE-2024-8096

Jaeyoon Jung (1):
  makedevs: Fix issue when rootdir of / is given

Konrad Weihmann (3):
  runqemu: keep generating tap devices
  testimage: fallback for empty IMAGE_LINK_NAME
  testexport: fallback for empty IMAGE_LINK_NAME

Richard Purdie (2):
  scripts/install-buildtools: Update to 5.0.3
  bitbake.conf: Add truncate to HOSTTOOLS

Victor Kamensky (1):
  systemtap: fix systemtap-native build error on Fedora 40

Yi Zhao (1):
  rpm: fix expansion of %_libdir in macros

 meta/classes-recipe/kernel-fitimage.bbclass   |  66 +++---
 meta/classes-recipe/testexport.bbclass        |   2 +-
 meta/classes-recipe/testimage.bbclass         |   4 +-
 meta/conf/bitbake.conf                        |   2 +-
 .../binutils/binutils-2.42.inc                |   2 +-
 .../desktop-file-utils_0.27.bb                |   2 +-
 .../makedevs/makedevs/makedevs.c              |  21 +-
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |  53 +++++
 meta/recipes-devtools/rpm/rpm_4.19.1.1.bb     |   1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   1 +
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +--
 ...gcc-version-compatibility-hack-redux.patch |  32 +++
 ...e.cxx-gcc-version-compatibility-hack.patch |  52 +++++
 .../systemtap/systemtap_git.inc               |   2 +
 .../pulseaudio/pulseaudio_17.0.bb             |   2 +-
 .../curl/curl/CVE-2024-8096.patch             | 207 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 scripts/install-buildtools                    |  47 ++--
 scripts/runqemu                               |  24 +-
 21 files changed, 460 insertions(+), 101 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack-redux.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-elaborate.cxx-gcc-version-compatibility-hack.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-8096.patch

-- 
2.34.1


