Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 948A26CDCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 08:17:01 +0000 (UTC)
Received: from localhost.localdomain (91-157-208-114.elisa-laajakaista.fi
	[91.157.208.114])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id CC18626551;
	Mon, 21 Oct 2013 10:17:00 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 11:16:53 +0300
Message-Id: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Cc: patches@linaro.org
Subject: [PATCH 1/3] ltp: cleanup recipe
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
X-List-Received-Date: Mon, 21 Oct 2013 08:17:02 -0000

Cleanups for ltp:

1. Instead of using giturl like in Anders's patch use the sourceforge mirror URL.
2. remove to the manual unpack rule and just set S variable to source directory.
3. Follow the OE style guide for variable order.
---
 meta/recipes-extended/ltp/ltp_20130904.bb | 50 +++++++++++++------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
index 5e10448..43fe780 100644
--- a/meta/recipes-extended/ltp/ltp_20130904.bb
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -21,44 +21,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr libaio libcap acl openssl"
 
-SRC_URI = "git://github.com/linux-test-project/ltp.git"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/ltp/LTP%20Source/ltp-${PV}/ltp-full-${PV}.tar.bz2 \
+           "
 
-SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "0cf2ccb7199f8318d413c62a085629f0"
+SRC_URI[sha256sum] = "662c3661a4d1bfbf3187d0835f35e613b43eedc35a840e3283e378a19606ee0b"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
 inherit autotools
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
-
-FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/test/.debug"
-FILES_${PN}-dbg += "/opt/ltp/scenario_groups/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testscripts/.debug"
-FILES_${PN}-dbg += "/opt/ltp/testscripts/open_posix_testsuite/.debug"
-
-FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
-
-FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
+S = "${WORKDIR}/ltp-full-${PV}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-do_unpack_append() {
-    bb.build.exec_func('do_extract_tarball', d)
-}
-
-do_extract_tarball() {
-	if test -f ${WORKDIR}/ltp-full-${PV} ; then
-	    tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORKDIR}
-	    rm -rf ${WORKDIR}/ltp-${PV}
-	    mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
-	fi
-}
-
 do_install(){
 	install -d ${D}/opt/ltp/
 	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
@@ -66,10 +43,25 @@ do_install(){
 	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
 	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 
-	# We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
+	# We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in oe-core
 	# We will add expect for enhancement in future
 	find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
 }
 
+FILES_${PN}-dbg += "/opt/ltp/runtest/.debug \
+                    /opt/ltp/testcases/bin/.debug \
+                    /opt/ltp/testcases/bin/*/bin/.debug \
+                    /opt/ltp/testcases/bin/*/test/.debug \
+                    /opt/ltp/scenario_groups/.debug \
+                    /opt/ltp/testscripts/.debug \
+                    /opt/ltp/testscripts/open_posix_testsuite/.debug \
+                    "
+
+FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
+
+FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
+
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
+
 # Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
 INHIBIT_PACKAGE_STRIP = "1"
-- 
1.8.3.1


