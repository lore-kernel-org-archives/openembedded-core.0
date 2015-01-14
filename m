Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2D3272863
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lgDW022114
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:42 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:23 -0800
Message-ID: <5a9780fa677767279c650ce59a3b16ba35cffe0e.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/27] oprofile: separate B and S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

And bump the PR to avoid:
configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc      |    5 ++---
 meta/recipes-kernel/oprofile/oprofile_1.0.0.bb |    1 +
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 509640c..c4fe36a 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -25,7 +25,7 @@ SRC_URI = "file://filemode-fix.patch \
            file://run-ptest \
            file://root-home-dir.patch"
 
-inherit autotools-brokensep pkgconfig ptest
+inherit autotools pkgconfig ptest
 
 EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
 do_configure () {
@@ -40,7 +40,6 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	subdirs="libdb/tests libutil++/tests libregex/tests libutil/tests libop/tests libdb/tests "
-	cd ${S}
 	for tooltest in ${subdirs}
 	do
 		find ${tooltest} -perm /u=x -type f| cpio -pvdu ${D}${PTEST_PATH}
@@ -54,6 +53,6 @@ do_install_ptest() {
 	cp libregex/tests/mangled-name ${D}${PTEST_PATH}/libregex/tests
 
 	# needed by litutil++ file_manip_tests
-	cp libutil++/tests/file_manip_tests.cpp \
+	cp ${S}/libutil++/tests/file_manip_tests.cpp \
 		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/libutil++/tests
 }
diff --git a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb b/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
index ad48ab3..f4a34b3 100644
--- a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
@@ -10,3 +10,4 @@ SRC_URI[sha256sum] = "847110b4ecdcf8c8353cd38f94c1b704aad4bfcd9453e38b88d112cfb7
 
 S = "${WORKDIR}/oprofile-${PV}"
 
+PR = "r1"
-- 
1.7.9.5


