Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043BDE64021
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:31 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.10465.1732226063768757785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YVG4On+O;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso1089304a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226063; x=1732830863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9Gcsrib5ji74XigOsMoBw4sfAU3PGOgCakaHW2KZJw=;
        b=YVG4On+OFqm1iZX4pxro9bE9uXZ5YsS403YE/17i8jf118wJ+5teRcD4Jmx0yQ5rLU
         mFWP8vZm28/ePU2eAdtRpOk29xzW4N3Od4pGmeYmu6TpbGvJ4Fj8OCGzivcMMrebx05e
         cQncPWF2X22XOMRSfLAclp4WHwabOkUysqqyGf3WRlDvnUfbBiRTsFukzJ3sJPcwIsZ5
         IbvH1v9NAX2eDg4xY17fOKa2193Bs6BbSdBnqg5vShmnh4UNl+26mFI6XVAh83xJMSRg
         P1c3yaEPRL2iYYqcvCUrmkpjuFE8mUiPKeg/5fUO2p5H59aRKIpkCyJiww7b5FVEOb0o
         euCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226063; x=1732830863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9Gcsrib5ji74XigOsMoBw4sfAU3PGOgCakaHW2KZJw=;
        b=rSKXQ+EhuA5cyaw3KzSPcdzSC5gitTS6sV0DiHC9sdBYb/ZPFlMh/2Z8PHUBLzgK8B
         PVKgji/GECNwUPu8AMuPL0Lesx1Kc+yVnEU0NckHcqdNpRzP0l1FdtZGMOxqX9rpV/Pv
         sj9XChIvhMnvq1soVTE8bJ+eNr8mGh+lejUYLsmsmcPZtYezeEEeWj2jO03iln/iuGQD
         8HDCZxSXFgdCFHy7mA7nvQtokrw5hIbJUu86tFZ0JJWtcQm64S6ZfXThzqHF8J591Wfv
         QiQ1bX9/tdxvWu6JdXMcRwxRFsrgbdmIAre6wCCPxJsxpWXbb3yIHe/x2zjHneD89w+0
         VOig==
X-Gm-Message-State: AOJu0YxVNw3rr+1vRBu8pvT0lkpQh19J8glhuMdMRm18uEy06K5hJ+o3
	E0f+cI2SIiZtkqGGC3EM7qXWHMQO4g8PjfRJn5PyOxngaShPObqBzOkePO2wiHbeRn5SDGDgNSc
	8
X-Gm-Gg: ASbGnctjZKQIZgf3XiwBaMezXm7+QJwbunEzIS1LRqDUBrxiLVI7HqN1GVSJ2bue61q
	mkAcbPq025e/9zeEUM4j2GRc2J/X9fYbdVrXMlIzy3t4jPKuyCkRAvvRlNW7Kc+dPj3Kl7RZTfh
	Q4J28VFX2cQQ1j8tUgfveNieXbDnUpuCyqlnPcF4OdVzx3dkDmnNoizsw8sPdiX5dKtRsjKVwAJ
	NbL5w91ltXAPrcK79Ad52nn8oNR+SinqsnvuRk=
X-Google-Smtp-Source: AGHT+IEYMpKTGJ5FZ+52GfV99UlZ8Rg/ZF7Zl3RWDto1/jYitLOFDXu/RVAlXQ2v2RmsMvFVV00Gcw==
X-Received: by 2002:a05:6a20:734e:b0:1db:dcc6:dd39 with SMTP id adf61e73a8af0-1e09e4a62f7mr648739637.26.1732226062478;
        Thu, 21 Nov 2024 13:54:22 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/27] Patch review
Date: Thu, 21 Nov 2024 13:53:50 -0800
Message-Id: <cover.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207555

Please review this set of changes for scarthgap and have comments back by
end of day Monday, November 25

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/497

