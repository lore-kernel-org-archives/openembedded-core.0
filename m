Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D057F588F5
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 16:26:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23536.1776702385362379212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 09:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=udImMHDD;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2126284f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776702383; x=1777307183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7kmUS+1yRm4jA4F/4n8xup5J8mfBwhXHPfzZZsKMh9I=;
        b=udImMHDD/YqGv8At6MTyjSKPCCV21zTlHHIPwEC6ZtsaAF4hdSebyE1/1omQ4X0rXx
         ZCG6E0SLjIz6k0XDU/Wi+e8zhjuBoSV1kbqMjQUKFHxxXY8TN134TU4NI+WwWPBfvWc1
         ZvLYP0O7ir9+wJHlbY/Pl/piQ7r5t3jwGlTsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702383; x=1777307183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kmUS+1yRm4jA4F/4n8xup5J8mfBwhXHPfzZZsKMh9I=;
        b=qjFMw0gjLITOAvsfIbeUINvVBMvFgB94fQntPJN5K6wCNfStDCBSW/Nnktl5QKp24N
         YIRR1s5LEFPcZAMYEHCDkD9GGCz+k1hpYDFfUpjGteSrkn+hVQRR4W7Pr8TY8jZgeiLC
         2u/U6+qOYx5F4lo3s+6KNUKEmO6D5z5xIT8k1mezmtx0q7R2LmmaIzJGsZAmuzJaIY2D
         C7VuJd9AVN04zBAQex0upPLrB8nZgivk5THC48nK64m3q/2sIB08gBbbj5gFcpUpy8Ar
         UyYZLf4naxlEJsaopVQ/WDkODoWV5YKTRtHHCNEbPw9fEIVkJLzi6bEisNOHPeOyj2rv
         Kq5w==
X-Gm-Message-State: AOJu0Yyn0tyo/31OlO/51WdaPLZL4huKyyb6sX7bkD0vH91yZwnY0BSN
	uY6dGXQfdG1AaItb+KqLsTWxGtSREC1M4ufeCMZ3BEM9BCHKQiFRoSF0cxx1PYpKHG3qi/oeDMz
	oSJV5z+s=
X-Gm-Gg: AeBDiet/5NeloNPN7CLve0tGsoHlwoftJ+zpBfZmU3crAR8W+UOLq8UvfXWZzoTZUqy
	n2Cp3DYYxFMuTCl8xg01ZCSaGl3cBUWwfNldT1EDcEnpP4VDCChuO1iZVG2BWiToYdK5O7Kt8Mo
	Dh9dJwXmZ76SKGhFmUWQrKNyTmUq471nHi0gbMqBBe3tS6zy38CkbS4lyW3QS98XJTQacsjFlk5
	iqu5LyODaytjMKx9XcY5Wk3/ZMrKLiLzJpnBoLkBGmTHQ2RkWpToQ1bsjMmseQTBDqao525iiu2
	8tj/eKjJIQRI4Hzuxjho0u0JfAYo8ebxhCF/MnBdhUY719CXFjxGbDCbVjaWljOC6LYkLvBTot5
	T4Y0k61AYieP8Ra3ZJ8Z7ZJhQ7whNktRkdQxYHHfnd1riV0Xh3h2CbEj/k/z9s0AdHvw/A0RHaq
	0eMjnbxaKKhL7q6rWxFaouROBwBatXhzZNjYAm0WLPVI1hnukVtIOJJgjbSQOidFXOfJgeZmlMx
	7esPkxeFiEw7qAbE2ibFCRFWWyHJr+krAkhCepkWVaH
X-Received: by 2002:a05:6000:2312:b0:43c:dc99:771c with SMTP id ffacd0b85a97d-43fe3e1240amr22865421f8f.42.1776702383301;
        Mon, 20 Apr 2026 09:26:23 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm40454255f8f.36.2026.04.20.09.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:26:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 00/52] Pull request (cover letter only)
Date: Mon, 20 Apr 2026 18:26:17 +0200
Message-ID: <cover.1776702292.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 16:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235575

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/DHVA7OKM4Z5B.8F1XG493U352@smile.fr/T/#t
with added python3: Fix test under ptest-runner 2.5.1
  https://lore.kernel.org/openembedded-core/20260417075943.1398549-1-yoann.congal@smile.fr/T/#u

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3678
* qemuarm64-ptest failed with #16150 - AB-INT: oe-selftest-armhost: Failed to start QEMU (hangs with drm)
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3503
  * ... but was sucessfully retried as:
    https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3505

