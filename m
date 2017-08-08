Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 298F571975
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:34:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2017 08:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,343,1498546800"; d="scan'208";a="1001363524"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Aug 2017 08:34:16 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Aug 2017 18:30:47 +0300
Message-Id: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 0/4] Add openssl 1.1
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
X-List-Received-Date: Tue, 08 Aug 2017 15:34:16 -0000

This patch series introduces the recipe for openssl 1.1 (openssl 1.0 is preserved
but renamed to openssl10), and does a few necessary adjustmenets and updates to other
recipes.

Openssl 1.1 is an opt-out; it has the same recipe name as openssl 1.0 had, and so
all dependencies are compiled with it by default. If there's an API issue, please
fix it, or adjust the recipe to depend on 'openssl10' (which is a lesser solution,
and subject to openssl 1.0 eventually being removed from oe-core).

This iteration of the patchset fixes an issue with installing certificates
when building images; specifically a special version of c_rehash utility needs
to be used on build host.

The following changes since commit 621ca8b66c8f927713d98bc4d3cccc7a0f151e4b:

  ca-certificates: update to 20170717 (2017-08-08 18:24:06 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/openssl-1.1
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/openssl-1.1

Alexander Kanavin (4):
  openssl: add a 1.1 version
  openssh: depend on openssl 1.0
  cryptodev-tests: depend on openssl 1.0
  gstreamer-plugins-bad: replace openssl dependency with nettle for hls
    plugin

 meta/conf/distro/include/no-static-libs.inc        |   3 +
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |   3 +-
 ...ve-test-that-requires-running-as-non-root.patch |  49 +++++
 ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 ++++
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
 .../debian1.0.2/soname.patch                       |   0
 .../debian1.0.2/version-script.patch               |   0
 .../engines-install-in-libdir-ssl.patch            |   0
 .../openssl/{openssl => openssl10}/find.pl         |   0
 .../{openssl => openssl10}/oe-ldflags.patch        |   0
 .../openssl-1.0.2a-x32-asm.patch                   |   0
 .../openssl/openssl10/openssl-c_rehash.sh          | 222 +++++++++++++++++++++
 .../openssl-fix-des.pod-error.patch                |   0
 .../openssl-util-perlpath.pl-cwd.patch             |   0
 .../openssl_fix_for_x32.patch                      |   0
 .../openssl/{openssl => openssl10}/parallel.patch  |   0
 .../{openssl => openssl10}/ptest-deps.patch        |   0
 .../ptest_makefile_deps.patch                      |   0
 .../openssl/openssl10/run-ptest                    |   2 +
 .../{openssl => openssl10}/shared-libs.patch       |   0
 .../{openssl_1.0.2l.bb => openssl10_1.0.2l.bb}     |   4 +-
 .../recipes-connectivity/openssl/openssl_1.1.0f.bb | 155 ++++++++++++++
 .../cryptodev/cryptodev-tests_1.9.bb               |   2 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   4 +-
 41 files changed, 495 insertions(+), 10 deletions(-)
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
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-1.0.2a-x32-asm.patch (100%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-util-perlpath.pl-cwd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/parallel.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/ptest_makefile_deps.patch (100%)
 create mode 100755 meta/recipes-connectivity/openssl/openssl10/run-ptest
 rename meta/recipes-connectivity/openssl/{openssl => openssl10}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2l.bb => openssl10_1.0.2l.bb} (96%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.1.0f.bb

-- 
2.13.2


