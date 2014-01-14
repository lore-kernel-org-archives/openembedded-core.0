Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1AC6DEE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 09:44:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0E9iH3M014085
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 01:44:18 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 01:44:18 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 17:42:39 +0800
Message-ID: <3dcbfcb982a0b671d4c128b43cdd889b27791aff.1389691774.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389691774.git.Chong.Lu@windriver.com>
References: <cover.1389691774.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apr: enable ptest support
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
X-List-Received-Date: Tue, 14 Jan 2014 09:44:18 -0000
Content-Type: text/plain

Install apr test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/apr/apr/run-ptest |  6 ++++++
 meta/recipes-support/apr/apr_1.4.8.bb  | 24 ++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/apr/apr/run-ptest

diff --git a/meta/recipes-support/apr/apr/run-ptest b/meta/recipes-support/apr/apr/run-ptest
new file mode 100644
index 0000000..ae19a1d
--- /dev/null
+++ b/meta/recipes-support/apr/apr/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+cd test
+./testall |sed \
+  -e 's|\(.*\):  SUCCESS|PASS: \1|' \
+  -e 's|\(.*\):  FAILED|FAIL: \1|'
diff --git a/meta/recipes-support/apr/apr_1.4.8.bb b/meta/recipes-support/apr/apr_1.4.8.bb
index d23929f..4af2a6b 100644
--- a/meta/recipes-support/apr/apr_1.4.8.bb
+++ b/meta/recipes-support/apr/apr_1.4.8.bb
@@ -12,12 +12,14 @@ BBCLASSEXTEND = "native"
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
            file://cleanup.patch \
-           file://configfix.patch"
+           file://configfix.patch \
+           file://run-ptest \
+"
 
 SRC_URI[md5sum] = "ce2ab01a0c3cdb71cf0a6326b8654f41"
 SRC_URI[sha256sum] = "61b8d2f8d321c6365ee3d71d0bb41f3a89c44da6124cc5b407a3b8319d660421"
 
-inherit autotools lib_package binconfig multilib_header
+inherit autotools lib_package binconfig multilib_header ptest
 
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
@@ -60,3 +62,21 @@ apr_sysroot_preprocess () {
 	cp ${S}/build/make_exports.awk $d/
 	cp ${S}/build/make_var_export.awk $d/
 }
+
+do_compile_ptest() {
+	cd ${S}/test
+	oe_runmake
+}
+
+do_install_ptest() {
+	t=${D}${PTEST_PATH}/test
+	mkdir -p $t/.libs
+	cp -r ${S}/test/data $t/
+	cp -r ${S}/test/.libs/*.so $t/.libs/
+	cp ${S}/test/proc_child $t/
+	cp ${S}/test/readchild $t/
+	cp ${S}/test/sockchild $t/
+	cp ${S}/test/sockperf $t/
+	cp ${S}/test/testall $t/
+	cp ${S}/test/tryread $t/
+}
-- 
1.8.1.2


