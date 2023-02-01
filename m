Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A39CC636D3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.24346.1675260843460695547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2nTCxtH3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so2123739pjb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrKyTf8g/48LtppRvEFP71We8pLgbeofydjoLBjlS8A=;
        b=2nTCxtH3bKRmuH19mry4ocFg/yNFnG+yD/38uWrUU1B5dJwv6Ppjmjnlj5i+M8AQgi
         krBX1WhTS75sWEI5Y+g6wZAm7cYs1ETS5CR5iy5gKzjsQf6aW275EwuojwShdIGx4+DJ
         z0Hz8k6T3Wx4hH/fQZsCq5x+MfWNoFOjtoWQyTF/be2UY0mr32l020wdDSCBxHp6KD49
         35ePKxWeHZA3mPlWdIagVf5qs2aAe725Lm/JBwp/R02Xqboh5WQDjVBd47FkjxJKrrPN
         jSTSYPsAU5sVF9V16Z8i0Q3XSjezLxnqQYZRknF7XmwiAgLEouQeaJ4ojYdsp4lLP5Dz
         wvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrKyTf8g/48LtppRvEFP71We8pLgbeofydjoLBjlS8A=;
        b=vHKvxjYwItURGjhdBQcW97kZrq5TRq7SDLNtV4rVZMBl9IzPhUioOhXjfz7fLXMdiH
         rzISbu+1DVAy6pObukQMCskMgQkCr/jXdtYcyc3U7MO+f0zqNTJopOpcMtKSZOPOhhGE
         5GPOoq6HsNVyjwt2EJIhofbQMvrEFPEfDzqLjFOO2HFdxyhRwA1wB454ITsJmwbCVBx0
         aqKMtqwecBM/9DtXXa+o9beMTnxQU39LSTSkWDPUY6axwd7AdufiP726a1aiaCyKtALm
         rN41LS9vJ6ZKuyYbjAXGoWWb/GyHPgJDJWYZrw9Or9QyIf7eJwdgoUFTYHdKAKeIRkTe
         V/Pw==
X-Gm-Message-State: AO0yUKUa/Fjtw+SN1y8CO/TnMZhtCr1UxbwFvaLvqa+vFyV68vFoqesb
	jL97cJNO6f088wBFaTYv11Cn7N/xyijPAlV88hw=
X-Google-Smtp-Source: AK7set+xDadmNerSY+uHXtK5Srr8IdZshrxoo3OS+PJ/9y4PtreNdzcd9NXV88hFYYNZvSXfeCUyaQ==
X-Received: by 2002:a17:903:246:b0:198:a715:d26d with SMTP id j6-20020a170903024600b00198a715d26dmr3760352plh.8.1675260842173;
        Wed, 01 Feb 2023 06:14:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/17] Patch review
Date: Wed,  1 Feb 2023 04:13:38 -1000
Message-Id: <cover.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176535

Please review this set of patches for langdale and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4871

The following changes since commit cfd9f549a0d5dd44f4c71bd077b5fd17d3683550:

  selftest/virgl: use pkg-config from the host (2023-01-19 16:28:32 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Armin Kuster (1):
  lttng-modules: Fix for 5.10.163 kernel version

Bruce Ashfield (1):
  linux-yocto/5.15: update to v5.15.87

He Zhe (1):
  lttng-modules: update 2.13.7 -> 2.13.8

Khem Raj (4):
  createrepo-c: Include missing rpm/rpmstring.h
  libtirpc: Check if file exists before operating on it
  libusb1: Link with latomic only if compiler has no atomic builtins
  libusb1: Strip trailing whitespaces

Niko Mauno (1):
  Fix missing leading whitespace with ':append'

Peter Kjellerstedt (1):
  librsvg: Only enable the Vala bindings if GObject Introspection is
    enabled

Richard Purdie (1):
  native: Drop special variable handling

Ross Burton (4):
  ppp: backport fix for CVE-2022-4603
  quilt: fix intermittent failure in faildiff.test
  spirv-headers/spirv-tools: set correct branch name
  quilt: use upstreamed faildiff.test fix

Thomas Roos (1):
  devtool: fix devtool finish when gitmodules file is empty

Vivek Kumbhar (1):
  openssl: fix CVE-2022-3996 double locking leads to denial of service

Xiangyu Chen (1):
  numactl: skip test case when target platform doesn't have 2 CPU node

 meta/classes-recipe/core-image.bbclass        |  2 +-
 meta/classes-recipe/native.bbclass            |  2 +-
 meta/classes-recipe/populate_sdk_ext.bbclass  |  2 +-
 meta/classes/externalsrc.bbclass              |  2 +-
 .../distro/include/ptest-packagelists.inc     |  2 +-
 .../openssl/openssl/CVE-2022-3996.patch       | 43 +++++++++++++
 .../openssl/openssl_3.0.7.bb                  |  1 +
 .../ppp/ppp/CVE-2022-4603.patch               | 48 +++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  1 +
 .../0001-include-rpm-rpmstring.h.patch        | 27 ++++++++
 .../createrepo-c/createrepo-c_0.20.1.bb       |  1 +
 meta/recipes-devtools/quilt/quilt.inc         |  1 +
 .../quilt/quilt/faildiff-order.patch          | 41 +++++++++++++
 .../libtirpc/libtirpc_1.3.3.bb                |  2 +-
 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb  |  4 +-
 .../spir/spirv-headers_1.3.216.0.bb           |  2 +-
 .../spir/spirv-tools_1.3.216.0.bb             |  2 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++----
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  | 52 ++++++++++++++++
 ...e-the-correct-print-format-v5.10.163.patch | 61 +++++++++++++++++++
 ...ules_2.13.7.bb => lttng-modules_2.13.8.bb} |  4 +-
 ...k-with-latomic-only-if-no-atomic-bui.patch | 46 ++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.26.bb | 13 ++--
 .../numactl/Fix-the-test-output-format.patch  |  3 +-
 .../recipes-support/numactl/numactl/run-ptest |  6 +-
 27 files changed, 368 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb} (87%)
 create mode 100644 meta/recipes-support/libusb/libusb1/0001-configure.ac-Link-with-latomic-only-if-no-atomic-bui.patch

-- 
2.25.1


