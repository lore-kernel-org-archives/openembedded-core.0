Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id EF0BB79EAA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:14 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7260FFF802;
	Sat,  3 Nov 2018 16:45:13 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:16 -0700
Message-Id: <20181103164427.16125-15-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 14/25] openssl: minor indent fixes
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:15 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Fix inconsistent indent (and also make the openssl 1.1 recipe more
consistent and consistent with the openssl 1.0 recipe).

(From OE-Core rev: 69844643aa1b829c27f144db634c8223c18c783f)

(From OE-Core rev: 3e0290b51da404761ac6a7d2657fd10693bf21b9)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl_1.1.0h.bb                 | 63 ++++++++++---------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 472454b5a6..8e57a07e14 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -44,7 +44,7 @@ do_configure () {
 	linux-musl )
 		os=linux
 		;;
-		*)
+	*)
 		;;
 	esac
 	target="$os-${HOST_ARCH}"
@@ -80,21 +80,21 @@ do_configure () {
 		target=linux-x86_64
 		;;
 	linux-mips)
-                # specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
+		# specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
 		target="linux-mips32 ${TARGET_CC_ARCH}"
 		;;
 	linux-mipsel)
 		target="linux-mips32 ${TARGET_CC_ARCH}"
 		;;
-        linux-gnun32-mips*)
-               target=linux-mips64
-                ;;
-        linux-*-mips64 | linux-mips64)
-               target=linux64-mips64
-                ;;
-        linux-*-mips64el | linux-mips64el)
-               target=linux64-mips64
-                ;;
+	linux-gnun32-mips*)
+		target=linux-mips64
+		;;
+	linux-*-mips64 | linux-mips64)
+		target=linux64-mips64
+		;;
+	linux-*-mips64el | linux-mips64el)
+		target=linux64-mips64
+		;;
 	linux-microblaze*|linux-nios2*)
 		target=linux-generic32
 		;;
@@ -114,40 +114,41 @@ do_configure () {
 		target=darwin-i386-cc
 		;;
 	esac
-        useprefix=${prefix}
-        if [ "x$useprefix" = "x" ]; then
-                useprefix=/
-        fi
+
+	useprefix=${prefix}
+	if [ "x$useprefix" = "x" ]; then
+		useprefix=/
+	fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
+	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=$libdirleaf $target
 }
 
 do_install () {
-        oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
-        oe_multilib_header openssl/opensslconf.h
+	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
+	oe_multilib_header openssl/opensslconf.h
 }
 
 do_install_append_class-native () {
-        # Install a custom version of c_rehash that can handle sysroots properly.
-        # This version is used for example when installing ca-certificates during
-        # image creation.
-        install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
-        sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
+	# Install a custom version of c_rehash that can handle sysroots properly.
+	# This version is used for example when installing ca-certificates during
+	# image creation.
+	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
+	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
 }
 
 do_install_append_class-nativesdk () {
-        mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-        install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
 do_install_ptest() {
-        cp -r * ${D}${PTEST_PATH}
+	cp -r * ${D}${PTEST_PATH}
 
-        # Putting .so files in ptest package will mess up the dependencies of the main openssl package
-        # so we rename them to .so.ptest and patch the test accordingly
-        mv ${D}${PTEST_PATH}/libcrypto.so ${D}${PTEST_PATH}/libcrypto.so.ptest
-        mv ${D}${PTEST_PATH}/libssl.so ${D}${PTEST_PATH}/libssl.so.ptest
-        sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
+	# Putting .so files in ptest package will mess up the dependencies of the main openssl package
+	# so we rename them to .so.ptest and patch the test accordingly
+	mv ${D}${PTEST_PATH}/libcrypto.so ${D}${PTEST_PATH}/libcrypto.so.ptest
+	mv ${D}${PTEST_PATH}/libssl.so ${D}${PTEST_PATH}/libssl.so.ptest
+	sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
 PACKAGES =+ "${PN}-engines"
-- 
2.18.1


