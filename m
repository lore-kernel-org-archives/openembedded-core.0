Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C28CC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 07:13:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.42371.1745824310701688314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 00:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62139e711a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S4FLFh008429
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:11:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1am29-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:11:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 28 Apr 2025 00:11:49 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 28 Apr 2025 00:11:48 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH 1/3] buildtools-tarball: move setting of envvars to respective envfile
Date: Mon, 28 Apr 2025 15:11:44 +0800
Message-ID: <20250428071146.3946035-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428071146.3946035-1-changqing.li@windriver.com>
References: <20250428071146.3946035-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f2a35 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=rBvAdeR-8HwfwV2o31cA:9 a=8orcLhFfQy56-zct:21
 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ETLqwrHfq2x_JYI-Kpmg81VEtmyprqrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA1OSBTYWx0ZWRfX01mNc9AvworG IwFU5o5mxxTVB3I+qYVMg5Wq82yI5rRHBjfDiGF2Z2HAdTnJiSg6JVRi0Iq97eNJMJNC76TUrUt 0upIEwveR4qZmM2LB8Q3FNTW2nK60xKdobwJiPsyx7X8lyuw0uJZkHUXgPrij/EOKx4my0gHTbX
 hExyuSRKqrIfjSRMD0S5xA8pAt1hzmtkAsC9su1Vmru8u3DWYk5ME5c+yneWibYUnbUv+kU0BVU ByCQMeWjynHUuNuF7i9+8mOg9ASi6jk/Gn7Y6dkTiDBK3C+Cnrbyr8nW4fwcrow8lTi/ckDcU4I zyTMYTA/DrJz7VonkGzj5PChguAZIQuW5qiifuN1ODdsOtXg8YC8/VZK75u1fndXauSRI5Wu9QL
 PKqCXCDArQvIG7dFsyOR7iGcuV1B1HMaR4/eUeDBIGef0MFDUVEA7c5eg1Q+FKvBnhCCQOWD
X-Proofpoint-GUID: ETLqwrHfq2x_JYI-Kpmg81VEtmyprqrJ
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215581

From: Changqing Li <changqing.li@windriver.com>

* make git,curl,python3-requests align with openssl, move the setting of
  envvars into respective envfile
* for environment.d-openssl.sh, also check if ca-certificates.crt exist
  before export envvars

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../openssl/files/environment.d-openssl.sh            |  9 ++++++---
 meta/recipes-core/meta/buildtools-tarball.bb          |  6 ------
 meta/recipes-devtools/git/git/environment.d-git.sh    |  3 +++
 meta/recipes-devtools/git/git_2.49.0.bb               |  9 +++++++++
 .../environment.d-python3-requests.sh                 |  3 +++
 .../python/python3-requests_2.32.3.bb                 | 11 +++++++++++
 meta/recipes-support/curl/curl/environment.d-curl.sh  |  3 +++
 meta/recipes-support/curl/curl_8.12.1.bb              |  9 +++++++++
 8 files changed, 44 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
 create mode 100644 meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
 create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.sh

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index d4b9047565..79b9bc77ec 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,6 +1,9 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
-export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
-export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
+    export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
+fi
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
-export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index e2ce5b3ecf..414c266663 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -73,12 +73,6 @@ create_sdk_files:append () {
 	touch $script
 	echo 'export PATH="${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt" ]; then
-		echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-		echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-		echo 'export REQUESTS_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-		echo 'export CURL_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	fi
 	echo 'HOST_PKG_PATH=$(command -p pkg-config --variable=pc_path pkg-config 2>/dev/null)' >>$script
 	echo 'export PKG_CONFIG_LIBDIR=${SDKPATHNATIVE}/${libdir}/pkgconfig:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgconfig:/usr/share/pkgconfig}' >>$script
 	echo 'unset HOST_PKG_PATH'
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
new file mode 100644
index 0000000000..18104f0528
--- /dev/null
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -0,0 +1,3 @@
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+fi
diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.49.0.bb
index 2ca8711f75..3538170d08 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.49.0.bb
@@ -12,6 +12,10 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
            "
 
+SRC_URI:append:class-nativesdk = " \
+           file://environment.d-git.sh \
+           "
+
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "\
@@ -112,6 +116,9 @@ do_install:append:class-nativesdk() {
 		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
 		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
 	perl_native_fixup
+
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${UNPACKDIR}/environment.d-git.sh ${D}${SDKPATHNATIVE}/environment-setup.d/git.sh
 }
 
 FILES:${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
@@ -152,6 +159,8 @@ FILES:${PN}-tk = " \
 
 PACKAGES =+ "gitweb"
 FILES:gitweb = "${datadir}/gitweb/"
+
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/git.sh"
 RDEPENDS:gitweb = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
new file mode 100644
index 0000000000..f2eee203ca
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -0,0 +1,3 @@
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+fi
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
index 4f0638b50c..bc9b2289f6 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
@@ -3,10 +3,19 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
+SRC_URI:append:class-nativesdk = " \
+           file://environment.d-python3-requests.sh \
+"
+
 SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
 
 inherit pypi python_setuptools_build_meta
 
+do_install:append:class-nativesdk() {
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${UNPACKDIR}/environment.d-python3-requests.sh ${D}${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
+}
+
 RDEPENDS:${PN} += " \
     python3-certifi \
     python3-email \
@@ -19,6 +28,8 @@ RDEPENDS:${PN} += " \
     python3-compression \
 "
 
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh"
+
 CVE_PRODUCT = "requests"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
new file mode 100644
index 0000000000..0d53aabb8e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -0,0 +1,3 @@
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+fi
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.12.1.bb
index dd1c89979a..4192693da8 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -15,6 +15,11 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
+
+SRC_URI:append:class-nativesdk = " \
+           file://environment.d-curl.sh \
+"
+
 SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202"
 
 # Curl has used many names over the years...
@@ -97,6 +102,9 @@ do_install:append:class-target() {
 
 do_install:append:class-nativesdk() {
 	fix_absolute_paths
+
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${UNPACKDIR}/environment.d-curl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/curl.sh
 }
 
 do_compile_ptest() {
@@ -150,6 +158,7 @@ FILES:lib${BPN} = "${libdir}/lib*.so.*"
 RRECOMMENDS:lib${BPN} += "ca-certificates"
 
 FILES:${PN} += "${datadir}/zsh"
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/curl.sh"
 
 inherit multilib_script
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/curl-config"
-- 
2.34.1


