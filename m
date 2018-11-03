Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id CC6C479EAA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:44:52 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 283D2FF808;
	Sat,  3 Nov 2018 16:44:51 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:07 -0700
Message-Id: <20181103164427.16125-6-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 05/25] openssl_1.1: minor recipe formatting tweaks etc
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
X-List-Received-Date: Sat, 03 Nov 2018 16:44:53 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Drop redundant setting of S to its default value and re-order
variables to align more closely to the OE style-guide.

(From OE-Core rev: 4871481e66449dd2b054119b37d0baedb166b72c)

(From OE-Core rev: 5da668175ee7c56067c1272e7a701d5c38e94524)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl_1.1.0h.bb                 | 50 +++++++++----------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index ea55189f70..d277170fdd 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -8,11 +8,6 @@ SECTION = "libs/network"
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
-SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
-
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
@@ -21,12 +16,24 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
-          "
+           "
 
-S = "${WORKDIR}/openssl-${PV}"
+SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
+SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
 
 inherit lib_package multilib_header ptest
 
+#| engines/afalg/e_afalg.c: In function 'eventfd':
+#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
+#|      return syscall(__NR_eventfd, n);
+#|                     ^~~~~~~~~~~~
+EXTRA_OECONF_append_aarch64 = " no-afalgeng"
+
+#| ./libcrypto.so: undefined reference to `getcontext'
+#| ./libcrypto.so: undefined reference to `setcontext'
+#| ./libcrypto.so: undefined reference to `makecontext'
+EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
+
 do_configure () {
 	os=${HOST_OS}
 	case $os in
@@ -116,17 +123,6 @@ do_configure () {
 	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
 }
 
-#| engines/afalg/e_afalg.c: In function 'eventfd':
-#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
-#|      return syscall(__NR_eventfd, n);
-#|                     ^~~~~~~~~~~~
-EXTRA_OECONF_append_aarch64 = " no-afalgeng"
-
-#| ./libcrypto.so: undefined reference to `getcontext'
-#| ./libcrypto.so: undefined reference to `setcontext'
-#| ./libcrypto.so: undefined reference to `makecontext'
-EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
-
 do_install () {
         oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
         oe_multilib_header openssl/opensslconf.h
@@ -140,13 +136,11 @@ do_install_append_class-native () {
         sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
 }
 
-do_install_append_class-nativesdk() {
-    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-    install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+do_install_append_class-nativesdk () {
+        mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+        install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
-FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
-
 do_install_ptest() {
         cp -r * ${D}${PTEST_PATH}
 
@@ -157,10 +151,12 @@ do_install_ptest() {
         sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
-RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
-
-FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
-
 PACKAGES =+ "${PN}-engines"
+
+FILES_${PN} =+ "${libdir}/ssl-1.1/*"
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
 
+RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.1


