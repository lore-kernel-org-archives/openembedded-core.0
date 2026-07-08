Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43479C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:57:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5047.1783504626074382278
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SIALUz0P;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47362928f65so413163f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783504624; x=1784109424; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRd3luQMxFLemGvhcE6nlLpMqkIV90y28zgTNexz1PI=;
        b=SIALUz0P5X6J3jSvliLBIXqOTWiJ93/lUwYdS6gOtb+/J4uU/zMq1/qylfepyiHFuf
         2yqFjTo9FC3JnANA3qYXX2LHprREuPOtzI2yQZofkKMzO/jwSUADN6jF71//kV9FTIu4
         79xHWt699P90W5UJlGoqePQgXs941fU0cOiD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504624; x=1784109424;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CRd3luQMxFLemGvhcE6nlLpMqkIV90y28zgTNexz1PI=;
        b=E/xoyC+Xtr41HD6KRClgTkPdQjSEEjCPUnyYanIoWFiM9IpeicWb954u91e9a7vDcR
         URn76sFmIh4mbmKMSQ+8YjQ1wR5RbZWcoQo392nVUQtdr4WYjcSlOz89TG7drBuRpPNe
         XXNc0XhMSULi/p5MORW2uUUnLxjE3ENsSZ9toQ8mzaqjimFNWV0RLthDRlKEImvlbxZj
         282IG27PQ751RvLg1XvGJBB82sthgW+Bw/+7dWW3hYJzCDhCxH1hL/M78fVtEGVNSpiR
         INjP7dLG9snMk77lgUnEU0tnWs8whE47t86K50LDZKE6p64/uqGXJfJ9eFcD/bS0uwGI
         oAqg==
X-Gm-Message-State: AOJu0YwT7QnB34kPjczu5M5Ogq5C84F6F1RXvQ74nmh/ahTgh+NCBfw3
	cJgO01FPqTb3yXHLXERBNPn+FWzlNqPOqQ6bgVqjnnsODSRIDAvPEpin45CeWRLH12059bi36+t
	ZnyS7bEE=
X-Gm-Gg: AfdE7cmcV46Xd2ps7F5L9+XJ3cC3gEhtjbNZ1z8KdDTU8eQXwCh+8xVtn7wU7c179tH
	Q4MgwkMWmRXBA2p49Bzfq5Zq3gidwsn3iInncQfO2Aw+YIA4Y1j8yr8c3FA85VVXfKQZ28VUiYD
	jRuUCsYiFQtz+TVw2MK4p3Aw4EMsr46je47RdAoHX+e4dv5ZIcqjpDKlfndNU1fhSkaRhn3fVP+
	1Gpaq1Qk56913tuvCV8ti1lwbH1Ztmyxk9/+MvI4Wtyqp3QAXFrfQT52VXgQVXQunLE3HHvizG4
	sNYX4GuMojjNUROZp7SSxrmNk7yhwPBGqrX9I1obJC8T/GyKFnmHfaQGhwpTreutMZa138fdpfV
	QWosOUtLXpMLCsHWJNLPCeA9KdF/bZBx6RimpahZW4h1gQl2+mmYvhQU62FN8MgnhsT08mPc1HJ
	8TVm6sTmdnKgD+emrCQHPOlU2C2QRdmV8N/MtjlFlypjJdmeLhM4ltuBhN4qOGCUTCrP3h58RJM
	UxWzGfCR/I9MZ4XMKxRCGc=
X-Received: by 2002:a5d:5f83:0:b0:473:506a:e47c with SMTP id ffacd0b85a97d-47df076a593mr1891699f8f.26.1783504623992;
        Wed, 08 Jul 2026 02:57:03 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm39850444f8f.23.2026.07.08.02.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:57:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/55] Pull request (cover letter only)
Date: Wed,  8 Jul 2026 11:55:39 +0200
Message-ID: <cover.1783504220.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240455

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1783289522.git.yoann.congal@smile.fr/
From this series, I've replaced the bluez5 patches with their respective
cherry-picks from master (no code change, only signed-off-by changes)

Passed a-full on autobuilder (before the bluez5 changes):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4156
* failed in qemuarm64 with 16295 – AB-INT: go-runtime: do_create_package_spdx: No SPDX document named .../package-go-runtime-staticdev.spdx.json
  rebuilt in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/36/builds/4073


The following changes since commit 5d1aa5c806c061a2994f4decb59016610f093213:

  build-appliance-image: Update to wrynose head revisions (2026-06-24 14:17:46 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to af558e39e836f6581670b4483d1c6fd151374c79:

  clang/llvm: Upgrade to 22.1.8 release (2026-07-06 09:51:19 +0200)

----------------------------------------------------------------

Alexander Kanavin (1):
  strace: remove skip-bpf.patch

Anil Dongare (4):
  cargo: Fix CVE-2026-5222
  cargo: Fix CVE-2026-5223
  cups: fix CVE-2026-27447
  cups: fix CVE-2026-41079

Anton Skorup (1):
  libxml2: patch CVE-2026-11979

Ashishkumar Parmar (3):
  qemu: Fix CVE-2026-2243
  qemu: Fix CVE-2026-0665
  qemu: Fix CVE-2025-14876

Bruce Ashfield (8):
  linux-yocto/6.18: update to v6.18.25
  linux-yocto/6.18: update to v6.18.26
  linux-yocto/6.18: update to v6.18.28
  linux-yocto/6.18: update to v6.18.32
  linux-yocto/6.18: qat/intel configuration warning fixes
  linux-yocto/6.18: update to v6.18.33
  linux-yocto/6.18: update to v6.18.34
  linux-yocto/6.18: update to v6.18.35

Daniel Turull (3):
  libssh2: fix CVE-2026-55200
  libssh2: fix CVE-2026-55199
  bc: set CVE_PRODUCT

Deepesh Varatharajan (1):
  clang/llvm: Upgrade to 22.1.8 release

Hiago De Franco (1):
  nospdx: also drop do_create_recipe_sbom

Himanshu Jadon (1):
  tar: Fix CVE-2026-5704

Hitendra Prajapati (2):
  vim: fix for CVE-2026-41411 & CVE-2026-44656
  vim: fix for CVE-2026-45130 & CVE-2026-46483

Jaipaul Cheernam (2):
  binutils: Fix CVE-2026-6846
  cmake-native: prevent host libidn2 contamination

Jinwang Li (1):
  bluez5: fix set volume failure

João Marcos Costa (1):
  ptest-packagelists.inc: disable glib-2.0 for RISCV64

Khem Raj (1):
  baremetal-helloworld: Fix override order

Kris Gavvala (1):
  python3: skiptest tracemalloc_track_race

Mengshi Wu (1):
  bluez5: fix gatt cache sync issue

Nate Kent (1):
  sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers

Otavio Salvador (1):
  quota: use native rpcgen and a single-word RPCGEN_CPP

Peter Kjellerstedt (1):
  common-licenses/PHP-3.0: Correct the license text

Richard Purdie (3):
  libxpm: upgrade 3.5.18 -> 3.5.19
  python3-click: Fixes for new pytest and flaky ptest
  sstate: Reduce native sysroot execution race potential

Roland Kovacs (1):
  gnupg: fix CVE-2026-57062

Ross Burton (2):
  tcl: disable the timer tests in run-ptest
  libjitterentropy: fix license statement

Sai Sneha (1):
  i2c-tools: add LGPL-2.1-or-later license for libi2c

Shubham Pushpkar (1):
  libsolv: Fix CVE-2026-9149

Siva Balasubramanian (1):
  qemuboot.bbclass: add missing task dependency on kernel deploy

Theo Gaige (Schneider Electric) (5):
  dhcpcd: patch CVE-2026-56113
  dhcpcd: patch CVE-2026-56114
  dhcpcd: patch CVE-2026-56116
  dhcpcd: patch CVE-2026-56117
  perl: patch CVE-2026-8376

Walter Werner Schneider (1):
  devtool: provide explicit error for missing "script" command

Wei Deng (1):
  bluez5: set L2CAP IMTU for OBEX profile listeners

Wei Gao (1):
  dmidecode: fix x86-only tools being installed on ARM targets

Xiaozhan Li (1):
  texinfo: add missing perl module runtime dependencies

Yoann Congal (1):
  dropbear: Add missing WTFPL & Unlicense in LICENSE and
    LIC_FILES_CHKSUM

xiuzhuo.shang@oss.qualcomm.com (1):
  bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA

 meta/classes-global/sstate.bbclass            |   4 +
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes-recipe/qemuboot.bbclass          |   1 +
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../distro/include/ptest-packagelists.inc     |   4 +-
 meta/files/common-licenses/PHP-3.0            |  76 +--
 meta/recipes-connectivity/bluez5/bluez5.inc   |   4 +
 ...sending-extra-bytes-with-MGMT_OP_ADD.patch |  33 ++
 ...2CAP-IMTU-for-OBEX-profile-listeners.patch | 118 ++++
 ...x-stored-gatt-cache-DB-Hash-value-no.patch |  84 +++
 ...t-volume-failure-with-invalid-device.patch |  46 ++
 .../dhcpcd/dhcpcd_10.3.1.bb                   |   4 +
 .../dhcpcd/files/CVE-2026-56113.patch         |  92 +++
 .../dhcpcd/files/CVE-2026-56114.patch         |  34 ++
 .../dhcpcd/files/CVE-2026-56116.patch         |  31 +
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++
 .../recipes-core/dropbear/dropbear_2025.89.bb |   8 +-
 .../libxml/libxml2/CVE-2026-11979.patch       |  81 +++
 meta/recipes-core/libxml/libxml2_2.15.2.bb    |   1 +
 .../meta/nativesdk-buildtools-perl-dummy.bb   |   2 +
 .../binutils/binutils-2.46.inc                |   1 +
 .../binutils/binutils/CVE-2026-6846.patch     |  59 ++
 meta/recipes-devtools/clang/common-clang.inc  |   2 +-
 meta/recipes-devtools/clang/common.inc        |   2 +-
 .../cmake/cmake-native_4.3.1.bb               |   1 +
 .../dmidecode/dmidecode_3.7.bb                |   1 +
 .../i2c-tools/i2c-tools_4.4.bb                |   5 +-
 .../perl/files/CVE-2026-8376-01.patch         |  62 ++
 .../perl/files/CVE-2026-8376-02.patch         |  49 ++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |   2 +
 ...7494c991c9197902fdf4995e11b2da3e9762.patch | 173 ++++++
 .../python/python3-click/pytest-fix.patch     |  29 +
 .../python/python3-click_8.3.1.bb             |   1 +
 .../recipes-devtools/python/python3_3.14.5.bb |   7 +
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2025-14876_p1.patch         |  52 ++
 .../qemu/qemu/CVE-2025-14876_p2.patch         |  56 ++
 .../qemu/qemu/CVE-2026-0665.patch             |  38 ++
 .../qemu/qemu/CVE-2026-2243.patch             |  45 ++
 .../rust/files/CVE-2026-5222.patch            |  92 +++
 .../rust/files/CVE-2026-5223.patch            | 125 ++++
 meta/recipes-devtools/rust/rust-source.inc    |   2 +
 .../strace/strace/skip-bpf.patch              |  25 -
 meta/recipes-devtools/strace/strace_6.19.bb   |   1 -
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   2 +
 meta/recipes-devtools/tcltk8/tcl8/run-ptest   |   2 +
 .../baremetal-helloworld_git.bb               |   2 +-
 meta/recipes-extended/bc/bc_1.08.2.bb         |   3 +
 meta/recipes-extended/cups/cups.inc           |   4 +
 .../cups/CVE-2026-27447-regression_p1.patch   |  46 ++
 .../cups/CVE-2026-27447-regression_p2.patch   |  58 ++
 .../cups/cups/CVE-2026-27447.patch            | 120 ++++
 .../cups/cups/CVE-2026-41079.patch            |  73 +++
 .../libsolv/libsolv/CVE-2026-9149.patch       | 152 +++++
 .../libsolv/libsolv_0.7.36.bb                 |   1 +
 meta/recipes-extended/quota/quota_4.11.bb     |   6 +-
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   2 +-
 .../tar/tar/CVE-2026-5704-dependent_p1.patch  | 484 +++++++++++++++
 .../tar/tar/CVE-2026-5704-dependent_p2.patch  | 169 ++++++
 .../tar/tar/CVE-2026-5704-regression.patch    | 176 ++++++
 .../tar/tar/CVE-2026-5704.patch               | 556 ++++++++++++++++++
 meta/recipes-extended/tar/tar_1.35.bb         |   4 +
 meta/recipes-extended/texinfo/texinfo_7.3.bb  |   4 +
 .../{libxpm_3.5.18.bb => libxpm_3.5.19.bb}    |   2 +-
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
 .../gnupg/gnupg/CVE-2026-57062.patch          |  43 ++
 meta/recipes-support/gnupg/gnupg_2.5.17.bb    |   1 +
 .../libjitterentropy_3.6.3.bb                 |   3 +-
 .../libssh2/libssh2/CVE-2026-55199.patch      |  44 ++
 .../libssh2/libssh2/CVE-2026-55200.patch      |  36 ++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   2 +
 .../vim/files/CVE-2026-41411.patch            |  75 +++
 .../vim/files/CVE-2026-44656.patch            | 124 ++++
 .../vim/files/CVE-2026-45130.patch            | 115 ++++
 .../vim/files/CVE-2026-46483.patch            |  77 +++
 meta/recipes-support/vim/vim.inc              |   4 +
 scripts/lib/devtool/__init__.py               |   3 +
 79 files changed, 3938 insertions(+), 118 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 create mode 100644 meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
 create mode 100644 meta/recipes-devtools/python/python3-click/pytest-fix.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5222.patch
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-bpf.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p1.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p2.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-regression.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704.patch
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb} (88%)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-41411.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-44656.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch


