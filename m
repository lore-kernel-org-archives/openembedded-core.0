Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id B388079EAA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:44:48 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 829D5FF802;
	Sat,  3 Nov 2018 16:44:47 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:05 -0700
Message-Id: <20181103164427.16125-4-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 03/25] openssl-nativesdk: Fix "can't open config file" warning
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
X-List-Received-Date: Sat, 03 Nov 2018 16:44:49 -0000

From: Ovidiu Panait <ovidiu.panait@windriver.com>

When SDK is not installed in the default location, openssl will not be
able to find the the openssl.cnf config file:

"WARNING: can't open config file: XXXX/usr/lib/ssl/openssl.cnf"

To fix this, we need to provide the environment variable $OPENSSL_CONF
pointing to the correct config file location.

(From OE-Core rev: b3f148333515efdb746b78c57d62cfbf3321b21e)

(From OE-Core rev: fcea508efedeb36ca31fe8ad0cbc6d194fcfd1f7)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl/environment.d-openssl.sh          |  1 +
 meta/recipes-connectivity/openssl/openssl10.inc       |  7 +++++++
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb   |  5 +++++
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb   | 11 +++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh

diff --git a/meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
new file mode 100644
index 0000000000..b9cc24a7ac
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
@@ -0,0 +1 @@
+export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 7fc807e093..3755ddc5ea 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -279,5 +279,12 @@ do_install_append_class-native() {
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
 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 413ebf37f4..7cae553f35 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -47,6 +47,11 @@ SRC_URI_append_class-target = "\
            file://reproducible-cflags.patch \
            file://reproducible-mkbuildinf.patch \
            "
+
+SRC_URI_append_class-nativesdk = " \
+           file://environment.d-openssl.sh \
+           "
+
 SRC_URI[md5sum] = "44279b8557c3247cbe324e2322ecd114"
 SRC_URI[sha256sum] = "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d"
 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 6937cc4649..e843304980 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -19,6 +19,10 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
            "
 
+SRC_URI_append_class-nativesdk = " \
+           file://environment.d-openssl.sh \
+          "
+
 S = "${WORKDIR}/openssl-${PV}"
 
 inherit lib_package multilib_header ptest
@@ -136,6 +140,13 @@ do_install_append_class-native () {
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
2.18.1


