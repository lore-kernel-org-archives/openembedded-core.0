Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27A9560169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 05:43:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I5hsg0026129
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 22:43:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 17 Aug 2014 22:43:54 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 13:39:32 +0800
Message-ID: <d03fddc6174a0fefe406c4dae2daffcca218ce70.1408340319.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408340319.git.Chong.Lu@windriver.com>
References: <cover.1408340319.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] piglit: enable ptest support
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
X-List-Received-Date: Mon, 18 Aug 2014 05:43:55 -0000
Content-Type: text/plain

Install piglit test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-graphics/piglit/piglit/run-ptest |  5 +++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 10 +++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/run-ptest

diff --git a/meta/recipes-graphics/piglit/piglit/run-ptest b/meta/recipes-graphics/piglit/piglit/run-ptest
new file mode 100644
index 0000000..fba2e8d
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+env PIGLIT_BUILD_DIR=`pwd`/.. piglit-run.py `pwd`/tests/sanity.tests `pwd`/results/sanity.results 2>&1 | \
+    grep -E "pass ::|fail ::|skip ::|warn ::" | cut -d' ' -f11- | \
+    sed -e 's|pass ::|PASS:|' -e 's|warn ::|PASS:|' -e 's|fail ::|FAIL:|' -e 's|skip ::|SKIP:|'
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 5c013ef..de4a839 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -2,7 +2,8 @@ SUMMARY = "OpenGL driver testing framework"
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
-SRC_URI = "git://anongit.freedesktop.org/piglit"
+SRC_URI = "git://anongit.freedesktop.org/piglit \
+           file://run-ptest"
 
 # From 2012/12/30.
 SRCREV = "bbeff5d21b06d37338ad28e42d88f499bef13268"
@@ -13,7 +14,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "virtual/libx11 libxrender waffle virtual/libgl libglu python-mako-native python-numpy-native"
 
-inherit cmake pythonnative
+inherit cmake pythonnative ptest
 
 # As piglit doesn't install, enforce in-tree builds so that we can easily copy
 # contents out of $S and $B.
@@ -36,7 +37,6 @@ do_install() {
 	cp -Pr lib/ ${D}${libdir}/piglit/
 	cp -Pr framework/ ${D}${libdir}/piglit/
 	cp -Pr generated_tests/ ${D}${libdir}/piglit/
-	cp -Pr tests/ ${D}${libdir}/piglit/
 	cp -Pr templates/ ${D}${libdir}/piglit/
 
 	sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
@@ -46,3 +46,7 @@ do_install() {
 FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
 
 RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
+
+do_install_ptest() {
+	cp -Pr tests/ ${D}${PTEST_PATH}/
+}
-- 
1.9.1


