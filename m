Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 00/30] Patch review
Date: Sun,  3 Jul 2022 09:35:35 -1000
Message-Id: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Please review this set of patches for kirkstone and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3856

The following changes since commit eea52e0c3d24c79464f4afdbc3c397e1cb982231:

  build-appliance-image: Update to kirkstone head revision (2022-06-29 07:48:24 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Ahmed Hossam (1):
  insane.bbclass: host-user-contaminated: Correct per package home path

Alexander Kanavin (3):
  wireless-regdb: upgrade 2022.04.08 -> 2022.06.06
  oeqa/sdk: drop the nativesdk-python 2.x test
  at: take tarballs from debian

David Bagonyi (1):
  sanity.bbclass: Add ftps to accepted URI protocols for mirrors sanity

Jose Quaresma (1):
  curl: backport openssl fix CN check error code

Kai Kang (1):
  glibc-tests: not clear BBCLASSEXTEND

Lee Chee Yang (1):
  ghostscript: fix CVE-2022-2085

Lucas Stach (1):
  perf: sort-pmuevents: really keep array terminators

Martin Jansa (1):
  wic: fix WicError message

Maxime Roussin-Bélanger (1):
  libffi: fix native build being not portable

Muhammad Hamza (1):
  initramfs-framework: move storage mounts to actual rootfs

Peter Bergin (1):
  rust: fix issue building cross-canadian tools for aarch64 on x86_64

Peter Kjellerstedt (1):
  base.bbclass: Correct the test for obsolete license exceptions

Pgowda (1):
  binutils : CVE-2019-1010204

Raju Kumar Pothuraju (1):
  kernel-uboot.bbclass: Use vmlinux.initramfs when
    INITRAMFS_IMAGE_BUNDLE set

Richard Purdie (8):
  unzip: Port debian fixes for two CVEs
  cve-extra-exclusions: Clean up and ignore three CVEs (2xqemu and nasm)
  vim: 8.2.5083 -> 9.0.0005
  openssl: Upgrade 3.0.3 -> 3.0.4
  coreutils: Tweak packaging variable names for coreutils-dev
  oeqa/runtime/scp: Disable scp test for dropbear
  packagegroup-core-ssh-dropbear: Add openssh-sftp-server recommendation
  oe-selftest-image: Ensure the image has sftp as well as dropbear

Ross Burton (3):
  cups: ignore CVE-2022-26691
  busybox: fix CVE-2022-30065
  cve-check: hook cleanup to the BuildCompleted event, not CookerExit

Steve Sakoman (2):
  openssh: break dependency on base package for -dev package
  dropbear: break dependency on base package for -dev package

Thomas Roos (1):
  recipetool/devtool: Fix python egg whitespace issues in PACKAGECONFIG

 .../recipes-test/images/oe-selftest-image.bb  |  2 +-
 meta/classes/base.bbclass                     |  4 +-
 meta/classes/cve-check.bbclass                |  2 +-
 meta/classes/insane.bbclass                   |  2 +-
 meta/classes/kernel-uboot.bbclass             |  6 ++
 meta/classes/sanity.bbclass                   |  2 +-
 .../distro/include/cve-extra-exclusions.inc   | 30 +++++-----
 meta/lib/oeqa/runtime/cases/scp.py            |  2 +-
 meta/lib/oeqa/sdk/cases/python.py             | 11 ----
 meta/lib/oeqa/selftest/cases/devtool.py       | 15 ++++-
 .../openssh/openssh_8.9p1.bb                  |  5 ++
 ...1-Configure-do-not-tweak-mips-cflags.patch | 10 ++--
 ...sysroot-and-debug-prefix-map-from-co.patch | 20 +++----
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch | 55 -------------------
 .../openssl/openssl/afalg.patch               | 10 ++--
 .../{openssl_3.0.3.bb => openssl_3.0.4.bb}    |  3 +-
 .../busybox/busybox/CVE-2022-30065.patch      | 29 ++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
 meta/recipes-core/coreutils/coreutils_9.0.bb  |  3 +-
 meta/recipes-core/dropbear/dropbear.inc       |  5 ++
 meta/recipes-core/glibc/glibc-tests_2.35.bb   |  5 +-
 .../initrdscripts/initramfs-framework/finish  |  9 +++
 .../packagegroup-core-ssh-dropbear.bb         |  1 +
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0014-CVE-2019-1010204.patch      | 49 +++++++++++++++++
 meta/recipes-devtools/rust/rust-common.inc    |  5 +-
 meta/recipes-extended/at/at_3.2.5.bb          |  2 +-
 meta/recipes-extended/cups/cups.inc           |  2 +
 .../ghostscript/CVE-2022-2085.patch           | 44 +++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 .../unzip/unzip/CVE-2022-0529.patch           | 39 +++++++++++++
 .../unzip/unzip/CVE-2022-0530.patch           | 33 +++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  2 +
 .../perf/perf/sort-pmuevents.py               |  5 +-
 ....04.08.bb => wireless-regdb_2022.06.06.bb} |  2 +-
 ...0001-openssl-fix-CN-check-error-code.patch | 38 +++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 meta/recipes-support/libffi/libffi_3.4.2.bb   |  2 +-
 .../vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb}  |  0
 meta/recipes-support/vim/vim.inc              |  6 +-
 .../vim/{vim_8.2.bb => vim_9.0.bb}            |  0
 .../lib/recipetool/create_buildsys_python.py  | 13 +++++
 scripts/wic                                   |  2 +-
 43 files changed, 353 insertions(+), 126 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.3.bb => openssl_3.0.4.bb} (98%)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-30065.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0530.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} (94%)
 create mode 100644 meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch
 rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)

-- 
2.25.1

