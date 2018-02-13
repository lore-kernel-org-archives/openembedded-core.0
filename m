Return-Path: <robert_joslyn@selinc.com>
Received: from volare.selinc.com (volare.selinc.com [74.117.214.143])
	by mail.openembedded.org (Postfix) with ESMTP id 292DF60102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 19:56:39 +0000 (UTC)
Received: from pps.filterd (volare.selinc.com [127.0.0.1])
	by volare.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w1DJuedm016958
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 11:56:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=from : to : cc :
	subject : date : message-id : content-transfer-encoding : mime-version; 
	s=SELinc2017; bh=Hy9nJvqs6o3lj1HDZ5cP4ylrviPyaCTOwoOZj/M0mm8=;
	b=M5H1TxyMkNGzoRudKqG+m/0OmMj722lk9jfpIBe9fMe6MyNATx6dkjrxR/wRktjgEcRF
	RlXBRGqRrBt8o/6TKRha1RuAjcAkyo6NzgHYE8ZEtcyNmPLRtWZeVwlS6KDEktSWAQ35
	AUJIa5+Ed9RPod2mhiDlHBvZpJnhQHz5r8KA3FiFQOonLNKvLik7WvR70Uvz242T7p3y
	PxtI1RSqj5gNHCs3ywC/xNPBf6BxPu/fzW25pWCLqqdxfH3f3E5V6Aqh98eoa/G/uIad
	wmYaMEoylCovw4WyXmz/0Lf3HFxhg/xUbOD0fPxBQdbONPlvTQEKTaAmp4nwSbDqb+dw
	5g== 
Received: from edison2.ad.selinc.com ([10.100.0.115])
	by volare.selinc.com with ESMTP id 2g1w5rku4f-1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 11:56:40 -0800
Received: from robejoslpc.ad.selinc.com ([10.202.51.92])
	by edison2.ad.selinc.com (IBM Domino Release 9.0.1FP9 HF139)
	with ESMTP id 2018021311564011-422413 ;
	Tue, 13 Feb 2018 11:56:40 -0800 
From: Robert Joslyn <robert_joslyn@selinc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Feb 2018 11:56:29 -0800
Message-Id: <20180213195629.32713-1-robert_joslyn@selinc.com>
X-Mailer: git-send-email 2.13.6
X-MIMETrack: Itemize by SMTP Server on Edison2/SEL(Release 9.0.1FP9
	HF139|October 06, 2017) at 02/13/2018 11:56:40 AM,
	Serialize by Router on Edison2/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 02/13/2018 11:56:40 AM,
	Serialize complete at 02/13/2018 11:56:40 AM
X-TNEFEvaluated: 1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8804
	signatures=668670
Subject: [pyro][PATCH] openssl: Upgrade from 1.0.2k to 1.0.2n
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
X-List-Received-Date: Tue, 13 Feb 2018 19:56:40 -0000
Content-Transfer-Encoding: Quoted-printable

Drop patches already applied upstream. Refresh parallel.patch using
latest version from master.

LICENSE checksum changed because of updated copyright years and a minor
wording change.

Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
---
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch |  21 ---
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  23 ---
 .../openssl/openssl/parallel.patch                 | 177 ++++++++++++-----=
----
 .../{openssl_1.0.2k.bb =3D> openssl_1.0.2n.bb}       |   8 +-
 4 files changed, 108 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-de=
s-ede3-cfb1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid=
-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb =3D> openssl_1=
.0.2n.bb} (86%)

diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-=
cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-=
cfb1.patch
deleted file mode 100644
index 2a318a4584..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.pa=
tch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Submitted
-
-This patch adds the fix for one of the ciphers used in openssl, namely
-the cipher des-ede3-cfb1. Complete bug log and patch is present here:
-https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__rt.openssl.org_Ticke=
t_Display.html-3Fid-3D2867&d=3DDwIBAg&c=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb=
60_N6TVnLk&r=3Dak_pMnzuMKndrbvJGok-seoFenjTGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDl=
BGjO&m=3D0SM_v6Y1G3OqPRA6G0s_eDH0n62AtE0roLzoFPTTxtE&s=3D06mMZcIcyzs-Jle09r=
lZphsnP7uRW9XSiyNlv1AuVX4&e=3D
-
-Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
-
-Index: openssl-1.0.2/crypto/evp/e_des3.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openssl-1.0.2.orig/crypto/evp/e_des3.c
-+++ openssl-1.0.2/crypto/evp/e_des3.c
-@@ -211,7 +211,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPH
-     size_t n;
-     unsigned char c[1], d[1];
-=20
--    for (n =3D 0; n < inl; ++n) {
-+    for (n =3D 0; n * 8 < inl; ++n) {
-         c[0] =3D (in[n / 8] & (1 << (7 - n % 8))) ? 0x80 : 0;
-         DES_ede3_cfb_encrypt(c, d, 1, 1,
-                              &data(ctx)->ks1, &data(ctx)->ks2,
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-p=
ointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/o=
penssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.=
patch
deleted file mode 100644
index f736e5c098..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-=
dereference-in-EVP_DigestInit_ex.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()
-
-We should avoid accessing the type pointer if it's NULL,
-this could happen if ctx->digest is not NULL.
-
-Upstream-Status: Submitted
-https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.mail-2Darchive.c=
om_openssl-2Ddev-40openssl.org_msg32860.html&d=3DDwIBAg&c=3DzVFQZQ67ypsA9mY=
KSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pMnzuMKndrbvJGok-seoFenjTGhP3oPNUzKUOwz=
HhGpNMwSJsaHunyXDlBGjO&m=3D0SM_v6Y1G3OqPRA6G0s_eDH0n62AtE0roLzoFPTTxtE&s=3D=
jONpcmBcoaRUeYIHuzJ49sOHr1LXt2wZrpiekq78638&e=3D
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
----
-Index: openssl-1.0.2h/crypto/evp/digest.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- openssl-1.0.2h.orig/crypto/evp/digest.c
-+++ openssl-1.0.2h/crypto/evp/digest.c
-@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
-         type =3D ctx->digest;
-     }
- #endif
--    if (ctx->digest !=3D type) {
-+    if (type && (ctx->digest !=3D type)) {
-         if (ctx->digest && ctx->digest->ctx_size) {
-             OPENSSL_free(ctx->md_data);
-             ctx->md_data =3D NULL;
diff --git a/meta/recipes-connectivity/openssl/openssl/parallel.patch b/met=
a/recipes-connectivity/openssl/openssl/parallel.patch
index f3f4c99888..e5413bf389 100644
--- a/meta/recipes-connectivity/openssl/openssl/parallel.patch
+++ b/meta/recipes-connectivity/openssl/openssl/parallel.patch
@@ -1,4 +1,7 @@
-Fix the parallel races in the Makefiles.
+From 7fb1192f112c1920bfd39f4185f34e9afff3cff2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Sat, 5 Mar 2016 00:12:02 +0000
+Subject: [PATCH 24/28] Fix the parallel races in the Makefiles.
=20
 This patch was taken from the Gentoo packaging:
 https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gitweb.gentoo.org_r=
epo_gentoo.git_plain_dev-2Dlibs_openssl_files_openssl-2D1.0.2g-2Dparallel-2=
Dbuild.patch&d=3DDwIBAg&c=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=
=3Dak_pMnzuMKndrbvJGok-seoFenjTGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&m=3D0SM=
_v6Y1G3OqPRA6G0s_eDH0n62AtE0roLzoFPTTxtE&s=3Dd0grV0ABEAOI9OYRrP8XtlMYm_Mddw=
seffLUIwLv7tI&e=3D
@@ -9,9 +12,82 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 Refreshed for 1.0.2i
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
=20
---- openssl-1.0.2g/crypto/Makefile
-+++ openssl-1.0.2g/crypto/Makefile
-@@ -85,11 +85,11 @@
+---
+ Makefile.org          |  14 +-
+ Makefile.org.orig     |  10 +-
+ Makefile.shared       |   2 +
+ Makefile.shared.orig  | 655 +++++++++++++++++++++++++++++++++++++++++++++=
+++++
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
+@@ -283,17 +283,17 @@ build_libcrypto: build_crypto build_engines libcrypt=
o.pc
+ build_libssl: build_ssl libssl.pc
+=20
+ build_crypto:
+-	@dir=3Dcrypto; target=3Dall; $(BUILD_ONE_CMD)
++	+@dir=3Dcrypto; target=3Dall; $(BUILD_ONE_CMD)
+ build_ssl: build_crypto
+-	@dir=3Dssl; target=3Dall; $(BUILD_ONE_CMD)
++	+@dir=3Dssl; target=3Dall; $(BUILD_ONE_CMD)
+ build_engines: build_crypto
+-	@dir=3Dengines; target=3Dall; $(BUILD_ONE_CMD)
++	+@dir=3Dengines; target=3Dall; $(BUILD_ONE_CMD)
+ build_apps: build_libs
+-	@dir=3Dapps; target=3Dall; $(BUILD_ONE_CMD)
++	+@dir=3Dapps; target=3Dall; $(BUILD_ONE_CMD)
+ build_tests: build_libs
+-	@dir=3Dtest; target=3Dall; $(BUILD_ONE_CMD)
++	+@dir=3Dtest; target=3Dall; $(BUILD_ONE_CMD)
+ build_tools: build_libs
+-	@dir=3Dtools; target=3Dall; $(BUILD_ONE_CMD)
++	+@dir=3Dtools; target=3Dall; $(BUILD_ONE_CMD)
+=20
+ all_testapps: build_libs build_testapps
+ build_testapps:
+@@ -565,7 +565,7 @@ install_sw:
+ 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
+ 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
+ 	done;
+-	@set -e; target=3Dinstall; $(RECURSIVE_BUILD_CMD)
++	+@set -e; target=3Dinstall; $(RECURSIVE_BUILD_CMD)
+ 	@set -e; liblist=3D"$(LIBS)"; for i in $$liblist ;\
+ 	do \
+ 		if [ -f "$$i" ]; then \
+diff --git a/Makefile.shared b/Makefile.shared
+index f6f92e7..8164186 100644
+--- a/Makefile.shared
++++ b/Makefile.shared
+@@ -105,6 +105,7 @@ LINK_SO=3D	\
+     SHAREDFLAGS=3D"$(OE_LDFLAGS) $${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLA=
GS)}"; \
+     LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;=
t' -e d | uniq`; \
+     LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
++    [ -e $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX ] && exit 0; \
+     LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
+     $${SHAREDCMD} $${SHAREDFLAGS} \
+ 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
+@@ -122,6 +123,7 @@ SYMLINK_SO=3D	\
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
  	@if [ -z "$(THIS)" ]; then $(MAKE) -f $(TOP)/Makefile reflect THIS=3D$@;=
 fi
=20=20
  subdirs:
@@ -25,7 +101,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
=20=20
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
=20=20
  libs:
@@ -43,7 +119,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
=20=20
  install:
  	@[ -n "$(INSTALLTOP)" ] # should be set by top Makefile...
-@@ -120,7 +120,7 @@
+@@ -120,7 +120,7 @@ install:
  	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
  	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
  	done;
@@ -52,9 +128,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
=20=20
  lint:
  	@target=3Dlint; $(RECURSIVE_MAKE)
---- openssl-1.0.2g/engines/Makefile
-+++ openssl-1.0.2g/engines/Makefile
-@@ -72,7 +72,7 @@
+diff --git a/engines/Makefile b/engines/Makefile
+index fe8e9ca..a43d21b 100644
+--- a/engines/Makefile
++++ b/engines/Makefile
+@@ -72,7 +72,7 @@ top:
=20=20
  all:	lib subdirs
=20=20
@@ -63,7 +141,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  	@if [ -n "$(SHARED_LIBS)" ]; then \
  		set -e; \
  		for l in $(LIBNAMES); do \
-@@ -89,7 +89,7 @@
+@@ -89,7 +89,7 @@ lib:	$(LIBOBJ)
=20=20
  subdirs:
  	echo $(EDIRS)
@@ -72,8 +150,8 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
=20=20
  files:
  	$(PERL) $(TOP)/util/files.pl Makefile >> $(TOP)/MINFO
-@@ -128,7 +128,7 @@
- 			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx=
.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx ); \
+@@ -128,7 +128,7 @@ install:
+ 			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$=
$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx=
 ); \
  		done; \
  	fi
 -	@target=3Dinstall; $(RECURSIVE_MAKE)
@@ -81,62 +159,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
=20=20
  tags:
  	ctags $(SRC)
---- openssl-1.0.2g/Makefile.org
-+++ openssl-1.0.2g/Makefile.org
-@@ -279,17 +279,17 @@
- build_libssl: build_ssl libssl.pc
-=20
- build_crypto:
--	@dir=3Dcrypto; target=3Dall; $(BUILD_ONE_CMD)
-+	+@dir=3Dcrypto; target=3Dall; $(BUILD_ONE_CMD)
- build_ssl: build_crypto
--	@dir=3Dssl; target=3Dall; $(BUILD_ONE_CMD)
-+	+@dir=3Dssl; target=3Dall; $(BUILD_ONE_CMD)
- build_engines: build_crypto
--	@dir=3Dengines; target=3Dall; $(BUILD_ONE_CMD)
-+	+@dir=3Dengines; target=3Dall; $(BUILD_ONE_CMD)
- build_apps: build_libs
--	@dir=3Dapps; target=3Dall; $(BUILD_ONE_CMD)
-+	+@dir=3Dapps; target=3Dall; $(BUILD_ONE_CMD)
- build_tests: build_libs
--	@dir=3Dtest; target=3Dall; $(BUILD_ONE_CMD)
-+	+@dir=3Dtest; target=3Dall; $(BUILD_ONE_CMD)
- build_tools: build_libs
--	@dir=3Dtools; target=3Dall; $(BUILD_ONE_CMD)
-+	+@dir=3Dtools; target=3Dall; $(BUILD_ONE_CMD)
-=20
- all_testapps: build_libs build_testapps
- build_testapps:
-@@ -544,7 +544,7 @@
- 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
- 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
- 	done;
--	@set -e; target=3Dinstall; $(RECURSIVE_BUILD_CMD)
-+	+@set -e; target=3Dinstall; $(RECURSIVE_BUILD_CMD)
- 	@set -e; liblist=3D"$(LIBS)"; for i in $$liblist ;\
- 	do \
- 		if [ -f "$$i" ]; then \
---- openssl-1.0.2g/Makefile.shared
-+++ openssl-1.0.2g/Makefile.shared
-@@ -105,6 +105,7 @@
-     SHAREDFLAGS=3D"$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
-     LIBPATH=3D`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;=
t' -e d | uniq`; \
-     LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
-+    [ -e $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX ] && exit 0; \
-     LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
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
=20=20
@@ -145,7 +172,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
=20=20
  apps:
  	@(cd ..; $(MAKE) DIRS=3Dapps all)
-@@ -438,136 +438,136 @@
+@@ -444,139 +444,139 @@ BUILD_CMD_STATIC=3Dshlib_target=3D; \
  		link_app.$${shlib_target}
=20=20
  $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
@@ -316,6 +343,9 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 -	@target=3D$(BADDTLSTEST) $(BUILD_CMD)
 +	+@target=3D$(BADDTLSTEST) $(BUILD_CMD)
=20=20
+ $(FATALERRTEST)$(EXE_EXT): $(FATALERRTEST).o ssltestlib.o $(DLIBSSL) $(DL=
IBCRYPTO)
+ 	@target=3D$(FATALERRTEST); exobj=3Dssltestlib.o; $(BUILD_CMD)
+=20
  $(SSLV2CONFTEST)$(EXE_EXT): $(SSLV2CONFTEST).o
 -	@target=3D$(SSLV2CONFTEST) $(BUILD_CMD)
 +	+@target=3D$(SSLV2CONFTEST) $(BUILD_CMD)
@@ -326,7 +356,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
=20=20
  #$(AESTEST).o: $(AESTEST).c
  #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
-@@ -580,6 +580,6 @@
+@@ -589,7 +589,7 @@ $(DTLSTEST)$(EXE_EXT): $(DTLSTEST).o ssltestlib.o $(DL=
IBSSL) $(DLIBCRYPTO)
  #	fi
=20=20
  dummytest$(EXE_EXT): dummytest.o $(DLIBCRYPTO)
@@ -334,4 +364,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 +	+@target=3Ddummytest; $(BUILD_CMD)
=20=20
  # DO NOT DELETE THIS LINE -- make depend depends on it.
-=20
\ No newline at end of file
+=20
+--=20
+2.15.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.0.2n.bb
similarity index 86%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
index 83d1a500c2..849f04b762 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
@@ -7,7 +7,7 @@ DEPENDS +=3D "cryptodev-linux"
 CFLAG +=3D "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native =3D " -fPIC"
=20
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D27ffa5d74bb5a337056c14b2ef93fbf=
6"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D057d9218c6180e1d9ee407572b2dd22=
5"
=20
 export DIRS =3D "crypto ssl apps engines"
 export OE_LDFLAGS=3D"${LDFLAGS}"
@@ -32,8 +32,6 @@ SRC_URI +=3D "file://find.pl;subdir=3D${BP}/util/ \
             file://debian1.0.2/version-script.patch \
             file://debian1.0.2/soname.patch \
             file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestIni=
t_ex.patch \
             file://openssl-fix-des.pod-error.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
@@ -45,8 +43,8 @@ SRC_URI +=3D "file://find.pl;subdir=3D${BP}/util/ \
             file://Use-SHA256-not-MD5-as-default-digest.patch \
             file://0001-Fix-build-with-clang-using-external-assembler.patc=
h \
             "
-SRC_URI[md5sum] =3D "f965fc0bf01bf882b31314b61391ae65"
-SRC_URI[sha256sum] =3D "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb=
6643c3cb88d8c0"
+SRC_URI[md5sum] =3D "13bdc1b1d1ff39b6fd42a255e74676a4"
+SRC_URI[sha256sum] =3D "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a8=
32a982fd15a8fe"
=20
 PACKAGES =3D+ "${PN}-engines"
 FILES_${PN}-engines =3D "${libdir}/ssl/engines/*.so ${libdir}/engines"
--=20
2.13.6


