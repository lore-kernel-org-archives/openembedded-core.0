Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F7BC52D6D
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:31 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.30106.1722791367608221639
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Kt14bakM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7106e2d0ec1so1962931b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791367; x=1723396167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yqIx36rsYcGCgLFvHjFhQtuI/Ogi1deLKzSNSxvo+5I=;
        b=Kt14bakM/T5AjthFEykN8KI550WQjaK6XtJah/dVUzkOhjzBPIA0zruYoHHUCE+0r9
         FcDQ5GOeK6sMfAGyETyYC+65JXVpBWHnIhRkaSfVL9gyG7h9Tbf3FjStbRPhPgsxgnnB
         LmSOkhtnYRjibty2OXTcxrw9hpKx9tdk46OfnIbF8yu8ZJdAEW+GZ/9tmhq442hUREsY
         EJ426UDEebSCwrQ0OaX4F5xzlDdpr2rlB1/XPdgnVlzvHOIJrUoXwzIji4bexODFffqM
         zH73gBeePuSv2U9bE6nqYE7DlDEnRo4OCY1a669cwv8+Ep1pHMuCFsPmlFD7V1LnYOZf
         yNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791367; x=1723396167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqIx36rsYcGCgLFvHjFhQtuI/Ogi1deLKzSNSxvo+5I=;
        b=etqN5tHG0NUx9M7qVp00drOejTNCSYMWRbcV3uljF3m8GCnXJI/RbMRg6E/Yyi5HP9
         HF3E+qO279PPtbNALIRt0JHmSEaSRI5W+K7mx/9j6aY0iUyw9zqfAXZwQVzeSripPYD/
         z6a+j7ewvkQb/wdVWul9OukiZAuxJj8uFmxX7Y+Zp3G136TjJQb8otKCAWvN+b0hxTcM
         JTyk1fc6GB1DVZmgZ0bBJ6gm76RGPnuSSSq5YnMY3MdnsixsD2dvZAZ+x+1HAmt1ypWB
         m8lfUvrlhwPt2A14esp3kFRGGk/YjSOKgBhGrfDnLOTDe8tyjSzlSi2E7RefTjepj5mq
         VSMA==
X-Gm-Message-State: AOJu0Yxkd9wNeipv6VH30p+JM/S2tI9ZAOJmVfxPSdvdg/LBr2lOOwWR
	iPGUo5tMB6Fcfy59Ux0zM2l2D0gbEHM/rK1UzsZGIbRggArvvcZiEdiC5Etu+eiFjIvYU+9pmLg
	v5hdJ5Q==
X-Google-Smtp-Source: AGHT+IHCpkKRtema83AIRKKtOVIhbN5CtVBHRhENGxMleO+s4uHkdS+108HQ/6M4SVyMWraWUzcoMw==
X-Received: by 2002:a05:6a00:2e2a:b0:705:9ddb:db6b with SMTP id d2e1a72fcca58-7106cfccdbdmr9722431b3a.13.1722791366740;
        Sun, 04 Aug 2024 10:09:26 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/18] Patch review
Date: Sun,  4 Aug 2024 10:09:03 -0700
Message-Id: <cover.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202959

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, August 6

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7208

