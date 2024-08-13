Return-Path: <t.fuchs@thofu.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA7AC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 05:21:40 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.web11.65425.1723526499121123154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 22:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@thofu.net header.s=MBO0001 header.b=X/IcELmR;
 spf=pass (domain: thofu.net, ip: 80.241.56.161, mailfrom: t.fuchs@thofu.net)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4WjfrH1Sy1z9skp;
	Tue, 13 Aug 2024 07:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thofu.net; s=MBO0001;
	t=1723526495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2SvdFWjRJpGgDcSZnneWgJK/eK8qGoLNJDjF9+IHpWs=;
	b=X/IcELmRCbNGLvyhdFtHWQXtk1S4pqsAQxe+7BgwdkAzeAaGHNF2zXRhd2Y2QTexsJ4EKM
	jhD0VepJVOQoqpdAV7RWilLLkWkDs33/YN24hqNQpwkGIYANIp/z3VoF5IjRe/LdNwUXrb
	PnMT4IO5XxBNYOUKeuBw0OabyPbMdy2E63ITX9fQdocWwN5cDlc1ZbLZ2XVZ8lPTIadDPc
	/QnGA4jc1NbfL5eei0Ia6UZFYrD9zm3X83AmmEy4Wdkfbq2RBtCVNsd3LiI2MKPkN3+S0a
	osm1A1cqA1A3fJLS8f3OvDvxv2I9kqN/v/VHrex6+NIaVOLWhccfqtLuLiirGg==
