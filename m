Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A97E64A93
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:34 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.19578.1733233048870646228
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wXRPgzE/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so3814761a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233048; x=1733837848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFISD6tGcCKuSCwAklja1HO44AKoVgznDwn8YD6l0p8=;
        b=wXRPgzE/w111flC9lTH9C1hoERSaqmUn3lqeLUrhGne17UmEbAGSWdrSa+xX4LXMkM
         LpRTyYmCHRN8+gcrjuDwXDFkyQo9nJ63QNygiUkP7MrnAOensfbPtI0E/EX5kP01BZhN
         capV15xYJiCM6KJCOj2/awDyGV92uSou5nWk0ff3JYVPL7pKacHqQMFI/fVfO5tCfWv2
         6SSno3HroWAikRguHQ/491Ek7XC3WzdpdbLbRbtE213Xvtxj6kQKV5fY/xyp+v5Rrb6d
         K3Jd9cvKQ3BLXdDZFt6x0Ny+vV9temW1thuwzsac5LIwMp682hnGBc+KKn2egGWGb0Mz
         JEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233048; x=1733837848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFISD6tGcCKuSCwAklja1HO44AKoVgznDwn8YD6l0p8=;
        b=PNFCXKcIi+VMus6BssjRJxmEJCmCgo8VKULO9Hu25nD7I3H4CoVbm1kSzFMjt8REF0
         XSEImLzP4vq4QGMTZJ3Gv1ZgvtWEd+41gXRX6Mb3f/Iuu0FA2Gy7xtRSpoWKvDKDTjgH
         2diyUScsMAW+6uzi5LNAhMITjaCdtqgy51atcS0aDATGnayUPFeT0/UWIHHCPNODS2Cz
         02SmFuRHebHbxtFRIFxhxFAg7l952XuZ0C9nIKzwe9RUppCxd56ImNTUhaAMXoD8CTZO
         w7328i0X11uBVIrVRmjYnQ/e1Gu/TEIrXalWldtr8HnPJWd5EyfMINqcW3for2VLVMv+
         PBZg==
X-Gm-Message-State: AOJu0YzJk3jX+bblh9RnVWAXwZmkWmwaWA2CDyXxjacW3F9y4IL/tNp7
	qgJIC/V7Yy4c+H12Wa8GsSfaXM3kc1+CxRy94IDsD0HBt9mLIb3EeHEgpu5wHu+/gCpuywJwxKP
	s
X-Gm-Gg: ASbGncv8hggfMOMLbZTY1hv2lCdJCcyXtRRACTLIryHwnRd+77H6c+w9et/Aq2SOc7p
	V+96Y4NqLmQMjHLzv9EZe0+1CwVmnsZbijKhmN1Cb3ZVZcbcIoJivSxf+jRDPlv3IBAsDoVubDv
	4vh6ZjD0eLw3QSFNfzwGcHdcKQrtyt/tR1jsJ5/KhLqKUddLwAa+n4V5YBD8dQ/pXFzk5/TVEKk
	3EaOJLBAUgESE2gj0XjnaIvvJdctrLKiNnqMqI=
X-Google-Smtp-Source: AGHT+IGvQgz/fZ4rg4PMUTEGtZzCxDYE9XX562vivILmqUNkEfneHShVlRT1izFmGvaVajZGfmYp3Q==
X-Received: by 2002:a05:6a20:9185:b0:1e0:de01:4407 with SMTP id adf61e73a8af0-1e16541223emr3771660637.37.1733233048037;
        Tue, 03 Dec 2024 05:37:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/16] Patch review
Date: Tue,  3 Dec 2024 05:37:04 -0800
Message-Id: <cover.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208189

Please review this set of changes to scarthgap and have comments back by
end of day Thursday, December 5

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/560