The following changes since commit 1c9d3c22718bf49ae85c2d06e0ee60ebdc2fd0c1:

  openssh: systemd notification was implemented upstream (2024-07-28 19:27:16 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Changqing Li (1):
  rt-tests: rt_bmark.py: fix TypeError

Christian Taedcke (1):
  iptables: fix memory corruption when parsing nft rules

Khem Raj (2):
  busybox: CVE-2023-42364 and CVE-2023-42365 fixes
  busybox: Add fix for CVE-2023-42366

Mark Hatle (5):
  package.py: Fix static debuginfo split
  package.py: Fix static library processing
  selftest-hardlink: Add additional test cases
  create-spdx-*: Support multilibs via SPDX_MULTILIB_SSTATE_ARCHS
  oeqa sdk cases: Skip SDK test cases when TCLIBC is newlib

Niko Mauno (1):
  libyaml: Fix warning regarding unpatched CVE

Patrick Wicki (1):
  gpgme: move gpgme-tool to own sub-package

Peter Marko (1):
  libstd-rs,rust-cross-canadian: set CVE_PRODUCT to rust

Ranjitsinh Rathod (1):
  rust: Add new varaible RUST_ENABLE_EXTRA_TOOLS

Richard Purdie (3):
  create-spdx-3.0/populate_sdk_base: Add SDK_CLASSES inherit mechanism
    to fix tarball SPDX manifests
  pseudo: Fix to work with glibc 2.40
  pseudo: Update to include open symlink handling bugfix

Wadim Egorov (1):
  watchdog: Set watchdog_module in default config

Yogita Urade (1):
  qemu: upgrade 8.2.2 -> 8.2.3

 .../selftest-hardlink/selftest-hardlink.bb    |  13 ++
 meta/classes-recipe/populate_sdk_base.bbclass |   7 +
 meta/classes-recipe/testimage.bbclass         |   2 -
 meta/classes/create-spdx-2.2.bbclass          |  14 +-
 meta/lib/oe/package.py                        |  57 ++++-
 meta/lib/oeqa/sdk/cases/assimp.py             |   4 +
 meta/lib/oeqa/sdk/cases/buildcpio.py          |   5 +
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   4 +
 meta/lib/oeqa/sdk/cases/buildgalculator.py    |   4 +
 meta/lib/oeqa/sdk/cases/buildlzip.py          |   5 +
 meta/lib/oeqa/sdk/cases/gcc.py                |   4 +
 meta/lib/oeqa/selftest/cases/package.py       |  26 +++
 ...01-awk-fix-precedence-of-relative-to.patch | 197 ++++++++++++++++++
 ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch |  37 ++++
 ...x-ternary-operator-and-precedence-of.patch |  96 +++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   3 +
 meta/recipes-core/meta/buildtools-tarball.bb  |   3 +
 .../pseudo/files/glibc238.patch               |  10 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 ...u-native_8.2.2.bb => qemu-native_8.2.3.bb} |   0
 ...e_8.2.2.bb => qemu-system-native_8.2.3.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   8 +-
 ...4-Handle-the-vsyscall-page-in-open_s.patch |  56 -----
 .../qemu/qemu/CVE-2024-3446-01.patch          |  73 -------
 .../qemu/qemu/CVE-2024-3446-02.patch          |  48 -----
 .../qemu/qemu/CVE-2024-3446-03.patch          |  47 -----
 .../qemu/qemu/CVE-2024-3446-04.patch          |  52 -----
 .../qemu/qemu/CVE-2024-3567.patch             |  48 -----
 .../qemu/{qemu_8.2.2.bb => qemu_8.2.3.bb}     |   0
 .../recipes-devtools/rust/libstd-rs_1.75.0.bb |   2 +
 .../rust/rust-cross-canadian.inc              |   1 +
 meta/recipes-devtools/rust/rust_1.75.0.bb     |   6 +-
 ...se-Add-missing-braces-around-ternary.patch |  37 ++++
 .../iptables/iptables_1.8.10.bb               |   1 +
 .../watchdog/watchdog-config/watchdog.default |   1 +
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |   2 +-
 meta/recipes-support/gpgme/gpgme_1.23.2.bb    |  16 +-
 meta/recipes-support/libyaml/libyaml_0.2.5.bb |   2 +
 38 files changed, 537 insertions(+), 356 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.2.bb => qemu-native_8.2.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.2.bb => qemu-system-native_8.2.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.2.bb => qemu_8.2.3.bb} (100%)
 create mode 100644 meta/recipes-extended/iptables/iptables/0005-nft-ruleparse-Add-missing-braces-around-ternary.patch

-- 
2.34.1


