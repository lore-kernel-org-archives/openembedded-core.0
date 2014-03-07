Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 552FD6F5DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 09:27:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s279RPTm010605
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Mar 2014 01:27:26 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 7 Mar 2014 01:27:25 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 17:27:22 +0800
Message-ID: <a3adc826d9c2d87e9d55dc20dbc0979f45dc4d2a.1394183877.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394183877.git.Chong.Lu@windriver.com>
References: <cover.1394183877.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] diffutils: enable ptest support
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
X-List-Received-Date: Fri, 07 Mar 2014 09:27:27 -0000
Content-Type: text/plain

Install diffutils test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../diffutils/diffutils-3.3/run-ptest                |  3 +++
 meta/recipes-extended/diffutils/diffutils_3.3.bb     | 20 +++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/run-ptest

diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest b/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest
new file mode 100644
index 0000000..695c5e8
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils-3.3/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -C tests check-TESTS
diff --git a/meta/recipes-extended/diffutils/diffutils_3.3.bb b/meta/recipes-extended/diffutils/diffutils_3.3.bb
index 7a95c1a..a467f20 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.3.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.3.bb
@@ -3,7 +3,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 require diffutils.inc
 
-SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz"
+SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
+           file://run-ptest \
+"
 
 do_configure_prepend () {
 	# Need to remove gettext macros with weird mix of versions
@@ -14,3 +16,19 @@ do_configure_prepend () {
 
 SRC_URI[md5sum] = "99180208ec2a82ce71f55b0d7389f1b3"
 SRC_URI[sha256sum] = "a25e89a8ab65fded1731e4186be1bb25cda967834b6df973599cdcd5abdfc19c"
+
+inherit ptest
+
+do_install_ptest() {
+	t=${D}${PTEST_PATH}
+	install -D ${S}/build-aux/test-driver $t/build-aux/test-driver
+	cp -r ${S}/tests $t/
+	install ${B}/tests/Makefile $t/tests/
+	sed -e 's|^Makefile:|_Makefile:|' \
+	    -e 's|bash|sh|' \
+	    -e 's|^top_srcdir = \(.*\)|top_srcdir = ..\/|' \
+	    -e 's|^srcdir = \(.*\)|srcdir = .|' \
+	    -e 's|"`$(built_programs)`"|diff|' \
+	    -e 's|gawk|awk|g' \
+	    -i $t/tests/Makefile
+}
-- 
1.8.1.2


