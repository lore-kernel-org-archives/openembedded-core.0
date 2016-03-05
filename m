Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 209EA6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 00:12:08 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l68so12055364wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 16:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Tp1DYqRrxz61jtziTuD5CL93tjKejPoSve+R8jn8AeU=;
	b=QYBZaPGrJyw9EI1+pmIp7CDUT0r7meQ4Ks1rPQd5LwIKCPuimIsy9RIXrTlKYQC+JE
	EEes3bu7QmhMCzFcplXMWPw0/b6anb7oB+sq0OCysoQ/h4zjkmOfJ1BbWi6TavDkSkFf
	oIyiW9DahARiW1Bp3EU/dKwzAaRcUFAfAQ9OSsHC35ZNgf6/iJxDsdDu3j9FCJlUAKcS
	KwbqAfgOWC7g5/tZuaHieKHVxMICY/ZxqB4qhl7TJimRh831ZdQq4ZV/rQkuVHbRhFBY
	VJBWCKlDKY7uC54/WeTCQD1ePddKusK60P6fz1KYIpmS1dba3T8v/vJZIotaUeSLBbrw
	j1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Tp1DYqRrxz61jtziTuD5CL93tjKejPoSve+R8jn8AeU=;
	b=iR21S01vRzr5U3A41ZyPj/7N7SGLGYsYqQmAvEdQN/5Z+oh1htKjjRNLpdf01cKHSd
	V4f1OP4Dh6r4YOegGipXiSWF7HFdXA/MnHjte3w3gcuK/D3NeMipy6h7x6MK+InGIWqY
	L6xkL/Dj2svjZhI9Rr0O3uRJzAgr/2Yo1S/kd/59wizid+SvCEPTZGP3PfLb24lOPc5Q
	j0ttzr3c85aer0FGjHB79JBD46aDa1fff5NlErHy5Q6DBfmayFdvBIugwPKfGYWoJYyD
	I1pbw9GFOaTrhQI9N4rXnTAPvh6nFqBMBf6lmrOeKzc7S3/byQ3WF2R68JffePlpzEHb
	KugQ==
X-Gm-Message-State: AD7BkJK6DHJrbgg9vSqfDvwDWd7NRKxEAmtbAtnc/XRX/Vzr1Q8bTGmoEOzuCbaWXROHRTRG
X-Received: by 10.28.222.214 with SMTP id v205mr1213876wmg.92.1457136728734;
	Fri, 04 Mar 2016 16:12:08 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	hx10sm5638075wjb.25.2016.03.04.16.12.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 16:12:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Mar 2016 00:12:02 +0000
Message-Id: <1457136723-19606-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457136723-19606-1-git-send-email-ross.burton@intel.com>
References: <1457136723-19606-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] openssl: add a patch to fix parallel builds
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
X-List-Received-Date: Sat, 05 Mar 2016 00:12:08 -0000

Apply a patch taken from Gentoo to hopefully fix the remaining parallel make
races.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../openssl/openssl/parallel.patch                 | 326 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2g.bb |   1 +
 2 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/parallel.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/parallel.patch b/meta/recipes-connectivity/openssl/openssl/parallel.patch
new file mode 100644
index 0000000..b6c2c14
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/parallel.patch
@@ -0,0 +1,326 @@
+Fix the parallel races in the Makefiles.
+
+This patch was taken from the Gentoo packaging:
+https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2g-parallel-build.patch
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- openssl-1.0.2g/crypto/Makefile
++++ openssl-1.0.2g/crypto/Makefile
+@@ -85,11 +85,11 @@
+ 	@if [ -z "$(THIS)" ]; then $(MAKE) -f $(TOP)/Makefile reflect THIS=$@; fi
+ 
+ subdirs:
+-	@target=all; $(RECURSIVE_MAKE)
++	+@target=all; $(RECURSIVE_MAKE)
+ 
+ files:
+ 	$(PERL) $(TOP)/util/files.pl "CPUID_OBJ=$(CPUID_OBJ)" Makefile >> $(TOP)/MINFO
+-	@target=files; $(RECURSIVE_MAKE)
++	+@target=files; $(RECURSIVE_MAKE)
+ 
+ links:
+ 	@$(PERL) $(TOP)/util/mklink.pl ../include/openssl $(EXHEADER)
+@@ -100,7 +100,7 @@
+ # lib: $(LIB): are splitted to avoid end-less loop
+ lib:	$(LIB)
+ 	@touch lib
+-$(LIB):	$(LIBOBJ)
++$(LIB):	$(LIBOBJ) | subdirs
+ 	$(AR) $(LIB) $(LIBOBJ)
+ 	test -z "$(FIPSLIBDIR)" || $(AR) $(LIB) $(FIPSLIBDIR)fipscanister.o
+ 	$(RANLIB) $(LIB) || echo Never mind.
+@@ -111,7 +111,7 @@
+ 	fi
+ 
+ libs:
+-	@target=lib; $(RECURSIVE_MAKE)
++	+@target=lib; $(RECURSIVE_MAKE)
+ 
+ install:
+ 	@[ -n "$(INSTALLTOP)" ] # should be set by top Makefile...
+@@ -120,7 +120,7 @@
+ 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
+ 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
+ 	done;
+-	@target=install; $(RECURSIVE_MAKE)
++	+@target=install; $(RECURSIVE_MAKE)
+ 
+ lint:
+ 	@target=lint; $(RECURSIVE_MAKE)
+--- openssl-1.0.2g/engines/Makefile
++++ openssl-1.0.2g/engines/Makefile
+@@ -72,7 +72,7 @@
+ 
+ all:	lib subdirs
+ 
+-lib:	$(LIBOBJ)
++lib:	$(LIBOBJ) | subdirs
+ 	@if [ -n "$(SHARED_LIBS)" ]; then \
+ 		set -e; \
+ 		for l in $(LIBNAMES); do \
+@@ -89,7 +89,7 @@
+ 
+ subdirs:
+ 	echo $(EDIRS)
+-	@target=all; $(RECURSIVE_MAKE)
++	+@target=all; $(RECURSIVE_MAKE)
+ 
+ files:
+ 	$(PERL) $(TOP)/util/files.pl Makefile >> $(TOP)/MINFO
+@@ -128,7 +128,7 @@
+ 			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx ); \
+ 		done; \
+ 	fi
+-	@target=install; $(RECURSIVE_MAKE)
++	+@target=install; $(RECURSIVE_MAKE)
+ 
+ tags:
+ 	ctags $(SRC)
+--- openssl-1.0.2g/Makefile.org
++++ openssl-1.0.2g/Makefile.org
+@@ -279,17 +279,17 @@
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
+@@ -544,7 +544,7 @@
+ 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
+ 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
+ 	done;
+-	@set -e; target=install; $(RECURSIVE_BUILD_CMD)
++	+@set -e; target=install; $(RECURSIVE_BUILD_CMD)
+ 	@set -e; liblist="$(LIBS)"; for i in $$liblist ;\
+ 	do \
+ 		if [ -f "$$i" ]; then \
+--- openssl-1.0.2g/Makefile.shared
++++ openssl-1.0.2g/Makefile.shared
+@@ -105,6 +105,7 @@
+     SHAREDFLAGS="$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
+     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
+     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
++    [ -e $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX ] && exit 0; \
+     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
+     $${SHAREDCMD} $${SHAREDFLAGS} \
+ 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
+@@ -122,6 +123,7 @@
+ 			done; \
+ 		fi; \
+ 		if [ -n "$$SHLIB_SOVER" ]; then \
++			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \
+ 			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
+ 			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
+ 		fi; \
+--- openssl-1.0.2g/test/Makefile
++++ openssl-1.0.2g/test/Makefile
+@@ -139,7 +139,7 @@
+ tags:
+ 	ctags $(SRC)
+ 
+-tests:	exe apps $(TESTS)
++tests:	exe $(TESTS)
+ 
+ apps:
+ 	@(cd ..; $(MAKE) DIRS=apps all)
+@@ -421,130 +421,130 @@
+ 		link_app.$${shlib_target}
+ 
+ $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
+-	@target=$(RSATEST); $(BUILD_CMD)
++	+@target=$(RSATEST); $(BUILD_CMD)
+ 
+ $(BNTEST)$(EXE_EXT): $(BNTEST).o $(DLIBCRYPTO)
+-	@target=$(BNTEST); $(BUILD_CMD)
++	+@target=$(BNTEST); $(BUILD_CMD)
+ 
+ $(ECTEST)$(EXE_EXT): $(ECTEST).o $(DLIBCRYPTO)
+-	@target=$(ECTEST); $(BUILD_CMD)
++	+@target=$(ECTEST); $(BUILD_CMD)
+ 
+ $(EXPTEST)$(EXE_EXT): $(EXPTEST).o $(DLIBCRYPTO)
+-	@target=$(EXPTEST); $(BUILD_CMD)
++	+@target=$(EXPTEST); $(BUILD_CMD)
+ 
+ $(IDEATEST)$(EXE_EXT): $(IDEATEST).o $(DLIBCRYPTO)
+-	@target=$(IDEATEST); $(BUILD_CMD)
++	+@target=$(IDEATEST); $(BUILD_CMD)
+ 
+ $(MD2TEST)$(EXE_EXT): $(MD2TEST).o $(DLIBCRYPTO)
+-	@target=$(MD2TEST); $(BUILD_CMD)
++	+@target=$(MD2TEST); $(BUILD_CMD)
+ 
+ $(SHATEST)$(EXE_EXT): $(SHATEST).o $(DLIBCRYPTO)
+-	@target=$(SHATEST); $(BUILD_CMD)
++	+@target=$(SHATEST); $(BUILD_CMD)
+ 
+ $(SHA1TEST)$(EXE_EXT): $(SHA1TEST).o $(DLIBCRYPTO)
+-	@target=$(SHA1TEST); $(BUILD_CMD)
++	+@target=$(SHA1TEST); $(BUILD_CMD)
+ 
+ $(SHA256TEST)$(EXE_EXT): $(SHA256TEST).o $(DLIBCRYPTO)
+-	@target=$(SHA256TEST); $(BUILD_CMD)
++	+@target=$(SHA256TEST); $(BUILD_CMD)
+ 
+ $(SHA512TEST)$(EXE_EXT): $(SHA512TEST).o $(DLIBCRYPTO)
+-	@target=$(SHA512TEST); $(BUILD_CMD)
++	+@target=$(SHA512TEST); $(BUILD_CMD)
+ 
+ $(RMDTEST)$(EXE_EXT): $(RMDTEST).o $(DLIBCRYPTO)
+-	@target=$(RMDTEST); $(BUILD_CMD)
++	+@target=$(RMDTEST); $(BUILD_CMD)
+ 
+ $(MDC2TEST)$(EXE_EXT): $(MDC2TEST).o $(DLIBCRYPTO)
+-	@target=$(MDC2TEST); $(BUILD_CMD)
++	+@target=$(MDC2TEST); $(BUILD_CMD)
+ 
+ $(MD4TEST)$(EXE_EXT): $(MD4TEST).o $(DLIBCRYPTO)
+-	@target=$(MD4TEST); $(BUILD_CMD)
++	+@target=$(MD4TEST); $(BUILD_CMD)
+ 
+ $(MD5TEST)$(EXE_EXT): $(MD5TEST).o $(DLIBCRYPTO)
+-	@target=$(MD5TEST); $(BUILD_CMD)
++	+@target=$(MD5TEST); $(BUILD_CMD)
+ 
+ $(HMACTEST)$(EXE_EXT): $(HMACTEST).o $(DLIBCRYPTO)
+-	@target=$(HMACTEST); $(BUILD_CMD)
++	+@target=$(HMACTEST); $(BUILD_CMD)
+ 
+ $(WPTEST)$(EXE_EXT): $(WPTEST).o $(DLIBCRYPTO)
+-	@target=$(WPTEST); $(BUILD_CMD)
++	+@target=$(WPTEST); $(BUILD_CMD)
+ 
+ $(RC2TEST)$(EXE_EXT): $(RC2TEST).o $(DLIBCRYPTO)
+-	@target=$(RC2TEST); $(BUILD_CMD)
++	+@target=$(RC2TEST); $(BUILD_CMD)
+ 
+ $(BFTEST)$(EXE_EXT): $(BFTEST).o $(DLIBCRYPTO)
+-	@target=$(BFTEST); $(BUILD_CMD)
++	+@target=$(BFTEST); $(BUILD_CMD)
+ 
+ $(CASTTEST)$(EXE_EXT): $(CASTTEST).o $(DLIBCRYPTO)
+-	@target=$(CASTTEST); $(BUILD_CMD)
++	+@target=$(CASTTEST); $(BUILD_CMD)
+ 
+ $(RC4TEST)$(EXE_EXT): $(RC4TEST).o $(DLIBCRYPTO)
+-	@target=$(RC4TEST); $(BUILD_CMD)
++	+@target=$(RC4TEST); $(BUILD_CMD)
+ 
+ $(RC5TEST)$(EXE_EXT): $(RC5TEST).o $(DLIBCRYPTO)
+-	@target=$(RC5TEST); $(BUILD_CMD)
++	+@target=$(RC5TEST); $(BUILD_CMD)
+ 
+ $(DESTEST)$(EXE_EXT): $(DESTEST).o $(DLIBCRYPTO)
+-	@target=$(DESTEST); $(BUILD_CMD)
++	+@target=$(DESTEST); $(BUILD_CMD)
+ 
+ $(RANDTEST)$(EXE_EXT): $(RANDTEST).o $(DLIBCRYPTO)
+-	@target=$(RANDTEST); $(BUILD_CMD)
++	+@target=$(RANDTEST); $(BUILD_CMD)
+ 
+ $(DHTEST)$(EXE_EXT): $(DHTEST).o $(DLIBCRYPTO)
+-	@target=$(DHTEST); $(BUILD_CMD)
++	+@target=$(DHTEST); $(BUILD_CMD)
+ 
+ $(DSATEST)$(EXE_EXT): $(DSATEST).o $(DLIBCRYPTO)
+-	@target=$(DSATEST); $(BUILD_CMD)
++	+@target=$(DSATEST); $(BUILD_CMD)
+ 
+ $(METHTEST)$(EXE_EXT): $(METHTEST).o $(DLIBCRYPTO)
+-	@target=$(METHTEST); $(BUILD_CMD)
++	+@target=$(METHTEST); $(BUILD_CMD)
+ 
+ $(SSLTEST)$(EXE_EXT): $(SSLTEST).o $(DLIBSSL) $(DLIBCRYPTO)
+-	@target=$(SSLTEST); $(FIPS_BUILD_CMD)
++	+@target=$(SSLTEST); $(FIPS_BUILD_CMD)
+ 
+ $(ENGINETEST)$(EXE_EXT): $(ENGINETEST).o $(DLIBCRYPTO)
+-	@target=$(ENGINETEST); $(BUILD_CMD)
++	+@target=$(ENGINETEST); $(BUILD_CMD)
+ 
+ $(EVPTEST)$(EXE_EXT): $(EVPTEST).o $(DLIBCRYPTO)
+-	@target=$(EVPTEST); $(BUILD_CMD)
++	+@target=$(EVPTEST); $(BUILD_CMD)
+ 
+ $(EVPEXTRATEST)$(EXE_EXT): $(EVPEXTRATEST).o $(DLIBCRYPTO)
+-	@target=$(EVPEXTRATEST); $(BUILD_CMD)
++	+@target=$(EVPEXTRATEST); $(BUILD_CMD)
+ 
+ $(ECDSATEST)$(EXE_EXT): $(ECDSATEST).o $(DLIBCRYPTO)
+-	@target=$(ECDSATEST); $(BUILD_CMD)
++	+@target=$(ECDSATEST); $(BUILD_CMD)
+ 
+ $(ECDHTEST)$(EXE_EXT): $(ECDHTEST).o $(DLIBCRYPTO)
+-	@target=$(ECDHTEST); $(BUILD_CMD)
++	+@target=$(ECDHTEST); $(BUILD_CMD)
+ 
+ $(IGETEST)$(EXE_EXT): $(IGETEST).o $(DLIBCRYPTO)
+-	@target=$(IGETEST); $(BUILD_CMD)
++	+@target=$(IGETEST); $(BUILD_CMD)
+ 
+ $(JPAKETEST)$(EXE_EXT): $(JPAKETEST).o $(DLIBCRYPTO)
+-	@target=$(JPAKETEST); $(BUILD_CMD)
++	+@target=$(JPAKETEST); $(BUILD_CMD)
+ 
+ $(ASN1TEST)$(EXE_EXT): $(ASN1TEST).o $(DLIBCRYPTO)
+-	@target=$(ASN1TEST); $(BUILD_CMD)
++	+@target=$(ASN1TEST); $(BUILD_CMD)
+ 
+ $(SRPTEST)$(EXE_EXT): $(SRPTEST).o $(DLIBCRYPTO)
+-	@target=$(SRPTEST); $(BUILD_CMD)
++	+@target=$(SRPTEST); $(BUILD_CMD)
+ 
+ $(V3NAMETEST)$(EXE_EXT): $(V3NAMETEST).o $(DLIBCRYPTO)
+-	@target=$(V3NAMETEST); $(BUILD_CMD)
++	+@target=$(V3NAMETEST); $(BUILD_CMD)
+ 
+ $(HEARTBEATTEST)$(EXE_EXT): $(HEARTBEATTEST).o $(DLIBCRYPTO)
+-	@target=$(HEARTBEATTEST); $(BUILD_CMD_STATIC)
++	+@target=$(HEARTBEATTEST); $(BUILD_CMD_STATIC)
+ 
+ $(CONSTTIMETEST)$(EXE_EXT): $(CONSTTIMETEST).o
+-	@target=$(CONSTTIMETEST) $(BUILD_CMD)
++	+@target=$(CONSTTIMETEST) $(BUILD_CMD)
+ 
+ $(VERIFYEXTRATEST)$(EXE_EXT): $(VERIFYEXTRATEST).o
+-	@target=$(VERIFYEXTRATEST) $(BUILD_CMD)
++	+@target=$(VERIFYEXTRATEST) $(BUILD_CMD)
+ 
+ $(CLIENTHELLOTEST)$(EXE_EXT): $(CLIENTHELLOTEST).o
+-	@target=$(CLIENTHELLOTEST) $(BUILD_CMD)
++	+@target=$(CLIENTHELLOTEST) $(BUILD_CMD)
+ 
+ $(SSLV2CONFTEST)$(EXE_EXT): $(SSLV2CONFTEST).o
+-	@target=$(SSLV2CONFTEST) $(BUILD_CMD)
++	+@target=$(SSLV2CONFTEST) $(BUILD_CMD)
+ 
+ #$(AESTEST).o: $(AESTEST).c
+ #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
+@@ -557,7 +557,7 @@
+ #	fi
+ 
+ dummytest$(EXE_EXT): dummytest.o $(DLIBCRYPTO)
+-	@target=dummytest; $(BUILD_CMD)
++	+@target=dummytest; $(BUILD_CMD)
+ 
+ # DO NOT DELETE THIS LINE -- make depend depends on it.
+ 
\ No newline at end of file
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
index 675fd3e..290f129 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
             file://configure-musl-target.patch \
+            file://parallel.patch \
            "
 
 SRC_URI[md5sum] = "f3c710c045cdee5fd114feb69feba7aa"
-- 
2.7.0


