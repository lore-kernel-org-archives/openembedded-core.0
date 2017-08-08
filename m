Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B648671975
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:34:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2017 08:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,343,1498546800"; d="scan'208";a="1001363525"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 08 Aug 2017 08:34:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Aug 2017 18:30:48 +0300
Message-Id: <0a3d54028e89fa9dbee773f35435cb92566e729b.1502206031.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
References: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/4] openssl: add a 1.1 version
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

Existing openssl 1.0 recipe is renamed to openssl10; it will
continue to be provided for as long as upstream supports it
(and there are still several recipes which do not work with openssl
1.1 due to API differences).

A few files (such as openssl binary) are no longer installed by openssl 1.0,
because they clash with openssl 1.1.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/no-static-libs.inc        |   3 +
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
 38 files changed, 491 insertions(+), 5 deletions(-)
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

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index f8d8c09cf0f..7c165c717fc 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -25,6 +25,9 @@ DISABLE_STATIC_pn-openjade-native = ""
 DISABLE_STATIC_pn-openssl = ""
 DISABLE_STATIC_pn-openssl-native = ""
 DISABLE_STATIC_pn-nativesdk-openssl = ""
+DISABLE_STATIC_pn-openssl10 = ""
+DISABLE_STATIC_pn-openssl10-native = ""
+DISABLE_STATIC_pn-nativesdk-openssl10 = ""
 # libssp-static-dev included in build-appliance
 DISABLE_STATIC_pn-gcc-runtime = ""
 # libusb1-native is used to build static dfu-util-native
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch b/meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch
new file mode 100644
index 00000000000..736bb39acd1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch
@@ -0,0 +1,49 @@
+From 3fdb1e2a16ea405c6731447a8994f222808ef7e6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 7 Apr 2017 18:01:52 +0300
+Subject: [PATCH] Remove test that requires running as non-root
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ test/recipes/40-test_rehash.t | 17 +----------------
+ 1 file changed, 1 insertion(+), 16 deletions(-)
+
+diff --git a/test/recipes/40-test_rehash.t b/test/recipes/40-test_rehash.t
+index f902c23..c7567c1 100644
+--- a/test/recipes/40-test_rehash.t
++++ b/test/recipes/40-test_rehash.t
+@@ -23,7 +23,7 @@ setup("test_rehash");
+ plan skip_all => "test_rehash is not available on this platform"
+     unless run(app(["openssl", "rehash", "-help"]));
+ 
+-plan tests => 5;
++plan tests => 3;
+ 
+ indir "rehash.$$" => sub {
+     prepare();
+@@ -42,21 +42,6 @@ indir "rehash.$$" => sub {
+        'Testing rehash operations on empty directory');
+ }, create => 1, cleanup => 1;
+ 
+-indir "rehash.$$" => sub {
+-    prepare();
+-    chmod 0500, curdir();
+-  SKIP: {
+-      if (!ok(!open(FOO, ">unwritable.txt"),
+-              "Testing that we aren't running as a privileged user, such as root")) {
+-          close FOO;
+-          skip "It's pointless to run the next test as root", 1;
+-      }
+-      isnt(run(app(["openssl", "rehash", curdir()])), 1,
+-           'Testing rehash operations on readonly directory');
+-    }
+-    chmod 0700, curdir();       # make it writable again, so cleanup works
+-}, create => 1, cleanup => 1;
+-
+ sub prepare {
+     my @pemsourcefiles = sort glob(srctop_file('test', "*.pem"));
+     my @destfiles = ();
+-- 
+2.11.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch b/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
new file mode 100644
index 00000000000..6ce4e47d712
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
@@ -0,0 +1,43 @@
+From 08face4353d80111973aba9c1304c92158cfad0e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 28 Mar 2017 16:40:12 +0300
+Subject: [PATCH] Take linking flags from LDFLAGS env var
+
+This fixes "No GNU_HASH in the elf binary" issues.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Configurations/unix-Makefile.tmpl | 2 +-
+ Configure                         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index c029817..43b769b 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -173,7 +173,7 @@ CROSS_COMPILE= {- $config{cross_compile_prefix} -}
+ CC= $(CROSS_COMPILE){- $target{cc} -}
+ CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
+ CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
+-LDFLAGS= {- $target{lflags} -}
++LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
+ PLIB_LDFLAGS= {- $target{plib_lflags} -}
+ EX_LIBS= {- $target{ex_libs} -} {- $config{ex_libs} -}
+ LIB_CFLAGS={- $target{shared_cflag} || "" -}
+diff --git a/Configure b/Configure
+index aee7cc3..274d236 100755
+--- a/Configure
++++ b/Configure
+@@ -979,7 +979,7 @@ $config{build_file} = $target{build_file};
+ $config{defines} = [];
+ $config{cflags} = "";
+ $config{ex_libs} = "";
+-$config{shared_ldflag} = "";
++$config{shared_ldflag} = $ENV{'LDFLAGS'};
+ 
+ # Make sure build_scheme is consistent.
+ $target{build_scheme} = [ $target{build_scheme} ]
+-- 
+2.11.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
old mode 100755
new mode 100644
index 3b20fce1ee9..65c6cc7b862
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -1,2 +1,4 @@
 #!/bin/sh
-make -k runtest
+cd test
+OPENSSL_ENGINES=../engines BLDTOP=.. SRCTOP=.. perl run_tests.pl
+cd ..
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl10.inc
similarity index 95%
rename from meta/recipes-connectivity/openssl/openssl.inc
rename to meta/recipes-connectivity/openssl/openssl10.inc
index ce295e8f37a..30aaeae1d43 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -37,8 +37,6 @@ FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc"
 RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 
-PROVIDES += "openssl10"
-
 # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
 # package RRECOMMENDS on this package.  This will enable the configuration
 # file to be installed for both the base openssl package and the libcrypto
@@ -252,3 +250,15 @@ do_install_append_class-native() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGE_PREPROCESS_FUNCS += "openssl_package_preprocess"
+
+openssl_package_preprocess () {
+        for file in `find ${PKGD} -name *.h -o -name *.pc -o -name *.so`; do
+                rm $file
+        done
+        rm ${PKGD}/usr/bin/openssl
+        rm ${PKGD}/usr/bin/c_rehash
+        rmdir ${PKGD}/usr/bin
+
+}
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl10/0001-Fix-build-with-clang-using-external-assembler.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl10/Makefiles-ptest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch
rename to meta/recipes-connectivity/openssl/openssl10/Makefiles-ptest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl10/Use-SHA256-not-MD5-as-default-digest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
rename to meta/recipes-connectivity/openssl/openssl10/Use-SHA256-not-MD5-as-default-digest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl10/configure-musl-target.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
rename to meta/recipes-connectivity/openssl/openssl10/configure-musl-target.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl10/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl10/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl10/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl10/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl10/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl10/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl10/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl10/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl10/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl10/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_digicert_malaysia.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_digicert_malaysia.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_digicert_malaysia.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_diginotar.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_diginotar.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_diginotar.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/soname.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/soname.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl10/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl10/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/find.pl b/meta/recipes-connectivity/openssl/openssl10/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/find.pl
rename to meta/recipes-connectivity/openssl/openssl10/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl10/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl10/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-asm.patch b/meta/recipes-connectivity/openssl/openssl10/openssl-1.0.2a-x32-asm.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/openssl-1.0.2a-x32-asm.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl-1.0.2a-x32-asm.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh
new file mode 100644
index 00000000000..6620fdcb53f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh
@@ -0,0 +1,222 @@
+#!/bin/sh
+#
+# Ben Secrest <blsecres@gmail.com>
+#
+# sh c_rehash script, scan all files in a directory
+# and add symbolic links to their hash values.
+#
+# based on the c_rehash perl script distributed with openssl
+#
+# LICENSE: See OpenSSL license
+# ^^acceptable?^^
+#
+
+# default certificate location
+DIR=/etc/openssl
+
+# for filetype bitfield
+IS_CERT=$(( 1 << 0 ))
+IS_CRL=$(( 1 << 1 ))
+
+
+# check to see if a file is a certificate file or a CRL file
+# arguments:
+#       1. the filename to be scanned
+# returns:
+#       bitfield of file type; uses ${IS_CERT} and ${IS_CRL}
+#
+check_file()
+{
+    local IS_TYPE=0
+
+    # make IFS a newline so we can process grep output line by line
+    local OLDIFS=${IFS}
+    IFS=$( printf "\n" )
+
+    # XXX: could be more efficient to have two 'grep -m' but is -m portable?
+    for LINE in $( grep '^-----BEGIN .*-----' ${1} )
+    do
+	if echo ${LINE} \
+	    | grep -q -E '^-----BEGIN (X509 |TRUSTED )?CERTIFICATE-----'
+	then
+	    IS_TYPE=$(( ${IS_TYPE} | ${IS_CERT} ))
+
+	    if [ $(( ${IS_TYPE} & ${IS_CRL} )) -ne 0 ]
+	    then
+	    	break
+	    fi
+	elif echo ${LINE} | grep -q '^-----BEGIN X509 CRL-----'
+	then
+	    IS_TYPE=$(( ${IS_TYPE} | ${IS_CRL} ))
+
+	    if [ $(( ${IS_TYPE} & ${IS_CERT} )) -ne 0 ]
+	    then
+	    	break
+	    fi
+	fi
+    done
+
+    # restore IFS
+    IFS=${OLDIFS}
+
+    return ${IS_TYPE}
+}
+
+
+#
+# use openssl to fingerprint a file
+#    arguments:
+#	1. the filename to fingerprint
+#	2. the method to use (x509, crl)
+#    returns:
+#	none
+#    assumptions:
+#	user will capture output from last stage of pipeline
+#
+fingerprint()
+{
+    ${SSL_CMD} ${2} -fingerprint -noout -in ${1} | sed 's/^.*=//' | tr -d ':'
+}
+
+
+#
+# link_hash - create links to certificate files
+#    arguments:
+#       1. the filename to create a link for
+#	2. the type of certificate being linked (x509, crl)
+#    returns:
+#	0 on success, 1 otherwise
+#
+link_hash()
+{
+    local FINGERPRINT=$( fingerprint ${1} ${2} )
+    local HASH=$( ${SSL_CMD} ${2} -hash -noout -in ${1} )
+    local SUFFIX=0
+    local LINKFILE=''
+    local TAG=''
+
+    if [ ${2} = "crl" ]
+    then
+    	TAG='r'
+    fi
+
+    LINKFILE=${HASH}.${TAG}${SUFFIX}
+
+    while [ -f ${LINKFILE} ]
+    do
+	if [ ${FINGERPRINT} = $( fingerprint ${LINKFILE} ${2} ) ]
+	then
+	    echo "NOTE: Skipping duplicate file ${1}" >&2
+	    return 1
+	fi	
+
+	SUFFIX=$(( ${SUFFIX} + 1 ))
+	LINKFILE=${HASH}.${TAG}${SUFFIX}
+    done
+
+    echo "${3} => ${LINKFILE}"
+
+    # assume any system with a POSIX shell will either support symlinks or
+    # do something to handle this gracefully
+    ln -s ${3} ${LINKFILE}
+
+    return 0
+}
+
+
+# hash_dir create hash links in a given directory
+hash_dir()
+{
+    echo "Doing ${1}"
+
+    cd ${1}
+
+    ls -1 * 2>/dev/null | while read FILE
+    do
+        if echo ${FILE} | grep -q -E '^[[:xdigit:]]{8}\.r?[[:digit:]]+$' \
+	    	&& [ -h "${FILE}" ]
+        then
+            rm ${FILE}
+        fi
+    done
+
+    ls -1 *.pem *.cer *.crt *.crl 2>/dev/null | while read FILE
+    do
+	REAL_FILE=${FILE}
+	# if we run on build host then get to the real files in rootfs
+	if [ -n "${SYSROOT}" -a -h ${FILE} ]
+	then
+	    FILE=$( readlink ${FILE} )
+	    # check the symlink is absolute (or dangling in other word)
+	    if [ "x/" = "x$( echo ${FILE} | cut -c1 -)" ]
+	    then
+		REAL_FILE=${SYSROOT}/${FILE}
+	    fi
+	fi
+
+	check_file ${REAL_FILE}
+        local FILE_TYPE=${?}
+	local TYPE_STR=''
+
+        if [ $(( ${FILE_TYPE} & ${IS_CERT} )) -ne 0 ]
+        then
+            TYPE_STR='x509'
+        elif [ $(( ${FILE_TYPE} & ${IS_CRL} )) -ne 0 ]
+        then
+            TYPE_STR='crl'
+        else
+            echo "NOTE: ${FILE} does not contain a certificate or CRL: skipping" >&2
+	    continue
+        fi
+
+	link_hash ${REAL_FILE} ${TYPE_STR} ${FILE}
+    done
+}
+
+
+# choose the name of an ssl application
+if [ -n "${OPENSSL}" ]
+then
+    SSL_CMD=$(which ${OPENSSL} 2>/dev/null)
+else
+    SSL_CMD=/usr/bin/openssl
+    OPENSSL=${SSL_CMD}
+    export OPENSSL
+fi
+
+# fix paths
+PATH=${PATH}:${DIR}/bin
+export PATH
+
+# confirm existance/executability of ssl command
+if ! [ -x ${SSL_CMD} ]
+then
+    echo "${0}: rehashing skipped ('openssl' program not available)" >&2
+    exit 0
+fi
+
+# determine which directories to process
+old_IFS=$IFS
+if [ ${#} -gt 0 ]
+then
+    IFS=':'
+    DIRLIST=${*}
+elif [ -n "${SSL_CERT_DIR}" ]
+then
+    DIRLIST=$SSL_CERT_DIR
+else
+    DIRLIST=${DIR}/certs
+fi
+
+IFS=':'
+
+# process directories
+for CERT_DIR in ${DIRLIST}
+do
+    if [ -d ${CERT_DIR} -a -w ${CERT_DIR} ]
+    then
+        IFS=$old_IFS
+        hash_dir ${CERT_DIR}
+        IFS=':'
+    fi
+done
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl10/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl10/openssl-util-perlpath.pl-cwd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl-util-perlpath.pl-cwd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl10/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/parallel.patch b/meta/recipes-connectivity/openssl/openssl10/parallel.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/parallel.patch
rename to meta/recipes-connectivity/openssl/openssl10/parallel.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl10/ptest-deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/ptest-deps.patch
rename to meta/recipes-connectivity/openssl/openssl10/ptest-deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl10/ptest_makefile_deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/ptest_makefile_deps.patch
rename to meta/recipes-connectivity/openssl/openssl10/ptest_makefile_deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl10/run-ptest b/meta/recipes-connectivity/openssl/openssl10/run-ptest
new file mode 100755
index 00000000000..3b20fce1ee9
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl10/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k runtest
diff --git a/meta/recipes-connectivity/openssl/openssl/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl10/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl10/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb
similarity index 96%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
rename to meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb
index a2ef2ac8fb6..cf0459c94b5 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2l.bb
@@ -1,4 +1,4 @@
-require openssl.inc
+require openssl10.inc
 
 # For target side versions of openssl enable support for OCF Linux driver
 # if they are available.
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
 
-SRC_URI += "file://find.pl;subdir=${BP}/util/ \
+SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
             file://run-ptest \
             file://openssl-c_rehash.sh \
             file://configure-targets.patch \
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
new file mode 100644
index 00000000000..8fedab522f8
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
@@ -0,0 +1,155 @@
+SUMMARY = "Secure Socket Layer"
+DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic tools."
+HOMEPAGE = "http://www.openssl.org/"
+BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
+SECTION = "libs/network"
+
+# "openssl | SSLeay" dual license
+LICENSE = "openssl"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cae6da10f4ffd9703214776d2aabce32"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI[md5sum] = "7b521dea79ab159e8ec879d2333369fa"
+SRC_URI[sha256sum] = "12f746f3f2493b2f39da7ecf63d7ee19c6ac9ec6a4fcd8c229da8a522cb12765"
+
+SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
+           file://run-ptest \
+           file://openssl-c_rehash.sh \
+           file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
+           file://0001-Remove-test-that-requires-running-as-non-root.patch \
+          "
+
+S = "${WORKDIR}/openssl-${PV}"
+
+inherit lib_package multilib_header ptest
+
+do_configure () {
+	os=${HOST_OS}
+	case $os in
+	linux-uclibc |\
+	linux-uclibceabi |\
+	linux-gnueabi |\
+	linux-uclibcspe |\
+	linux-gnuspe |\
+	linux-musl*)
+		os=linux
+		;;
+		*)
+		;;
+	esac
+	target="$os-${HOST_ARCH}"
+	case $target in
+	linux-arm)
+		target=linux-armv4
+		;;
+	linux-armeb)
+		target=linux-armv4
+		;;
+	linux-aarch64*)
+		target=linux-aarch64
+		;;
+	linux-sh3)
+		target=linux-generic32
+		;;
+	linux-sh4)
+		target=linux-generic32
+		;;
+	linux-i486)
+		target=linux-elf
+		;;
+	linux-i586 | linux-viac3)
+		target=linux-elf
+		;;
+	linux-i686)
+		target=linux-elf
+		;;
+	linux-gnux32-x86_64)
+		target=linux-x32
+		;;
+	linux-gnu64-x86_64)
+		target=linux-x86_64
+		;;
+	linux-mips)
+                # specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
+		target="linux-mips32 ${TARGET_CC_ARCH}"
+		;;
+	linux-mipsel)
+		target="linux-mips32 ${TARGET_CC_ARCH}"
+		;;
+        linux-gnun32-mips*)
+               target=linux-mips64
+                ;;
+        linux-*-mips64 | linux-mips64)
+               target=linux64-mips64
+                ;;
+        linux-*-mips64el | linux-mips64el)
+               target=linux64-mips64
+                ;;
+	linux-microblaze*|linux-nios2*)
+		target=linux-generic32
+		;;
+	linux-powerpc)
+		target=linux-ppc
+		;;
+	linux-powerpc64)
+		target=linux-ppc64
+		;;
+	linux-supersparc)
+		target=linux-sparcv9
+		;;
+	linux-sparc)
+		target=linux-sparcv9
+		;;
+	darwin-i386)
+		target=darwin-i386-cc
+		;;
+	esac
+        useprefix=${prefix}
+        if [ "x$useprefix" = "x" ]; then
+                useprefix=/
+        fi
+	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=`basename ${libdir}` $target
+}
+
+#| engines/afalg/e_afalg.c: In function 'eventfd':
+#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
+#|      return syscall(__NR_eventfd, n);
+#|                     ^~~~~~~~~~~~
+EXTRA_OECONF_aarch64 += "no-afalgeng"
+
+#| ./libcrypto.so: undefined reference to `getcontext'
+#| ./libcrypto.so: undefined reference to `setcontext'
+#| ./libcrypto.so: undefined reference to `makecontext'
+EXTRA_OECONF_libc-musl += "-DOPENSSL_NO_ASYNC"
+
+do_install () {
+        oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
+        oe_multilib_header openssl/opensslconf.h
+}
+
+do_install_append_class-native () {
+        # Install a custom version of c_rehash that can handle sysroots properly.
+        # This version is used for example when installing ca-certificates during
+        # image creation.
+        install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
+        sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
+}
+
+do_install_ptest() {
+        cp -r * ${D}${PTEST_PATH}
+
+        # Putting .so files in ptest package will mess up the dependencies of the main openssl package
+        # so we rename them to .so.ptest and patch the test accordingly
+        mv ${D}${PTEST_PATH}/libcrypto.so ${D}${PTEST_PATH}/libcrypto.so.ptest
+        mv ${D}${PTEST_PATH}/libssl.so ${D}${PTEST_PATH}/libssl.so.ptest
+        sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
+}
+
+RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions"
+
+FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
+
+PACKAGES =+ "${PN}-engines"
+FILES_${PN}-engines = "${libdir}/engines-1.1"
+
-- 
2.13.2


