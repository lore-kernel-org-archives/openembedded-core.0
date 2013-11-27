Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 8E7016B5D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 08:02:24 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 27 Nov 2013 09:02:22 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 4FF4328508B;
	Wed, 27 Nov 2013 09:02:22 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 09:02:19 +0100
Message-ID: <1385539339-14443-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] zlib: Add ptest
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
X-List-Received-Date: Wed, 27 Nov 2013 08:02:25 -0000
Content-Type: text/plain

Install zlib tests and run them as ptest

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../zlib/zlib-1.2.8/Makefile-runtests.patch        |   38 ++++++++++++++++++++
 meta/recipes-core/zlib/zlib-1.2.8/run-ptest        |    2 ++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |   18 ++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/Makefile-runtests.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/run-ptest

diff --git a/meta/recipes-core/zlib/zlib-1.2.8/Makefile-runtests.patch b/meta/recipes-core/zlib/zlib-1.2.8/Makefile-runtests.patch
new file mode 100644
index 0000000..61eea82
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.8/Makefile-runtests.patch
@@ -0,0 +1,38 @@
+Add 'ptest' target to Makefile, to run tests without checking dependencies.
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Upstream-Status: Pending
+---
+diff -uNr a/Makefile.in b/Makefile.in
+--- a/Makefile.in	2013-06-10 13:48:14.321959162 +0200
++++ b/Makefile.in	2013-06-10 13:49:36.686476448 +0200
+@@ -83,6 +83,9 @@
+ test: all teststatic testshared
+ 
+ teststatic: static
++	@make runteststatic
++
++runteststatic:
+ 	@TMPST=tmpst_$$; \
+ 	if echo hello world | ./minigzip | ./minigzip -d && ./example $$TMPST ; then \
+ 	  echo '		*** zlib test OK ***'; \
+@@ -92,6 +95,9 @@
+ 	rm -f $$TMPST
+ 
+ testshared: shared
++	@make runtestshared
++
++runtestshared:
+ 	@LD_LIBRARY_PATH=`pwd`:$(LD_LIBRARY_PATH) ; export LD_LIBRARY_PATH; \
+ 	LD_LIBRARYN32_PATH=`pwd`:$(LD_LIBRARYN32_PATH) ; export LD_LIBRARYN32_PATH; \
+ 	DYLD_LIBRARY_PATH=`pwd`:$(DYLD_LIBRARY_PATH) ; export DYLD_LIBRARY_PATH; \
+@@ -105,6 +111,9 @@
+ 	rm -f $$TMPSH
+ 
+ test64: all64
++	@make runtestall64
++
++runtestall64:
+ 	@TMP64=tmp64_$$; \
+ 	if echo hello world | ./minigzip64 | ./minigzip64 -d && ./example64 $$TMP64; then \
+ 	  echo '		*** zlib 64-bit test OK ***'; \
diff --git a/meta/recipes-core/zlib/zlib-1.2.8/run-ptest b/meta/recipes-core/zlib/zlib-1.2.8/run-ptest
new file mode 100644
index 0000000..884d9dc
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.8/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k runteststatic runtestshared | sed -r -e 's/^(\s+\*+ (.+?) test OK \*+)/\1\nPASS: \2/' -e 's/^(\s+\*+ (.+?) test FAILED \*+)/\1\nFAIL: \2/'
diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index 5cdf685..bdfa045 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -9,11 +9,17 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=fde612df1e5933c428b
 
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
+           file://Makefile-runtests.patch \
+           file://run-ptest \
            "
 
 SRC_URI[md5sum] = "28f1205d8dd2001f26fec1e8c2cebe37"
 SRC_URI[sha256sum] = "831df043236df8e9a7667b9e3bb37e1fcb1220a0f163b6de2626774b9590d057"
 
+RDEPENDS_${PN}-ptest += "make"
+
+inherit ptest
+
 do_configure (){
 	./configure --prefix=${prefix} --shared --libdir=${libdir}
 }
@@ -22,10 +28,22 @@ do_compile (){
 	oe_runmake
 }
 
+do_compile_ptest() {
+	oe_runmake static shared
+}
+
 do_install() {
 	oe_runmake DESTDIR=${D} install
 }
 
+do_install_ptest() {
+	install ${B}/Makefile   ${D}${PTEST_PATH}
+	install ${B}/example    ${D}${PTEST_PATH}
+	install ${B}/minigzip   ${D}${PTEST_PATH}
+	install ${B}/examplesh  ${D}${PTEST_PATH}
+	install ${B}/minigzipsh ${D}${PTEST_PATH}
+}
+
 # We move zlib shared libraries for target builds to avoid
 # qa warnings.
 #
-- 
1.7.10.4


