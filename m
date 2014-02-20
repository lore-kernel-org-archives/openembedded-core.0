Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE696EB1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 10:55:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1KAtEx9009040
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 02:55:14 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 20 Feb 2014 02:55:13 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2014 18:55:10 +0800
Message-ID: <8cfb36c4026790ca4a9848945a1b21429b6c434a.1392893636.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392893636.git.Chong.Lu@windriver.com>
References: <cover.1392893636.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] insserv: enable ptest support
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
X-List-Received-Date: Thu, 20 Feb 2014 10:55:13 -0000
Content-Type: text/plain

Install insserv test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/insserv/files/run-ptest   | 17 +++++++++++++++++
 meta/recipes-devtools/insserv/insserv_1.14.0.bb | 14 +++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/insserv/files/run-ptest

diff --git a/meta/recipes-devtools/insserv/files/run-ptest b/meta/recipes-devtools/insserv/files/run-ptest
new file mode 100644
index 0000000..495d155
--- /dev/null
+++ b/meta/recipes-devtools/insserv/files/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+basedir=$(dirname $0)
+. $basedir/common
+
+output() {
+  if [ $? -eq 0 ]; \
+    then echo "PASS: $i"; \
+    else echo "FAIL: $i"; \
+  fi;
+}
+
+for i in test_simple_sequence test_undetected_loop; \
+  do $i &>/dev/null ; output; \
+done
+
+rm -rf ${tmpdir}
diff --git a/meta/recipes-devtools/insserv/insserv_1.14.0.bb b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
index 1d1f59d..4a33e16 100644
--- a/meta/recipes-devtools/insserv/insserv_1.14.0.bb
+++ b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
@@ -11,7 +11,9 @@ PR = "r1"
 SRC_URI = "ftp://ftp.suse.com/pub/projects/init/${BPN}-${PV}.tar.bz2 \
            file://makefile.patch \
            file://disable_runtests.patch \
-           file://insserv.conf"
+           file://insserv.conf \
+           file://run-ptest \
+"
 
 SRC_URI[md5sum] = "4a97d900855148842b1aa8f33b988b47"
 SRC_URI[sha256sum] = "89a0a093b1cf3d802ad40568e64b496b493f51ff9825905c8bd12738b374ca47"
@@ -27,3 +29,13 @@ do_install_class-native () {
 }
 
 BBCLASSEXTEND = "native"
+
+inherit ptest
+
+do_install_ptest() {
+	for i in common suite; do cp ${S}/tests/$i ${D}${PTEST_PATH}; done
+	sed -e 's|${\PWD}/insserv|insserv|;/trap/d' -i ${D}${PTEST_PATH}/suite
+	sed -e '/test_simple_sequence$/d;/test_undetected_loop$/d' -i ${D}${PTEST_PATH}/common
+}
+
+RDEPENDS_${PN}-ptest += "bash"
-- 
1.8.1.2


