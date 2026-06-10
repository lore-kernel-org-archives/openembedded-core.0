Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21338CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:25:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17067.1781087136625031760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J3SWVF/W;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4600ddc4017so4559323f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781087135; x=1781691935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jjkU1FFCZW8Jfk3F3Nbivd9S5WS4TACMT6UoqbC4h84=;
        b=J3SWVF/W8THlxv/7Xv8s/KBxEU2mX9mG2ltLHf0RVVYOJVtkT2a12GqpuPTCOGDIj5
         SLWh/hSIAA+4Dx3pFUjLCzB8coaVkr0hiq3RfKuAAEHyTK+AzIp42Ocm0s4hlNJcJq71
         obdp6S6O1fqtyRVkhd4bD02Z5JC/BcutXkN5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781087135; x=1781691935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjkU1FFCZW8Jfk3F3Nbivd9S5WS4TACMT6UoqbC4h84=;
        b=IygWywFzcMUQxliXAtsXTWOZB5oBHn5ch+S1dr3tKnEEq8GLil2KCA0N4mQhxJumyz
         9kSNK8cZ+D1V0K2LbEIRaWcEK0OBln9/eAopd7KmZH17KTeMKbOFIb8OR+e0MeC9F0fV
         DarLkEAjlE1IbRrCcn+Un06+KF0gleS88KacBKup00VB7YJEFlBAUSd5ZWM8nWrmkscF
         aqsTgXRLnyw+orBWTo81SvG2aIx4F1QgzuXS8bFtOCDwuo9c1rixTy2ZgzwLrQxXXgx/
         5pnrEXlWSNtSC8nRFUp77csadVtfgTlPD77owHkwcmXvhN5KjQ9UZsSeNtwd0yFRwLBl
         xK0A==
X-Gm-Message-State: AOJu0YyD3xMRaHjh6ZJEiVzzMEHDSguiC55j4pzGMruaSK6/hMtHjmCJ
	YDKa9MG6ef/1wtzZYHQr1hmvFkaVXTqyuNsMII5W9Q0Z9lWJaaERmpb90306L0opU+JFJ7o6DCq
	gIOEt
X-Gm-Gg: Acq92OExDr/UM8vQU7pfUnBfdC8RjPaG2i4Qda3XtT6HB9g179IQhYz896ogr9Q1qpm
	leEjP4mYDBSQQ+EIoOeKV75lDR4x3cy/J3qsSfFbvr6bX+PwjL3JClGGm3B6+s2/2H6ziTlUyvW
	atGL74Rtjlwsk8Y6O4rSdurZx1mFfXGIWPocC/fS65renF9EKjITadv3aNeqOKF5hkV/9iVAHpg
	LRKf+PlVDVtHynRentQ2lraIt4ZkGEdQI+ewsbPqtYN6XgJlBboeQeuY6bjRlGCRvvqlSWDDT/u
	mGaAAQ0ijut89/tfQdvo6SDHOU7e3Szi12u5281XE9Yfd9zAyfTB8zbBIzE0OUUIExfP1j9Ie7j
	EQT+vlDmaKAl7D9bIs2wVrV12YuBD2fTAyh6ZtBWQO4hnmafFCIx9Axy2qsEwrpMfJH6Id/3P//
	58G2TsbAGbZAs9d+4qeUqXsEuUePifZfl10qAFMwRnSWC/koSRx7TzeZA/oCpG2f/2eAU6imgM/
	70z8qId4K8oQya5WWo15hbdJNiIK5kSHN250dk=
X-Received: by 2002:a05:600d:8444:20b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-490c6c20071mr213186715e9.3.1781087134854;
        Wed, 10 Jun 2026 03:25:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm38400455e9.0.2026.06.10.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:25:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/25] Pull request (cover letter only)
Date: Wed, 10 Jun 2026 12:25:31 +0200
Message-ID: <cover.1781086994.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238349

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1780698373.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3933

