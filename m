Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBC679B55
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:44:41 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4704FFF804;
	Sat,  3 Nov 2018 16:44:40 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:02 -0700
Message-Id: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
Subject: [rocko][PATCH 00/25] Backport openssl 1.0.2p and 1.1.0i
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
X-List-Received-Date: Sat, 03 Nov 2018 16:44:42 -0000

Backport openssl updates from sumo to rocko. Because of the many
cleanups done on these recipes, those patches are backported as well.

Alexander Kanavin (1):
  openssl: fix upstream version check for 1.0 version

Andre McCurdy (19):
  openssl_1.1: avoid using += with an over-ride
  openssl_1.1: minor recipe formatting tweaks etc
  openssl_1.0: merge openssl10.inc into the openssl_1.0.2o.bb recipe
  openssl_1.0: minor recipe formatting tweaks etc
  openssl_1.0: drop curly brackets from shell local variables
  openssl_1.0: fix cryptodev-linux PACKAGECONFIG support
  openssl_1.0: drop leading "-" from no-ssl3 config option
  openssl_1.0: avoid running make twice for target do_compile()
  openssl: remove uclibc remnants
  openssl: support musl-x32 build
  openssl: minor indent fixes
  openssl_1.0: drop obsolete ca.patch
  openssl_1.0: drop obsolete exporting of AS, EX_LIBS and DIRS
  openssl_1.0: drop unmaintained darwin support
  openssl_1.0: add PACKAGECONFIG option to control manpages
  openssl_1.0: squash whitespace in CC_INFO
  openssl: fix missing dependency on hostperl-runtime-native
  openssl_1.0: drop unnecessary dependency on makedepend-native
  openssl_1.0: drop unnecessary call to perlpath.pl from do_configure()

Andrej Valek (3):
  openssl-1.1: fix c_rehash perl errors
  openssl: update 1.0.2o -> 1.0.2p
  openssl: update 1.1.0h -> 1.1.0i

Ovidiu Panait (1):
  openssl-nativesdk: Fix "can't open config file" warning

Ross Burton (1):
  openssl: disable ccache usage

 .../openssl/openssl-1.0.2o/debian/ca.patch    |  22 ---
 .../openssl/openssl-1.0.2o/find.pl            |  54 -----
 .../openssl-util-perlpath.pl-cwd.patch        |  34 ----
 ...-with-clang-using-external-assembler.patch |   0
 .../0001-allow-manpages-to-be-disabled.patch  |  31 +++
 ...l-force-soft-link-to-avoid-rare-race.patch |   0
 .../Makefiles-ptest.patch                     |  18 +-
 ...Use-SHA256-not-MD5-as-default-digest.patch |   0
 .../configure-musl-target.patch               |   0
 .../configure-targets.patch                   |   0
 .../debian/c_rehash-compat.patch              |   0
 .../debian/debian-targets.patch               |   0
 .../debian/man-dir.patch                      |   0
 .../debian/man-section.patch                  |   0
 .../debian/no-rpath.patch                     |   0
 .../debian/no-symbolic.patch                  |   0
 .../debian/pic.patch                          |   0
 .../debian1.0.2/block_digicert_malaysia.patch |   0
 .../debian1.0.2/block_diginotar.patch         |   0
 .../debian1.0.2/soname.patch                  |   0
 .../debian1.0.2/version-script.patch          |   0
 .../engines-install-in-libdir-ssl.patch       |   0
 .../oe-ldflags.patch                          |   0
 .../openssl-c_rehash.sh                       |   0
 .../openssl-fix-des.pod-error.patch           |   0
 .../openssl_fix_for_x32.patch                 |   0
 .../parallel.patch                            |  40 ++--
 .../ptest-deps.patch                          |   0
 .../ptest_makefile_deps.patch                 |   0
 .../reproducible-cflags.patch                 |   0
 .../reproducible-mkbuildinf.patch             |   0
 .../run-ptest                                 |   0
 .../shared-libs.patch                         |   0
 .../openssl/openssl/environment.d-openssl.sh  |   1 +
 .../openssl/openssl_1.0.2o.bb                 |  64 ------
 .../{openssl10.inc => openssl_1.0.2p.bb}      | 185 ++++++++++++------
 .../{openssl_1.1.0h.bb => openssl_1.1.0i.bb}  | 117 ++++++-----
 37 files changed, 243 insertions(+), 323 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-allow-manpages-to-be-disabled.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/Makefiles-ptest.patch (87%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/parallel.patch (92%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/reproducible-cflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/reproducible-mkbuildinf.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/shared-libs.patch (100%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
 rename meta/recipes-connectivity/openssl/{openssl10.inc => openssl_1.0.2p.bb} (61%)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.0h.bb => openssl_1.1.0i.bb} (51%)

-- 
2.18.1


