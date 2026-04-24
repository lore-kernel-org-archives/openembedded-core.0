Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E475FED3FA
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:40 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32569.1777064199505952327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=4BtXmXg5;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso64687265e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064198; x=1777668998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWmT1rSrAVkz10oIjlq9r3L6dssCAROIv/3k838iN4o=;
        b=4BtXmXg5iN1Eotf3kINWd32pcAXsgSYTIEc8VYcV7YUmyPluYhOgFNKnpYBe/EAtII
         Py8BV9DEnMv7Cz66SgLhU/6AkrQyZZxCVvNHG8oOzv5lUlFn4NXv0RqhuSZ5wMIvhWJS
         3yrmvApIqsGNHhYHW19qPDP76TSH3z/ASaKCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064198; x=1777668998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWmT1rSrAVkz10oIjlq9r3L6dssCAROIv/3k838iN4o=;
        b=qVE9t6Xn9lBfCpR9+SoHCrykxY/SWv6n1y2pCg1VCd5T5ENtUT4RbxfFdKXmlFaniE
         lrX0tocVwmBRrNAvR2C6BPsdvyWlZZcW9lLda7oKInZy+xmkA49wAd9gL9k5pPdLD6nj
         3I/HmtM2cFZ9TRxgmv1u3sEpLoVzIuM4E/mmLBrgvtbCuprUh2y2tB6ylWPXCnZpjyv+
         9ryHlxZQV4yHyZ2IXxMbp8U4Ty4SOrl8KSbsa4u537oaY1+LPiYzmHJ6luST2QU6MYiU
         EMPOHMsf/I0lPm5sm+NX6OOtb4uOA5Y+KzjHrzqjpH6Lxsqoz19Y3XL7I7Kpqsocgd07
         YHGQ==
X-Gm-Message-State: AOJu0Yxqgohk913qpxo8V5XFYporVEIQyS1yIB2Eg9entqi7HxkqReVz
	WX9WKidFHYk8KLWRM8uoEvYdsIeCCqGxJRqJ91W3ZxrX8q/YECROLlxby6rZscpB/5nO4KPhzHd
	QYjbI52MoA5uk
X-Gm-Gg: AeBDies9stpD9khX5gpYcBu0ehYi4llkb2uXVhZd1lFDP3tCR16NB1TAV0L5tZkBE/g
	M5qlzQgLvFUr7eI7aae+vYJIVRd8S2INqqq68bT4orMi6IiT3MXBVxWsyS9+9gxJwQAF5IWKIZw
	CdmUx+Cpx+PgR+QwX9grGQq8HTZNLdKgRtame37DUvfaCQKKQtRfUozT6Ug+uW1nn+avD0UWEjh
	sfk5CfNIhxksLhB7dmvJMKslVyb70maScn0D/zxAbAQ+iToqS8jtqoAIitwuAukUhxEeqbBPelA
	p2t/wEniZcQaqLM5CtkDCDVnz961o4RMr8seXEZEp0CBJaQH347Uo4SnZhdHxzl8Y2gLy4C163q
	DzeONF5bHJvY7Zn9r+8TlLRFDJ4cs6kJvYP3s9yjRxHPsZfYfK7Q5UgzPcH0ixvWndM9mpo/+le
	KPftGACR4YxqOHAJyfBxy1Fs2R65vIUojO5kZG1xpwaWwoMdYZW2gQTChdwuV76pnkIhF8g5qcf
	N/MSY4kvrF8VH6Bqv6eDyPiYbGQwIixu/fWeQ+PIZ6TLCl0
X-Received: by 2002:a05:600c:154e:b0:488:aa3d:faca with SMTP id 5b1f17b1804b1-488fb771a4emr413631235e9.18.1777064197256;
        Fri, 24 Apr 2026 13:56:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/66] Patch review
Date: Fri, 24 Apr 2026 22:54:59 +0200
Message-ID: <cover.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235873

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, April 28.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3732
But got impacted by 2 intermittent failures:
* qemuarm64-ptest failed with a python3 ptest failure
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3558
  * I reported the (new) issue in:
    #16267 – [scarthgap] AB-INT PTEST: python3 failure (test_wrong_cert_tls13)
    https://bugzilla.yoctoproject.org/show_bug.cgi?id=16267
  * successfuly retried as https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3559
