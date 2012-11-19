Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TabD2-0003c8-NI for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 00:57:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJNgusx000325
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:42:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32674-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:42:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJNgkte000319
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 23:42:48 GMT
Message-ID: <1353368565.3709.210.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Nov 2012 23:42:45 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] ldconfig/cdrtools/icecc-create-env/linuxdoc-tools/python: Set FILESPATH to find -native files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 23:57:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In a small number of cases we need to have ${PN} in FILESPATH rather
than ${BPN}. Rather than hurt readability for all other recipes,
set FILESPATH in these recipes so we can prune the default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
index 2a93913..63ef95b 100644
--- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -14,6 +14,8 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
 
 PR = "r2"
 
+FILESPATH = "${FILE_DIRNAME}/${PN}-${PV}/"
+
 inherit native
 
 S = "${WORKDIR}/${PN}-${PV}"
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
index 9068771..fc47977 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
@@ -20,6 +20,8 @@ inherit native
 
 STAGE_TEMP = "${WORKDIR}/image-temp"
 
+FILESPATH = "${FILE_DIRNAME}/cdrtools-native/"
+
 do_install() {
 	install -d ${STAGE_TEMP}
 	make install INS_BASE=${STAGE_TEMP}
diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
index 7db3978..b04474e 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
@@ -11,6 +11,8 @@ PR = "r2"
 DEPENDS = ""
 INHIBIT_DEFAULT_DEPS = "1"
 
+FILESPATH = "${FILE_DIRNAME}/${PN}/"
+
 inherit native
 
 PATCHTOOL = "patch"
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
index fafa421..5c9dd6f 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.66.bb
@@ -17,6 +17,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.tar.gz \
 SRC_URI[md5sum] = "f214e79b0dd084689cd04f18722bd563"
 SRC_URI[sha256sum] = "128cabb52ef8fb2f370ee488ea92bf4d8e49859200c7c8cae807abfe860a62ec"
 
+FILESPATH = "${FILE_DIRNAME}/linuxdoc-tools-native/"
+
 inherit autotools native
 
 do_configure () {
diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index b0b3503..162eced 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -19,6 +19,8 @@ SRC_URI += "file://04-default-is-optimized.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
+FILESPATH = "${FILE_DIRNAME}/python-native/:${FILE_DIRNAME}/python/"
+
 inherit native
 
 RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-core-native"




