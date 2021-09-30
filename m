Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA307C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 10:44:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.10695.1632998658641111645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 03:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=PhUOTFs9;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 42E2B80EFB;
	Thu, 30 Sep 2021 12:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1632998655;
	bh=c46OR4yvSeFWKCLoJaBkgc54i/dQVLZzuai43Idyq94=;
	h=From:To:Cc:Subject:Date:From;
	b=PhUOTFs9O9tjfLDJ+v4bcdCbe2stnGVnQTihk1so3xQgc3wfBDchlifDa1LWQUcUJ
	 ohMHAFjV/DvyU6wZTPdbHFS1jKt7uoIVeWWfOIA3c+iorcwbeuW46iu8K/p3h2zZV/
	 ITWp8ROsevY+SP6iUFz5kwaOWMsYb6p/w34WVT43bZtPt31pqc1u3XjIHggIyY4lJ9
	 Vn4xGcyGR422UIPU74BtxIPWTsvlfh/0UpeG47BwjQRch6b1ie/bagzmHR/K2d3bRb
	 EQ/qm54UU/ORD2oNXJT89Mh4VjFVGk51/+abCeNhI0ppVk1AYv5R/RHBUpkdNeuVV/
	 fV1QpN4uBmamQ==
From: Lukasz Majewski <lukma@denx.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nathan Rossi <nathan@nathanrossi.com>,
	Khem Raj <raj.khem@gmail.com>
Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH RESEND 1/2] glibc: Exclude common code to build tests to
 glibc-tests.inc
Date: Thu, 30 Sep 2021 12:43:56 +0200
Message-Id: <20210930104357.3906-1-lukma@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 10:44:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156491

The common code to build tests has been excluded from glibc-testsuite
recipe to glibc-tests.inc

This code will be reused in the recipe necessary for providing glibc
tests executed with ptest framework.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 meta/recipes-core/glibc/glibc-tests.inc       | 32 ++++++++++++++++
 .../glibc/glibc-testsuite_2.34.bb             | 37 ++-----------------
 2 files changed, 36 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc-tests.inc

diff --git a/meta/recipes-core/glibc/glibc-tests.inc b/meta/recipes-core/=
glibc/glibc-tests.inc
new file mode 100644
index 0000000000..a8fe160a54
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc-tests.inc
@@ -0,0 +1,32 @@
+EXCLUDE_FROM_WORLD =3D "1"
+
+# handle PN differences
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/glibc:"
+
+# setup depends
+INHIBIT_DEFAULT_DEPS =3D ""
+
+python () {
+    libc =3D d.getVar("PREFERRED_PROVIDER_virtual/libc")
+    libclocale =3D d.getVar("PREFERRED_PROVIDER_virtual/libc-locale")
+    if libc !=3D "glibc" or libclocale !=3D "glibc-locale":
+        raise bb.parse.SkipRecipe("glibc-testsuite requires that virtual=
/libc is glibc")
+}
+
+DEPENDS +=3D "glibc-locale libgcc gcc-runtime"
+
+# remove the initial depends
+DEPENDS:remove =3D "libgcc-initial"
+
+do_check[dirs] +=3D "${B}"
+do_check () {
+    # clean out previous test results
+    oe_runmake tests-clean
+    # makefiles don't clean entirely (and also sometimes fails due to to=
o many args)
+    find ${B} -type f -name "*.out" -delete
+    find ${B} -type f -name "*.test-result" -delete
+    find ${B}/catgets -name "*.cat" -delete
+    find ${B}/conform -name "symlist-*" -delete
+    [ ! -e ${B}/timezone/testdata ] || rm -rf ${B}/timezone/testdata
+}
+addtask do_check after do_compile
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.34.bb b/meta/recip=
es-core/glibc/glibc-testsuite_2.34.bb
index 72aa332171..e8ad2a938b 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.34.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.34.bb
@@ -1,30 +1,12 @@
 require glibc_${PV}.bb
+require glibc-tests.inc
=20
-EXCLUDE_FROM_WORLD =3D "1"
+inherit qemu
=20
-# handle PN differences
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/glibc:"
+SRC_URI +=3D "file://check-test-wrapper"
=20
 # strip provides
 PROVIDES =3D ""
-# setup depends
-INHIBIT_DEFAULT_DEPS =3D ""
-
-python () {
-    libc =3D d.getVar("PREFERRED_PROVIDER_virtual/libc")
-    libclocale =3D d.getVar("PREFERRED_PROVIDER_virtual/libc-locale")
-    if libc !=3D "glibc" or libclocale !=3D "glibc-locale":
-        raise bb.parse.SkipRecipe("glibc-testsuite requires that virtual=
/libc is glibc")
-}
-
-DEPENDS +=3D "glibc-locale libgcc gcc-runtime"
-
-# remove the initial depends
-DEPENDS:remove =3D "libgcc-initial"
-
-inherit qemu
-
-SRC_URI +=3D "file://check-test-wrapper"
=20
 DEPENDS +=3D "${@'qemu-native' if d.getVar('TOOLCHAIN_TEST_TARGET') =3D=3D=
 'user' else ''}"
=20
@@ -33,20 +15,10 @@ TOOLCHAIN_TEST_HOST ??=3D "localhost"
 TOOLCHAIN_TEST_HOST_USER ??=3D "root"
 TOOLCHAIN_TEST_HOST_PORT ??=3D "2222"
=20
-do_check[dirs] +=3D "${B}"
 do_check[nostamp] =3D "1"
-do_check () {
+do_check:append () {
     chmod 0755 ${WORKDIR}/check-test-wrapper
=20
-    # clean out previous test results
-    oe_runmake tests-clean
-    # makefiles don't clean entirely (and also sometimes fails due to to=
o many args)
-    find ${B} -type f -name "*.out" -delete
-    find ${B} -type f -name "*.test-result" -delete
-    find ${B}/catgets -name "*.cat" -delete
-    find ${B}/conform -name "symlist-*" -delete
-    [ ! -e ${B}/timezone/testdata ] || rm -rf ${B}/timezone/testdata
-
     oe_runmake -i \
         QEMU_SYSROOT=3D"${RECIPE_SYSROOT}" \
         QEMU_OPTIONS=3D"${@qemu_target_binary(d)} ${QEMU_OPTIONS}" \
@@ -56,7 +28,6 @@ do_check () {
         test-wrapper=3D"${WORKDIR}/check-test-wrapper ${TOOLCHAIN_TEST_T=
ARGET}" \
         check
 }
-addtask do_check after do_compile
=20
 inherit nopackages
 deltask do_stash_locale
--=20
2.20.1


