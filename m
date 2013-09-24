Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 35EB6601D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 08:40:36 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r8O8eWtl002807; 
	Tue, 24 Sep 2013 03:40:36 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 13:42:00 +0500
Message-Id: <1380012120-31571-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd: fix ptest support
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
X-List-Received-Date: Tue, 24 Sep 2013 08:40:37 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Currently do_install_ptest_base is failing because it cannot find
'test' directory in build dir, ${B}. 'test' directory is present in source
dir, ${S}. Same is true for build-aux/test-driver and test/sys.tar.xz.

Also this fixes:
QA Issue: systemd: Files/directories were installed but not shipped
  /usr/lib/udev
  /usr/lib/udev/rules.d

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-core/systemd/systemd_206.bb |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index 8d0a065..02be793 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -117,14 +117,13 @@ do_install() {
 
 do_install_ptest () {
        install -d ${D}${PTEST_PATH}/test
-       install -d ${D}${libdir}/udev/rules.d
-       install ${B}/test/* ${D}${PTEST_PATH}/test
+       install ${S}/test/* ${D}${PTEST_PATH}/test
        install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
        install -d ${D}${PTEST_PATH}/build-aux
        cp -rf ${B}/rules ${D}${PTEST_PATH}/
        cp ${B}/Makefile ${D}${PTEST_PATH}/
-       cp ${B}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
-       tar -C ${D}${PTEST_PATH}/test -xJf ${B}/test/sys.tar.xz
+       cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+       tar -C ${D}${PTEST_PATH}/test -xJf ${S}/test/sys.tar.xz
        sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
 }
 
-- 
1.7.9.5


