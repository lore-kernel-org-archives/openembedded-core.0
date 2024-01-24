Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA3DC47422
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:28 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.23127.1706104884575063131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZltNggdz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5ca1b4809b5so2560159a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104883; x=1706709683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UAzYOeSinEP1Pn4ESrGPktcw6L8rMPrGmK4owzet2p4=;
        b=ZltNggdz9lkXvfO+6j/YQ4zkrgDn9kw86A9GemTqzBjUzGjTbWKdvWncy8E9qWwTP0
         M9cEKpCV/b/2/hTodwnOba7Kr8lvO7o3wm+uxXaPwLIfqn+ePYePfoNdMAKUuW+ZU/gP
         KCtMByhD/Dbqx7ygZCMY5s9d4v8mLF5dfBP9K2xPihyuLP+69of8fkI1QDFl3+H1v/v+
         434pyfL0y8k8cYy57C1mlhFsyOZrmPQ5wgMcVWIMaDTqJ0upyHxNp26uMCBX9QNbbvDH
         iCTlZIaguGwhAkDVlV4fu1snxTKvI8354qhxBUxAQuxSkfP64KIchDJ7RbjGF+J7m1bc
         6aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104883; x=1706709683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAzYOeSinEP1Pn4ESrGPktcw6L8rMPrGmK4owzet2p4=;
        b=igUGGeLaR1eIw+6XimH2KMbb5qosWbveRje70l+mBUZeacqV7+5VjfiFK8AyqLOQOl
         2QSWcnjl2y9H3dA4a3/63RSnm89fmfJjmCTK9NSBT8iI+ddTHGSC65afDRoUgje48Emu
         i6GGZHe/Ukj8sPhO5K0C9YSH2x3ckeRK4k/++CANQqSrF1JhuyA7Bdj9cjDHxss/b89t
         zN+3K7OGpsWDmwem/QHJ7CN94SpMVGH7Ohi1xFkYWud9Ur5Jh6CN1tWMHcBZo5cJAH2k
         Aze6t3cf31cslpG67eIRIlLwuma/uIVRjEJ4axk3UVZmsPqJ9Bef1RERQux+8iFk7Vn1
         mY7Q==
X-Gm-Message-State: AOJu0YySm0Qfi/P848Z5R52iXy1mGZWb1BPlSCNAIGbGTGFMPfCKH18J
	Ix8x0kIFCHup+NxECCYLp5VDTEIkpNfrG+AemRYVAztGgN6DEV0lUN9agGapGIbk9wwmiX0Ny6E
	Tp2A=
X-Google-Smtp-Source: AGHT+IEX/E6RFIAYTcOhoJP1PL/n5bzangynM1PPjrYPXfbb4BYpka/r3ECvBj4mXSSneGnLIxvBHg==
X-Received: by 2002:a05:6a20:7fa9:b0:19a:3b4a:22c8 with SMTP id d41-20020a056a207fa900b0019a3b4a22c8mr754659pzj.14.1706104882869;
        Wed, 24 Jan 2024 06:01:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/12] Patch review
Date: Wed, 24 Jan 2024 04:01:03 -1000
Message-Id: <cover.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194276

Please review this set of changes for nanbield and have comments back by
end of day Friday, January 26

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6481

The following changes since commit ff0dc585479136e3d031da08ef15e8e5c6e92c8d:

  pseudo: Update to pull in syncfs probe fix (2024-01-10 04:20:39 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Anuj Mittal (2):
  base-passwd: upgrade 3.6.2 -> 3.6.3
  glib-2.0: upgrade 2.78.1 -> 2.78.3

Chen Qi (1):
  sudo: upgrade from 1.9.15p2 to 1.9.15p5

Jeremy A. Puhlman (1):
  create-spdx-2.2: combine spdx can try to write before dir creation

Joshua Watt (1):
  rpcbind: Specify state directory under /run

Lee Chee Yang (2):
  curl: Fix CVE-2023-46219
  qemu: 8.1.2 -> 8.1.4

Peter Kjellerstedt (1):
  devtool: modify: Handle recipes with a menuconfig task correctly

Richard Purdie (1):
  sstate: Fix dir ownership issues in SSTATE_DIR

Robert Yang (1):
  nfs-utils: Upgrade 2.6.3 -> 2.6.4

Wang Mingyu (1):
  xwayland: upgrade 23.2.2 -> 23.2.3

Xiangyu Chen (1):
  sudo: upgrade 1.9.14p3 -> 1.9.15p2

 meta/classes-global/sstate.bbclass            |   9 +-
 meta/classes/create-spdx-2.2.bbclass          |   2 +-
 ...event-and-libsqlite3-checked-when-nf.patch |  80 -----------
 ...nclude-unistd.h-to-compile-with-musl.patch |  34 +++++
 ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |   8 +-
 ...e-passwd_3.6.2.bb => base-passwd_3.6.3.bb} |   2 +-
 ...t-write-bindir-into-pkg-config-files.patch |   4 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |   3 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |   6 +-
 ...ng-about-deprecated-paths-in-schemas.patch |   4 +-
 ...-correctly-when-building-with-mingw3.patch |  18 +--
 ...ces.c-comment-out-a-build-host-only-.patch |   6 +-
 ...on-Run-atomics-test-on-clang-as-well.patch |   6 +-
 ...ot-enable-pidfd-features-on-native-g.patch |   8 +-
 ...dcode-python-path-into-various-tools.patch |   6 +-
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   2 +-
 ...{glib-2.0_2.78.1.bb => glib-2.0_2.78.3.bb} |   2 +-
 ...u-native_8.1.2.bb => qemu-native_8.1.4.bb} |   0
 ...e_8.1.2.bb => qemu-system-native_8.1.4.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   2 +-
 .../qemu/{qemu_8.1.2.bb => qemu_8.1.4.bb}     |   0
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |   2 +-
 .../{sudo_1.9.14p3.bb => sudo_1.9.15p5.bb}    |   2 +-
 ...{xwayland_23.2.2.bb => xwayland_23.2.3.bb} |   2 +-
 .../curl/curl/CVE-2023-46219.patch            | 131 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.4.0.bb       |   1 +
 scripts/lib/devtool/standard.py               |   2 +-
 27 files changed, 215 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (94%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.2.bb => base-passwd_3.6.3.bb} (98%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.1.bb => glib-2.0_2.78.3.bb} (96%)
 rename meta/recipes-devtools/qemu/{qemu-native_8.1.2.bb => qemu-native_8.1.4.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.1.2.bb => qemu-system-native_8.1.4.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.1.4.bb} (100%)
 rename meta/recipes-extended/sudo/{sudo_1.9.14p3.bb => sudo_1.9.15p5.bb} (96%)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.2.bb => xwayland_23.2.3.bb} (95%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46219.patch

-- 
2.34.1


