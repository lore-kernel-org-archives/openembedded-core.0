Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB6478276
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 19:15:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Aug 2017 12:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,393,1498546800"; d="scan'208";a="891499519"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2017 12:15:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 22:12:29 +0300
Message-Id: <20170818191229.40235-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCHv2] openssl10: rename back to openssl and make it the default via PREFERRED_VERSION
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
X-List-Received-Date: Fri, 18 Aug 2017 19:15:57 -0000

openssl 1.1 broke 3rd party layers a lot more than was expected; let's flip
the switch at the start of next development cycle.

Add a PROVIDES = "openssl10" to openssl 1.0 recipe; any dependency that is
not compatible with 1.1 should use that in its DEPENDS, as the 1.0
recipe will later be renamed back to openssl10. This does not always work:
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/140957.html
but for many recipes it does.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/default-versions.inc                          | 3 +++
 .../0001-Fix-build-with-clang-using-external-assembler.patch           | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/Makefiles-ptest.patch        | 0
 .../Use-SHA256-not-MD5-as-default-digest.patch                         | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/configure-musl-target.patch  | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/configure-targets.patch      | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/c_rehash-compat.patch | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/ca.patch              | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/debian-targets.patch  | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/man-dir.patch         | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/man-section.patch     | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/no-rpath.patch        | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/no-symbolic.patch     | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/pic.patch             | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian/version-script.patch  | 0
 .../debian1.0.2/block_digicert_malaysia.patch                          | 0
 .../{openssl10 => openssl-1.0.2l}/debian1.0.2/block_diginotar.patch    | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/debian1.0.2/soname.patch     | 0
 .../{openssl10 => openssl-1.0.2l}/debian1.0.2/version-script.patch     | 0
 .../{openssl10 => openssl-1.0.2l}/engines-install-in-libdir-ssl.patch  | 0
 .../recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/find.pl | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/oe-ldflags.patch             | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/openssl-1.0.2a-x32-asm.patch | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/openssl-c_rehash.sh          | 0
 .../{openssl10 => openssl-1.0.2l}/openssl-fix-des.pod-error.patch      | 0
 .../{openssl10 => openssl-1.0.2l}/openssl-util-perlpath.pl-cwd.patch   | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/openssl_fix_for_x32.patch    | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/parallel.patch               | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/ptest-deps.patch             | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/ptest_makefile_deps.patch    | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/run-ptest                    | 0
 .../openssl/{openssl10 => openssl-1.0.2l}/shared-libs.patch            | 0
 meta/recipes-connectivity/openssl/openssl10.inc                        | 2 ++
 .../openssl/{openssl10_1.0.2l.bb => openssl_1.0.2l.bb}                 | 0
 34 files changed, 5 insertions(+)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/Makefiles-ptest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/openssl-1.0.2a-x32-asm.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/openssl-util-perlpath.pl-cwd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/parallel.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl10 => openssl-1.0.2l}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl10_1.0.2l.bb => openssl_1.0.2l.bb} (100%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index a6f331350eb..868073843af 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,3 +2,6 @@
 # Default preferred versions
 #
 
+PREFERRED_VERSION_openssl = "1.0.%"
+PREFERRED_VERSION_openssl-native = "1.0.%"
+PREFERRED_VERSION_nativesdk-openssl = "1.0.%"
diff --git a/meta/recipes-connectivity/openssl/openssl10/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-Fix-build-with-clang-using-external-assembler.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/Makefiles-ptest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/Makefiles-ptest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/Makefiles-ptest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/Use-SHA256-not-MD5-as-default-digest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/Use-SHA256-not-MD5-as-default-digest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/Use-SHA256-not-MD5-as-default-digest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-musl-target.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/configure-musl-target.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-musl-target.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_digicert_malaysia.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_digicert_malaysia.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_digicert_malaysia.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_diginotar.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_diginotar.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_diginotar.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/soname.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian1.0.2/soname.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/soname.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.2l/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/find.pl
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl10/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/openssl-1.0.2a-x32-asm.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-1.0.2a-x32-asm.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/openssl-1.0.2a-x32-asm.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-1.0.2a-x32-asm.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-c_rehash.sh
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-c_rehash.sh
diff --git a/meta/recipes-connectivity/openssl/openssl10/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-util-perlpath.pl-cwd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/openssl-util-perlpath.pl-cwd.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-util-perlpath.pl-cwd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/parallel.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/parallel.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/parallel.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/parallel.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest-deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/ptest-deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest-deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest_makefile_deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/ptest_makefile_deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest_makefile_deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/run-ptest b/meta/recipes-connectivity/openssl/openssl-1.0.2l/run-ptest
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/run-ptest
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/run-ptest
diff --git a/meta/recipes-connectivity/openssl/openssl10/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2l/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2l/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 54cf4598e1d..86f268db98c 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 DEPENDS = "makedepend-native hostperl-runtime-native"
 DEPENDS_append_class-target = " openssl-native"
 
+PROVIDES += "openssl10"
+
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
           "
 S = "${WORKDIR}/openssl-${PV}"
diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
-- 
2.14.1


