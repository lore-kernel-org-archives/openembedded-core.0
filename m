Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7EFBA71B62
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 21:04:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 24 Nov 2016 13:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1090058344"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.149])
	by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2016 13:04:16 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 15:06:04 -0600
Message-Id: <1480021564-12420-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1480021564-12420-1-git-send-email-anibal.limon@linux.intel.com>
References: <1480021564-12420-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] perl: Upgrade to 5.24.0
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
X-List-Received-Date: Thu, 24 Nov 2016 21:04:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Configuration changes,
    Simple changes was made to bump version and api version, related to
    floating point handling now the configuration needs the inf, mantisa
    and nan bytes.

    The new version comes with the support of API calls like memmem and
    {new,free,use}locale also structure for handle siginfo supported by
    glibc and musl.

    Finally use64bit{int, all} was disable because the previous
    configure_args don't come with them and cases some tests to fail
    related to bignum's and shared memory respectively. This doesn't
    means that perl couldn't use 64-bit data types, it means that don't
    stores by default into a 64 bit that is good for embedded space
    purposes.

Modules changes,
    Some core modules are now deprecated in order to use the core ones
    like version-vpp and version-regex inside module-extutils-makemaker.
    For full review see perl-rdepends.inc file.

Patches rebased,
    - perl/debian/errno_ver.diff
    - perl/dynaloaderhack.patch
    - perl/Makefile.SH.patch
    - perl/config.s
    - perl/dynaloaderhack.patch
    - perl/perl-test-customized.patch

Patches removed, comes with the upgrade now:
    - perl/perl-remove-nm-from-libswanted.patch
    - perl/perl-fix-CVE-2015-8607.patch
    - perl/perl-fix-CVE-2016-2381.patch

Test,
    The upgrade was test using ptest the suite is fixed now.
    The pod2man and pod2text installation required now for some tests.
    Buildhistory was use to review the changes and only diff changes
    related to modules commented above.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 ...perl-native_5.22.1.bb => perl-native_5.24.0.bb} |   5 +-
 meta/recipes-devtools/perl/perl-ptest.inc          |   4 +-
 ...depends_5.22.1.inc => perl-rdepends_5.24.0.inc} | 110 +++++++++++---------
 meta/recipes-devtools/perl/perl/Makefile.SH.patch  | 114 ++++++++++----------
 meta/recipes-devtools/perl/perl/config.sh          |  94 +++++++++++------
 .../perl/perl/debian/errno_ver.diff                |  28 ++---
 .../perl/perl/debian/prune_libs.diff               |  19 ++--
 .../perl/perl/dynaloaderhack.patch                 |  24 +++--
 .../perl/perl/perl-fix-CVE-2015-8607.patch         |  74 -------------
 .../perl/perl/perl-fix-CVE-2016-2381.patch         | 114 --------------------
 .../perl/perl/perl-remove-nm-from-libswanted.patch |  30 ------
 .../perl/perl/perl-test-customized.patch           | 115 +++++++++++----------
 .../perl/{perl_5.22.1.bb => perl_5.24.0.bb}        |   8 +-
 13 files changed, 296 insertions(+), 443 deletions(-)
 rename meta/recipes-devtools/perl/{perl-native_5.22.1.bb => perl-native_5.24.0.bb} (95%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.22.1.inc => perl-rdepends_5.24.0.inc} (97%)
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch
 rename meta/recipes-devtools/perl/{perl_5.22.1.bb => perl_5.24.0.bb} (98%)

diff --git a/meta/recipes-devtools/perl/perl-native_5.22.1.bb b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
similarity index 95%
rename from meta/recipes-devtools/perl/perl-native_5.22.1.bb
rename to meta/recipes-devtools/perl/perl-native_5.24.0.bb
index 1c21522..af2ad7b 100644
--- a/meta/recipes-devtools/perl/perl-native_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
@@ -11,11 +11,10 @@ SRC_URI += "\
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
            file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
-           file://perl-remove-nm-from-libswanted.patch \
           "
 
-SRC_URI[md5sum] = "6671e4829cbaf9cecafa9a84f141b0a3"
-SRC_URI[sha256sum] = "9e87317d693ce828095204be0d09af8d60b8785533fadea1a82b6f0e071e5c79"
+SRC_URI[md5sum] = "59456ae4bd4b06cb6e57cb19a3b2d349"
+SRC_URI[sha256sum] = "a9a37c0860380ecd7b23aa06d61c20fc5bc6d95198029f3684c44a9d7e2952f2"
 
 inherit native
 
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 8dfc179..04406d5 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -20,7 +20,9 @@ do_install_ptest () {
 	       -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
 	       -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
 	       -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
-	    ${D}${PTEST_PATH}/lib/Config.pm
+	    ${D}${PTEST_PATH}/lib/Config.pm \
+	    ${D}${PTEST_PATH}/cpan/podlators/scripts/pod2man \
+	    ${D}${PTEST_PATH}/cpan/podlators/scripts/pod2text
 
 	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
 	# Remove plan9 related stuff
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc b/meta/recipes-devtools/perl/perl-rdepends_5.24.0.inc
similarity index 97%
rename from meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
rename to meta/recipes-devtools/perl/perl-rdepends_5.24.0.inc
index 2c497fe..10e3c04 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.24.0.inc
@@ -22,7 +22,6 @@ RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-bigint-calc"
 RDEPENDS_${PN}-module-thread-queue += "${PN}-module-attributes"
 RDEPENDS_${PN}-module-overload += "${PN}-module-overloading"
 
-
 # Depends list
 # copy contents of /tmp/perl-rdepends in this file
 RDEPENDS_${PN}-module-anydbm-file += "${PN}-module-strict"
@@ -134,12 +133,12 @@ RDEPENDS_${PN}-module-autodie-scope-guard += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-autodie-scope-guardstack += "${PN}-module-autodie-scope-guard"
 RDEPENDS_${PN}-module-autodie-scope-guardstack += "${PN}-module-strict"
 RDEPENDS_${PN}-module-autodie-scope-guardstack += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie-scopeutil += "${PN}-module-autodie-scope-guardstack"
-RDEPENDS_${PN}-module-autodie-scopeutil += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-autodie-scopeutil += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie-scopeutil += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-autodie-skip += "${PN}-module-strict"
 RDEPENDS_${PN}-module-autodie-skip += "${PN}-module-warnings"
+RDEPENDS_${PN}-module-autodie-util += "${PN}-module-autodie-scope-guardstack"
+RDEPENDS_${PN}-module-autodie-util += "${PN}-module-exporter"
+RDEPENDS_${PN}-module-autodie-util += "${PN}-module-strict"
+RDEPENDS_${PN}-module-autodie-util += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-autoloader += "${PN}-module-carp"
 RDEPENDS_${PN}-module-autoloader += "${PN}-module-strict"
 RDEPENDS_${PN}-module-autosplit += "${PN}-module-carp"
@@ -181,7 +180,7 @@ RDEPENDS_${PN}-module-bigint += "${PN}-module-math-bigint"
 RDEPENDS_${PN}-module-bigint += "${PN}-module-math-bigint-trace"
 RDEPENDS_${PN}-module-bigint += "${PN}-module-overload"
 RDEPENDS_${PN}-module-bigint += "${PN}-module-strict"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-vars"
+RDEPENDS_${PN}-module-bigint += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-bignum += "${PN}-module-bigint"
 RDEPENDS_${PN}-module-bignum += "${PN}-module-carp"
 RDEPENDS_${PN}-module-bignum += "${PN}-module-exporter"
@@ -191,7 +190,7 @@ RDEPENDS_${PN}-module-bignum += "${PN}-module-math-bigint"
 RDEPENDS_${PN}-module-bignum += "${PN}-module-math-bigint-trace"
 RDEPENDS_${PN}-module-bignum += "${PN}-module-overload"
 RDEPENDS_${PN}-module-bignum += "${PN}-module-strict"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-vars"
+RDEPENDS_${PN}-module-bignum += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-bigrat += "${PN}-module-bigint"
 RDEPENDS_${PN}-module-bigrat += "${PN}-module-carp"
 RDEPENDS_${PN}-module-bigrat += "${PN}-module-exporter"
@@ -201,7 +200,7 @@ RDEPENDS_${PN}-module-bigrat += "${PN}-module-math-bigint-trace"
 RDEPENDS_${PN}-module-bigrat += "${PN}-module-math-bigrat"
 RDEPENDS_${PN}-module-bigrat += "${PN}-module-overload"
 RDEPENDS_${PN}-module-bigrat += "${PN}-module-strict"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-vars"
+RDEPENDS_${PN}-module-bigrat += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-blib += "${PN}-module-cwd"
 RDEPENDS_${PN}-module-blib += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-blib += "${PN}-module-vars"
@@ -225,11 +224,16 @@ RDEPENDS_${PN}-module-carp-heavy += "${PN}-module-carp"
 RDEPENDS_${PN}-module-carp += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-carp += "${PN}-module-strict"
 RDEPENDS_${PN}-module-carp += "${PN}-module-warnings"
+RDEPENDS_${PN}-module--charnames += "${PN}-module-bytes"
 RDEPENDS_${PN}-module-charnames += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-charnames += "${PN}-module-carp"
-RDEPENDS_${PN}-module-charnames += "${PN}-module-file-spec"
+RDEPENDS_${PN}-module--charnames += "${PN}-module-carp"
+RDEPENDS_${PN}-module-charnames += "${PN}-module--charnames"
+RDEPENDS_${PN}-module--charnames += "${PN}-module-file-spec"
+RDEPENDS_${PN}-module--charnames += "${PN}-module-re"
 RDEPENDS_${PN}-module-charnames += "${PN}-module-re"
+RDEPENDS_${PN}-module--charnames += "${PN}-module-strict"
 RDEPENDS_${PN}-module-charnames += "${PN}-module-strict"
+RDEPENDS_${PN}-module--charnames += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-charnames += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-class-struct += "${PN}-module-carp"
 RDEPENDS_${PN}-module-class-struct += "${PN}-module-exporter"
@@ -277,6 +281,7 @@ RDEPENDS_${PN}-module-constant += "${PN}-module-carp"
 RDEPENDS_${PN}-module-constant += "${PN}-module-strict"
 RDEPENDS_${PN}-module-constant += "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-list-util"
+RDEPENDS_${PN}-module-corelist += "${PN}-module-corelist"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-strict"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-vars"
 RDEPENDS_${PN}-module-corelist += "${PN}-module-version"
@@ -522,11 +527,13 @@ RDEPENDS_${PN}-module-encoding += "${PN}-module-constant"
 RDEPENDS_${PN}-module-encoding += "${PN}-module-encode"
 RDEPENDS_${PN}-module-encoding += "${PN}-module-filter-util-call"
 RDEPENDS_${PN}-module-encoding += "${PN}-module-i18n-langinfo"
+RDEPENDS_${PN}-module-encoding += "${PN}-module-posix"
 RDEPENDS_${PN}-module-encoding += "${PN}-module-strict"
 RDEPENDS_${PN}-module-encoding += "${PN}-module-utf8"
 RDEPENDS_${PN}-module-encoding += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-encoding-warnings += "${PN}-module-carp"
 RDEPENDS_${PN}-module-encoding-warnings += "${PN}-module-strict"
+RDEPENDS_${PN}-module-encoding-warnings += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-english += "${PN}-module-carp "
 RDEPENDS_${PN}-module-english += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-env += "${PN}-module-config"
@@ -553,41 +560,58 @@ RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-file-temp"
 RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-ipc-cmd"
 RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-text-parsewords"
+RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-file-path"
 RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-file-spec"
+RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-extutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-extutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-extutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin += "${PN}-module-extutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-extutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 += "${PN}-module-extutils-cbuilder-platform-unix"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix += "${PN}-module-extutils-cbuilder-base"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-extutils-cbuilder-base"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-file-spec-functions"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-vars"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-warnings"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc += "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc += "${PN}-module-warnings"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc += "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc += "${PN}-module-warnings"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc += "${PN}-module-strict"
+RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-extutils-cbuilder-base"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-file-spec"
@@ -704,21 +728,8 @@ RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-file-path"
 RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-version"
-RDEPENDS_${PN}-module-extutils-makemaker-version += "${PN}-module-extutils-makemaker-version-regex"
 RDEPENDS_${PN}-module-extutils-makemaker-version += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-makemaker-version += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-makemaker-version-regex += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker-version-regex += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-b"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-constant"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-extutils-makemaker-version-regex"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-locale"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-overload"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-universal"
-RDEPENDS_${PN}-module-extutils-makemaker-version-vpp += "${PN}-module-vars"
 RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-carp"
 RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-config"
 RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-exporter"
@@ -879,9 +890,10 @@ RDEPENDS_${PN}-module-extutils-typemaps += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-extutils-typemaps-type += "${PN}-module-extutils-typemaps"
 RDEPENDS_${PN}-module-extutils-typemaps-type += "${PN}-module-strict"
 RDEPENDS_${PN}-module-extutils-typemaps-type += "${PN}-module-warnings"
+RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie-exception-system"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie-hints"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie-scopeutil"
+RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie-util"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-carp"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-config"
 RDEPENDS_${PN}-module-fatal += "${PN}-module-constant"
@@ -966,6 +978,9 @@ RDEPENDS_${PN}-module-file-path += "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-file-path += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-file-path += "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-path += "${PN}-module-vars"
+RDEPENDS_${PN}-module-file-spec-amigaos += "${PN}-module-file-spec-unix"
+RDEPENDS_${PN}-module-file-spec-amigaos += "${PN}-module-strict"
+RDEPENDS_${PN}-module-file-spec-amigaos += "${PN}-module-vars"
 RDEPENDS_${PN}-module-file-spec-cygwin += "${PN}-module-file-spec-unix"
 RDEPENDS_${PN}-module-file-spec-cygwin += "${PN}-module-strict"
 RDEPENDS_${PN}-module-file-spec-cygwin += "${PN}-module-vars"
@@ -1165,7 +1180,7 @@ RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-adapter-deflate"
 RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-adapter-identity"
 RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-bzip2 "
+RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-bzip2"
 RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-rawdeflate"
 RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-zip-constants"
 RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-zlib-extra"
@@ -1426,6 +1441,7 @@ RDEPENDS_${PN}-module-load += "${PN}-module-filehandle"
 RDEPENDS_${PN}-module-load += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-load += "${PN}-module-locale-maketext-simple"
 RDEPENDS_${PN}-module-load += "${PN}-module-corelist"
+RDEPENDS_${PN}-module-load += "${PN}-module-load"
 RDEPENDS_${PN}-module-load += "${PN}-module-params-check"
 RDEPENDS_${PN}-module-load += "${PN}-module-strict"
 RDEPENDS_${PN}-module-load += "${PN}-module-vars"
@@ -1563,43 +1579,45 @@ RDEPENDS_${PN}-module-locale-script += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-carp"
 RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-math-bigint"
+RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-math-complex"
 RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-overload"
 RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-vars"
+RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-math-bigfloat"
 RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-overload"
 RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-vars"
+RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigint-calcemu += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-calcemu += "${PN}-module-vars"
+RDEPENDS_${PN}-module-math-bigint-calcemu += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-carp"
 RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-constant"
 RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-integer"
 RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-strict"
+RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-math-bigint-calc"
 RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-vars"
 RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-math-bigint += "${PN}-module-carp"
 RDEPENDS_${PN}-module-math-bigint += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-math-bigint += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-bigfloat"
+RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-complex"
 RDEPENDS_${PN}-module-math-bigint += "${PN}-module-overload"
 RDEPENDS_${PN}-module-math-bigint += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-vars"
+RDEPENDS_${PN}-module-math-bigint += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-math-bigint"
 RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-overload"
 RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-vars"
+RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-carp"
 RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-math-bigfloat"
 RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-math-bigint"
 RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-overload"
 RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-vars"
+RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-math-complex += "${PN}-module-config"
 RDEPENDS_${PN}-module-math-complex += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-math-complex += "${PN}-module-overload"
@@ -1635,6 +1653,7 @@ RDEPENDS_${PN}-module-mro += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-mro += "${PN}-module-xsloader"
 RDEPENDS_${PN}-module-net-cmd += "${PN}-module-carp"
 RDEPENDS_${PN}-module-net-cmd += "${PN}-module-constant"
+RDEPENDS_${PN}-module-net-cmd += "${PN}-module-errno"
 RDEPENDS_${PN}-module-net-cmd += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-net-cmd += "${PN}-module-strict"
 RDEPENDS_${PN}-module-net-cmd += "${PN}-module-symbol"
@@ -1816,16 +1835,17 @@ RDEPENDS_${PN}-module-pod-functions += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-inputobjects += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-inputobjects += "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-man += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-encode"
 RDEPENDS_${PN}-module-pod-man += "${PN}-module-file-basename"
 RDEPENDS_${PN}-module-pod-man += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-pod-man += "${PN}-module-pod-simple"
 RDEPENDS_${PN}-module-pod-man += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-man += "${PN}-module-subs"
 RDEPENDS_${PN}-module-pod-man += "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-man += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-pod-parselink += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-pod-parselink += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-parselink += "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-parselink += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-pod-parser += "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-parser += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-pod-parser += "${PN}-module-pod-inputobjects"
@@ -2001,6 +2021,7 @@ RDEPENDS_${PN}-module-pod-simple-tiedoutfh += "${PN}-module-symbol"
 RDEPENDS_${PN}-module-pod-simple-tiedoutfh += "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-transcodedumb += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-transcodedumb += "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-simple-transcode += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-simple-transcode += "${PN}-module-vars"
 RDEPENDS_${PN}-module-pod-simple-transcodesmart += "${PN}-module-encode"
 RDEPENDS_${PN}-module-pod-simple-transcodesmart += "${PN}-module-pod-simple"
@@ -2014,20 +2035,24 @@ RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-pod-text"
 RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-term-ansicolor"
 RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-pod-text-overstrike += "${PN}-module-pod-text"
 RDEPENDS_${PN}-module-pod-text-overstrike += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-text-overstrike += "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-text-overstrike += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-pod-text += "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-text += "${PN}-module-encode"
 RDEPENDS_${PN}-module-pod-text += "${PN}-module-exporter"
 RDEPENDS_${PN}-module-pod-text += "${PN}-module-pod-simple"
 RDEPENDS_${PN}-module-pod-text += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-text += "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-text += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-pod-text"
 RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-posix"
 RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-strict"
 RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-term-cap"
 RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-vars"
+RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-pod-usage += "${PN}-module-carp"
 RDEPENDS_${PN}-module-pod-usage += "${PN}-module-config"
 RDEPENDS_${PN}-module-pod-usage += "${PN}-module-exporter"
@@ -2480,9 +2505,8 @@ RDEPENDS_${PN}-module-time-piece += "${PN}-module-time-local"
 RDEPENDS_${PN}-module-time-piece += "${PN}-module-time-seconds"
 RDEPENDS_${PN}-module-time-seconds += "${PN}-module-constant"
 RDEPENDS_${PN}-module-time-seconds += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-time-seconds += "${PN}-module-overload "
+RDEPENDS_${PN}-module-time-seconds += "${PN}-module-overload"
 RDEPENDS_${PN}-module-time-seconds += "${PN}-module-strict"
-RDEPENDS_${PN}-module-time-seconds += "${PN}-module-vars"
 RDEPENDS_${PN}-module-time-tm += "${PN}-module-class-struct"
 RDEPENDS_${PN}-module-time-tm += "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-collate-cjk-big5 += "${PN}-module-strict"
@@ -2492,7 +2516,6 @@ RDEPENDS_${PN}-module-unicode-collate-cjk-gb2312 += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 += "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-collate-cjk-korean += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-korean += "${PN}-module-unicode-collate"
 RDEPENDS_${PN}-module-unicode-collate-cjk-korean += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin += "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin += "${PN}-module-warnings"
@@ -2511,9 +2534,8 @@ RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-carp"
-RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-constant"
+RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-dynaloader"
 RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-file-spec"
 RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-strict"
 RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-warnings"
 RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-carp"
@@ -2546,18 +2568,8 @@ RDEPENDS_${PN}-module-utf8 += "${PN}-module-utf8-heavy"
 RDEPENDS_${PN}-module-version += "${PN}-module-strict"
 RDEPENDS_${PN}-module-version += "${PN}-module-vars"
 RDEPENDS_${PN}-module-version += "${PN}-module-version-regex"
+RDEPENDS_${PN}-module-version += "${PN}-module-warnings-register"
 RDEPENDS_${PN}-module-version-regex += "${PN}-module-strict"
 RDEPENDS_${PN}-module-version-regex += "${PN}-module-vars"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-b"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-carp"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-config"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-constant"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-if"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-overload"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-posix"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-universal"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-vars"
-RDEPENDS_${PN}-module-version-vpp += "${PN}-module-version-regex"
 RDEPENDS_${PN}-module-xsloader += "${PN}-module-carp"
 RDEPENDS_${PN}-module-xsloader += "${PN}-module-dynaloader"
diff --git a/meta/recipes-devtools/perl/perl/Makefile.SH.patch b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
index edf49d6..fd8237f 100644
--- a/meta/recipes-devtools/perl/perl/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
@@ -1,15 +1,22 @@
+From 4dd9f3f81d8c81c96ff1ea0890ea55685f28b7e9 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 1 Jul 2014 15:51:53 +0800
+Subject: [PATCH 28/49] perl, perl-native, perl-ptest: upgrade from 5.14.3 to
+ 5.20.0
+
 Upstream-Status:Inappropriate [embedded specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- Makefile.SH |  145 +++++++++++++++++++++++++++--------------------------------
- 1 file changed, 67 insertions(+), 78 deletions(-)
+ Makefile.SH | 147 ++++++++++++++++++++++++++++--------------------------------
+ 1 file changed, 68 insertions(+), 79 deletions(-)
 
-Index: perl-5.22.1/Makefile.SH
-===================================================================
---- perl-5.22.1.orig/Makefile.SH
-+++ perl-5.22.1/Makefile.SH
-@@ -39,10 +39,10 @@ case "$useshrplib" in
+diff --git a/Makefile.SH b/Makefile.SH
+index 916b332..b143d46 100755
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -48,10 +48,10 @@ case "$useshrplib" in
  true)
  	# Prefix all runs of 'miniperl' and 'perl' with
  	# $ldlibpth so that ./perl finds *this* shared libperl.
@@ -24,7 +31,7 @@ Index: perl-5.22.1/Makefile.SH
  
  	pldlflags="$cccdlflags"
  	static_ldflags=''
-@@ -122,10 +122,11 @@ true)
+@@ -131,10 +131,11 @@ true)
  	    *)
  		eval "ldlibpthval=\"\$$ldlibpthname\""
  
