Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8717E872
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 22:12:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jun 2019 15:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,386,1557212400"; d="scan'208";a="185891266"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2019 15:12:05 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 15:11:43 -0700
Message-Id: <b28d9ed02105e0f469c124e1297163479e2902cb.1560809373.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
References: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] libmodule-build-perl: upgrade 0.4224 -> 0.4229; enable ptest
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
X-List-Received-Date: Mon, 17 Jun 2019 22:12:05 -0000
Content-Transfer-Encoding: 8bit

* Add runtime and ptest dependencies
* Add own run-ptest, since we need to run blib

License-Update: License lines moved up in README

Upstream release notes:

0.4229 - Tue Apr 16 00:49:45 CEST 2019
  - Released 0.42_28 without changes

0.42_28 - Thu Apr 19 16:34:32 CEST 2018

  - Replace "MOTIVATIONS" section with "COMPARISON" [Dan Brook]

  - Update configure, build, test prereqs [Karen Etheridge]

0.4227 - Wed Dec 13 11:17:51 CET 2017

  - Released 0.42_26 without changes

0.42_26 - Wed Dec 13 10:52:39 CET 2017

  - Improve pureperl-only support (#119914) [Shoichi Kaji]

  - Improve the documentation of Module::Build::Compat and dynamic_config [Dan Brook]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/libmodule-build-perl/run-ptest       |  16 +++
 .../perl/libmodule-build-perl_0.4224.bb       |  34 ------
 .../perl/libmodule-build-perl_0.4229.bb       | 103 ++++++++++++++++++
 3 files changed, 119 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
 delete mode 100644 meta/recipes-devtools/perl/libmodule-build-perl_0.4224.bb
 create mode 100644 meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest b/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
new file mode 100644
index 00000000000..0d63d1513bc
--- /dev/null
+++ b/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+for case in `find t -type f -name '*.t'`; do
+    perl -I inc -I blib -Mblib $case >$case.output 2>&1
+    ret=$?
+    cat $case.output
+    if [ $ret -ne 0 ]; then
+        echo "FAIL: ${case%.t}"
+    elif grep -i 'SKIP' $case.output; then
+        echo "SKIP: ${case%.t}"
+    else
+        echo "PASS: ${case%.t}"
+    fi
+
+    rm -f $case.output
+done
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4224.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4224.bb
deleted file mode 100644
index d523a7a0c7b..00000000000
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4224.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Module::Build - Build and install Perl modules"
-DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
-Makefile.PL file to drive distribution configuration, build, test and \
-installation. Traditionally, Build.PL uses Module::Build as the underlying \
-build system. This module provides a simple, lightweight, drop-in replacement. \
-Whereas Module::Build has over 6,700 lines of code; this module has less than \
-120, yet supports the features needed by most distributions."
-
-SECTION = "libs"
-
-HOMEPAGE = "https://metacpan.org/release/Module-Build"
-
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=960;endline=965;md5=624c06db56a2af4d70cf9edc29fcae1b"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz"
-SRC_URI[md5sum] = "b74c2f6e84b60aad3a3defd30b6f0f4d"
-SRC_URI[sha256sum] = "a6ca15d78244a7b50fdbf27f85c85f4035aa799ce7dd018a0d98b358ef7bc782"
-
-S = "${WORKDIR}/Module-Build-${PV}"
-
-inherit cpan_build
-
-# From:
-# https://github.com/rehsack/meta-cpan/blob/master/recipes-devel/module-build-perl/module-build-perl_0.4216.bb
-#
-do_patch_module_build () {
-    cd ${S}
-    sed -i -e 's,my $interpreter = $self->{properties}{perl};,my $interpreter = "${bindir}/perl";,g' lib/Module/Build/Base.pm
-}
-
-do_patch[postfuncs] += "do_patch_module_build"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
new file mode 100644
index 00000000000..f759f862fb2
--- /dev/null
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
@@ -0,0 +1,103 @@
+SUMMARY = "Module::Build - Build and install Perl modules"
+DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
+Makefile.PL file to drive distribution configuration, build, test and \
+installation. Traditionally, Build.PL uses Module::Build as the underlying \
+build system. This module provides a simple, lightweight, drop-in replacement. \
+Whereas Module::Build has over 6,700 lines of code; this module has less than \
+120, yet supports the features needed by most distributions."
+
+SECTION = "libs"
+
+HOMEPAGE = "https://metacpan.org/release/Module-Build"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;beginline=949;endline=954;md5=624c06db56a2af4d70cf9edc29fcae1b"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "1447d9e02e63f7a1643986789a8f1ba9"
+SRC_URI[sha256sum] = "1fe491a6cda914b01bc8e592faa2b5404e9f35915ca15322f8f2a8d8f9008c18"
+
+S = "${WORKDIR}/Module-Build-${PV}"
+
+inherit cpan_build ptest-perl
+
+# From:
+# https://github.com/rehsack/meta-cpan/blob/master/recipes-devel/module-build-perl/module-build-perl_0.4216.bb
+#
+do_patch_module_build () {
+    cd ${S}
+    sed -i -e 's,my $interpreter = $self->{properties}{perl};,my $interpreter = "${bindir}/perl";,g' lib/Module/Build/Base.pm
+}
+
+do_patch[postfuncs] += "do_patch_module_build"
+
+do_install_ptest() {
+	cp -r ${B}/inc ${D}${PTEST_PATH}
+	cp -r ${B}/blib ${D}${PTEST_PATH}
+	chown -R root:root ${D}${PTEST_PATH}
+}
+
+RDEPENDS_${PN} += " \
+    perl-module-carp \
+    perl-module-cpan \
+    perl-module-config \
+    perl-module-cwd \
+    perl-module-data-dumper \
+    perl-module-encode \
+    perl-module-extutils-cbuilder \
+    perl-module-extutils-command \
+    perl-module-extutils-install \
+    perl-module-extutils-installed \
+    perl-module-extutils-mkbootstrap \
+    perl-module-extutils-packlist \
+    perl-module-extutils-parsexs \
+    perl-module-file-basename \
+    perl-module-file-compare \
+    perl-module-file-copy \
+    perl-module-file-find \
+    perl-module-file-glob \
+    perl-module-file-path \
+    perl-module-file-spec \
+    perl-module-file-spec-functions \
+    perl-module-getopt-long \
+    perl-module-metadata \
+    perl-module-perl-ostype \
+    perl-module-pod-man \
+    perl-module-tap-harness \
+    perl-module-text-abbrev \
+    perl-module-text-parsewords \
+    perl-module-utf8 \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    gcc \
+    make \
+    perl-module-blib \
+    perl-module-file-temp \
+    perl-module-lib \
+    perl-module-perlio \
+    perl-module-perlio-encoding \
+    perl-module-pod-text \
+    perl-module-tap-harness-env \
+    perl-module-tap-parser \
+    perl-module-tap-parser-scheduler \
+    perl-module-test-harness \
+    perl-module-test-more \
+"
+
+RPROVIDES_${PN} += "\
+    libmodule-build-base-perl \
+    libmodule-build-compat-perl \
+    libmodule-build-config-perl \
+    libmodule-build-cookbook-perl \
+    libmodule-build-dumper-perl \
+    libmodule-build-notes-perl \
+    libmodule-build-ppmaker-perl \
+    libmodule-build-platform-default-perl \
+    libmodule-build-platform-unix-perl \
+    libmodule-build-podparser-perl \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


