Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 07/25] openssl: update 1.1.1l -> 3.0.0
Date: Mon, 11 Oct 2021 11:40:41 +0200
Message-Id: <20211011094059.4184654-7-alex@linutronix.de>
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Hongxu Jia <hongxu.jia@windriver.com>, Richard Purdie <richard.purdie@linuxfoundation.org>

Drop 0001-skip-test_symbol_presence.patch - testing revealed
no need for it, and I couldn't quite understand what it does.

Drop reproducible.patch - upstream has removed the non-reproducible
bit.

Process lines in run-ptest with sed one by one rather than with
perl after the test completes, avoiding ptest-runner timeout errors.

License-Update: openssl relicense to apache 2.0. Goodbye awkward
gpl exceptions in consumers.

DEPRECATED_CRYPTO_FLAGS is now empty by default but available
by anyone who wants to set it. Trying to come up with a working
set was not a good idea as shown in the deleted comment.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Configure-do-not-tweak-mips-cflags.patch | 36 +++++++++
 ...sysroot-and-debug-prefix-map-from-co.patch | 21 ++---
 .../0001-skip-test_symbol_presence.patch      | 46 -----------
 .../openssl/openssl/reproducible.patch        | 32 --------
 .../openssl/openssl/run-ptest                 |  2 +-
 .../{openssl_1.1.1l.bb => openssl_3.0.0.bb}   | 81 ++++++++++---------
 6 files changed, 90 insertions(+), 128 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-skip-test_symbol_presence.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/reproducible.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_3.0.0.bb} (76%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
new file mode 100644
index 00000000000..5effa6c6f61
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -0,0 +1,36 @@
+From 326909baf81a638d51fa8be1d8227518784f5cc4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 14 Sep 2021 12:18:25 +0200
+Subject: [PATCH] Configure: do not tweak mips cflags
+
+This conflicts with mips machine definitons from yocto,
+e.g.
+| Error: -mips3 conflicts with the other architecture options, which imply -mips64r2
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Configure | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/Configure b/Configure
+index 821e680..0387a74 100755
+--- a/Configure
++++ b/Configure
+@@ -1422,16 +1422,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+         push @{$config{shared_ldflag}}, "-mno-cygwin";
+         }
+ 
+-if ($target =~ /linux.*-mips/ && !$disabled{asm}
+-        && !grep { $_ !~ /-m(ips|arch=)/ } (@{$config{CFLAGS}})) {
+-        # minimally required architecture flags for assembly modules
+-        my $value;
+-        $value = '-mips2' if ($target =~ /mips32/);
+-        $value = '-mips3' if ($target =~ /mips64/);
+-        unshift @{$config{cflags}}, $value;
+-        unshift @{$config{cxxflags}}, $value if $config{CXX};
+-}
+-
+ # If threads aren't disabled, check how possible they are
+ unless ($disabled{threads}) {
+     if ($auto_threads) {
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 003cfbc8d89..60890c666d1 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 3e1d00481093e10775eaf69d619c45b32a4aa7dc Mon Sep 17 00:00:00 2001
+From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compiler
@@ -21,7 +21,6 @@ https://patchwork.openembedded.org/patch/147229/
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Martin Hundebøll <martin@geanix.com>
 
-
 Update to fix buildpaths qa issue for '-fmacro-prefix-map'.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
@@ -31,13 +30,15 @@ Update to fix buildpaths qa issue for '-ffile-prefix-map'.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- Configurations/unix-Makefile.tmpl | 10 +++++++++-
+ Configurations/unix-Makefile.tmpl | 12 +++++++++++-
  crypto/build.info                 |  2 +-
- 2 files changed, 10 insertions(+), 2 deletions(-)
+ 2 files changed, 12 insertions(+), 2 deletions(-)
 
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index f88a70f..528cdef 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -420,13 +420,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
+@@ -471,13 +471,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
@@ -62,14 +63,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
+diff --git a/crypto/build.info b/crypto/build.info
+index efca6cc..eda433e 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -10,7 +10,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink
-         ppccpuid.pl pariscid.pl alphacpuid.pl arm64cpuid.pl armv4cpuid.pl
+@@ -109,7 +109,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
+ DEPEND[info.o]=buildinf.h
  DEPEND[cversion.o]=buildinf.h
 -GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
 +GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC_Q) $(CFLAGS_Q) $(CPPFLAGS_Q)" "$(PLATFORM)"
- DEPEND[buildinf.h]=../configdata.pm
  
- GENERATE[uplink-x86.s]=../ms/uplink-x86.pl $(PERLASM_SCHEME)
+ GENERATE[uplink-x86.s]=../ms/uplink-x86.pl
+ GENERATE[uplink-x86_64.s]=../ms/uplink-x86_64.pl
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-skip-test_symbol_presence.patch b/meta/recipes-connectivity/openssl/openssl/0001-skip-test_symbol_presence.patch
deleted file mode 100644
index d8d9651b647..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-skip-test_symbol_presence.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a9401b2289656c5a36dd1b0ecebf0d23e291ce70 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 2 Oct 2018 23:58:24 +0800
-Subject: [PATCH] skip test_symbol_presence
-
-We cannot skip `01-test_symbol_presence.t' by configuring option `no-shared'
-as INSTALL told us the shared libraries will not be built.
-
-[INSTALL snip]
- Notes on shared libraries
- -------------------------
-
- For most systems the OpenSSL Configure script knows what is needed to
- build shared libraries for libcrypto and libssl. On these systems
- the shared libraries will be created by default. This can be suppressed and
- only static libraries created by using the "no-shared" option. On systems
- where OpenSSL does not know how to build shared libraries the "no-shared"
- option will be forced and only static libraries will be created.
-[INSTALL snip]
-
-Hence directly modification the case to skip it.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- test/recipes/01-test_symbol_presence.t | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/test/recipes/01-test_symbol_presence.t b/test/recipes/01-test_symbol_presence.t
-index 7f2a2d7..0b93745 100644
---- a/test/recipes/01-test_symbol_presence.t
-+++ b/test/recipes/01-test_symbol_presence.t
-@@ -14,8 +14,7 @@ use OpenSSL::Test::Utils;
- 
- setup("test_symbol_presence");
- 
--plan skip_all => "Only useful when building shared libraries"
--    if disabled("shared");
-+plan skip_all => "The case needs debug symbols then we just disable it";
- 
- my @libnames = ("crypto", "ssl");
- my $testcount = scalar @libnames;
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/openssl/openssl/reproducible.patch b/meta/recipes-connectivity/openssl/openssl/reproducible.patch
deleted file mode 100644
index a24260c95d0..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/reproducible.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-The value for perl_archname can vary depending on the host, e.g. 
-x86_64-linux-gnu-thread-multi or x86_64-linux-thread-multi which
-makes the ptest package non-reproducible. Its unused other than 
-these references so drop it.
-
-RP 2020/2/6
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: openssl-1.1.1d/Configure
-===================================================================
---- openssl-1.1.1d.orig/Configure
-+++ openssl-1.1.1d/Configure
-@@ -286,7 +286,7 @@ if (defined env($local_config_envname))
- # Save away perl command information
- $config{perl_cmd} = $^X;
- $config{perl_version} = $Config{version};
--$config{perl_archname} = $Config{archname};
-+#$config{perl_archname} = $Config{archname};
- 
- $config{prefix}="";
- $config{openssldir}="";
-@@ -2517,7 +2517,7 @@ _____
-                           @{$config{perlargv}}), "\n";
-         print "\nPerl information:\n\n";
-         print '    ',$config{perl_cmd},"\n";
--        print '    ',$config{perl_version},' for ',$config{perl_archname},"\n";
-+        print '    ',$config{perl_version},"\n";
-     }
-     if ($dump || $options) {
-         my $longest = 0;
diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index 3fb22471f8c..8dff79101fa 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -9,4 +9,4 @@ export TOP=.
 # OPENSSL_ENGINES is relative from the test binaries
 export OPENSSL_ENGINES=../engines
 
-perl ./test/run_tests.pl $* | perl -0pe 's#(.*) \.*.ok#PASS: \1#g; s#(.*) \.*.skipped: (.*)#SKIP: \1 (\2)#g; s#(.*) \.*.\nDubious#FAIL: \1#;'
+perl ./test/run_tests.pl $* | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
similarity index 76%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.0.bb
index b241ba78bcc..d8c50a80118 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
@@ -4,19 +4,14 @@ HOMEPAGE = "http://www.openssl.org/"
 BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
 SECTION = "libs/network"
 
-# "openssl" here actually means both OpenSSL and SSLeay licenses apply
-# (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENSEMAPped)
-LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
-
-DEPENDS = "hostperl-runtime-native"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
-           file://0001-skip-test_symbol_presence.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
-           file://reproducible.patch \
+           file://0001-Configure-do-not-tweak-mips-cflags.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
@@ -28,9 +23,9 @@ SRC_URI:append:riscv32 = " \
            file://0004-Fixup-support-for-io_pgetevents_time64-syscall.patch \
            "
 
-SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
+SRC_URI[sha256sum] = "59eedfcb46c25214c9bd37ed6078297b4df01d012267fe9e9eee31f61bc70536"
 
-inherit lib_package multilib_header multilib_script ptest
+inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
 
 PACKAGECONFIG ?= ""
@@ -59,19 +54,9 @@ EXTRA_OECONF:class-nativesdk = "--with-rand-seed=os,devrandom"
 CFLAGS:append:class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
 CFLAGS:append:class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
 
-# Disable deprecated crypto algorithms
-# Retained for compatibilty
-# des (curl)
-# dh (python-ssl)
-# dsa (rpm)
-# md4 (cyrus-sasl freeradius hostapd)
-# bf (wvstreams postgresql x11vnc crda znc cfengine)
-# rc4 (freerdp librtorrent ettercap xrdp transmission pam-ssh-agent-auth php)
-# rc2 (mailx)
-# psk (qt5)
-# srp (libest)
-# whirlpool (qca)
-DEPRECATED_CRYPTO_FLAGS = "no-ssl no-idea no-rc5 no-md2 no-camellia no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4"
+# This allows disabling deprecated or undesirable crypto algorithms.
+# The default is to trust upstream choices.
+DEPRECATED_CRYPTO_FLAGS ?= ""
 
 do_configure () {
 	os=${HOST_OS}
@@ -146,7 +131,7 @@ do_configure () {
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
 	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
-	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
+	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
 	perl ${B}/configdata.pm --dump
 }
 
@@ -154,43 +139,49 @@ do_install () {
 	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
 
 	oe_multilib_header openssl/opensslconf.h
+	oe_multilib_header openssl/configuration.h
 
 	# Create SSL structure for packages such as ca-certificates which
 	# contain hard-coded paths to /etc/ssl. Debian does the same.
 	install -d ${D}${sysconfdir}/ssl
-	mv ${D}${libdir}/ssl-1.1/certs \
-	   ${D}${libdir}/ssl-1.1/private \
-	   ${D}${libdir}/ssl-1.1/openssl.cnf \
+	mv ${D}${libdir}/ssl-3/certs \
+	   ${D}${libdir}/ssl-3/private \
+	   ${D}${libdir}/ssl-3/openssl.cnf \
 	   ${D}${sysconfdir}/ssl/
 
 	# Although absolute symlinks would be OK for the target, they become
 	# invalid if native or nativesdk are relocated from sstate.
-	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-1.1/certs
-	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-1.1/private
-	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-1.1/openssl.cnf
+	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-3/certs
+	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-3/private
+	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-3/openssl.cnf
 }
 
 do_install:append:class-native () {
 	create_wrapper ${D}${bindir}/openssl \
-	    OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
-	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
-	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
-	    OPENSSL_ENGINES=${libdir}/engines-1.1
+	    OPENSSL_CONF=${libdir}/ssl-3/openssl.cnf \
+	    SSL_CERT_DIR=${libdir}/ssl-3/certs \
+	    SSL_CERT_FILE=${libdir}/ssl-3/cert.pem \
+	    OPENSSL_ENGINES=${libdir}/engines-3
 }
 
 do_install:append:class-nativesdk () {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
-	sed 's|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g' -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	sed 's|/usr/lib/ssl/|/usr/lib/ssl-3/|g' -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
 PTEST_BUILD_HOST_FILES += "configdata.pm"
 PTEST_BUILD_HOST_PATTERN = "perl_version ="
 do_install_ptest () {
+	install -d ${D}${PTEST_PATH}/test
+	install -m755 ${B}/test/p_test.so ${D}${PTEST_PATH}/test
+	install -m755 ${B}/test/provider_internal_test.cnf ${D}${PTEST_PATH}/test
+
 	# Prune the build tree
 	rm -f ${B}/fuzz/*.* ${B}/test/*.*
 
 	cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
+	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/configdata.pm
 	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util ${D}${PTEST_PATH}
 
 	# For test_shlibload
@@ -204,10 +195,20 @@ do_install_ptest () {
 
 	install -d ${D}${PTEST_PATH}/engines
 	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/loader_attic.so ${D}${PTEST_PATH}/engines
+
+	install -d ${D}${PTEST_PATH}/providers
+	install -m755 ${B}/providers/legacy.so ${D}${PTEST_PATH}/providers
+
+        install -d ${D}${PTEST_PATH}/Configurations
+        cp -rf ${S}/Configurations/* ${D}${PTEST_PATH}/Configurations/
 
         # seems to be needed with perl 5.32.1
         install -d ${D}${PTEST_PATH}/util/perl/recipes
         cp ${D}${PTEST_PATH}/test/recipes/tconversion.pl ${D}${PTEST_PATH}/util/perl/recipes/
+
+	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/util/wrap.pl
+
 }
 
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
@@ -220,13 +221,13 @@ PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
 FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl = "${libdir}/libssl${SOLIBS}"
 FILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
-                      ${libdir}/ssl-1.1/openssl.cnf* \
+                      ${libdir}/ssl-3/openssl.cnf* \
                       "
-FILES:${PN}-engines = "${libdir}/engines-1.1"
+FILES:${PN}-engines = "${libdir}/engines-3"
 # ${prefix} comes from what we pass into --prefix at configure time (which is used for INSTALLTOP)
-FILES:${PN}-engines:append:mingw32:class-nativesdk = " ${prefix}${libdir}/engines-1_1"
-FILES:${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
-FILES:${PN} =+ "${libdir}/ssl-1.1/*"
+FILES:${PN}-engines:append:mingw32:class-nativesdk = " ${prefix}${libdir}/engines-3"
+FILES:${PN}-misc = "${libdir}/ssl-3/misc ${bindir}/c_rehash"
+FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
 CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-- 
2.20.1