From: Thorsten Fuchs <t.fuchs@thofu.net>
To: openembedded-core@lists.openembedded.org
Cc: Thorsten Fuchs <t.fuchs@thofu.net>
Subject: [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
Date: Tue, 13 Aug 2024 07:21:21 +0200
Message-Id: <20240813052121.4594-1-t.fuchs@thofu.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203248

* Add a patch to rename LIBDIR variable in Makefiles
* Remove CVE_STATUS for CVE-2014-4715 that was fixed in r118.

Signed-off-by: Thorsten Fuchs <t.fuchs@thofu.net>
---
 ...1-Fix-Makefile-variable-name-overlap.patch | 211 ++++++++++++++++++
 .../lz4/{lz4_1.9.4.bb =3D> lz4_1.10.0.bb}       |  26 +--
 2 files changed, 223 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-support/lz4/files/0001-Fix-Makefile-vari=
able-name-overlap.patch
 rename meta/recipes-support/lz4/{lz4_1.9.4.bb =3D> lz4_1.10.0.bb} (59%)

diff --git a/meta/recipes-support/lz4/files/0001-Fix-Makefile-variable-na=
me-overlap.patch b/meta/recipes-support/lz4/files/0001-Fix-Makefile-varia=
ble-name-overlap.patch
new file mode 100644
index 0000000000..f69d6bd71b
--- /dev/null
+++ b/meta/recipes-support/lz4/files/0001-Fix-Makefile-variable-name-over=
lap.patch
@@ -0,0 +1,211 @@
+From ec631bc59a5ae9a38b688e999a9044fef9211d98 Mon Sep 17 00:00:00 2001
+From: Thorsten Fuchs <thorsten.fuchs@abaut.de>
+Date: Mon, 12 Aug 2024 12:20:21 +0000
+Subject: [PATCH] Fix Makefile variable name overlap.
+
+Upstream renamed LZ4DIR to LIBDIR inside Makefiles which collides with
+the OpenEmbedded builds.
+
+Signed-off-by: Thorsten Fuchs <thorsten.fuchs@abaut.de>
+---
+ examples/Makefile | 10 +++++-----
+ programs/Makefile | 16 ++++++++--------
+ tests/Makefile    | 28 ++++++++++++++--------------
+ 3 files changed, 27 insertions(+), 27 deletions(-)
+
+diff --git a/examples/Makefile b/examples/Makefile
+index 91a4f484..26fdf6d7 100644
+--- a/examples/Makefile
++++ b/examples/Makefile
+@@ -27,22 +27,22 @@
+ # kindly provided by Takayuki Matsuoka
+ # #####################################################################=
#####
+=20
+-LIBDIR    :=3D ../lib
++LZ4DIR    :=3D ../lib
+=20
+-CPPFLAGS  +=3D -I$(LIBDIR)
++CPPFLAGS  +=3D -I$(LZ4DIR)
+ USERCFLAGS:=3D $(CFLAGS)
+ WFLAGS     =3D -std=3Dgnu99 -Wall -Wextra -Wundef -Wshadow -Wcast-align=
 -Wstrict-prototypes -Wc++-compat
+ CFLAGS     =3D $(WFLAGS) -O2 $(USERCFLAGS)
+=20
+ TESTFILE   =3D Makefile
+-SLIBLZ4   :=3D $(LIBDIR)/liblz4.a
++SLIBLZ4   :=3D $(LZ4DIR)/liblz4.a
+ LZ4DIR     =3D ../programs
+ LZ4        =3D $(LZ4DIR)/lz4
+=20
+ default: all
+=20
+-$(SLIBLZ4): $(LIBDIR)/lz4.c $(LIBDIR)/lz4hc.c $(LIBDIR)/lz4frame.c $(LI=
BDIR)/lz4.h $(LIBDIR)/lz4hc.h $(LIBDIR)/lz4frame.h $(LIBDIR)/lz4frame_sta=
tic.h
+-	$(MAKE) -j -C $(LIBDIR) liblz4.a
++$(SLIBLZ4): $(LZ4DIR)/lz4.c $(LZ4DIR)/lz4hc.c $(LZ4DIR)/lz4frame.c $(LZ=
4DIR)/lz4.h $(LZ4DIR)/lz4hc.h $(LZ4DIR)/lz4frame.h $(LZ4DIR)/lz4frame_sta=
tic.h
++	$(MAKE) -j -C $(LZ4DIR) liblz4.a
+=20
+ ALL =3D print_version \
+ 	  simple_buffer \
+diff --git a/programs/Makefile b/programs/Makefile
+index 643ce14f..d9975b26 100644
+--- a/programs/Makefile
++++ b/programs/Makefile
+@@ -31,8 +31,8 @@
+ SED ?=3D sed
+=20
+ # Version numbers
+-LIBDIR   :=3D ../lib
+-LIBVER_SRC :=3D $(LIBDIR)/lz4.h
++LZ4DIR   :=3D ../lib
++LIBVER_SRC :=3D $(LZ4DIR)/lz4.h
+ LIBVER_MAJOR_SCRIPT:=3D`$(SED) -n '/define[[:blank:]][[:blank:]]*LZ4_VE=
RSION_MAJOR/s/.*[[:blank:]]\([0-9][0-9]*\).*/\1/p' < $(LIBVER_SRC)`
+ LIBVER_MINOR_SCRIPT:=3D`$(SED) -n '/define[[:blank:]][[:blank:]]*LZ4_VE=
RSION_MINOR/s/.*[[:blank:]]\([0-9][0-9]*\).*/\1/p' < $(LIBVER_SRC)`
+ LIBVER_PATCH_SCRIPT:=3D`$(SED) -n '/define[[:blank:]][[:blank:]]*LZ4_VE=
RSION_RELEASE/s/.*[[:blank:]]\([0-9][0-9]*\).*/\1/p' < $(LIBVER_SRC)`
+@@ -42,7 +42,7 @@ LIBVER_MINOR :=3D $(shell echo $(LIBVER_MINOR_SCRIPT))
+ LIBVER_PATCH :=3D $(shell echo $(LIBVER_PATCH_SCRIPT))
+ LIBVER   :=3D $(shell echo $(LIBVER_SCRIPT))
+=20
+-LIBFILES  =3D $(wildcard $(LIBDIR)/*.c)
++LIBFILES  =3D $(wildcard $(LZ4DIR)/*.c)
+ SRCFILES  =3D $(sort $(LIBFILES) $(wildcard *.c))
+ OBJFILES  =3D $(SRCFILES:.c=3D.o)
+=20
+@@ -51,7 +51,7 @@ DEBUGFLAGS=3D -Wall -Wextra -Wundef -Wcast-qual -Wcast=
-align -Wshadow \
+             -Wpointer-arith -Wstrict-aliasing=3D1
+ USERCFLAGS:=3D -O3 $(CFLAGS) # -O3 can be overruled by user-provided -O=
x level
+ CFLAGS    =3D $(DEBUGFLAGS) $(USERCFLAGS)
+-CPPFLAGS +=3D -I$(LIBDIR) -DXXH_NAMESPACE=3DLZ4_
++CPPFLAGS +=3D -I$(LZ4DIR) -DXXH_NAMESPACE=3DLZ4_
+=20
+ include ../Makefile.inc
+=20
+@@ -132,8 +132,8 @@ lz4-nomt: $(SRCFILES)
+=20
+ CLEAN +=3D lz4-wlib
+ lz4-wlib: LIBFILES =3D
+-lz4-wlib: SRCFILES+=3D $(LIBDIR)/xxhash.c  # benchmark unit needs XXH64=
()
+-lz4-wlib: LDFLAGS +=3D -L $(LIBDIR)
++lz4-wlib: SRCFILES+=3D $(LZ4DIR)/xxhash.c  # benchmark unit needs XXH64=
()
++lz4-wlib: LDFLAGS +=3D -L $(LZ4DIR)
+ lz4-wlib: LDLIBS   =3D -llz4
+ lz4-wlib: liblz4 $(OBJFILES)
+ 	@echo WARNING: $@ must link to an extended variant of the dynamic libr=
ary which also exposes unstable symbols
+@@ -141,7 +141,7 @@ lz4-wlib: liblz4 $(OBJFILES)
+=20
+ .PHONY:liblz4
+ liblz4:
+-	CPPFLAGS=3D"-DLZ4F_PUBLISH_STATIC_FUNCTIONS -DLZ4_PUBLISH_STATIC_FUNCT=
IONS" $(MAKE) -C $(LIBDIR) liblz4
++	CPPFLAGS=3D"-DLZ4F_PUBLISH_STATIC_FUNCTIONS -DLZ4_PUBLISH_STATIC_FUNCT=
IONS" $(MAKE) -C $(LZ4DIR) liblz4
+=20
+ CLEAN +=3D lz4c
+ lz4c: lz4
+@@ -179,7 +179,7 @@ clean:
+ ifeq ($(WINBASED),yes)
+ 	$(RM) *.rc
+ endif
+-	$(MAKE) -C $(LIBDIR) $@ > $(VOID)
++	$(MAKE) -C $(LZ4DIR) $@ > $(VOID)
+ 	$(RM) $(CLEAN) *.o tmp* *.test core
+ 	@echo Cleaning completed
+=20
+diff --git a/tests/Makefile b/tests/Makefile
+index 47e2774d..7adfdfcc 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -28,7 +28,7 @@
+ # datagen : generates synthetic data samples for tests & benchmarks
+ # #####################################################################=
#####
+=20
+-LIBDIR  :=3D ../lib
++LZ4DIR  :=3D ../lib
+ PRGDIR  :=3D ../programs
+ TESTDIR :=3D versionsTest
+ PYTHON  ?=3D python3
+@@ -40,7 +40,7 @@ WFLAGS    =3D -Wall -Wextra -Wundef -Wcast-qual -Wcast=
-align -Wshadow \
+             -Wswitch-enum -Wdeclaration-after-statement -Wstrict-protot=
ypes \
+             -Wpointer-arith -Wstrict-aliasing=3D1
+ CFLAGS    =3D $(WFLAGS) $(DEBUGFLAGS) $(USERCFLAGS)
+-CPPFLAGS +=3D -I$(LIBDIR) -I$(PRGDIR) -DXXH_NAMESPACE=3DLZ4_
++CPPFLAGS +=3D -I$(LZ4DIR) -I$(PRGDIR) -DXXH_NAMESPACE=3DLZ4_
+ ALLFLAGS  =3D $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
+=20
+ include ../Makefile.inc
+@@ -69,7 +69,7 @@ lz4:
+=20
+ .PHONY: lib liblz4.pc
+ lib liblz4.pc:
+-	$(MAKE) -C $(LIBDIR) $@ CFLAGS=3D"$(CFLAGS)"
++	$(MAKE) -C $(LZ4DIR) $@ CFLAGS=3D"$(CFLAGS)"
+=20
+ lz4c unlz4 lz4cat: lz4
+ 	$(LN_SF) $(LZ4) $(PRGDIR)/$@
+@@ -79,7 +79,7 @@ lz4c32:  # create a 32-bits version for 32/64 interop =
tests
+ 	$(MAKE) -C $(PRGDIR) $@ CFLAGS=3D"-m32 $(CFLAGS)"
+=20
+ # *.o objects are from library
+-%.o : $(LIBDIR)/%.c $(LIBDIR)/%.h
++%.o : $(LZ4DIR)/%.c $(LZ4DIR)/%.h
+ 	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
+=20
+ CLEAN +=3D fullbench
+@@ -88,14 +88,14 @@ fullbench : CPPFLAGS +=3D -DNDEBUG
+ fullbench : lz4.o lz4hc.o lz4frame.o xxhash.o fullbench.c
+ 	$(CC) $(ALLFLAGS) $^ -o $@$(EXT)
+=20
+-.PHONY: $(LIBDIR)/liblz4.a
+-$(LIBDIR)/liblz4.a:
+-	$(MAKE) -C $(LIBDIR) liblz4.a
++.PHONY: $(LZ4DIR)/liblz4.a
++$(LZ4DIR)/liblz4.a:
++	$(MAKE) -C $(LZ4DIR) liblz4.a
+=20
+ CLEAN +=3D fullbench-lib
+ fullbench-lib : DEBUGLEVEL=3D0
+ fullbench-lib : CPPFLAGS +=3D -DNDEBUG
+-fullbench-lib: fullbench.c $(LIBDIR)/liblz4.a
++fullbench-lib: fullbench.c $(LZ4DIR)/liblz4.a
+ 	$(CC) $(ALLFLAGS) $^ -o $@$(EXT)
+=20
+ # Note: Windows only
+@@ -103,9 +103,9 @@ ifeq ($(WINBASED),yes)
+ CLEAN +=3D fullbench-dll
+ fullbench-dll : DEBUGLEVEL=3D0
+ fullbench-dll : CPPFLAGS +=3D -DNDEBUG
+-fullbench-dll: fullbench.c $(LIBDIR)/xxhash.c
+-	$(MAKE) -C $(LIBDIR) liblz4
+-	$(CC) $(ALLFLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=3D1 $(LIBDIR)/dll/$(=
LIBLZ4).dll
++fullbench-dll: fullbench.c $(LZ4DIR)/xxhash.c
++	$(MAKE) -C $(LZ4DIR) liblz4
++	$(CC) $(ALLFLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=3D1 $(LZ4DIR)/dll/$(=
LIBLZ4).dll
+ endif
+=20
+ # test LZ4_USER_MEMORY_FUNCTIONS
+@@ -143,7 +143,7 @@ decompress-partial-usingDict: lz4.o decompress-parti=
al-usingDict.c
+=20
+ .PHONY: clean
+ clean:
+-	@$(MAKE) -C $(LIBDIR) $@ > $(VOID)
++	@$(MAKE) -C $(LZ4DIR) $@ > $(VOID)
+ 	@$(MAKE) -C $(PRGDIR) $@ > $(VOID)
+ 	@$(RM) $(CLEAN) core *.o *.test tmp*
+ 	@$(RM) -r $(TESTDIR)
+@@ -166,7 +166,7 @@ abiTests:
+ 	$(PYTHON) test-lz4-abi.py
+=20
+ CLEAN +=3D checkTag
+-checkTag: checkTag.c $(LIBDIR)/lz4.h
++checkTag: checkTag.c $(LZ4DIR)/lz4.h
+ 	$(CC) $(ALLFLAGS) $< -o $@$(EXT)
+=20
+ #----------------------------------------------------------------------=
-------
+@@ -204,7 +204,7 @@ test32: test
+ test-amalgamation: lz4_all.o
+=20
+ CLEAN +=3D lz4_all.c
+-lz4_all.c: $(LIBDIR)/lz4.c $(LIBDIR)/lz4hc.c $(LIBDIR)/lz4frame.c
++lz4_all.c: $(LZ4DIR)/lz4.c $(LZ4DIR)/lz4hc.c $(LZ4DIR)/lz4frame.c
+ 	$(CAT) $^ > $@
+=20
+ test-install: lz4 lib liblz4.pc
+--=20
+2.17.1
+
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support=
/lz4/lz4_1.10.0.bb
similarity index 59%
rename from meta/recipes-support/lz4/lz4_1.9.4.bb
rename to meta/recipes-support/lz4/lz4_1.10.0.bb
index 51a854d44a..778a5b6e72 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -2,45 +2,43 @@ SUMMARY =3D "Extremely Fast Compression algorithm"
 DESCRIPTION =3D "LZ4 is a very fast lossless compression algorithm, prov=
iding compression speed at 400 MB/s per core, scalable with multi-cores C=
PU. It also features an extremely fast decoder, with speed in multiple GB=
/s per core, typically reaching RAM speed limits on multi-core systems."
 HOMEPAGE =3D "https://github.com/lz4/lz4"
=20
-LICENSE =3D "BSD-2-Clause | GPL-2.0-only"
+LICENSE =3D "BSD-2-Clause | GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://lib/LICENSE;md5=3D5cd5f851b52ec832b10eedb3f=
01f885a \
-                    file://programs/COPYING;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263 \
-                    file://LICENSE;md5=3Dc5cc3cd6f9274b4d32988096df9c3ec=
3 \
+                    file://programs/COPYING;md5=3D492daf447d6db0e5eb344a=
7922e7ec25 \
+                    file://LICENSE;md5=3Dc111c47e301c2ffe8776729b40b4447=
7 \
                     "
=20
 PE =3D "1"
=20
-SRCREV =3D "5ff839680134437dbf4678f3d0c7b371d84f4964"
+SRCREV =3D "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
=20
 SRC_URI =3D "git://github.com/lz4/lz4.git;branch=3Drelease;protocol=3Dht=
tps \
-	   file://run-ptest \
-	   "
+           file://0001-Fix-Makefile-variable-name-overlap.patch \
+           file://run-ptest \
+           "
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
=20
 S =3D "${WORKDIR}/git"
=20
 inherit ptest
=20
-CVE_STATUS[CVE-2014-4715] =3D "fixed-version: Fixed in r118, which is la=
rger than the current version."
-
 EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}' D=
ESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=3D=
no"
=20
 do_install() {
-	oe_runmake install
+        oe_runmake install
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-RDEPENDS:${PN}-ptest +=3D "bash"
+RDEPENDS_${PN}-ptest +=3D "bash"
=20
 do_compile_ptest() {
         oe_runmake -C ${B}/tests/
 }
=20
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests/
-	install --mode=3D755 ${B}/tests/frametest ${D}${PTEST_PATH}/tests/
-	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
-
+        install -d ${D}${PTEST_PATH}/tests/
+        install --mode=3D755 ${B}/tests/frametest ${D}${PTEST_PATH}/test=
s/
+        sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-pt=
est
 }
=20
--=20
2.34.1


