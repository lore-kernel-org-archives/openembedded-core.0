Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56BA26C458
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 00:11:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAK0B0xa007829
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Nov 2018 16:11:00 -0800 (PST)
Received: from localhost (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 19 Nov 2018 16:10:59 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <akuster808@gmail.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Nov 2018 08:10:57 +0800
Message-ID: <1542672657-16737-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.192]
Subject: [rocko][PATCH] lsbtest: minor fixes for LSB 5.0
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
X-List-Received-Date: Tue, 20 Nov 2018 00:11:04 -0000
Content-Type: text/plain

* Remove qt4 test component in test list since qt4 isn't installed to
  lsb image by default.
* Update package directory, server IP address and version.
* Move LSB_Test.sh from /usr/bin to /opt/lsb-test.
* Add lsb as runtime dependency.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

[Yocto #12240]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh |  4 ++--
 meta/recipes-extended/lsb/lsbtest/session     | 11 +----------
 meta/recipes-extended/lsb/lsbtest_1.0.bb      |  5 ++---
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index 0eb2793..073e247 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -60,7 +60,7 @@ fi
 
 PACKAGES_DIR="/var/opt/lsb/test/manager/packages/ftp.linuxfoundation.org/pub/lsb"
 
-BASE_PACKAGES_DIR="${PACKAGES_DIR}/base/${LSB_RELEASE}/binary"
+BASE_PACKAGES_DIR="${PACKAGES_DIR}/base/released-all/binary"
 RUNTIME_BASE_PACKAGES_DIR="${PACKAGES_DIR}/test_suites/released-all/binary/runtime"
 RUNTIME_PACKAGES_DIR="${PACKAGES_DIR}/test_suites/${LSB_RELEASE}/binary/runtime"
 APP_PACKAGES_DIR="${PACKAGES_DIR}/app-battery/${LSB_RELEASE}/${LSB_ARCH}"
@@ -98,7 +98,7 @@ then
 fi
 
 # Official download server list. You can replace them with your own server.
-SERVER_IPADDR="140.211.169.23"
+SERVER_IPADDR="140.211.169.28"
 SERVER_NAME="ftp.linuxfoundation.org"
 
 if ! `grep -F -q "${SERVER_NAME}" /etc/hosts`; then
diff --git a/meta/recipes-extended/lsb/lsbtest/session b/meta/recipes-extended/lsb/lsbtest/session
index 3abcca7..4d47e40 100644
--- a/meta/recipes-extended/lsb/lsbtest/session
+++ b/meta/recipes-extended/lsb/lsbtest/session
@@ -2,7 +2,7 @@
 VERBOSE_LEVEL:   1
 ARCHITECTURE:    targetarch
 USE_INTERNET:    1
-STD_VERSION:     LSB 4.1
+STD_VERSION:     LSB 5.0
 STD_PROFILE:     no
 [cmdchk]
 RUN: 1
@@ -126,15 +126,6 @@ VERSION: local|*
 AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/python
 AUTOREPLY_RESULTS_DIR: /opt/lsb/test/python/results
 
-[qt4-azov]
-RUN: 1
-VERSION: local|*
-
-[qt4-azov|local|*]
-AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/qt4-azov
-AUTOREPLY_X11_FONT_PATH: [default]
-AUTOREPLY_RESULTS_DIR: /opt/lsb/test/qt4-azov/results
-
 [xml2-azov]
 RUN: 1
 VERSION: local|*
diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index 36f52fd..a90c023 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -10,14 +10,13 @@ SRC_URI = "file://LSB_Test.sh \
 		   file://packages_list \
 		   file://session \
 		   "
-RDEPENDS_${PN} = "rpm"
+RDEPENDS_${PN} = "lsb rpm"
 
 S = "${WORKDIR}"
 
 do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/LSB_Test.sh ${D}${bindir}
 	install -d  ${D}/opt/lsb-test
+	install -m 0755 ${S}/LSB_Test.sh ${D}/opt/lsb-test/LSB_Test.sh
 	install -m 0644 ${S}/packages_list ${D}/opt/lsb-test/packages_list
 	install -m 0644 ${S}/session ${D}/opt/lsb-test/session
 	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ];then
-- 
2.7.4