The following changes since commit c9d5a6c480c377399a7dc998f3755e42072e19a6:

  libxml-parser-perl: fix do_fetch error (2024-11-13 06:15:28 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (2):
  package_rpm: use zstd's default compression level
  package_rpm: restrict rpm to 4 threads

Bin Lan (1):
  lttng-ust: backport patch to fix cmake-multiple-shared-libraries build
    error

Changqing Li (1):
  sysvinit: backport patch for fixing one issue of pidof

Chen Qi (1):
  toolchain-shar-extract.sh: exit when post-relocate-setup.sh fails

Clayton Casciato (1):
  uboot-sign: fix concat_dtb arguments

Deepthi Hemraj (1):
  binutils: stable 2.42 branch update

Guðni Már Gilbert (2):
  shared-mime-info: drop itstool-native from DEPENDS
  libpam: drop cracklib from DEPENDS

Hitendra Prajapati (2):
  libsoup: fix CVE-2024-52532
  ghostscript: upgrade 10.03.1 -> 10.04.0

Jagadeesh Krishnanjanappa (1):
  tune-cortexa32: set tune feature as armv8a

Jinfeng Wang (1):
  tzdata&tzcode-native: upgrade 2024a -> 2024b

Pavel Zhukov (1):
  package_rpm: Check if file exists before open()

Randy MacLeod (1):
  systemd: stable update 255.4 -> 255.13

Regis Dargent (1):
  udev-extraconf: fix network.sh script did not configure hotplugged
    interfaces

Richard Purdie (3):
  oeqa/runtime/ssh: Rework ssh timeout
  oeqa/runtime/ssh: Fix incorrect timeout fix
  qemurunner: Clean up serial_lock handling

Robert Yang (1):
  cml1.bbclass: do_diffconfig: Don't override .config with .config.orig

Ross Burton (3):
  strace: download release tarballs from GitHub
  tcl: skip io-13.6 test case
  groff: fix rare build race in hdtbl

Steve Sakoman (2):
  webkitgtk: fix erroneous use of unsuported DEBUG_LEVELFLAG variable
  llvm: reduce size of -dbg package

Vijay Anusuri (1):
  glib-2.0: Backport fix for CVE-2024-52533

Wang Mingyu (1):
  wireless-regdb: upgrade 2024.07.04 -> 2024.10.07

 meta/classes-global/package_rpm.bbclass       |  19 ++-
 meta/classes-recipe/cml1.bbclass              |   3 +-
 meta/classes-recipe/uboot-sign.bbclass        |   2 +-
 .../include/arm/armv8a/tune-cortexa32.inc     |   2 +-
 meta/files/toolchain-shar-extract.sh          |   4 +
 meta/lib/oeqa/runtime/cases/ssh.py            |   4 +-
 meta/lib/oeqa/utils/qemurunner.py             |  11 +-
 .../glib-2.0/glib-2.0/CVE-2024-52533.patch    |  49 ++++++
 .../glib-2.0/gdatetime-test-fail-0001.patch   |  72 ++++++++
 .../glib-2.0/gdatetime-test-fail-0002.patch   |  65 +++++++
 .../glib-2.0/gdatetime-test-fail-0003.patch   |  63 +++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   4 +
 ...255.4.bb => systemd-boot-native_255.13.bb} |   0
 ...d-boot_255.4.bb => systemd-boot_255.13.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...1-missing_type.h-add-comparison_fn_t.patch |   7 +-
 ...k-parse_printf_format-implementation.patch |  13 +-
 ...tall-dependency-links-at-install-tim.patch |   9 +-
 ...missing.h-check-for-missing-strndupa.patch |  65 ++++---
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  14 +-
 ...005-add-missing-FTW_-macros-for-musl.patch |   7 +-
 ...06-Use-uintmax_t-for-handling-rlim_t.patch |  11 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  17 +-
 ...patible-basename-for-non-glibc-syste.patch |   8 +-
 ...implment-systemd-sysv-install-for-OE.patch |   5 +-
 ...uffering-when-writing-to-oom_score_a.patch |   9 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  13 +-
 ...definition-of-prctl_mm_map-structure.patch |   7 +-
 ...-not-disable-buffer-in-writing-files.patch |  59 +++----
 .../0013-Handle-__cpu_mask-usage.patch        |   7 +-
 .../systemd/0014-Handle-missing-gshadow.patch |   9 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  13 +-
 ...ass-correct-parameters-to-getdents64.patch |   7 +-
 .../0017-Adjust-for-musl-headers.patch        |  17 +-
 ...trerror-is-assumed-to-be-GNU-specifi.patch |   9 +-
 ...util-Make-STRERROR-portable-for-musl.patch |   7 +-
 ...ake-malloc_trim-conditional-on-glibc.patch |   9 +-
 ...hared-Do-not-use-malloc_info-on-musl.patch |   7 +-
 ...22-avoid-missing-LOCK_EX-declaration.patch |  11 +-
 .../{systemd_255.4.bb => systemd_255.13.bb}   |   0
 ...rom-Mark-Hindley-which-avoids-cleari.patch |  31 ++++
 meta/recipes-core/sysvinit/sysvinit_3.04.bb   |   1 +
 .../udev/udev-extraconf/network.sh            |  32 ----
 .../binutils/binutils-2.42.inc                |   2 +-
 meta/recipes-devtools/llvm/llvm_18.1.6.bb     |   2 +
 meta/recipes-devtools/strace/strace_6.7.bb    |   4 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   2 +
 .../avoid-host-contamination.patch            |   6 +-
 ...ript_10.03.1.bb => ghostscript_10.04.0.bb} |   2 +-
 ...l-Fix-Savannah-66316-missing-grn-dep.patch |  38 +++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |   1 +
 meta/recipes-extended/pam/libpam_1.5.3.bb     |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 ...es-when-rpath-is-stripped-from-in-bu.patch | 161 ++++++++++++++++++
 .../0001-Makefile.am-update-rpath-link.patch  |  33 ----
 meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb |   2 +-
 ....07.04.bb => wireless-regdb_2024.10.07.bb} |   2 +-
 meta/recipes-sato/webkit/webkitgtk_2.44.3.bb  |   2 +-
 .../libsoup-3.4.4/CVE-2024-52532-0001.patch   |  42 +++++
 .../libsoup-3.4.4/CVE-2024-52532-0002.patch   |  36 ++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   5 +-
 .../shared-mime-info/shared-mime-info_2.4.bb  |   2 +-
 62 files changed, 749 insertions(+), 305 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch
 rename meta/recipes-core/systemd/{systemd-boot-native_255.4.bb => systemd-boot-native_255.13.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.4.bb => systemd-boot_255.13.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.4.bb => systemd_255.13.bb} (100%)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-Accepted-patch-from-Mark-Hindley-which-avoids-cleari.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.03.1.bb => ghostscript_10.04.0.bb} (97%)
 create mode 100644 meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} (94%)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0001.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0002.patch

-- 
2.34.1