@@ -40,7 +47,7 @@ Index: perl-5.22.1/Makefile.SH
  
  		;;
  	    esac
-@@ -141,18 +142,7 @@ true)
+@@ -150,18 +151,7 @@ true)
  	    # INSTALL file, under "Building a shared perl library".
  	    # If there is no pre-existing $libperl, we don't need
  	    # to do anything further.
@@ -60,17 +67,13 @@ Index: perl-5.22.1/Makefile.SH
  	    ;;
  	os390)	test -f /bin/env && ldlibpth="/bin/env $ldlibpth"
  		;;
-@@ -566,13 +556,23 @@ splintfiles = $(c1)
+@@ -596,13 +586,23 @@ splintfiles = $(c1)
  	@echo `$(CCCMDSRC)` -S $*.c
  	@`$(CCCMDSRC)` -S $*.c
  
 -all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
 -	@echo " ";
 -	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
--
--$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
--	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"; \
--	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
 +#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
 +#	@echo " ";
 +#	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
@@ -80,7 +83,10 @@ Index: perl-5.22.1/Makefile.SH
 +more: $(generated_pods) $(private) $(public)
 +
 +more2: $(dynamic_ext)
-+
+ 
+-$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
+-	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"; \
+-	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
 +more3: $(nonxs_ext)
 +
 +more4: extras.make $(MANIFEST_SRT)
@@ -91,7 +97,7 @@ Index: perl-5.22.1/Makefile.SH
  	@touch $(MANIFEST_SRT)
  
  .PHONY: all utilities
-@@ -581,7 +581,7 @@ $(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
+@@ -611,7 +611,7 @@ $(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
  # by make_patchnum.pl.
  git_version.h: lib/Config_git.pl
  
@@ -100,7 +106,7 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) make_patchnum.pl
  
  # make sure that we recompile perl.c if the git version changes
-@@ -594,7 +594,7 @@ perl$(OBJ_EXT): git_version.h
+@@ -624,7 +624,7 @@ perl$(OBJ_EXT): git_version.h
  # loading, we need to build perl first.
  case "$usedl$static_cwd" in
  defineundef)
@@ -109,7 +115,7 @@ Index: perl-5.22.1/Makefile.SH
      ;;
  definedefine)
      util_deps='$(PERL_EXE) $(CONFIGPM) FORCE'
-@@ -604,7 +604,7 @@ definedefine)
+@@ -634,7 +634,7 @@ definedefine)
  esac
  
  $spitshell >>$Makefile <<!GROK!THIS!
@@ -118,16 +124,16 @@ Index: perl-5.22.1/Makefile.SH
  	\$(MINIPERL) -Ilib utils/Makefile.PL
  
  utilities:	utils/Makefile $util_deps
-@@ -699,7 +699,7 @@ esac
- 
- 
+@@ -743,7 +743,7 @@ ext.libs: $(static_ext)
+ ;;
+ *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
 -perlmain.c: $(MINIPERL_EXE) ext/ExtUtils-Miniperl/pm_to_blib
 +perlmain.c: ext/ExtUtils-Miniperl/lib/ExtUtils/Miniperl.pm
  	$(MINIPERL) -Ilib -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @ARGV)' DynaLoader $(static_ext)
  
  # The file ext.libs is a list of libraries that must be linked in
-@@ -760,7 +760,7 @@ PERLEXPORT		= perl.exp
+@@ -806,7 +806,7 @@ PERLEXPORT		= perl.exp
  	;;
  	esac
  	$spitshell >>$Makefile <<'!NO!SUBS!'
@@ -136,7 +142,7 @@ Index: perl-5.22.1/Makefile.SH
  	./$(MINIPERLEXP) makedef.pl --sort-fold PLATFORM=aix CC_FLAGS="$(OPTIMIZE)" > perl.exp
  
  !NO!SUBS!
-@@ -769,7 +769,7 @@ os2)
+@@ -815,7 +815,7 @@ os2)
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  MINIPERLEXP		= miniperl
  
@@ -145,19 +151,19 @@ Index: perl-5.22.1/Makefile.SH
  	./$(MINIPERLEXP) makedef.pl PLATFORM=os2 -DPERL_DLL=$(PERL_DLL) CC_FLAGS="$(OPTIMIZE)" > perl5.def
  
  !NO!SUBS!
-@@ -829,7 +829,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LI
+@@ -878,7 +878,7 @@ $(LIBPERL): $& $(perllib_objs) $(DYNALOADER) $(LIBPERLEXPORT)
  	true)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  	rm -f $@
--	$(LD) -o $@ $(SHRPLDFLAGS) $(obj) $(DYNALOADER) $(libs)
-+	$(LD) -o $@ $(SHRPLDFLAGS) $(obj) $(DYNALOADER) $(libs) -Wl,-soname,libperl.so.5
+-	$(LD) -o $@ $(SHRPLDFLAGS) $(perllib_objs) $(DYNALOADER) $(libs)
++	$(LD) -o $@ $(SHRPLDFLAGS) $(perllib_objs) $(DYNALOADER) $(libs) -Wl,-soname,libperl.so.5
  !NO!SUBS!
  		case "$osname" in
  		aix)
-@@ -877,7 +877,9 @@ $(MINIPERL_EXE): lib/buildcustomize.pl
+@@ -936,15 +936,19 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
  		$spitshell >>$Makefile <<'!NO!SUBS!'
- lib/buildcustomize.pl: $& $(mini_obj)
- 	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(mini_obj) $(libs)
+ lib/buildcustomize.pl: $& $(miniperl_objs)
+ 	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(miniperl_objs) $(libs)
 -	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
 +	mv -f miniperl miniperl-target
 +	ln -s hostperl miniperl
@@ -165,21 +171,22 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
-@@ -885,7 +887,9 @@ lib/buildcustomize.pl: $& $(mini_obj)
+ 	next4*)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
- lib/buildcustomize.pl: $& $(mini_obj) write    ldcustomize.pl
- 	$(CC) -o $(MINIPERL_EXE) $(mini_obj    libs)
+ lib/buildcustomize.pl: $& $(miniperl_objs) write    ldcustomize.pl
+-	$(CC) -o $(MINIPERL_EXE) $(miniperl_objs    libs)
 -	$(LDLIBPTH) ./miniperl$(HOST    _EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
++	$(CC) -o $(MINIPERL_EXE) $(miniperl_objs   libs)
 +	mv -f miniperl miniperl-target
 +	ln -s hostperl miniperl
 +	#$(LDLIBPTH) ./miniperl$(HOST    _EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
  	$(MINIPERL) -f write_buildcustomize.pl    
  !NO!SUBS!
  		;;
-@@ -907,7 +911,9 @@ lib/buildcustomize.pl: $& $(mini_obj) wr
+@@ -966,7 +970,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
- 	    $(mini_obj) $(libs)
+ 	    $(miniperl_objs) $(libs)
 -	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
 +	mv -f miniperl miniperl-target
 +	ln -s hostperl miniperl
@@ -187,7 +194,7 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
-@@ -918,7 +924,9 @@ lib/buildcustomize.pl: \$& \$(mini_obj)
+@@ -977,7 +983,9 @@ lib/buildcustomize.pl: \$& \$(miniperl_objs) write_buildcustomize.pl
  	-@rm -f miniperl.xok
  	-@rm \$(MINIPERL_EXE)
  	\$(LNS) \$(HOST_PERL) \$(MINIPERL_EXE)
@@ -198,10 +205,10 @@ Index: perl-5.22.1/Makefile.SH
  	\$(MINIPERL) -f write_buildcustomize.pl 'osname' "$osname"
  !GROK!THIS!
  		else
-@@ -927,7 +935,9 @@ lib/buildcustomize.pl: $& $(mini_obj) wr
+@@ -986,7 +994,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
- 	    $(mini_obj) $(libs)
+ 	    $(miniperl_objs) $(libs)
 -	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
 +	mv -f miniperl miniperl-target
 +	ln -s hostperl miniperl
@@ -209,7 +216,7 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		fi
-@@ -971,7 +981,7 @@ case "${osname}" in
+@@ -1036,7 +1046,7 @@ case "${osname}" in
  catamount)
  $spitshell >>$Makefile <<!GROK!THIS!
  .PHONY: makeppport
@@ -218,7 +225,7 @@ Index: perl-5.22.1/Makefile.SH
  	-@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do \
  	(cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../../lib \$\$f); \
  	done
-@@ -981,7 +991,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM
+@@ -1046,7 +1056,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
  *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
  .PHONY: makeppport
@@ -227,7 +234,7 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) mkppport
  
  !NO!SUBS!
-@@ -991,16 +1001,16 @@ esac
+@@ -1056,16 +1066,16 @@ esac
  $spitshell >>$Makefile <<'!NO!SUBS!'
  
  .PHONY: preplibrary
@@ -247,7 +254,7 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) lib/unicore/mktables -C lib/unicore -P pod -maketest -makelist -p
  #	Commented out so always runs, mktables looks at far more files than we
  #	can in this makefile to decide if needs to run or not
-@@ -1009,12 +1019,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
+@@ -1074,12 +1084,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
  # $(PERL_EXE) and ext because pod_lib.pl needs Digest::MD5
  # But also this ensures that all extensions are built before we try to scan
  # them, which picks up Devel::PPPort's documentation.
@@ -263,16 +270,16 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) autodoc.pl
  
  pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
-@@ -1024,7 +1034,7 @@ pod/perl5221delta.pod: pod/perldelta.pod
- 	$(RMS) pod/perl5221delta.pod
- 	$(LNS) perldelta.pod pod/perl5221delta.pod
+@@ -1089,7 +1099,7 @@ pod/perl5240delta.pod: pod/perldelta.pod
+ 	$(RMS) pod/perl5240delta.pod
+ 	$(LNS) perldelta.pod pod/perl5240delta.pod
  
 -extra.pods: $(MINIPERL_EXE)
 +extra.pods:
  	-@test ! -f extra.pods || rm -f `cat extra.pods`
  	-@rm -f extra.pods
  	-@for x in `grep -l '^=[a-z]' README.* | grep -v README.vms` ; do \
-@@ -1068,8 +1078,7 @@ EOT
+@@ -1133,8 +1143,7 @@ EOT
          $spitshell >>$Makefile <<EOT
  
  install_$name install-$name: \$(INSTALL_DEPENDENCE) installperl all installman
@@ -282,7 +289,7 @@ Index: perl-5.22.1/Makefile.SH
  EOT
      fi
  
-@@ -1079,11 +1088,7 @@ done
+@@ -1144,11 +1153,7 @@ done
  if test "X$hostperl" != X; then
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  install.perl:	$(INSTALL_DEPENDENCE) installperl
@@ -295,7 +302,7 @@ Index: perl-5.22.1/Makefile.SH
  
  # XXX Experimental. Hardwired values, but useful for testing.
  # Eventually Configure could ask for some of these values.
-@@ -1101,24 +1106,8 @@ install.html: all installhtml
+@@ -1166,24 +1171,8 @@ install.html: all installhtml
  else
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  install.perl:	$(INSTALL_DEPENDENCE) installperl
@@ -321,7 +328,7 @@ Index: perl-5.22.1/Makefile.SH
  !NO!SUBS!
  fi
  
-@@ -1210,13 +1199,13 @@ manicheck:	FORCE
+@@ -1275,13 +1264,13 @@ manicheck:	FORCE
  #
  # DynaLoader may be needed for extensions that use Makefile.PL.
  
@@ -338,7 +345,7 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
  
  n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE
-@@ -1405,14 +1394,14 @@ test_prep_pre: preplibrary utilities $(n
+@@ -1479,14 +1468,14 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
  
  case "$targethost" in
  '') $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -355,7 +362,7 @@ Index: perl-5.22.1/Makefile.SH
  	\$(dynamic_ext) \$(TEST_PERL_DLL) runtests \
  	\$(generated_pods)
  	$to libperl.*
-@@ -1465,7 +1454,7 @@ test_prep test-prep: test_prep_pre \$(MI
+@@ -1539,7 +1528,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(PERL_EXE
  esac
  
  $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -364,12 +371,15 @@ Index: perl-5.22.1/Makefile.SH
  	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
  !NO!SUBS!
-@@ -1526,7 +1515,7 @@ minitest_prep:
+@@ -1600,7 +1589,7 @@ minitest_prep:
  
  MINITEST_TESTS = base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t opbasic/*.t op/*.t uni/*.t perf/*.t
  
 -minitest: $(MINIPERL_EXE) minitest_prep
 +minitest: minitest_prep
- 	- cd t && $(RUN_PERL) TEST $(MINITEST_TESTS) </dev/tty
+ 	- cd t && $(RUN_PERL) TEST $(MINITEST_TESTS) <$(devtty)
  
  minitest-notty minitest_notty: $(MINIPERL_EXE) minitest_prep
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index b2a7f2c..6666e6f 100644
--- a/meta/recipes-devtools/perl/perl/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -14,7 +14,7 @@
 
 : Configure command line arguments.
 config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.22.1 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
+config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.24.0 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
 config_argc=28
 config_arg1='-des'
 config_arg2='-Doptimize=-O2'
@@ -26,7 +26,7 @@ config_arg7='-Dinstallprefix=@EXECPREFIX@'
 config_arg8='-Dprefix=@EXECPREFIX@'
 config_arg9='-Dvendorprefix=@EXECPREFIX@'
 config_arg10='-Dsiteprefix=@EXECPREFIX@'
-config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.22.1'
+config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.24.0'
 config_arg12='-Duseshrplib'
 config_arg13='-Dusethreads'
 config_arg14='-Duseithreads'
@@ -65,12 +65,12 @@ ansi2knr=''
 aphostname=''
 api_revision='5'
 api_subversion='0'
-api_version='22'
-api_versionstring='5.22.0'
+api_version='24'
+api_versionstring='5.24.0'
 ar='ar'
-archlib='@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
-archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
-archlib_exp='@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
+archlib='@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi'
+archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi'
+archlib_exp='@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
@@ -88,7 +88,7 @@ castflags='0'
 cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
-ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi/CORE'
+ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi/CORE'
 ccflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
@@ -648,11 +648,15 @@ db_version_patch=''
 direntrytype='struct dirent'
 dlext='so'
 dlsrc='dl_dlopen.xs'
+doubleinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x7f'
 doublekind='3'
+doublemantbits='52'
+doublenanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0xff'
 doublesize='8'
 drand01='Perl_drand48()'
 drand48_r_proto='REENTRANT_PROTO_I_ST'
 dtrace=''
+dtraceobject=''
 dynamic_ext='B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode POSIX PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Storable Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate XS/APItest XS/Typemap arybase attributes mro re threads threads/shared'
 eagain='EAGAIN'
 ebcdic='undef'
@@ -834,7 +838,7 @@ inc_version_list_init='0'
 incpath=''
 inews=''
 initialinstalllocation='@USRBIN@'
-installarchlib='@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
+installarchlib='@LIBDIR@/perl/5.24.0/@ARCH@-thread-multi'
 installbin='@USRBIN@'
 installhtml1dir=''
 installhtml3dir=''
@@ -842,23 +846,23 @@ installman1dir=''
 installman3dir=''
 installprefix='@EXECPREFIX@'
 installprefixexp='@EXECPREFIX@'
-installprivlib='@LIBDIR@/perl/5.22.1'
+installprivlib='@LIBDIR@/perl/5.24.0'
 installscript='@USRBIN@'
-installsitearch='@LIBDIR@/perl/site_perl/5.22.1/@ARCH@-thread-multi'
+installsitearch='@LIBDIR@/perl/site_perl/5.24.0/@ARCH@-thread-multi'
 installsitebin='@USRBIN@'
 installsitehtml1dir=''
 installsitehtml3dir=''
-installsitelib='@LIBDIR@/perl/site_perl/5.22.1'
+installsitelib='@LIBDIR@/perl/site_perl/5.24.0'
 installsiteman1dir=''
 installsiteman3dir=''
 installsitescript='@USRBIN@'
 installstyle='lib/perl'
 installusrbinperl='define'
-installvendorarch='@LIBDIR@/perl/vendor_perl/5.22.1/@ARCH@-thread-multi'
+installvendorarch='@LIBDIR@/perl/vendor_perl/5.24.0/@ARCH@-thread-multi'
 installvendorbin='@USRBIN@'
 installvendorhtml1dir=''
 installvendorhtml3dir=''
-installvendorlib='@LIBDIR@/perl/vendor_perl/5.22.1'
+installvendorlib='@LIBDIR@/perl/vendor_perl/5.24.0'
 installvendorman1dir=''
 installvendorman3dir=''
 installvendorscript='@USRBIN@'
@@ -895,7 +899,10 @@ lns='/bin/ln -s'
 localtime_r_proto='REENTRANT_PROTO_S_TS'
 locincpth='@EXECPREFIX@/local/include /opt/local/include @EXECPREFIX@/gnu/include /opt/gnu/include @EXECPREFIX@/GNU/include /opt/GNU/include'
 loclibpth='@EXECPREFIX@/local@BASELIBDIR@ /opt/local@BASELIBDIR@ @EXECPREFIX@/gnu@BASELIBDIR@ /opt/gnu@BASELIBDIR@ @EXECPREFIX@/GNU@BASELIBDIR@ /opt/GNU@BASELIBDIR@'
+longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xff, 0x7f, 0x00, 0x00'
 longdblkind='3'
+longdblmantbits='64'
+longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0xff, 0xff, 0x32, 0xf7'
 longdblsize='16'
 longlongsize='8'
 longsize='8'
@@ -948,6 +955,7 @@ nv_preserves_uv_bits='53'
 nveformat='"e"'
 nvfformat='"f"'
 nvgformat='"g"'
+nvmantbits='52'
 nvsize='8'
 nvtype='double'
 o_nonblock='O_NONBLOCK'
@@ -957,11 +965,11 @@ optimize='-O2'
 orderlib='false'
 osname='linux'
 osvers='3.19.5-yocto-standard'
-otherlibdirs='@LIBDIR@/perl/5.22.1'
+otherlibdirs='@LIBDIR@/perl/5.24.0'
 package='perl'
 pager='/usr/bin/less -isr'
 passcat='cat /etc/passwd'
-patchlevel='22'
+patchlevel='24'
 path_sep=':'
 perl5='@USRBIN@/perl'
 perl='perl'
@@ -978,8 +986,8 @@ pmake=''
 pr=''
 prefix='@EXECPREFIX@'
 prefixexp='@EXECPREFIX@'
-privlib='@LIBDIR@/perl/5.22.1'
-privlibexp='@LIBDIR@/perl/5.22.1'
+privlib='@LIBDIR@/perl/5.24.0'
+privlibexp='@LIBDIR@/perl/5.24.0'
 procselfexe='"/proc/self/exe"'
 prototype='define'
 ptrsize='8'
@@ -1045,17 +1053,17 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size='69'
 signal_t='void'
-sitearch='@LIBDIR@/perl/site_perl/5.22.1/@ARCH@-thread-multi'
-sitearchexp='@LIBDIR@/perl/site_perl/5.22.1/@ARCH@-thread-multi'
+sitearch='@LIBDIR@/perl/site_perl/5.24.0/@ARCH@-thread-multi'
+sitearchexp='@LIBDIR@/perl/site_perl/5.24.0/@ARCH@-thread-multi'
 sitebin='@USRBIN@'
 sitebinexp='@USRBIN@'
 sitehtml1dir=''
 sitehtml1direxp=''
 sitehtml3dir=''
 sitehtml3direxp=''
-sitelib='@LIBDIR@/perl/site_perl/5.22.1'
+sitelib='@LIBDIR@/perl/site_perl/5.24.0'
 sitelib_stem='@LIBDIR@/perl/site_perl'
-sitelibexp='@LIBDIR@/perl/site_perl/5.22.1'
+sitelibexp='@LIBDIR@/perl/site_perl/5.24.0'
 siteman1dir=''
 siteman1direxp=''
 siteman3dir=''
@@ -1134,8 +1142,8 @@ uname='uname'
 uniq='uniq'
 uquadtype='unsigned long'
 use5005threads='undef'
-use64bitall='define'
-use64bitint='define'
+use64bitall='undef'
+use64bitint='undef'
 usecbacktrace='undef'
 usecrosscompile='define'
 usedevel='undef'
@@ -1174,17 +1182,17 @@ uvtype='unsigned long'
 uvuformat='"lu"'
 uvxformat='"lx"'
 vaproto='define'
-vendorarch='@LIBDIR@/perl/vendor_perl/5.22.1/@ARCH@-thread-multi'
-vendorarchexp='@LIBDIR@/perl/vendor_perl/5.22.1/@ARCH@-thread-multi'
+vendorarch='@LIBDIR@/perl/vendor_perl/5.24.0/@ARCH@-thread-multi'
+vendorarchexp='@LIBDIR@/perl/vendor_perl/5.24.0/@ARCH@-thread-multi'
 vendorbin='@USRBIN@'
 vendorbinexp='@USRBIN@'
 vendorhtml1dir=' '
 vendorhtml1direxp=''
 vendorhtml3dir=' '
 vendorhtml3direxp=''
-vendorlib='@LIBDIR@/perl/vendor_perl/5.22.1'
+vendorlib='@LIBDIR@/perl/vendor_perl/5.24.0'
 vendorlib_stem='@LIBDIR@/perl/vendor_perl'
-vendorlibexp='@LIBDIR@/perl/vendor_perl/5.22.1'
+vendorlibexp='@LIBDIR@/perl/vendor_perl/5.24.0'
 vendorman1dir=' '
 vendorman1direxp=''
 vendorman3dir=' '
@@ -1193,8 +1201,8 @@ vendorprefix='@EXECPREFIX@'
 vendorprefixexp='@EXECPREFIX@'
 vendorscript='@USRBIN@'
 vendorscriptexp='@USRBIN@'
-version='5.22.1'
-version_patchlevel_string='version 22 subversion 1'
+version='5.24.0'
+version_patchlevel_string='version 24 subversion 0'
 versiononly='undef'
 vi=''
 xlibpth='@LIBDIR@/386 @BASELIBDIR@386'
@@ -1203,10 +1211,10 @@ yaccflags=''
 zcat=''
 zip='zip'
 PERL_REVISION=5
-PERL_VERSION=22
-PERL_SUBVERSION=1
+PERL_VERSION=24
+PERL_SUBVERSION=0
 PERL_API_REVISION=5
-PERL_API_VERSION=22
+PERL_API_VERSION=24
 PERL_API_SUBVERSION=0
 PERL_PATCHLEVEL=''
 PERL_CONFIG_SH=true
@@ -1219,3 +1227,23 @@ d_clock_gettime='define'
 d_clock_getres='define'
 d_clock='define'
 d_nanosleep='define'
+
+# for Signinfo
+d_siginfo_si_errno='define'
+d_siginfo_si_pid='define'
+d_siginfo_si_uid='define'
+d_siginfo_si_addr='define'
+d_siginfo_si_status='define'
+d_siginfo_si_band='define'
+d_siginfo_si_value='define'
+
+# don't support fdclose
+d_fdclose='undef'
+
+# support memmem
+d_memmem='define'
+
+# for locale
+d_newlocale='define'
+d_freelocale='define'
+d_uselocale='define'
diff --git a/meta/recipes-devtools/perl/perl/debian/errno_ver.diff b/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
index bcb59c6..3d09229 100644
--- a/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
+++ b/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
@@ -1,8 +1,8 @@
-From 827eee225897c35ec97194a5971bf4bfcf250748 Mon Sep 17 00:00:00 2001
+From 8e1efba7560d8d55524c7a0f1b0539ddce419b86 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
-Subject: Remove Errno version check due to upgrade problems with long-running
- processes.
+Subject: [PATCH 6/8] Remove Errno version check due to upgrade problems with
+ long-running processes.
 
 Bug-Debian: http://bugs.debian.org/343351
 
@@ -11,25 +11,27 @@ processes embedding perl when upgrading to a newer version,
 compatible, but built on a different machine.
 
 Patch-Name: debian/errno_ver.diff
+
 ---
  ext/Errno/Errno_pm.PL | 5 -----
  1 file changed, 5 deletions(-)
 
 diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
-index c6bfa06..519e5c7 100644
+index 6251a3c..eeed445 100644
 --- a/ext/Errno/Errno_pm.PL
 +++ b/ext/Errno/Errno_pm.PL
-@@ -278,13 +278,8 @@ sub write_errno_pm {
- 
- package Errno;
- require Exporter;
+@@ -294,11 +294,6 @@ EDQ
+     # they've already declared perl doesn't need to worry about this risk.
+     if(!$ENV{'PERL_BUILD_EXPAND_CONFIG_VARS'}) {
+         print <<"CONFIG_CHECK_END";
 -use Config;
- use strict;
- 
 -"\$Config{'archname'}-\$Config{'osvers'}" eq
 -"$archname-$Config{'osvers'}" or
 -	die "Errno architecture ($archname-$Config{'osvers'}) does not match executable architecture (\$Config{'archname'}-\$Config{'osvers'})";
 -
- our \$VERSION = "$VERSION";
- \$VERSION = eval \$VERSION;
- our \@ISA = 'Exporter';
+ CONFIG_CHECK_END
+ }
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/perl/perl/debian/prune_libs.diff b/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
index b4443f6..d153e0e 100644
--- a/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
@@ -1,7 +1,8 @@
-From 21bc033755f0b609f9bb2aa9e98b10d58424406f Mon Sep 17 00:00:00 2001
+From c4538f966c49e356599358def7d1febf61bca21f Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
-Subject: Prune the list of libraries wanted to what we actually need.
+Subject: [PATCH 15/49] Prune the list of libraries wanted to what we actually
+ need.
 
 Bug-Debian: http://bugs.debian.org/128355
 
@@ -9,25 +10,26 @@ We want to keep the dependencies on perl-base as small as possible,
 and some of the original list may be present on buildds (see Bug#128355).
 
 Patch-Name: debian/prune_libs.diff
+
 ---
  Configure | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/Configure b/Configure
-index 0a405d3..6fcc3bc 100755
+index 5a353d6..a00df64 100755
 --- a/Configure
 +++ b/Configure
-@@ -1454,8 +1454,7 @@ libswanted_uselargefiles=''
- : set usesocks on the Configure command line to enable socks.
+@@ -1479,8 +1479,7 @@ archname=''
+ usereentrant='undef'
  : List of libraries we want.
  : If anyone needs extra -lxxx, put those in a hint file.
--libswanted="cl pthread socket bind inet nsl nm ndbm gdbm dbm db malloc dl ld"
+-libswanted="cl pthread socket bind inet nsl ndbm gdbm dbm db malloc dl ld"
 -libswanted="$libswanted sun m crypt sec util c cposix posix ucb bsd BSD"
 +libswanted='gdbm gdbm_compat db dl m c crypt'
  : We probably want to search /usr/shlib before most other libraries.
  : This is only used by the lib/ExtUtils/MakeMaker.pm routine extliblist.
  glibpth=`echo " $glibpth " | sed -e 's! /usr/shlib ! !'`
-@@ -23593,7 +23592,7 @@ sunos*X4*)
+@@ -24007,7 +24006,7 @@ sunos*X4*)
      ;;
  *) case "$usedl" in
      $define|true|[yY]*)
@@ -36,3 +38,6 @@ index 0a405d3..6fcc3bc 100755
  	    shift
  	    perllibs="$*"
  	    ;;
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/perl/perl/dynaloaderhack.patch b/meta/recipes-devtools/perl/perl/dynaloaderhack.patch
index 3df5933..719f07c 100644
--- a/meta/recipes-devtools/perl/perl/dynaloaderhack.patch
+++ b/meta/recipes-devtools/perl/perl/dynaloaderhack.patch
@@ -1,3 +1,8 @@
+From 2e0ce5d27e70defd66ace0661af7c24daae34f8b Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sat, 19 Jan 2013 23:49:24 +0000
+Subject: [PATCH 7/8] perl: Add dyanloader build hack
+
 Hack the dynamic module loader so that we use native modules since we can't load
 the target ones.
 
@@ -6,14 +11,18 @@ Upstream-Status: Inappropriate
 RP
 2013/01/13
 
-Index: perl-5.14.2/ext/DynaLoader/DynaLoader_pm.PL
-===================================================================
---- perl-5.14.2.orig/ext/DynaLoader/DynaLoader_pm.PL	2011-09-19 13:18:22.000000000 +0000
-+++ perl-5.14.2/ext/DynaLoader/DynaLoader_pm.PL	2013-01-19 16:09:51.020584945 +0000
-@@ -310,6 +310,10 @@
+---
+ ext/DynaLoader/DynaLoader_pm.PL | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ext/DynaLoader/DynaLoader_pm.PL b/ext/DynaLoader/DynaLoader_pm.PL
+index e828f35..4021559 100644
+--- a/ext/DynaLoader/DynaLoader_pm.PL
++++ b/ext/DynaLoader/DynaLoader_pm.PL
+@@ -343,6 +343,10 @@ sub bootstrap {
      foreach (@INC) {
  	<<$^O-eq-VMS>>chop($_ = VMS::Filespec::unixpath($_));<</$^O-eq-VMS>>
- 	    my $dir = "$_/auto/$modpname";
+ 	    $dir = "$_/auto/$modpname";
 +
 +	if (defined $ENV{PERL_LIB} and defined $ENV{PERLHOSTLIB}) {
 +	    $dir =~ s/$ENV{PERL_LIB}/$ENV{PERLHOSTLIB}/g;
@@ -21,3 +30,6 @@ Index: perl-5.14.2/ext/DynaLoader/DynaLoader_pm.PL
  	
  	next unless -d $dir; # skip over uninteresting directories
  	
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch
deleted file mode 100644
index 7b4a001..0000000
--- a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2015-8607.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 652c8d4852a69f1bb4d387946f9b76350a1f0d0e Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 15 Dec 2015 10:56:54 +1100
-Subject: [PATCH] perl: fix CVE-2015-8607
-
-ensure File::Spec::canonpath() preserves taint
-
-Previously the unix specific XS implementation of canonpath() would
-return an untainted path when supplied a tainted path.
-
-For the empty string case, newSVpvs() already sets taint as needed on
-its result.
-
-This issue was assigned CVE-2015-8607.  [perl #126862]
-
-Backport patch from http://perl5.git.perl.org/perl.git/commitdiff/0b6f93036de171c12ba95d415e264d9cf7f4e1fd
-
-Upstream-Status: Backport
-CVE: CVE-2015-8607
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- dist/PathTools/Cwd.xs    |  1 +
- dist/PathTools/t/taint.t | 19 ++++++++++++++++++-
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/dist/PathTools/Cwd.xs b/dist/PathTools/Cwd.xs
-index 9d4dcf0..3d018dc 100644
---- a/dist/PathTools/Cwd.xs
-+++ b/dist/PathTools/Cwd.xs
-@@ -535,6 +535,7 @@ THX_unix_canonpath(pTHX_ SV *path)
-     *o = 0;
-     SvPOK_on(retval);
-     SvCUR_set(retval, o - SvPVX(retval));
-+    SvTAINT(retval);
-     return retval;
- }
- 
-diff --git a/dist/PathTools/t/taint.t b/dist/PathTools/t/taint.t
-index 309b3e5..48f8c5b 100644
---- a/dist/PathTools/t/taint.t
-+++ b/dist/PathTools/t/taint.t
-@@ -12,7 +12,7 @@ use Test::More;
- BEGIN {
-     plan(
-         ${^TAINT}
--        ? (tests => 17)
-+        ? (tests => 21)
-         : (skip_all => "A perl without taint support")
-     );
- }
-@@ -34,3 +34,20 @@ foreach my $func (@Functions) {
- 
- # Previous versions of Cwd tainted $^O
- is !tainted($^O), 1, "\$^O should not be tainted";
-+
-+{
-+    # [perl #126862] canonpath() loses taint
-+    my $tainted = substr($ENV{PATH}, 0, 0);
-+    # yes, getcwd()'s result should be tainted, and is tested above
-+    # but be sure
-+    ok tainted(File::Spec->canonpath($tainted . Cwd::getcwd)),
-+        "canonpath() keeps taint on non-empty string";
-+    ok tainted(File::Spec->canonpath($tainted)),
-+        "canonpath() keeps taint on empty string";
-+
-+    (Cwd::getcwd() =~ /^(.*)/);
-+    my $untainted = $1;
-+    ok !tainted($untainted), "make sure our untainted value is untainted";
-+    ok !tainted(File::Spec->canonpath($untainted)),
-+        "canonpath() doesn't add taint to untainted string";
-+}
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch b/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch
deleted file mode 100644
index 99fa8d9..0000000
--- a/meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-CVE: CVE-2016-2381
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2016-2381 from
-
-http://perl5.git.perl.org/perl.git/commitdiff/ae37b791a73a9e78dedb89fb2429d2628cf58076
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From: Tony Cook <tony@develop-help.com>
-Date: Wed, 27 Jan 2016 00:52:15 +0000 (+1100)
-Subject: remove duplicate environment variables from environ
-X-Git-Tag: v5.23.9~170
-X-Git-Url: http://perl5.git.perl.org/perl.git/commitdiff_plain/ae37b791a73a9e78dedb89fb2429d2628cf58076
-
-remove duplicate environment variables from environ
-
-If we see duplicate environment variables while iterating over
-environ[]:
-
-a) make sure we use the same value in %ENV that getenv() returns.
-
-Previously on a duplicate, %ENV would have the last entry for the name
-from environ[], but a typical getenv() would return the first entry.
-
-Rather than assuming all getenv() implementations return the first entry
-explicitly call getenv() to ensure they agree.
-
-b) remove duplicate entries from environ
-
-Previously if there was a duplicate definition for a name in environ[]
-setting that name in %ENV could result in an unsafe value being passed
-to a child process, so ensure environ[] has no duplicates.
-
-CVE-2016-2381
----
-
-diff --git a/perl.c b/perl.c
-index 4a324c6..5c71fd0 100644
---- a/perl.c
-+++ b/perl.c
-@@ -4329,23 +4329,70 @@ S_init_postdump_symbols(pTHX_ int argc, char **argv, char **env)
- 	}
- 	if (env) {
- 	  char *s, *old_var;
-+          STRLEN nlen;
- 	  SV *sv;
-+          HV *dups = newHV();
-+
- 	  for (; *env; env++) {
- 	    old_var = *env;
- 
- 	    if (!(s = strchr(old_var,'=')) || s == old_var)
- 		continue;
-+            nlen = s - old_var;
- 
- #if defined(MSDOS) && !defined(DJGPP)
- 	    *s = '\0';
- 	    (void)strupr(old_var);
- 	    *s = '=';
- #endif
--	    sv = newSVpv(s+1, 0);
--	    (void)hv_store(hv, old_var, s - old_var, sv, 0);
-+            if (hv_exists(hv, old_var, nlen)) {
-+                const char *name = savepvn(old_var, nlen);
-+
-+                /* make sure we use the same value as getenv(), otherwise code that
-+                   uses getenv() (like setlocale()) might see a different value to %ENV
-+                 */
-+                sv = newSVpv(PerlEnv_getenv(name), 0);
-+
-+                /* keep a count of the dups of this name so we can de-dup environ later */
-+                if (hv_exists(dups, name, nlen))
-+                    ++SvIVX(*hv_fetch(dups, name, nlen, 0));
-+                else
-+                    (void)hv_store(dups, name, nlen, newSViv(1), 0);
-+
-+                Safefree(name);
-+            }
-+            else {
-+                sv = newSVpv(s+1, 0);
-+            }
-+	    (void)hv_store(hv, old_var, nlen, sv, 0);
- 	    if (env_is_not_environ)
- 	        mg_set(sv);
- 	  }
-+          if (HvKEYS(dups)) {
-+              /* environ has some duplicate definitions, remove them */
-+              HE *entry;
-+              hv_iterinit(dups);
-+              while ((entry = hv_iternext_flags(dups, 0))) {
-+                  STRLEN nlen;
-+                  const char *name = HePV(entry, nlen);
-+                  IV count = SvIV(HeVAL(entry));
-+                  IV i;
-+                  SV **valp = hv_fetch(hv, name, nlen, 0);
-+
-+                  assert(valp);
-+
-+                  /* try to remove any duplicate names, depending on the
-+                   * implementation used in my_setenv() the iteration might
-+                   * not be necessary, but let's be safe.
-+                   */
-+                  for (i = 0; i < count; ++i)
-+                      my_setenv(name, 0);
-+
-+                  /* and set it back to the value we set $ENV{name} to */
-+                  my_setenv(name, SvPV_nolen(*valp));
-+              }
-+          }
-+          SvREFCNT_dec_NN(dups);
-       }
- #endif /* USE_ENVIRON_ARRAY */
- #endif /* !PERL_MICRO */
diff --git a/meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch b/meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch
deleted file mode 100644
index c489f05..0000000
--- a/meta/recipes-devtools/perl/perl/perl-remove-nm-from-libswanted.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4732711e2548b6d734ca831d65dbcf501a89774e Mon Sep 17 00:00:00 2001
-From: Andreas Koenig <andk@cpan.org>
-Date: Sun, 3 Jan 2016 08:40:33 +0100
-Subject: [PATCH] Remove nm from libswanted
-
-Nm stood for "New Math" library in the context of 1994. 2014 a conflicting
-library libnm appeared that has a network manager context.
-
-Upstream-Status: Backport [commit 4732711e on branch blead, tag v5.25.0]
-
----
- Configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Configure b/Configure
-index 0e71b4b..cfbdaa1 100755
---- a/Configure
-+++ b/Configure
-@@ -1464,7 +1464,7 @@ libswanted_uselargefiles=''
- : set usesocks on the Configure command line to enable socks.
- : List of libraries we want.
- : If anyone needs extra -lxxx, put those in a hint file.
--libswanted="cl pthread socket bind inet nsl nm ndbm gdbm dbm db malloc dl ld"
-+libswanted="cl pthread socket bind inet nsl ndbm gdbm dbm db malloc dl ld"
- libswanted="$libswanted sun m crypt sec util c cposix posix ucb bsd BSD"
- : We probably want to search /usr/shlib before most other libraries.
- : This is only used by the lib/ExtUtils/MakeMaker.pm routine extliblist.
--- 
-2.9.2
-
diff --git a/meta/recipes-devtools/perl/perl/perl-test-customized.patch b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
index 477be29..dc4ab00 100644
--- a/meta/recipes-devtools/perl/perl/perl-test-customized.patch
+++ b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
@@ -1,61 +1,64 @@
-The OE core recipies customize some ExtUtils-MakeMaker modules,
-which causes their MD5 sum to mismatch the provided table and the
-corresponding tests to fail. Also, we patch several test files with
-a backported patch. Update list of hashes to reflect the patched files.
+From 64df09205b6ccb5a434a4e53e8e0a32377ab634f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Thu, 24 Nov 2016 10:49:55 -0600
+Subject: [PATCH] The OE core recipies customize some ExtUtils-MakeMaker
+ modules, which causes their MD5 sum to mismatch the provided table and the
+ corresponding tests to fail. Also, we patch several test files with a
+ backported patch. Update list of hashes to reflect the patched files.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Bill Randle <william.c.randle@intel.com>
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ t/porting/customized.dat | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/t/porting/customized.dat b/t/porting/customized.dat
+index f871a32..e11d147 100644
+--- a/t/porting/customized.dat
++++ b/t/porting/customized.dat
+@@ -3,8 +3,8 @@ Encode cpan/Encode/encoding.pm 51c19efc9bfe8467d6ae12a4654f6e7f980715bf
+ ExtUtils::Constant cpan/ExtUtils-Constant/t/Constant.t a0369c919e216fb02767a637666bb4577ad79b02
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm 8d772fbc6a57637ab24d12a02794073ee71b489c
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm 9be9ac3fee6fd6df702469904e02c8b4c6f2502e
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm bb2443c2314c50f09f7eab4aacc03ade8b9907dd
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 830acdc810e2974d7fd4ec408ea1bfa825c75b69
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 224832767ac102e53daf668a4243f9389a753589
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm effd272b3c9224af6fd0f6cae7183f33ec4b1106
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm 5c41b40e33464c6635258061dff4ece018b46bd9
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 062e5d14a803fbbec8d61803086a3d7997e8a473
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Tutorial.pod a8a9cab7d67922ed3d6883c864e1fe29aaa6ad89
+@@ -14,7 +14,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mkbootstrap.pm 5d5cd55e
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm 23a4b33b974e036d59bf55aa02e025506a408048
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 288df61e9ba7be3505b58b6345091fe1f310a117
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm 8578f2ea4ec9e764a789f6ecf620ea449ddca8c1
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 9f1f6c51fb0337726c99332facc52159c0619fe2
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 0f9eaebf7f93b5de213e60708a0fe257396ee188
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm a0ec076bedfa0c2e52fc2b735fbc75b4c2706bbf
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm 976b10ec76d1fe6f7ee9000b5596e8950434880b
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm bc4b33fa5296ab35bcb1be1c18759b93c4de2598
+@@ -23,7 +23,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_MacOS.pm 83601fa89eb
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm 8185a7db6c4d7e0fdc5001aeaa8c2b612a884a5e
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 2fe66ca8a894d6a2ae340b8bf6f8d69c5e1f7fbe
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm e8a4dbba69a1d551bd581ea6a3f2415bacbc0ae5
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm d666ac424618c3e11b8549755c9646d942bd2d57
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 211d37e5d841e462cf2d0644c43ef01a1366fbee
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm f6581a0e75e45bfc26f343f173d3366c43fb1221
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 1997912b5018970cdeb3dae8fd7e0c24f6e5d567
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm 210a4eda8b081d9986477e3a9762fce6ebea8474
+@@ -32,7 +32,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win95.pm f73ef46755d
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MY.pm 6059d9bb7c4f0c154a61f115aa6b24ba08622b81
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/testlib.pm 6347934cbe40da977790cea6c81987816b2fe26b
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/cd.t 0a71fbd646a7be8358b07b6f64f838243cc0aef4
+-ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 37aec8f794c52e037540757eb5b2556f79419ff7
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 1a93dd8834e4bb0e5facf08204e782807567b2eb
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/NoXS.pm 371cdff1b2375017907cfbc9c8f4a31f5ad10582
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/prereq.t 53bda2c549fd13a6b6c13a070ca6bc79883081c0
+ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/vstrings.t 90035a2bdbf45f15b9c3196d072d7cba7e662871
+-- 
+2.1.4
 
-Index: perl-5.22.1/t/porting/customized.dat
-===================================================================
---- perl-5.22.1.orig/t/porting/customized.dat	2015-10-31 13:36:16.000000000 +0000
-+++ perl-5.22.1/t/porting/customized.dat	2016-06-02 12:50:10.381030204 -0700
-@@ -1,8 +1,8 @@
- CPAN cpan/CPAN/lib/CPAN.pm ce62c43d72f101c011184dbbc59e21c2790826f0
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm 7f4dfd0fe884bd42412bcf04ca80ef97b39c1d54
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm bef099988b15fb0b2a1f5ac48c01af1f7f36d329
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 8168e18f0e3ce3ece4bb7e7c72d57ec07c67c402
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 7115e97a53559cb3ec061dd6f7f344e522724c4a
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 8c22e119b96d674f1f268a9c495bb4aa04e1100b
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 3d7abd674b15ed323f743594ef0bd09db76b1aee
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm f8db8d4245bf0684b8210c811f50d7cfb1a27d78
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 757bffb47857521311f8f3bde43ebe165f8d5191
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Locale.pm 82be06851deb84c6419ad003ce9b6d1957f395f3
-@@ -14,7 +14,7 @@
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm ab80029ab16d38d4f2e41dc88d2ceb9f3790e477
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 453e0abbc4bb38db4c0820ad5c4846f313b66291
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm c1b1babda8f43ae7a2caba1cb4f70f92af5a0e34
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 6f90d94ad3e7aa0045a3b1a10a1bb18391f89f57
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 21bde53290bf1a4da4457290b65bd1b0ca6f1d16
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm cab2b3ce08b71a4ce89aa630f236eb08b852439d
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm 61fced0faf518bf87c265fcb51ed330ba354623f
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm ae0ef51a7b6dd0b05aa61c779df7167dda5f5119
-@@ -23,7 +23,7 @@
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm 433135eecb85b4b1d90d3027432f329436c78447
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 1fbb5605bfb47feee4083feba8aa85e659628f70
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5b66d1f485a6034d96fc24ba1665b1bad9e447f1
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 8cef99a9bd370ecfd07ddb0efbdcbb4101255e45
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 860d520234d7c9036d91f0b143a1dddf2a5e8cb7
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 939572fde3d59ba77c2e677fe2df2bed4bed5898
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 09c2049bfd25b735e2a5bcf56a6cff7b4827f9c8
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm d65d63f8217a55c36f62e249814988974f593c79
-@@ -31,8 +31,16 @@
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win95.pm 12df38eacceeed73cab94c423236bfaed0fbbfec
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MY.pm 22fe9596a0237252f45399a36abc83b7813bc328
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/testlib.pm 7fbc42ca2ebc6c677b79ae5fd5647243cf069463
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/basic.t 6cdc7701b50e586bc9c4cfb1616de8eb0b1baf34
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/pm_to_blib.t 71ebcee355691ce374fcad251b12d8b2412462b3
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/basic.t d78fdec7a4512dc8d2a7abd62b8104530af8ecf9
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 9427f4adebbb13b57b4a76fef2972adf63c9bd96
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t ef356c196bb5c3c428ae309d7f989bdd6d79b86d
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t 3e6d4d6eb2eab42e983ac70eb5737a759af0916f
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/INST.t e553fa0d53c894c8d36aafb69edd55b38a9355f8
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/min_perl_version.t e930ec9217de5a1785d0247c30b159e6f7f5673f
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/PL_FILES.t 7e49ab6c4d467826d22023fa03d77b85f935b58e
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/pm_to_blib.t a04c96eecfab17e4094604e0fb998dd93cf93b93
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/recurs.t 94cce3bff875a878ed27816b3f5df2ca4225c714
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/several_authors.t f811d993c0835c66dc501ed55083acb29bf33bf7
- Text::ParseWords cpan/Text-ParseWords/t/ParseWords.t 9bae51c9b944cd5c0bbabe9d397e573976a2be8e
- Win32API::File cpan/Win32API-File/buffers.h 02d230ac9ac7091365128161a0ed671898baefae
- Win32API::File cpan/Win32API-File/cFile.h fca7e383e76979c3ac3adf12d11d1bcd2618e489
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.24.0.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.22.1.bb
rename to meta/recipes-devtools/perl/perl_5.24.0.bb
index 792a65b..ab50d29 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.0.bb
@@ -40,6 +40,7 @@ SRC_URI += " \
         file://Makefile.patch \
         file://Makefile.SH.patch \
         file://installperl.patch \
+        file://perl-archlib-exp.patch \
         file://perl-dynloader.patch \
         file://perl-moreconfig.patch \
         file://letgcc-find-errno.patch \
@@ -48,7 +49,6 @@ SRC_URI += " \
         file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
         file://fix_bad_rpath.patch \
-        file://perl-archlib-exp.patch \
         file://dynaloaderhack.patch \
         file://config.sh \
         file://config.sh-32 \
@@ -65,9 +65,7 @@ SRC_URI += " \
         file://perl-errno-generation-gcc5.patch \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
-        file://perl-fix-CVE-2016-2381.patch \
         file://perl-fix-CVE-2016-6185.patch \
-        file://perl-fix-CVE-2015-8607.patch \
         file://perl-fix-CVE-2016-1238.patch \
 "
 
@@ -77,8 +75,8 @@ SRC_URI_append_class-target = " \
             file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch \
            "
 
-SRC_URI[md5sum] = "6671e4829cbaf9cecafa9a84f141b0a3"
-SRC_URI[sha256sum] = "9e87317d693ce828095204be0d09af8d60b8785533fadea1a82b6f0e071e5c79"
+SRC_URI[md5sum] = "59456ae4bd4b06cb6e57cb19a3b2d349"
+SRC_URI[sha256sum] = "a9a37c0860380ecd7b23aa06d61c20fc5bc6d95198029f3684c44a9d7e2952f2"
 
 inherit perlnative siteinfo
 
-- 
2.1.4