The following changes since commit dac630ab5ee7aa6c5c7c294093adbd11b116c765:

  llvm: reduce size of -dbg package (2024-11-22 05:42:54 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.0.5

Changqing Li (2):
  acpica: fix CVE-2024-24856
  libsoup: fix CVE-2024-52530, CVE-2024-52531

Deepthi Hemraj (1):
  glibc: stable 2.39 branch updates

Florian Kreutzer (1):
  dropbear: backport fix for concurrent channel open/close

Gassner, Tobias.ext (1):
  rootfs: Ensure run-postinsts is not uninstalled for
    read-only-rootfs-delayed-postinsts

Hitendra Prajapati (1):
  libsndfile: fix CVE-2024-50612

Jiaying Song (1):
  python3-zipp: fix CVE-2024-5569

Jinfeng Wang (1):
  tzdata&tzcode-native: upgrade 2024a -> 2024b

Markus Volk (2):
  gcc: add a backport patch to fix an issue with tzdata 2024b
  ninja: fix build with python 3.13

Peter Marko (1):
  builder: set CVE_PRODUCT

Robert Yang (1):
  libgcrypt: Fix building error with '-O2' in sysroot path

Soumya Sambu (1):
  python3-requests: upgrade 2.32.1 -> 2.32.2

Trevor Gamblin (1):
  python3-urllib3: upgrade 2.2.1 -> 2.2.2

Yogita Urade (1):
  qemu: upgrade 8.2.3 -> 8.2.7

 meta/lib/oe/rootfs.py                         |    4 +
 meta/lib/oeqa/selftest/cases/overlayfs.py     |   41 +-
 ...e-channels-when-a-PID-hasn-t-started.patch |   45 +
 .../recipes-core/dropbear/dropbear_2022.83.bb |    1 +
 .../glib-2.0/gdatetime-test-fail-0001.patch   |   72 +
 .../glib-2.0/gdatetime-test-fail-0002.patch   |   65 +
 .../glib-2.0/gdatetime-test-fail-0003.patch   |   63 +
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |    3 +
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 meta/recipes-devtools/gcc/gcc-13.3.inc        |    1 +
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch |  549 ++++++++
 ...4efb41c039789b81f0dc0d67c1ed0faea17c.patch |   62 +
 meta/recipes-devtools/ninja/ninja_1.11.1.bb   |    5 +-
 ...s_2.31.0.bb => python3-requests_2.32.0.bb} |    2 +-
 ...lib3_2.2.1.bb => python3-urllib3_2.2.2.bb} |    2 +-
 .../python/python3-zipp/CVE-2024-5569.patch   |  138 ++
 .../python/python3-zipp_3.17.0.bb             |    1 +
 ...u-native_8.2.3.bb => qemu-native_8.2.7.bb} |    0
 ...e_8.2.3.bb => qemu-system-native_8.2.7.bb} |    0
 meta/recipes-devtools/qemu/qemu.inc           |   14 +-
 ...kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch |   75 --
 ...kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch |   73 -
 ...cv-kvm-change-timer-regs-size-to-u64.patch |  107 --
 .../qemu/qemu/CVE-2024-4467-0001.patch        |  112 --
 .../qemu/qemu/CVE-2024-4467-0002.patch        |   55 -
 .../qemu/qemu/CVE-2024-4467-0003.patch        |   57 -
 .../qemu/qemu/CVE-2024-4467-0004.patch        | 1187 -----------------
 .../qemu/qemu/CVE-2024-4467-0005.patch        |  239 ----
 .../qemu/qemu/CVE-2024-7409-0001.patch        |  167 ---
 .../qemu/qemu/CVE-2024-7409-0002.patch        |  175 ---
 .../qemu/qemu/CVE-2024-7409-0003.patch        |  126 --
 .../qemu/qemu/CVE-2024-7409-0004.patch        |  164 ---
 .../qemu/{qemu_8.2.3.bb => qemu_8.2.7.bb}     |    0
 .../acpica/acpica_20240322.bb                 |    3 +-
 .../acpica/files/CVE-2024-24856.patch         |   31 +
 meta/recipes-extended/timezone/timezone.inc   |    6 +-
 meta/recipes-graphics/builder/builder_0.1.bb  |    3 +-
 .../libsndfile1/CVE-2024-50612.patch          |  412 ++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |    1 +
 ...ilding-error-with-O2-in-sysroot-path.patch |   64 +
 ...ilding-error-with-O2-in-sysroot-path.patch |   39 -
 .../libgcrypt/libgcrypt_1.10.3.bb             |    2 +-
 .../libsoup-3.4.4/CVE-2024-52530.patch        |  150 +++
 .../libsoup-3.4.4/CVE-2024-52531-1.patch      |  116 ++
 .../libsoup-3.4.4/CVE-2024-52531-2.patch      |   40 +
 .../libsoup-3.4.4/CVE-2024-52531-3.patch      |  136 ++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |    4 +
 scripts/install-buildtools                    |    4 +-
 48 files changed, 2016 insertions(+), 2602 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/0007-Don-t-close-channels-when-a-PID-hasn-t-started.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/gdatetime-test-fail-0003.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
 create mode 100644 meta/recipes-devtools/ninja/ninja/885b4efb41c039789b81f0dc0d67c1ed0faea17c.patch
 rename meta/recipes-devtools/python/{python3-requests_2.31.0.bb => python3-requests_2.32.0.bb} (84%)
 rename meta/recipes-devtools/python/{python3-urllib3_2.2.1.bb => python3-urllib3_2.2.2.bb} (86%)
 create mode 100644 meta/recipes-devtools/python/python3-zipp/CVE-2024-5569.patch
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.3.bb => qemu-native_8.2.7.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.3.bb => qemu-system-native_8.2.7.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-riscv-kvm-change-KVM_REG_RISCV_FP_F-to-u32.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-target-riscv-kvm-change-KVM_REG_RISCV_FP_D-to-u64.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-target-riscv-kvm-change-timer-regs-size-to-u64.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0001.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0002.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0003.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0004.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-4467-0005.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.3.bb => qemu_8.2.7.bb} (100%)
 create mode 100644 meta/recipes-extended/acpica/files/CVE-2024-24856.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 delete mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52531-3.patch

-- 
2.34.1


