Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791A9FF886D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 21:06:12 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2893.1777410368583705524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 14:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PT7AsX0R;
 spf=pass (domain: smile.fr, ip: 209.85.208.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso16318357a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777410367; x=1778015167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewxsanOytoMy3CMvcqUMgOgKXoUEkyiNs6O2985MiUI=;
        b=PT7AsX0Rj9NASp6RIN50I95VVepDTu5INnO9DMfDKVoPDnC7WCIAcGaQ0RdAmNkX2i
         vJ91CEjsFPdunqvyS6KFZ4AKqxXHZaIaaHsjVLWL0ouYWv/cv1iLNW6YDuPd97AEv9kN
         +RFCdikQhG/zmQszRPEQnj4b5Vlj9GDDSIO2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777410367; x=1778015167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewxsanOytoMy3CMvcqUMgOgKXoUEkyiNs6O2985MiUI=;
        b=rQQ+Py+wV4qBJUb1deFD8oMEAEPrhAUj8W8930vSoFUBlLMq/DBgKbk0TskDYAJwPH
         1NL/DWgC1RshyS5P/nlZAdzySTyCBZwHxtCPoTtPEyjPLlBipH8sd5im/llNjV0UTpFp
         ZNNWDau/4AH8OAJ1hpdE8BZLDxE+NiTbQsZRsFJYdAYHu47413hB0+rT6eTDUftgS5Di
         mI9WGALjFGOup4hNi6HZPpgNkGzsxTbpE3POhxKWrgMAzm0+WniFohZTibTVfvIu6D27
         yF1Z+02zDfyoz8F5jMteUWHFwJvw8ClOc8lHgog9D38jxJCwFjy2USp2KKnw8D/iBwSg
         3KUA==
X-Gm-Message-State: AOJu0Yxq0RDq+dKjN1AZyzDXad1edo5U3wCorPRlJ8Mi8z0E5HIkYSZr
	vVqDdBfLLsqOphpjLUlG1o6ETPFy+C+EmwugIZ/GDtVP9l8VVi0Y2jPB0bL/9sFquROi6Mvi9SJ
	UWM9Cako=
X-Gm-Gg: AeBDiet6tXh2T8gyHn2doqLXMxisPHD9ZyPk1WdDI2z+pGp4DKxyO2++dxXKENZKhAl
	96dQAk1iqhaNHV80yufKlcc/imYOmObrEFPb4HGeCw3Rkx5eJt515oJj4jbX+TI1aDMIC5OfbFx
	a5qd5DFFf0AwS5i99ADIeHyoycVc6qtfXjZqHFJyzkmhGV4FEgVK1UsFv33FNb5jWWItLZrsuZg
	dl1t1bWIT/HxMDOLY685CbWig9D9DYodtdZjUQpvYO9+UFtcoCDJInT4aGuoXlU8Pg+uQU5G3eS
	FsWLMxc2vS1BhKFvJgiRDQwuKwskBMrbBTcbEj+oO+G2V/E3tZHQAf6JThnfhOVvl9/FxQAy/54
	VYgSYZesE+pWkyM9p6mR4J1LdzeTAepohdgNfBr5sKbAUxwTJp5an8ImyQFogVxw3hqVc0mwMMk
	AfL+P20poz+r6DAcubgExRsTRZnzAhCGxL0ekfgVLisEVd04CpKFofhzFmc0AjkM4wjsm3Z1Kgl
	ytCvUaN11hNKsjK0AaeMC4DCjSqFw1wdSPgcP/CWYTL4A2uhI4=
X-Received: by 2002:a05:6402:46c9:b0:672:8f26:8a91 with SMTP id 4fb4d7f45d1cf-679bb0637f1mr2347685a12.12.1777410366475;
        Tue, 28 Apr 2026 14:06:06 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-4509-99b4-a398-280a-6dff-ad32.rev.sfr.net. [2a02:8440:4509:99b4:a398:280a:6dff:ad32])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22166960sm51980a12.24.2026.04.28.14.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:06:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/66] Pull request (cover letter only)
Date: Tue, 28 Apr 2026 23:05:18 +0200
Message-ID: <cover.1777409223.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 21:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236073

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1777064068.git.yoann.congal@smile.fr/T/

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
  * The fix got merged on branch: https://git.openembedded.org/bitbake/commit/?h=2.8&id=b2404004135b669f8258c85c7b5aed4570a805c7

The following changes since commit 52380df998b3a8fe6a091f8547434a3231320a8e:

  build-appliance-image: Update to scarthgap head revision (2026-04-02 13:48:02 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

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


