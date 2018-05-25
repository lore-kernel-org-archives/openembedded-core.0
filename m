Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63FA274D6F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:43:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P2grAX026276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:43:08 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:42:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:28 +0800
Message-ID: <85be764d21a47c1b357af2038e2ae92d03c2295b.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 23/24] openssl-nativesdk: Fix "can't open config file" warning
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
X-List-Received-Date: Fri, 25 May 2018 02:43:17 -0000
Content-Type: text/plain

From: Ovidiu Panait <ovidiu.panait@windriver.com>

When SDK is not installed in the default location, openssl will not be
able to find the the openssl.cnf config file:

"WARNING: can't open config file: XXXX/usr/lib/ssl/openssl.cnf"

To fix this, we need to provide the environment variable $OPENSSL_CONF
pointing to the correct config file location.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openssl/openssl/environment.d-openssl.sh                  |  1 +
 meta/recipes-connectivity/openssl/openssl10.inc               |  7 +++++++
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb           |  5 +++++
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb           | 11 +++++++++++
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
index 645d64e..9f23758 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -281,5 +281,12 @@ do_install_append_class-native() {
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
index 413ebf3..7cae553 100644
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
index 94b75eb..29f83a3 100644
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
@@ -142,6 +146,13 @@ do_install_append_class-native () {
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
2.7.4


