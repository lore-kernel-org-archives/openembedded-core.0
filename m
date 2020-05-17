Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.21540.1589720398536773977
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 06:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=d6KzLqFB;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5ztw=67=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Q2L23fGGz3p
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 14:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589720395;
	bh=AFDCX2xRTnK1XhLYbAvR0RR+2QhLHRoSugj6CL7QhzQ=;
	h=From:To:Subject:Date:From;
	b=d6KzLqFBkCFyh6Up9BVwye0OSA1e7AUSxCjkOIpK5mZ54vV11mkFcD0JRlLJ4wtdY
	 xepfUlITKJHFGe+F6MHBdkurhYvVbOrHvCKGUCvp2yVSrQ4kn+P1vjzfm7lDTRbFcL
	 ht/q12/eEMt9PtubjY0huQY7KdHGnffCLjC0h6JxTXZlDBN61E32LhQWyMrZQL8kqO
	 Yn0VE6p+k0VTQDvcG0st2DFT+VcYPiT+XctAoPwhbOic/q1a8yiWk6RMFCtpB28LU7
	 YVYIrsGFkrGGFAJRBl66w0zBA5KY7VuM0S2WSgMhEswkWNM698K5WU0ELgu0dG5h39
	 2l+v4UsL15oimx3aJJQi/2Vj6ChfLHARy19Yt0mkHrC4JVlAvMXpAJCh6y2q3FBLGs
	 l0AzuA/GyOKFkxURLoYxKn9Bt7rwJ5OF1Ky6EV4jQnHCTPDdAgTvQKW3Pshf+kIWPu
	 gBm3rphlyzUtFjRvEHE816nVfV1xBzB4eqMNnhdl5CZ1YRrR3wPhLusIhkIvXynmdQ
	 eoyYu6m1wz664Drd8RkvbX7FFYpw4UpxDlKaeJzCcJtIohwAMkiJevdbbzwlKi7ofK
	 wZlMnDygL5Jsptm/n7i0UM7wKeDMQmu4V2VgrA3nIksu9u20orAKvrNCElQWAXufjw
	 5KXlrxnU/ZENHoxkim/PCHR0=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gcc: Remove mudflap remnants
Date: Sun, 17 May 2020 15:59:52 +0300
Message-Id: <20200517125952.25245-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

mudflap was removed in gcc 4.9.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/gcc/gcc-10.1.inc    |  2 --
 meta/recipes-devtools/gcc/gcc-runtime.inc | 15 ---------------
 2 files changed, 17 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
index 041d426187..a3de91a2c6 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
@@ -87,7 +87,6 @@ EXTRA_OECONF_BASE = "\
     ${SSP} \
     --enable-libitm \
     --disable-bootstrap \
-    --disable-libmudflap \
     --with-system-zlib \
     ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
     --enable-linker-build-id \
@@ -99,7 +98,6 @@ EXTRA_OECONF_BASE = "\
 "
 
 EXTRA_OECONF_INITIAL = "\
-    --disable-libmudflap \
     --disable-libgomp \
     --disable-libitm \
     --disable-libquadmath \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index e12c74613f..df1432e68d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -47,7 +47,6 @@ RUNTIMETARGET = "${RUNTIMELIBSSP} libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM
 RUNTIMETARGET_libc-newlib = "libstdc++-v3"
 
 # libiberty
-# libmudflap
 # libgfortran needs separate recipe due to libquadmath dependency
 
 SLIB = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
@@ -167,9 +166,6 @@ PACKAGES = "\
     libssp \
     libssp-dev \
     libssp-staticdev \
-    libmudflap \
-    libmudflap-dev \
-    libmudflap-staticdev \
     libquadmath \
     libquadmath-dev \
     libquadmath-staticdev \
@@ -242,17 +238,6 @@ SUMMARY_libquadmath-dev = "GNU quad-precision math library - development files"
 FILES_libquadmath-staticdev = "${libdir}/libquadmath.a"
 SUMMARY_libquadmath-staticdev = "GNU quad-precision math library - static development files"
 
-# NOTE: mudflap has been removed as of gcc 4.9 and has been superseded by the address sanitiser
-FILES_libmudflap = "${libdir}/libmudflap*.so.*"
-SUMMARY_libmudflap = "Pointer debugging library for gcc"
-FILES_libmudflap-dev = "\
-    ${libdir}/libmudflap*.so \
-    ${libdir}/libmudflap.la \
-"
-SUMMARY_libmudflap-dev = "Pointer debugging library for gcc - development files"
-FILES_libmudflap-staticdev = "${libdir}/libmudflap.a"
-SUMMARY_libmudflap-staticdev = "Pointer debugging library for gcc - static development files"
-
 FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
 SUMMARY_libgomp = "GNU OpenMP parallel programming library"
 FILES_libgomp-dev = "\
-- 
2.17.1

