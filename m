Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 880A86002A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 07:50:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0Q7oI1G017225
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 23:50:18 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sat, 25 Jan 2014 23:50:18 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jan 2014 15:50:14 +0800
Message-ID: <31bde1f3800810ad5898b52ab8b59e6b8502a180.1390722297.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1390722297.git.Chong.Lu@windriver.com>
References: <cover.1390722297.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3 1/1] acl: enable ptest support
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
X-List-Received-Date: Sun, 26 Jan 2014 07:50:17 -0000
Content-Type: text/plain

Install acl test suite and run it as ptest.
nfs test cases need depend on nfs service. So exclude them order to
make ptest all pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/attr/acl.inc       | 14 +++++++++++++-
 meta/recipes-support/attr/acl/run-ptest |  7 +++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/acl/run-ptest

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index a461232..04967a6 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
                     file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
 
 DEPENDS = "attr"
-SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
+           file://run-ptest \
+"
 
 require ea-acl.inc
 
@@ -24,3 +26,13 @@ do_install_append() {
 	sed -i ${D}${libdir}/libacl.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
+
+inherit ptest
+
+do_install_ptest() {
+	tar -cf - test/ --exclude nfs | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	mkdir ${D}${PTEST_PATH}/include
+	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
+}
+
+RDEPENDS_${PN}-ptest = "bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
new file mode 100644
index 0000000..3b31cc9
--- /dev/null
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+gpasswd -a daemon bin
+make -C test -k tests root-tests |sed \
+ -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
+ -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
+gpasswd -d daemon bin
-- 
1.8.1.2


