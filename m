Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A70D871AB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 14:13:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 10 May 2017 07:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,319,1491289200"; d="scan'208";a="1167201632"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2017 07:13:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 17:13:18 +0300
Message-Id: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [RFC PATCH 00/10] Add openssl 1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 May 2017 14:13:21 -0000

This patch series introduces the recipe for openssl 1.1 (openssl 1.0 is preserved
but renamed to openssl10), and does a few necessary adjustmenets and updates to other
recipes. The reason it's marked RFC is that there is one known remaining issue to
resolve: specifically, u-boot needs to be ported to 1.1 before this series can be
merged, otherwise there's a dependency conflict when building native u-boot. This
should be resolved quite soon, but it isn't yet (as of u-boot v2017.05).

Openssl 1.1 is an opt-out; it has the same recipe name as openssl 1.0 had, and so
all dependencies are compiled with it by default. If there's an API issue, please
fix it, or adjust the recipe to depend on 'openssl10' (which is a lesser solution,
and subject to openssl 1.0 eventually being removed from oe-core).

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 381897c64069ea43d595380a3ae913bcc79cf7e1:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/openssl-1.1
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/openssl-1.1

Alexander Kanavin (10):
  python: update to 3.5.3
  openssl: add a 1.1 version
  u-boot-mkimage: depend on openssl 1.0
  bind: fix upstream version check
  bind: update to 9.10.5
  openssh: depend on openssl 1.0
  apr-util: add support for openssl 1.1 via backported patch
  cryptodev-tests: depend on openssl 1.0
  mailx: depend on openssl 1.0
  gstreamer-plugins-bad: replace openssl dependency with nettle for hls
    plugin

 meta/conf/distro/include/no-static-libs.inc        |   3 +
 meta/conf/distro/include/security_flags.inc        |   2 +-
 meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb  |   2 +-
 ...0001-build-use-pkg-config-to-find-libxml2.patch |  14 +-
 ...=> 0001-confgen-don-t-build-unix.o-twice.patch} |  17 +-
 .../bind/bind/CVE-2016-1285.patch                  | 154 ----------
 .../bind/bind/CVE-2016-1286_1.patch                |  79 -----
 .../bind/bind/CVE-2016-1286_2.patch                | 317 ---------------------
 .../bind/bind/CVE-2016-2088.patch                  | 247 ----------------
 .../bind/bind/CVE-2016-2775.patch                  |  90 ------
 .../bind/bind/CVE-2016-2776.patch                  | 123 --------
 .../bind/bind/mips1-not-support-opcode.diff        | 104 -------
 .../bind/{bind_9.10.3-P3.bb => bind_9.10.5.bb}     |  27 +-
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb |   3 +-
 ...ve-test-that-requires-running-as-non-root.patch |  49 ++++
 ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 +++
 .../recipes-connectivity/openssl/openssl/run-ptest |   4 +-
 .../openssl/{openssl.inc => openssl10.inc}         |  14 +-
 ...build-with-clang-using-external-assembler.patch |   0
 .../{openssl => openssl10}/Makefiles-ptest.patch   |   0
 .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
 .../configure-musl-target.patch                    |   0
 .../{openssl => openssl10}/configure-targets.patch |   0
 .../debian/c_rehash-compat.patch                   |   0
 .../openssl/{openssl => openssl10}/debian/ca.patch |   0
 .../debian/debian-targets.patch                    |   0
 .../{openssl => openssl10}/debian/man-dir.patch    |   0
 .../debian/man-section.patch                       |   0
 .../{openssl => openssl10}/debian/no-rpath.patch   |   0
 .../debian/no-symbolic.patch                       |   0
 .../{openssl => openssl10}/debian/pic.patch        |   0
 .../debian/version-script.patch                    |   0
 .../debian1.0.2/block_digicert_malaysia.patch      |   0
 .../debian1.0.2/block_diginotar.patch              |   0
 .../debian1.0.2/version-script.patch               |   0
 .../engines-install-in-libdir-ssl.patch            |   0
 .../openssl/{openssl => openssl10}/find.pl         |   0
 .../fix-cipher-des-ede3-cfb1.patch                 |   0
 .../{openssl => openssl10}/oe-ldflags.patch        |   0
 .../openssl-1.0.2a-x32-asm.patch                   |   0
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |   0
 .../{openssl => openssl10}/openssl-c_rehash.sh     |   0
 .../openssl-fix-des.pod-error.patch                |   0
 .../openssl-util-perlpath.pl-cwd.patch             |   0
 .../openssl_fix_for_x32.patch                      |   0
 .../openssl/{openssl => openssl10}/parallel.patch  |   0
 .../{openssl => openssl10}/ptest-deps.patch        |   0
 .../ptest_makefile_deps.patch                      |   0
 .../openssl/openssl10/run-ptest                    |   2 +
 .../{openssl => openssl10}/shared-libs.patch       |   0
 .../{openssl_1.0.2k.bb => openssl10_1.0.2k.bb}     |   4 +-
 .../recipes-connectivity/openssl/openssl_1.1.0e.bb | 146 ++++++++++
 ...on3-native_3.5.2.bb => python3-native_3.5.3.bb} |   8 +-
 ...the-shell-version-of-python-config-that-w.patch |  10 +-
 ...pile.patch => 0001-cross-compile-support.patch} |  56 ++--
 .../python3/python3-fix-CVE-2016-1000110.patch     | 148 ----------
 .../python/python3/upstream-random-fixes.patch     | 288 +++++++++----------
 .../python/{python3_3.5.2.bb => python3_3.5.3.bb}  |   9 +-
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |   2 +-
 .../cryptodev/cryptodev-tests_1.8.bb               |   2 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   4 +-
 .../recipes-support/apr/apr-util/openssl-1.1.patch | 253 ++++++++++++++++
 meta/recipes-support/apr/apr-util_1.5.4.bb         |   1 +
 63 files changed, 732 insertions(+), 1493 deletions(-)
 rename meta/recipes-connectivity/bind/bind/{bind-confgen-build-unix.o-once.patch => 0001-confgen-don-t-build-unix.o-twice.patch} (80%)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.5.bb} (82%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
 mode change 100755 => 100644 meta/recipes-connectivity/openssl/openssl/run-ptest
 rename meta/recipes-connectivity/openssl/{openssl.inc => openssl10.inc} (95%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/Makefiles-ptest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/fix-cipher-des-ede3-cfb1.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-1.0.2a-x32-asm.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-util-perlpath.pl-cwd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/parallel.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/ptest_makefile_deps.patch (100%)
 create mode 100755 meta/recipes-connectivity/openssl/openssl10/run-ptest
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl10_1.0.2k.bb} (97%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.1.0e.bb
 rename meta/recipes-devtools/python/{python3-native_3.5.2.bb => python3-native_3.5.3.bb} (90%)
 rename meta/recipes-devtools/python/python3/{000-cross-compile.patch => 0001-cross-compile-support.patch} (65%)
 delete mode 100644 meta/recipes-devtools/python/python3/python3-fix-CVE-2016-1000110.patch
 rename meta/recipes-devtools/python/{python3_3.5.2.bb => python3_3.5.3.bb} (96%)
 create mode 100644 meta/recipes-support/apr/apr-util/openssl-1.1.patch

-- 
2.11.0


