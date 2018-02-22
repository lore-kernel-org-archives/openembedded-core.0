Return-Path: <robert_joslyn@selinc.com>
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by mail.openembedded.org (Postfix) with ESMTP id 645D460807
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 06:29:18 +0000 (UTC)
X-Originating-IP: 50.37.80.44
Received: from hebe.netgear.com (50-37-80-44.mscw.id.frontiernet.net
	[50.37.80.44]) (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D7BEFA80C8;
	Thu, 22 Feb 2018 07:29:18 +0100 (CET)
From: Robert Joslyn <robert_joslyn@selinc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Feb 2018 22:29:08 -0800
Message-Id: <20180222062908.25845-1-robert_joslyn@selinc.com>
X-Mailer: git-send-email 2.16.1
Subject: [pyro][PATCH v4] openssl: Upgrade from 1.0.2k to 1.0.2n
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
X-List-Received-Date: Thu, 22 Feb 2018 06:29:19 -0000

Drop patches already applied upstream. Refresh parallel.patch using
latest version from master.

Remove x86-64 test binaries included in source code for ptest.

License-Update: Updated copyright years and a minor wording change

Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |   5 +
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch |  21 ---
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  23 ---
 .../openssl/openssl/parallel.patch                 | 177 ++++++++++++---------
 .../{openssl_1.0.2k.bb => openssl_1.0.2n.bb}       |   8 +-
 5 files changed, 113 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl_1.0.2n.bb} (86%)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 8f2a797b89..e39cd6c806 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -239,6 +239,11 @@ do_install_ptest () {
 	# modified again later when stripping them, but that's okay.
 	touch ${D}${PTEST_PATH}
 	find ${D}${PTEST_PATH} -type f -print0 | xargs --verbose -0 touch -r ${D}${PTEST_PATH}
+
+	# exclude binary files or the package won't install
+	for d in ssltest_old v3ext x509aux; do
+		rm -rf ${D}${libdir}/${BPN}/ptest/test/$d
+	done
 }
 
 do_install_append_class-native() {
diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
deleted file mode 100644
index 2a318a4584..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Submitted
-
-This patch adds the fix for one of the ciphers used in openssl, namely
-the cipher des-ede3-cfb1. Complete bug log and patch is present here:
-http://rt.openssl.org/Ticket/Display.html?id=2867
-
-Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
-
-Index: openssl-1.0.2/crypto/evp/e_des3.c
-===================================================================
---- openssl-1.0.2.orig/crypto/evp/e_des3.c
-+++ openssl-1.0.2/crypto/evp/e_des3.c
-@@ -211,7 +211,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPH
-     size_t n;
-     unsigned char c[1], d[1];
- 
--    for (n = 0; n < inl; ++n) {
-+    for (n = 0; n * 8 < inl; ++n) {
-         c[0] = (in[n / 8] & (1 << (7 - n % 8))) ? 0x80 : 0;
-         DES_ede3_cfb_encrypt(c, d, 1, 1,
-                              &data(ctx)->ks1, &data(ctx)->ks2,
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
deleted file mode 100644
index f736e5c098..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()
-
-We should avoid accessing the type pointer if it's NULL,
-this could happen if ctx->digest is not NULL.
-
-Upstream-Status: Submitted
-http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
----
-Index: openssl-1.0.2h/crypto/evp/digest.c
-===================================================================
---- openssl-1.0.2h.orig/crypto/evp/digest.c
-+++ openssl-1.0.2h/crypto/evp/digest.c
-@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
-         type = ctx->digest;
-     }
- #endif
--    if (ctx->digest != type) {
-+    if (type && (ctx->digest != type)) {
-         if (ctx->digest && ctx->digest->ctx_size) {
-             OPENSSL_free(ctx->md_data);
-             ctx->md_data = NULL;
diff --git a/meta/recipes-connectivity/openssl/openssl/parallel.patch b/meta/recipes-connectivity/openssl/openssl/parallel.patch
index f3f4c99888..e5413bf389 100644
--- a/meta/recipes-connectivity/openssl/openssl/parallel.patch
+++ b/meta/recipes-connectivity/openssl/openssl/parallel.patch
@@ -1,4 +1,7 @@
-Fix the parallel races in the Makefiles.
+From 7fb1192f112c1920bfd39f4185f34e9afff3cff2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Sat, 5 Mar 2016 00:12:02 +0000
+Subject: [PATCH 24/28] Fix the parallel races in the Makefiles.
 
 This patch was taken from the Gentoo packaging:
 https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2g-parallel-build.patch
@@ -9,9 +12,82 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 Refreshed for 1.0.2i
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 
---- openssl-1.0.2g/crypto/Makefile
-+++ openssl-1.0.2g/crypto/Makefile
-@@ -85,11 +85,11 @@
+---
+ Makefile.org          |  14 +-
+ Makefile.org.orig     |  10 +-
+ Makefile.shared       |   2 +
+ Makefile.shared.orig  | 655 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ crypto/Makefile       |  10 +-
+ engines/Makefile      |   6 +-
+ engines/Makefile.orig | 338 ++++++++++++++++++++++++++
+ test/Makefile         |  92 +++----
+ test/Makefile.orig    |  88 ++++---
+ 9 files changed, 1108 insertions(+), 107 deletions(-)
+ create mode 100644 Makefile.shared.orig
+ create mode 100644 engines/Makefile.orig
+
+diff --git a/Makefile.org b/Makefile.org
+index 8e7936c..ed98d2a 100644
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -283,17 +283,17 @@ build_libcrypto: build_crypto build_engines libcrypto.pc
+ build_libssl: build_ssl libssl.pc
+ 
+ build_crypto:
+-	@dir=crypto; target=all; $(BUILD_ONE_CMD)
++	+@dir=crypto; target=all; $(BUILD_ONE_CMD)
+ build_ssl: build_crypto
+-	@dir=ssl; target=all; $(BUILD_ONE_CMD)
++	+@dir=ssl; target=all; $(BUILD_ONE_CMD)
+ build_engines: build_crypto
+-	@dir=engines; target=all; $(BUILD_ONE_CMD)
++	+@dir=engines; target=all; $(BUILD_ONE_CMD)
+ build_apps: build_libs
+-	@dir=apps; target=all; $(BUILD_ONE_CMD)
++	+@dir=apps; target=all; $(BUILD_ONE_CMD)
+ build_tests: build_libs
+-	@dir=test; target=all; $(BUILD_ONE_CMD)
++	+@dir=test; target=all; $(BUILD_ONE_CMD)
+ build_tools: build_libs
+-	@dir=tools; target=all; $(BUILD_ONE_CMD)
++	+@dir=tools; target=all; $(BUILD_ONE_CMD)
+ 
+ all_testapps: build_libs build_testapps
+ build_testapps:
+@@ -565,7 +565,7 @@ install_sw:
+ 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
+ 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
+ 	done;
+-	@set -e; target=install; $(RECURSIVE_BUILD_CMD)
++	+@set -e; target=install; $(RECURSIVE_BUILD_CMD)
+ 	@set -e; liblist="$(LIBS)"; for i in $$liblist ;\
+ 	do \
+ 		if [ -f "$$i" ]; then \
+diff --git a/Makefile.shared b/Makefile.shared
+index f6f92e7..8164186 100644
+--- a/Makefile.shared
++++ b/Makefile.shared
+@@ -105,6 +105,7 @@ LINK_SO=	\
+     SHAREDFLAGS="$(OE_LDFLAGS) $${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
+     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
+     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
++    [ -e $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX ] && exit 0; \
+     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
+     $${SHAREDCMD} $${SHAREDFLAGS} \
+ 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
+@@ -122,6 +123,7 @@ SYMLINK_SO=	\
+ 			done; \
+ 		fi; \
+ 		if [ -n "$$SHLIB_SOVER" ]; then \
++			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \
+ 			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
+ 			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
+ 		fi; \
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 17a87f8..29c2dcf 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -85,11 +85,11 @@ testapps:
  	@if [ -z "$(THIS)" ]; then $(MAKE) -f $(TOP)/Makefile reflect THIS=$@; fi
  
  subdirs:
@@ -25,7 +101,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  links:
  	@$(PERL) $(TOP)/util/mklink.pl ../include/openssl $(EXHEADER)
-@@ -100,7 +100,7 @@
+@@ -100,7 +100,7 @@ links:
  # lib: $(LIB): are splitted to avoid end-less loop
  lib:	$(LIB)
  	@touch lib
@@ -34,7 +110,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  	$(AR) $(LIB) $(LIBOBJ)
  	test -z "$(FIPSLIBDIR)" || $(AR) $(LIB) $(FIPSLIBDIR)fipscanister.o
  	$(RANLIB) $(LIB) || echo Never mind.
-@@ -111,7 +111,7 @@
+@@ -111,7 +111,7 @@ shared: buildinf.h lib subdirs
  	fi
  
  libs:
@@ -43,7 +119,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  install:
  	@[ -n "$(INSTALLTOP)" ] # should be set by top Makefile...
-@@ -120,7 +120,7 @@
+@@ -120,7 +120,7 @@ install:
  	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
  	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
  	done;
@@ -52,9 +128,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  lint:
  	@target=lint; $(RECURSIVE_MAKE)
---- openssl-1.0.2g/engines/Makefile
-+++ openssl-1.0.2g/engines/Makefile
-@@ -72,7 +72,7 @@
+diff --git a/engines/Makefile b/engines/Makefile
+index fe8e9ca..a43d21b 100644
+--- a/engines/Makefile
++++ b/engines/Makefile
+@@ -72,7 +72,7 @@ top:
  
  all:	lib subdirs
  
@@ -63,7 +141,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  	@if [ -n "$(SHARED_LIBS)" ]; then \
  		set -e; \
  		for l in $(LIBNAMES); do \
-@@ -89,7 +89,7 @@
+@@ -89,7 +89,7 @@ lib:	$(LIBOBJ)
  
  subdirs:
  	echo $(EDIRS)
@@ -72,8 +150,8 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  files:
  	$(PERL) $(TOP)/util/files.pl Makefile >> $(TOP)/MINFO
-@@ -128,7 +128,7 @@
- 			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx ); \
+@@ -128,7 +128,7 @@ install:
+ 			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx ); \
  		done; \
  	fi
 -	@target=install; $(RECURSIVE_MAKE)
@@ -81,62 +159,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  tags:
  	ctags $(SRC)
---- openssl-1.0.2g/Makefile.org
-+++ openssl-1.0.2g/Makefile.org
-@@ -279,17 +279,17 @@
- build_libssl: build_ssl libssl.pc
- 
- build_crypto:
--	@dir=crypto; target=all; $(BUILD_ONE_CMD)
-+	+@dir=crypto; target=all; $(BUILD_ONE_CMD)
- build_ssl: build_crypto
--	@dir=ssl; target=all; $(BUILD_ONE_CMD)
-+	+@dir=ssl; target=all; $(BUILD_ONE_CMD)
- build_engines: build_crypto
--	@dir=engines; target=all; $(BUILD_ONE_CMD)
-+	+@dir=engines; target=all; $(BUILD_ONE_CMD)
- build_apps: build_libs
--	@dir=apps; target=all; $(BUILD_ONE_CMD)
-+	+@dir=apps; target=all; $(BUILD_ONE_CMD)
- build_tests: build_libs
--	@dir=test; target=all; $(BUILD_ONE_CMD)
-+	+@dir=test; target=all; $(BUILD_ONE_CMD)
- build_tools: build_libs
--	@dir=tools; target=all; $(BUILD_ONE_CMD)
-+	+@dir=tools; target=all; $(BUILD_ONE_CMD)
- 
- all_testapps: build_libs build_testapps
- build_testapps:
-@@ -544,7 +544,7 @@
- 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
- 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
- 	done;
--	@set -e; target=install; $(RECURSIVE_BUILD_CMD)
-+	+@set -e; target=install; $(RECURSIVE_BUILD_CMD)
- 	@set -e; liblist="$(LIBS)"; for i in $$liblist ;\
- 	do \
- 		if [ -f "$$i" ]; then \
---- openssl-1.0.2g/Makefile.shared
-+++ openssl-1.0.2g/Makefile.shared
-@@ -105,6 +105,7 @@
-     SHAREDFLAGS="$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
-     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
-     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
-+    [ -e $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX ] && exit 0; \
-     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
-     $${SHAREDCMD} $${SHAREDFLAGS} \
- 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
-@@ -122,6 +123,7 @@
- 			done; \
- 		fi; \
- 		if [ -n "$$SHLIB_SOVER" ]; then \
-+			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \
- 			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
- 			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
- 		fi; \
---- openssl-1.0.2g/test/Makefile
-+++ openssl-1.0.2g/test/Makefile
-@@ -144,7 +144,7 @@
+diff --git a/test/Makefile b/test/Makefile
+index 40abd60..78d3788 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -145,7 +145,7 @@ install:
  tags:
  	ctags $(SRC)
  
@@ -145,7 +172,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  apps:
  	@(cd ..; $(MAKE) DIRS=apps all)
-@@ -438,136 +438,136 @@
+@@ -444,139 +444,139 @@ BUILD_CMD_STATIC=shlib_target=; \
  		link_app.$${shlib_target}
  
  $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
@@ -316,6 +343,9 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 -	@target=$(BADDTLSTEST) $(BUILD_CMD)
 +	+@target=$(BADDTLSTEST) $(BUILD_CMD)
  
+ $(FATALERRTEST)$(EXE_EXT): $(FATALERRTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
+ 	@target=$(FATALERRTEST); exobj=ssltestlib.o; $(BUILD_CMD)
+ 
  $(SSLV2CONFTEST)$(EXE_EXT): $(SSLV2CONFTEST).o
 -	@target=$(SSLV2CONFTEST) $(BUILD_CMD)
 +	+@target=$(SSLV2CONFTEST) $(BUILD_CMD)
@@ -326,7 +356,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  #$(AESTEST).o: $(AESTEST).c
  #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
-@@ -580,6 +580,6 @@
+@@ -589,7 +589,7 @@ $(DTLSTEST)$(EXE_EXT): $(DTLSTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
  #	fi
  
  dummytest$(EXE_EXT): dummytest.o $(DLIBCRYPTO)
@@ -334,4 +364,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 +	+@target=dummytest; $(BUILD_CMD)
  
  # DO NOT DELETE THIS LINE -- make depend depends on it.
- 
\ No newline at end of file
+ 
+-- 
+2.15.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
similarity index 86%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
index 83d1a500c2..849f04b762 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
@@ -7,7 +7,7 @@ DEPENDS += "cryptodev-linux"
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native = " -fPIC"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
 
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
@@ -32,8 +32,6 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://debian1.0.2/version-script.patch \
             file://debian1.0.2/soname.patch \
             file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
             file://openssl-fix-des.pod-error.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
@@ -45,8 +43,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://Use-SHA256-not-MD5-as-default-digest.patch \
             file://0001-Fix-build-with-clang-using-external-assembler.patch \
             "
-SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
-SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0"
+SRC_URI[md5sum] = "13bdc1b1d1ff39b6fd42a255e74676a4"
+SRC_URI[sha256sum] = "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a832a982fd15a8fe"
 
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-- 
2.16.1


