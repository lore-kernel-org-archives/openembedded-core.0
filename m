Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 801116E796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 08:00:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0H8026S012662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 00:00:03 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 17 Jan 2014 00:00:00 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 15:59:57 +0800
Message-ID: <3fdbfa662b2953cd57c010980c70f244177faa02.1389945523.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389945523.git.Chong.Lu@windriver.com>
References: <cover.1389945523.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apr-util: enable ptest support
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
X-List-Received-Date: Fri, 17 Jan 2014 08:00:01 -0000
Content-Type: text/plain

Install apr-util test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/apr/apr-util/run-ptest |  6 ++++++
 meta/recipes-support/apr/apr-util_1.5.2.bb  | 19 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/apr/apr-util/run-ptest

diff --git a/meta/recipes-support/apr/apr-util/run-ptest b/meta/recipes-support/apr/apr-util/run-ptest
new file mode 100644
index 0000000..ae19a1d
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+cd test
+./testall |sed \
+  -e 's|\(.*\):  SUCCESS|PASS: \1|' \
+  -e 's|\(.*\):  FAILED|FAIL: \1|'
diff --git a/meta/recipes-support/apr/apr-util_1.5.2.bb b/meta/recipes-support/apr/apr-util_1.5.2.bb
index 653b147..65f26b3 100644
--- a/meta/recipes-support/apr/apr-util_1.5.2.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.2.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
-           file://configure_fixes.patch"
+           file://configure_fixes.patch \
+           file://run-ptest \
+"
 
 SRC_URI[md5sum] = "eb682cfb8642babba427a4fb391b15e8"
 SRC_URI[sha256sum] = "a1ec5025373815795d2fa5bfac40c0984675feffc88e049be9a162c408c2f613"
@@ -48,3 +50,18 @@ FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
 FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la"
 FILES_${PN}-dbg += "${libdir}/apr-util-1/.debug/*"
 FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_dbm_gdbm.a"
+
+inherit ptest
+
+do_compile_ptest() {
+	cd ${S}/test
+	oe_runmake
+}
+
+do_install_ptest() {
+	t=${D}${PTEST_PATH}/test
+	mkdir $t
+	for i in testall data; do \
+	  cp -r ${S}/test/$i $t; \
+	done
+}
-- 
1.8.1.2


