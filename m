Return-Path: <Zhangle.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A41736D586
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:54:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAICsvnV006918
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 04:54:57 -0800 (PST)
Received: from PEK-DSM-SYRINX.wrs.com (128.224.157.43) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 18 Nov 2013 04:54:56 -0800
From: <zhangle.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Nov 2013 20:54:55 +0800
Message-ID: <1384779295-16702-1-git-send-email-zhangle.yang@windriver.com>
X-Mailer: git-send-email 1.8.2.1
MIME-Version: 1.0
Subject: [PATCH] python: Fix ptest not working problems
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
X-List-Received-Date: Mon, 18 Nov 2013 12:54:56 -0000
Content-Type: text/plain

From: Zhangle Yang <zhangle.yang@windriver.com>

The run-ptest contained in python uses a Makefile. The path of the
Makefile is changed to ${libdir}/python/ptest in do_install_ptest.
However, the directory is wrong when the project is configured with
"--enable-multilib=lib32"

In addition, do_install_ptest is defined before "inherit ptest", so
it is overriden by the one in ptest.bbclass. do_install_ptest is
moved down.

Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 40d20f1..887e02e 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -134,11 +134,6 @@ do_install_append_class-nativesdk () {
 	create_wrapper ${D}${bindir}/python2.7 TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
 }
 
-do_install_ptest() {
-	cp ${B}/Makefile ${D}${PTEST_PATH}
-	sed -i s:LIBDIR:${libdir}:g ${D}${PTEST_PATH}/run-ptest
-}
-
 SSTATE_SCAN_FILES += "Makefile"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
@@ -172,6 +167,14 @@ RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-misc"
 #inherit ptest after "require python-${PYTHON_MAJMIN}-manifest.inc" so PACKAGES doesn't get overwritten
 inherit ptest
 
+# This must come after inherit ptest for the override to take effect
+do_install_ptest() {
+	cp ${B}/Makefile ${D}${PTEST_PATH}
+	sed -e s:LIBDIR/python/ptest:${PTEST_PATH}:g \
+	 -e s:LIBDIR:${libdir}:g \
+	 -i ${D}${PTEST_PATH}/run-ptest
+}
+
 # catch manpage
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
-- 
1.7.9.5


