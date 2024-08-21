Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C96C5320E
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:43 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.18781.1724244636045216334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ac4PxLLT;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.45, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-270596dbf59so2116957fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244635; x=1724849435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9uUkbT/4l04auxYAtSG1y/wfOPVnJgRVm0wD2gfOhM=;
        b=ac4PxLLTAO026gUYPELBlXfG9478+glm8wyFxkDA4CzkvROFFdoVtWhoNv1on0eXbu
         kcxQQ0NCrCxKVmGYp+mH083digRI+9ZcEjW98gyPXs+ewzJTwZ8lIe74mKp+FPxUcHhw
         dCWAmKU52ksqzzpJRFX5fv+MBi61G3NnalAxOMF83VXMhgC5rPv139GOyVGX1C4Dfxtr
         nVzHXwIXjdeH7FcDeI+H6Y686VjKD8ZJJzFR68BQr4PHyqjtWxG21O791ybjYFeP7reu
         s0SARtWjGLAGbdQGTbU7UZSbHcqAPeciGdWtola/F10/jaDETVnhZhR78xtyRN/ooI/S
         gMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244635; x=1724849435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9uUkbT/4l04auxYAtSG1y/wfOPVnJgRVm0wD2gfOhM=;
        b=HfBuuBKfVg0lBTbBY/DRedifaTGY1RLyfNiCCkwnpNToKXA9ylJssjw2rjtXetzeoC
         syUPGcWmxh2oNZ2h/wal+okOw48zQRHm7d50usjGTDiwz+NdaNC8zqt2gEyXL4z/y/ub
         6yrNNniKMjl49QJiOjDZN+McF0tSNVTKzqDKgwv5ZO0422bvOOnpug5Zl37/Fy5jLyui
         YBKABlX5RJog3F87vy2PMdGbPentlD2OHNYcozcdTl5IVnWZ7oZQo41Q+2kBbJ0wTC0j
         gwZUgt0ffCz1MH/qLR9CD3mcEyBAzlOOqqgNY0he+ZkWJqoD8FUROTO+50xxXPTNbsyj
         hhsQ==
X-Gm-Message-State: AOJu0YxU+dhNhqKald09bEI0gSJqTFn8ka7j/bR2Gi3MPjyiUYw1dL5Y
	54+KKR4GPEOJSXdIliNZPAxOlD+MlZ7AF8CXn6GQKbkR2WoDTeKscDCDlegCxaTBmd6dxDMCvrg
	qmOE=
X-Google-Smtp-Source: AGHT+IGBgTWs2RBRmZ/GwG9lTIX/9eaj2AuVc4kd8L1GOcZ26Y+TwHkTNjNt5RO9J925vcXb+JAEyQ==
X-Received: by 2002:a05:6870:2011:b0:260:e6a6:396c with SMTP id 586e51a60fabf-2737ef547famr1843835fac.30.1724244634916;
        Wed, 21 Aug 2024 05:50:34 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/18] Patch review
Date: Wed, 21 Aug 2024 05:50:11 -0700
Message-Id: <cover.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203588

Please review this set of changes for scarthgap and have comments back by
end of day Friday, August 23

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7256

The following changes since commit bbb8db8fec7fbee56fcdbc665a758b911d73a767:

  u-boot.inc: Refactor do_* steps into functions that can be overridden (2024-08-15 06:02:17 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexis Lothoré (1):
  oeqa/utils/postactions: transfer whole archive over ssh instead of
    doing individual copies

Ashish Sharma (1):
  ruby: Backport fix for CVE-2024-27282

Daniel Semkowicz (1):
  os-release: Fix VERSION_CODENAME in case it is empty

Gauthier HADERER (1):
  populate_sdk_ext.bclass: make sure OECORE_NATIVE_SYSROOT is exported.

Jon Mason (2):
  oeqa/runtime/ssh: add retry logic and sleeps to allow for slower
    systems
  oeqa/runtime/ssh: check for all errors at the end

Jose Quaresma (1):
  go: upgrade 1.22.5 -> 1.22.6

Kai Kang (1):
  glibc: fix fortran header file conflict for arm

Martin Jansa (1):
  libgfortran.inc: fix nativesdk-libgfortran dependencies

Mingli Yu (1):
  llvm: Enable libllvm for native build

Richard Purdie (2):
  oeqa/runtime/ssh: In case of failure, show exit code and handle -15
    (SIGTERM)
  oeqa/selftest/reproducibile: Explicitly list virtual targets

Ross Burton (2):
  gstreamer1.0: disable flaky baseparser tests
  librsvg: don't try to run target code at build time

Siddharth Doshi (1):
  Tiff: Security fix for CVE-2024-7006

Trevor Gamblin (1):
  maintainers.inc: add self for unassigned python recipes

Ulrich Ölmann (1):
  initramfs-framework: fix typos

Weisser, Pascal.ext (1):
  qemuboot: Trigger write_qemuboot_conf task on changes of kernel image
    realpath

 meta/classes-recipe/populate_sdk_ext.bbclass  |  2 +-
 meta/classes-recipe/qemuboot.bbclass          |  3 +-
 meta/conf/distro/include/maintainers.inc      |  8 +--
 meta/lib/oeqa/runtime/cases/ssh.py            | 31 ++++++---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  3 +-
 meta/lib/oeqa/utils/postactions.py            | 19 +++---
 meta/recipes-core/glibc/glibc-package.inc     |  8 ++-
 .../initrdscripts/initramfs-framework/init    |  2 +-
 .../initrdscripts/initramfs-framework/rootfs  |  2 +-
 meta/recipes-core/os-release/os-release.bb    |  2 +-
 meta/recipes-devtools/gcc/libgfortran.inc     |  3 +-
 .../go/{go-1.22.5.inc => go-1.22.6.inc}       |  2 +-
 ...e_1.22.5.bb => go-binary-native_1.22.6.bb} |  6 +-
 ..._1.22.5.bb => go-cross-canadian_1.22.6.bb} |  0
 ...{go-cross_1.22.5.bb => go-cross_1.22.6.bb} |  0
 ...osssdk_1.22.5.bb => go-crosssdk_1.22.6.bb} |  0
 ...runtime_1.22.5.bb => go-runtime_1.22.6.bb} |  0
 .../go/{go_1.22.5.bb => go_1.22.6.bb}         |  0
 meta/recipes-devtools/llvm/llvm_18.1.6.bb     |  1 -
 .../ruby/ruby/CVE-2024-27282.patch            | 28 ++++++++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |  1 +
 .../librsvg/disable-rsvg-loader-test.patch    | 40 ++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.57.1.bb  |  1 +
 .../gstreamer/gstreamer1.0/run-ptest          |  7 +-
 .../libtiff/tiff/CVE-2024-7006.patch          | 65 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  1 +
 26 files changed, 198 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.5.inc => go-1.22.6.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.5.bb => go-binary-native_1.22.6.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.5.bb => go-cross-canadian_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.5.bb => go-cross_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.5.bb => go-crosssdk_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.5.bb => go-runtime_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.5.bb => go_1.22.6.bb} (100%)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch

-- 
2.34.1


