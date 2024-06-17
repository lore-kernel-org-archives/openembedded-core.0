Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A87C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:14 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.55006.1718625905900640554
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1YGVf1TF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7043102dcc1so3809792b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625905; x=1719230705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=exYn4vBncr8sQIeB1ugVPhBoeh4QiQbMwhaWv5FeTLc=;
        b=1YGVf1TFBIOJwrYaJLorIdTvSGHGSR8mMdF2BYm6+jQWrNVM/tp85D54BWm33eQFY4
         cgsB/aMVOfeUKinmknLBVLtonJ+he7fuQ11tsuuy8q9GoH7SmTzr5OqNh5ZJSm5P2b4m
         3WNx7Ahug6jgL3Yx7j1DvAuG5omzrdo0eDbpU2Kmy/WTgfhziwAFHqRTi9GHTp2w1Hro
         VchoN5PutdQet0UHE9yxFU/LHFwtQLxMLtDPRSu39xx/DtAUpQ8CXOzpw4+Z3bFzV34B
         nlQ0pf9B1ewRSuIUqp7BI3leEj3Uqkd5ZHm5oiNaq/f3PM6nZZ9pbE+KvGy/bo1/S+tf
         1FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625905; x=1719230705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exYn4vBncr8sQIeB1ugVPhBoeh4QiQbMwhaWv5FeTLc=;
        b=eJaG/CqlxxJlV8jy41EVU94wNFDo9iJBfY0GfrRI6eXTTdGRBX2/MPvps3tUBBCM0A
         KDSfo+c9fEw2CQomP2GcUrV1UQt/CmqGqZjvuq/W0TZHb/RKhNZ5w7Zl4ZhApSCWUvMX
         nE705h5IqCQLK/YcUyq5d856ixYucMnT0nLTjTdIRrGBt8yqBoIO40sz0mJ+8aS0gDOl
         WOQUSgfydzMKpACdWpcO5BHV2lQjL+CKgNw0rzoByEDbWbdZdHQTnIwmhquFn//cMKuJ
         qr2HP1kUMnlYHhO2RLBg4Q8Z2WQrel88NDKfrnKOaAJXgSUKp63LGFpGxhPu8cph+yIz
         ltdg==
X-Gm-Message-State: AOJu0YxcsbupXVrpYSy4SGGPw/u7+zBxrBWbdwkiwjvM42ObI272Ebtr
	waB95nXce+IedEL1bFHlSLfpUcr73btBBnDvZXUOSsnf1ut515uiprCH/JuA4YS2aP6tvQcLCK2
	mXB0=
X-Google-Smtp-Source: AGHT+IFQO8s0CKsgO+AkFRSxT7YPItEM+Hl7F2v1nCG2/r5Qj1KmGbbLVZ9OLx0YED3Bu0pn6AQc5g==
X-Received: by 2002:aa7:8610:0:b0:705:baac:3244 with SMTP id d2e1a72fcca58-705d7151e6fmr9252995b3a.19.1718625904965;
        Mon, 17 Jun 2024 05:05:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/22] Patch review
Date: Mon, 17 Jun 2024 05:04:38 -0700
Message-Id: <cover.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200811

Please review this set of changes for scarthgap and have comments back by
end of day Wednesday, June 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7047

The following changes since commit 50b9126cd8668d8c039e9bd61eaba458f7a22014:

  cracklib: Modify patch to compile with GCC 14 (2024-06-12 08:09:18 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Changqing Li (1):
  expect-native: fix build with gcc-14

Khem Raj (7):
  kea: Remove -fvisibility-inlines-hidden from C++ flags
  consolekit: Disable incompatible-pointer-types warning as error
  gtk4: Disable int-conversion warning as error
  ltp: Fix build with GCC-14
  iproute2: Fix build with GCC-14
  zip: Fix build with gcc-14
  kexec-tools: Fix build with GCC-14 on musl

Martin Jansa (6):
  expect: ignore various issues now fatal with gcc-14
  libunwind: ignore various issues now fatal with gcc-14
  p11-kit: ignore various issues fatal with gcc-14 (for 32bit MACHINEs)
  lrzsz connman-gnome libfm: ignore various issues fatal with gcc-14
  cdrtools-native: fix build with gcc-14
  db: ignore implicit-int and implicit-function-declaration issues fatal
    with gcc-14

Michael Halstead (1):
  yocto-uninative: Update to 4.5 for gcc 14

Richard Purdie (2):
  oeqa/sdk/assimp: Upgrade and fix for gcc 14
  gcc-runtime: libgomp fix for gcc 14 warnings with mandb selftest

Ross Burton (2):
  oeqa/sdkext/devtool: replace use of librdfa
  gawk: fix readline detection

Siddharth Doshi (1):
  cups: Upgrade 2.4.7 -> 2.4.9

Wang Mingyu (1):
  appstream: upgrade 1.0.2 -> 1.0.3

Zoltan Boszormenyi (1):
  cdrtools-native: Fix build with GCC 14

 meta/conf/distro/include/yocto-uninative.inc  |  8 +--
 meta/lib/oeqa/sdk/cases/assimp.py             |  8 +--
 meta/lib/oeqa/sdkext/cases/devtool.py         |  7 ++-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  6 +++
 .../connman/connman-gnome_0.7.bb              |  4 ++
 .../iproute2/iproute2_6.7.0.bb                |  2 +
 meta/recipes-connectivity/kea/kea_2.4.1.bb    |  1 +
 .../cdrtools/cdrtools-native_3.01.bb          | 12 ++++-
 .../cdrtools/cdrtools/gcc14-fix.patch         | 13 +++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |  7 +++
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  2 +-
 .../cups/{cups_2.4.7.bb => cups_2.4.9.bb}     |  2 +-
 ...001-m4-readline-add-missing-includes.patch | 38 +++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  1 +
 ...-Use-time_t-instead-of-long-for-type.patch | 54 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20240129.bb     |  1 +
 ...e-dirent.h-for-closedir-opendir-APIs.patch | 45 ++++++++++++++++
 ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch | 35 ------------
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +-
 meta/recipes-gnome/gtk+/gtk4_4.14.1.bb        |  4 ++
 ...linux-setup.c-Use-POSIX-basename-API.patch | 54 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.28.bb               |  1 +
 ...{appstream_1.0.2.bb => appstream_1.0.3.bb} |  2 +-
 .../consolekit/consolekit_0.4.6.bb            |  3 ++
 meta/recipes-support/db/db_5.3.28.bb          |  4 ++
 meta/recipes-support/libfm/libfm_1.3.2.bb     |  4 ++
 .../libunwind/libunwind_1.6.2.bb              |  8 +++
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb | 10 ++++
 28 files changed, 285 insertions(+), 53 deletions(-)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/gcc14-fix.patch
 rename meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.9.bb} (51%)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
 delete mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
 rename meta/recipes-support/appstream/{appstream_1.0.2.bb => appstream_1.0.3.bb} (93%)

-- 
2.34.1