* oe-selftest-armhost failed to download Rust crates from crates.io in bitbake selftest
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/3835
  * This bitbake commit did pass in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/23/builds/3814
  * This is a really recent issue (it also impacted the 6.0 release build)

The following changes since commit 52380df998b3a8fe6a091f8547434a3231320a8e:

  build-appliance-image: Update to scarthgap head revision (2026-04-02 13:48:02 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to dc2df90b1d4f71023169d492f3819326e0e6c055:

  liburcu: upgrade 0.14.0 -> 0.14.2 (2026-04-24 16:06:21 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed

Alexander Kanavin (2):
  selftest/minidebuginfo: extract files from tar archive using tarfile
    module
  selftest/gdbserver: replace shutil.unpack_archive with tarfile extract

Andrej Kozemcak (1):
  ca-certificates: upgrade 20250419 -> 20260223

Anil Dongare (3):
  vim: Fix CVE-2026-25749
  vim: Fix CVE-2026-26269
  nghttp2: Fix CVE-2026-27135

Bruce Ashfield (1):
  kernel-devsrc: make tools/Build optional

Daniel Turull (5):
  base-passwd: upgrade 3.6.3 -> 3.6.8
  sudo: upgrade 1.9.17p1 -> 1.9.17p2
  lttng-ust: upgrade 2.13.8 -> 2.13.10
  libatomic-ops: upgrade 7.8.2 -> 7.8.4
  liburcu: upgrade 0.14.0 -> 0.14.2

Guocai He (2):
  python3-wheel: fix CVE-2026-24049
  gnupg: fix CVE-2026-24882

Hemanth Kumar M D (2):
  unfs3: Fix race issue causing a glibc test hang
  libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43

Hitendra Prajapati (5):
  ncurses: fix for CVE-2025-69720
  busybox: fix for CVE-2026-26157, CVE-2026-26158
  vim: Fix CVE-2026-33412
  vim: Fix CVE-2026-28418
  vim: Fix CVE-2026-28419

Jiaying Song (1):
  python3-pyasn1: fix CVE-2026-23490

Jinfeng Wang (1):
  tzdata/tzcode-native: upgrade 2025c -> 2026a

João Marcos Costa (Schneider Electric) (3):
  spdx30_tasks: fix condition in create_spdx
  linux/generate-cve-exclusions: backport script from master branch
  linux-yocto/6.6: update CVE exclusions (6.6.123)

Khem Raj (5):
  virglrenderer: Fix build with glibc 2.43+
  libxcrypt: Fix build wrt C23 support
  libxcrypt: Use configure knob to disable warnings as errors
  db: Pin to use C99 std
  apt: Fix build with GCC 15

Li Wang (1):
  ltp: fix epoll_ctl04 failed

Martin Jansa (9):
  mesa: fix build on host with glibc-2.43
  cmake: backport a fix for gcc-16 on host
  gcc: backport a fix for building with gcc-16
  spirv-tools: backport a fix for building with gcc-16
  ovmf: backport a fix for build with gcc-16
  dbus: use ${PN} in pkg_postinst instead of 'dbus'
  dtc: backport fix for build with glibc-2.43
  elfutils: don't add -Werror to avoid discarded-qualifiers
  binutils: backport patch to fix build with glibc-2.43 on host

Michael Halstead (2):
  yocto-uninative: Update to 5.0 for needed patchelf updates
  yocto-uninative: Update to 5.1 for glibc 2.43

Mingli Yu (1):
  libxml2: Fix CVE-2026-1757

Peter Marko (1):
  openssl: upgrade 3.5.5 -> 3.5.6

Richard Purdie (4):
  selftest/scripts: Update old git protocol references
  pseudo: Add fix for glibc 2.43
  lib/oeqa/utils/httpserver: use multiprocessing from bb
  archiver: Don't try to preserve all attributes when copying files

Ross Burton (1):
  tcl: skip http11 tests

Sunil Dora (1):
  license.py: Drop visit_Str from SeenVisitor in selftest

Vijay Anusuri (6):
  libarchive: Fix CVE-2026-4111
  curl: patch CVE-2026-1965
  curl: patch CVE-2026-3783
  curl: patch CVE-2026-3784
  sqlite3: Fix CVE-2025-70873
  python3: upgrade 3.12.12 -> 3.12.13

Yoann Congal (7):
  build-appliance-image: switch SRC_URI to https protocol
  scripts: Default to https git protocol for YP/OE repos
  oeqa/selftest/git-submodule-test: Default to https git protocol for
    YP/OE repos
  meta/files/layers.example.json: switch to https clone URIs
  oeqa/sdk: Default to https git protocol for YP/OE repos
  texinfo: Backport patches for hosts with newer GCC
  qemu: backport patches to support python 3.14

Zhang Peng (1):
  gi-docgen: fix CVE-2025-11687

 .../devtool/devtool-upgrade-test2_git.bb      |     2 +-
 .../devtool-upgrade-test2_git.bb.upgraded     |     2 +-
 .../git-submodule-test/git-submodule-test.bb  |     4 +-
 meta/classes/archiver.bbclass                 |     2 +-
 meta/conf/distro/include/yocto-uninative.inc  |    10 +-
 meta/files/layers.example.json                |     4 +-
 meta/lib/oe/spdx30_tasks.py                   |     2 +-
 .../oeqa/sdk/buildtools-docs-cases/build.py   |     2 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |     4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |     4 +-
 meta/lib/oeqa/selftest/cases/externalsrc.py   |     2 +-
 meta/lib/oeqa/selftest/cases/gdbserver.py     |     4 +-
 .../oeqa/selftest/cases/gitarchivetests.py    |     2 +-
 meta/lib/oeqa/selftest/cases/minidebuginfo.py |     7 +-
 meta/lib/oeqa/selftest/cases/oelib/license.py |     4 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |     2 +-
 .../cases/yoctotestresultsquerytests.py       |     2 +-
 meta/lib/oeqa/utils/httpserver.py             |     2 +-
 ...sysroot-and-debug-prefix-map-from-co.patch |     2 +-
 .../{openssl_3.5.5.bb => openssl_3.5.6.bb}    |     2 +-
 .../0001-Add-a-shutdown-group.patch           |     6 +-
 .../0001-base-passwd-Add-the-sgx-group.patch  |     4 +-
 ...nstead-of-bin-bash-for-the-root-user.patch |     4 +-
 ...t-since-we-do-not-have-an-etc-shadow.patch |     4 +-
 ...nput-group-for-the-dev-input-devices.patch |     4 +-
 .../base-passwd/0005-Add-kvm-group.patch      |     6 +-
 .../base-passwd/0007-Add-wheel-group.patch    |    18 +-
 ...e-passwd_3.6.3.bb => base-passwd_3.6.8.bb} |     2 +-
 .../CVE-2026-26157-CVE-2026-26158-01.patch    |   198 +
 .../CVE-2026-26157-CVE-2026-26158-02.patch    |    37 +
 meta/recipes-core/busybox/busybox_1.36.1.bb   |     2 +
 meta/recipes-core/dbus/dbus_1.14.10.bb        |     2 +-
 .../images/build-appliance-image_15.0.0.bb    |     2 +-
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch |    29 +
 meta/recipes-core/libxcrypt/libxcrypt.inc     |     9 +-
 .../libxml/libxml2/CVE-2026-1757.patch        |    49 +
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |     1 +
 .../ncurses/files/CVE-2025-69720.patch        |    42 +
 meta/recipes-core/ncurses/ncurses_6.4.bb      |     1 +
 ...Tools-StringFuncs-fix-gcc-16-warning.patch |    42 +
 ...aseTools-EfiRom-fix-compiler-warning.patch |    44 +
 .../0008-BaseTools-Pccts-set-C-standard.patch |    44 +
 meta/recipes-core/ovmf/ovmf_git.bb            |     3 +
 ...l-Add-missing-include-cstdint-gcc-15.patch |    26 +
 meta/recipes-devtools/apt/apt_2.6.1.bb        |     1 +
 .../binutils/binutils-2.42.inc                |     3 +
 ...tect-against-standard-library-macros.patch |    31 +
 .../cmake/cmake-native_3.28.3.bb              |     1 +
 ...mpilation-with-gcc-16-devirtualizati.patch |    36 +
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |     4 +-
 .../elfutils/elfutils_0.191.bb                |     1 +
 ...001-config-eu.am-do-not-force-Werror.patch |    34 +
 meta/recipes-devtools/gcc/gcc-13.4.inc        |     3 +
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch |   257 +
 ...build-Remove-INCLUDE_MEMORY-PR117737.patch |    46 +
 ...am-include-above-safe-ctype.h-PR1177.patch |    54 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |     2 +-
 .../recipes-devtools/python/python-pyasn1.inc |     3 +-
 .../python3-pyasn1/CVE-2026-23490.patch       |   136 +
 .../python/python3-wheel/CVE-2026-24049.patch |    73 +
 .../python/python3-wheel_0.42.0.bb            |     2 +
 .../python/python3/CVE-2025-12084.patch       |   144 -
 .../python/python3/CVE-2025-13836.patch       |   162 -
 .../python/python3/CVE-2025-13837.patch       |   162 -
 .../python/python3/CVE-2025-6075.patch        |   355 -
 ...{python3_3.12.12.bb => python3_3.12.13.bb} |     6 +-
 meta/recipes-devtools/qemu/qemu.inc           |     2 +
 ...Remove-deprecated-get_event_loop-cal.patch |    92 +
 ...avoid-creating-additional-event-loop.patch |   199 +
 meta/recipes-devtools/tcltk/tcl/run-ptest     |     3 +
 .../unfs3/unfs3/fixrace.patch                 |    38 +
 meta/recipes-devtools/unfs3/unfs3_git.bb      |     1 +
 .../libarchive/CVE-2026-4111-1.patch          |    32 +
 .../libarchive/CVE-2026-4111-2.patch          |   308 +
 .../libarchive/libarchive_3.7.9.bb            |     2 +
 ...l_ctl04-add-ELOOP-to-expected-errnos.patch |    49 +
 meta/recipes-extended/ltp/ltp_20240129.bb     |     1 +
 ...o.conf.in-fix-conflict-with-multilib.patch |     2 +-
 .../{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb}    |     2 +-
 ...strerror-definition-the-prototype-lo.patch |    27 +
 ...tion-CFunction-Remove-unused-typedef.patch |    27 +
 ...prototype-for-Info-command-functions.patch |   194 +
 .../texinfo/0004-Remove-VFunction.patch       |   217 +
 .../recipes-extended/texinfo/texinfo_7.0.3.bb |     4 +
 meta/recipes-extended/timezone/timezone.inc   |     6 +-
 .../gi-docgen/files/CVE-2025-11687.patch      |    90 +
 .../gi-docgen/gi-docgen_2023.3.bb             |     5 +-
 .../0001-c11-threads-fix-build-on-c23.patch   |    56 +
 meta/recipes-graphics/mesa/mesa.inc           |     1 +
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch |    50 +
 .../spir/spirv-tools_1.3.275.0.bb             |     4 +-
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch |    55 +
 .../virglrenderer/virglrenderer_1.0.1.bb      |     1 +
 .../0001-Fix-discarded-const-qualifiers.patch |    85 +
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |     1 +
 .../linux/cve-exclusion_6.6.inc               | 21144 +++++++++++++---
 .../linux/generate-cve-exclusions.py          |   122 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |     2 +-
 ...es-when-rpath-is-stripped-from-in-bu.patch |   161 -
 ...-common-link-with-liburcu-explicitly.patch |     3 +-
 ...Makefile.am-Add-install-lib-to-setup.patch |     3 +-
 ...tng-ust_2.13.8.bb => lttng-ust_2.13.10.bb} |     3 +-
 ...0250419.bb => ca-certificates_20260223.bb} |     2 +-
 .../curl/curl/CVE-2026-1965-1.patch           |   102 +
 .../curl/curl/CVE-2026-1965-2.patch           |    34 +
 .../curl/curl/CVE-2026-3783.patch             |   153 +
 .../curl/curl/CVE-2026-3784.patch             |    77 +
 meta/recipes-support/curl/curl_8.7.1.bb       |     4 +
 .../db/0001-Fix-implicit-int-warnings.patch   |   106 +
 meta/recipes-support/db/db_5.3.28.bb          |     9 +-
 .../gnupg/gnupg/CVE-2026-24882-0001.patch     |    70 +
 .../gnupg/gnupg/CVE-2026-24882-0002.patch     |    47 +
 meta/recipes-support/gnupg/gnupg_2.4.8.bb     |     2 +
 ...ic-ops_7.8.2.bb => libatomic-ops_7.8.4.bb} |     2 +-
 .../{liburcu_0.14.0.bb => liburcu_0.14.2.bb}  |     2 +-
 .../nghttp2/nghttp2/CVE-2026-27135.patch      |   110 +
 .../recipes-support/nghttp2/nghttp2_1.61.0.bb |     4 +-
 .../sqlite/sqlite3/CVE-2025-70873.patch       |    33 +
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |     1 +
 .../vim/files/CVE-2026-25749.patch            |    64 +
 .../vim/files/CVE-2026-26269.patch            |   150 +
 .../vim/files/CVE-2026-28418.patch            |    78 +
 .../vim/files/CVE-2026-28419.patch            |    86 +
 .../vim/files/CVE-2026-33412.patch            |    61 +
 meta/recipes-support/vim/vim.inc              |     5 +
 scripts/combo-layer.conf.example              |     4 +-
 scripts/contrib/patchtest.sh                  |     4 +-
 scripts/yocto_testresults_query.py            |     2 +-
 128 files changed, 22015 insertions(+), 4349 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb => openssl_3.5.6.bb} (99%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.3.bb => base-passwd_3.6.8.bb} (98%)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-26157-CVE-2026-26158-02.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-1757.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0006-BaseTools-StringFuncs-fix-gcc-16-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0007-BaseTools-EfiRom-fix-compiler-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0008-BaseTools-Pccts-set-C-standard.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-protect-against-standard-library-macros.patch
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-libcody-Make-it-buildable-by-C-11-to-C-26.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0029-build-Remove-INCLUDE_MEMORY-PR117737.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-build-Move-sstream-include-above-safe-ctype.h-PR1177.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-23490.patch
 create mode 100644 meta/recipes-devtools/python/python3-wheel/CVE-2026-24049.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch
 rename meta/recipes-devtools/python/{python3_3.12.12.bb => python3_3.12.13.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-python-backport-Remove-deprecated-get_event_loop-cal.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-python-backport-avoid-creating-additional-event-loop.patch
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fixrace.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-epoll_ctl04-add-ELOOP-to-expected-errnos.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.17p1.bb => sudo_1.9.17p2.bb} (96%)
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0001-system.h-remove-strerror-definition-the-prototype-lo.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0002-info-info.h-Function-CFunction-Remove-unused-typedef.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0003-Use-explicit-prototype-for-Info-command-functions.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0004-Remove-VFunction.patch
 create mode 100644 meta/recipes-gnome/gi-docgen/files/CVE-2025-11687.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-examples-when-rpath-is-stripped-from-in-bu.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.8.bb => lttng-ust_2.13.10.bb} (92%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20250419.bb => ca-certificates_20260223.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
 create mode 100644 meta/recipes-support/db/db/0001-Fix-implicit-int-warnings.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.2.bb => libatomic-ops_7.8.4.bb} (89%)
 rename meta/recipes-support/liburcu/{liburcu_0.14.0.bb => liburcu_0.14.2.bb} (91%)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2026-27135.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-70873.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-26269.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28418.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28419.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch


