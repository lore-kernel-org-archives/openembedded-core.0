Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BBAA078757
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:56:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 08:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,326,1511856000"; d="scan'208";a="22121375"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 07 Jan 2018 08:56:10 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Jan 2018 08:56:08 -0800
Message-Id: <1515344168-80832-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515344168-80832-1-git-send-email-juro.bystricky@intel.com>
References: <1515344168-80832-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/2] perl-ptest: various fixes
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
X-List-Received-Date: Sun, 07 Jan 2018 16:56:10 -0000

Improve reproducibility: Remove all build host references from
distributed files.

Do not package non-linux OS related files.
Also remove some additional files not needed by run-ptest. (There are
probably still more files that can be removed, but as long as they
don't leak build host references they are harmless).

Fix the expected checksum of MakeMaker/lib/ExtUtils/Liblist/Kid.pm
to match the one expected: We modified the file, but did not
recalculate/update the file checksum accordingly.
(This fixes the only failing test.)

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc          | 32 +++++++++++++++-------
 .../perl/perl/perl-test-customized.patch           |  2 +-
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 1f549af..6a7a2d7 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -2,31 +2,43 @@ inherit ptest
 
 SRC_URI += "file://run-ptest \
            "
-
 do_install_ptest () {
 	mkdir -p ${D}${PTEST_PATH}
 	sed -e "s:\/usr\/local:${bindir}:g" -i cpan/version/t/*
 	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
 	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
-	tar -c --exclude=\*.o --exclude=libperl.so --exclude=Makefile --exclude=makefile --exclude=hostperl \
+	tar -c --exclude='*.o' --exclude=libperl.so --exclude=Makefile --exclude=makefile --exclude=hostperl \
+	    --exclude=cygwin --exclude=os2 --exclude=djgpp --exclude=qnx --exclude=symbian --exclude=haiku \
+	    --exclude=vms --exclude=vos --exclude=NetWare --exclude=amigaos4  --exclude=buildcustomize.pl \
+	    --exclude='win32/config.*' --exclude=plan9 --exclude=README.plan9 --exclude=perlplan9.pod --exclude=Configure \
+	    --exclude=veryclean.sh --exclude=realclean.sh  --exclude=getioctlsizes \
+	    --exclude=dl_aix.xs --exclude=sdbm.3 --exclude='cflags.SH' --exclude=makefile.old \
 		--exclude=miniperl --exclude=generate_uudmap --exclude=patches * | ( cd ${D}${PTEST_PATH} && tar -x )
 
-	sed -i -e "s,${D},,g" \
+	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
+
+	# Remove build host references from various scattered files...
+	find "${D}${PTEST_PATH}" \
+	     \( -name '*.PL' -o -name 'myconfig' -o -name 'cflags' -o -name '*.pl' -o -name '*.sh' -o -name '*.pm' \
+	     -o -name 'h2xs' -o -name 'h2ph' \
+	     -o -name '*.h' -o -name 'config.sh-*' -o -name 'pod2man'  -o -name 'pod2text' \) \
+	    -type f -exec sed -i \
+	       -e "s,${D},,g" \
 	       -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
 	       -e "s,-isystem${STAGING_INCDIR} ,,g" \
+	       -e 's|${DEBUG_PREFIX_MAP}||g' \
+	       -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
 	       -e "s,${STAGING_LIBDIR},${libdir},g" \
 	       -e "s,${STAGING_BINDIR},${bindir},g" \
 	       -e "s,${STAGING_INCDIR},${includedir},g" \
-	       -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
 	       -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
 	       -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
-	    ${D}${PTEST_PATH}/lib/Config.pm \
-	    ${D}${PTEST_PATH}/cpan/podlators/scripts/pod2man \
-	    ${D}${PTEST_PATH}/cpan/podlators/scripts/pod2text
+	       -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+	       -e 's:${RECIPE_SYSROOT}::g' \
+	        {} +
 
-	ln -sf ${bindir}/perl ${D}${PTEST_PATH}/t/perl
-	# Remove plan9 related stuff
-	rm -rf ${D}${PTEST_PATH}/plan9 ${D}${PTEST_PATH}/README.plan9 ${D}${PTEST_PATH}/pod/perlplan9.pod
+	 # Remove a useless timestamp...
+	 sed -i -e '/Autogenerated starting on/d' ${D}${PTEST_PATH}/lib/unicore/mktables.lst
 }
 
 python populate_packages_prepend() {
diff --git a/meta/recipes-devtools/perl/perl/perl-test-customized.patch b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
index 90e4dcd..1d9a56d 100644
--- a/meta/recipes-devtools/perl/perl/perl-test-customized.patch
+++ b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
@@ -32,7 +32,7 @@ index defeae1..b5d3c46 100644
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm 0e1e4c25eddb999fec6c4dc66593f76db34cfd16
 -ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm bfd2aa00ca4ed251f342e1d1ad704abbaf5a615e
 -ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 5529ae3064365eafd99536621305d52f4ab31b45
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm d593d8fdc5c0ebcb6d3701c70fc6640c50d93455
++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm f1ca5ec247eb69ba13a269f34dc205da37b61244
 +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm bf9174c70a0e50ff2fee4552c7df89b37d292da1
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm bc88b275af73b8faac6abd59a9aad3f625925810
  ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 062e5d14a803fbbec8d61803086a3d7997e8a473
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index ab04624..0baf3ab 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -244,6 +244,7 @@ perl_package_preprocess () {
                -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g" \
                -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
                -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
+               -e 's:${RECIPE_SYSROOT}::g' \
             ${PKGD}${bindir}/h2xs \
             ${PKGD}${bindir}/h2ph \
             ${PKGD}${bindir}/pod2man \
-- 
2.7.4


