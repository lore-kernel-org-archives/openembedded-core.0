Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6374D71C3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 12:26:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBECQU32025771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 04:26:30 -0800
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 14 Dec 2017 04:26:29 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Dec 2017 14:26:28 +0200
Message-ID: <20171214122628.95611-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] openssl-nativesdk: Fix "can't open config file" warning
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
X-List-Received-Date: Thu, 14 Dec 2017 12:26:29 -0000
Content-Type: text/plain

When SDK is not installed in the default location, openssl will not be 
able to find the the openssl.cnf config file:

"WARNING: can't open config file: XXXX/usr/lib/ssl/openssl.cnf"

To fix this, we need to provide the environment variable $OPENSSL_CONF 
pointing to the correct config file location.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../openssl/openssl/environment.d-openssl.sh                  |  1 +
 meta/recipes-connectivity/openssl/openssl10.inc               |  7 +++++++
 meta/recipes-connectivity/openssl/openssl_1.0.2m.bb           |  5 +++++
 meta/recipes-connectivity/openssl/openssl_1.1.0g.bb           | 11 +++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh

diff --git a/meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
new file mode 100644
index 0000000..b9cc24a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
@@ -0,0 +1 @@
+export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 4697755..71e80f1 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -271,5 +271,12 @@ do_install_append_class-native() {
 	    OPENSSL_ENGINES=${libdir}/ssl/engines
 }
 
+do_install_append_class-nativesdk() {
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+    install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+}
+
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
+
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
index 9270f52..fcb627a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
@@ -44,6 +44,11 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch  \
             file://0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch \
             "
+
+SRC_URI_append_class-nativesdk = " \
+    file://environment.d-openssl.sh \
+   "
+
 SRC_URI[md5sum] = "10e9e37f492094b9ef296f68f24a7666"
 SRC_URI[sha256sum] = "8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f"
 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
index 53f397a..0d4c90f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
@@ -21,6 +21,10 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch \
           "
 
+SRC_URI_append_class-nativesdk = " \
+    file://environment.d-openssl.sh \
+   "
+
 S = "${WORKDIR}/openssl-${PV}"
 
 inherit lib_package multilib_header ptest
@@ -143,6 +147,13 @@ do_install_append_class-native () {
         sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
 }
 
+do_install_append_class-nativesdk() {
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+    install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+}
+
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
+
 do_install_ptest() {
         cp -r * ${D}${PTEST_PATH}
 
-- 
2.10.2