The following changes since commit ece80784b493c8b7493478fa2ba0dc1d6d80aa79:

  build-appliance-image: Update to scarthgap head revisions (2026-05-15 13:25:33 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to e2864ea1ac022e43af92badc701fa1e2a9571f46:

  pseudo: Upgrade 1.9.6 -> 1.9.7 (2026-06-05 11:02:52 +0200)

----------------------------------------------------------------

Ankur Tyagi (1):
  tzdata/tzcode-native: upgrade 2026a -> 2026b

Benjamin Robin (Schneider Electric) (1):
  lz4: Remove a reference to the rejected CVE-2025-62813

Changqing Li (1):
  go.bbclass: change GOTMPDIR to improve reproducibility

Guðni Már Gilbert (1):
  gnupg: upgrade 2.4.8 -> 2.4.9

Hitendra Prajapati (3):
  libssh2: fix for CVE-2026-7598
  libexif: fix for CVE-2026-32775
  libexif: fix for CVE-2026-40385, CVE-2026-40386

Hugo SIMELIERE (Schneider Electric) (1):
  libarchive: Fix CVE-2026-4424

Martin Jansa (1):
  systemd: update musl specific patch to apply

Mathieu Dubois-Briand (1):
  oeqa: runtime: go: Increase test_go_compile/test_go_module timeout

Peter Bergin (1):
  go.bbclass: disable workspaces

Peter Marko (1):
  cargo: set CVE_PRODUCT

Richard Purdie (4):
  pseudo: Upgrade to 1.9.4
  pseudo: Upgrade to 1.9.5
  pseudo: Update 1.9.5 -> 1.9.6
  pseudo: Upgrade 1.9.6 -> 1.9.7

Ross Burton (3):
  python3-requests: backport fix for CVE-2026-25645
  perl: link to the system zlib instead of a vendored copy
  classes/base: prefer gnu-prefixed HOSTTOOLS

Theo Gaige (Schneider Electric) (3):
  openssh: patch CVE-2026-35385
  openssh: patch CVE-2026-35387
  openssh: patch CVE-2026-35388

Trevor Woerner (1):
  wic: filemap: use separate fd for SEEK_HOLE probes

Yoann Congal (2):
  scripts/install-buildtools: Update to 5.0.18
  linux-yocto/6.6: update CVE exclusions (6.6.127)

 meta/classes-global/base.bbclass              |    6 +-
 meta/classes-recipe/go.bbclass                |    3 +-
 meta/lib/oeqa/runtime/cases/go.py             |    4 +-
 .../openssh/openssh/CVE-2026-35385.patch      |   47 +
 .../openssh/openssh/CVE-2026-35387.patch      |  205 ++
 .../openssh/openssh/CVE-2026-35388.patch      |   47 +
 .../openssh/openssh_9.6p1.bb                  |    3 +
 ...missing.h-check-for-missing-strndupa.patch |    4 +-
 meta/recipes-devtools/perl/perl_5.38.4.bb     |    5 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    4 +-
 .../python3-requests/CVE-2026-25645.patch     |   46 +
 .../python/python3-requests_2.32.4.bb         |    7 +-
 meta/recipes-devtools/rust/cargo_1.75.0.bb    |    2 +
 .../libarchive/CVE-2026-4424-1.patch          |   61 +
 .../libarchive/CVE-2026-4424-2.patch          |   28 +
 .../libarchive/libarchive_3.7.9.bb            |    2 +
 meta/recipes-extended/timezone/timezone.inc   |    6 +-
 .../linux/cve-exclusion_6.6.inc               | 2462 +++++++++++++++--
 ...erride-init-is-not-needed-with-gcc-9.patch |    7 +-
 ...-a-custom-value-for-the-location-of-.patch |    5 +-
 ...use-pkgconfig-instead-of-npth-config.patch |    3 +-
 ...h-fix-find-version-for-beta-checking.patch |    3 +-
 .../gnupg/gnupg/CVE-2025-68973.patch          |  108 -
 .../gnupg/gnupg/CVE-2026-24882-0001.patch     |    7 +-
 .../gnupg/gnupg/CVE-2026-24882-0002.patch     |    7 +-
 .../gnupg/gnupg/relocate.patch                |   19 +-
 .../gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb}  |    3 +-
 .../libexif/libexif/CVE-2026-32775.patch      |   86 +
 .../libexif/libexif/CVE-2026-40385.patch      |   35 +
 .../libexif/libexif/CVE-2026-40386.patch      |   46 +
 .../recipes-support/libexif/libexif_0.6.24.bb |    3 +
 .../libssh2/libssh2/CVE-2026-7598.patch       |   60 +
 .../recipes-support/libssh2/libssh2_1.11.1.bb |    1 +
 ...13.patch => fix-null-error-handling.patch} |    1 -
 meta/recipes-support/lz4/lz4_1.9.4.bb         |    4 +-
 scripts/install-buildtools                    |    4 +-
 scripts/lib/wic/filemap.py                    |   13 +-
 37 files changed, 2938 insertions(+), 419 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35385.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2026-25645.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch
 delete mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb} (96%)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-32775.patch
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-40385.patch
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2026-40386.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-7598.patch
 rename meta/recipes-support/lz4/files/{CVE-2025-62813.patch => fix-null-error-handling.patch} (99%)