The following changes since commit e8a3acb03d4c466cd08e358953df15746cb5aaca:

  vim: Fix CVE-2026-26269 (2026-04-02 00:08:06 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to 4fbdd0fc15fe23f469454a063d1c966876a71426:

  python3: Fix test under ptest-runner 2.5.1 (2026-04-17 01:43:10 +0200)

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

Hemanth Kumar M D (3):
  libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
  glibc: stable 2.42 branch updates
  binutils: Upgrade to 2.45.1 release

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

Richard Purdie (5):
  pseudo: Add fix for glibc 2.43
  recipetool: Recognise https://git. as git urls
  selftest/scripts: Update old git protocol references
  archiver: Don't try to preserve all attributes when copying files
  ptest-runner: Upgrade 2.5.0 -> 2.5.1

Sunil Dora (1):
  license.py: Drop visit_Str from SeenVisitor in selftest

Trevor Gamblin (1):
  report-error.bbclass: replace 'codecs.open()' with 'open()'

Vijay Anusuri (2):
  sqlite3: Fix CVE-2025-70873
  python3: upgrade 3.13.11 -> 3.13.12

Yoann Congal (11):
  oeqa/selftest/devtool: add vulkan feature check for test needing it
  oeqa/selftest: add wayland feature check for tests needing it
  oeqa/sdk: Default to https git protocol for YP/OE repos
  scripts: Default to https git protocol for YP/OE repos
  oeqa/selftest/git-submodule-test: Default to https git protocol for
    YP/OE repos
  meta/files/layers.example.json: switch to https clone URIs
  build-appliance-image: switch SRC_URI to https protocol
  scripts/install-buildtools: Update to 5.3.3
  ptest-runner: Upgrade 2.4.5.1 -> 2.5.0
  ptest-runner: Use git tag in SRC_URI
  python3: Fix test under ptest-runner 2.5.1

Zoltán Böszörményi (1):
  binutils: Fix build with GLIBC 2.43 on the host

 .../devtool/devtool-upgrade-test2_git.bb      |    2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |    2 +-
 .../devtool/devtool-upgrade-test5_git.bb      |    4 +-
 .../devtool-upgrade-test5_git.bb.upgraded     |    4 +-
 .../git-submodule-test/git-submodule-test.bb  |    4 +-
 meta/classes/archiver.bbclass                 |    2 +-
 meta/classes/report-error.bbclass             |    8 +-
 meta/conf/distro/include/yocto-uninative.inc  |   10 +-
 meta/files/layers.example.json                |    4 +-
 meta/lib/oeqa/buildtools-docs/cases/build.py  |    2 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |    4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |    8 +-
 meta/lib/oeqa/selftest/cases/externalsrc.py   |    2 +-
 meta/lib/oeqa/selftest/cases/gdbserver.py     |    4 +-
 .../oeqa/selftest/cases/gitarchivetests.py    |    2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   |    2 +
 meta/lib/oeqa/selftest/cases/minidebuginfo.py |    7 +-
 meta/lib/oeqa/selftest/cases/oelib/license.py |    4 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |    4 +-
 .../cases/yoctotestresultsquerytests.py       |    2 +-
 meta/recipes-bsp/barebox/barebox-common.inc   |    4 +-
 .../CVE-2025-12801-dependent_p1.patch         |   81 +
 .../CVE-2025-12801-dependent_p2.patch         |  181 ++
 .../CVE-2025-12801-dependent_p3.patch         |  465 +++++
 .../nfs-utils/nfs-utils/CVE-2025-12801.patch  |  254 +++
 .../nfs-utils/nfs-utils_2.8.4.bb              |    4 +
 ...sysroot-and-debug-prefix-map-from-co.patch |    2 +-
 .../{openssl_3.5.5.bb => openssl_3.5.6.bb}    |    2 +-
 ...23-qualifier-generic-fns-like-strchr.patch |  626 ++++++
 meta/recipes-core/gettext/gettext_0.26.bb     |    1 +
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 meta/recipes-core/glibc/glibc_2.42.bb         |    2 +-
 .../images/build-appliance-image_15.0.0.bb    |    6 +-
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch |   29 +
 meta/recipes-core/libxcrypt/libxcrypt.inc     |    6 +-
 ...Tools-StringFuncs-fix-gcc-16-warning.patch |   42 +
 ...aseTools-EfiRom-fix-compiler-warning.patch |   44 +
 meta/recipes-core/ovmf/ovmf_git.bb            |    2 +
 meta/recipes-core/systemd/systemd.inc         |    4 +-
 ...ilter-out-EFSBADCRC-and-EFSCORRUPTED.patch |   34 +
 meta/recipes-core/util-linux/util-linux.inc   |    1 +
 ...x-bsearch-macro-usage-with-glibc-C23.patch |   40 +
 .../binutils/binutils-2.45.inc                |   13 +-
 ...tect-against-standard-library-macros.patch |   34 +
 ...-system-directories-when-cross-linki.patch |   38 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
 .../CVE-2025-69644_CVE-2025-69647.patch       |   85 +
 .../binutils/binutils/CVE-2025-69648.patch    |  189 ++
 .../binutils/binutils/CVE-2025-69649.patch    |   41 +
 .../binutils/binutils/CVE-2025-69652.patch    |   40 +
 meta/recipes-devtools/gcc/gcc-15.2.inc        |    1 +
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch |  257 +++
 .../go/{go-1.25.8.inc => go-1.25.9.inc}       |    2 +-
 ...e_1.25.8.bb => go-binary-native_1.25.9.bb} |    6 +-
 ..._1.25.8.bb => go-cross-canadian_1.25.9.bb} |    0
 ...{go-cross_1.25.8.bb => go-cross_1.25.9.bb} |    0
 ...osssdk_1.25.8.bb => go-crosssdk_1.25.9.bb} |    0
 ...runtime_1.25.8.bb => go-runtime_1.25.9.bb} |    0
 ...ent-based-hash-generation-less-pedan.patch |    8 +-
 ...d-go-make-GOROOT-precious-by-default.patch |    2 +-
 .../go/{go_1.25.8.bb => go_1.25.9.bb}         |    0
 meta/recipes-devtools/m4/m4-1.4.20.inc        |    3 +
 ...-Fix-some-g-Wsystem-headers-warnings.patch |  135 ++
 ...pilation-error-on-macOS-with-fortify.patch |  126 ++
 ...23-qualifier-generic-fns-like-strchr.patch |  194 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    2 +-
 ...est_cmd_line.test_non_interactive_ou.patch |   31 +
 ...{python3_3.13.11.bb => python3_3.13.12.bb} |    3 +-
 ...ibarchive_3.8.5.bb => libarchive_3.8.6.bb} |    2 +-
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch |   50 +
 .../spir/spirv-tools_1.4.328.1.bb             |    3 +-
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch |   55 +
 .../virglrenderer/virglrenderer_1.1.1.bb      |    1 +
 .../0001-Fix-discarded-const-qualifiers.patch |   83 +
 meta/recipes-kernel/dtc/dtc_1.7.2.bb          |    1 +
 .../{libpng_1.6.55.bb => libpng_1.6.56.bb}    |    2 +-
 ...unner_2.4.5.1.bb => ptest-runner_2.5.1.bb} |    5 +-
 .../sqlite/files/CVE-2025-70873.patch         |   33 +
 meta/recipes-support/sqlite/sqlite3_3.48.0.bb |    1 +
 .../vim/files/CVE-2026-28418.patch            |   78 +
 .../vim/files/CVE-2026-28419.patch            |   86 +
 .../vim/files/CVE-2026-33412.patch            |   61 +
 meta/recipes-support/vim/vim.inc              |    3 +
 scripts/combo-layer.conf.example              |    4 +-
 scripts/contrib/patchtest.sh                  |    4 +-
 scripts/install-buildtools                    |    4 +-
 scripts/lib/recipetool/create.py              |    2 +-
 scripts/yocto_testresults_query.py            |    2 +-
 88 files changed, 4322 insertions(+), 1108 deletions(-)
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
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-128377-Skip-test_cmd_line.test_non_interactive_ou.patch
 rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.13.12.bb} (99%)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (96%)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.55.bb => libpng_1.6.56.bb} (97%)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.1.bb => ptest-runner_2.5.1.bb} (93%)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch


