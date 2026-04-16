Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C375FA0C23
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:21 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7711.1776322099672806568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZoU2kVSf;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43cfd832155so5231731f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322098; x=1776926898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLAb9X3gMsJ7O/cGMR4Z/6j2AYuVDIpXvsZFInHbTc0=;
        b=ZoU2kVSfD/b3SGyw2JmhjA691ETDvARerDGgapj7xBjX+GtGx6QePRJdt/SN+T/dpK
         Cl7KTsysGGL54lIEzcM9YdXpC7CJ4xmVhlbWrlf+RH2nnDvNs1sJkG/cjemp85dRT2qE
         p5RAces237OK7lUHdbaMqkPaqnRp6ynQQmzYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322098; x=1776926898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLAb9X3gMsJ7O/cGMR4Z/6j2AYuVDIpXvsZFInHbTc0=;
        b=oOv8J3dhrmK5QITXaD73FeC67Q/nuGNYVuiZn7f9uuNKgl3milC6PMM309BwRJTyEU
         xqiGbouHCgaWdxpBai/0zcVt4iTCbkYyNG9dnvmgAAF6lwI/hj41Nd/1BiNx9A6vYvbI
         usi+3vEpgrRCTDR86L2mKJ1Mf3BsW+tEXawnEALC/yV3cvVJbeO6f5khlNsUSU3khqUi
         e6oT5+wrZ12r3JAF+rf2LdO8bK3hqp+iGKNZRMCjKA1ZkSVeYCf2UqQES4ZOVHBm9bVC
         SWjVFXGDuFp1njAsfFISXAABhWfoZraw46eeZnU1lUvqYZZ7sJJlHadDKR8H3h/9uXuB
         iudg==
X-Gm-Message-State: AOJu0YxXFYfg94f/odUMrXAiAKG46saGEk6RXKs9mRg5SUX7EApuyep/
	2lgsqFgcr2iqydrgAZCSizVsFVCa4Csy5LacnlUJYBRShkkvH0PcqzAhYGW92T0EZy9z2mRm58H
	NP1rnOpdc99Am
X-Gm-Gg: AeBDieuMKd4hnm3EMQojjA5XDY1jJmwkKwBFsUw3VslDXKeOKl3CZqugJ+L0Pw3TaJp
	gXmbplBcmGv4hY8icw3KDSvCs00Nv9ln9XuGbOIYFnrXSWD1km67/fPd+8TCGxi119/J4+Ye7xr
	D4aA6FjKSwjaw/WL35z46FGStEGwSYfHcgg/ORNnaeQWwqT11bviIW50ZPJ7/MJmNASMSlc7nYv
	B8X88lOWUuuYHj1ouYozsIXSzPjm/4zv7GesV63CAU4rd4KeQ1UQrpi83O91ceqm4WQ9TlIf5aa
	M7hIqt3ZgIhR6yCDcSM8H+yVMvpZ4WwDfMofbTZ33XYAqUm/eM7ylWyqcw9RurMUSe0T2LOtWaR
	/OT5sOYU+L2dPrI8v6MQjkmVUi5BmqlsPPzWKMK8PGRPHlg8ejpDbVF+CI5BkCjTV4M/wUmF2L+
	i3/RjCzDzPToeds0uBQHcMK9EUCDdpXHLAEY/12t3LqiAJS3U6HsnJLytYiIYPhoFTIIgW/ijgD
	hJt7n7eDjf277GUyfycitjaYdEGqIWMuXqKGw==
X-Received: by 2002:adf:f68c:0:b0:43d:6fce:3ef with SMTP id ffacd0b85a97d-43d6fce0571mr18472564f8f.21.1776322097038;
        Wed, 15 Apr 2026 23:48:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 00/47] Patch review
Date: Thu, 16 Apr 2026 08:47:01 +0200
Message-ID: <cover.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235342

Please review this set of changes for whinlatter and have comments back by
end of day Sunday, April 19. I plan to do the release build on Monday.

This is a relatively "big" series compared to the usual: In addition to
the usual CVE fixes, there are:
- "git://" protocol patches
- Ubunutu 26.04 support patches (Host glibc 2.43 and GCC 16)

Please note: This will be the last review cycle for whinlatter.
If you expect a patch to get merged and it is not in this series ping
me as soon as possible.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3670

The following changes since commit e8a3acb03d4c466cd08e358953df15746cb5aaca:

  vim: Fix CVE-2026-26269 (2026-04-02 00:08:06 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

for you to fetch changes up to dc0dd419fb43968426d342b1d84d0204001cd39f:

  scripts/install-buildtools: Update to 5.3.3 (2026-04-15 23:07:17 +0000)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed

Alexander Kanavin (2):
  selftest/minidebuginfo: extract files from tar archive using tarfile
    module
  selftest/gdbserver: replace shutil.unpack_archive with tarfile extract

Ankur Tyagi (1):
  barebox/barebox-tools: upgrade 2025.09.0 -> 2025.09.3

Deepak Rathore (5):
  binutils: Fix CVE-2025-69648
  binutils: Fix CVE-2025-69644 CVE-2025-69647
  binutils: Fix CVE-2025-69649
  binutils: Fix CVE-2025-69652
  nfs-utils: Fix CVE-2025-12801

Hemanth Kumar M D (2):
  libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
  glibc: stable 2.42 branch updates

Hitendra Prajapati (3):
  vim: Fix CVE-2026-33412
  vim: Fix CVE-2026-28418
  vim: Fix CVE-2026-28419

Khem Raj (3):
  virglrenderer: Fix build with glibc 2.43+
  libxcrypt: Fix build wrt C23 support
  libxcrypt: Use configure knob to disable warnings as errors

Martin Jansa (8):
  gcc: backport a fix for building with gcc-16
  dtc: backport fix for build with glibc-2.43
  m4: backport 3 gnulib changes to fix build with glibc-2.43 on host
  gettext: backport gnulib changes to fix build with glibc-2.43 on host
  util-linux: backport fix to build with glibc-2.43 on host
  systemd: backport fix to build with glibc-2.43 on host
  spirv-tools: backport a fix for building with gcc-16
  ovmf: backport a fix for build with gcc-16

Michael Halstead (1):
  yocto-uninative: Update to 5.1 for glibc 2.43

Peter Marko (4):
  libarchive: upgrade 3.8.5 -> 3.8.6
  openssl: upgrade 3.5.5 -> 3.5.6
  go: upgrade 1.25.8 -> 1.25.9
  libpng: upgrade 1.6.55 -> 1.6.56

Richard Purdie (4):
  pseudo: Add fix for glibc 2.43
  recipetool: Recognise https://git. as git urls
  selftest/scripts: Update old git protocol references
  archiver: Don't try to preserve all attributes when copying files

Sunil Dora (1):
  license.py: Drop visit_Str from SeenVisitor in selftest

Trevor Gamblin (1):
  report-error.bbclass: replace 'codecs.open()' with 'open()'

Vijay Anusuri (2):
  sqlite3: Fix CVE-2025-70873
  python3: upgrade 3.13.11 -> 3.13.12

Yoann Congal (8):
  oeqa/selftest/devtool: add vulkan feature check for test needing it
  oeqa/selftest: add wayland feature check for tests needing it
  oeqa/sdk: Default to https git protocol for YP/OE repos
  scripts: Default to https git protocol for YP/OE repos
  oeqa/selftest/git-submodule-test: Default to https git protocol for
    YP/OE repos
  meta/files/layers.example.json: switch to https clone URIs
  build-appliance-image: switch SRC_URI to https protocol
  scripts/install-buildtools: Update to 5.3.3

Zoltán Böszörményi (1):
  binutils: Fix build with GLIBC 2.43 on the host

 .../devtool/devtool-upgrade-test2_git.bb      |   2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |   2 +-
 .../devtool/devtool-upgrade-test5_git.bb      |   4 +-
 .../devtool-upgrade-test5_git.bb.upgraded     |   4 +-
 .../git-submodule-test/git-submodule-test.bb  |   4 +-
 meta/classes/archiver.bbclass                 |   2 +-
 meta/classes/report-error.bbclass             |   8 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/files/layers.example.json                |   4 +-
 meta/lib/oeqa/buildtools-docs/cases/build.py  |   2 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |   4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   8 +-
 meta/lib/oeqa/selftest/cases/externalsrc.py   |   2 +-
 meta/lib/oeqa/selftest/cases/gdbserver.py     |   4 +-
 .../oeqa/selftest/cases/gitarchivetests.py    |   2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   |   2 +
 meta/lib/oeqa/selftest/cases/minidebuginfo.py |   7 +-
 meta/lib/oeqa/selftest/cases/oelib/license.py |   4 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |   4 +-
 .../cases/yoctotestresultsquerytests.py       |   2 +-
 meta/recipes-bsp/barebox/barebox-common.inc   |   4 +-
 .../CVE-2025-12801-dependent_p1.patch         |  81 +++
 .../CVE-2025-12801-dependent_p2.patch         | 181 +++++
 .../CVE-2025-12801-dependent_p3.patch         | 465 +++++++++++++
 .../nfs-utils/nfs-utils/CVE-2025-12801.patch  | 254 +++++++
 .../nfs-utils/nfs-utils_2.8.4.bb              |   4 +
 ...sysroot-and-debug-prefix-map-from-co.patch |   2 +-
 .../{openssl_3.5.5.bb => openssl_3.5.6.bb}    |   2 +-
 ...23-qualifier-generic-fns-like-strchr.patch | 626 ++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.26.bb     |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.42.bb         |   2 +-
 .../images/build-appliance-image_15.0.0.bb    |   6 +-
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch |  29 +
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   6 +-
 ...Tools-StringFuncs-fix-gcc-16-warning.patch |  42 ++
 ...aseTools-EfiRom-fix-compiler-warning.patch |  44 ++
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 ...ilter-out-EFSBADCRC-and-EFSCORRUPTED.patch |  34 +
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 ...x-bsearch-macro-usage-with-glibc-C23.patch |  40 ++
 .../binutils/binutils-2.45.inc                |   7 +
 ...tect-against-standard-library-macros.patch |  34 +
 .../CVE-2025-69644_CVE-2025-69647.patch       |  85 +++
 .../binutils/binutils/CVE-2025-69648.patch    | 189 ++++++
 .../binutils/binutils/CVE-2025-69649.patch    |  41 ++
 .../binutils/binutils/CVE-2025-69652.patch    |  40 ++
 meta/recipes-devtools/gcc/gcc-15.2.inc        |   1 +
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 257 +++++++
 .../go/{go-1.25.8.inc => go-1.25.9.inc}       |   2 +-
 ...e_1.25.8.bb => go-binary-native_1.25.9.bb} |   6 +-
 ..._1.25.8.bb => go-cross-canadian_1.25.9.bb} |   0
 ...{go-cross_1.25.8.bb => go-cross_1.25.9.bb} |   0
 ...osssdk_1.25.8.bb => go-crosssdk_1.25.9.bb} |   0
 ...runtime_1.25.8.bb => go-runtime_1.25.9.bb} |   0
 ...ent-based-hash-generation-less-pedan.patch |   8 +-
 ...d-go-make-GOROOT-precious-by-default.patch |   2 +-
 .../go/{go_1.25.8.bb => go_1.25.9.bb}         |   0
 meta/recipes-devtools/m4/m4-1.4.20.inc        |   3 +
 ...-Fix-some-g-Wsystem-headers-warnings.patch | 135 ++++
 ...pilation-error-on-macOS-with-fortify.patch | 126 ++++
 ...23-qualifier-generic-fns-like-strchr.patch | 194 ++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 ...{python3_3.13.11.bb => python3_3.13.12.bb} |   2 +-
 ...ibarchive_3.8.5.bb => libarchive_3.8.6.bb} |   2 +-
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch |  50 ++
 .../spir/spirv-tools_1.4.328.1.bb             |   3 +-
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch |  55 ++
 .../virglrenderer/virglrenderer_1.1.1.bb      |   1 +
 .../0001-Fix-discarded-const-qualifiers.patch |  83 +++
 meta/recipes-kernel/dtc/dtc_1.7.2.bb          |   1 +
 .../{libpng_1.6.55.bb => libpng_1.6.56.bb}    |   2 +-
 .../sqlite/files/CVE-2025-70873.patch         |  33 +
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |   1 +
 .../vim/files/CVE-2026-28418.patch            |  78 +++
 .../vim/files/CVE-2026-28419.patch            |  86 +++
 .../vim/files/CVE-2026-33412.patch            |  61 ++
 meta/recipes-support/vim/vim.inc              |   3 +
 scripts/combo-layer.conf.example              |   4 +-
 scripts/contrib/patchtest.sh                  |   4 +-
 scripts/install-buildtools                    |   4 +-
 scripts/lib/recipetool/create.py              |   2 +-
 scripts/yocto_testresults_query.py            |   2 +-
 84 files changed, 3452 insertions(+), 70 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb => openssl_3.5.6.bb} (99%)
 create mode 100644 meta/recipes-core/gettext/gettext/0001-Port-to-C23-qualifier-generic-fns-like-strchr.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-fix-gcc-16-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-compiler-warning.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsfd-fix-bsearch-macro-usage-with-glibc-C23.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69644_CVE-2025-69647.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 rename meta/recipes-devtools/go/{go-1.25.8.inc => go-1.25.9.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.8.bb => go-binary-native_1.25.9.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.8.bb => go-cross-canadian_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.8.bb => go-cross_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.8.bb => go-crosssdk_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.8.bb => go-runtime_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.8.bb => go_1.25.9.bb} (100%)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-string-h-wchar-h-Fix-some-g-Wsystem-headers-warnings.patch
 create mode 100644 meta/recipes-devtools/m4/m4/0002-string-h-Fix-compilation-error-on-macOS-with-fortify.patch
 create mode 100644 meta/recipes-devtools/m4/m4/0003-Port-to-C23-qualifier-generic-fns-like-strchr.patch
 rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.13.12.bb} (99%)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (96%)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.55.bb => libpng_1.6.56.bb} (97%)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch


