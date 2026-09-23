Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B337CC98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:23 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2909.1790154678283902106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qFlFQND0;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so3110655e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154676; x=1790759476; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLJH0J4ffyw1cadcBDdzu7NSvCN/nrEDdQREskxJMcY=;
        b=qFlFQND07P9kmCJRQkt5R0kmv4qI5iBPJeyascw0HRfzkFyT7eE5M7InMw8op+sZMm
         nmD3q2TNIAfIbFjs1LUAeIH2WE51/udpXVBqxVRbZfF67vgAR4FyLbKzBRV8vOiR0KDR
         V9uo5n8XvenpUvXNcIhGt/FCBjOyZC+rGblnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154676; x=1790759476;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLJH0J4ffyw1cadcBDdzu7NSvCN/nrEDdQREskxJMcY=;
        b=WHNoLBVpIiCTT5EU42UmIu530z3UlYLYyISOqAtjyDbF9W9qiFGOh47qOMg78/xKgA
         RYtMGn7tSSFIJ7QA29b/lZgeO10iuNnUDZt3qmenxxSv10Dp4LowD9RffZpHFb4PPGA4
         wbr090TOrUrct3y7BSRo2g5mN3xBFa3nSPtVT+9MH7C6YgBeeHop0G88pa4sYAFCiQi8
         c2xmKQFe+OxyPXLVH0UJnhjCQKHModGJiLjRNTocXvoNvkS8YJe815G58cdMMn5zN84W
         UOB8+F/W7+XYGlmS/Wou59g40NyjY2eb8PQl627p9ARoKr+CBvC/JacBM2biNjYSzNv8
         9nLg==
X-Gm-Message-State: AFuF++nj9mUvzgQJeTyeHi9KMpF1OgzbqwntAztwPfgAsKoD2bgzepaF
	GpMGo4ZJdvVqt/Rw5kgnR4uIHC6J3213t3RDPWxjGixJk/MLm53apUKQKMmsOyOHmoe4irYE5QM
	Qi6VLByk=
X-Gm-Gg: AYBFou17uvHGciAYd35OAmO2LtGLwSYE60zi9dlaI2vNkIYEoTeBRt8qr8UQ5jmSiFt
	9wwQywcjspTrQO11RbgY9d2/bapXpKBgN0AUEWRDxIlZluY9vRhZqUiqpeasE6bhYZtbEmBSgX7
	L8Ny+5m9D0OvpRPRKbHmd8NYj+OM2FfDBdV50W0fy+ca/f+DiHSBlu7/agSGrVtc6uuOwQtcOuj
	p3HUd36gX+IpoGBfcZTFgaq5w+ll/ictCldH1+y3eTSrnbiRcyg1vTyiBor9+yo4bfWNUyUeXiw
	Qe9EqmA2o0bphAKXO3QW9G5WRtI6Q04rnL47397by5BjxvV8CRPLpDuPFFGxPP3nM4yW6nIcszu
	p/Ia659ZHCESF/28nBEbACYcoJzOqCcFBMg/4UPPAxrBZ0H/JPXhNOB8sqHt9QEJaYA5nxpx8vJ
	7Ra/NZ81BcQ9Y39rDXZEC2sDR623wlAz8sZzKzDsYxxbZqv5R1MQOcUVddHLxccRyyjBJqUkAjB
	JsvorAile01/XJqu/t246CLv6l5cJk14O8tNJbVwYnlRdZFEQLxwRrtv/oBrjLSlzlUPsVVMoKK
	ZgcRojM=
X-Received: by 2002:a05:600c:621a:b0:49f:d69a:1a04 with SMTP id 5b1f17b1804b1-49fde4a12d1mr31383395e9.16.1790154676333;
        Wed, 23 Sep 2026 02:11:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/48] Patch review
Date: Wed, 23 Sep 2026 11:10:02 +0200
Message-ID: <cover.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246462

Hello,

Some notable changes in this series:
* ptest-runner upgrade to try to decrease ptest AB-INT failures
* pseudo upgrade to maximize host distro compatibility
* GCC stable upgrade to 13.5

Please review this set of changes for scarthgap and have comments back by
end of day Friday, September 25.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4792
oe-selftest-fedora failed with 16206 – [scarthgap] AB-INT: runtime_test.SystemTap.test_crosstap_* failures
retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4720

The following changes since commit 04f18f976b3809e195433b6b31a6121014bdc37c:

  u-boot, u-boot-tools: Fix CVE-2026-46728 (2026-09-17 16:32:11 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 70778df2c2882f1abbdd4dd2f8d229ade720d8a4:

  time64: enable 64-bit time/file-offset flags for 32-bit nativesdk (2026-09-23 01:10:36 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  gnutls: fix CVE-2026-33845

Daniel Turull (1):
  improve_kernel_cve_report: validate that cve details field exists

Darsh Kelaiya (1):
  python3-git: fix CVE-2026-42215

Devansh Patel (3):
  python3-mako: correct CVE_PRODUCT mapping
  curl: set CVE_STATUS for CVE-2026-8458
  vim: Fix CVE-2026-52858 regression

Hemanth Kumar M D (1):
  gcc: Upgrade to GCC 13.5

Hetvi Thakar (4):
  python3-pip: set CVE_STATUS for CVE-2018-20225
  python3-ply: set status for CVE-2025-56005
  python3-pip: Fix CVE-2026-13346
  wget: Fix CVE-2026-58470

Hiago De Franco (1):
  improve_kernel_cve_report: fix backported-patch check

Hitendra Prajapati (5):
  vim: Fix for CVE-2026-73072
  vim: Fix for CVE-2026-73073
  vim: Fix for CVE-2026-73074
  vim: Fix for CVE-2026-73077
  vim: Fix for CVE-2026-73078

Jaipaul Cheernam (2):
  ca-certificates: upgrade 20260601 -> 20260816
  perl: Fix CVE-2026-19487

Jakub Szczudlo (Nokia) (1):
  gnutls: fix CVE-2026-5419

Kyungjik Min (1):
  rootfs.py: fix run-postinsts removal on multilib images

Peter Marko (5):
  cpio: patch CVE-2026-66485
  cpio: patch CVE-2026-66484
  golang: fix homepage
  python3-certifi: fix homepage
  libslirp: patch CVE-2026-9539

Peter Tatrai (2):
  testimage: avoid symlinking missing qemu boot log
  time64: enable 64-bit time/file-offset flags for 32-bit nativesdk

Richard Purdie (5):
  wireless-regdb: upgrade 2026.05.30 -> 2026.09.03
  ptest-runner: Upgrade 2.5.0 -> 2.5.1
  pseudo: Add in openat2, exec and linkat fixes
  pseudo: Update to 1.9.10
  pseudo: 1.9.10 -> 1.9.11

Siddharth Doshi (3):
  curl: Security Fix for CVE-2026-13608
  curl: Security Fix for CVE-2026-18924
  curl: set CVE_STATUS for CVE-2026-82209

Stefano Tondo (1):
  spdx30_tasks: Fix SPDX_CUSTOM_ANNOTATION_VARS implementation

Vijay Anusuri (7):
  kbd: Fix CVE-2026-72693
  libxfont: Fix CVE-2026-56001
  libxfont: Fix CVE-2026-56002
  libxfont: Fix CVE-2026-56003
  python3-cryptography: Fix CVE-2026-34073
  python3-cryptography: Fix CVE-2026-69248
  python3-cryptography: Fix CVE-2026-69249

Wang Mingyu (1):
  ptest-runner: upgrade 2.4.5 -> 2.4.5.1

Yoann Congal (3):
  scripts/install-buildtools: Update to 5.0.20
  python3: skip ptest incompatible with ptest-runner >= 2.5.0
  ptest-runner: Upgrade 2.4.5.1 -> 2.5.0

 meta/classes-recipe/testimage.bbclass         |   5 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/time64.inc           |  17 +
 meta/lib/oe/rootfs.py                         |   3 +-
 meta/lib/oe/spdx30_tasks.py                   |   4 +-
 meta/lib/oeqa/selftest/cases/spdx.py          |  74 ++++
 .../slirp/libslirp/CVE-2026-9539.patch        | 122 ++++++
 .../slirp/libslirp_git.bb                     |   5 +-
 .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++
 meta/recipes-core/kbd/kbd_2.6.4.bb            |   1 +
 .../gcc/{gcc-13.4.inc => gcc-13.5.inc}        |   9 +-
 ...ian_13.4.bb => gcc-cross-canadian_13.5.bb} |   0
 .../{gcc-cross_13.4.bb => gcc-cross_13.5.bb}  |   0
 ...-crosssdk_13.4.bb => gcc-crosssdk_13.5.bb} |   0
 ...cc-runtime_13.4.bb => gcc-runtime_13.5.bb} |   0
 ...itizers_13.4.bb => gcc-sanitizers_13.5.bb} |   0
 ...{gcc-source_13.4.bb => gcc-source_13.5.bb} |   0
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 -------------
 ...build-Remove-INCLUDE_MEMORY-PR117737.patch |  46 ---
 ...am-include-above-safe-ctype.h-PR1177.patch |  54 ---
 .../gcc/{gcc_13.4.bb => gcc_13.5.bb}          |   0
 ...initial_13.4.bb => libgcc-initial_13.5.bb} |   0
 .../gcc/{libgcc_13.4.bb => libgcc_13.5.bb}    |   0
 ...ibgfortran_13.4.bb => libgfortran_13.5.bb} |   0
 .../go/go-binary-native_1.22.12.bb            |   2 +-
 meta/recipes-devtools/go/go-common.inc        |   2 +-
 .../perl/files/CVE-2026-19487.patch           |  66 ++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |   1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 .../python/python3-certifi_2024.2.2.bb        |   2 +-
 .../python3-cryptography/CVE-2026-34073.patch | 167 +++++++++
 .../python3-cryptography/CVE-2026-69248.patch | 299 +++++++++++++++
 .../python3-cryptography/CVE-2026-69249.patch | 354 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   3 +
 .../python3-git/CVE-2026-42215_p1.patch       |  61 +++
 .../python3-git/CVE-2026-42215_p2.patch       |  47 +++
 .../python/python3-git_3.1.42.bb              |   2 +
 .../python/python3-mako_1.3.2.bb              |   2 +
 .../python/python3-pip/CVE-2026-13346.patch   | 223 +++++++++++
 .../python/python3-pip_24.0.bb                |   2 +
 .../python/python3-ply_3.11.bb                |   1 +
 .../python/python3_3.12.14.bb                 |   6 +
 meta/recipes-extended/cpio/cpio_2.15.bb       |   2 +
 .../cpio/files/CVE-2026-66484.patch           |  28 ++
 .../cpio/files/CVE-2026-66485.patch           | 210 +++++++++++
 .../wget/wget/CVE-2026-58470-regression.patch |  48 +++
 .../wget/wget/CVE-2026-58470.patch            |  79 ++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |   2 +
 .../xorg-lib/libxfont/CVE-2026-56001.patch    |  87 +++++
 .../xorg-lib/libxfont/CVE-2026-56002.patch    | 150 ++++++++
 .../xorg-lib/libxfont/CVE-2026-56003.patch    | 114 ++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   5 +
 ....05.30.bb => wireless-regdb_2026.09.03.bb} |   2 +-
 ...ertdata2pem.py-print-a-warning-for-e.patch |   6 +-
 ...icates-don-t-use-Debianisms-in-run-p.patch |   2 +-
 ...icates-use-relative-symlinks-from-ET.patch |   2 +-
 ...0260601.bb => ca-certificates_20260816.bb} |   2 +-
 .../curl/curl/CVE-2026-13608.patch            |  48 +++
 .../curl/curl/CVE-2026-18924.patch            |  39 ++
 meta/recipes-support/curl/curl_8.7.1.bb       |   5 +-
 .../gnutls/gnutls/CVE-2026-33845.patch        | 190 ++++++++++
 .../gnutls/gnutls/CVE-2026-5419.patch         | 247 ++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   2 +
 ...-runner_2.4.5.bb => ptest-runner_2.5.1.bb} |   3 +-
 .../vim/files/CVE-2026-52858-regression.patch |  94 +++++
 .../vim/files/CVE-2026-73072.patch            |  64 ++++
 .../vim/files/CVE-2026-73073.patch            |  89 +++++
 .../vim/files/CVE-2026-73074.patch            | 101 +++++
 .../vim/files/CVE-2026-73077.patch            |  96 +++++
 .../vim/files/CVE-2026-73078.patch            |  94 +++++
 meta/recipes-support/vim/vim.inc              |   6 +
 scripts/contrib/improve_kernel_cve_report.py  |   4 +-
 scripts/install-buildtools                    |   4 +-
 73 files changed, 3434 insertions(+), 389 deletions(-)
 create mode 100644 meta/recipes-connectivity/slirp/libslirp/CVE-2026-9539.patch
 create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
 rename meta/recipes-devtools/gcc/{gcc-13.4.inc => gcc-13.5.inc} (93%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.4.bb => gcc-cross-canadian_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_13.4.bb => gcc-cross_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.4.bb => gcc-crosssdk_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_13.4.bb => gcc-runtime_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.4.bb => gcc-sanitizers_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_13.4.bb => gcc-source_13.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
 rename meta/recipes-devtools/gcc/{gcc_13.4.bb => gcc_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_13.4.bb => libgcc-initial_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_13.4.bb => libgcc_13.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_13.4.bb => libgfortran_13.5.bb} (100%)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-19487.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-13346.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66484.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56003.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260601.bb => ca-certificates_20260816.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-13608.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5419.patch
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.bb => ptest-runner_2.5.1.bb} (94%)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858-regression.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73072.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73073.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73074.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73077.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73078.patch


