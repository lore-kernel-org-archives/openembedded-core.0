Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 00/28] Patch review
Date: Tue, 23 Aug 2022 12:35:12 -1000
Message-Id: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4121

with the exception of a known autobuilder intermittent issue on qemux86-64-ltp:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14789

which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/3699

The following changes since commit 10891d4d955f347c328cf8c099031f05f5c855a2:

  lttng-modules: replace mips compaction fix with upstream change (2022-08-17 04:55:49 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (9):
  bluez5: update 5.64 -> 5.65
  libwpe: upgrade 1.12.0 -> 1.12.2
  ell: upgrade 0.49 -> 0.50
  iso-codes: upgrade 4.10.0 -> 4.11.0
  libcap: upgrade 2.64 -> 2.65
  libwebp: upgrade 1.2.2 -> 1.2.3
  mobile-broadband-provider-info: upgrade 20220511 -> 20220725
  webkitgtk: upgrade 2.36.4 -> 2.36.5
  weston: upgrade 10.0.1 -> 10.0.2

Beniamin Sandu (1):
  libpam: use /run instead of /var/run in systemd tmpfiles

Changqing Li (1):
  apt: fix nativesdk-apt build failure during the second time build

Daiane Angolini (1):
  python3-pip: Fix RDEPENDS after the update

Ernst Sjöstrand (1):
  cve-check: Don't use f-strings

Hitendra Prajapati (1):
  libtiff: CVE-2022-34526 A stack overflow was discovered

Jose Quaresma (2):
  archiver.bbclass: some recipes that uses the kernelsrc bbclass uses
    the shared source
  linux-yocto: prepend the the value with a space when append to
    KERNEL_EXTRA_ARGS

Kai Kang (1):
  packagegroup-self-hosted: update for strace

Khem Raj (4):
  libxml2: Ignore CVE-2016-3709
  connman: Backports for security fixes
  cracklib: Drop using register keyword
  tcp-wrappers: Fix implicit-function-declaration warnings

Peter Marko (1):
  create-spdx: handle links to inaccessible locations

Richard Purdie (1):
  perf: Fix reproducibility issues with 5.19 onwards

Sakib Sajal (3):
  u-boot: fix CVE-2022-30552
  u-boot: fix CVE-2022-33967
  go: update v1.17.12 -> v1.17.13

Yongxin Liu (1):
  grub2: fix several CVEs

wangmy (1):
  libcap: upgrade 2.63 -> 2.64

 meta/classes/archiver.bbclass                 |   4 +-
 meta/classes/create-spdx.bbclass              |   2 +-
 meta/lib/oe/cve_check.py                      |   2 +-
 ...g-Drop-greyscale-support-to-fix-heap.patch | 179 +++++
 ...ng-Avoid-heap-OOB-R-W-inserting-huff.patch |  50 ++
 ...peg-Block-int-underflow-wild-pointer.patch |  84 +++
 ...3-net-ip-Do-IP-fragment-maths-safely.patch |  63 ++
 ...or-out-on-headers-with-LF-without-CR.patch |  58 ++
 ...Fix-OOB-write-for-split-http-headers.patch |  56 ++
 ...ct-non-kernel-files-in-the-shim_lock.patch | 111 +++
 .../video-Remove-trailing-whitespaces.patch   | 693 ++++++++++++++++++
 ...eg-Abort-sooner-if-a-read-operation-.patch | 264 +++++++
 ...eg-Refuse-to-handle-multiple-start-o.patch |  53 ++
 meta/recipes-bsp/grub/grub2.inc               |  10 +
 ...s-squashfs-Use-kcalloc-when-relevant.patch |  64 ++
 ...e-minimum-IP-fragmented-datagram-siz.patch | 207 ++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   2 +
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 -
 .../bluez5/bluez5/fix_service.patch           |  30 -
 .../bluez5/{bluez5_5.64.bb => bluez5_5.65.bb} |   2 +-
 .../connman/connman/CVE-2022-32292.patch      |  37 +
 .../connman/connman/CVE-2022-32293_p1.patch   | 141 ++++
 .../connman/connman/CVE-2022-32293_p2.patch   | 174 +++++
 .../connman/connman_1.41.bb                   |   3 +
 .../mobile-broadband-provider-info_git.bb     |   4 +-
 .../ell/{ell_0.49.bb => ell_0.50.bb}          |   2 +-
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   4 +
 .../packagegroups/packagegroup-self-hosted.bb |   5 +-
 meta/recipes-devtools/apt/apt_2.4.5.bb        |   2 +-
 .../go/{go-1.17.12.inc => go-1.17.13.inc}     |   2 +-
 ...1.17.12.bb => go-binary-native_1.17.13.bb} |   4 +-
 ....17.12.bb => go-cross-canadian_1.17.13.bb} |   0
 ...o-cross_1.17.12.bb => go-cross_1.17.13.bb} |   0
 ...ssdk_1.17.12.bb => go-crosssdk_1.17.13.bb} |   0
 ...native_1.17.12.bb => go-native_1.17.13.bb} |   0
 ...ntime_1.17.12.bb => go-runtime_1.17.13.bb} |   0
 .../go/{go_1.17.12.bb => go_1.17.13.bb}       |   0
 .../python/python3-pip_22.0.3.bb              |   2 +
 ...01-rules-Drop-using-register-keyword.patch | 278 +++++++
 ...rrect-parameter-types-to-Debug-calls.patch |  40 +
 .../cracklib/cracklib_2.9.7.bb                |   5 +-
 meta/recipes-extended/pam/libpam/99_pam       |   2 +-
 ...plicit-function-declaration-warnings.patch | 109 +++
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |   1 +
 .../weston/dont-use-plane-add-prop.patch      |  32 -
 .../{weston_10.0.1.bb => weston_10.0.2.bb}    |   4 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   2 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 .../libtiff/tiff/CVE-2022-34526.patch         |  29 +
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 .../{libwebp_1.2.2.bb => libwebp_1.2.3.bb}    |   2 +-
 ...ure-due-to-libc-using-libc-functions.patch |  42 ++
 .../{libwpe_1.12.0.bb => libwpe_1.12.2.bb}    |   6 +-
 ...ebkitgtk_2.36.4.bb => webkitgtk_2.36.5.bb} |   2 +-
 ...so-codes_4.10.0.bb => iso-codes_4.11.0.bb} |   2 +-
 ...-Raise-the-size-of-arrays-containing.patch |   2 +-
 .../libcap/{libcap_2.63.bb => libcap_2.65.bb} |   2 +-
 57 files changed, 2789 insertions(+), 89 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
 create mode 100644 meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch
 create mode 100644 meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
 create mode 100644 meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-Use-kcalloc-when-relevant.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/fix_service.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.64.bb => bluez5_5.65.bb} (95%)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293_p1.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32293_p2.patch
 rename meta/recipes-core/ell/{ell_0.49.bb => ell_0.50.bb} (89%)
 rename meta/recipes-devtools/go/{go-1.17.12.inc => go-1.17.13.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.12.bb => go-binary-native_1.17.13.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.12.bb => go-cross-canadian_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.12.bb => go-cross_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.12.bb => go-crosssdk_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.12.bb => go-native_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.12.bb => go-runtime_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.12.bb => go_1.17.13.bb} (100%)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-implicit-function-declaration-warnings.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
 rename meta/recipes-graphics/wayland/{weston_10.0.1.bb => weston_10.0.2.bb} (97%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch
 rename meta/recipes-multimedia/webp/{libwebp_1.2.2.bb => libwebp_1.2.3.bb} (95%)
 create mode 100644 meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
 rename meta/recipes-sato/webkit/{libwpe_1.12.0.bb => libwpe_1.12.2.bb} (72%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.4.bb => webkitgtk_2.36.5.bb} (98%)
 rename meta/recipes-support/iso-codes/{iso-codes_4.10.0.bb => iso-codes_4.11.0.bb} (94%)
 rename meta/recipes-support/libcap/{libcap_2.63.bb => libcap_2.65.bb} (96%)

-- 
2.25.1

